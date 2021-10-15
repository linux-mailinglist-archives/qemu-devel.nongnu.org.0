Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288542EE8C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:13:31 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKDS-0001uX-Dy
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7Z-0001zw-VK; Fri, 15 Oct 2021 06:07:25 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7X-0000dq-Ps; Fri, 15 Oct 2021 06:07:25 -0400
Received: by mail-ed1-x532.google.com with SMTP id z20so36160819edc.13;
 Fri, 15 Oct 2021 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tRwRCQvsaO88Tr5YpEjPrlXhYzv6fTRTt6JnEUgztY=;
 b=i9gNLG+UtRY3CcHVHZK5zn/a/A4nkZn8XAgYy0bhWA+8Nw3lB4Gt+T9FC5k5TO+jlu
 yf+bny6/mmfTQGisnG8edARMausR56NR9ou7io+ffOglGPRg8yhGzeQUGLsRymDHDM63
 dYkwM8ayK7SBB1hhKnIKiERXGso3SBXkK9CVrcpkuc5GD9PkM6QiZ3cNsdwHc4msEnSw
 UJ2IW6GHbX5hwL3yb3KNaDM06H+NqbcXbEceKG/494AZwzjqBK60nxG4IWjZ/2mW1k/A
 YopBzbqRL51tGzfkZqquDVZAXyTrYo4GEX71ywUCgvCsQmaL0AamCyx+up95gkC9Tl+N
 +NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8tRwRCQvsaO88Tr5YpEjPrlXhYzv6fTRTt6JnEUgztY=;
 b=m+Se+j+QbdQbS2xnuz3UprscxFZK+92tIpjE06SWDknNRLBaR2Oh/xBOa+FBkkTu6l
 04t1WZtOi01f4pqi9PnZgymlNbJxNUzm7F/GPL9ftVl9T4EPw4bEjwUexI6+Z2IAJzNs
 KFg2GTY2vEercFdM2UT3uI2sBPifyQbQSs+4JHiApQnNO/Xd8rXZg6buujWMKVXuIKzT
 gIdayuAH6uRh/f5ZcXc3e024ioDEqxX1O69vBh++oR151LrWX6pWMQT0CZ5pF8xihosL
 KgxdF8JLz0UoG7ZlVmYffnj7jqn/iaT+lwT964D7wJ8oSkkxotq4WteIW4xxDrnFaWsa
 LrkQ==
X-Gm-Message-State: AOAM530ZVqFCrInJ8jjxzphkuAeTrfOZk/P3SiUDpp3rpF3QS9pRyZCZ
 P3SnRcgO/W4uZ1IVpOgjg1SiVrWNHM4=
X-Google-Smtp-Source: ABdhPJzbbSLk6ujjy307kSns6a6YF4i4Z2NQ6V1/zPUKFNMLJoxYDuMor83qA9gm4MNTyk35494Qrg==
X-Received: by 2002:a05:6402:35d1:: with SMTP id
 z17mr16868863edc.174.1634292442026; 
 Fri, 15 Oct 2021 03:07:22 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r3sm4090564edo.59.2021.10.15.03.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 03:07:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] check-block: replace -makecheck with TAP output
Date: Fri, 15 Oct 2021 12:07:17 +0200
Message-Id: <20211015100718.17828-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015100718.17828-1-pbonzini@redhat.com>
References: <20211015100718.17828-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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

Let "meson test" take care of showing the results of the individual tests,
consistently with other output from "make check V=1".  Use TAP comments
so that the environment is included in the logs.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh             |  6 ++--
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   |  1 +
 tests/qemu-iotests/testenv.py    | 30 ++++++++++----------
 tests/qemu-iotests/testrunner.py | 48 ++++++++++++++++----------------
 5 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 8895163625..159a040037 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -17,8 +17,8 @@ if [ "$#" -ne 0 ]; then
 fi
 
 skip() {
-    echo "$*"
-    exit 77
+    echo "1..0 #SKIP $*"
+    exit 0
 }
 
 if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
@@ -75,7 +75,7 @@ export PYTHONUTF8=1
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check -tap -$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index da1bfb839e..a8a26fcaaf 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,8 +32,8 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
-    p.add_argument('-makecheck', action='store_true',
-                   help='pretty print output for make check')
+    p.add_argument('-tap', action='store_true',
+                   help='produce TAP output')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
     p.add_argument('-p', dest='print', action='store_true',
@@ -161,7 +161,7 @@ if __name__ == '__main__':
     if args.dry_run:
         print('\n'.join(tests))
     else:
-        with TestRunner(env, makecheck=args.makecheck,
+        with TestRunner(env, tap=args.tap,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
             ok = tr.run_tests(paths)
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index c59c17a9a9..d93d378b11 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -7,6 +7,7 @@ if have_tools
   endforeach
   test('qemu-iotests', sh, args: [files('../check-block.sh')],
        depends: qemu_iotests_binaries,
+       protocol: 'tap',
        suite: 'block',
        timeout: 0,
        is_parallel: false)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index c33454fa68..6f8ae4197d 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -287,21 +287,21 @@ def __enter__(self) -> 'TestEnv':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self.close()
 
-    def print_env(self) -> None:
+    def print_env(self, prefix='') -> None:
         template = """\
-QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
-QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
-QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
-QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
-IMGFMT        -- {IMGFMT}{imgopts}
-IMGPROTO      -- {IMGPROTO}
-PLATFORM      -- {platform}
-TEST_DIR      -- {TEST_DIR}
-SOCK_DIR      -- {SOCK_DIR}
-GDB_OPTIONS   -- {GDB_OPTIONS}
-VALGRIND_QEMU -- {VALGRIND_QEMU}
-PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
-"""
+{prefix}QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
+{prefix}QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
+{prefix}QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
+{prefix}QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
+{prefix}IMGFMT        -- {IMGFMT}{imgopts}
+{prefix}IMGPROTO      -- {IMGPROTO}
+{prefix}PLATFORM      -- {platform}
+{prefix}TEST_DIR      -- {TEST_DIR}
+{prefix}SOCK_DIR      -- {SOCK_DIR}
+{prefix}GDB_OPTIONS   -- {GDB_OPTIONS}
+{prefix}VALGRIND_QEMU -- {VALGRIND_QEMU}
+{prefix}PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+{prefix}"""
 
         args = collections.defaultdict(str, self.get_env())
 
@@ -310,5 +310,5 @@ def print_env(self) -> None:
 
         u = os.uname()
         args['platform'] = f'{u.sysname}/{u.machine} {u.nodename} {u.release}'
-
+        args['prefix'] = prefix
         print(template.format_map(args))
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0e29c2fddd..3ef14af1fa 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -126,10 +126,10 @@ def __init__(self, status: str, description: str = '',
 
 
 class TestRunner(ContextManager['TestRunner']):
-    def __init__(self, env: TestEnv, makecheck: bool = False,
+    def __init__(self, env: TestEnv, tap: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
-        self.makecheck = makecheck
+        self.tap = tap
         self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
 
         assert color in ('auto', 'on', 'off')
@@ -161,13 +161,13 @@ def test_print_one_line(self, test: str, starttime: str,
         if test_field_width is None:
             test_field_width = 8
 
-        if self.makecheck and status != '...':
-            if status and status != 'pass':
-                status = f' [{status}]'
-            else:
-                status = ''
-
-            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
+        if self.tap:
+            if status == 'pass':
+                print(f'ok test {test}')
+            elif status == 'fail':
+                print(f'not ok test {test}')
+            elif status == 'not run':
+                print(f'ok test {test} # SKIP')
             return
 
         if lasttime:
@@ -290,7 +290,7 @@ def run_test(self, test: str,
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-        if not self.makecheck:
+        if not self.tap:
             self.test_print_one_line(test=test, starttime=start,
                                      lasttime=last_el, end='\r',
                                      test_field_width=test_field_width)
@@ -315,7 +315,9 @@ def run_tests(self, tests: List[str]) -> bool:
         notrun = []
         casenotrun = []
 
-        if not self.makecheck:
+        if self.tap:
+            self.env.print_env('# ')
+        else:
             self.env.print_env()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
@@ -334,8 +336,6 @@ def run_tests(self, tests: List[str]) -> bool:
 
             if res.status == 'fail':
                 failed.append(name)
-                if self.makecheck:
-                    self.env.print_env()
                 if res.diff:
                     print('\n'.join(res.diff))
             elif res.status == 'not run':
@@ -345,16 +345,16 @@ def run_tests(self, tests: List[str]) -> bool:
             if res.interrupted:
                 break
 
-        if notrun:
-            print('Not run:', ' '.join(notrun))
+        if not self.tap:
+            if notrun:
+                print('Not run:', ' '.join(notrun))
 
-        if casenotrun:
-            print('Some cases not run in:', ' '.join(casenotrun))
+            if casenotrun:
+                print('Some cases not run in:', ' '.join(casenotrun))
 
-        if failed:
-            print('Failures:', ' '.join(failed))
-            print(f'Failed {len(failed)} of {n_run} iotests')
-            return False
-        else:
-            print(f'Passed all {n_run} iotests')
-            return True
+            if failed:
+                print('Failures:', ' '.join(failed))
+                print(f'Failed {len(failed)} of {n_run} iotests')
+            else:
+                print(f'Passed all {n_run} iotests')
+        return not failed
-- 
2.31.1



