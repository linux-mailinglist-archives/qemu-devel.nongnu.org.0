Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1B4C8D9F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:25:43 +0100 (CET)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Re-00052Z-Px
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:25:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NY-0000TM-Kk
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NW-00074t-LG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39iZ/EeaX+T3PXuTf7NyVpcfIMoY2ddSVBBEETIorFo=;
 b=OqEXVBQXRWKBkj58zgIME6fIr140V+jkwiFmutDdOzpUUwFUxxuoD4lro+l/bPJbZYCBNo
 rKTUm9YetPGvBJaslceBREOHY5edFovaRfOXe43OyvWAf9hdQaFz3HHmPhYHODHZfd1L4Y
 QY7n5RV27AvE6LzzHHng6iAeQPTDD4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-cy-Y0ALPNgK9bxtmH7jCng-1; Tue, 01 Mar 2022 09:21:22 -0500
X-MC-Unique: cy-Y0ALPNgK9bxtmH7jCng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 279B7800422;
 Tue,  1 Mar 2022 14:21:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62B108497D;
 Tue,  1 Mar 2022 14:21:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 3/5] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Date: Tue,  1 Mar 2022 09:21:11 -0500
Message-Id: <20220301142113.163174-4-eesposit@redhat.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as the locked version, but use BDRV_POLL_UNLOCKED.
We are going to add drains to all graph modifications, and they are
generally performed without the AioContext lock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c            | 48 ++++++++++++++++++++++++++++++++-----------
 include/block/block.h |  2 ++
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..d474449d2d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -242,6 +242,7 @@ typedef struct {
     bool begin;
     bool recursive;
     bool poll;
+    bool unlocked;
     BdrvChild *parent;
     bool ignore_bds_parents;
     int *drained_end_counter;
@@ -332,7 +333,7 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs, bool recursive,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll);
+                                  bool poll, bool unlocked);
 static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
                                 BdrvChild *parent, bool ignore_bds_parents,
                                 int *drained_end_counter);
@@ -350,7 +351,8 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         if (data->begin) {
             assert(!data->drained_end_counter);
             bdrv_do_drained_begin(bs, data->recursive, data->parent,
-                                  data->ignore_bds_parents, data->poll);
+                                  data->ignore_bds_parents, data->poll,
+                                  data->unlocked);
         } else {
             assert(!data->poll);
             bdrv_do_drained_end(bs, data->recursive, data->parent,
@@ -372,6 +374,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 BdrvChild *parent,
                                                 bool ignore_bds_parents,
                                                 bool poll,
+                                                bool unlocked,
                                                 int *drained_end_counter)
 {
     BdrvCoDrainData data;
@@ -392,6 +395,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .parent = parent,
         .ignore_bds_parents = ignore_bds_parents,
         .poll = poll,
+        .unlocked = unlocked,
         .drained_end_counter = drained_end_counter,
     };
 
@@ -439,13 +443,13 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll)
+                                  bool poll, bool unlocked)
 {
     BdrvChild *child, *next;
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, true, recursive, parent, ignore_bds_parents,
-                               poll, NULL);
+                               poll, unlocked, NULL);
         return;
     }
 
@@ -456,7 +460,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
         bs->recursive_quiesce_counter++;
         QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
             bdrv_do_drained_begin(child->bs, true, child, ignore_bds_parents,
-                                  false);
+                                  false, false);
         }
     }
 
@@ -471,18 +475,30 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
      */
     if (poll) {
         assert(!ignore_bds_parents);
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
+        if (unlocked) {
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
 
 /**
@@ -510,7 +526,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
-                               false, drained_end_counter);
+                               false, false, drained_end_counter);
         return;
     }
     assert(bs->quiesce_counter > 0);
@@ -554,12 +570,19 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
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
 
@@ -642,7 +665,8 @@ void bdrv_drain_all_begin(void)
     BlockDriverState *bs = NULL;
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
+        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, false,
+                               NULL);
         return;
     }
 
@@ -667,7 +691,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, false, NULL, true, false);
+        bdrv_do_drained_begin(bs, false, NULL, true, false, false);
         aio_context_release(aio_context);
     }
 
diff --git a/include/block/block.h b/include/block/block.h
index 5a7a850c16..072bde370f 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -780,6 +780,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
  * exclusive access to all child nodes as well.
  */
 void bdrv_subtree_drained_begin(BlockDriverState *bs);
+void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs);
 
 /**
  * bdrv_drained_end:
@@ -812,6 +813,7 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
  * End a quiescent section started by bdrv_subtree_drained_begin().
  */
 void bdrv_subtree_drained_end(BlockDriverState *bs);
+void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs);
 
 void bdrv_add_child(BlockDriverState *parent, BlockDriverState *child,
                     Error **errp);
-- 
2.31.1


