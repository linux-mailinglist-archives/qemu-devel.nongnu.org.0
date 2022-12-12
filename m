Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950B649F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPB-0000eH-7R; Mon, 12 Dec 2022 07:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP8-0000ab-T3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP7-0000YK-0L
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSV1TeijoZsmxAvrhyYs0t9/sSLc9dqrPATrVhnl4kI=;
 b=Mt2UNvefytq8mcfBt6dAQV9qrxArqa+v/ai9LWqXiK52Nff3wKRdcqwaiJjXagxhXnBw1U
 JJIMyYeIQCZddCga7/cOjkR5PhxNR3KmNQ4XAFQbV3sIYfdOeDpb0vFv/7sTYL7qoPRyQh
 4Kfrys9nJ7va8bDWtI2HRfXjv8YquOk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-JjHThkunPl6MY_O5ADbXqA-1; Mon, 12 Dec 2022 07:59:31 -0500
X-MC-Unique: JjHThkunPl6MY_O5ADbXqA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso1972351wmi.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rSV1TeijoZsmxAvrhyYs0t9/sSLc9dqrPATrVhnl4kI=;
 b=DgWCDNPQeQxz4sgthkMw30BdM8lcKaAiS1wo62a90E2nDKjTFmW1CVfWgKEG3huTW7
 ZYVvk3YnpJxNqJr+fD8oquIpBcr0yjJF7C2dNBj9/MVY8lcrQ8dQARgNEvShLn7ToqmM
 54Ijl76QSYixCC/3sJOye+7XFQOFhFyxPLM4hadKlC++akgKlJ4TpGIvjXrmvlBHvyDx
 4ECFlTVetKnq1Q/pp4vQ5sR4piSFkyEnmjymJvO3C+lDFET9g5aBJdqzwBg0msICRoa4
 U287Om+ZX1o/8erA3TweLfo1c4ITRGgPPUKkpisxkwYEpPiy/ZGQKfIIvP/yFt1byWoO
 ddwA==
X-Gm-Message-State: ANoB5pmb1BwQilZjcpffnpgexuxkiY6x+vuwhjDeoKBhVITMLfcKU8AT
 ALe+V/BW7H0VmpPWp7iExKu0X3RAi+m2wPlraR9TVyaPeBY+e96kYX/OiP5mElQWTZy/36Yq+3N
 5J0jH1nUOH4Gh+Fzd6g97iQ6UoCpIvFPBvSt7nTByFWIF9jOzrI5dzqFOfGYCdQ06hjY=
X-Received: by 2002:a05:600c:3d19:b0:3d0:bd9:edd4 with SMTP id
 bh25-20020a05600c3d1900b003d00bd9edd4mr12339469wmb.0.1670849969852; 
 Mon, 12 Dec 2022 04:59:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/UqhHoj7+mwT9ZDOmXABBepgcA1dgGsGzskUgJghdLD7clnC2xMzw7j5RvUH3O2unyxZZUw==
X-Received: by 2002:a05:600c:3d19:b0:3d0:bd9:edd4 with SMTP id
 bh25-20020a05600c3d1900b003d00bd9edd4mr12339441wmb.0.1670849969216; 
 Mon, 12 Dec 2022 04:59:29 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a05600c54c300b003d220ef3232sm5885669wmb.34.2022.12.12.04.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 02/15] Revert "block: Don't poll in
 bdrv_replace_child_noperm()"
Date: Mon, 12 Dec 2022 13:59:07 +0100
Message-Id: <20221212125920.248567-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

This reverts commit a4e5c80a45b22359cf9c187f0df4f8544812c55c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                      | 103 +++++------------------------------
 block/io.c                   |   2 +-
 include/block/block-io.h     |   8 ---
 tests/unit/test-bdrv-drain.c |  10 ----
 4 files changed, 15 insertions(+), 108 deletions(-)

diff --git a/block.c b/block.c
index 87022f4cd971..2f2123f4a4e5 100644
--- a/block.c
+++ b/block.c
@@ -2367,20 +2367,6 @@ static void bdrv_replace_child_abort(void *opaque)
 
     GLOBAL_STATE_CODE();
     /* old_bs reference is transparently moved from @s to @s->child */
-    if (!s->child->bs) {
-        /*
-         * The parents were undrained when removing old_bs from the child. New
-         * requests can't have been made, though, because the child was empty.
-         *
-         * TODO Make bdrv_replace_child_noperm() transactionable to avoid
-         * undraining the parent in the first place. Once this is done, having
-         * new_bs drained when calling bdrv_replace_child_tran() is not a
-         * requirement any more.
-         */
-        bdrv_parent_drained_begin_single(s->child, false);
-        assert(!bdrv_parent_drained_poll_single(s->child));
-    }
-    assert(s->child->quiesced_parent);
     bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2396,19 +2382,12 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * Note: real unref of old_bs is done only on commit.
  *
- * Both @child->bs and @new_bs (if non-NULL) must be drained. @new_bs must be
- * kept drained until the transaction is completed.
- *
  * The function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
-
-    assert(child->quiesced_parent);
-    assert(!new_bs || new_bs->quiesce_counter);
-
     *s = (BdrvReplaceChildState) {
         .child = child,
         .old_bs = child->bs,
@@ -2831,14 +2810,6 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-/*
- * Replaces the node that a BdrvChild points to without updating permissions.
- *
- * If @new_bs is non-NULL, the parent of @child must already be drained through
- * @child.
- *
- * This function does not poll.
- */
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
@@ -2846,28 +2817,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     int new_bs_quiesce_counter;
 
     assert(!child->frozen);
-
-    /*
-     * If we want to change the BdrvChild to point to a drained node as its new
-     * child->bs, we need to make sure that its new parent is drained, too. In
-     * other words, either child->quiesce_parent must already be true or we must
-     * be able to set it and keep the parent's quiesce_counter consistent with
-     * that, but without polling or starting new requests (this function
-     * guarantees that it doesn't poll, and starting new requests would be
-     * against the invariants of drain sections).
-     *
-     * To keep things simple, we pick the first option (child->quiesce_parent
-     * must already be true). We also generalise the rule a bit to make it
-     * easier to verify in callers and more likely to be covered in test cases:
-     * The parent must be quiesced through this child even if new_bs isn't
-     * currently drained.
-     *
-     * The only exception is for callers that always pass new_bs == NULL. In
-     * this case, we obviously never need to consider the case of a drained
-     * new_bs, so we can keep the callers simpler by allowing them not to drain
-     * the parent.
-     */
-    assert(!new_bs || child->quiesced_parent);
     assert(old_bs != new_bs);
     GLOBAL_STATE_CODE();
 
@@ -2875,6 +2824,15 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
     }
 
+    /*
+     * If the new child node is drained but the old one was not, flush
+     * all outstanding requests to the old child node.
+     */
+    new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
+    if (new_bs_quiesce_counter && !child->quiesced_parent) {
+        bdrv_parent_drained_begin_single(child, true);
+    }
+
     if (old_bs) {
         if (child->klass->detach) {
             child->klass->detach(child);
@@ -2894,9 +2852,11 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 
     /*
-     * If the parent was drained through this BdrvChild previously, but new_bs
-     * is not drained, allow requests to come in only after the new node has
-     * been attached.
+     * If the old child node was drained but the new one is not, allow
+     * requests to come in only after the new node has been attached.
+     *
+     * Update new_bs_quiesce_counter because bdrv_parent_drained_begin_single()
+     * polls, which could have changed the value.
      */
     new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter : 0);
     if (!new_bs_quiesce_counter && child->quiesced_parent) {
@@ -3033,24 +2993,6 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    /*
-     * Let every new BdrvChild start with a drained parent. Inserting the child
-     * in the graph with bdrv_replace_child_noperm() will undrain it if
-     * @child_bs is not drained.
-     *
-     * The child was only just created and is not yet visible in global state
-     * until bdrv_replace_child_noperm() inserts it into the graph, so nobody
-     * could have sent requests and polling is not necessary.
-     *
-     * Note that this means that the parent isn't fully drained yet, we only
-     * stop new requests from coming in. This is fine, we don't care about the
-     * old requests here, they are not for this child. If another place enters a
-     * drain section for the same parent, but wants it to be fully quiesced, it
-     * will not run most of the the code in .drained_begin() again (which is not
-     * a problem, we already did this), but it will still poll until the parent
-     * is fully quiesced, so it will not be negatively affected either.
-     */
-    bdrv_parent_drained_begin_single(new_child, false);
     bdrv_replace_child_noperm(new_child, child_bs);
 
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
@@ -5096,24 +5038,12 @@ static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
     }
 
     if (child->bs) {
-        BlockDriverState *bs = child->bs;
-        bdrv_drained_begin(bs);
         bdrv_replace_child_tran(child, NULL, tran);
-        bdrv_drained_end(bs);
     }
 
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
-static void undrain_on_clean_cb(void *opaque)
-{
-    bdrv_drained_end(opaque);
-}
-
-static TransactionActionDrv undrain_on_clean = {
-    .clean = undrain_on_clean_cb,
-};
-
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, Transaction *tran,
@@ -5123,11 +5053,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 
     GLOBAL_STATE_CODE();
 
-    bdrv_drained_begin(from);
-    bdrv_drained_begin(to);
-    tran_add(tran, &undrain_on_clean, from);
-    tran_add(tran, &undrain_on_clean, to);
-
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
diff --git a/block/io.c b/block/io.c
index aee6e70c1496..571ff8c6493a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -81,7 +81,7 @@ static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
     }
 }
 
-bool bdrv_parent_drained_poll_single(BdrvChild *c)
+static bool bdrv_parent_drained_poll_single(BdrvChild *c)
 {
     if (c->klass->drained_poll) {
         return c->klass->drained_poll(c);
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 75d043204355..0e0cd1249705 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -313,14 +313,6 @@ bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
  */
 void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll);
 
-/**
- * bdrv_parent_drained_poll_single:
- *
- * Returns true if there is any pending activity to cease before @c can be
- * called quiesced, false otherwise.
- */
-bool bdrv_parent_drained_poll_single(BdrvChild *c);
-
 /**
  * bdrv_parent_drained_end_single:
  *
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2686a8aceee1..172bc6debc23 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1654,7 +1654,6 @@ static void test_drop_intermediate_poll(void)
 
 
 typedef struct BDRVReplaceTestState {
-    bool setup_completed;
     bool was_drained;
     bool was_undrained;
     bool has_read;
@@ -1739,10 +1738,6 @@ static void bdrv_replace_test_drain_begin(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
-    if (!s->setup_completed) {
-        return;
-    }
-
     if (!s->drain_count) {
         s->drain_co = qemu_coroutine_create(bdrv_replace_test_drain_co, bs);
         bdrv_inc_in_flight(bs);
@@ -1774,10 +1769,6 @@ static void bdrv_replace_test_drain_end(BlockDriverState *bs)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
-    if (!s->setup_completed) {
-        return;
-    }
-
     g_assert(s->drain_count > 0);
     if (!--s->drain_count) {
         s->was_undrained = true;
@@ -1876,7 +1867,6 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     bdrv_ref(old_child_bs);
     bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
                       BDRV_CHILD_COW, &error_abort);
-    parent_s->setup_completed = true;
 
     for (i = 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
-- 
2.38.1


