Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B533BECC8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:04:45 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Aya-0006Rt-3w
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asx-0003Et-EW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m1Asq-0000Fo-8u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625677127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rswzJXH8bwvgyNwKg4ziOWeRNp/6ufT2/ZqioPRfpU0=;
 b=BUohny2rNZDN81+TUg44SUaomtfIi4Y5RdPc+GjxInGb0+vVTsgwTJOYp8VdGHtx6Y5G0m
 sZfusXLQrClwEn2xmE54y9ZFrEs52oh+G4CRTO4b+AwA58pG5DCfNs030HGKzG7cmqVGvW
 0Y06iWsRTJF+E4ZzlCKsOao88NbRLKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-1emrBgcwNIqM-Lm1ifTGVg-1; Wed, 07 Jul 2021 12:58:46 -0400
X-MC-Unique: 1emrBgcwNIqM-Lm1ifTGVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B1A362F9;
 Wed,  7 Jul 2021 16:58:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0C46100EB3D;
 Wed,  7 Jul 2021 16:58:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 6/6] jobs: remove unnecessary AioContext aquire/release
 pairs
Date: Wed,  7 Jul 2021 18:58:13 +0200
Message-Id: <20210707165813.55361-7-eesposit@redhat.com>
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we use the job_mutex, remove unnecessary aio_context_acquire/release
pairs. However, some place still needs it, so try to reduce the
aio_context critical section to the minimum.

This patch is separated from the one before because here we are removing
locks without substituting it with aiocontext_acquire/release pairs.

These sections will also be removed in future, when the underlaying bdrv_*
API will also be free of context locks.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/mirror.c                 |   6 ++
 block/monitor/block-hmp-cmds.c |   6 --
 blockdev.c                     | 173 ++++++++-------------------------
 blockjob.c                     |   3 +
 job.c                          |   9 +-
 qemu-img.c                     |   4 -
 6 files changed, 54 insertions(+), 147 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index deefaa6a39..8d30c53690 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1857,6 +1857,7 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
 {
     bool is_none_mode;
     BlockDriverState *base;
+    AioContext *aio_context;
 
     if ((mode == MIRROR_SYNC_MODE_INCREMENTAL) ||
         (mode == MIRROR_SYNC_MODE_BITMAP)) {
@@ -1866,11 +1867,16 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
     }
     is_none_mode = mode == MIRROR_SYNC_MODE_NONE;
     base = mode == MIRROR_SYNC_MODE_TOP ? bdrv_backing_chain_next(bs) : NULL;
+
+    aio_context = bdrv_get_aio_context(bs);
+    aio_context_acquire(aio_context);
     mirror_start_job(job_id, bs, creation_flags, target, replaces,
                      speed, granularity, buf_size, backing_mode, zero_target,
                      on_source_error, on_target_error, unmap, NULL, NULL,
                      &mirror_job_driver, is_none_mode, base, false,
                      filter_node_name, true, copy_mode, errp);
+    aio_context_release(aio_context);
+
 }
 
 BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 3e6670c963..99095afae7 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -206,7 +206,6 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         ret = blk_commit_all();
     } else {
         BlockDriverState *bs;
-        AioContext *aio_context;
 
         blk = blk_by_name(device);
         if (!blk) {
@@ -219,12 +218,7 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
         }
 
         bs = bdrv_skip_implicit_filters(blk_bs(blk));
-        aio_context = bdrv_get_aio_context(bs);
-        aio_context_acquire(aio_context);
-
         ret = bdrv_commit(bs);
-
-        aio_context_release(aio_context);
     }
     if (ret < 0) {
         error_report("'commit' error for '%s': %s", device, strerror(-ret));
diff --git a/blockdev.c b/blockdev.c
index 9255aea6a2..119cb9a539 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -147,13 +147,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         if (block_job_has_bdrv(job, blk_bs(blk))) {
-            AioContext *aio_context = job_get_aiocontext(&job->job);
-            aio_context_acquire(aio_context);
-
             job_lock();
             job_cancel(&job->job, false);
-
-            aio_context_release(aio_context);
             job_unlock();
         }
     }
@@ -1714,7 +1709,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     }
 
     aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
 
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
@@ -1726,7 +1720,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
 
     /* Early check to avoid creating target */
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_BACKUP_SOURCE, errp)) {
-        goto out;
+        return;
     }
 
     flags = bs->open_flags | BDRV_O_RDWR;
@@ -1756,7 +1750,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     size = bdrv_getlength(bs);
     if (size < 0) {
         error_setg_errno(errp, -size, "bdrv_getlength failed");
-        goto out;
+        return;
     }
 
     if (backup->mode != NEW_IMAGE_MODE_EXISTING) {
@@ -1779,7 +1773,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
 
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     options = qdict_new();
@@ -1791,12 +1785,11 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
 
     target_bs = bdrv_open(backup->target, NULL, options, flags, errp);
     if (!target_bs) {
-        goto out;
+        return;
     }
 
     /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
-    aio_context_release(aio_context);
     aio_context_acquire(old_context);
 
     ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
@@ -1807,7 +1800,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     }
 
     aio_context_release(old_context);
-    aio_context_acquire(aio_context);
 
     if (set_backing_hd) {
         if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
@@ -1816,29 +1808,21 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     }
 
     state->bs = bs;
-
+    aio_context_acquire(aio_context);
     state->job = do_backup_common(qapi_DriveBackup_base(backup),
                                   bs, target_bs, aio_context,
                                   common->block_job_txn, errp);
-
+    aio_context_release(aio_context);
 unref:
     bdrv_unref(target_bs);
-out:
-    aio_context_release(aio_context);
 }
 
 static void drive_backup_commit(BlkActionState *common)
 {
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
 
     assert(state->job);
     job_start(&state->job->job);
-
-    aio_context_release(aio_context);
 }
 
 static void drive_backup_abort(BlkActionState *common)
@@ -1846,32 +1830,18 @@ static void drive_backup_abort(BlkActionState *common)
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_cancel_sync(&state->job->job);
-
-        aio_context_release(aio_context);
     }
 }
 
 static void drive_backup_clean(BlkActionState *common)
 {
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
-    AioContext *aio_context;
 
-    if (!state->bs) {
-        return;
+    if (state->bs) {
+        bdrv_drained_end(state->bs);
     }
 
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
-    bdrv_drained_end(state->bs);
-
-    aio_context_release(aio_context);
 }
 
 typedef struct BlockdevBackupState {
@@ -1931,15 +1901,9 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
 static void blockdev_backup_commit(BlkActionState *common)
 {
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
-    AioContext *aio_context;
-
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
 
     assert(state->job);
     job_start(&state->job->job);
-
-    aio_context_release(aio_context);
 }
 
 static void blockdev_backup_abort(BlkActionState *common)
@@ -1947,32 +1911,17 @@ static void blockdev_backup_abort(BlkActionState *common)
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
 
     if (state->job) {
-        AioContext *aio_context;
-
-        aio_context = bdrv_get_aio_context(state->bs);
-        aio_context_acquire(aio_context);
-
         job_cancel_sync(&state->job->job);
-
-        aio_context_release(aio_context);
     }
 }
 
 static void blockdev_backup_clean(BlkActionState *common)
 {
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
-    AioContext *aio_context;
 
-    if (!state->bs) {
-        return;
+    if (state->bs) {
+        bdrv_drained_end(state->bs);
     }
-
-    aio_context = bdrv_get_aio_context(state->bs);
-    aio_context_acquire(aio_context);
-
-    bdrv_drained_end(state->bs);
-
-    aio_context_release(aio_context);
 }
 
 typedef struct BlockDirtyBitmapState {
@@ -2486,7 +2435,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *bs, *iter, *iter_end;
     BlockDriverState *base_bs = NULL;
     BlockDriverState *bottom_bs = NULL;
-    AioContext *aio_context;
     Error *local_err = NULL;
     int job_flags = JOB_DEFAULT;
 
@@ -2517,52 +2465,46 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (has_base) {
         base_bs = bdrv_find_backing_image(bs, base);
         if (base_bs == NULL) {
             error_setg(errp, "Can't find '%s' in the backing chain", base);
-            goto out;
+            return;
         }
-        assert(bdrv_get_aio_context(base_bs) == aio_context);
     }
 
     if (has_base_node) {
         base_bs = bdrv_lookup_bs(NULL, base_node, errp);
         if (!base_bs) {
-            goto out;
+            return;
         }
         if (bs == base_bs || !bdrv_chain_contains(bs, base_bs)) {
             error_setg(errp, "Node '%s' is not a backing image of '%s'",
                        base_node, device);
-            goto out;
+            return;
         }
-        assert(bdrv_get_aio_context(base_bs) == aio_context);
         bdrv_refresh_filename(base_bs);
     }
 
     if (has_bottom) {
         bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
         if (!bottom_bs) {
-            goto out;
+            return;
         }
         if (!bottom_bs->drv) {
             error_setg(errp, "Node '%s' is not open", bottom);
-            goto out;
+            return;
         }
         if (bottom_bs->drv->is_filter) {
             error_setg(errp, "Node '%s' is a filter, use a non-filter node "
                        "as 'bottom'", bottom);
-            goto out;
+            return;
         }
         if (!bdrv_chain_contains(bs, bottom_bs)) {
             error_setg(errp, "Node '%s' is not in a chain starting from '%s'",
                        bottom, device);
-            goto out;
+            return;
         }
-        assert(bdrv_get_aio_context(bottom_bs) == aio_context);
     }
 
     /*
@@ -2573,7 +2515,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
          iter = bdrv_filter_or_cow_bs(iter))
     {
         if (bdrv_op_is_blocked(iter, BLOCK_OP_TYPE_STREAM, errp)) {
-            goto out;
+            return;
         }
     }
 
@@ -2582,7 +2524,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     if (base_bs == NULL && has_backing_file) {
         error_setg(errp, "backing file specified, but streaming the "
                          "entire chain");
-        goto out;
+        return;
     }
 
     if (has_auto_finalize && !auto_finalize) {
@@ -2597,13 +2539,10 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                  filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     trace_qmp_block_stream(bs);
-
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
@@ -2622,7 +2561,6 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *bs;
     BlockDriverState *iter;
     BlockDriverState *base_bs, *top_bs;
-    AioContext *aio_context;
     Error *local_err = NULL;
     int job_flags = JOB_DEFAULT;
     uint64_t top_perm, top_shared;
@@ -2661,11 +2599,8 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_COMMIT_SOURCE, errp)) {
-        goto out;
+        return;
     }
 
     /* default top_bs is the active layer */
@@ -2673,16 +2608,16 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
 
     if (has_top_node && has_top) {
         error_setg(errp, "'top-node' and 'top' are mutually exclusive");
-        goto out;
+        return;
     } else if (has_top_node) {
         top_bs = bdrv_lookup_bs(NULL, top_node, errp);
         if (top_bs == NULL) {
-            goto out;
+            return;
         }
         if (!bdrv_chain_contains(bs, top_bs)) {
             error_setg(errp, "'%s' is not in this backing file chain",
                        top_node);
-            goto out;
+            return;
         }
     } else if (has_top && top) {
         /* This strcmp() is just a shortcut, there is no need to
@@ -2696,52 +2631,48 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
 
     if (top_bs == NULL) {
         error_setg(errp, "Top image file %s not found", top ? top : "NULL");
-        goto out;
+        return;
     }
 
-    assert(bdrv_get_aio_context(top_bs) == aio_context);
-
     if (has_base_node && has_base) {
         error_setg(errp, "'base-node' and 'base' are mutually exclusive");
-        goto out;
+        return;
     } else if (has_base_node) {
         base_bs = bdrv_lookup_bs(NULL, base_node, errp);
         if (base_bs == NULL) {
-            goto out;
+            return;
         }
         if (!bdrv_chain_contains(top_bs, base_bs)) {
             error_setg(errp, "'%s' is not in this backing file chain",
                        base_node);
-            goto out;
+            return;
         }
     } else if (has_base && base) {
         base_bs = bdrv_find_backing_image(top_bs, base);
         if (base_bs == NULL) {
             error_setg(errp, "Can't find '%s' in the backing chain", base);
-            goto out;
+            return;
         }
     } else {
         base_bs = bdrv_find_base(top_bs);
         if (base_bs == NULL) {
             error_setg(errp, "There is no backimg image");
-            goto out;
+            return;
         }
     }
 
-    assert(bdrv_get_aio_context(base_bs) == aio_context);
-
     for (iter = top_bs; iter != bdrv_filter_or_cow_bs(base_bs);
          iter = bdrv_filter_or_cow_bs(iter))
     {
         if (bdrv_op_is_blocked(iter, BLOCK_OP_TYPE_COMMIT_TARGET, errp)) {
-            goto out;
+            return;
         }
     }
 
     /* Do not allow attempts to commit an image into itself */
     if (top_bs == base_bs) {
         error_setg(errp, "cannot commit an image into itself");
-        goto out;
+        return;
     }
 
     /*
@@ -2764,7 +2695,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
                 error_setg(errp, "'backing-file' specified, but 'top' has a "
                                  "writer on it");
             }
-            goto out;
+            return;
         }
         if (!has_job_id) {
             /*
@@ -2780,7 +2711,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     } else {
         BlockDriverState *overlay_bs = bdrv_find_overlay(bs, top_bs);
         if (bdrv_op_is_blocked(overlay_bs, BLOCK_OP_TYPE_COMMIT_TARGET, errp)) {
-            goto out;
+            return;
         }
         commit_start(has_job_id ? job_id : NULL, bs, base_bs, top_bs, job_flags,
                      speed, on_error, has_backing_file ? backing_file : NULL,
@@ -2788,11 +2719,8 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     }
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
-
-out:
-    aio_context_release(aio_context);
 }
 
 /* Common QMP interface for drive-backup and blockdev-backup */
@@ -3089,7 +3017,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
 {
     BlockDriverState *bs;
     BlockDriverState *target_backing_bs, *target_bs;
-    AioContext *aio_context;
     AioContext *old_context;
     BlockMirrorBackingMode backing_mode;
     Error *local_err = NULL;
@@ -3110,9 +3037,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     if (!arg->has_mode) {
         arg->mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS;
     }
@@ -3134,14 +3058,14 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     size = bdrv_getlength(bs);
     if (size < 0) {
         error_setg_errno(errp, -size, "bdrv_getlength failed");
-        goto out;
+        return;
     }
 
     if (arg->has_replaces) {
         if (!arg->has_node_name) {
             error_setg(errp, "a node-name must be provided when replacing a"
                              " named node of the graph");
-            goto out;
+            return;
         }
     }
 
@@ -3184,7 +3108,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
 
     if (local_err) {
         error_propagate(errp, local_err);
-        goto out;
+        return;
     }
 
     options = qdict_new();
@@ -3200,7 +3124,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
      */
     target_bs = bdrv_open(arg->target, NULL, options, flags, errp);
     if (!target_bs) {
-        goto out;
+        return;
     }
 
     zero_target = (arg->sync == MIRROR_SYNC_MODE_FULL &&
@@ -3210,10 +3134,9 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
 
     /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
-    aio_context_release(aio_context);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_set_aio_context(target_bs, bdrv_get_aio_context(bs), errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
         aio_context_release(old_context);
@@ -3221,7 +3144,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     }
 
     aio_context_release(old_context);
-    aio_context_acquire(aio_context);
 
     blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs, target_bs,
                            arg->has_replaces, arg->replaces, arg->sync,
@@ -3238,8 +3160,6 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
                            arg->has_auto_dismiss, arg->auto_dismiss,
                            errp);
     bdrv_unref(target_bs);
-out:
-    aio_context_release(aio_context);
 }
 
 void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
@@ -3262,7 +3182,6 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
 {
     BlockDriverState *bs;
     BlockDriverState *target_bs;
-    AioContext *aio_context;
     AioContext *old_context;
     BlockMirrorBackingMode backing_mode = MIRROR_LEAVE_BACKING_CHAIN;
     bool zero_target;
@@ -3282,16 +3201,14 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
 
     /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
-    aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_set_aio_context(target_bs, bdrv_get_aio_context(bs), errp);
 
     aio_context_release(old_context);
-    aio_context_acquire(aio_context);
 
     if (ret < 0) {
-        goto out;
+        return;
     }
 
     blockdev_mirror_common(has_job_id ? job_id : NULL, bs, target_bs,
@@ -3307,8 +3224,6 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
                            has_auto_finalize, auto_finalize,
                            has_auto_dismiss, auto_dismiss,
                            errp);
-out:
-    aio_context_release(aio_context);
 }
 
 /* Get a block job using its ID and acquire its job_lock */
@@ -3696,15 +3611,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 
     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
         BlockJobInfo *value;
-        AioContext *aio_context;
 
         if (block_job_is_internal(job)) {
             continue;
         }
-        aio_context = blk_get_aio_context(job->blk);
-        aio_context_acquire(aio_context);
         value = block_job_query(job, errp);
-        aio_context_release(aio_context);
         if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
diff --git a/blockjob.c b/blockjob.c
index e7b289089b..633abb3811 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -195,6 +195,7 @@ static const BdrvChildClass child_job = {
     .get_parent_aio_context = child_job_get_parent_aio_context,
 };
 
+/* Called with BQL held.  */
 void block_job_remove_all_bdrv(BlockJob *job)
 {
     /*
@@ -216,6 +217,7 @@ void block_job_remove_all_bdrv(BlockJob *job)
     }
 }
 
+/* Called with BQL held.  */
 bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
 {
     GSList *el;
@@ -230,6 +232,7 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs)
     return false;
 }
 
+/* Called with BQL held.  */
 int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
                        uint64_t perm, uint64_t shared_perm, Error **errp)
 {
diff --git a/job.c b/job.c
index e2006532b5..b86fce3679 100644
--- a/job.c
+++ b/job.c
@@ -220,7 +220,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
      * break AIO_WAIT_WHILE from within fn.
      */
     job_ref(job);
-    aio_context_release(job->aio_context);
 
     QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
         inner_ctx = other_job->aio_context;
@@ -232,11 +231,6 @@ static int job_txn_apply(Job *job, int fn(Job *))
         }
     }
 
-    /*
-     * Note that job->aio_context might have been changed by calling fn, so we
-     * can't use a local variable to cache it.
-     */
-    aio_context_acquire(job->aio_context);
     job_unref(job);
     return rc;
 }
@@ -515,8 +509,11 @@ void job_unref(Job *job)
         assert(!job->txn);
 
         if (job->driver->free) {
+            AioContext *ctx = job_get_aiocontext(job);
             job_unlock();
+            aio_context_acquire(ctx);
             job->driver->free(job);
+            aio_context_release(ctx);
             job_lock();
         }
 
diff --git a/qemu-img.c b/qemu-img.c
index 82debde038..10bbe88b03 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -946,7 +946,6 @@ static int img_commit(int argc, char **argv)
     Error *local_err = NULL;
     CommonBlockJobCBInfo cbi;
     bool image_opts = false;
-    AioContext *aio_context;
     int64_t rate_limit = 0;
 
     fmt = NULL;
@@ -1060,12 +1059,9 @@ static int img_commit(int argc, char **argv)
         .bs   = bs,
     };
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     commit_active_start("commit", bs, base_bs, JOB_DEFAULT, rate_limit,
                         BLOCKDEV_ON_ERROR_REPORT, NULL, common_block_job_cb,
                         &cbi, false, &local_err);
-    aio_context_release(aio_context);
     if (local_err) {
         goto done;
     }
-- 
2.31.1


