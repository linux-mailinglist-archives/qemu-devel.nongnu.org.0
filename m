Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B64ED036
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:36:12 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhrH-0006xN-P8
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:36:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft0-0008BC-Rw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:50 -0400
Received: from [2a00:1450:4864:20::134] (port=41872
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsw-0003I1-SH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:50 -0400
Received: by mail-lf1-x134.google.com with SMTP id p15so38078606lfk.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGqfbNupi8VqXOUIArk7Fsz80iuTW3xjydo5dj67Z4s=;
 b=fFEbG2tocNG2DE2DZ8nSrHFNOm3C8Aw0u85x4HBlxlexDwl8JshKnyY+Dt15axZGUU
 9gRtUMY6Wwg1r58NwEdpBKC/V1ieGwITsvTLm4FL+721xWHo4GxQ69os4n1dDLXM0FZG
 Goblg8r1VI55n/QFLaRF3Fip1J0h+/IVMr8XgRm8ZheV99L/KsfVv/HzKZlZH5gySox7
 FufRQMMjclOexz4JZiuHbVwcLxbSaLChT2Qb6gLWfADiOgN6pZafAjEC1337bXVaf8o7
 eTxwpjO1pRNrdfMDcEOCerAhBA/GiAcyNCXD4NOxDzLXkNRoTkU7L1LIGgDZaDTD450e
 cJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGqfbNupi8VqXOUIArk7Fsz80iuTW3xjydo5dj67Z4s=;
 b=oKkqZYEDRAjvAhiUXgHdOEj6vWksVRo5nULnveROCZseX6T914VvHTRuIp1Mo9gJbA
 HmYOrONyCBrKjF9QMu7Sl8FABraICaGS+Oo1uTMcE8FUqyxuMyamkoUqBX9/C0udUZRg
 VxJeZeCRsxkt8pw8IM7PeIyZvxCQxH7rPQ0mAdbzGhGul1uPeVMb0cQgQGzMGJTaXHRW
 1RMxfIJmRLwVguvmV4lj8PxmtlgXJX4tJXLuwLdzFwKy2kV2n6/BOKnYFUFs8NTqXypx
 jdvsCSPoXk8XrHBlsvQsx5xj7R2DXcsUgvMCeZVK4wRn3CJ1oPYYThA18a4+h0XShzfa
 ObkQ==
X-Gm-Message-State: AOAM530u5jzs3NGbktGoO0kHvpcXDNCqiVP4/lifnlUSRHHVCkk8qelL
 5gUrEndpvlTfbXXX/MH3UmQmqA==
X-Google-Smtp-Source: ABdhPJzLLBEGKVlFXTeMzHI4VqhCKR6en9xFyrqDwlYpS5gTHL2bE8pyl2hY8kHRQJRGsC8EXqtasg==
X-Received: by 2002:a05:6512:a89:b0:44a:3936:3a22 with SMTP id
 m9-20020a0565120a8900b0044a39363a22mr8411377lfu.364.1648675785021; 
 Wed, 30 Mar 2022 14:29:45 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:44 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 22/45] block: implemet bdrv_unref_tran()
Date: Thu, 31 Mar 2022 00:28:39 +0300
Message-Id: <20220330212902.590099-23-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x134.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
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

Now nodes are removed during block-graph update transactions now? Look
at bdrv_replace_child_tran: bdrv_unref() is simply postponed to commit
phase.

What is the problem with it?

We want to make copy-before-write permissions strict: it should unshare
write always, not only when it has at least one parent. But if so, we
can't neither insert the filter nor remove it:

To insert the filter, we should first do blockdev-add, and filter will
unshare write on the child, so, blockdev-add will fail if disk is in
use by guest.

To remove the filter, we should first do a replace operations, which
again leads to situation when the filter and old parent share one
child, and all parent want write permission when the filter unshare it.

The solution is first do both graph-modifying operations (add &
replace, or replace & remove) and only then update permissions. But
that is not possible with current method to transactionally remove the
block node: if we just postpone bdrv_unref() to commit phase, than on
prepare phase the node is not removed, and it still keep all
permissions on its children.

What to do? In general, I don't know. But it's possible to solve the
problem for the block drivers that doesn't need access to their
children on .bdrv_close(). For such drivers we can detach their
children on prepare stage (still, postponing bdrv_close() call to
commit phase). For this to work we of course should effectively reduce
bs->refcnt on prepare phase as well.

So, the logic of new bdrv_unref_tran() is:

prepare:
  decrease refcnt and detach children if possible (and if refcnt is 0)

commit:
  do bdrv_delete() if refcnt is 0

abort:
  restore children and refcnt

What's the difficulty with it? If we want to transactionally (and with
no permission change) remove nodes, we should understand that some
nodes may be removed recursively, and finally we get several possible
not deleted leaves, where permissions should be updated. How caller
will know what to update? That leads to additional transaction-wide
refresh_list variable, which is filled by various graph modifying
function. So, user should declare referesh_list variable and do one or
several block-graph modifying operations (that may probably remove some
nodes), then user call bdrv_list_refresh_perms on resulting
refresh_list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                            | 225 +++++++++++++++++++----------
 include/block/block-common.h       |   2 -
 include/block/block-global-state.h |   2 +
 include/block/block_int-common.h   |   7 +
 4 files changed, 156 insertions(+), 80 deletions(-)

diff --git a/block.c b/block.c
index 1900cdf277..a7020d3cd8 100644
--- a/block.c
+++ b/block.c
@@ -92,10 +92,12 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, GSList **refresh_list,
+                              Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
+                               GSList **refresh_list,
                                Transaction *change_child_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
@@ -2363,40 +2365,24 @@ typedef struct BdrvReplaceChildState {
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
-static void bdrv_replace_child_commit(void *opaque)
-{
-    BdrvReplaceChildState *s = opaque;
-    GLOBAL_STATE_CODE();
-
-    bdrv_unref(s->old_bs);
-}
-
 static void bdrv_replace_child_abort(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
     GLOBAL_STATE_CODE();
-    /* old_bs reference is transparently moved from @s to @s->child */
     bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
 static TransactionActionDrv bdrv_replace_child_drv = {
-    .commit = bdrv_replace_child_commit,
     .abort = bdrv_replace_child_abort,
     .clean = g_free,
 };
 
-/*
- * bdrv_replace_child_tran
- *
- * Note: real unref of old_bs is done only on commit.
- *
- * The function doesn't update permissions, caller is responsible for this.
- */
+/* Caller is responsible to refresh permissions in @refresh_list */
 static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
-                                    Transaction *tran)
+                                    GSList **refresh_list, Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -2407,9 +2393,15 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
 
     if (new_bs) {
         bdrv_ref(new_bs);
+        *refresh_list = g_slist_prepend(*refresh_list, new_bs);
     }
     bdrv_replace_child_noperm(child, new_bs);
-    /* old_bs reference is transparently moved from @child to @s */
+    if (s->old_bs) {
+        bdrv_unref_tran(s->old_bs, refresh_list, tran);
+        if (s->old_bs->refcnt > 0) {
+            *refresh_list = g_slist_prepend(*refresh_list, s->old_bs);
+        }
+    }
 }
 
 /*
@@ -2926,7 +2918,6 @@ static TransactionActionDrv bdrv_try_set_aio_context_drv = {
     .clean = g_free,
 };
 
-__attribute__((unused))
 static int bdrv_try_set_aio_context_tran(BlockDriverState *bs,
                                          AioContext *new_ctx,
                                          Transaction *tran,
@@ -3207,31 +3198,41 @@ out:
     return ret < 0 ? NULL : child;
 }
 
-/* Callers must ensure that child->frozen is false. */
-void bdrv_root_unref_child(BdrvChild *child)
+/* Caller is responsible to refresh permissions in @refresh_list */
+static void bdrv_root_unref_child_tran(BdrvChild *child, GSList **refresh_list,
+                                       Transaction *tran)
 {
     BlockDriverState *child_bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (child_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(child_bs, NULL, NULL);
+    bdrv_remove_child(child, refresh_list, tran);
 
+    if (child_bs && child_bs->refcnt > 0) {
         /*
          * When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext
          */
-        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+        bdrv_try_set_aio_context_tran(child_bs, qemu_get_aio_context(),
+                                      tran, NULL);
     }
+}
 
-    bdrv_unref(child_bs);
+/* Callers must ensure that child->frozen is false. */
+void bdrv_root_unref_child(BdrvChild *child)
+{
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    bdrv_root_unref_child_tran(child, &refresh_list, tran);
+
+    /*
+     * Update permissions for old node. We're just taking a parent away, so
+     * we're loosening restrictions. Errors of permission update are not
+     * fatal in this case, ignore them.
+     */
+    bdrv_list_refresh_perms(refresh_list, NULL, tran, NULL);
+
+    tran_commit(tran);
 }
 
 typedef struct BdrvSetInheritsFrom {
@@ -3300,16 +3301,28 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
     }
 }
 
-/* Callers must ensure that child->frozen is false. */
-void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
+/* Caller is responsible to refresh permissions in @refresh_list */
+static void bdrv_unref_child_tran(BlockDriverState *parent, BdrvChild *child,
+                                    GSList **refresh_list, Transaction *tran)
 {
     GLOBAL_STATE_CODE();
     if (child == NULL) {
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child, NULL);
-    bdrv_root_unref_child(child);
+    bdrv_unset_inherits_from(parent, child, tran);
+    bdrv_root_unref_child_tran(child, refresh_list, tran);
+}
+
+/* Callers must ensure that child->frozen is false. */
+void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
+{
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    bdrv_unref_child_tran(parent, child, &refresh_list, tran);
+    bdrv_list_refresh_perms(refresh_list, NULL, tran, NULL);
+    tran_commit(tran);
 }
 
 
@@ -3354,11 +3367,12 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing or bs->file link of a BDS. A new reference is created;
  * callers which don't need their own reference any more must call bdrv_unref().
  *
- * Function doesn't update permissions, caller is responsible for this.
+ * Caller is responsible to refresh permissions in @refresh_list.
  */
 static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
                                            BlockDriverState *child_bs,
                                            bool is_backing,
+                                           GSList **refresh_list,
                                            Transaction *tran, Error **errp)
 {
     int ret = 0;
@@ -3412,13 +3426,15 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_child(child, tran);
+        bdrv_remove_child(child, refresh_list, tran);
     }
 
     if (!child_bs) {
         goto out;
     }
 
+    *refresh_list = g_slist_prepend(*refresh_list, parent_bs);
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs,
                                    is_backing ? "backing" : "file",
                                    &child_of_bds, role,
@@ -3442,12 +3458,15 @@ out:
     return 0;
 }
 
+/* Caller is responsible to refresh permissions in @refresh_list */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
+                                   GSList **refresh_list,
                                    Transaction *tran, Error **errp)
 {
     GLOBAL_STATE_CODE();
-    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
+    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, refresh_list,
+                                           tran, errp);
 }
 
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
@@ -3455,16 +3474,17 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 {
     int ret;
     Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
 
     GLOBAL_STATE_CODE();
     bdrv_drained_begin(bs);
 
-    ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
+    ret = bdrv_set_backing_noperm(bs, backing_hd, &refresh_list, tran, errp);
     if (ret < 0) {
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, tran, errp);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -4429,7 +4449,8 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         assert(bs_entry->state.bs->quiesce_counter > 0);
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
         aio_context_acquire(ctx);
-        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
+        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, &refresh_list,
+                                  tran, errp);
         aio_context_release(ctx);
         if (ret < 0) {
             goto abort;
@@ -4441,14 +4462,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         BDRVReopenState *state = &bs_entry->state;
 
         refresh_list = g_slist_prepend(refresh_list, state->bs);
-        if (state->old_backing_bs) {
-            refresh_list = g_slist_prepend(refresh_list, state->old_backing_bs);
-        }
-        if (state->old_file_bs) {
-            refresh_list = g_slist_prepend(refresh_list, state->old_file_bs);
-        }
     }
-
     /*
      * Note that file-posix driver rely on permission update done during reopen
      * (even if no permission changed), because it wants "new" permissions for
@@ -4561,10 +4575,14 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  * true and reopen_state->new_backing_bs contains a pointer to the new
  * backing BlockDriverState (or NULL).
  *
+ * Caller is responsible to refresh permissions in @refresh_list.
+ *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
-                                             bool is_backing, Transaction *tran,
+                                             bool is_backing,
+                                             GSList **refresh_list,
+                                             Transaction *tran,
                                              Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4632,14 +4650,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    if (is_backing) {
-        reopen_state->old_backing_bs = old_child_bs;
-    } else {
-        reopen_state->old_file_bs = old_child_bs;
-    }
-
     return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
-                                           tran, errp);
+                                           refresh_list, tran, errp);
 }
 
 /*
@@ -4651,6 +4663,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
  * flags are the new open flags
  * queue is the reopen queue
  *
+ * Caller is responsible to refresh permissions in @refresh_list.
+ *
  * Returns 0 on success, non-zero on error.  On error errp will be set
  * as well.
  *
@@ -4661,6 +4675,7 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
+                               GSList **refresh_list,
                                Transaction *change_child_tran, Error **errp)
 {
     int ret = -1;
@@ -4782,7 +4797,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true,
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true, refresh_list,
                                             change_child_tran, errp);
     if (ret < 0) {
         goto error;
@@ -4790,7 +4805,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     qdict_del(reopen_state->options, "backing");
 
     /* Allow changing the 'file' option. In this case NULL is not allowed */
-    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false,
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false, refresh_list,
                                             change_child_tran, errp);
     if (ret < 0) {
         goto error;
@@ -5104,24 +5119,28 @@ static TransactionActionDrv bdrv_remove_child_drv = {
 
 /*
  * A function to remove backing or file child of @bs.
- * Function doesn't update permissions, caller is responsible for this.
+ * Caller is responsible to refresh permissions in @refresh_list.
  */
-static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
+static void bdrv_remove_child(BdrvChild *child, GSList **refresh_list,
+                              Transaction *tran)
 {
     if (!child) {
         return;
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, refresh_list, tran);
     }
 
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
+/* Caller is responsible to refresh permissions in @refresh_list */
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Transaction *tran,
+                                    bool auto_skip,
+                                    GSList **refresh_list,
+                                    Transaction *tran,
                                     Error **errp)
 {
     BdrvChild *c, *next;
@@ -5143,7 +5162,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_tran(c, to, tran);
+        bdrv_replace_child_tran(c, to, refresh_list, tran);
     }
 
     return 0;
@@ -5196,18 +5215,17 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, &refresh_list, tran,
+                                   errp);
     if (ret < 0) {
         goto out;
     }
 
     if (detach_subchain) {
-        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent),
+                          &refresh_list, tran);
     }
 
-    refresh_list = g_slist_prepend(refresh_list, to);
-    refresh_list = g_slist_prepend(refresh_list, from);
-
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
     if (ret < 0) {
         goto out;
@@ -5257,6 +5275,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 {
     int ret;
     Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
 
     GLOBAL_STATE_CODE();
 
@@ -5269,12 +5288,13 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &refresh_list, tran,
+                                   errp);
     if (ret < 0) {
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, tran, errp);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5298,10 +5318,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(child, new_bs, tran);
-
-    refresh_list = g_slist_prepend(refresh_list, old_bs);
-    refresh_list = g_slist_prepend(refresh_list, new_bs);
+    bdrv_replace_child_tran(child, new_bs, &refresh_list, tran);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
@@ -6830,6 +6847,58 @@ void bdrv_ref(BlockDriverState *bs)
     bs->refcnt++;
 }
 
+static void bdrv_unref_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->refcnt == 0) {
+        bdrv_delete(bs);
+    }
+}
+
+static void bdrv_unref_abort(void *opaque)
+{
+    bdrv_ref(opaque);
+}
+
+static TransactionActionDrv bdrv_unref_drv = {
+    .commit = bdrv_unref_commit,
+    .abort = bdrv_unref_abort,
+};
+
+/*
+ * Transactional unref
+ *   - deletion is postponed to transaction commit
+ *   - where possible children are detached now, and permissions are not
+ *     updated. @refresh_list is filled with nodes, to call
+ *     bdrv_nodes_refresh_perms() on.
+ */
+void bdrv_unref_tran(BlockDriverState *bs, GSList **refresh_list,
+                     Transaction *tran)
+{
+    BdrvChild *child, *next;
+
+    if (!bs) {
+        return;
+    }
+
+    assert(bs->refcnt > 0);
+    bs->refcnt--;
+
+    tran_add(tran, &bdrv_unref_drv, bs);
+
+    if (bs->drv && (!bs->drv->bdrv_close || bs->drv->independent_close) &&
+        refresh_list && bs->refcnt == 0)
+    {
+        QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
+            if (child->bs && child->bs->refcnt > 1) {
+                *refresh_list = g_slist_prepend(*refresh_list, child->bs);
+            }
+            bdrv_unref_child_tran(bs, child, refresh_list, tran);
+        }
+    }
+}
+
 /* Release a previously grabbed reference to bs.
  * If after releasing, reference count is zero, the BlockDriverState is
  * deleted. */
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 2687a2519c..2f247dd607 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -230,8 +230,6 @@ typedef struct BDRVReopenState {
     int flags;
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
-    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
-    BlockDriverState *old_file_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index c307b48b2a..f3ec72810e 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -186,6 +186,8 @@ void bdrv_img_create(const char *filename, const char *fmt,
 
 void bdrv_ref(BlockDriverState *bs);
 void bdrv_unref(BlockDriverState *bs);
+void bdrv_unref_tran(BlockDriverState *bs, GSList **refresh_list,
+                     Transaction *tran);
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index c4d8b11dbb..6713c58934 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -162,6 +162,13 @@ struct BlockDriver {
      */
     bool supports_backing;
 
+    /*
+     * If true that guarantees that .bdrv_close doesn't access any bdrv children
+     * and is safe to be called in commit phase of block-graph modifying
+     * transaction.
+     */
+    bool independent_close;
+
     bool has_variable_length;
 
     /*
-- 
2.35.1


