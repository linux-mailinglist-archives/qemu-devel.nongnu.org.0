Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907643064B6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:06:07 +0100 (CET)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4r4o-0001Tk-Jo
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxE-0003AM-25
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l4qxA-0007aE-Jo
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611777491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoLnlFzN/OloRxaJ3Z+ww7zgTQCDhkwrzQBkEbnc4Qc=;
 b=cbJwgJyqai7XIXtAd+bva/nZ8AAnXmzSiGEe4aIxuytnqfApNYbXPrjeLLu5uzLwTekq4W
 6/vursutxsL8ZEibOnX5cjTZ+k8mQYUovomG/n2oqghmIVy6pRwjvNzaw0KkdkCx1KH/1y
 vtGMKceQpefZojBixvFdsXLHcYPj/bU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-_W-FuMGtO1-3vTL-1efmig-1; Wed, 27 Jan 2021 14:58:09 -0500
X-MC-Unique: _W-FuMGtO1-3vTL-1efmig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D1A41800D42;
 Wed, 27 Jan 2021 19:58:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7068610016FA;
 Wed, 27 Jan 2021 19:58:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 6/8] iotests: add testrunner.py
Date: Wed, 27 Jan 2021 20:57:51 +0100
Message-Id: <20210127195753.59773-7-kwolf@redhat.com>
In-Reply-To: <20210127195753.59773-1-kwolf@redhat.com>
References: <20210127195753.59773-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add TestRunner class, which will run tests in a new python iotests
running framework.

There are some differences with current ./check behavior, most
significant are:
- Consider all tests self-executable, just run them, don't run python
  by hand.
- Elapsed time is cached in json file
- Elapsed time precision increased a bit
- Instead of using "diff -w" which ignores all whitespace differences,
  manually strip whitespace at line end then use python difflib, which
  no longer ignores spacing mid-line

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210125185056.129513-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 367 +++++++++++++++++++++++++++++++
 1 file changed, 367 insertions(+)
 create mode 100644 tests/qemu-iotests/testrunner.py

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
new file mode 100644
index 0000000000..a581be6a29
--- /dev/null
+++ b/tests/qemu-iotests/testrunner.py
@@ -0,0 +1,367 @@
+# Class for actually running tests.
+#
+# Copyright (c) 2020-2021 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+from pathlib import Path
+import datetime
+import time
+import difflib
+import subprocess
+import contextlib
+import json
+import termios
+import sys
+from contextlib import contextmanager
+from typing import List, Optional, Iterator, Any, Sequence, Dict, \
+        ContextManager
+
+from testenv import TestEnv
+
+
+def silent_unlink(path: Path) -> None:
+    try:
+        path.unlink()
+    except OSError:
+        pass
+
+
+def file_diff(file1: str, file2: str) -> List[str]:
+    with open(file1, encoding="utf-8") as f1, \
+         open(file2, encoding="utf-8") as f2:
+        # We want to ignore spaces at line ends. There are a lot of mess about
+        # it in iotests.
+        # TODO: fix all tests to not produce extra spaces, fix all .out files
+        # and use strict diff here!
+        seq1 = [line.rstrip() for line in f1]
+        seq2 = [line.rstrip() for line in f2]
+        res = [line.rstrip()
+               for line in difflib.unified_diff(seq1, seq2, file1, file2)]
+        return res
+
+
+# We want to save current tty settings during test run,
+# since an aborting qemu call may leave things screwed up.
+@contextmanager
+def savetty() -> Iterator[None]:
+    isterm = sys.stdin.isatty()
+    if isterm:
+        fd = sys.stdin.fileno()
+        attr = termios.tcgetattr(fd)
+
+    try:
+        yield
+    finally:
+        if isterm:
+            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
+
+
+class LastElapsedTime(ContextManager['LastElapsedTime']):
+    """ Cache for elapsed time for tests, to show it during new test run
+
+    It is safe to use get() at any time.  To use update(), you must either
+    use it inside with-block or use save() after update().
+    """
+    def __init__(self, cache_file: str, env: TestEnv) -> None:
+        self.env = env
+        self.cache_file = cache_file
+        self.cache: Dict[str, Dict[str, Dict[str, float]]]
+
+        try:
+            with open(cache_file, encoding="utf-8") as f:
+                self.cache = json.load(f)
+        except (OSError, ValueError):
+            self.cache = {}
+
+    def get(self, test: str,
+            default: Optional[float] = None) -> Optional[float]:
+        if test not in self.cache:
+            return default
+
+        if self.env.imgproto not in self.cache[test]:
+            return default
+
+        return self.cache[test][self.env.imgproto].get(self.env.imgfmt,
+                                                       default)
+
+    def update(self, test: str, elapsed: float) -> None:
+        d = self.cache.setdefault(test, {})
+        d.setdefault(self.env.imgproto, {})[self.env.imgfmt] = elapsed
+
+    def save(self) -> None:
+        with open(self.cache_file, 'w', encoding="utf-8") as f:
+            json.dump(self.cache, f)
+
+    def __enter__(self) -> 'LastElapsedTime':
+        return self
+
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
+        self.save()
+
+
+class TestResult:
+    def __init__(self, status: str, description: str = '',
+                 elapsed: Optional[float] = None, diff: Sequence[str] = (),
+                 casenotrun: str = '', interrupted: bool = False) -> None:
+        self.status = status
+        self.description = description
+        self.elapsed = elapsed
+        self.diff = diff
+        self.casenotrun = casenotrun
+        self.interrupted = interrupted
+
+
+class TestRunner(ContextManager['TestRunner']):
+    def __init__(self, env: TestEnv, makecheck: bool = False,
+                 color: str = 'auto') -> None:
+        self.env = env
+        self.test_run_env = self.env.get_env()
+        self.makecheck = makecheck
+        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
+
+        assert color in ('auto', 'on', 'off')
+        self.color = (color == 'on') or (color == 'auto' and
+                                         sys.stdout.isatty())
+
+        self._stack: contextlib.ExitStack
+
+    def __enter__(self) -> 'TestRunner':
+        self._stack = contextlib.ExitStack()
+        self._stack.enter_context(self.env)
+        self._stack.enter_context(self.last_elapsed)
+        self._stack.enter_context(savetty())
+        return self
+
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
+        self._stack.close()
+
+    def test_print_one_line(self, test: str, starttime: str,
+                            endtime: Optional[str] = None, status: str = '...',
+                            lasttime: Optional[float] = None,
+                            thistime: Optional[float] = None,
+                            description: str = '',
+                            test_field_width: Optional[int] = None,
+                            end: str = '\n') -> None:
+        """ Print short test info before/after test run """
+        test = os.path.basename(test)
+
+        if test_field_width is None:
+            test_field_width = 8
+
+        if self.makecheck and status != '...':
+            if status and status != 'pass':
+                status = f' [{status}]'
+            else:
+                status = ''
+
+            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
+            return
+
+        if lasttime:
+            lasttime_s = f' (last: {lasttime:.1f}s)'
+        else:
+            lasttime_s = ''
+        if thistime:
+            thistime_s = f'{thistime:.1f}s'
+        else:
+            thistime_s = '...'
+
+        if endtime:
+            endtime = f'[{endtime}]'
+        else:
+            endtime = ''
+
+        if self.color:
+            if status == 'pass':
+                col = '\033[32m'
+            elif status == 'fail':
+                col = '\033[1m\033[31m'
+            elif status == 'not run':
+                col = '\033[33m'
+            else:
+                col = ''
+
+            col_end = '\033[0m'
+        else:
+            col = ''
+            col_end = ''
+
+        print(f'{test:{test_field_width}} {col}{status:10}{col_end} '
+              f'[{starttime}] {endtime:13}{thistime_s:5} {lasttime_s:14} '
+              f'{description}', end=end)
+
+    def find_reference(self, test: str) -> str:
+        if self.env.cachemode == 'none':
+            ref = f'{test}.out.nocache'
+            if os.path.isfile(ref):
+                return ref
+
+        ref = f'{test}.out.{self.env.imgfmt}'
+        if os.path.isfile(ref):
+            return ref
+
+        ref = f'{test}.{self.env.qemu_default_machine}.out'
+        if os.path.isfile(ref):
+            return ref
+
+        return f'{test}.out'
+
+    def do_run_test(self, test: str) -> TestResult:
+        f_test = Path(test)
+        f_bad = Path(f_test.name + '.out.bad')
+        f_notrun = Path(f_test.name + '.notrun')
+        f_casenotrun = Path(f_test.name + '.casenotrun')
+        f_reference = Path(self.find_reference(test))
+
+        if not f_test.exists():
+            return TestResult(status='fail',
+                              description=f'No such test file: {f_test}')
+
+        if not os.access(str(f_test), os.X_OK):
+            sys.exit(f'Not executable: {f_test}')
+
+        if not f_reference.exists():
+            return TestResult(status='not run',
+                              description='No qualified output '
+                                          f'(expected {f_reference})')
+
+        for p in (f_bad, f_notrun, f_casenotrun):
+            silent_unlink(p)
+
+        args = [str(f_test.resolve())]
+        if self.env.debug:
+            args.append('-d')
+
+        with f_test.open(encoding="utf-8") as f:
+            try:
+                if f.readline() == '#!/usr/bin/env python3':
+                    args.insert(0, self.env.python)
+            except UnicodeDecodeError:  # binary test? for future.
+                pass
+
+        env = os.environ.copy()
+        env.update(self.test_run_env)
+
+        t0 = time.time()
+        with f_bad.open('w', encoding="utf-8") as f:
+            proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                    stdout=f, stderr=subprocess.STDOUT)
+            try:
+                proc.wait()
+            except KeyboardInterrupt:
+                proc.terminate()
+                proc.wait()
+                return TestResult(status='not run',
+                                  description='Interrupted by user',
+                                  interrupted=True)
+            ret = proc.returncode
+
+        elapsed = round(time.time() - t0, 1)
+
+        if ret != 0:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description=f'failed, exit status {ret}',
+                              diff=file_diff(str(f_reference), str(f_bad)))
+
+        if f_notrun.exists():
+            return TestResult(status='not run',
+                              description=f_notrun.read_text().strip())
+
+        casenotrun = ''
+        if f_casenotrun.exists():
+            casenotrun = f_casenotrun.read_text()
+
+        diff = file_diff(str(f_reference), str(f_bad))
+        if diff:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description=f'output mismatch (see {f_bad})',
+                              diff=diff, casenotrun=casenotrun)
+        else:
+            f_bad.unlink()
+            self.last_elapsed.update(test, elapsed)
+            return TestResult(status='pass', elapsed=elapsed,
+                              casenotrun=casenotrun)
+
+    def run_test(self, test: str,
+                 test_field_width: Optional[int] = None) -> TestResult:
+        last_el = self.last_elapsed.get(test)
+        start = datetime.datetime.now().strftime('%H:%M:%S')
+
+        self.test_print_one_line(test=test, starttime=start, lasttime=last_el,
+                                 end='\r', test_field_width=test_field_width)
+
+        res = self.do_run_test(test)
+
+        end = datetime.datetime.now().strftime('%H:%M:%S')
+        self.test_print_one_line(test=test, status=res.status,
+                                 starttime=start, endtime=end,
+                                 lasttime=last_el, thistime=res.elapsed,
+                                 description=res.description,
+                                 test_field_width=test_field_width)
+
+        if res.casenotrun:
+            print(res.casenotrun)
+
+        return res
+
+    def run_tests(self, tests: List[str]) -> None:
+        n_run = 0
+        failed = []
+        notrun = []
+        casenotrun = []
+
+        if not self.makecheck:
+            self.env.print_env()
+            print()
+
+        test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
+
+        for t in tests:
+            name = os.path.basename(t)
+            res = self.run_test(t, test_field_width=test_field_width)
+
+            assert res.status in ('pass', 'fail', 'not run')
+
+            if res.casenotrun:
+                casenotrun.append(t)
+
+            if res.status != 'not run':
+                n_run += 1
+
+            if res.status == 'fail':
+                failed.append(name)
+                if self.makecheck:
+                    self.env.print_env()
+                if res.diff:
+                    print('\n'.join(res.diff))
+            elif res.status == 'not run':
+                notrun.append(name)
+
+            if res.interrupted:
+                break
+
+        if notrun:
+            print('Not run:', ' '.join(notrun))
+
+        if casenotrun:
+            print('Some cases not run in:', ' '.join(casenotrun))
+
+        if failed:
+            print('Failures:', ' '.join(failed))
+            print(f'Failed {len(failed)} of {n_run} iotests')
+        else:
+            print(f'Passed all {n_run} iotests')
-- 
2.29.2


