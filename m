Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896947D56C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:53:57 +0100 (CET)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04sG-000052-Ig
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:53:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qy-0006N9-Kj
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n04qw-0006Ul-Mc
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640191949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8z42Zt+W04uVmpA92VUdOl0PZnsS0Ksw9rf3I63QXs=;
 b=PbJPZ0H68z+Yv1F9nvrmYAT4KaQR/ydCiVWJhz+XMBDE/c1d1u1fenzP2Ye+r5n695Z4bU
 SqS7hq+x4XSPRNgWX1gTkO9A5IeMSGJae1l2jorPeRiQanHusQLXyOvWQLTW1pRiJUprqS
 AwjkmP2f3mgmKJlviCvugz0JhzXsOps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-nmE8it2dM6iTi5sIIECj-Q-1; Wed, 22 Dec 2021 11:52:27 -0500
X-MC-Unique: nmE8it2dM6iTi5sIIECj-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A30CC10B7440;
 Wed, 22 Dec 2021 16:52:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07F827B6C1;
 Wed, 22 Dec 2021 16:52:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/3] iotests: check: multiprocessing support
Date: Wed, 22 Dec 2021 17:52:08 +0100
Message-Id: <20211222165208.693159-4-hreitz@redhat.com>
In-Reply-To: <20211222165208.693159-1-hreitz@redhat.com>
References: <20211222165208.693159-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
For realization - simply utilize multiprocessing.Pool class.

Notes:

1. Of course, tests can't run simultaneously in same TEST_DIR. So,
   use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
   instead of simply TEST_DIR and SOCK_DIR

2. multiprocessing.Pool.starmap function doesn't support passing
   context managers, so we can't simply pass "self". Happily, we need
   self only for read-only access, and it just works if it is defined
   in global space. So, add a temporary link TestRunner.shared_self
   during run_tests().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211203122223.2780098-4-vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/check         |  4 +-
 tests/qemu-iotests/testrunner.py | 69 ++++++++++++++++++++++++++++----
 2 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 43a4b694cc..0c27721a41 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -34,6 +34,8 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='show me, do not run tests')
     p.add_argument('-makecheck', action='store_true',
                    help='pretty print output for make check')
+    p.add_argument('-j', dest='jobs', type=int, default=1,
+                   help='run tests in multiple parallel jobs')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
     p.add_argument('-p', dest='print', action='store_true',
@@ -165,6 +167,6 @@ if __name__ == '__main__':
         with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
-            ok = tr.run_tests(paths)
+            ok = tr.run_tests(paths, args.jobs)
             if not ok:
                 sys.exit(1)
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a9f2feb58c..0feaa396d0 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -26,6 +26,7 @@
 import json
 import termios
 import sys
+from multiprocessing import Pool
 from contextlib import contextmanager
 from typing import List, Optional, Iterator, Any, Sequence, Dict, \
         ContextManager
@@ -126,6 +127,31 @@ def __init__(self, status: str, description: str = '',
 
 
 class TestRunner(ContextManager['TestRunner']):
+    shared_self = None
+
+    @staticmethod
+    def proc_run_test(test: str, test_field_width: int) -> TestResult:
+        # We are in a subprocess, we can't change the runner object!
+        runner = TestRunner.shared_self
+        assert runner is not None
+        return runner.run_test(test, test_field_width, mp=True)
+
+    def run_tests_pool(self, tests: List[str],
+                       test_field_width: int, jobs: int) -> List[TestResult]:
+
+        # passing self directly to Pool.starmap() just doesn't work, because
+        # it's a context manager.
+        assert TestRunner.shared_self is None
+        TestRunner.shared_self = self
+
+        with Pool(jobs) as p:
+            results = p.starmap(self.proc_run_test,
+                                zip(tests, [test_field_width] * len(tests)))
+
+        TestRunner.shared_self = None
+
+        return results
+
     def __init__(self, env: TestEnv, makecheck: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
@@ -219,11 +245,16 @@ def find_reference(self, test: str) -> str:
 
         return f'{test}.out'
 
-    def do_run_test(self, test: str) -> TestResult:
+    def do_run_test(self, test: str, mp: bool) -> TestResult:
         """
         Run one test
 
         :param test: test file path
+        :param mp: if true, we are in a multiprocessing environment, use
+                   personal subdirectories for test run
+
+        Note: this method may be called from subprocess, so it does not
+        change ``self`` object in any way!
         """
 
         f_test = Path(test)
@@ -249,6 +280,12 @@ def do_run_test(self, test: str) -> TestResult:
 
         args = [str(f_test.resolve())]
         env = self.env.prepare_subprocess(args)
+        if mp:
+            # Split test directories, so that tests running in parallel don't
+            # break each other.
+            for d in ['TEST_DIR', 'SOCK_DIR']:
+                env[d] = os.path.join(env[d], f_test.name)
+                Path(env[d]).mkdir(parents=True, exist_ok=True)
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
@@ -291,23 +328,32 @@ def do_run_test(self, test: str) -> TestResult:
                               casenotrun=casenotrun)
 
     def run_test(self, test: str,
-                 test_field_width: Optional[int] = None) -> TestResult:
+                 test_field_width: Optional[int] = None,
+                 mp: bool = False) -> TestResult:
         """
         Run one test and print short status
 
         :param test: test file path
         :param test_field_width: width for first field of status format
+        :param mp: if true, we are in a multiprocessing environment, don't try
+                   to rewrite things in stdout
+
+        Note: this method may be called from subprocess, so it does not
+        change ``self`` object in any way!
         """
 
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
         if not self.makecheck:
-            self.test_print_one_line(test=test, starttime=start,
-                                     lasttime=last_el, end='\r',
+            self.test_print_one_line(test=test,
+                                     status = 'started' if mp else '...',
+                                     starttime=start,
+                                     lasttime=last_el,
+                                     end = '\n' if mp else '\r',
                                      test_field_width=test_field_width)
 
-        res = self.do_run_test(test)
+        res = self.do_run_test(test, mp)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
         self.test_print_one_line(test=test, status=res.status,
@@ -321,7 +367,7 @@ def run_test(self, test: str,
 
         return res
 
-    def run_tests(self, tests: List[str]) -> bool:
+    def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         n_run = 0
         failed = []
         notrun = []
@@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -> bool:
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
 
-        for t in tests:
+        if jobs > 1:
+            results = self.run_tests_pool(tests, test_field_width, jobs)
+
+        for i, t in enumerate(tests):
             name = os.path.basename(t)
-            res = self.run_test(t, test_field_width=test_field_width)
+
+            if jobs > 1:
+                res = results[i]
+            else:
+                res = self.run_test(t, test_field_width)
 
             assert res.status in ('pass', 'fail', 'not run')
 
-- 
2.33.1


