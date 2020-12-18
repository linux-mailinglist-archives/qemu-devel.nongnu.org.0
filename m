Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FE2DE6A8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:33:51 +0100 (CET)
Received: from localhost ([::1]:39266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHlO-0000wT-Li
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS1-0002ky-WF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRx-0005Wa-Q9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3lKdk1VphxgXZtQrQQx5saPGM0quIsvXrGGU8V7EYc=;
 b=dgE0TaSFUdvjJ8JpaWjzX4rrXkAsuJiLMvwseSFjxvzN4X0Xhax+xeGyoVJwctB8jI15aF
 cYQGCYDkPkt3oc/8z6A6UawXkGVTG4wwLeRmqxbNdIj07FyFCIxgipQHMbBih4PUw5eqKM
 n1WEfscK50ZtE9ZpdjwNjkKKB17acs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-kn1f6d4mORuRwu7-dVPFgA-1; Fri, 18 Dec 2020 10:13:41 -0500
X-MC-Unique: kn1f6d4mORuRwu7-dVPFgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B81801817;
 Fri, 18 Dec 2020 15:13:39 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1DAF5D769;
 Fri, 18 Dec 2020 15:13:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/30] simplebench: move results_to_text() into separate file
Date: Fri, 18 Dec 2020 16:12:40 +0100
Message-Id: <20201218151249.715731-22-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Let's keep view part in separate: this way it's better to improve it in
the following commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-18-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/bench-example.py   |  3 +-
 scripts/simplebench/bench_write_req.py |  3 +-
 scripts/simplebench/results_to_text.py | 48 ++++++++++++++++++++++++++
 scripts/simplebench/simplebench.py     | 31 -----------------
 4 files changed, 52 insertions(+), 33 deletions(-)
 create mode 100644 scripts/simplebench/results_to_text.py

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
index f24cf22fe9..d9c7f7bc17 100644
--- a/scripts/simplebench/bench-example.py
+++ b/scripts/simplebench/bench-example.py
@@ -19,6 +19,7 @@
 #
 
 import simplebench
+from results_to_text import results_to_text
 from bench_block_job import bench_block_copy, drv_file, drv_nbd
 
 
@@ -77,4 +78,4 @@ test_envs = [
 ]
 
 result = simplebench.bench(bench_func, test_envs, test_cases, count=3)
-print(simplebench.results_to_text(result))
+print(results_to_text(result))
diff --git a/scripts/simplebench/bench_write_req.py b/scripts/simplebench/bench_write_req.py
index e175bcd7a4..da601ea2fe 100755
--- a/scripts/simplebench/bench_write_req.py
+++ b/scripts/simplebench/bench_write_req.py
@@ -26,6 +26,7 @@ import sys
 import os
 import subprocess
 import simplebench
+from results_to_text import results_to_text
 
 
 def bench_func(env, case):
@@ -167,4 +168,4 @@ if __name__ == '__main__':
 
     result = simplebench.bench(bench_func, test_envs, test_cases, count=3,
                                initial_run=False)
-    print(simplebench.results_to_text(result))
+    print(results_to_text(result))
diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
new file mode 100644
index 0000000000..58d909ffd9
--- /dev/null
+++ b/scripts/simplebench/results_to_text.py
@@ -0,0 +1,48 @@
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
+def result_to_text(result):
+    """Return text representation of bench_one() returned dict."""
+    if 'average' in result:
+        s = '{:.2f} +- {:.2f}'.format(result['average'], result['stdev'])
+        if 'n-failed' in result:
+            s += '\n({} failed)'.format(result['n-failed'])
+        return s
+    else:
+        return 'FAILED'
+
+
+def results_to_text(results):
+    """Return text representation of bench() returned dict."""
+    from tabulate import tabulate
+
+    dim = None
+    tab = [[""] + [c['id'] for c in results['envs']]]
+    for case in results['cases']:
+        row = [case['id']]
+        for env in results['envs']:
+            res = results['tab'][case['id']][env['id']]
+            if dim is None:
+                dim = res['dimension']
+            else:
+                assert dim == res['dimension']
+            row.append(result_to_text(res))
+        tab.append(row)
+
+    return f'All results are in {dim}\n\n' + tabulate(tab)
diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index aa74b78a04..f61513af90 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -79,17 +79,6 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
     return result
 
 
-def result_to_text(result):
-    """Return text representation of bench_one() returned dict."""
-    if 'average' in result:
-        s = '{:.2f} +- {:.2f}'.format(result['average'], result['stdev'])
-        if 'n-failed' in result:
-            s += '\n({} failed)'.format(result['n-failed'])
-        return s
-    else:
-        return 'FAILED'
-
-
 def bench(test_func, test_envs, test_cases, *args, **vargs):
     """Fill benchmark table
 
@@ -125,23 +114,3 @@ def bench(test_func, test_envs, test_cases, *args, **vargs):
 
     print('Done')
     return results
-
-
-def results_to_text(results):
-    """Return text representation of bench() returned dict."""
-    from tabulate import tabulate
-
-    dim = None
-    tab = [[""] + [c['id'] for c in results['envs']]]
-    for case in results['cases']:
-        row = [case['id']]
-        for env in results['envs']:
-            res = results['tab'][case['id']][env['id']]
-            if dim is None:
-                dim = res['dimension']
-            else:
-                assert dim == res['dimension']
-            row.append(result_to_text(res))
-        tab.append(row)
-
-    return f'All results are in {dim}\n\n' + tabulate(tab)
-- 
2.29.2


