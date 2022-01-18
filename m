Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77474492C16
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:15:52 +0100 (CET)
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9s5H-0006Rq-4S
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:15:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVQ-0007Fk-Mr
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVO-00066J-Td
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXYNcuDLnPPpWTS1yf2y5Z0dCqv/nWo5hZI1K16GCuo=;
 b=GQyqUW499EoTD8298u0GEKDHOL6+ke0udgx/RXaX4nlEgdb/suG9uMMEY599hQJZeg1/lf
 0O75wp0i38KarEVaaLsXK7h0gtb9AjqMc3hPP4YgZKaoqRtnPyz59Och763HjoRXHa7FM0
 JNG3h++0hBWyjNGwDbIbSIANa1AXBpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-wjIU9_2_N4a-KLgHZlcF4g-1; Tue, 18 Jan 2022 11:38:45 -0500
X-MC-Unique: wjIU9_2_N4a-KLgHZlcF4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92EEA10CDCEF;
 Tue, 18 Jan 2022 16:28:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8F4C34D38;
 Tue, 18 Jan 2022 16:28:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 07/12] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Date: Tue, 18 Jan 2022 11:27:33 -0500
Message-Id: <20220118162738.1366281-8-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as the locked version, but use BDRV_POLL_UNLOCKED

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c               | 50 +++++++++++++++++++++++++++++-----------
 include/block/block-io.h |  2 ++
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/block/io.c b/block/io.c
index 5123b7b713..9d5167f64a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -244,6 +244,7 @@ typedef struct {
     bool begin;
     bool recursive;
     bool poll;
+    bool unlock;
     BdrvChild *parent;
     bool ignore_bds_parents;
     int *drained_end_counter;
@@ -334,7 +335,7 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs, bool recursive,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll);
+                                  bool poll, bool unlock);
 static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
                                 BdrvChild *parent, bool ignore_bds_parents,
                                 int *drained_end_counter);
@@ -352,7 +353,8 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         if (data->begin) {
             assert(!data->drained_end_counter);
             bdrv_do_drained_begin(bs, data->recursive, data->parent,
-                                  data->ignore_bds_parents, data->poll);
+                                  data->ignore_bds_parents, data->poll,
+                                  data->unlock);
         } else {
             assert(!data->poll);
             bdrv_do_drained_end(bs, data->recursive, data->parent,
@@ -374,6 +376,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 BdrvChild *parent,
                                                 bool ignore_bds_parents,
                                                 bool poll,
+                                                bool unlock,
                                                 int *drained_end_counter)
 {
     BdrvCoDrainData data;
@@ -394,6 +397,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .parent = parent,
         .ignore_bds_parents = ignore_bds_parents,
         .poll = poll,
+        .unlock = unlock,
         .drained_end_counter = drained_end_counter,
     };
 
@@ -441,13 +445,13 @@ static void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll)
+                                  bool poll, bool unlock)
 {
     BdrvChild *child, *next;
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, true, recursive, parent, ignore_bds_parents,
-                               poll, NULL);
+                               poll, unlock, NULL);
         return;
     }
 
@@ -458,7 +462,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
         bs->recursive_quiesce_counter++;
         QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
             bdrv_do_drained_begin(child->bs, true, child, ignore_bds_parents,
-                                  false);
+                                  false, false);
         }
     }
 
@@ -473,23 +477,35 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
      */
     if (poll) {
         assert(!ignore_bds_parents);
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
+        if (unlock) {
+            BDRV_POLL_WHILE_UNLOCKED(bs,
+                                     bdrv_drain_poll_top_level(bs, recursive,
+                                                               parent));
+        } else {
+            BDRV_POLL_WHILE(bs,
+                            bdrv_drain_poll_top_level(bs, recursive, parent));
+        }
     }
 }
 
 void bdrv_drained_begin(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, false, NULL, false, true);
+    bdrv_do_drained_begin(bs, false, NULL, false, true, false);
 }
 
 void bdrv_subtree_drained_begin(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, true, NULL, false, true);
+    bdrv_do_drained_begin(bs, true, NULL, false, true, false);
+}
+
+void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs)
+{
+    bdrv_do_drained_begin(bs, true, NULL, false, true, true);
 }
 
 void bdrv_drained_begin_no_poll(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, false, NULL, false, false);
+    bdrv_do_drained_begin(bs, false, NULL, false, false, false);
 }
 
 /**
@@ -517,7 +533,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
-                               false, drained_end_counter);
+                               false, false, drained_end_counter);
         return;
     }
     assert(bs->quiesce_counter > 0);
@@ -561,12 +577,19 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
+void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs)
+{
+    int drained_end_counter = 0;
+    bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
+    BDRV_POLL_WHILE_UNLOCKED(bs, qatomic_read(&drained_end_counter) > 0);
+}
+
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 {
     int i;
 
     for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
-        bdrv_do_drained_begin(child->bs, true, child, false, true);
+        bdrv_do_drained_begin(child->bs, true, child, false, true, false);
     }
 }
 
@@ -651,7 +674,8 @@ void bdrv_drain_all_begin(void)
     assert(qemu_in_main_thread());
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
+        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, false,
+                               NULL);
         return;
     }
 
@@ -676,7 +700,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, false, NULL, true, false);
+        bdrv_do_drained_begin(bs, false, NULL, true, false, false);
         aio_context_release(aio_context);
     }
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 34a991649c..a329ae24c1 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -253,6 +253,7 @@ void bdrv_drained_begin_no_poll(BlockDriverState *bs);
  * exclusive access to all child nodes as well.
  */
 void bdrv_subtree_drained_begin(BlockDriverState *bs);
+void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs);
 
 /**
  * bdrv_drained_end:
@@ -285,6 +286,7 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
  * End a quiescent section started by bdrv_subtree_drained_begin().
  */
 void bdrv_subtree_drained_end(BlockDriverState *bs);
+void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs);
 
 bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                      uint32_t granularity, Error **errp);
-- 
2.31.1


