Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1844532D5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:26:57 +0100 (CET)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyUC-0008D4-2q
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:26:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAn-00041q-DP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAj-00077e-TE
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgPktgCJM3GSFV/L7eNu90q9s8R+/85RJFoJyB8TAoM=;
 b=ZhRI7CrjmIacIcRskTjkgFlHXXJ846xlaTH0/BWqr/TVpuPTg6qmpkomYzSwq8Yywq/Peb
 J9eY372tyDlIrz9Ug4tl1w4i47rGtk+rZqwozG+w+s8ttUDm+lmQPZkjXidWUFnYM0anqr
 gBrjSntZynUf4kW9N/Bo/9w77Kipg8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-7Mefl0kvNFae-yopfcTd0A-1; Tue, 16 Nov 2021 08:06:44 -0500
X-MC-Unique: 7Mefl0kvNFae-yopfcTd0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C221054F90;
 Tue, 16 Nov 2021 13:06:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F1D5DEFB;
 Tue, 16 Nov 2021 13:06:42 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 08/13] block: Let replace_child_tran keep indirect pointer
Date: Tue, 16 Nov 2021 14:06:13 +0100
Message-Id: <20211116130618.700441-9-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

As of a future commit, bdrv_replace_child_noperm() will clear the
indirect BdrvChild pointer passed to it if the new child BDS is NULL.
bdrv_replace_child_tran() will want to let it do that, but revert this
change in its abort handler.  For that, we need to have it receive a
BdrvChild ** pointer, too, and keep it stored in the
BdrvReplaceChildState object that we attach to the transaction.

Note that we do not need to store it in the BdrvReplaceChildState when
new_bs is not NULL, because then there is nothing to revert.  This is
important so that bdrv_replace_node_noperm() can pass a pointer to a
loop-local variable to bdrv_replace_child_tran() without worrying that
this pointer will outlive one loop iteration.

(Of course, for that to work, bdrv_replace_node_noperm() and in turn
bdrv_replace_node() and its relatives may not be called with a NULL @to
node.  Luckily, they already are not, but now we should assert this.)

bdrv_remove_file_or_backing_child() on the other hand needs to ensure
that the indirect pointer it passes will stay valid for the duration of
the transaction.  Ensure this by keeping a strong reference to the BDS
whose &bs->backing or &bs->file it passes to bdrv_replace_child_tran(),
and giving up that reference only in the transaction .clean() handler.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211111120829.81329-9-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-9-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 8da057f800..a40027161c 100644
--- a/block.c
+++ b/block.c
@@ -2254,6 +2254,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
+    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2269,7 +2270,29 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
-    /* old_bs reference is transparently moved from @s to @s->child */
+    /*
+     * old_bs reference is transparently moved from @s to s->child.
+     *
+     * Pass &s->child here instead of s->childp, because:
+     * (1) s->old_bs must be non-NULL, so bdrv_replace_child_noperm() will not
+     *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
+     *     will not modify s->child.  From that perspective, it does not matter
+     *     whether we pass s->childp or &s->child.
+     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
+     *     pointer anyway (though it will in the future), so at this point it
+     *     absolutely does not matter whether we pass s->childp or &s->child.)
+     * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
+     *     it here.
+     * (3) If new_bs is NULL, *s->childp will have been NULLed by
+     *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
+     *     must not pass a NULL *s->childp here.
+     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
+     *     have NULLed *s->childp, so this does not apply yet.  It will in the
+     *     future.)
+     *
+     * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
+     * any case, there is no reason to pass it anyway.
+     */
     bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2286,22 +2309,32 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  * Note: real unref of old_bs is done only on commit.
  *
  * The function doesn't update permissions, caller is responsible for this.
+ *
+ * Note that if new_bs == NULL, @childp is stored in a state object attached
+ * to @tran, so that the old child can be reinstated in the abort handler.
+ * Therefore, if @new_bs can be NULL, @childp must stay valid until the
+ * transaction is committed or aborted.
+ *
+ * (TODO: The reinstating does not happen yet, but it will once
+ * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
-static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+static void bdrv_replace_child_tran(BdrvChild **childp,
+                                    BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
-        .child = child,
-        .old_bs = child->bs,
+        .child = *childp,
+        .childp = new_bs == NULL ? childp : NULL,
+        .old_bs = (*childp)->bs,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
-    /* old_bs reference is transparently moved from @child to @s */
+    bdrv_replace_child_noperm(childp, new_bs);
+    /* old_bs reference is transparently moved from *childp to @s */
 }
 
 /*
@@ -4844,6 +4877,7 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
+    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -4873,10 +4907,19 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
     bdrv_child_free(s->child);
 }
 
+static void bdrv_remove_filter_or_cow_child_clean(void *opaque)
+{
+    BdrvRemoveFilterOrCowChild *s = opaque;
+
+    /* Drop the bs reference after the transaction is done */
+    bdrv_unref(s->bs);
+    g_free(s);
+}
+
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
     .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = g_free,
+    .clean = bdrv_remove_filter_or_cow_child_clean,
 };
 
 /*
@@ -4894,6 +4937,11 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         return;
     }
 
+    /*
+     * Keep a reference to @bs so @childp will stay valid throughout the
+     * transaction (required by bdrv_replace_child_tran())
+     */
+    bdrv_ref(bs);
     if (child == bs->backing) {
         childp = &bs->backing;
     } else if (child == bs->file) {
@@ -4903,12 +4951,13 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
+        .bs = bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
@@ -4934,6 +4983,8 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
+    assert(to != NULL);
+
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
@@ -4949,7 +5000,12 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_tran(c, to, tran);
+
+        /*
+         * Passing a pointer to the local variable @c is fine here, because
+         * @to is not NULL, and so &c will not be attached to the transaction.
+         */
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -4964,6 +5020,8 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
+ *
+ * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -4976,6 +5034,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
+    assert(to != NULL);
+
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
         assert(from != to);
@@ -5031,6 +5091,9 @@ out:
     return ret;
 }
 
+/**
+ * Replace node @from by @to (where neither may be NULL).
+ */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5098,7 +5161,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(child, new_bs, tran);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.33.1


