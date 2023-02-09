Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D6690D51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ92h-0004hV-HM; Thu, 09 Feb 2023 10:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ92V-0004dP-4d
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:40:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ92S-0003Rn-Di
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675957243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mj/aI4862bgjVKFo4ketmF2iEvl7cVLVIZBRxicWzYc=;
 b=eEjZxX6GGTfUnuL9lj1ghQlg6EIJW2zOSoEexoUcEbcL/9vHr0tlf1POyNHRV63QlKaEVb
 Wk3BPrnLyX6VCBqr+PbtV1Vf311jqYHNkRXQ/ui46YOV+S8ijGB8J8FIGUCLzBT7JIdsSN
 qTTjiUel8nu/JtmSsSfAWaEhsltSZv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-xn4LIz-WM56IcC3B8XqHYg-1; Thu, 09 Feb 2023 10:40:40 -0500
X-MC-Unique: xn4LIz-WM56IcC3B8XqHYg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0541C1C0879D;
 Thu,  9 Feb 2023 15:40:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 720F9492C3E;
 Thu,  9 Feb 2023 15:40:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 7/7] Python: Drop support for Python 3.6
Date: Thu,  9 Feb 2023 10:40:34 -0500
Message-Id: <20230209154034.983044-8-jsnow@redhat.com>
In-Reply-To: <20230209154034.983044-1-jsnow@redhat.com>
References: <20230209154034.983044-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
own reasons for wanting to drop Python 3.6.

Since it is safe to under our supported platform policy, do so.

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


