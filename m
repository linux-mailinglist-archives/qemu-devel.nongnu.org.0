Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B39691588
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 01:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQHKe-0001U3-Cq; Thu, 09 Feb 2023 19:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQHKb-0001Re-2D
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:32:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQHKX-0001fp-BA
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675989116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XK1bnC4Kp+ovWQFNWXn8myaJysi5dod0YFDwkBFNVU=;
 b=GM2/GLIGNdeX6ejFUdTVn6LqOdAN4GjGMHKFQ3hFve5v2EVCUgKAYQWdHIWZX4BMidKiSa
 MCwFNOnXHUXgwlHIY/RzQUCn1EjvSA1k1VLLW39jkIvmnav9qzm6eh9xi+mwaA09Vt6Cc8
 AlGYA/rqT9jyvvsdjVz2ldg+o9hc7gc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-GHbNPXN-MfCZapr4J8a85A-1; Thu, 09 Feb 2023 19:31:53 -0500
X-MC-Unique: GHbNPXN-MfCZapr4J8a85A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F12B185A7A4;
 Fri, 10 Feb 2023 00:31:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7830218EC5;
 Fri, 10 Feb 2023 00:31:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 7/7] Python: Drop support for Python 3.6
Date: Thu,  9 Feb 2023 19:31:47 -0500
Message-Id: <20230210003147.1309376-8-jsnow@redhat.com>
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Python 3.6 was EOL 2021-12-31. Newer versions of upstream libraries have
begun dropping support for this version and it is becoming more
cumbersome to support. Avocado-framework and qemu.qmp each have their
own reasons for wanting to drop Python 3.6, but won't until QEMU does.

Versions of Python available in our supported build platforms as of today,
with optional versions available in parentheses:

openSUSE Leap 15.4: 3.6.15 (3.9.10, 3.10.2)
CentOS Stream 8:    3.6.8  (3.8.13, 3.9.16)
CentOS Stream 9:    3.9.13
Fedora 36:          3.10
Fedora 37:          3.11
Debian 11:          3.9.2
Alpine 3.14, 3.15:  3.9.16
Alpine 3.16, 3.17:  3.10.10
Ubuntu 20.04 LTS:   3.8.10
Ubuntu 22.04 LTS:   3.10.4
NetBSD 9.3:         3.9.13*
FreeBSD 12.4:       3.9.16
FreeBSD 13.1:       3.9.16
OpenBSD 7.2:        3.9.16

Note: Our VM tests install 3.7 specifically for freebsd and netbsd; the
default for "python" or "python3" in FreeBSD is 3.9.16. NetBSD does not
appear to have a default meta-package, but offers several options, the
lowest of which is 3.7.15. "python39" appears to be a pre-requisite to
one of the other packages we request in tests/vm/netbsd.

Since it is safe to under our supported platform policy, bump our
minimum supported version of Python to 3.7.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py             |  4 ++--
 configure                |  8 ++++----
 python/Makefile          | 10 +++++-----
 python/setup.cfg         |  7 +++----
 python/tests/minreqs.txt |  2 +-
 scripts/qapi/mypy.ini    |  2 +-
 6 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 73a287a4f27..d40448f35d9 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -37,9 +37,9 @@
 # In newer versions of Sphinx this will display nicely; in older versions
 # Sphinx will also produce a Python backtrace but at least the information
 # gets printed...
-if sys.version_info < (3,6):
+if sys.version_info < (3,7):
     raise ConfigError(
-        "QEMU requires a Sphinx that uses Python 3.6 or better\n")
+        "QEMU requires a Sphinx that uses Python 3.7 or better\n")
 
 # The per-manual conf.py will set qemu_docdir for a single-manual build;
 # otherwise set it here if this is an entire-manual-set build.
diff --git a/configure b/configure
index bf512273f44..de27994ddc8 100755
--- a/configure
+++ b/configure
@@ -594,9 +594,9 @@ esac
 
 
 check_py_version() {
-    # We require python >= 3.6.
+    # We require python >= 3.7.
     # NB: a True python conditional creates a non-zero return code (Failure)
-    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
+    "$1" -c 'import sys; sys.exit(sys.version_info < (3,7))'
 }
 
 python=
@@ -604,7 +604,7 @@ first_python=
 explicit_python=no
 # A bare 'python' is traditionally python 2.x, but some distros
 # have it as python 3.x, so check in both places.
-for binary in "${PYTHON-python3}" python python3.{11..6}
+for binary in "${PYTHON-python3}" python python3.{11..7}
 do
     if has "$binary"
     then
@@ -1057,7 +1057,7 @@ then
 fi
 
 if ! check_py_version "$python"; then
-  error_exit "Cannot use '$python', Python >= 3.6 is required." \
+  error_exit "Cannot use '$python', Python >= 3.7 is required." \
              "Use --python=/path/to/python to specify a supported Python." \
              "Maybe try:" \
              "  openSUSE Leap 15.3+: zypper install python39" \
diff --git a/python/Makefile b/python/Makefile
index c5bd6ff83ac..f660d999143 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -9,14 +9,14 @@ help:
 	@echo "make check-minreqs:"
 	@echo "    Run tests in the minreqs virtual environment."
 	@echo "    These tests use the oldest dependencies."
-	@echo "    Requires: Python 3.6"
-	@echo "    Hint (Fedora): 'sudo dnf install python3.6'"
+	@echo "    Requires: Python 3.7"
+	@echo "    Hint (Fedora): 'sudo dnf install python3.7'"
 	@echo ""
 	@echo "make check-tox:"
 	@echo "    Run tests against multiple python versions."
 	@echo "    These tests use the newest dependencies."
-	@echo "    Requires: Python 3.6 - 3.10, and tox."
-	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
+	@echo "    Requires: Python 3.7 - 3.11, and tox."
+	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.11'"
 	@echo "    The variable QEMU_TOX_EXTRA_ARGS can be use to pass extra"
 	@echo "    arguments to tox".
 	@echo ""
@@ -58,7 +58,7 @@ pipenv check-pipenv:
 min-venv: $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate
 $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate: setup.cfg tests/minreqs.txt
 	@echo "VENV $(QEMU_MINVENV_DIR)"
-	@python3.6 -m venv $(QEMU_MINVENV_DIR)
+	@python3.7 -m venv $(QEMU_MINVENV_DIR)
 	@(								\
 		echo "ACTIVATE $(QEMU_MINVENV_DIR)";			\
 		. $(QEMU_MINVENV_DIR)/bin/activate;			\
diff --git a/python/setup.cfg b/python/setup.cfg
index 9e923d97628..1e8392a045c 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -14,7 +14,6 @@ classifiers =
     Natural Language :: English
     Operating System :: OS Independent
     Programming Language :: Python :: 3 :: Only
-    Programming Language :: Python :: 3.6
     Programming Language :: Python :: 3.7
     Programming Language :: Python :: 3.8
     Programming Language :: Python :: 3.9
@@ -23,7 +22,7 @@ classifiers =
     Typing :: Typed
 
 [options]
-python_requires = >= 3.6
+python_requires = >= 3.7
 packages =
     qemu.qmp
     qemu.machine
@@ -76,7 +75,7 @@ exclude = __pycache__,
 
 [mypy]
 strict = True
-python_version = 3.6
+python_version = 3.7
 warn_unused_configs = True
 namespace_packages = True
 warn_unused_ignores = False
@@ -158,7 +157,7 @@ multi_line_output=3
 # of python available on your system to run this test.
 
 [tox:tox]
-envlist = py36, py37, py38, py39, py310, py311
+envlist = py37, py38, py39, py310, py311
 skip_missing_interpreters = true
 
 [testenv]
diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
index dfb8abb155f..55cc6b41d85 100644
--- a/python/tests/minreqs.txt
+++ b/python/tests/minreqs.txt
@@ -1,5 +1,5 @@
 # This file lists the ***oldest possible dependencies*** needed to run
-# "make check" successfully under ***Python 3.6***. It is used primarily
+# "make check" successfully under ***Python 3.7***. It is used primarily
 # by GitLab CI to ensure that our stated minimum versions in setup.cfg
 # are truthful and regularly validated.
 #
diff --git a/scripts/qapi/mypy.ini b/scripts/qapi/mypy.ini
index 66253564297..3463307ddc7 100644
--- a/scripts/qapi/mypy.ini
+++ b/scripts/qapi/mypy.ini
@@ -1,7 +1,7 @@
 [mypy]
 strict = True
 disallow_untyped_calls = False
-python_version = 3.6
+python_version = 3.7
 
 [mypy-qapi.schema]
 disallow_untyped_defs = False
-- 
2.39.0


