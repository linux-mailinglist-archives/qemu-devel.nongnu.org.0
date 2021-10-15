Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C442EE80
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:11:44 +0200 (CEST)
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKBj-0006Wj-N4
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7Z-0001wX-3e; Fri, 15 Oct 2021 06:07:25 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7W-0000ci-VQ; Fri, 15 Oct 2021 06:07:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so37116578eda.4;
 Fri, 15 Oct 2021 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPYhJgCdM4ye5lm7CeSEI2klZDuraNwDCwHZlQ6PHaM=;
 b=ZJBCCq1SWmoG17MOKrQSAkDxlU4Su2iLdIyhZzA8NozkNuPmJxumRtP5zeSy1JIimw
 2TSkBTmauoi/fgtezbBVJnX+olA0Ma9enOp41cIgdBU2WAbNi9rChifZNeJjXtMy4wiK
 rB075NqIdC+yV6Tk6Js0m2do0WGzZuLtFNlzsjd8NwTDC/bbadkx20X8pTz4603vMPSz
 6IagRhuGjeMS563BL48VVH2bc0i1KdnLaLY40i986HfTl2+NhY7PXaVFhSpPSo5vlDq3
 vHoK0Vz0x6utvb24fnqO4MKjSTaRoh2eBKI+ZgCjBV4wAEd4ps9nqLcv1jPGsIixZlVL
 F0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iPYhJgCdM4ye5lm7CeSEI2klZDuraNwDCwHZlQ6PHaM=;
 b=NJgabBmoeXvIkF7JM50fy2SuOstL72tLNLDP5QbKJUMYSrR2nmfeB4+7wac8LqWN16
 d7wg2ACccvsh0qR+b5LMaN7VD88tEIG7DiMNS3fN0rw+o6qrQYQcxq3ebj14ujqXfEXS
 K781jtEUAOifwHtgB4Jy7gnuLHKkFOlriDY13IdXTGnHesITya2WMMRrJiqEpOw7b1wE
 0ejf+0XVaeGYs52zIuEyfT7E6gylUB1sWSZqUcoSrxRoaQzmVKulhC9fuQbA1EZGuIR2
 f2mZfEWRCji7+bOSOT9St6F50g1MUVWeLLg2TBalWfTOwGLK3i/lZt2ntzC+QYnG+wJv
 DEYg==
X-Gm-Message-State: AOAM533o0l8+UYyeQPOntPiVNsov6jp878YoKMopxe47hiK5eRq5gWdU
 4SZk73EFQxIAyWLS2PgoUxBDK9tbG0M=
X-Google-Smtp-Source: ABdhPJzBxesAgWnfSrkf6dSjlHa/qQHcH+9BlxpFZZp5JBKKE/LS5Aik7ZJijfjAgPw+3c7TVijgsg==
X-Received: by 2002:a05:6402:90c:: with SMTP id
 g12mr16722236edz.198.1634292441223; 
 Fri, 15 Oct 2021 03:07:21 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r3sm4090564edo.59.2021.10.15.03.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 03:07:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] build: make check-block a meson test
Date: Fri, 15 Oct 2021 12:07:16 +0200
Message-Id: <20211015100718.17828-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015100718.17828-1-pbonzini@redhat.com>
References: <20211015100718.17828-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"meson test" supports can be asked to run tests verbosely.  This
makes it usable also for qemu-iotests's own harness.

This lets "make check-block" reuse mtest2make.py's infrastructure to
find and build test dependencies.  In the future, it will also enable
producing TAP output, for consistency with all other "make check"
tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                    |  4 ++--
 scripts/mtest2make.py          |  8 +++++++-
 tests/Makefile.include         | 15 ++-------------
 tests/check-block.sh           | 26 ++++++++++++--------------
 tests/meson.build              |  1 +
 tests/qemu-iotests/meson.build | 13 +++++++++++++
 6 files changed, 37 insertions(+), 30 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build

diff --git a/meson.build b/meson.build
index c7af557afb..540d367cfc 100644
--- a/meson.build
+++ b/meson.build
@@ -3,8 +3,8 @@ project('qemu', ['c'], meson_version: '>=0.58.2',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
-add_test_setup('quick', exclude_suites: 'slow', is_default: true)
-add_test_setup('slow', env: ['G_TEST_SLOW=1'])
+add_test_setup('quick', exclude_suites: ['block', 'slow'], is_default: true)
+add_test_setup('slow', exclude_suites: ['block'], env: ['G_TEST_SLOW=1'])
 
 not_found = dependency('', required: false)
 keyval = import('keyval')
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index b33c1d48df..7e03532bbb 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -64,13 +64,15 @@ def emit_prolog(suites, prefix):
     print(f'{prefix}-report.junit.xml $(all-{prefix}-xml): {prefix}-report%.junit.xml: run-ninja')
     print(f'\t$(MAKE) {prefix}$* MTESTARGS="$(MTESTARGS) --logbase {prefix}-report$*" && ln -f meson-logs/$@ .')
 
-def emit_suite(name, suite, prefix):
+def emit_suite_deps(name, suite, prefix):
     deps = ' '.join(suite.deps)
     print(f'.{prefix}-{name}.deps = {deps}')
     print(f'ifneq ($(filter {prefix}-build, $(MAKECMDGOALS)),)')
     print(f'.{prefix}.build-suites += {name}')
     print(f'endif')
 
+def emit_suite(name, suite, prefix):
+    emit_suite_deps(name, suite, prefix)
     targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
     print(f'ifneq ($(filter {targets}, $(MAKECMDGOALS)),)')
     print(f'.{prefix}.mtest-suites += {name}')
@@ -82,6 +84,10 @@ def emit_suite(name, suite, prefix):
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
index 8434a33fe6..00a1696bde 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -149,19 +149,8 @@ check:
 
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
+	$(MESON) test --no-rebuild --verbose --num-processes 1 --suite block
 endif
 
 check-build: run-ninja
diff --git a/tests/check-block.sh b/tests/check-block.sh
index f86cb863de..8895163625 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
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
index 0000000000..c59c17a9a9
--- /dev/null
+++ b/tests/qemu-iotests/meson.build
@@ -0,0 +1,13 @@
+if have_tools
+  qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
+  foreach k, v : emulators
+    if k.startswith('qemu-system-')
+      qemu_iotests_binaries += v
+    endif
+  endforeach
+  test('qemu-iotests', sh, args: [files('../check-block.sh')],
+       depends: qemu_iotests_binaries,
+       suite: 'block',
+       timeout: 0,
+       is_parallel: false)
+endif
-- 
2.31.1



