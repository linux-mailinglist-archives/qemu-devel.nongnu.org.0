Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C5264CC49
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5q-0005wM-Mc; Wed, 14 Dec 2022 08:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4m-0004Ny-1L
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4f-0003Vi-Qf
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xj64T247FY/o3Rsb2pakkfev0/rVou58BAejlkHPH6g=;
 b=eOt7xTLfBPZLveepy2CAdwMOEdbBJRRb7GOF2hVhmIX09PeKNUSNN6LwM3cqLM8aumU+ly
 Zupatubo78XkEl6J6hqDhRjkxjMqT7rTIvzIP8ZreJYZTO22T5ZB37wqqhgNLoe5xt/kk5
 nz9mn4uUJwsZMBBT+SSFc+90wQbfaJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-l2AsljfmPE2J0a2oBQ5LDw-1; Wed, 14 Dec 2022 08:45:25 -0500
X-MC-Unique: l2AsljfmPE2J0a2oBQ5LDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9EF185C06A;
 Wed, 14 Dec 2022 13:45:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9FFA14171C0;
 Wed, 14 Dec 2022 13:45:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 16/51] block: Remove ignore_bds_parents parameter from
 drain_begin/end.
Date: Wed, 14 Dec 2022 14:44:18 +0100
Message-Id: <20221214134453.31665-17-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

ignore_bds_parents is now ignored during drain_begin and drain_end, so
we can just remove it there. It is still a valid optimisation for
drain_all in bdrv_drained_poll(), so leave it around there.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221118174110.55183-13-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h |  3 +--
 block.c                  |  2 +-
 block/io.c               | 58 +++++++++++++++-------------------------
 3 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 9c36a16a1f..8f5e75756a 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -329,8 +329,7 @@ void bdrv_drained_begin(BlockDriverState *bs);
  * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
  * running requests to complete.
  */
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents);
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent);
 
 /**
  * bdrv_drained_end:
diff --git a/block.c b/block.c
index b8bab06e55..1a2a8d9de9 100644
--- a/block.c
+++ b/block.c
@@ -1226,7 +1226,7 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_do_drained_begin_quiesce(bs, NULL, false);
+    bdrv_do_drained_begin_quiesce(bs, NULL);
 }
 
 static bool bdrv_child_cb_drained_poll(BdrvChild *child)
diff --git a/block/io.c b/block/io.c
index 87d6f22ec4..2e9503df6a 100644
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
@@ -70,13 +69,12 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
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
@@ -242,7 +240,6 @@ typedef struct {
     bool begin;
     bool poll;
     BdrvChild *parent;
-    bool ignore_bds_parents;
 } BdrvCoDrainData;
 
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
@@ -269,9 +266,8 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs,
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
-                                  bool ignore_bds_parents, bool poll);
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
-                                bool ignore_bds_parents);
+                                  bool poll);
+static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent);
 
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
@@ -284,11 +280,10 @@ static void bdrv_co_drain_bh_cb(void *opaque)
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
@@ -303,7 +298,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
 static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 bool begin,
                                                 BdrvChild *parent,
-                                                bool ignore_bds_parents,
                                                 bool poll)
 {
     BdrvCoDrainData data;
@@ -321,7 +315,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .done = false,
         .begin = begin,
         .parent = parent,
-        .ignore_bds_parents = ignore_bds_parents,
         .poll = poll,
     };
 
@@ -353,8 +346,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
-                                   BdrvChild *parent, bool ignore_bds_parents)
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs, BdrvChild *parent)
 {
     IO_OR_GS_CODE();
     assert(!qemu_in_coroutine());
@@ -362,9 +354,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
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
@@ -372,14 +362,14 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
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
@@ -391,7 +381,6 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
      * nodes.
      */
     if (poll) {
-        assert(!ignore_bds_parents);
         BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, parent));
     }
 }
@@ -399,20 +388,19 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
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
@@ -423,9 +411,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
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
@@ -433,7 +419,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
 void bdrv_drained_end(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, NULL, false);
+    bdrv_do_drained_end(bs, NULL);
 }
 
 void bdrv_drain(BlockDriverState *bs)
@@ -491,7 +477,7 @@ void bdrv_drain_all_begin(void)
     GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, NULL, true, true);
+        bdrv_co_yield_to_drain(NULL, true, NULL, true);
         return;
     }
 
@@ -516,7 +502,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, NULL, true, false);
+        bdrv_do_drained_begin(bs, NULL, false);
         aio_context_release(aio_context);
     }
 
@@ -536,7 +522,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
     g_assert(!bs->refcnt);
 
     while (bs->quiesce_counter) {
-        bdrv_do_drained_end(bs, NULL, true);
+        bdrv_do_drained_end(bs, NULL);
     }
 }
 
@@ -558,7 +544,7 @@ void bdrv_drain_all_end(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_end(bs, NULL, true);
+        bdrv_do_drained_end(bs, NULL);
         aio_context_release(aio_context);
     }
 
-- 
2.38.1


