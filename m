Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7549E148
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:40:01 +0100 (CET)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD38C-0002XI-Cc
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2g0-0006n0-4j
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:54 -0500
Received: from [2a00:1450:4864:20::42f] (port=42571
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fy-00069w-C2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a13so4045425wrh.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47+Hg08W08lvJhFqSm9WCHIri+3t5fJ55l1Mgn9PMQs=;
 b=d6avR+QQUEL8BmySEplw/Gqp5Qa7Iqi8LHcJMO91oEYcFTK6mQiaBGR1q+8No7TZgN
 BEhp75x/zEpMEQe+wc7D2mrJXsPVU7NaZ3r3vCp1Sq7YDxt2W6LlkE/ld2N4ACrJoZoZ
 hmfYeffIrL+j4wWnTD9ETUmlMb7zk0jbm2a1Av7UveitAESjlBHnf2bJgqQhrZeUTqt2
 LQf4/NiT1syC6+MVac07/GmHHXBpFKd+Unmq16qRyRKhNK0+0Rl3sk0+ePjFlAA0BwTP
 nZavDUXp0gy8laG2av2wJmExQR6ZqXvcdQzAfDlnrLMreY6OjdafsZrI3H+Lrjs9sipl
 Ftxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=47+Hg08W08lvJhFqSm9WCHIri+3t5fJ55l1Mgn9PMQs=;
 b=TQVrPEoEVVDplilFiJVOrVYwJ2qmmmXttUR+VIvGerL0LMSyP/C+81+vCsYvTeg7Gv
 huMW5TTfcAsrVZZdR9lhsxpUBbrdGsMMRuXYqPhPqKVHGD7rjHR9gZhoT/FcwkCqjq7A
 /OLsub0e2zr4bU3Ui6wQOLYAmMJX4+EaStQ/0EY80O2inR2nMERuFs71Z986UdGAvouC
 octzUiWVpRCVQO1L9E8W+I84DCHvYsFirHCivXJrpYU1FI48OppFbPycMmWGQEKMbLpS
 ns2H+oePjVuVnv7JGNJ9o5YQbEywpx/yqNDwfOHi3+AkntkzjCVNXbmm9G9HIQNbB0AE
 dGpw==
X-Gm-Message-State: AOAM533QRNTwbEPY4FcU+Fxcq3CbdXU438IoLZhUIrpXgxDEaseZShia
 w2UGHXMzl8Mg3rNy5QHDiJhRKCcpv4c=
X-Google-Smtp-Source: ABdhPJxWsFzC+10tPD6Qp4TtPKh6GOyl5Kj699LzQtwyl1LA2F3U+MAjG4s80Ej+s2iPm3I9SOU5Pg==
X-Received: by 2002:a5d:64c1:: with SMTP id f1mr496990wri.5.1643281848259;
 Thu, 27 Jan 2022 03:10:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] check-block: replace -makecheck with TAP output
Date: Thu, 27 Jan 2022 12:10:35 +0100
Message-Id: <20220127111037.457901-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let "meson test" take care of showing the results of the individual tests,
consistently with other output from "make check V=1".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh             |  6 ++--
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   |  1 +
 tests/qemu-iotests/testenv.py    | 30 +++++++++----------
 tests/qemu-iotests/testrunner.py | 49 +++++++++++++++++---------------
 5 files changed, 48 insertions(+), 44 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 88e02453d2..720a46bc36 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -14,8 +14,8 @@ else
 fi
 
 skip() {
-    echo "$*"
-    exit 77
+    echo "1..0 #SKIP $*"
+    exit 0
 }
 
 if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
@@ -79,7 +79,7 @@ JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -makecheck -$fmt $group || ret=1
+    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 0c27721a41..75de1b4691 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,8 +32,6 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
-    p.add_argument('-makecheck', action='store_true',
-                   help='pretty print output for make check')
     p.add_argument('-j', dest='jobs', type=int, default=1,
                    help='run tests in multiple parallel jobs')
 
@@ -53,6 +51,8 @@ def make_argparser() -> argparse.ArgumentParser:
     p.add_argument('--color', choices=['on', 'off', 'auto'],
                    default='auto', help="use terminal colors. The default "
                    "'auto' value means use colors if terminal stdout detected")
+    p.add_argument('-tap', action='store_true',
+                   help='produce TAP output')
 
     g_env = p.add_argument_group('test environment options')
     mg = g_env.add_mutually_exclusive_group()
@@ -164,7 +164,7 @@ if __name__ == '__main__':
     if args.dry_run:
         print('\n'.join(tests))
     else:
-        with TestRunner(env, makecheck=args.makecheck,
+        with TestRunner(env, tap=args.tap,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
             ok = tr.run_tests(paths, args.jobs)
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 3a9425d15c..5be3c74127 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -22,6 +22,7 @@ if have_tools and targetos != 'windows'
     endif
     test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
          depends: qemu_iotests_binaries, env: qemu_iotests_env,
+         protocol: 'tap',
          suite: suites,
          timeout: 0,
          is_parallel: false)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index c33454fa68..0f32897fe8 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -287,21 +287,21 @@ def __enter__(self) -> 'TestEnv':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self.close()
 
-    def print_env(self) -> None:
+    def print_env(self, prefix: str = '') -> None:
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
index 15788f919e..0eace147b8 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -152,10 +152,10 @@ def run_tests_pool(self, tests: List[str],
 
         return results
 
-    def __init__(self, env: TestEnv, makecheck: bool = False,
+    def __init__(self, env: TestEnv, tap: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
-        self.makecheck = makecheck
+        self.tap = tap
         self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
 
         assert color in ('auto', 'on', 'off')
@@ -185,13 +185,16 @@ def test_print_one_line(self, test: str,
         """ Print short test info before/after test run """
         test = os.path.basename(test)
 
-        if self.makecheck and status != '...':
-            if status and status != 'pass':
-                status = f' [{status}]'
-            else:
-                status = ''
+        if test_field_width is None:
+            test_field_width = 8
 
-            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
+        if self.tap:
+            if status == 'pass':
+                print(f'ok {self.env.imgfmt} {test}')
+            elif status == 'fail':
+                print(f'not ok {self.env.imgfmt} {test}')
+            elif status == 'not run':
+                print(f'ok {self.env.imgfmt} {test} # SKIP')
             return
 
         if lasttime:
@@ -343,7 +346,7 @@ def run_test(self, test: str,
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-        if not self.makecheck:
+        if not self.tap:
             self.test_print_one_line(test=test,
                                      test_field_width=test_field_width,
                                      status = 'started' if mp else '...',
@@ -372,7 +375,9 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         notrun = []
         casenotrun = []
 
-        if not self.makecheck:
+        if self.tap:
+            self.env.print_env('# ')
+        else:
             self.env.print_env()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
@@ -398,8 +403,6 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
 
             if res.status == 'fail':
                 failed.append(name)
-                if self.makecheck:
-                    self.env.print_env()
                 if res.diff:
                     print('\n'.join(res.diff))
             elif res.status == 'not run':
@@ -412,16 +415,16 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
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
2.34.1



