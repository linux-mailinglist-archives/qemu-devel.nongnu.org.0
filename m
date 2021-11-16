Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF024532CC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:22:59 +0100 (CET)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyQM-0004GH-Gd
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyB2-0004Y2-E0
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAy-0007AJ-Vz
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XJltCQXn68mm/m7xUFiuR8GkwDZ78HtUFCJkwPo+Do=;
 b=FOcULC8QX3ivUF8H76JetQp1gBO/Cy0oSwSgO2mJoC8EG4uv9dBK7xUqNb4GbY8hQN0lVG
 04oakZPHMGgpDceCi7oCagatW1FItLNq0OScTA6ksy39OCrNIU/BRGCvpOQv3XaMm807Rf
 Qd2b3tuOXw7RxrM0uqNS2/DPFyJwX3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-QW0NQTIoMHKKGpjMxj9reQ-1; Tue, 16 Nov 2021 08:06:47 -0500
X-MC-Unique: QW0NQTIoMHKKGpjMxj9reQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D1B1023F4F;
 Tue, 16 Nov 2021 13:06:45 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6A85C232;
 Tue, 16 Nov 2021 13:06:45 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 09/13] block: Let replace_child_noperm free children
Date: Tue, 16 Nov 2021 14:06:14 +0100
Message-Id: <20211116130618.700441-10-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In most of the block layer, especially when traversing down from other
BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
it becomes NULL, it is expected that the corresponding BdrvChild pointer
also becomes NULL and the BdrvChild object is freed.

Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
pointer to NULL, it should also immediately set the corresponding
BdrvChild pointer (like bs->file or bs->backing) to NULL.

In that context, it also makes sense for this function to free the
child.  Sometimes we cannot do so, though, because it is called in a
transactional context where the caller might still want to reinstate the
child in the abort branch (and free it only on commit), so this behavior
has to remain optional.

In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
that the BdrvChild passed to bdrv_replace_child_tran() must have had a
non-NULL .bs pointer initially.  Make a note of that and assert it.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211111120829.81329-10-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-10-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 102 +++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 79 insertions(+), 23 deletions(-)

diff --git a/block.c b/block.c
index a40027161c..0ac5b163d2 100644
--- a/block.c
+++ b/block.c
@@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
+static void bdrv_child_free(BdrvChild *child);
 static void bdrv_replace_child_noperm(BdrvChild **child,
-                                      BlockDriverState *new_bs);
+                                      BlockDriverState *new_bs,
+                                      bool free_empty_child);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran);
@@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
+    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
 
+    if (s->free_empty_child && !s->child->bs) {
+        bdrv_child_free(s->child);
+    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2278,22 +2284,26 @@ static void bdrv_replace_child_abort(void *opaque)
      *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
      *     will not modify s->child.  From that perspective, it does not matter
      *     whether we pass s->childp or &s->child.
-     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
-     *     pointer anyway (though it will in the future), so at this point it
-     *     absolutely does not matter whether we pass s->childp or &s->child.)
      * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
      *     it here.
      * (3) If new_bs is NULL, *s->childp will have been NULLed by
      *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
      *     must not pass a NULL *s->childp here.
-     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
-     *     have NULLed *s->childp, so this does not apply yet.  It will in the
-     *     future.)
      *
      * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
      * any case, there is no reason to pass it anyway.
      */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(&s->child, s->old_bs, true);
+    /*
+     * The child was pre-existing, so s->old_bs must be non-NULL, and
+     * s->child thus must not have been freed
+     */
+    assert(s->child != NULL);
+    if (!new_bs) {
+        /* As described above, *s->childp was cleared, so restore it */
+        assert(s->childp != NULL);
+        *s->childp = s->child;
+    }
     bdrv_unref(new_bs);
 }
 
@@ -2310,30 +2320,44 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * The function doesn't update permissions, caller is responsible for this.
  *
+ * (*childp)->bs must not be NULL.
+ *
  * Note that if new_bs == NULL, @childp is stored in a state object attached
  * to @tran, so that the old child can be reinstated in the abort handler.
  * Therefore, if @new_bs can be NULL, @childp must stay valid until the
  * transaction is committed or aborted.
  *
- * (TODO: The reinstating does not happen yet, but it will once
- * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
+ * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
+ * freed (on commit).  @free_empty_child should only be false if the
+ * caller will free the BDrvChild themselves (which may be important
+ * if this is in turn called in another transactional context).
  */
 static void bdrv_replace_child_tran(BdrvChild **childp,
                                     BlockDriverState *new_bs,
-                                    Transaction *tran)
+                                    Transaction *tran,
+                                    bool free_empty_child)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
         .child = *childp,
         .childp = new_bs == NULL ? childp : NULL,
         .old_bs = (*childp)->bs,
+        .free_empty_child = free_empty_child,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
+    /* The abort handler relies on this */
+    assert(s->old_bs != NULL);
+
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(childp, new_bs);
+    /*
+     * Pass free_empty_child=false, we will free the child (if
+     * necessary) in bdrv_replace_child_commit() (if our
+     * @free_empty_child parameter was true).
+     */
+    bdrv_replace_child_noperm(childp, new_bs, false);
     /* old_bs reference is transparently moved from *childp to @s */
 }
 
@@ -2705,8 +2729,22 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
+/**
+ * Replace (*childp)->bs by @new_bs.
+ *
+ * If @new_bs is NULL, *childp will be set to NULL, too: BDS parents
+ * generally cannot handle a BdrvChild with .bs == NULL, so clearing
+ * BdrvChild.bs should generally immediately be followed by the
+ * BdrvChild pointer being cleared as well.
+ *
+ * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
+ * freed.  @free_empty_child should only be false if the caller will
+ * free the BdrvChild themselves (this may be important in a
+ * transactional context, where it may only be freed on commit).
+ */
 static void bdrv_replace_child_noperm(BdrvChild **childp,
-                                      BlockDriverState *new_bs)
+                                      BlockDriverState *new_bs,
+                                      bool free_empty_child)
 {
     BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
@@ -2743,6 +2781,9 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
+    if (!new_bs) {
+        *childp = NULL;
+    }
 
     if (new_bs) {
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
@@ -2772,6 +2813,10 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
+
+    if (free_empty_child && !child->bs) {
+        bdrv_child_free(child);
+    }
 }
 
 /**
@@ -2801,7 +2846,14 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    bdrv_replace_child_noperm(s->child, NULL);
+    /*
+     * Pass free_empty_child=false, because we still need the child
+     * for the AioContext operations on the parent below; those
+     * BdrvChildClass methods all work on a BdrvChild object, so we
+     * need to keep it as an empty shell (after this function, it will
+     * not be attached to any parent, and it will not have a .bs).
+     */
+    bdrv_replace_child_noperm(s->child, NULL, false);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2823,7 +2875,6 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
-    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2901,7 +2952,9 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(&new_child, child_bs, true);
+    /* child_bs was non-NULL, so new_child must not have been freed */
+    assert(new_child != NULL);
 
     *child = new_child;
 
@@ -2960,8 +3013,7 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
-    bdrv_replace_child_noperm(childp, NULL);
-    bdrv_child_free(*childp);
+    bdrv_replace_child_noperm(childp, NULL, true);
 
     if (old_bs) {
         /*
@@ -4951,7 +5003,11 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(childp, NULL, tran);
+        /*
+         * Pass free_empty_child=false, we will free the child in
+         * bdrv_remove_filter_or_cow_child_commit()
+         */
+        bdrv_replace_child_tran(childp, NULL, tran, false);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4961,8 +5017,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
-
-    *childp = NULL;
 }
 
 /*
@@ -5005,7 +5059,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran);
+        bdrv_replace_child_tran(&c, to, tran, true);
     }
 
     return 0;
@@ -5161,7 +5215,9 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(&child, new_bs, tran, true);
+    /* @new_bs must have been non-NULL, so @child must not have been freed */
+    assert(child != NULL);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.33.1


