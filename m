Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76836F932
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:24:52 +0200 (CEST)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRGM-0005cU-Tx
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkh-0003r4-3e
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkf-0002Lk-0S
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnPX+OXfW1EhYVQN9E0uCMmUcqkJgA05kPNUrD4KWVI=;
 b=A5p6Q/JGEBKNMxm32sXIqpmblfAjPcLullEpbsj/ObSWptzZ958oo/keD4fCGLvCqqMrvV
 QWwGgvOX2tN5nzcp3vQ9AsQXBnlJdBhWnZXByX8O4SKEsdDjiTH4e44t7ufaYSMpL8OhNN
 /6lEyxE/WGpDrsMRHIYj3btYj1/+1Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-vBRhYz64Ozyg6oVG80pyTA-1; Fri, 30 Apr 2021 06:52:01 -0400
X-MC-Unique: vBRhYz64Ozyg6oVG80pyTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8359196A2;
 Fri, 30 Apr 2021 10:52:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99FC5F707;
 Fri, 30 Apr 2021 10:51:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/39] block: bdrv_append(): don't consume reference
Date: Fri, 30 Apr 2021 12:51:12 +0200
Message-Id: <20210430105147.125840-5-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We have too much comments for this feature. It seems better just don't
do it. Most of real users (tests don't count) have to create additional
reference.

Drop also comment in external_snapshot_prepare:
 - bdrv_append doesn't "remove" old bs in common sense, it sounds
   strange
 - the fact that bdrv_append can fail is obvious from the context
 - the fact that we must rollback all changes in transaction abort is
   known (it's the direct role of abort)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                          | 25 +++----------------------
 block/backup-top.c               |  1 -
 block/commit.c                   |  1 +
 block/mirror.c                   |  3 ---
 blockdev.c                       |  4 ----
 tests/unit/test-bdrv-drain.c     |  2 +-
 tests/unit/test-bdrv-graph-mod.c |  3 +++
 7 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/block.c b/block.c
index c5b887cec1..1e7e8907e4 100644
--- a/block.c
+++ b/block.c
@@ -3213,11 +3213,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
         goto out;
     }
 
-    /* bdrv_append() consumes a strong reference to bs_snapshot
-     * (i.e. it will call bdrv_unref() on it) even on error, so in
-     * order to be able to return one, we have to increase
-     * bs_snapshot's refcount here */
-    bdrv_ref(bs_snapshot);
     ret = bdrv_append(bs_snapshot, bs, errp);
     if (ret < 0) {
         bs_snapshot = NULL;
@@ -4679,36 +4674,22 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * bs_new must not be attached to a BlockBackend.
  *
  * This function does not create any image files.
- *
- * bdrv_append() takes ownership of a bs_new reference and unrefs it because
- * that's what the callers commonly need. bs_new will be referenced by the old
- * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
- * reference of its own, it must call bdrv_ref().
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
     int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
     if (ret < 0) {
-        goto out;
+        return ret;
     }
 
     ret = bdrv_replace_node(bs_top, bs_new, errp);
     if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        goto out;
+        return ret;
     }
 
-    ret = 0;
-
-out:
-    /*
-     * bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more.
-     */
-    bdrv_unref(bs_new);
-
-    return ret;
+    return 0;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/backup-top.c b/block/backup-top.c
index 589e8b651d..62d09f213e 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -234,7 +234,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     bdrv_drained_begin(source);
 
-    bdrv_ref(top);
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append backup-top filter: ");
diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..b89bb20b75 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -312,6 +312,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     commit_top_bs->total_sectors = top->total_sectors;
 
     ret = bdrv_append(commit_top_bs, top, errp);
+    bdrv_unref(commit_top_bs); /* referenced by new parents or failed */
     if (ret < 0) {
         commit_top_bs = NULL;
         goto fail;
diff --git a/block/mirror.c b/block/mirror.c
index 5a71bd8bbc..840b8e8c15 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1630,9 +1630,6 @@ static BlockJob *mirror_start_job(
 
     bs_opaque->is_commit = target_is_backing;
 
-    /* bdrv_append takes ownership of the mirror_top_bs reference, need to keep
-     * it alive until block_job_create() succeeds even if bs has no parent. */
-    bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
     ret = bdrv_append(mirror_top_bs, bs, errp);
     bdrv_drained_end(bs);
diff --git a/blockdev.c b/blockdev.c
index a57590aae4..834c2304a1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1576,10 +1576,6 @@ static void external_snapshot_prepare(BlkActionState *common,
         goto out;
     }
 
-    /* This removes our old bs and adds the new bs. This is an operation that
-     * can fail, so we need to do it in .prepare; undoing it for abort is
-     * always possible. */
-    bdrv_ref(state->new_bs);
     ret = bdrv_append(state->new_bs, state->old_bs, errp);
     if (ret < 0) {
         goto out;
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 8a29e33e00..892f7f47d8 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1478,7 +1478,6 @@ static void test_append_to_drained(void)
     g_assert_cmpint(base_s->drain_count, ==, 1);
     g_assert_cmpint(base->in_flight, ==, 0);
 
-    /* Takes ownership of overlay, so we don't have to unref it later */
     bdrv_append(overlay, base, &error_abort);
     g_assert_cmpint(base->in_flight, ==, 0);
     g_assert_cmpint(overlay->in_flight, ==, 0);
@@ -1495,6 +1494,7 @@ static void test_append_to_drained(void)
     g_assert_cmpint(overlay->quiesce_counter, ==, 0);
     g_assert_cmpint(overlay_s->drain_count, ==, 0);
 
+    bdrv_unref(overlay);
     bdrv_unref(base);
     blk_unref(blk);
 }
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 5b6934e68b..a6064b1863 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -138,6 +138,7 @@ static void test_update_perm_tree(void)
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
 
+    bdrv_unref(filter);
     blk_unref(root);
 }
 
@@ -202,6 +203,7 @@ static void test_should_update_child(void)
     bdrv_append(filter, bs, &error_abort);
     g_assert(target->backing->bs == bs);
 
+    bdrv_unref(filter);
     bdrv_unref(bs);
     blk_unref(root);
 }
@@ -380,6 +382,7 @@ static void test_append_greedy_filter(void)
                       &error_abort);
 
     bdrv_append(fl, base, &error_abort);
+    bdrv_unref(fl);
     bdrv_unref(top);
 }
 
-- 
2.30.2


