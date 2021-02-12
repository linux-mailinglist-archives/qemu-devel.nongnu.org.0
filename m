Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED231A84C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:28:21 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAhrI-00014O-Eq
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhl8-00046y-EA
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhl1-0005pu-Iw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xx3wy3tVuBVFZuca6BM7/y3wRBXUoxnjSOXmisKnxJ8=;
 b=QzKM+WQOmdazVYUI1fYIaGEINJU5YVlypaCaGwDD0gV6OK9SfxcQLECeki9zwTUUZVT9e8
 GM/3CxBk29c4Q6mmQIiqJ3/epklV2IQ85kNRjMaBYnM7v/hV930dJDqaxnaN9P66neyhzH
 LlbXO4xhMr0Vwiz35AiopufNiuFjCao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-FRDBMuHUM2mXShiGTPARng-1; Fri, 12 Feb 2021 18:21:46 -0500
X-MC-Unique: FRDBMuHUM2mXShiGTPARng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B59100A8E8;
 Fri, 12 Feb 2021 23:21:45 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC311F04C;
 Fri, 12 Feb 2021 23:21:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] block: use return status of bdrv_append()
Date: Fri, 12 Feb 2021 17:21:34 -0600
Message-Id: <20210212232134.1462756-6-eblake@redhat.com>
In-Reply-To: <20210212232134.1462756-1-eblake@redhat.com>
References: <20210212232134.1462756-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now bdrv_append returns status and we can drop all the local_err things
around it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-3-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block.c                     |  6 ++----
 block/backup-top.c          | 23 +++++++++++------------
 block/commit.c              |  6 ++----
 block/mirror.c              |  6 ++----
 blockdev.c                  |  6 +++---
 tests/test-bdrv-graph-mod.c |  6 +++---
 6 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/block.c b/block.c
index fdb0261cb324..c682c3e3b96b 100644
--- a/block.c
+++ b/block.c
@@ -3118,7 +3118,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
-    Error *local_err = NULL;
     int ret;

     /* if snapshot, we create a temporary backing file and open it
@@ -3165,9 +3164,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
      * order to be able to return one, we have to increase
      * bs_snapshot's refcount here */
     bdrv_ref(bs_snapshot);
-    bdrv_append(bs_snapshot, bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(bs_snapshot, bs, errp);
+    if (ret < 0) {
         bs_snapshot = NULL;
         goto out;
     }
diff --git a/block/backup-top.c b/block/backup-top.c
index 6e7e7bf34047..d1253e1aa63f 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -191,7 +191,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockCopyState **bcs,
                                          Error **errp)
 {
-    Error *local_err = NULL;
+    ERRP_GUARD();
+    int ret;
     BDRVBackupTopState *state;
     BlockDriverState *top;
     bool appended = false;
@@ -224,9 +225,9 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     bdrv_drained_begin(source);

     bdrv_ref(top);
-    bdrv_append(top, source, &local_err);
-    if (local_err) {
-        error_prepend(&local_err, "Cannot append backup-top filter: ");
+    ret = bdrv_append(top, source, errp);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append backup-top filter: ");
         goto fail;
     }
     appended = true;
@@ -236,19 +237,18 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
      * we want.
      */
     state->active = true;
-    bdrv_child_refresh_perms(top, top->backing, &local_err);
-    if (local_err) {
-        error_prepend(&local_err,
-                      "Cannot set permissions for backup-top filter: ");
+    ret = bdrv_child_refresh_perms(top, top->backing, errp);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot set permissions for backup-top filter: ");
         goto fail;
     }

     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
-                                      write_flags, &local_err);
-    if (local_err) {
-        error_prepend(&local_err, "Cannot create block-copy-state: ");
+                                      write_flags, errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
     *bcs = state->bcs;
@@ -266,7 +266,6 @@ fail:
     }

     bdrv_drained_end(source);
-    error_propagate(errp, local_err);

     return NULL;
 }
diff --git a/block/commit.c b/block/commit.c
index 71db7ba7472e..dd9ba87349e3 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -254,7 +254,6 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     BlockDriverState *iter;
     BlockDriverState *commit_top_bs = NULL;
     BlockDriverState *filtered_base;
-    Error *local_err = NULL;
     int64_t base_size, top_size;
     uint64_t base_perms, iter_shared_perms;
     int ret;
@@ -312,10 +311,9 @@ void commit_start(const char *job_id, BlockDriverState *bs,

     commit_top_bs->total_sectors = top->total_sectors;

-    bdrv_append(commit_top_bs, top, &local_err);
-    if (local_err) {
+    ret = bdrv_append(commit_top_bs, top, errp);
+    if (ret < 0) {
         commit_top_bs = NULL;
-        error_propagate(errp, local_err);
         goto fail;
     }

diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb57..fad270193888 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1560,7 +1560,6 @@ static BlockJob *mirror_start_job(
     BlockDriverState *mirror_top_bs;
     bool target_is_backing;
     uint64_t target_perms, target_shared_perms;
-    Error *local_err = NULL;
     int ret;

     if (granularity == 0) {
@@ -1609,12 +1608,11 @@ static BlockJob *mirror_start_job(
      * it alive until block_job_create() succeeds even if bs has no parent. */
     bdrv_ref(mirror_top_bs);
     bdrv_drained_begin(bs);
-    bdrv_append(mirror_top_bs, bs, &local_err);
+    ret = bdrv_append(mirror_top_bs, bs, errp);
     bdrv_drained_end(bs);

-    if (local_err) {
+    if (ret < 0) {
         bdrv_unref(mirror_top_bs);
-        error_propagate(errp, local_err);
         return NULL;
     }

diff --git a/blockdev.c b/blockdev.c
index b250b9b95957..cd438e60e35a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1432,6 +1432,7 @@ typedef struct ExternalSnapshotState {
 static void external_snapshot_prepare(BlkActionState *common,
                                       Error **errp)
 {
+    int ret;
     int flags = 0;
     QDict *options = NULL;
     Error *local_err = NULL;
@@ -1591,9 +1592,8 @@ static void external_snapshot_prepare(BlkActionState *common,
      * can fail, so we need to do it in .prepare; undoing it for abort is
      * always possible. */
     bdrv_ref(state->new_bs);
-    bdrv_append(state->new_bs, state->old_bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_append(state->new_bs, state->old_bs, errp);
+    if (ret < 0) {
         goto out;
     }
     state->overlay_appended = true;
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 8cff13830e3e..c4f7d1603924 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -101,7 +101,7 @@ static BlockDriverState *pass_through_node(const char *name)
  */
 static void test_update_perm_tree(void)
 {
-    Error *local_err = NULL;
+    int ret;

     BlockBackend *root = blk_new(qemu_get_aio_context(),
                                  BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ,
@@ -114,8 +114,8 @@ static void test_update_perm_tree(void)
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
                       BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);

-    bdrv_append(filter, bs, &local_err);
-    error_free_or_abort(&local_err);
+    ret = bdrv_append(filter, bs, NULL);
+    g_assert_cmpint(ret, <, 0);

     blk_unref(root);
 }
-- 
2.30.1


