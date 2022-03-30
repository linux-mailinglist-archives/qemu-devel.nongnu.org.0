Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC284ED003
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:27:18 +0200 (CEST)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhif-0004tq-9L
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:27:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsu-00081c-7k
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:44 -0400
Received: from [2a00:1450:4864:20::22b] (port=43577
 helo=mail-lj1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsr-0003Cv-A5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:43 -0400
Received: by mail-lj1-x22b.google.com with SMTP id b43so24945645ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxA16/0vHXnE0IYduXZZfLFZVO67I7ey+Qd97nmcKzs=;
 b=8ShyqqI+F118OYSRuIRF4jBftfAMmK32ogDXd3xbtzufEzyNYIeJB8/cwyWPb0G2ia
 4HEx2j4lnGjpBR2YvlYCaJAba4xb59VC8cqy3UJxVilZA767PS4/v1KrBLbJUZT9FTrt
 P8anHmfhOOUqrObK7q4uNWO+bFUkzBZvAwln2uyMdkJgeqWovKjDm1e9ec0a64W9ZTxm
 vxMfsHzqosJHwAIQl6UPFHbuzG/R73OEjlRnFBWQDGVwKZUuirrfF18OrXIcLUY7vq6m
 Qk2dW3DwxmO0XCASePTAj0T5zBO//ImbUFjvMgdc2o0Nax23iUiddUhRlaw1eZ2MHJyK
 55PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxA16/0vHXnE0IYduXZZfLFZVO67I7ey+Qd97nmcKzs=;
 b=LwYvfyhYwiBA+ejA9M7ZvxnPKdgK+9GE+xVKWb2F5qnKNSZRa2ddz9LPfKzRquzp0P
 TSr3oUAs2yj6wlh2jmnug0CLV7rm/0IuevNkTq08uO9uikI830CED/Me+n3FZ7dKk3Qb
 B/jZW3uY148pHAdQzraK9pgeVgYQVLW2Iv0vs0VVWSPQrcnwLTCW9huLe+w+Y8VuCl6q
 TcG5YZkgKvLBliaA4Eiw8hDzBYERr587Gj36NISBoVhrg/YSHz6AVhlL+Mnq7isf4nrn
 OxPOlSyqYo34aK+WwaicmU66MYXiJNLSOuFdXj/jGP2HIhFkgSIVlp5DSMpEk6gdVkUt
 3RqQ==
X-Gm-Message-State: AOAM530mpmsjQt0zPAFtqfQVGzO36GonodchSFio+IAlBjDHKNt3F/x2
 LVvrAnwgpEWN/XSlj816Mjs1cE6Rq9rvPA==
X-Google-Smtp-Source: ABdhPJyBCgCLkiGaBXqm8LhVIJbakMV4Qb+qy6LLCihdM6mD0kiDtubvzBR0x32kbsuyunmhz7JslA==
X-Received: by 2002:a05:651c:1a27:b0:249:8dd8:6ceb with SMTP id
 by39-20020a05651c1a2700b002498dd86cebmr8080458ljb.8.1648675779478; 
 Wed, 30 Mar 2022 14:29:39 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:39 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 13/45] block: Manipulate bs->file / bs->backing pointers in
 .attach/.detach
Date: Thu, 31 Mar 2022 00:28:30 +0300
Message-Id: <20220330212902.590099-14-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:23 -0400
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

bs->file and bs->backing are a kind of duplication of part of
bs->children. But very useful diplication, so let's not drop them at
all:)

We should manage bs->file and bs->backing in same place, where we
manage bs->children, to keep them in sync.

Moreover, generic io paths are unprepared to BdrvChild without a bs, so
it's double good to clear bs->file / bs->backing when we detach the
child.

Detach is simple: if we detach bs->file or bs->backing child, just
set corresponding field to NULL.

Attach is a bit more complicated. But we still can precisely detect
should we set one of bs->file / bs->backing or not:

- if role is BDRV_CHILD_COW, we definitely deal with bs->backing
- else, if role is BDRV_CHILD_FILTERED (it must be also
  BDRV_CHILD_PRIMARY), it's a filtered child. Use
  bs->drv->filtered_child_is_backing to chose the pointer field to
  modify.
- else, if role is BDRV_CHILD_PRIMARY, we deal with bs->file
- in all other cases, it's neither bs->backing nor bs->file. It's some
  other child and we shouldn't care

OK. This change brings one more good thing: we can (and should) get rid
of all indirect pointers in the block-graph-change transactions:

bdrv_attach_child_common() stores BdrvChild** into transaction to clear
it on abort.

bdrv_attach_child_common() has two callers: bdrv_attach_child_noperm()
just pass-through this feature, bdrv_root_attach_child() doesn't need
the feature.

Look at bdrv_attach_child_noperm() callers:
  - bdrv_attach_child() doesn't need the feature
  - bdrv_set_file_or_backing_noperm() uses the feature to manage
    bs->file and bs->backing, we don't want it anymore
  - bdrv_append() uses the feature to manage bs->backing, again we
    don't want it anymore

So, we should drop this stuff! Great!

We still keep BdrvChild** argument to return the child and int return
value, and not move to simply returning BdrvChild*, as we don't want to
lose int return values.

However we don't require *@child to be NULL anymore, and even allow
@child to be NULL, if caller don't need the new child pointer.

Finally, we now set .file / .backing automatically in generic code and
want to restring setting them by hand outside of .attach/.detach.
So, this patch cleanups all remaining places where they were set.
To find such places I use:

  git grep '\->file ='
  git grep '\->backing ='
  git grep '&.*\<backing\>'
  git grep '&.*\<file\>'

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                          | 156 ++++++++++++++-----------------
 block/raw-format.c               |   4 +-
 block/snapshot.c                 |   1 -
 include/block/block_int-common.h |  15 ++-
 tests/unit/test-bdrv-drain.c     |  10 +-
 5 files changed, 89 insertions(+), 97 deletions(-)

diff --git a/block.c b/block.c
index 8e8ed639fe..6b43e101a1 100644
--- a/block.c
+++ b/block.c
@@ -1438,9 +1438,33 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 
     assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
-
-    if (child->role & BDRV_CHILD_COW) {
+    if (bs->drv->is_filter | (child->role & BDRV_CHILD_FILTERED)) {
+        /*
+         * Here we handle filters and block/raw-format.c when it behave like
+         * filter.
+         */
+        assert(!(child->role & BDRV_CHILD_COW));
+        if (child->role & (BDRV_CHILD_PRIMARY | BDRV_CHILD_FILTERED)) {
+            assert(child->role & BDRV_CHILD_PRIMARY);
+            assert(child->role & BDRV_CHILD_FILTERED);
+            assert(!bs->backing);
+            assert(!bs->file);
+
+            if (bs->drv->filtered_child_is_backing) {
+                bs->backing = child;
+            } else {
+                bs->file = child;
+            }
+        }
+    } else if (child->role & BDRV_CHILD_COW) {
+        assert(bs->drv->supports_backing);
+        assert(!(child->role & BDRV_CHILD_PRIMARY));
+        assert(!bs->backing);
+        bs->backing = child;
         bdrv_backing_attach(child);
+    } else if (child->role & BDRV_CHILD_PRIMARY) {
+        assert(!bs->file);
+        bs->file = child;
     }
 
     bdrv_apply_subtree_drain(child, bs);
@@ -1458,6 +1482,12 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
     assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
+    if (child == bs->backing) {
+        assert(child != bs->file);
+        bs->backing = NULL;
+    } else if (child == bs->file) {
+        bs->file = NULL;
+    }
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -1663,7 +1693,7 @@ open_failed:
     bs->drv = NULL;
     if (bs->file != NULL) {
         bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
+        assert(!bs->file);
     }
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -2852,7 +2882,7 @@ static void bdrv_child_free(BdrvChild *child)
 }
 
 typedef struct BdrvAttachChildCommonState {
-    BdrvChild **child;
+    BdrvChild *child;
     AioContext *old_parent_ctx;
     AioContext *old_child_ctx;
 } BdrvAttachChildCommonState;
@@ -2860,33 +2890,31 @@ typedef struct BdrvAttachChildCommonState {
 static void bdrv_attach_child_common_abort(void *opaque)
 {
     BdrvAttachChildCommonState *s = opaque;
-    BdrvChild *child = *s->child;
-    BlockDriverState *bs = child->bs;
+    BlockDriverState *bs = s->child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
     }
 
-    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+    if (bdrv_child_get_parent_aio_context(s->child) != s->old_parent_ctx) {
         GSList *ignore;
 
         /* No need to ignore `child`, because it has been detached already */
         ignore = NULL;
-        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
-                                      &error_abort);
+        s->child->klass->can_set_aio_ctx(s->child, s->old_parent_ctx, &ignore,
+                                         &error_abort);
         g_slist_free(ignore);
 
         ignore = NULL;
-        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+        s->child->klass->set_aio_ctx(s->child, s->old_parent_ctx, &ignore);
         g_slist_free(ignore);
     }
 
     bdrv_unref(bs);
-    bdrv_child_free(child);
-    *s->child = NULL;
+    bdrv_child_free(s->child);
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2897,11 +2925,11 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
  *
- * Resulting new child is returned through @child.
- * At start *@child must be NULL.
- * @child is saved to a new entry of @tran, so that *@child could be reverted to
- * NULL on abort(). So referenced variable must live at least until transaction
- * end.
+ * If @child is not NULL, it's set to new created child. Note, that @child
+ * pointer is stored in the transaction and therefore not cleared on abort.
+ * Consider @child as part of return value: we may change the return value of
+ * the function to BdrvChild* and return child directly, but this way we lose
+ * different return codes.
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
@@ -2917,8 +2945,6 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     AioContext *parent_ctx;
     AioContext *child_ctx = bdrv_get_aio_context(child_bs);
 
-    assert(child);
-    assert(*child == NULL);
     assert(child_class->get_parent_desc);
     GLOBAL_STATE_CODE();
 
@@ -2967,22 +2993,25 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     bdrv_ref(child_bs);
     bdrv_replace_child_noperm(new_child, child_bs);
 
-    *child = new_child;
-
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
     *s = (BdrvAttachChildCommonState) {
-        .child = child,
+        .child = new_child,
         .old_parent_ctx = parent_ctx,
         .old_child_ctx = child_ctx,
     };
     tran_add(tran, &bdrv_attach_child_common_drv, s);
 
+    if (child) {
+        *child = new_child;
+    }
+
     return 0;
 }
 
 /*
- * Variable referenced by @child must live at least until transaction end.
- * (see bdrv_attach_child_common() doc for details)
+ * If @child is not NULL, it's set to new created child. @child is a part of
+ * return value, not a part of transaction (see bdrv_attach_child_common() doc
+ * for details).
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
@@ -3063,7 +3092,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   void *opaque, Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
@@ -3079,11 +3108,10 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
-    return child;
+
+    return ret < 0 ? NULL : child;
 }
 
 /*
@@ -3105,7 +3133,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
@@ -3123,12 +3151,10 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-    return child;
+    return ret < 0 ? NULL : child;
 }
 
 /* Callers must ensure that child->frozen is false. */
@@ -3331,9 +3357,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     ret = bdrv_attach_child_noperm(parent_bs, child_bs,
                                    is_backing ? "backing" : "file",
                                    &child_of_bds, role,
-                                   is_backing ? &parent_bs->backing :
-                                                &parent_bs->file,
-                                   tran, errp);
+                                   NULL, tran, errp);
     if (ret < 0) {
         return ret;
     }
@@ -3591,14 +3615,16 @@ int bdrv_open_file_child(const char *filename,
 
     /* commit_top and mirror_top don't use this function */
     assert(!parent->drv->filtered_child_is_backing);
-
     role = parent->drv->is_filter ?
         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
 
-    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
-                                   &child_of_bds, role, false, errp);
+    if (!bdrv_open_child(filename, options, bdref_key, parent,
+                         &child_of_bds, role, false, errp))
+    {
+        return -EINVAL;
+    }
 
-    return parent->file ? 0 : -EINVAL;
+    return 0;
 }
 
 /*
@@ -4873,8 +4899,8 @@ static void bdrv_close(BlockDriverState *bs)
         bdrv_unref_child(bs, child);
     }
 
-    bs->backing = NULL;
-    bs->file = NULL;
+    assert(!bs->backing);
+    assert(!bs->file);
     g_free(bs->opaque);
     bs->opaque = NULL;
     qatomic_set(&bs->copy_on_read, 0);
@@ -5005,41 +5031,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-typedef struct BdrvRemoveFilterOrCowChild {
-    BdrvChild *child;
-    bool is_backing;
-} BdrvRemoveFilterOrCowChild;
-
-static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-    BlockDriverState *parent_bs = s->child->opaque;
-
-    if (s->is_backing) {
-        parent_bs->backing = s->child;
-    } else {
-        parent_bs->file = s->child;
-    }
-
-    /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
-     * because that function is transactionable and it registered own completion
-     * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
-     * called automatically.
-     */
-}
-
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
-    BdrvRemoveFilterOrCowChild *s = opaque;
     GLOBAL_STATE_CODE();
-    bdrv_child_free(s->child);
+    bdrv_child_free(opaque);
 }
 
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = g_free,
 };
 
 /*
@@ -5050,8 +5049,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvRemoveFilterOrCowChild *s;
-
     assert(child == bs->backing || child == bs->file);
 
     if (!child) {
@@ -5062,18 +5059,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    s = g_new(BdrvRemoveFilterOrCowChild, 1);
-    *s = (BdrvRemoveFilterOrCowChild) {
-        .child = child,
-        .is_backing = (child == bs->backing),
-    };
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
-
-    if (s->is_backing) {
-        bs->backing = NULL;
-    } else {
-        bs->file = NULL;
-    }
+    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
 }
 
 /*
@@ -5235,7 +5221,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                    &child_of_bds, bdrv_backing_role(bs_new),
-                                   &bs_new->backing, tran, errp);
+                                   NULL, tran, errp);
     if (ret < 0) {
         goto out;
     }
diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..d8ca8ee3a9 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -457,8 +457,8 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         file_role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               file_role, false, errp);
+    bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                    file_role, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/snapshot.c b/block/snapshot.c
index f4ec4f9ef3..02a880911f 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -288,7 +288,6 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
 
         /* .bdrv_open() will re-attach it */
         bdrv_unref_child(bs, *fallback_ptr);
-        *fallback_ptr = NULL;
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d68adc6ff3..c4d8b11dbb 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1056,9 +1056,6 @@ struct BlockDriverState {
     QDict *full_open_options;
     char exact_filename[PATH_MAX];
 
-    BdrvChild *backing;
-    BdrvChild *file;
-
     /* I/O Limits */
     BlockLimits bl;
 
@@ -1117,7 +1114,19 @@ struct BlockDriverState {
      * parent node of this node.
      */
     BlockDriverState *inherits_from;
+
+    /*
+     * @backing and @file are some of @children or NULL. All these three fields
+     * (@file, @backing and @children) are modified only in
+     * bdrv_child_cb_attach() and bdrv_child_cb_detach().
+     *
+     * See also comment in include/block/block.h, to learn how backing and file
+     * are connected with BdrvChildRole.
+     */
     QLIST_HEAD(, BdrvChild) children;
+    BdrvChild *backing;
+    BdrvChild *file;
+
     QLIST_HEAD(, BdrvChild) parents;
 
     QDict *options;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 23d425a494..4cf99edf5b 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1808,9 +1808,8 @@ static void test_drop_intermediate_poll(void)
     for (i = 0; i < 3; i++) {
         if (i) {
             /* Takes the reference to chain[i - 1] */
-            chain[i]->backing = bdrv_attach_child(chain[i], chain[i - 1],
-                                                  "chain", &chain_child_class,
-                                                  BDRV_CHILD_COW, &error_abort);
+            bdrv_attach_child(chain[i], chain[i - 1], "chain",
+                              &chain_child_class, BDRV_CHILD_COW, &error_abort);
         }
     }
 
@@ -2028,9 +2027,8 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     new_child_bs->total_sectors = 1;
 
     bdrv_ref(old_child_bs);
-    parent_bs->backing = bdrv_attach_child(parent_bs, old_child_bs, "child",
-                                           &child_of_bds, BDRV_CHILD_COW,
-                                           &error_abort);
+    bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
+                      BDRV_CHILD_COW, &error_abort);
 
     for (i = 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
-- 
2.35.1


