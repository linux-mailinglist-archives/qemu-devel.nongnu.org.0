Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8055A3D9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:44:01 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4r5s-0006Zs-1O
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qs0-0000Lt-R2; Fri, 24 Jun 2022 17:29:40 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrx-0004SZ-L4; Fri, 24 Jun 2022 17:29:40 -0400
Received: from myt6-79704c0e15e4.qloud-c.yandex.net
 (myt6-79704c0e15e4.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:239b:0:640:7970:4c0e])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 812092E2013;
 Sat, 25 Jun 2022 00:29:30 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt6-79704c0e15e4.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 o9IzuotbDP-TSJSEVch; Sat, 25 Jun 2022 00:29:30 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106170; bh=yoMz/7HhJ2P2Q7vNasAAvilAyDJ25wDT5P0Ptyiv40c=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=CzWMOFEsaXsOuMJYLacROL6YsWLnF23HgpBUQvbtKsbDRdnJ2Qs3gCtoYg/0q+l1i
 h9gtVYNaUbd6t0jHm+AG21940nBWtf2/ufYdwcNefiLH/3vPeRbX9/DeVL/704tXpX
 Wh+0jUcUhhLBkiZIB3xqn+mId2BH50EaPZ4D1I1A=
Authentication-Results: myt6-79704c0e15e4.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TSMSTOsK; Sat, 25 Jun 2022 00:29:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 10/15] Revert "block: Let replace_child_tran keep indirect
 pointer"
Date: Sat, 25 Jun 2022 00:28:25 +0300
Message-Id: <20220624212830.316919-11-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624212830.316919-1-vsementsov@yandex-team.ru>
References: <20220624212830.316919-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 82b54cf51656bf3cd5ed1ac549e8a1085a0e3290.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block.c | 81 +++++++--------------------------------------------------
 1 file changed, 10 insertions(+), 71 deletions(-)

diff --git a/block.c b/block.c
index 34ca046470..a83845b120 100644
--- a/block.c
+++ b/block.c
@@ -2334,7 +2334,6 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
-    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2352,29 +2351,7 @@ static void bdrv_replace_child_abort(void *opaque)
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
@@ -2391,32 +2368,22 @@ static TransactionActionDrv bdrv_replace_child_drv = {
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
@@ -5041,7 +5008,6 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
-    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -5071,19 +5037,10 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
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
@@ -5101,11 +5058,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5115,13 +5067,12 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5147,7 +5098,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
-    assert(to != NULL);
     GLOBAL_STATE_CODE();
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
@@ -5165,12 +5115,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
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
@@ -5185,8 +5130,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
- *
- * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -5200,7 +5143,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     int ret;
 
     GLOBAL_STATE_CODE();
-    assert(to != NULL);
 
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
@@ -5257,9 +5199,6 @@ out:
     return ret;
 }
 
-/**
- * Replace node @from by @to (where neither may be NULL).
- */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5335,7 +5274,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.25.1


