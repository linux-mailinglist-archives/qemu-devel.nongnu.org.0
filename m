Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE36ED5D6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2P0-0007td-Io; Mon, 24 Apr 2023 16:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oz-0007rx-2n
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ow-00010P-PE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnEfX62FKB2h78OhdKkFkfQWaEpLq7uesHX0XNyBTIQ=;
 b=WGGqjbHsYmtkQRVCmqvBeIRWMep6JUum2Ib1MT0zE7uvFECg1NbfY110mtGpid9jS36Ux2
 8CVZY36V6dqNFA4Gqp6YQxmgebG7Sha3snC4fWVyQbyhcmnNazESlaYMBTzOW2ZEhOwID/
 uVAFZ22UjJDAOHCVtSvMCT47/oP4mcM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-8Ieea1BKNTycXHywsh9DOQ-1; Mon, 24 Apr 2023 16:03:02 -0400
X-MC-Unique: 8Ieea1BKNTycXHywsh9DOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BFE787B2A0;
 Mon, 24 Apr 2023 20:03:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82B0112131E;
 Mon, 24 Apr 2023 20:03:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 16/20] tests: Use configure-provided pyvenv for tests
Date: Mon, 24 Apr 2023 16:02:44 -0400
Message-Id: <20230424200248.1183394-17-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch changes how the avocado tests are provided, ever so
slightly. Instead of creating a new testing venv, use the
configure-provided 'pyvenv' instead, and install optional packages into
that.

Note 1: This doesn't respect the "disable-pypi" setting; the avocado
tests remain an unconditional PyPI hit when you run "make
check-avocado". Future series may endeavor to offer tighter integration,
for now, this is a cheap win that doesn't regress anything.

Note 2: At the time of writing, avocado tests require
avocado-framework<90 whereas the qemu.qmp self-tests rely on
avocado-framework>=90. This collision is avoided for now because the
qemu.git/python/qemu/ code does not need avocado at *runtime*; it does
not install avocado-framework as a necessary dependency and is skipped
in this circumstance.

Nevertheless, we do want to address that discrepancy in the future so
that it will be possible to re-use the same venv for
qemu.git/python/qemu self-tests to introduce them to make check as "make
check-python".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/acpi-bits.rst                           |  6 +++---
 docs/devel/testing.rst                             | 14 +++++++-------
 .gitlab-ci.d/buildtest.yml                         |  6 +++---
 scripts/ci/org.centos/stream/8/x86_64/test-avocado |  4 ++--
 scripts/device-crash-test                          |  2 +-
 tests/Makefile.include                             | 10 +++++-----
 tests/requirements.txt                             |  7 +++++--
 7 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 9eb4b9e666..0c40359109 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -61,19 +61,19 @@ Under ``tests/avocado/`` as the root we have:
    ::
 
      $ make check-venv (needed only the first time to create the venv)
-     $ ./tests/venv/bin/avocado run -t acpi tests/avocado
+     $ ./pyvenv/bin/avocado run -t acpi tests/avocado
 
    The above will run all acpi avocado tests including this one.
    In order to run the individual tests, perform the following:
    ::
 
-     $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
+     $ ./pyvenv/bin/avocado run tests/avocado/acpi-bits.py --tap -
 
    The above will produce output in tap format. You can omit "--tap -" in the
    end and it will produce output like the following:
    ::
 
-      $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
+      $ ./pyvenv/bin/avocado run tests/avocado/acpi-bits.py
       Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
       JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
       JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.58-eab2257/job.log
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4071e72710..50664d9eb9 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -882,9 +882,9 @@ You can run the avocado tests simply by executing:
 
   make check-avocado
 
-This involves the automatic creation of Python virtual environment
-within the build tree (at ``tests/venv``) which will have all the
-right dependencies, and will save tests results also within the
+This involves the automatic installation, from PyPI, of all the
+necessary avocado-framework dependencies into the QEMU venv within the
+build tree (at ``./pyvenv``). Test results are also saved within the
 build tree (at ``tests/results``).
 
 Note: the build environment must be using a Python 3 stack, and have
@@ -941,7 +941,7 @@ may be invoked by running:
 
  .. code::
 
-  tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/avocado/
+  pyvenv/bin/avocado run $OPTION1 $OPTION2 tests/avocado/
 
 Note that if ``make check-avocado`` was not executed before, it is
 possible to create the Python virtual environment with the dependencies
@@ -956,20 +956,20 @@ a test file. To run tests from a single file within the build tree, use:
 
  .. code::
 
-  tests/venv/bin/avocado run tests/avocado/$TESTFILE
+  pyvenv/bin/avocado run tests/avocado/$TESTFILE
 
 To run a single test within a test file, use:
 
  .. code::
 
-  tests/venv/bin/avocado run tests/avocado/$TESTFILE:$TESTCLASS.$TESTNAME
+  pyvenv/bin/avocado run tests/avocado/$TESTFILE:$TESTCLASS.$TESTNAME
 
 Valid test names are visible in the output from any previous execution
 of Avocado or ``make check-avocado``, and can also be queried using:
 
  .. code::
 
-  tests/venv/bin/avocado list tests/avocado
+  pyvenv/bin/avocado list tests/avocado
 
 Manual Installation
 ~~~~~~~~~~~~~~~~~~~
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..53de9f23c4 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -103,7 +103,7 @@ crash-test-debian:
   script:
     - cd build
     - make check-venv
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
+    - pyvenv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
   extends:
@@ -146,8 +146,8 @@ crash-test-fedora:
   script:
     - cd build
     - make check-venv
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
-    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
+    - pyvenv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
+    - pyvenv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
 build-system-centos:
   extends:
diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
index d2c0e5fb4c..7bb5b317b6 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/test-avocado
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -4,7 +4,7 @@
 # KVM and x86_64, or tests that are generic enough to be valid for all
 # targets. Such a test list can be generated with:
 #
-# ./tests/venv/bin/avocado list --filter-by-tags-include-empty \
+# ./pyvenv/bin/avocado list --filter-by-tags-include-empty \
 #   --filter-by-tags-include-empty-key -t accel:kvm,arch:x86_64 \
 #   tests/avocado/
 #
@@ -22,7 +22,7 @@
 #   - tests/avocado/virtio_check_params.py:VirtioMaxSegSettingsCheck.test_machine_types
 #
 make get-vm-images
-./tests/venv/bin/avocado run \
+./pyvenv/bin/avocado run \
     --job-results-dir=tests/results/ \
     tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm \
     tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm \
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 73bcb98693..ef6ac262fa 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -43,7 +43,7 @@ except ModuleNotFoundError as exc:
     print(f"Module '{exc.name}' not found.")
     print("  Try 'make check-venv' from your build directory,")
     print("  and then one way to run this script is like so:")
-    print(f'  > $builddir/tests/venv/bin/python3 "{path}"')
+    print(f'  > $builddir/pyvenv/bin/python3 "{path}"')
     sys.exit(1)
 
 logger = logging.getLogger('device-crash-test')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..3f39c607cc 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -89,7 +89,8 @@ distclean-tcg: $(DISTCLEAN_TCG_TARGET_RULES)
 # Build up our target list from the filtered list of ninja targets
 TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
-TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
+TESTS_VENV_DIR=$(BUILD_DIR)/pyvenv
+TESTS_VENV_TOKEN=$(BUILD_DIR)/pyvenv/tests.group
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python3
@@ -111,8 +112,7 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
     $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
     "VENVPIP","$1")
 
-$(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
-	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
+$(TESTS_VENV_TOKEN): $(TESTS_VENV_REQ)
 	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
 	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
@@ -121,7 +121,7 @@ $(TESTS_RESULTS_DIR):
 	$(call quiet-command, mkdir -p $@, \
             MKDIR, $@)
 
-check-venv: $(TESTS_VENV_DIR)
+check-venv: $(TESTS_VENV_TOKEN)
 
 FEDORA_31_ARCHES_TARGETS=$(patsubst %-softmmu,%, $(filter %-softmmu,$(TARGETS)))
 FEDORA_31_ARCHES_CANDIDATES=$(patsubst ppc64,ppc64le,$(FEDORA_31_ARCHES_TARGETS))
@@ -163,7 +163,7 @@ check:
 check-build: run-ninja
 
 check-clean:
-	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
+	rm -rf $(TESTS_RESULTS_DIR)
 
 clean: check-clean clean-tcg
 distclean: distclean-tcg
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..07e713ef5a 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,6 +1,9 @@
 # Add Python module requirements, one per line, to be installed
-# in the tests/venv Python virtual environment. For more info,
+# in the qemu build_dir/pyvenv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-# Note that qemu.git/python/ is always implicitly installed.
+#
+# Note that qemu.git/python/ is implicitly installed to this venv when
+# 'make check-venv' is run, and will persist until configure is run
+# again.
 avocado-framework==88.1
 pycdlib==1.11.0
-- 
2.39.2


