Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487D50F702
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:08:44 +0200 (CEST)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHBb-000609-9W
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvO-0007PZ-JV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvM-0000h2-Tn
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tR9EQyveeV7BWJ+cvY0bFphwMHnUtQXmhjsqqmIvKo=;
 b=dJ8PE/F5s8ZJoW2d0Oj1oFCzG1R1IUU9zscmOZ6a54OX8XSc9NR7CJ0wL9Qo3PFJ90Yhk/
 IVcx+ug4nH8nkH+pSL+T6/tPveVfnhJu0obXlNyxlhkOVxfJOBbIMY1rEA8zoy2S3/5Qk9
 IV9BRBde8Ir1/+8CYyz7wJK9CqqG8CQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-EkViV2VcN5SDKKPdtDtkIw-1; Tue, 26 Apr 2022 04:51:53 -0400
X-MC-Unique: EkViV2VcN5SDKKPdtDtkIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC61A83395E;
 Tue, 26 Apr 2022 08:51:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED46E40D2969;
 Tue, 26 Apr 2022 08:51:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 5/8] block.c: wrlock in bdrv_replace_child_noperm
Date: Tue, 26 Apr 2022 04:51:11 -0400
Message-Id: <20220426085114.199647-6-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only problem here is ->attach and ->detach callbacks
could call bdrv_{un}apply_subtree_drain(), which itself
will use a rdlock to navigate through all nodes.
To avoid deadlocks, take the lock only outside the drains,
and if we need to both attach and detach, do it in a single
critical section.

Therefore change ->attach and ->detach to return true if they
are modifying the lock, so that we don't take it twice or release
temporarly.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 31 +++++++++++++++++++++++++++----
 block/block-backend.c            |  6 ++++--
 include/block/block_int-common.h |  8 ++++++--
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index b2eb679abb..6cd87e8dd3 100644
--- a/block.c
+++ b/block.c
@@ -1434,21 +1434,26 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
     *child_flags = flags;
 }
 
-static void bdrv_child_cb_attach(BdrvChild *child)
+static bool bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
     assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
 
+    /* Paired with bdrv_graph_wrlock() in bdrv_replace_child_noperm */
+    bdrv_graph_wrunlock();
+
     if (child->role & BDRV_CHILD_COW) {
         bdrv_backing_attach(child);
     }
 
     bdrv_apply_subtree_drain(child, bs);
+
+    return true;
 }
 
-static void bdrv_child_cb_detach(BdrvChild *child)
+static bool bdrv_child_cb_detach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
@@ -1458,8 +1463,13 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
     bdrv_unapply_subtree_drain(child, bs);
 
+    /* Paired with bdrv_graph_wrunlock() in bdrv_replace_child_noperm */
+    bdrv_graph_wrlock();
+
     assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
+
+    return true;
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -2842,6 +2852,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
+    bool locked = false;
 
     assert(!child->frozen);
     assert(old_bs != new_bs);
@@ -2868,8 +2879,12 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
          * are already gone and we only end the drain sections that came from
          * elsewhere. */
         if (child->klass->detach) {
-            child->klass->detach(child);
+            locked = child->klass->detach(child);
+        }
+        if (!locked) {
+            bdrv_graph_wrlock();
         }
+        locked = true;
         assert_bdrv_graph_writable(old_bs);
         QLIST_REMOVE(child, next_parent);
     }
@@ -2880,6 +2895,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     if (new_bs) {
+        if (!locked) {
+            bdrv_graph_wrlock();
+            locked = true;
+        }
         assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
@@ -2896,10 +2915,14 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
          * drain sections coming from @child don't get an extra .drained_begin
          * callback. */
         if (child->klass->attach) {
-            child->klass->attach(child);
+            locked = !(child->klass->attach(child));
         }
     }
 
+    if (locked) {
+        bdrv_graph_wrunlock();
+    }
+
     /*
      * If the old child node was drained but the new one is not, allow
      * requests to come in only after the new node has been attached.
diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..5dbd9fceae 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -282,7 +282,7 @@ static int blk_root_inactivate(BdrvChild *child)
     return 0;
 }
 
-static void blk_root_attach(BdrvChild *child)
+static bool blk_root_attach(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     BlockBackendAioNotifier *notifier;
@@ -295,9 +295,10 @@ static void blk_root_attach(BdrvChild *child)
                 notifier->detach_aio_context,
                 notifier->opaque);
     }
+    return false;
 }
 
-static void blk_root_detach(BdrvChild *child)
+static bool blk_root_detach(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     BlockBackendAioNotifier *notifier;
@@ -310,6 +311,7 @@ static void blk_root_detach(BdrvChild *child)
                 notifier->detach_aio_context,
                 notifier->opaque);
     }
+    return false;
 }
 
 static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 5a04c778e4..dd058c1fd8 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -857,8 +857,12 @@ struct BdrvChildClass {
     void (*activate)(BdrvChild *child, Error **errp);
     int (*inactivate)(BdrvChild *child);
 
-    void (*attach)(BdrvChild *child);
-    void (*detach)(BdrvChild *child);
+    /*
+     * Return true if the graph wrlock is taken/released,
+     * false if the wrlock state is not changed.
+     */
+    bool (*attach)(BdrvChild *child);
+    bool (*detach)(BdrvChild *child);
 
     /*
      * Notifies the parent that the filename of its child has changed (e.g.
-- 
2.31.1


