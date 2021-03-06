VERSION = 2.5

all:

dist: dist/pdfcrowd-$(VERSION)-php.zip

dist/pdfcrowd-$(VERSION)-php.zip:
	grep "client_version = \"`grep -E "VERSION = [0-9.]+" makefile | sed 's/VERSION = //'`" pdfcrowd.php > /dev/null
	mkdir -p dist
	zip dist/pdfcrowd-$(VERSION)-php.zip pdfcrowd.php

test:
	php test.php $(API_USERNAME) $(API_TOKEN) $(API_HOSTNAME) $(API_HTTP_PORT) $(API_HTTPS_PORT)

.PHONY: clean
clean:
	rm -rf dist/*

