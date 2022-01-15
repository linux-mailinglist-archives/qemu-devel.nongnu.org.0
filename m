Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17448F9A6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 23:24:51 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8rTe-00033N-UQ
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 17:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQz-0000Gx-5p; Sat, 15 Jan 2022 17:22:05 -0500
Received: from [2a00:1450:4864:20::329] (port=36737
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n8rQx-0000f6-7i; Sat, 15 Jan 2022 17:22:04 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so14884844wmk.1; 
 Sat, 15 Jan 2022 14:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xz3nT3jWQgcywI2YlE2go676a3hU6lwY93LUD+M2fZk=;
 b=LBsZcDDZvUCvnKT8ILrGD3UyMQV9yTmc1nVBhp3hoiqIaIzT/DkhmE03MbU6hZ+e/F
 PHOv7OZnbae1/7ocLkqlNZ9T2xRjNixxB46jFkpbL55PExI0+4cxJi/Ky5SVbEfZd17u
 GyImbaLmhEuoyXrmg/EHZSNi2qHMGoxqrE6sJgAgv93LGBhmt1bAF9YNqUt30uhJdL6b
 FGmgaak/ltf8yYQcvXDMWpEdokvRwyPSyK+ODNBqjj0idr2b7RXjbCwGSSamWV4rT2Je
 /cZeoNryrK9ND9Pk+cF8IVj0gt9kKl1Dxzd5yyUZWxyfRPn4xXW1ic2cGCMCWyPH9HUG
 cFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xz3nT3jWQgcywI2YlE2go676a3hU6lwY93LUD+M2fZk=;
 b=IJRTaGZlrrYeqoC+ThdtACYgIbQ5jX/If+b40PIRWKfLOtFTbxIc+DtpVwWBZq0Au0
 ZUweH7nt2p3dN9E3jsTVZhmaMO2uzhpI3/meap3r6lRvIrAjifyZ8cm809EuZL1iyF2M
 fTGwssWxrcOTfYQR7BRtAlQmmploLCzBb3j5sxdAru4A9K7vugORBBRwQPCPk6nm4NlP
 vXShsrihCJYPAUiv4HbDVwTF3b9lDT8YzMoeNvON2zX9dQvYzgvUI1x0/rx4kLRarb2R
 kcP2q9eoeG6vRzD/GsKdFUWB2Z6OW4UrEtDlq9tDhFPRm6452iPAHXQ3fpypKcdVOmud
 zGEQ==
X-Gm-Message-State: AOAM532tWSILBZQqEb/sQWZUJVgvg3Pn6VYRBTQARGzdrjI1SUE1J2VG
 UBBRw1sglLQK0QSQu4FaFqt5UH8VBJE=
X-Google-Smtp-Source: ABdhPJwwit754RI/iFXwVEV1jnUwrHF+yqM9/4aQ5JTceXOcZCCZOVMVrdOo6oaIWYyHl8kQBEHIwQ==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr13263834wrm.600.1642285321556; 
 Sat, 15 Jan 2022 14:22:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s1sm8929616wrv.38.2022.01.15.14.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 14:22:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] build: make check-block a meson test
Date: Sat, 15 Jan 2022 23:21:52 +0100
Message-Id: <20220115222154.341628-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220115222154.341628-1-pbonzini@redhat.com>
References: <20220115222154.341628-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"meson test" can be asked to run tests verbosely; this makes it usable
also for qemu-iotests's own harness, and it lets "make check-block"
reuse mtest2make.py's infrastructure to find and build test dependencies.

Adjust check-block.sh to use the standard exit code that reports a test
as skipped.  Alternatively, in the future we could make it produce TAP
output, which is consistent with all other "make check" tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                    |  6 +++---
 scripts/mtest2make.py          | 10 +++++++++-
 tests/Makefile.include         | 16 +++-------------
 tests/check-block.sh           | 28 +++++++++++++---------------
 tests/meson.build              |  1 +
 tests/qemu-iotests/meson.build | 29 +++++++++++++++++++++++++++++
 6 files changed, 58 insertions(+), 32 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build

diff --git a/meson.build b/meson.build
index c9004bd25e..229061f971 100644
--- a/meson.build
+++ b/meson.build
@@ -3,9 +3,9 @@ project('qemu', ['c'], meson_version: '>=0.58.2',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
-add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
-add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
-add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
+add_test_setup('quick', exclude_suites: ['block', 'slow', 'thorough'], is_default: true)
+add_test_setup('slow', exclude_suites: ['block', 'thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
+add_test_setup('thorough', exclude_suites: ['block'], env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
 
 not_found = dependency('', required: false)
 keyval = import('keyval')
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 4b9c561b30..4d542e8aaa 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -79,7 +79,7 @@ def emit_prolog(suites, prefix):
     print(f'{prefix}-report.junit.xml $(all-{prefix}-xml): {prefix}-report%.junit.xml: run-ninja')
     print(f'\t$(MAKE) {prefix}$* MTESTARGS="$(MTESTARGS) --logbase {prefix}-report$*" && ln -f meson-logs/$@ .')
 
-def emit_suite(name, suite, prefix):
+def emit_suite_deps(name, suite, prefix):
     deps = ' '.join(suite.deps)
     targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
     print()
@@ -87,6 +87,10 @@ def emit_suite(name, suite, prefix):
     print(f'ifneq ($(filter {prefix}-build {targets}, $(MAKECMDGOALS)),)')
     print(f'.{prefix}.build-suites += {name}')
     print(f'endif')
+
+def emit_suite(name, suite, prefix):
+    emit_suite_deps(name, suite, prefix)
+    targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
     print(f'ifneq ($(filter {targets}, $(MAKECMDGOALS)),)')
     print(f'.{prefix}.mtest-suites += ' + ' '.join(suite.names(name)))
     print(f'endif')
@@ -97,6 +101,10 @@ def emit_suite(name, suite, prefix):
 testsuites = defaultdict(Suite)
 for test in introspect['tests']:
     process_tests(test, targets, testsuites)
+# HACK: check-block is a separate target so that it runs with --verbose;
+# only write the dependencies
+emit_suite_deps('block', testsuites['block'], 'check')
+del testsuites['block']
 emit_prolog(testsuites, 'check')
 for name, suite in testsuites.items():
     emit_suite(name, suite, 'check')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 4c564cf789..722ff15145 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -156,19 +156,9 @@ check:
 
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
 check: check-block
-export PYTHON
-
-ifneq ($(filter check check-block check-build, $(MAKECMDGOALS)),)
-ninja-cmd-goals += \
-	qemu-img$(EXESUF) \
-	qemu-io$(EXESUF) \
-	qemu-nbd$(EXESUF) \
-	storage-daemon/qemu-storage-daemon$(EXESUF) \
-	$(filter qemu-system-%, $(ninja-targets))
-endif
-
-check-block: $(SRC_PATH)/tests/check-block.sh run-ninja
-	@$<
+check-block: run-ninja
+	$(if $(MAKE.n),,+)$(MESON) test $(MTESTARGS) $(.mtestargs) --verbose \
+		--logbase iotestslog $(call .speed.$(SPEED), block block-slow block-thorough)
 endif
 
 check-build: run-ninja
diff --git a/tests/check-block.sh b/tests/check-block.sh
index d98d49ad63..9afeea5275 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Honor the SPEED environment variable, just like we do it for the qtests.
+# Honor the SPEED environment variable, just like we do it for "meson test"
 if [ "$SPEED" = "slow" ]; then
     format_list="raw qcow2"
     group=
@@ -16,9 +16,13 @@ if [ "$#" -ne 0 ]; then
     format_list="$@"
 fi
 
+skip() {
+    echo "$*"
+    exit 77
+}
+
 if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
-    echo "GPROF is enabled ==> Not running the qemu-iotests."
-    exit 0
+    skip "GPROF is enabled ==> Not running the qemu-iotests."
 fi
 
 # Disable tests with any sanitizer except for specific ones
@@ -36,36 +40,30 @@ for j in ${ALLOWED_SANITIZE_FLAGS}; do
 done
 if echo ${SANITIZE_FLAGS} | grep -q "\-fsanitize" 2>/dev/null; then
     # Have a sanitize flag that is not allowed, stop
-    echo "Sanitizers are enabled ==> Not running the qemu-iotests."
-    exit 0
+    skip "Sanitizers are enabled ==> Not running the qemu-iotests."
 fi
 
 if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
-    echo "No qemu-system binary available ==> Not running the qemu-iotests."
-    exit 0
+    skip "No qemu-system binary available ==> Not running the qemu-iotests."
 fi
 
 if ! command -v bash >/dev/null 2>&1 ; then
-    echo "bash not available ==> Not running the qemu-iotests."
-    exit 0
+    skip "bash not available ==> Not running the qemu-iotests."
 fi
 
 if LANG=C bash --version | grep -q 'GNU bash, version [123]' ; then
-    echo "bash version too old ==> Not running the qemu-iotests."
-    exit 0
+    skip "bash version too old ==> Not running the qemu-iotests."
 fi
 
 if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
     if ! command -v gsed >/dev/null 2>&1; then
-        echo "GNU sed not available ==> Not running the qemu-iotests."
-        exit 0
+        skip "GNU sed not available ==> Not running the qemu-iotests."
     fi
 else
     # Double-check that we're not using BusyBox' sed which says
     # that "This is not GNU sed version 4.0" ...
     if sed --version | grep -q 'not GNU sed' ; then
-        echo "BusyBox sed not supported ==> Not running the qemu-iotests."
-        exit 0
+        skip "BusyBox sed not supported ==> Not running the qemu-iotests."
     fi
 fi
 
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748a..d5e168d714 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,6 +1,7 @@
 py3 = import('python').find_installation()
 
 subdir('bench')
+subdir('qemu-iotests')
 
 test_qapi_outputs = [
   'qapi-builtin-types.c',
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
new file mode 100644
index 0000000000..94f161d59c
--- /dev/null
+++ b/tests/qemu-iotests/meson.build
@@ -0,0 +1,29 @@
+if have_tools
+  qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
+  qemu_iotests_env = {'PYTHON': python.full_path()}
+  qemu_iotests_formats = {
+    'raw': 'quick',
+    'qcow2': 'slow',
+    'qed': 'thorough',
+    'vmdk': 'thorough',
+    'vpc': 'thorough'
+  }
+
+  foreach k, v : emulators
+    if k.startswith('qemu-system-')
+      qemu_iotests_binaries += v
+    endif
+  endforeach
+  foreach format, speed: qemu_iotests_formats
+    if speed == 'quick'
+      suites = 'block'
+    else
+      suites = ['block-' + speed, speed]
+    endif
+    test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
+         depends: qemu_iotests_binaries, env: qemu_iotests_env,
+         suite: suites,
+         timeout: 0,
+         is_parallel: false)
+  endforeach
+endif
-- 
2.33.1



