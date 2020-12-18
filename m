Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1ED2DE679
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:25:08 +0100 (CET)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHcx-0007k5-4F
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRt-0002fa-UP
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRp-0005Tf-6H
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NCDuLaz3zRp/UWCIa6k+LnZQ5acpxDGb42gPb+819w=;
 b=YDygDm/zKggC7WXJ4hHvU+GTYhNRDc+mkzGnPzzi2H57uWkAZDlVn5WYP5QomJUzJ8yRwl
 Y5adKdba3qnNLH6z4pzJd2eBHAUCQFinPLQbU/COy8MC/PrJicmh+KwEGnSP9nCQsgfFpK
 m6M9JVVRzdXIepTWbF0s2DE6qaxjtHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Hiyy6TZgPH2xAqjxql1XvA-1; Fri, 18 Dec 2020 10:13:34 -0500
X-MC-Unique: Hiyy6TZgPH2xAqjxql1XvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D13EE107ACF5;
 Fri, 18 Dec 2020 15:13:32 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 702606A251;
 Fri, 18 Dec 2020 15:13:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/30] scripts/simplebench: support iops
Date: Fri, 18 Dec 2020 16:12:37 +0100
Message-Id: <20201218151249.715731-19-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Support benchmarks returning not seconds but iops. We'll use it for
further new test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-15-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/simplebench.py | 38 ++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 2445932fc2..2251cd34ea 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -24,9 +24,12 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
 
     test_func   -- benchmarking function with prototype
                    test_func(env, case), which takes test_env and test_case
-                   arguments and returns {'seconds': int} (which is benchmark
-                   result) on success and {'error': str} on error. Returned
-                   dict may contain any other additional fields.
+                   arguments and on success returns dict with 'seconds' or
+                   'iops' (or both) fields, specifying the benchmark result.
+                   If both 'iops' and 'seconds' provided, the 'iops' is
+                   considered the main, and 'seconds' is just an additional
+                   info. On failure test_func should return {'error': str}.
+                   Returned dict may contain any other additional fields.
     test_env    -- test environment - opaque first argument for test_func
     test_case   -- test case - opaque second argument for test_func
     count       -- how many times to call test_func, to calculate average
@@ -34,8 +37,9 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
 
     Returns dict with the following fields:
         'runs':     list of test_func results
-        'average':  average seconds per run (exists only if at least one run
-                    succeeded)
+        'dimension': dimension of results, may be 'seconds' or 'iops'
+        'average':  average value (iops or seconds) per run (exists only if at
+                    least one run succeeded)
         'delta':    maximum delta between test_func result and the average
                     (exists only if at least one run succeeded)
         'n-failed': number of failed runs (exists only if at least one run
@@ -54,11 +58,19 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
 
     result = {'runs': runs}
 
-    succeeded = [r for r in runs if ('seconds' in r)]
+    succeeded = [r for r in runs if ('seconds' in r or 'iops' in r)]
     if succeeded:
-        avg = sum(r['seconds'] for r in succeeded) / len(succeeded)
+        if 'iops' in succeeded[0]:
+            assert all('iops' in r for r in succeeded)
+            dim = 'iops'
+        else:
+            assert all('seconds' in r for r in succeeded)
+            assert all('iops' not in r for r in succeeded)
+            dim = 'seconds'
+        avg = sum(r[dim] for r in succeeded) / len(succeeded)
+        result['dimension'] = dim
         result['average'] = avg
-        result['delta'] = max(abs(r['seconds'] - avg) for r in succeeded)
+        result['delta'] = max(abs(r[dim] - avg) for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
@@ -118,11 +130,17 @@ def ascii(results):
     """Return ASCII representation of bench() returned dict."""
     from tabulate import tabulate
 
+    dim = None
     tab = [[""] + [c['id'] for c in results['envs']]]
     for case in results['cases']:
         row = [case['id']]
         for env in results['envs']:
-            row.append(ascii_one(results['tab'][case['id']][env['id']]))
+            res = results['tab'][case['id']][env['id']]
+            if dim is None:
+                dim = res['dimension']
+            else:
+                assert dim == res['dimension']
+            row.append(ascii_one(res))
         tab.append(row)
 
-    return tabulate(tab)
+    return f'All results are in {dim}\n\n' + tabulate(tab)
-- 
2.29.2


