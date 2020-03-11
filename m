Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6881815DB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 11:33:01 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jByfc-0005NP-KF
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 06:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jByd7-0002tg-SB
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 06:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jByd6-0001Wu-Sw
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 06:30:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:33052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jByd3-0001Ra-I9; Wed, 11 Mar 2020 06:30:21 -0400
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jBycy-0005cJ-Kf; Wed, 11 Mar 2020 13:30:16 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 5/9] block/block-copy: factor out
 find_conflicting_inflight_req
Date: Wed, 11 Mar 2020 13:30:00 +0300
Message-Id: <20200311103004.7649-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311103004.7649-1-vsementsov@virtuozzo.com>
References: <20200311103004.7649-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split find_conflicting_inflight_req to be used separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index b075dba206..251d415a2c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -24,23 +24,30 @@
 #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 
+static BlockCopyInFlightReq *find_conflicting_inflight_req(BlockCopyState *s,
+                                                           int64_t start,
+                                                           int64_t end)
+{
+    BlockCopyInFlightReq *req;
+
+    QLIST_FOREACH(req, &s->inflight_reqs, list) {
+        if (end > req->start_byte && start < req->end_byte) {
+            return req;
+        }
+    }
+
+    return NULL;
+}
+
 static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
                                                        int64_t start,
                                                        int64_t end)
 {
     BlockCopyInFlightReq *req;
-    bool waited;
-
-    do {
-        waited = false;
-        QLIST_FOREACH(req, &s->inflight_reqs, list) {
-            if (end > req->start_byte && start < req->end_byte) {
-                qemu_co_queue_wait(&req->wait_queue, NULL);
-                waited = true;
-                break;
-            }
-        }
-    } while (waited);
+
+    while ((req = find_conflicting_inflight_req(s, start, end))) {
+        qemu_co_queue_wait(&req->wait_queue, NULL);
+    }
 }
 
 static void block_copy_inflight_req_begin(BlockCopyState *s,
-- 
2.21.0


