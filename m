Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB214D0117
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:23:57 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREHE-0000RE-7e
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nREEn-0005jI-PY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:21:26 -0500
Received: from [2a00:1450:4864:20::636] (port=34375
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nREEl-0006PW-Dd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:21:25 -0500
Received: by mail-ej1-x636.google.com with SMTP id gb39so32254073ejc.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yAGpygw20/aAo1EWdsOdzVUTn6E9RyZp+l2KDabiXxg=;
 b=KpzLsFDIH41F4cThJWQQ5dVqYyF9vdv38TSy9EBZOS3yQTiz7kJ6Uxo3Re+ntPQ2aM
 R+iylRT0jcYFzCQJjwIHc3TI9xgN2xU9wsm2338ZAyOE7MTHkvY2B+TMnOs0rQr7tz1N
 dhAzqzy3sErWumdkHzLN1p1r8P/1WPFxNCdo40/GhP/dl4gDFlwYHREvhnpQtreku1K+
 SxrIsJR/QZKbe6qxS/iSpGhb2ct5989xnpOgGDnfKav5jwMm2rJNA89s2gn3aMUArJJG
 kocnR7qlfTaWQEWrNReAgCZEYUJ6dwpNTs/9uRls//56lJXDBsLmhxgDlcJkMNDRP9PF
 TaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yAGpygw20/aAo1EWdsOdzVUTn6E9RyZp+l2KDabiXxg=;
 b=zhlqWA3kfB5NK5nBqDtAF2bTMGme35LQMl/UT79lrLI8R21r1JSUS1ZBRVXENryq4V
 ArVgc/xGzstlhNn1GMNqS2E+OaGKoQYziFn2VmmDJ2fGYivAycCXO0FtWGODgyq9AP1/
 hIqm6LLABwOY2BIGzGVpRos/0Q6aowt7npsE9SiszY8hGQNylwaFPvZ2PHEvdmqxrRVf
 wdaYZPjQIHAyTOiJAtBc6Zlu9vXIrXgxZwhCH3/Ifn2pzI5bD5Ve0zNnFR8Uj85yCWNq
 QXAXt0c5LAQHyoNILGpUdW/nB9EiuYtwVcGdBJMwJbk1ZrWWufs3oZT3/FHlzs+Kg2op
 Eb4w==
X-Gm-Message-State: AOAM531F594pzyh6vnIlNusIhVEFn2EWEAaci++LbaCZpCwJRDoqNk3l
 KYYMjcLU3b+NZnT9pzNAuODSfjEqjQc=
X-Google-Smtp-Source: ABdhPJy+Al0cNrv7vjx+87B2lNubctzC2EzEjzTm/CSWoVNQVRjAUHTxKvvfjcmSsfXhyQkfNgWejw==
X-Received: by 2002:a17:907:8693:b0:6d9:67df:b21c with SMTP id
 qa19-20020a170907869300b006d967dfb21cmr9120211ejc.536.1646662881819; 
 Mon, 07 Mar 2022 06:21:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y41-20020a50bb2c000000b0041622779c50sm3468156ede.37.2022.03.07.06.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 06:21:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] check-block: revert TAP output and reintroduce -makecheck
Date: Mon,  7 Mar 2022 15:21:20 +0100
Message-Id: <20220307142120.573220-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commits d316859f4e28c74ab8b618895d2a5e0a865d3cf1
and 308c8475bc9d7e352125dea42950afbaf9daadfe.

The TAP output is inferior in that it does not include the diff for
failed tests; there are also cases (for skipped tests) where
the TAP output is incorrect.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220208124432.84924-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh             |  6 ++--
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   |  1 -
 tests/qemu-iotests/testenv.py    | 30 +++++++++----------
 tests/qemu-iotests/testrunner.py | 49 +++++++++++++++-----------------
 5 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 18f7433901..470c1521c2 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -14,8 +14,8 @@ else
 fi
 
 skip() {
-    echo "1..0 #SKIP $*"
-    exit 0
+    echo "$*"
+    exit 77
 }
 
 # Disable tests with any sanitizer except for specific ones
@@ -75,7 +75,7 @@ JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
+    ${PYTHON} ./check $JOBS -makecheck -$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 75de1b4691..0c27721a41 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,6 +32,8 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
+    p.add_argument('-makecheck', action='store_true',
+                   help='pretty print output for make check')
     p.add_argument('-j', dest='jobs', type=int, default=1,
                    help='run tests in multiple parallel jobs')
 
@@ -51,8 +53,6 @@ def make_argparser() -> argparse.ArgumentParser:
     p.add_argument('--color', choices=['on', 'off', 'auto'],
                    default='auto', help="use terminal colors. The default "
                    "'auto' value means use colors if terminal stdout detected")
-    p.add_argument('-tap', action='store_true',
-                   help='produce TAP output')
 
     g_env = p.add_argument_group('test environment options')
     mg = g_env.add_mutually_exclusive_group()
@@ -164,7 +164,7 @@ if __name__ == '__main__':
     if args.dry_run:
         print('\n'.join(tests))
     else:
-        with TestRunner(env, tap=args.tap,
+        with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
             ok = tr.run_tests(paths, args.jobs)
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 9747bb68a5..d959b26a4a 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -22,7 +22,6 @@ if have_tools and targetos != 'windows' and not get_option('gprof')
     endif
     test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
          depends: qemu_iotests_binaries, env: qemu_iotests_env,
-         protocol: 'tap',
          suite: suites,
          timeout: 0,
          is_parallel: false)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0f32897fe8..c33454fa68 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -287,21 +287,21 @@ def __enter__(self) -> 'TestEnv':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self.close()
 
-    def print_env(self, prefix: str = '') -> None:
+    def print_env(self) -> None:
         template = """\
-{prefix}QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
-{prefix}QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
-{prefix}QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
-{prefix}QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
-{prefix}IMGFMT        -- {IMGFMT}{imgopts}
-{prefix}IMGPROTO      -- {IMGPROTO}
-{prefix}PLATFORM      -- {platform}
-{prefix}TEST_DIR      -- {TEST_DIR}
-{prefix}SOCK_DIR      -- {SOCK_DIR}
-{prefix}GDB_OPTIONS   -- {GDB_OPTIONS}
-{prefix}VALGRIND_QEMU -- {VALGRIND_QEMU}
-{prefix}PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
-{prefix}"""
+QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
+QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
+QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
+QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
+IMGFMT        -- {IMGFMT}{imgopts}
+IMGPROTO      -- {IMGPROTO}
+PLATFORM      -- {platform}
+TEST_DIR      -- {TEST_DIR}
+SOCK_DIR      -- {SOCK_DIR}
+GDB_OPTIONS   -- {GDB_OPTIONS}
+VALGRIND_QEMU -- {VALGRIND_QEMU}
+PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+"""
 
         args = collections.defaultdict(str, self.get_env())
 
@@ -310,5 +310,5 @@ def print_env(self, prefix: str = '') -> None:
 
         u = os.uname()
         args['platform'] = f'{u.sysname}/{u.machine} {u.nodename} {u.release}'
-        args['prefix'] = prefix
+
         print(template.format_map(args))
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 9a94273975..57f126d9a9 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -152,10 +152,10 @@ def run_tests_pool(self, tests: List[str],
 
         return results
 
-    def __init__(self, env: TestEnv, tap: bool = False,
+    def __init__(self, env: TestEnv, makecheck: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
-        self.tap = tap
+        self.makecheck = makecheck
         self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
 
         assert color in ('auto', 'on', 'off')
@@ -185,16 +185,13 @@ def test_print_one_line(self, test: str,
         """ Print short test info before/after test run """
         test = os.path.basename(test)
 
-        if test_field_width is None:
-            test_field_width = 8
+        if self.makecheck and status != '...':
+            if status and status != 'pass':
+                status = f' [{status}]'
+            else:
+                status = ''
 
-        if self.tap:
-            if status == 'pass':
-                print(f'ok {self.env.imgfmt} {test}')
-            elif status == 'fail':
-                print(f'not ok {self.env.imgfmt} {test}')
-            elif status == 'not run':
-                print(f'ok {self.env.imgfmt} {test} # SKIP')
+            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
             return
 
         if lasttime:
@@ -346,7 +343,7 @@ def run_test(self, test: str,
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-        if not self.tap:
+        if not self.makecheck:
             self.test_print_one_line(test=test,
                                      test_field_width=test_field_width,
                                      status = 'started' if mp else '...',
@@ -375,9 +372,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         notrun = []
         casenotrun = []
 
-        if self.tap:
-            self.env.print_env('# ')
-        else:
+        if not self.makecheck:
             self.env.print_env()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
@@ -403,6 +398,8 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
 
             if res.status == 'fail':
                 failed.append(name)
+                if self.makecheck:
+                    self.env.print_env()
                 if res.diff:
                     if self.tap:
                         print('\n'.join(res.diff), file=sys.stderr)
@@ -418,16 +415,16 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
             if res.interrupted:
                 break
 
-        if not self.tap:
-            if notrun:
-                print('Not run:', ' '.join(notrun))
+        if notrun:
+            print('Not run:', ' '.join(notrun))
 
-            if casenotrun:
-                print('Some cases not run in:', ' '.join(casenotrun))
+        if casenotrun:
+            print('Some cases not run in:', ' '.join(casenotrun))
 
-            if failed:
-                print('Failures:', ' '.join(failed))
-                print(f'Failed {len(failed)} of {n_run} iotests')
-            else:
-                print(f'Passed all {n_run} iotests')
-        return not failed
+        if failed:
+            print('Failures:', ' '.join(failed))
+            print(f'Failed {len(failed)} of {n_run} iotests')
+            return False
+        else:
+            print(f'Passed all {n_run} iotests')
+            return True
-- 
2.34.1


