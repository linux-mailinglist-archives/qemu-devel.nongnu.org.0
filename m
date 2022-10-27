Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E96101AD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:30:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gL-0001pN-Dl; Thu, 27 Oct 2022 14:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gG-0001aQ-Ci
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g8-0002Ri-3g
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXUrDBm2iPwdwBkIIgtKzpMrxtpnlHBWR8pwm2I/lsw=;
 b=LP6W6eoZz6JxtlpTrs3OoDBMBKzKZzqLUacaMLSGK9U1Ko4hQvB5rHA57NExYm3XV4auD0
 cT29nk4akcr2jYAbmStApkyVLdXwGmhM2kZz7O1ZNe1BYmtnAPxyb6rwg7oJQZ/723QSXU
 61+kZIV2Ajc/LrA21llNQ67fngKOZeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-FQGXHkAmPG-I91yd9MH7ww-1; Thu, 27 Oct 2022 14:32:28 -0400
X-MC-Unique: FQGXHkAmPG-I91yd9MH7ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70E187A9E3;
 Thu, 27 Oct 2022 18:32:27 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 215141121320;
 Thu, 27 Oct 2022 18:32:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 17/58] Revert "block: Let replace_child_tran keep indirect
 pointer"
Date: Thu, 27 Oct 2022 20:31:05 +0200
Message-Id: <20221027183146.463129-18-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 82b54cf51656bf3cd5ed1ac549e8a1085a0e3290.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-11-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 81 +++++++--------------------------------------------------
 1 file changed, 10 insertions(+), 71 deletions(-)

diff --git a/block.c b/block.c
index 7a9a6efca8..196d1cf665 100644
--- a/block.c
+++ b/block.c
@@ -2341,7 +2341,6 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
-    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2359,29 +2358,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BlockDriverState *new_bs = s->child->bs;
 
     GLOBAL_STATE_CODE();
-    /*
-     * old_bs reference is transparently moved from @s to s->child.
-     *
-     * Pass &s->child here instead of s->childp, because:
-     * (1) s->old_bs must be non-NULL, so bdrv_replace_child_noperm() will not
-     *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
-     *     will not modify s->child.  From that perspective, it does not matter
-     *     whether we pass s->childp or &s->child.
-     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
-     *     pointer anyway (though it will in the future), so at this point it
-     *     absolutely does not matter whether we pass s->childp or &s->child.)
-     * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
-     *     it here.
-     * (3) If new_bs is NULL, *s->childp will have been NULLed by
-     *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
-     *     must not pass a NULL *s->childp here.
-     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
-     *     have NULLed *s->childp, so this does not apply yet.  It will in the
-     *     future.)
-     *
-     * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
-     * any case, there is no reason to pass it anyway.
-     */
+    /* old_bs reference is transparently moved from @s to @s->child */
     bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2398,32 +2375,22 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  * Note: real unref of old_bs is done only on commit.
  *
  * The function doesn't update permissions, caller is responsible for this.
- *
- * Note that if new_bs == NULL, @childp is stored in a state object attached
- * to @tran, so that the old child can be reinstated in the abort handler.
- * Therefore, if @new_bs can be NULL, @childp must stay valid until the
- * transaction is committed or aborted.
- *
- * (TODO: The reinstating does not happen yet, but it will once
- * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
-static void bdrv_replace_child_tran(BdrvChild **childp,
-                                    BlockDriverState *new_bs,
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
-        .child = *childp,
-        .childp = new_bs == NULL ? childp : NULL,
-        .old_bs = (*childp)->bs,
+        .child = child,
+        .old_bs = child->bs,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(childp, new_bs);
-    /* old_bs reference is transparently moved from *childp to @s */
+    bdrv_replace_child_noperm(&child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
 }
 
 /*
@@ -5045,7 +5012,6 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
-    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -5075,19 +5041,10 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
     bdrv_child_free(s->child);
 }
 
-static void bdrv_remove_filter_or_cow_child_clean(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-
-    /* Drop the bs reference after the transaction is done */
-    bdrv_unref(s->bs);
-    g_free(s);
-}
-
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
     .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = bdrv_remove_filter_or_cow_child_clean,
+    .clean = g_free,
 };
 
 /*
@@ -5105,11 +5062,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         return;
     }
 
-    /*
-     * Keep a reference to @bs so @childp will stay valid throughout the
-     * transaction (required by bdrv_replace_child_tran())
-     */
-    bdrv_ref(bs);
     if (child == bs->backing) {
         childp = &bs->backing;
     } else if (child == bs->file) {
@@ -5119,13 +5071,12 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(childp, NULL, tran);
+        bdrv_replace_child_tran(*childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .bs = bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
@@ -5151,7 +5102,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
-    assert(to != NULL);
     GLOBAL_STATE_CODE();
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
@@ -5169,12 +5119,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-
-        /*
-         * Passing a pointer to the local variable @c is fine here, because
-         * @to is not NULL, and so &c will not be attached to the transaction.
-         */
-        bdrv_replace_child_tran(&c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
@@ -5189,8 +5134,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
- *
- * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -5204,7 +5147,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     int ret;
 
     GLOBAL_STATE_CODE();
-    assert(to != NULL);
 
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
@@ -5261,9 +5203,6 @@ out:
     return ret;
 }
 
-/**
- * Replace node @from by @to (where neither may be NULL).
- */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5339,7 +5278,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.37.3


