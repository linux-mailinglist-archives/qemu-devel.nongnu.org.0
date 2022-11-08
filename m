Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0380362112D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:44:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNsk-0000G2-RG; Tue, 08 Nov 2022 07:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNs3-0007xM-Tn
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrv-0001tA-M0
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8GslLIM4BJMRtRjOc5AxZ4GQ2egucex8xB74Tv8heA=;
 b=JjDp5KUt67C9D23vnNs0hJc4tlSCymVSClfnMvU8UBVr2ein0Kkm03zyvXpSRssAlH3Xur
 jt/yS15F9yvOn8v/Ji+jyFPjANtCbjv7QL0jYpdliMigCOijnr44HwYA1m0BRZDQTPZQAm
 4jbtwyQi5V1zi0bENZyL3OzPKen37r4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-0ZixrecPM7S6b56CMmMMKQ-1; Tue, 08 Nov 2022 07:38:08 -0500
X-MC-Unique: 0ZixrecPM7S6b56CMmMMKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3205185A79C;
 Tue,  8 Nov 2022 12:38:07 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3BF29E70;
 Tue,  8 Nov 2022 12:38:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 11/13] block: Remove ignore_bds_parents parameter from drain
 functions
Date: Tue,  8 Nov 2022 13:37:36 +0100
Message-Id: <20221108123738.530873-12-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ignore_bds_parents is now ignored, so we can just remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h | 10 ++----
 block.c                  |  4 +--
 block/io.c               | 78 +++++++++++++++-------------------------
 3 files changed, 32 insertions(+), 60 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index c35cb1e53f..5b54ed4672 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -305,14 +305,9 @@ void bdrv_parent_drained_end_single(BdrvChild *c);
  *
  * Poll for pending requests in @bs and its parents (except for @ignore_parent).
  *
- * If @ignore_bds_parents is true, parents that are BlockDriverStates must
- * ignore the drain request because they will be drained separately (used for
- * drain_all).
- *
  * This is part of bdrv_drained_begin.
  */
-bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
-                     bool ignore_bds_parents);
+bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent);
 
 /**
  * bdrv_drained_begin:
@@ -330,8 +325,7 @@ void bdrv_drained_begin(BlockDriverState *bs);
  * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
  * running requests to complete.
  */
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents);
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent);
 
 /**
  * bdrv_drained_end:
diff --git a/block.c b/block.c
index 8878586f6e..5f5f79cd16 100644
--- a/block.c
+++ b/block.c
@@ -1218,13 +1218,13 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_do_drained_begin_quiesce(bs, NULL, false);
+    bdrv_do_drained_begin_quiesce(bs, NULL);
 }
 
 static bool bdrv_child_cb_drained_poll(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    return bdrv_drain_poll(bs, NULL, false);
+    return bdrv_drain_poll(bs, NULL);
 }
 
 static void bdrv_child_cb_drained_end(BdrvChild *child)
diff --git a/block/io.c b/block/io.c
index 87c7a92f15..4a83359a8f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -45,13 +45,12 @@ static void bdrv_parent_cb_resize(BlockDriverState *bs);
 static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int64_t offset, int64_t bytes, BdrvRequestFlags flags);
 
-static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore,
-                                      bool ignore_bds_parents)
+static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore)
 {
     BdrvChild *c, *next;
 
     QLIST_FOREACH_SAFE(c, &bs->parents, next_parent, next) {
-        if (c == ignore || (ignore_bds_parents && c->klass->parent_is_bds)) {
+        if (c == ignore) {
             continue;
         }
         bdrv_parent_drained_begin_single(c, false);
@@ -69,13 +68,12 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
     }
 }
 
-static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore,
-                                    bool ignore_bds_parents)
+static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
 {
     BdrvChild *c;
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (c == ignore || (ignore_bds_parents && c->klass->parent_is_bds)) {
+        if (c == ignore) {
             continue;
         }
         bdrv_parent_drained_end_single(c);
@@ -90,14 +88,13 @@ static bool bdrv_parent_drained_poll_single(BdrvChild *c)
     return false;
 }
 
-static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore,
-                                     bool ignore_bds_parents)
+static bool bdrv_parent_drained_poll(BlockDriverState *bs, BdrvChild *ignore)
 {
     BdrvChild *c, *next;
     bool busy = false;
 
     QLIST_FOREACH_SAFE(c, &bs->parents, next_parent, next) {
-        if (c == ignore || (ignore_bds_parents && c->klass->parent_is_bds)) {
+        if (c == ignore) {
             continue;
         }
         busy |= bdrv_parent_drained_poll_single(c);
@@ -238,16 +235,14 @@ typedef struct {
     bool begin;
     bool poll;
     BdrvChild *parent;
-    bool ignore_bds_parents;
 } BdrvCoDrainData;
 
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
-bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
-                     bool ignore_bds_parents)
+bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent)
 {
     IO_OR_GS_CODE();
 
-    if (bdrv_parent_drained_poll(bs, ignore_parent, ignore_bds_parents)) {
+    if (bdrv_parent_drained_poll(bs, ignore_parent)) {
         return true;
     }
 
@@ -258,16 +253,9 @@ bool bdrv_drain_poll(BlockDriverState *bs, BdrvChild *ignore_parent,
     return false;
 }
 
-static bool bdrv_drain_poll_top_level(BlockDriverState *bs,
-                                      BdrvChild *ignore_parent)
-{
-    return bdrv_drain_poll(bs, ignore_parent, false);
-}
-
 static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool ignore_bds_parents, bool poll);
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
-                                bool ignore_bds_parents);
+                                  bool poll);
+static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent);
 
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
@@ -280,11 +268,10 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
         if (data->begin) {
-            bdrv_do_drained_begin(bs, data->parent, data->ignore_bds_parents,
-                                  data->poll);
+            bdrv_do_drained_begin(bs, data->parent, data->poll);
         } else {
             assert(!data->poll);
-            bdrv_do_drained_end(bs, data->parent, data->ignore_bds_parents);
+            bdrv_do_drained_end(bs, data->parent);
         }
         aio_context_release(ctx);
     } else {
@@ -299,7 +286,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
 static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 bool begin,
                                                 BdrvChild *parent,
-                                                bool ignore_bds_parents,
                                                 bool poll)
 {
     BdrvCoDrainData data;
@@ -317,7 +303,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .done = false,
         .begin = begin,
         .parent = parent,
-        .ignore_bds_parents = ignore_bds_parents,
         .poll = poll,
     };
 
@@ -349,17 +334,14 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents)
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
 {
     IO_OR_GS_CODE();
 
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
         aio_disable_external(bdrv_get_aio_context(bs));
-
-        /* TODO Remove ignore_bds_parents, we don't consider it any more */
-        bdrv_parent_drained_begin(bs, parent, false);
+        bdrv_parent_drained_begin(bs, parent);
         if (bs->drv && bs->drv->bdrv_drain_begin) {
             bs->drv->bdrv_drain_begin(bs);
         }
@@ -367,14 +349,14 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool ignore_bds_parents, bool poll)
+                                  bool poll)
 {
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, true, parent, ignore_bds_parents, poll);
+        bdrv_co_yield_to_drain(bs, true, parent, poll);
         return;
     }
 
-    bdrv_do_drained_begin_quiesce(bs, parent, ignore_bds_parents);
+    bdrv_do_drained_begin_quiesce(bs, parent);
 
     /*
      * Wait for drained requests to finish.
@@ -386,28 +368,26 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
      * nodes.
      */
     if (poll) {
-        assert(!ignore_bds_parents);
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, parent));
+        BDRV_POLL_WHILE(bs, bdrv_drain_poll(bs, parent));
     }
 }
 
 void bdrv_drained_begin(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-    bdrv_do_drained_begin(bs, NULL, false, true);
+    bdrv_do_drained_begin(bs, NULL, true);
 }
 
 /**
  * This function does not poll, nor must any of its recursively called
  * functions.
  */
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
-                                bool ignore_bds_parents)
+static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
 {
     int old_quiesce_counter;
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, false, parent, ignore_bds_parents, false);
+        bdrv_co_yield_to_drain(bs, false, parent, false);
         return;
     }
     assert(bs->quiesce_counter > 0);
@@ -418,9 +398,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
         if (bs->drv && bs->drv->bdrv_drain_end) {
             bs->drv->bdrv_drain_end(bs);
         }
-        /* TODO Remove ignore_bds_parents, we don't consider it any more */
-        bdrv_parent_drained_end(bs, parent, false);
-
+        bdrv_parent_drained_end(bs, parent);
         aio_enable_external(bdrv_get_aio_context(bs));
     }
 }
@@ -428,7 +406,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
 void bdrv_drained_end(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, NULL, false);
+    bdrv_do_drained_end(bs, NULL);
 }
 
 void bdrv_drain(BlockDriverState *bs)
@@ -461,7 +439,7 @@ static bool bdrv_drain_all_poll(void)
     while ((bs = bdrv_next_all_states(bs))) {
         AioContext *aio_context = bdrv_get_aio_context(bs);
         aio_context_acquire(aio_context);
-        result |= bdrv_drain_poll(bs, NULL, true);
+        result |= bdrv_drain_poll(bs, NULL);
         aio_context_release(aio_context);
     }
 
@@ -486,7 +464,7 @@ void bdrv_drain_all_begin(void)
     GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, NULL, true, true);
+        bdrv_co_yield_to_drain(NULL, true, NULL, true);
         return;
     }
 
@@ -511,7 +489,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, NULL, true, false);
+        bdrv_do_drained_begin(bs, NULL, false);
         aio_context_release(aio_context);
     }
 
@@ -531,7 +509,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
     g_assert(!bs->refcnt);
 
     while (bs->quiesce_counter) {
-        bdrv_do_drained_end(bs, NULL, true);
+        bdrv_do_drained_end(bs, NULL);
     }
 }
 
@@ -553,7 +531,7 @@ void bdrv_drain_all_end(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_end(bs, NULL, true);
+        bdrv_do_drained_end(bs, NULL);
         aio_context_release(aio_context);
     }
 
-- 
2.38.1


