Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A32CD0A4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 08:56:27 +0100 (CET)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkjTW-0005dN-Ro
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 02:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPh-0002Hn-VU; Thu, 03 Dec 2020 02:52:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPe-00047a-Mb; Thu, 03 Dec 2020 02:52:29 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cmp2R1JGLzhcLy;
 Thu,  3 Dec 2020 15:51:59 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 15:52:12 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 1/4] block/accounting: Use lock guard macros
Date: Thu, 3 Dec 2020 15:50:52 +0800
Message-ID: <20201203075055.127773-2-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, zhang.zhanghailiang@huawei.com, armbru@redhat.com,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/accounting.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 block/accounting.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 8d41c8a83a..2030851d79 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -199,29 +199,27 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
         return;
     }
 
-    qemu_mutex_lock(&stats->lock);
-
-    if (failed) {
-        stats->failed_ops[cookie->type]++;
-    } else {
-        stats->nr_bytes[cookie->type] += cookie->bytes;
-        stats->nr_ops[cookie->type]++;
-    }
+    WITH_QEMU_LOCK_GUARD(&stats->lock) {
+        if (failed) {
+            stats->failed_ops[cookie->type]++;
+        } else {
+            stats->nr_bytes[cookie->type] += cookie->bytes;
+            stats->nr_ops[cookie->type]++;
+        }
 
-    block_latency_histogram_account(&stats->latency_histogram[cookie->type],
-                                    latency_ns);
+        block_latency_histogram_account(&stats->latency_histogram[cookie->type],
+                                        latency_ns);
 
-    if (!failed || stats->account_failed) {
-        stats->total_time_ns[cookie->type] += latency_ns;
-        stats->last_access_time_ns = time_ns;
+        if (!failed || stats->account_failed) {
+            stats->total_time_ns[cookie->type] += latency_ns;
+            stats->last_access_time_ns = time_ns;
 
-        QSLIST_FOREACH(s, &stats->intervals, entries) {
-            timed_average_account(&s->latency[cookie->type], latency_ns);
+            QSLIST_FOREACH(s, &stats->intervals, entries) {
+                timed_average_account(&s->latency[cookie->type], latency_ns);
+            }
         }
     }
 
-    qemu_mutex_unlock(&stats->lock);
-
     cookie->type = BLOCK_ACCT_NONE;
 }
 
-- 
2.27.0


