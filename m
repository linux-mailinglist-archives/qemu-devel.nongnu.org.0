Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC962DE683
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:27:21 +0100 (CET)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHf6-0001x7-4O
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRu-0002fz-P5
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRq-0005UL-VA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5cZhGfdH0mWZaKM1/ZnrXjXQouCmHUFDVzSpDSzyic=;
 b=LaT2xg3+8L8qLjrHFPHy3dM5TXnABiYoS/KGvY0QhudJmkH6jaV30DJJZ6F7mAXDyyhrUy
 L3krnRwNGBGDcJC+5eFG8rY8Ph+4FM2YB2pzmi2gAS3lXqARSfJ4m/MZONZy7xLtqpLl0z
 Z5joObJ1MihTYHS5SMeVcVyq80/mOtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-o8NidpluNGi9SDoon_WxDQ-1; Fri, 18 Dec 2020 10:13:36 -0500
X-MC-Unique: o8NidpluNGi9SDoon_WxDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B34E190B2A0;
 Fri, 18 Dec 2020 15:13:35 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B9360C43;
 Fri, 18 Dec 2020 15:13:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/30] scripts/simplebench: use standard deviation for +- error
Date: Fri, 18 Dec 2020 16:12:38 +0100
Message-Id: <20201218151249.715731-20-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Standard deviation is more usual to see after +- than current maximum
of deviations.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-16-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/simplebench.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 2251cd34ea..55ec1ad5db 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -18,6 +18,8 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import statistics
+
 
 def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
     """Benchmark one test-case
@@ -40,7 +42,7 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
         'dimension': dimension of results, may be 'seconds' or 'iops'
         'average':  average value (iops or seconds) per run (exists only if at
                     least one run succeeded)
-        'delta':    maximum delta between test_func result and the average
+        'stdev':    standard deviation of results
                     (exists only if at least one run succeeded)
         'n-failed': number of failed runs (exists only if at least one run
                     failed)
@@ -67,10 +69,9 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
             assert all('seconds' in r for r in succeeded)
             assert all('iops' not in r for r in succeeded)
             dim = 'seconds'
-        avg = sum(r[dim] for r in succeeded) / len(succeeded)
         result['dimension'] = dim
-        result['average'] = avg
-        result['delta'] = max(abs(r[dim] - avg) for r in succeeded)
+        result['average'] = statistics.mean(r[dim] for r in succeeded)
+        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
@@ -81,7 +82,7 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True):
 def ascii_one(result):
     """Return ASCII representation of bench_one() returned dict."""
     if 'average' in result:
-        s = '{:.2f} +- {:.2f}'.format(result['average'], result['delta'])
+        s = '{:.2f} +- {:.2f}'.format(result['average'], result['stdev'])
         if 'n-failed' in result:
             s += '\n({} failed)'.format(result['n-failed'])
         return s
-- 
2.29.2


