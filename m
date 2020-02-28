Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619AD1731AA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 08:20:44 +0100 (CET)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Zwx-0004Vp-Br
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 02:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j7Zvm-0002Zh-Ij
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 02:19:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1j7Zvl-00061H-02
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 02:19:30 -0500
Received: from relay.sw.ru ([185.231.240.75]:51950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1j7Zvk-00060d-OQ; Fri, 28 Feb 2020 02:19:28 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1j7Zve-0002hc-9x; Fri, 28 Feb 2020 10:19:22 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] scripts/simplebench: add simplebench.py
Date: Fri, 28 Feb 2020 10:19:11 +0300
Message-Id: <20200228071914.11746-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200228071914.11746-1-vsementsov@virtuozzo.com>
References: <20200228071914.11746-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, stefanha@gmail.com, mreitz@redhat.com, crosa@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add simple benchmark table creator.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 128 +++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 scripts/simplebench/simplebench.py

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
new file mode 100644
index 0000000000..59e7314ff6
--- /dev/null
+++ b/scripts/simplebench/simplebench.py
@@ -0,0 +1,128 @@
+#!/usr/bin/env python
+#
+# Simple benchmarking framework
+#
+# Copyright (c) 2019 Virtuozzo International GmbH.
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
+
+def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
+    """Benchmark one test-case
+
+    test_func   -- benchmarking function with prototype
+                   test_func(env, case), which takes test_env and test_case
+                   arguments and returns {'seconds': int} (which is benchmark
+                   result) on success and {'error': str} on error. Returned
+                   dict may contain any other additional fields.
+    test_env    -- test environment - opaque first argument for test_func
+    test_case   -- test case - opaque second argument for test_func
+    count       -- how many times to call test_func, to calculate average
+    initial_run -- do initial run of test_func, which don't get into result
+
+    Returns dict with the following fields:
+        'runs':     list of test_func results
+        'average':  average seconds per run (exists only if at least one run
+                    succeeded)
+        'delta':    maximum delta between test_func result and the average
+                    (exists only if at least one run succeeded)
+        'n-failed': number of failed runs (exists only if at least one run
+                    failed)
+    """
+    if initial_run:
+        print('  #initial run:')
+        print('   ', test_func(test_env, test_case))
+
+    runs = []
+    for i in range(count):
+        print('  #run {}'.format(i+1))
+        res = test_func(test_env, test_case)
+        print('   ', res)
+        runs.append(res)
+
+    result = {'runs': runs}
+
+    successed = [r for r in runs if ('seconds' in r)]
+    if successed:
+        avg = sum(r['seconds'] for r in successed) / len(successed)
+        result['average'] = avg
+        result['delta'] = max(abs(r['seconds'] - avg) for r in successed)
+
+    if len(successed) < count:
+        result['n-failed'] = count - len(successed)
+
+    return result
+
+
+def ascii_one(result):
+    """Return ASCII representation of bench_one() returned dict."""
+    if 'average' in result:
+        s = '{:.2f} +- {:.2f}'.format(result['average'], result['delta'])
+        if 'n-failed' in result:
+            s += '\n({} failed)'.format(result['n-failed'])
+        return s
+    else:
+        return 'FAILED'
+
+
+def bench(test_func, test_envs, test_cases, *args, **vargs):
+    """Fill benchmark table
+
+    test_func -- benchmarking function, see bench_one for description
+    test_envs -- list of test environments, see bench_one
+    test_cases -- list of test cases, see bench_one
+    args, vargs -- additional arguments for bench_one
+
+    Returns dict with the following fields:
+        'envs':  test_envs
+        'cases': test_cases
+        'tab':   filled 2D array, where cell [i][j] is bench_one result for
+                 test_cases[i] for test_envs[j] (i.e., rows are test cases and
+                 columns are test environments)
+    """
+    tab = {}
+    results = {
+        'envs': test_envs,
+        'cases': test_cases,
+        'tab': tab
+    }
+    n = 1
+    n_tests = len(test_envs) * len(test_cases)
+    for env in test_envs:
+        for case in test_cases:
+            print('Testing {}/{}: {} :: {}'.format(n, n_tests,
+                                                   env['id'], case['id']))
+            if case['id'] not in tab:
+                tab[case['id']] = {}
+            tab[case['id']][env['id']] = bench_one(test_func, env, case,
+                                                   *args, **vargs)
+            n += 1
+
+    print('Done')
+    return results
+
+
+def ascii(results):
+    """Return ASCII representation of bench() returned dict."""
+    from tabulate import tabulate
+
+    tab = [[""] + [c['id'] for c in results['envs']]]
+    for case in results['cases']:
+        row = [case['id']]
+        for env in results['envs']:
+            row.append(ascii_one(results['tab'][case['id']][env['id']]))
+        tab.append(row)
+
+    return tabulate(tab)
-- 
2.21.0


