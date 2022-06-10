Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9588E546FA3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:28:58 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzn7h-0003VU-MJ
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn56-0000hv-2C
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn52-0005UC-8K
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hpl9Hcmja7wCqA/6pHrgfp7z/GTa2UgFHuwdaUlLYz0=;
 b=gVayIGFIN0/aD2Khar2kfcL0WsrM+pQnrK+YsBLCpDVMYoZh03J/ZIlWnLTqahnfFzVa7L
 HqxcxnkrzpMVCDqKcmCrA0UGHuL1XuiE1+5VTYVYzKOzr1bLiAsyU3GDQDfnx+xro8Z2oj
 Y5bWA8O5xhFf5nHOjEL9NZMy5I3X8Sk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-lKHzOdYSPHipkgrRWJBDZA-1; Fri, 10 Jun 2022 18:26:08 -0400
X-MC-Unique: lKHzOdYSPHipkgrRWJBDZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93289811E75;
 Fri, 10 Jun 2022 22:26:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10AAE40D2962;
 Fri, 10 Jun 2022 22:26:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v2 1/7] tests: create optional tests/venv dependency groups
Date: Fri, 10 Jun 2022 18:25:59 -0400
Message-Id: <20220610222605.2259132-2-jsnow@redhat.com>
In-Reply-To: <20220610222605.2259132-1-jsnow@redhat.com>
References: <20220610222605.2259132-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch uses a dummy package and setup.cfg/setup.py files to manage
optional dependency groups for the test venv specification. Now, there's
a core set of dependencies which for now includes just "qemu" (but soon,
qemu.qmp) and a separate, optional 'avocado' group that includes
avocado-framework and pycdlib.

Practical upshot: We install only a minimum of things for the majority
of check-* targets, but allow optional add-ons to be processed when
running avocado tests. This will spare downstreams from having to add
more dependencies than is necessary as a build dependencies when
invoking "make check".

(We also keep both sets of dependencies in one file, which is helpful
for review to ensure that different option groups don't conflict with
one another.)

NOTE: There is a non-fatal caveat introduced by this patch on Ubuntu
20.04 systems; see the subsequent commit "tests: Remove spurious pip
warnings on Ubuntu20.04" for more information.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include | 21 ++++++++++++++-------
 tests/requirements.txt |  6 ------
 tests/setup.cfg        | 20 ++++++++++++++++++++
 tests/setup.py         | 16 ++++++++++++++++
 4 files changed, 50 insertions(+), 13 deletions(-)
 delete mode 100644 tests/requirements.txt
 create mode 100644 tests/setup.cfg
 create mode 100644 tests/setup.py

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3accb83b132..82c697230e0 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -81,13 +81,13 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 # Python venv for running tests
 
-.PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
+.PHONY: check-venv check-venv-avocado check-avocado check-acceptance \
+        check-acceptance-deprecated-warning
 
 # Build up our target list from the filtered list of ninja targets
 TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
-TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python3
 ifndef AVOCADO_TESTS
@@ -108,10 +108,16 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
     $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
     "VENVPIP","$1")
 
-$(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
+# Core dependencies for tests/venv
+$(TESTS_VENV_DIR): $(SRC_PATH)/tests/setup.cfg $(SRC_PATH)/python/setup.cfg
 	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
 	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
-	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
+	$(call quiet-venv-pip,install "$(SRC_PATH)/tests/")
+	$(call quiet-command, touch $@)
+
+# Optional avocado dependencies for tests/venv
+$(TESTS_VENV_DIR)/avocado: $(TESTS_VENV_DIR)
+	$(call quiet-venv-pip,install "$(SRC_PATH)/tests/[avocado]")
 	$(call quiet-command, touch $@)
 
 $(TESTS_RESULTS_DIR):
@@ -119,6 +125,7 @@ $(TESTS_RESULTS_DIR):
             MKDIR, $@)
 
 check-venv: $(TESTS_VENV_DIR)
+check-venv-avocado: $(TESTS_VENV_DIR)/avocado
 
 FEDORA_31_ARCHES_TARGETS=$(patsubst %-softmmu,%, $(filter %-softmmu,$(TARGETS)))
 FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(FEDORA_31_ARCHES_TARGETS))
@@ -126,16 +133,16 @@ FEDORA_31_ARCHES := x86_64 aarch64 ppc64le s390x
 FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
 
 # download one specific Fedora 31 image
-get-vm-image-fedora-31-%: check-venv
+get-vm-image-fedora-31-%: check-venv-avocado
 	$(call quiet-command, \
              $(TESTS_PYTHON) -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
 	"AVOCADO", "Downloading avocado tests VM image for $*")
 
 # download all vm images, according to defined targets
-get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
+get-vm-images: check-venv-avocado $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
-check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+check-avocado: check-venv-avocado $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_PYTHON) -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
diff --git a/tests/requirements.txt b/tests/requirements.txt
deleted file mode 100644
index 0ba561b6bdf..00000000000
--- a/tests/requirements.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-# Add Python module requirements, one per line, to be installed
-# in the tests/venv Python virtual environment. For more info,
-# refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-# Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
-pycdlib==1.11.0
diff --git a/tests/setup.cfg b/tests/setup.cfg
new file mode 100644
index 00000000000..263a5de01af
--- /dev/null
+++ b/tests/setup.cfg
@@ -0,0 +1,20 @@
+# This file represents a "dummy" package that expresses
+# the dependencies necessary to run the various python-based
+# test suites in the qemu.git tree.
+[metadata]
+name = qemu.dummy_tests
+version = 0.0.0
+description = qemu.git testing dummy package
+
+[options]
+packages =
+python_requires = >= 3.6
+install_requires =
+    qemu  # Note: A special setup script will always install 'qemu' from
+          # qemu.git/python. It doesn't have a meaningful/real version.
+
+[options.extras_require]
+# Extra dependencies required by the avocado tests.
+avocado =
+    avocado-framework<89.0,>=88.1
+    pycdlib<2.0,>=1.11.0
diff --git a/tests/setup.py b/tests/setup.py
new file mode 100644
index 00000000000..c99fe5d1725
--- /dev/null
+++ b/tests/setup.py
@@ -0,0 +1,16 @@
+# This setup file is just-enough-config to allow pip to bootstrap a
+# testing environment. It is not meant to be executed directly.
+# See also: setup.cfg
+
+import setuptools
+import pkg_resources
+
+
+def main():
+    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
+    pkg_resources.require('setuptools>=39.2')
+    setuptools.setup()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.34.3


