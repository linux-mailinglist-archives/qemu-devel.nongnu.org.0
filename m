Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C962FBD7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 18:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5N4-0006Fl-87; Fri, 18 Nov 2022 12:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N2-0006Ez-6v
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow5N0-0002Wq-4o
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 12:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668793300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZspY1pPG1TBUsDd3/+dXuqcSxx8Xz11E2aWhPzOFl4=;
 b=Jc85RCir756fCmCq4VWNnaBuf7WCpU01IRmLB0rNsHzBSDOdQ5jDEwWgEr1UT+8pphfVse
 d/CNdCbWD9ipzD21VNw8TeuambArwBmfWylRlSQLjxHfAdpZ5i2B9yytGOOhxx9v7Bzf3l
 KZ5Fr1ulDyy2QpBw614cW1pImjmL/HI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-k3AZ9RRKMbKjVlKjF7dAIQ-1; Fri, 18 Nov 2022 12:41:39 -0500
X-MC-Unique: k3AZ9RRKMbKjVlKjF7dAIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC002811E7A;
 Fri, 18 Nov 2022 17:41:38 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE37492B04;
 Fri, 18 Nov 2022 17:41:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] block: Call drain callbacks only once
Date: Fri, 18 Nov 2022 18:41:06 +0100
Message-Id: <20221118174110.55183-12-kwolf@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
References: <20221118174110.55183-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We only need to call both the BlockDriver's callback and the parent
callbacks when going from undrained to drained or vice versa. A second
drain section doesn't make a difference for the driver or the parent,
they weren't supposed to send new requests before and after the second
drain.

One thing that gets in the way is the 'ignore_bds_parents' parameter in
bdrv_do_drained_begin_quiesce() and bdrv_do_drained_end(): It means that
bdrv_drain_all_begin() increases bs->quiesce_counter, but does not
quiesce the parent through BdrvChildClass callbacks. If an additional
drain section is started now, bs->quiesce_counter will be non-zero, but
we would still need to quiesce the parent through BdrvChildClass in
order to keep things consistent (and unquiesce it on the matching
bdrv_drained_end(), even though the counter would reach 0 yet as long as
the bdrv_drain_all() section is still active).

Instead of keeping track of this, let's just get rid of the parameter.
It was introduced in commit 6cd5c9d7b2d as an optimisation so that
during bdrv_drain_all(), we wouldn't recursively drain all parents up to
the root for each node, resulting in quadratic complexity. As it happens,
calling the callbacks only once solves the same problem, so as of this
patch, we'll still have O(n) complexity and ignore_bds_parents is not
needed any more.

This patch only ignores the 'ignore_bds_parents' parameter. It will be
removed in a separate patch.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int-common.h |  8 ++++----
 block.c                          | 25 +++++++------------------
 block/io.c                       | 30 ++++++++++++++++++------------
 tests/unit/test-bdrv-drain.c     | 16 ++++++++++------
 4 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 791dddfd7d..a6bc6b7fe9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -980,13 +980,13 @@ struct BdrvChild {
     bool frozen;
 
     /*
-     * How many times the parent of this child has been drained
+     * True if the parent of this child has been drained by this BdrvChild
      * (through klass->drained_*).
-     * Usually, this is equal to bs->quiesce_counter (potentially
-     * reduced by bdrv_drain_all_count).  It may differ while the
+     *
+     * It is generally true if bs->quiesce_counter > 0. It may differ while the
      * child is entering or leaving a drained section.
      */
-    int parent_quiesce_counter;
+    bool quiesced_parent;
 
     QLIST_ENTRY(BdrvChild) next;
     QLIST_ENTRY(BdrvChild) next_parent;
diff --git a/block.c b/block.c
index c589c3432b..6b41a252e4 100644
--- a/block.c
+++ b/block.c
@@ -2826,7 +2826,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
 {
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
-    int drain_saldo;
 
     assert(!child->frozen);
     assert(old_bs != new_bs);
@@ -2836,16 +2835,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
-    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
-    drain_saldo = new_bs_quiesce_counter - child->parent_quiesce_counter;
-
     /*
      * If the new child node is drained but the old one was not, flush
      * all outstanding requests to the old child node.
      */
-    while (drain_saldo > 0 && child->klass->drained_begin) {
+    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
+    if (new_bs_quiesce_counter && !child->quiesced_parent) {
         bdrv_parent_drained_begin_single(child, true);
-        drain_saldo--;
     }
 
     if (old_bs) {
@@ -2861,16 +2857,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     if (new_bs) {
         assert_bdrv_graph_writable(new_bs);
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
-
-        /*
-         * Polling in bdrv_parent_drained_begin_single() may have led to the new
-         * node's quiesce_counter having been decreased.  Not a problem, we just
-         * need to recognize this here and then invoke drained_end appropriately
-         * more often.
-         */
-        assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);
-        drain_saldo += new_bs->quiesce_counter - new_bs_quiesce_counter;
-
         if (child->klass->attach) {
             child->klass->attach(child);
         }
@@ -2879,10 +2865,13 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     /*
      * If the old child node was drained but the new one is not, allow
      * requests to come in only after the new node has been attached.
+     *
+     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
+     * polls, which could have changed the value.
      */
-    while (drain_saldo < 0 && child->klass->drained_end) {
+    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
+    if (!new_bs_quiesce_counter && child->quiesced_parent) {
         bdrv_parent_drained_end_single(child);
-        drain_saldo++;
     }
 }
 
diff --git a/block/io.c b/block/io.c
index 75224480d0..87d6f22ec4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -62,8 +62,9 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
 {
     IO_OR_GS_CODE();
 
-    assert(c->parent_quiesce_counter > 0);
-    c->parent_quiesce_counter--;
+    assert(c->quiesced_parent);
+    c->quiesced_parent = false;
+
     if (c->klass->drained_end) {
         c->klass->drained_end(c);
     }
@@ -110,7 +111,10 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 {
     AioContext *ctx = bdrv_child_get_parent_aio_context(c);
     IO_OR_GS_CODE();
-    c->parent_quiesce_counter++;
+
+    assert(!c->quiesced_parent);
+    c->quiesced_parent = true;
+
     if (c->klass->drained_begin) {
         c->klass->drained_begin(c);
     }
@@ -358,11 +362,12 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
         aio_disable_external(bdrv_get_aio_context(bs));
-    }
 
-    bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
-    if (bs->drv && bs->drv->bdrv_drain_begin) {
-        bs->drv->bdrv_drain_begin(bs);
+        /* TODO Remove ignore_bds_parents, we don't consider it any more */
+        bdrv_parent_drained_begin(bs, parent, false);
+        if (bs->drv && bs->drv->bdrv_drain_begin) {
+            bs->drv->bdrv_drain_begin(bs);
+        }
     }
 }
 
@@ -413,13 +418,14 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent,
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
-    if (bs->drv && bs->drv->bdrv_drain_end) {
-        bs->drv->bdrv_drain_end(bs);
-    }
-    bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
-
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
     if (old_quiesce_counter == 1) {
+        if (bs->drv && bs->drv->bdrv_drain_end) {
+            bs->drv->bdrv_drain_end(bs);
+        }
+        /* TODO Remove ignore_bds_parents, we don't consider it any more */
+        bdrv_parent_drained_end(bs, parent, false);
+
         aio_enable_external(bdrv_get_aio_context(bs));
     }
 }
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index dda08de8db..172bc6debc 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -296,7 +296,11 @@ static void test_quiesce_common(enum drain_type drain_type, bool recursive)
 
     do_drain_begin(drain_type, bs);
 
-    g_assert_cmpint(bs->quiesce_counter, ==, 1);
+    if (drain_type == BDRV_DRAIN_ALL) {
+        g_assert_cmpint(bs->quiesce_counter, ==, 2);
+    } else {
+        g_assert_cmpint(bs->quiesce_counter, ==, 1);
+    }
     g_assert_cmpint(backing->quiesce_counter, ==, !!recursive);
 
     do_drain_end(drain_type, bs);
@@ -348,8 +352,8 @@ static void test_nested(void)
 
     for (outer = 0; outer < DRAIN_TYPE_MAX; outer++) {
         for (inner = 0; inner < DRAIN_TYPE_MAX; inner++) {
-            int backing_quiesce = (outer != BDRV_DRAIN) +
-                                  (inner != BDRV_DRAIN);
+            int backing_quiesce = (outer == BDRV_DRAIN_ALL) +
+                                  (inner == BDRV_DRAIN_ALL);
 
             g_assert_cmpint(bs->quiesce_counter, ==, 0);
             g_assert_cmpint(backing->quiesce_counter, ==, 0);
@@ -359,10 +363,10 @@ static void test_nested(void)
             do_drain_begin(outer, bs);
             do_drain_begin(inner, bs);
 
-            g_assert_cmpint(bs->quiesce_counter, ==, 2);
+            g_assert_cmpint(bs->quiesce_counter, ==, 2 + !!backing_quiesce);
             g_assert_cmpint(backing->quiesce_counter, ==, backing_quiesce);
-            g_assert_cmpint(s->drain_count, ==, 2);
-            g_assert_cmpint(backing_s->drain_count, ==, backing_quiesce);
+            g_assert_cmpint(s->drain_count, ==, 1);
+            g_assert_cmpint(backing_s->drain_count, ==, !!backing_quiesce);
 
             do_drain_end(inner, bs);
             do_drain_end(outer, bs);
-- 
2.38.1


