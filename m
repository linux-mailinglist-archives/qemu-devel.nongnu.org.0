Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803F62FBDF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:44:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5Ni-0007ED-Ij; Fri, 18 Nov 2022 12:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5NG-0006jh-BU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N5-0002YO-Dr
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FeLRHFrl5U3synO7C+VkluQdib4uKOFPDq83oDtcplI=;
 b=PxzZw697tXZgX1tFWc7dwqZDjE637Tfu9RCIHmUXJcTYj5MqmfnE6eHenwl8iu0Jty5qix
 VAy5tISrhgjrH/fri6icF1PCPfmr/1Lr7mYRE0SM1TAXYx94EilRX2dZSaCXvMrE/uLqpg
 EL0MgYu+KzKKMPUJZNhXO7UU6/Bhujc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-PUmKJmyxND21eF069yqwag-1; Fri, 18 Nov 2022 12:41:43 -0500
X-MC-Unique: PUmKJmyxND21eF069yqwag-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3803D811E67;
 Fri, 18 Nov 2022 17:41:43 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2EEE492B04;
 Fri, 18 Nov 2022 17:41:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] block: Don't poll in bdrv_replace_child_noperm()
Date: Fri, 18 Nov 2022 18:41:09 +0100
Message-Id: <20221118174110.55183-15-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to make sure that bdrv_replace_child_noperm() doesn't have to
poll any more, get rid of the bdrv_parent_drained_begin_single() call.

This is possible now because we can require that the parent is already
drained through the child in question when the function is called and we
don't call the parent drain callbacks more than once.

The additional drain calls needed in callers cause the test case to run
its code in the drain handler too early (bdrv_attach_child() drains
now), so modify it to only enable the code after the test setup has
completed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h     |   8 +++
 block.c                      | 103 ++++++++++++++++++++++++++++++-----
 block/io.c                   |   2 +-
 tests/unit/test-bdrv-drain.c |  10 ++++
 4 files changed, 108 insertions(+), 15 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 8f5e75756a..65e6d2569b 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -292,6 +292,14 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
  */
 void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
 
+/**
+ * bdrv_parent_drained_poll_single:
+ *
+ * Returns true if there is any pending activity to cease before @c can be
+ * called quiesced, false otherwise.
+ */
+bool bdrv_parent_drained_poll_single(BdrvChild *c);
+
 /**
  * bdrv_parent_drained_end_single:
  *
diff --git a/block.c b/block.c
index d18512944d..3f12aba6ce 100644
--- a/block.c
+++ b/block.c
@@ -2409,6 +2409,20 @@ static void bdrv_replace_child_abort(void *opaque)
 
     GLOBAL_STATE_CODE();
     /* old_bs reference is transparently moved from @s to @s->child */
+    if (!s->child->bs) {
+        /*
+         * The parents were undrained when removing old_bs from the child. New
+         * requests can't have been made, though, because the child was empty.
+         *
+         * TODO Make bdrv_replace_child_noperm() transactionable to avoid
+         * undraining the parent in the first place. Once this is done, having
+         * new_bs drained when calling bdrv_replace_child_tran() is not a
+         * requirement any more.
+         */
+        bdrv_parent_drained_begin_single(s->child, false);
+        assert(!bdrv_parent_drained_poll_single(s->child));
+    }
+    assert(s->child->quiesced_parent);
     bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2424,12 +2438,19 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  *
+ * Both @child->bs and @new_bs (if non-NULL) must be drained. @new_bs must be
+ * kept drained until the transaction is completed.
+ *
  * The function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+
+    assert(child->quiesced_parent);
+    assert(!new_bs || new_bs->quiesce_counter);
+
     *s = (BdrvReplaceChildState) {
         .child = child,
         .old_bs = child->bs,
@@ -2821,6 +2842,14 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
+/*
+ * Replaces the node that a BdrvChild points to without updating permissions.
+ *
+ * If @new_bs is non-NULL, the parent of @child must already be drained through
+ * @child.
+ *
+ * This function does not poll.
+ */
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
@@ -2828,6 +2857,28 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     int new_bs_quiesce_counter;
 
     assert(!child->frozen);
+
+    /*
+     * If we want to change the BdrvChild to point to a drained node as its new
+     * child->bs, we need to make sure that its new parent is drained, too. In
+     * other words, either child->quiesce_parent must already be true or we must
+     * be able to set it and keep the parent's quiesce_counter consistent with
+     * that, but without polling or starting new requests (this function
+     * guarantees that it doesn't poll, and starting new requests would be
+     * against the invariants of drain sections).
+     *
+     * To keep things simple, we pick the first option (child->quiesce_parent
+     * must already be true). We also generalise the rule a bit to make it
+     * easier to verify in callers and more likely to be covered in test cases:
+     * The parent must be quiesced through this child even if new_bs isn't
+     * currently drained.
+     *
+     * The only exception is for callers that always pass new_bs == NULL. In
+     * this case, we obviously never need to consider the case of a drained
+     * new_bs, so we can keep the callers simpler by allowing them not to drain
+     * the parent.
+     */
+    assert(!new_bs || child->quiesced_parent);
     assert(old_bs != new_bs);
     GLOBAL_STATE_CODE();
 
@@ -2835,15 +2886,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
-    /*
-     * If the new child node is drained but the old one was not, flush
-     * all outstanding requests to the old child node.
-     */
-    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
-    if (new_bs_quiesce_counter && !child->quiesced_parent) {
-        bdrv_parent_drained_begin_single(child, true);
-    }
-
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);
@@ -2863,11 +2905,9 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 
     /*
-     * If the old child node was drained but the new one is not, allow
-     * requests to come in only after the new node has been attached.
-     *
-     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
-     * polls, which could have changed the value.
+     * If the parent was drained through this BdrvChild previously, but new_bs
+     * is not drained, allow requests to come in only after the new node has
+     * been attached.
      */
     new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
     if (!new_bs_quiesce_counter && child->quiesced_parent) {
@@ -3004,6 +3044,24 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
+    /*
+     * Let every new BdrvChild start with a drained parent. Inserting the child
+     * in the graph with bdrv_replace_child_noperm() will undrain it if
+     * @child_bs is not drained.
+     *
+     * The child was only just created and is not yet visible in global state
+     * until bdrv_replace_child_noperm() inserts it into the graph, so nobody
+     * could have sent requests and polling is not necessary.
+     *
+     * Note that this means that the parent isn't fully drained yet, we only
+     * stop new requests from coming in. This is fine, we don't care about the
+     * old requests here, they are not for this child. If another place enters a
+     * drain section for the same parent, but wants it to be fully quiesced, it
+     * will not run most of the the code in .drained_begin() again (which is not
+     * a problem, we already did this), but it will still poll until the parent
+     * is fully quiesced, so it will not be negatively affected either.
+     */
+    bdrv_parent_drained_begin_single(new_child, false);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
@@ -5061,7 +5119,10 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     }
 
     if (child->bs) {
+        BlockDriverState *bs = child->bs;
+        bdrv_drained_begin(bs);
         bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_drained_end(bs);
     }
 
     tran_add(tran, &bdrv_remove_child_drv, child);
@@ -5078,6 +5139,15 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
+static void undrain_on_clean_cb(void *opaque)
+{
+    bdrv_drained_end(opaque);
+}
+
+static TransactionActionDrv undrain_on_clean = {
+    .clean = undrain_on_clean_cb,
+};
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -5087,6 +5157,11 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 
     GLOBAL_STATE_CODE();
 
+    bdrv_drained_begin(from);
+    bdrv_drained_begin(to);
+    tran_add(tran, &undrain_on_clean, from);
+    tran_add(tran, &undrain_on_clean, to);
+
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
diff --git a/block/io.c b/block/io.c
index 5e9150d92c..ae64830eac 100644
--- a/block/io.c
+++ b/block/io.c
@@ -81,7 +81,7 @@ static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
     }
 }
 
-static bool bdrv_parent_drained_poll_single(BdrvChild *c)
+bool bdrv_parent_drained_poll_single(BdrvChild *c)
 {
     if (c->klass->drained_poll) {
         return c->klass->drained_poll(c);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 172bc6debc..2686a8acee 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1654,6 +1654,7 @@ static void test_drop_intermediate_poll(void)
 
 
 typedef struct BDRVReplaceTestState {
+    bool setup_completed;
     bool was_drained;
     bool was_undrained;
     bool has_read;
@@ -1738,6 +1739,10 @@ static void bdrv_replace_test_drain_begin(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
+    if (!s->setup_completed) {
+        return;
+    }
+
     if (!s->drain_count) {
         s->drain_co = qemu_coroutine_create(bdrv_replace_test_drain_co, bs);
         bdrv_inc_in_flight(bs);
@@ -1769,6 +1774,10 @@ static void bdrv_replace_test_drain_end(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
+    if (!s->setup_completed) {
+        return;
+    }
+
     g_assert(s->drain_count > 0);
     if (!--s->drain_count) {
         s->was_undrained = true;
@@ -1867,6 +1876,7 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     bdrv_ref(old_child_bs);
     bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
                       BDRV_CHILD_COW, &error_abort);
+    parent_s->setup_completed = true;
 
     for (i = 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
-- 
2.38.1


