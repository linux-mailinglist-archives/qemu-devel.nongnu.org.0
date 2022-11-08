Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470A6210F3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNsW-0008UK-BO; Tue, 08 Nov 2022 07:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrz-0007tI-6W
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrp-0001Rp-Ih
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjuET9HJG9ScGKWOrNVDYGN8n+xDQgxMJi2xcyZvQqU=;
 b=Np4NwvCR9zmbm6lZRKHu3F5eblLmz/fcCzA9eYCbZ4Jhxvx0QftT1ysz9IMeJAu1uoVku1
 OYVXD5yEkwIdMla5Wr5JO0l5OOzOfyNzfIaSroH/fgOYn1tZ8+wK82tfV7nwO0FUy8gx4l
 reRiU8tbzvmJyXmDugcMmhkhCpTR5sY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-6Z2pHzPDMHWLuNxe2LljJA-1; Tue, 08 Nov 2022 07:38:09 -0500
X-MC-Unique: 6Z2pHzPDMHWLuNxe2LljJA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58922811E81;
 Tue,  8 Nov 2022 12:38:09 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A299E70;
 Tue,  8 Nov 2022 12:38:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 12/13] block: Don't poll in bdrv_replace_child_noperm()
Date: Tue,  8 Nov 2022 13:37:37 +0100
Message-Id: <20221108123738.530873-13-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is possible now because we can require that the child is already
drained when the function is called (it better be, having in-flight
requests while modifying the graph isn't going to end well!) and we
don't call the parent drain callbacks more than once.

The additional drain calls needed in callers cause the test case to run
its code in the drain handler too early (bdrv_attach_child() drains
now), so modify it to only enable the code after the test setup has
completed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h     |  8 ++++
 block.c                      | 72 +++++++++++++++++++++++++-----------
 block/io.c                   |  2 +-
 tests/unit/test-bdrv-drain.c | 10 +++++
 4 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 5b54ed4672..ddce8550a9 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -290,6 +290,14 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
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
index 5f5f79cd16..12039e9b8a 100644
--- a/block.c
+++ b/block.c
@@ -2399,6 +2399,20 @@ static void bdrv_replace_child_abort(void *opaque)
 
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
+    assert(s->child->parent_quiesce_counter);
     bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2414,12 +2428,20 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  *
+ * Both child and new_bs (if non-NULL) must be drained. new_bs must be kept
+ * drained until the transaction is completed (this automatically implies that
+ * child remains drained, too).
+ *
  * The function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+
+    assert(child->parent_quiesce_counter);
+    assert(!new_bs || new_bs->quiesce_counter);
+
     *s = (BdrvReplaceChildState) {
         .child = child,
         .old_bs = child->bs,
@@ -2818,6 +2840,12 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     int new_bs_quiesce_counter;
 
     assert(!child->frozen);
+    /*
+     * When removing the child, it's the callers responsibility to make sure
+     * that no requests are in flight any more. Usually the parent is drained,
+     * but not through child->parent_quiesce_counter.
+     */
+    assert(!new_bs || child->parent_quiesce_counter);
     assert(old_bs != new_bs);
     GLOBAL_STATE_CODE();
 
@@ -2825,16 +2853,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
-    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
-
-    /*
-     * If the new child node is drained but the old one was not, flush
-     * all outstanding requests to the old child node.
-     */
-    if (new_bs_quiesce_counter && !child->parent_quiesce_counter) {
-        bdrv_parent_drained_begin_single(child, true);
-    }
-
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);
@@ -2849,14 +2867,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
 
-        /*
-         * Polling in bdrv_parent_drained_begin_single() may have led to the new
-         * node's quiesce_counter having been decreased.  Not a problem, we just
-         * need to recognize this here and then invoke drained_end appropriately
-         * more often.
-         */
-        assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);
-
         if (child->klass->attach) {
             child->klass->attach(child);
         }
@@ -2865,9 +2875,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     /*
      * If the old child node was drained but the new one is not, allow
      * requests to come in only after the new node has been attached.
-     *
-     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
-     * polls, which could have changed the value.
      */
     new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
     if (!new_bs_quiesce_counter && child->parent_quiesce_counter) {
@@ -3004,6 +3011,12 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
+    /*
+     * Let every new BdrvChild start drained, inserting it in the graph with
+     * bdrv_replace_child_noperm() will undrain it if the child node is not
+     * drained. The child was only just created, so polling is not necessary.
+     */
+    bdrv_parent_drained_begin_single(new_child, false);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
@@ -5053,7 +5066,10 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     }
 
     if (child->bs) {
+        BlockDriverState *bs = child->bs;
+        bdrv_drained_begin(bs);
         bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_drained_end(bs);
     }
 
     tran_add(tran, &bdrv_remove_child_drv, child);
@@ -5070,6 +5086,15 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
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
@@ -5079,6 +5104,11 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 
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
index 4a83359a8f..d0f641926f 100644
--- a/block/io.c
+++ b/block/io.c
@@ -80,7 +80,7 @@ static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
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


