Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767C4ECFFE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:24:04 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhfX-0007Gh-9g
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:24:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsr-0007wj-KT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:41 -0400
Received: from [2a00:1450:4864:20::232] (port=43583
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfso-0003Av-OK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:41 -0400
Received: by mail-lj1-x232.google.com with SMTP id b43so24945513ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L2egmZ2jqAg2vevaHjypXExEs4iGwwAXDtmot3+0hf8=;
 b=fGRU3Q0NDHVUmwq4bOky7JJplxJ0l7b4rjxFwmJ4Ps58gd4ab69DNU8xMJlm+F+jue
 qKfZ5m1kGzRp0d240dYvoPz9NGzlLqAO1qD0jVT4l7YcwcDRWeKULMx1+IFbIOKYV/Vl
 ZfIqY5Vqk0/QZk9577pdkIAXh2HJRxplBYv099OsuQy0SHRiH+XRKGi1Q9R5+kO1yiFD
 6DGQZkao+DmbnR4521sQHZ0X6ACbRudKXLATJzJwsjhnQ4Z4t7wshvyUHsRy6yK1R33n
 m7DuaCZJMiG6SPIeAi3MZwl4WB4yJorhNKen2fepDt+Pm6Tlarrl27HaFvkgNkWCssZn
 s4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L2egmZ2jqAg2vevaHjypXExEs4iGwwAXDtmot3+0hf8=;
 b=YEvz/Nd6/+s3Ae6EFF0QA+JUpmmer2dLRVkGbRzuP/s1H7Re/SGqaNxWe486WwHC8w
 nigGjJZ44jgK5ju6SnAuVW7UuVC0QZPkIaXUvRfYAcmVPI31lnKOFpygBFOOdHo8+w6n
 afh8wst5hW61UHj787uIv4eWpZbpuT5Qp0MrM0UyAtOWZahG+ODMTjzBN6C1c33Dog7P
 coIBDEJoCG4JslBgXnR+SREYnd0TJlr1grav1rVslei7RJwuzi28szKdcvMDVc5A7tls
 yRCtNnjyaM0H1DhjdJhwRi5qvUf9DjfIgzWORn8kCvIaGqSihTT5GfSuaQtqpm2xCNuU
 C1pA==
X-Gm-Message-State: AOAM5324JUcuSnQb8H6NSFPF5tTgJmhzJgexJoJ9isaXLF00ZrAHEfcv
 2SjRWwGmQfeloStSZKCTVfWtiQ==
X-Google-Smtp-Source: ABdhPJzvkRmIScVtrfbjCyAH+XmZV0gTps8phhmht69Fc5Wc3CvsArK74R6bY793Vk70nyc9H5VREQ==
X-Received: by 2002:a05:651c:158e:b0:248:1ce:a2a with SMTP id
 h14-20020a05651c158e00b0024801ce0a2amr8004486ljq.172.1648675777000; 
 Wed, 30 Mar 2022 14:29:37 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 09/45] Revert "block: Let replace_child_noperm free
 children"
Date: Thu, 31 Mar 2022 00:28:26 +0300
Message-Id: <20220330212902.590099-10-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x232.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:16 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to reimplement this behavior (clear bs->file / bs->backing
pointers automatically when child->bs is cleared) in a nicer way.

This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 102 +++++++++++++-------------------------------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index 8110b1b330..7f11ec4a80 100644
--- a/block.c
+++ b/block.c
@@ -90,10 +90,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_child_free(BdrvChild *child);
 static void bdrv_replace_child_noperm(BdrvChild **child,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child);
+                                      BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran);
@@ -2338,7 +2336,6 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
-    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
@@ -2346,9 +2343,6 @@ static void bdrv_replace_child_commit(void *opaque)
     BdrvReplaceChildState *s = opaque;
     GLOBAL_STATE_CODE();
 
-    if (s->free_empty_child && !s->child->bs) {
-        bdrv_child_free(s->child);
-    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2366,26 +2360,22 @@ static void bdrv_replace_child_abort(void *opaque)
      *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
      *     will not modify s->child.  From that perspective, it does not matter
      *     whether we pass s->childp or &s->child.
+     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
+     *     pointer anyway (though it will in the future), so at this point it
+     *     absolutely does not matter whether we pass s->childp or &s->child.)
      * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
      *     it here.
      * (3) If new_bs is NULL, *s->childp will have been NULLed by
      *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
      *     must not pass a NULL *s->childp here.
+     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
+     *     have NULLed *s->childp, so this does not apply yet.  It will in the
+     *     future.)
      *
      * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
      * any case, there is no reason to pass it anyway.
      */
-    bdrv_replace_child_noperm(&s->child, s->old_bs, true);
-    /*
-     * The child was pre-existing, so s->old_bs must be non-NULL, and
-     * s->child thus must not have been freed
-     */
-    assert(s->child != NULL);
-    if (!new_bs) {
-        /* As described above, *s->childp was cleared, so restore it */
-        assert(s->childp != NULL);
-        *s->childp = s->child;
-    }
+    bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2402,44 +2392,30 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * The function doesn't update permissions, caller is responsible for this.
  *
- * (*childp)->bs must not be NULL.
- *
  * Note that if new_bs == NULL, @childp is stored in a state object attached
  * to @tran, so that the old child can be reinstated in the abort handler.
  * Therefore, if @new_bs can be NULL, @childp must stay valid until the
  * transaction is committed or aborted.
  *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed (on commit).  @free_empty_child should only be false if the
- * caller will free the BDrvChild themselves (which may be important
- * if this is in turn called in another transactional context).
+ * (TODO: The reinstating does not happen yet, but it will once
+ * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
 static void bdrv_replace_child_tran(BdrvChild **childp,
                                     BlockDriverState *new_bs,
-                                    Transaction *tran,
-                                    bool free_empty_child)
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
         .child = *childp,
         .childp = new_bs == NULL ? childp : NULL,
         .old_bs = (*childp)->bs,
-        .free_empty_child = free_empty_child,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
-    /* The abort handler relies on this */
-    assert(s->old_bs != NULL);
-
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    /*
-     * Pass free_empty_child=false, we will free the child (if
-     * necessary) in bdrv_replace_child_commit() (if our
-     * @free_empty_child parameter was true).
-     */
-    bdrv_replace_child_noperm(childp, new_bs, false);
+    bdrv_replace_child_noperm(childp, new_bs);
     /* old_bs reference is transparently moved from *childp to @s */
 }
 
@@ -2821,22 +2797,8 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-/**
- * Replace (*childp)->bs by @new_bs.
- *
- * If @new_bs is NULL, *childp will be set to NULL, too: BDS parents
- * generally cannot handle a BdrvChild with .bs == NULL, so clearing
- * BdrvChild.bs should generally immediately be followed by the
- * BdrvChild pointer being cleared as well.
- *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed.  @free_empty_child should only be false if the caller will
- * free the BdrvChild themselves (this may be important in a
- * transactional context, where it may only be freed on commit).
- */
 static void bdrv_replace_child_noperm(BdrvChild **childp,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child)
+                                      BlockDriverState *new_bs)
 {
     BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
@@ -2875,9 +2837,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
-    if (!new_bs) {
-        *childp = NULL;
-    }
 
     if (new_bs) {
         assert_bdrv_graph_writable(new_bs);
@@ -2908,10 +2867,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
-
-    if (free_empty_child && !child->bs) {
-        bdrv_child_free(child);
-    }
 }
 
 /**
@@ -2943,14 +2898,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BlockDriverState *bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    /*
-     * Pass free_empty_child=false, because we still need the child
-     * for the AioContext operations on the parent below; those
-     * BdrvChildClass methods all work on a BdrvChild object, so we
-     * need to keep it as an empty shell (after this function, it will
-     * not be attached to any parent, and it will not have a .bs).
-     */
-    bdrv_replace_child_noperm(s->child, NULL, false);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2972,6 +2920,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
+    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -3050,9 +2999,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs, true);
-    /* child_bs was non-NULL, so new_child must not have been freed */
-    assert(new_child != NULL);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -3113,7 +3060,8 @@ static void bdrv_detach_child(BdrvChild **childp)
     BlockDriverState *old_bs = (*childp)->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(childp, NULL, true);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -5167,11 +5115,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        /*
-         * Pass free_empty_child=false, we will free the child in
-         * bdrv_remove_filter_or_cow_child_commit()
-         */
-        bdrv_replace_child_tran(childp, NULL, tran, false);
+        bdrv_replace_child_tran(childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -5181,6 +5125,8 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    *childp = NULL;
 }
 
 /*
@@ -5224,7 +5170,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran, true);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5389,9 +5335,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran, true);
-    /* @new_bs must have been non-NULL, so @child must not have been freed */
-    assert(child != NULL);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.35.1


