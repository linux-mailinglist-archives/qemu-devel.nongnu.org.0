Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCB20A258
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:47:52 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joU6R-0006Vc-Nz
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTj2-0006Rn-8b
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38357
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTiz-0001Kl-O7
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8QNsiR0l36jYvWMXswYAxOYUuWM3tZzPZmV8UYTVek=;
 b=CMXY7BJaiMmcoQFUbqDpv2xJP2Nrs0Kr5VXvCRDB/LpVGt+ZTUtAk26P1wdcm/zwDFMzEJ
 p397CoGeikM2COWuZDGbR1kQeyhoKI94se7Xa6J3H0szadft3mbkTzaquOscl4GY8OW37D
 00RYlSfj+pQPjK2FnQhOU23EOJYdhNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-MjFpIaUdP9OXJQv_QPGDyg-1; Thu, 25 Jun 2020 11:23:32 -0400
X-MC-Unique: MjFpIaUdP9OXJQv_QPGDyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C149718A8221;
 Thu, 25 Jun 2020 15:23:31 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3751C1DC;
 Thu, 25 Jun 2020 15:23:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 33/47] mirror: Deal with filters
Date: Thu, 25 Jun 2020 17:22:01 +0200
Message-Id: <20200625152215.941773-34-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes some permission limiting (for example, we only need to
take the RESIZE permission for active commits where the base is smaller
than the top).

Use this opportunity to rename qmp_drive_mirror()'s "source" BDS to
"target_backing_bs", because that is what it really refers to.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json |   6 ++-
 block/mirror.c       | 118 +++++++++++++++++++++++++++++++++----------
 blockdev.c           |  36 +++++++++----
 3 files changed, 121 insertions(+), 39 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index df87855429..0b8ccd30aa 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1943,7 +1943,8 @@
 #
 # @replaces: with sync=full graph node name to be replaced by the new
 #            image when a whole image copy is done. This can be used to repair
-#            broken Quorum files. (Since 2.1)
+#            broken Quorum files.  By default, @device is replaced, although
+#            implicitly created filters on it are kept. (Since 2.1)
 #
 # @mode: whether and how QEMU should create a new image, default is
 #        'absolute-paths'.
@@ -2254,7 +2255,8 @@
 #
 # @replaces: with sync=full graph node name to be replaced by the new
 #            image when a whole image copy is done. This can be used to repair
-#            broken Quorum files.
+#            broken Quorum files.  By default, @device is replaced, although
+#            implicitly created filters on it are kept.
 #
 # @speed:  the maximum speed, in bytes per second
 #
diff --git a/block/mirror.c b/block/mirror.c
index 469acf4600..770de3b34e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -42,6 +42,7 @@ typedef struct MirrorBlockJob {
     BlockBackend *target;
     BlockDriverState *mirror_top_bs;
     BlockDriverState *base;
+    BlockDriverState *base_overlay;
 
     /* The name of the graph node to replace */
     char *replaces;
@@ -677,8 +678,10 @@ static int mirror_exit_common(Job *job)
                              &error_abort);
     if (!abort && s->backing_mode == MIRROR_SOURCE_BACKING_CHAIN) {
         BlockDriverState *backing = s->is_none_mode ? src : s->base;
-        if (backing_bs(target_bs) != backing) {
-            bdrv_set_backing_hd(target_bs, backing, &local_err);
+        BlockDriverState *unfiltered_target = bdrv_skip_filters(target_bs);
+
+        if (bdrv_cow_bs(unfiltered_target) != backing) {
+            bdrv_set_backing_hd(unfiltered_target, backing, &local_err);
             if (local_err) {
                 error_report_err(local_err);
                 local_err = NULL;
@@ -740,7 +743,7 @@ static int mirror_exit_common(Job *job)
      * valid.
      */
     block_job_remove_all_bdrv(bjob);
-    bdrv_replace_node(mirror_top_bs, backing_bs(mirror_top_bs), &error_abort);
+    bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
 
     /* We just changed the BDS the job BB refers to (with either or both of the
      * bdrv_replace_node() calls), so switch the BB back so the cleanup does
@@ -786,7 +789,6 @@ static void coroutine_fn mirror_throttle(MirrorBlockJob *s)
 static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
 {
     int64_t offset;
-    BlockDriverState *base = s->base;
     BlockDriverState *bs = s->mirror_top_bs->backing->bs;
     BlockDriverState *target_bs = blk_bs(s->target);
     int ret;
@@ -837,7 +839,8 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
             return 0;
         }
 
-        ret = bdrv_is_allocated_above(bs, base, false, offset, bytes, &count);
+        ret = bdrv_is_allocated_above(bs, s->base_overlay, true, offset, bytes,
+                                      &count);
         if (ret < 0) {
             return ret;
         }
@@ -936,7 +939,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
     } else {
         s->target_cluster_size = BDRV_SECTOR_SIZE;
     }
-    if (backing_filename[0] && !target_bs->backing &&
+    if (backing_filename[0] && !bdrv_backing_chain_next(target_bs) &&
         s->granularity < s->target_cluster_size) {
         s->buf_size = MAX(s->buf_size, s->target_cluster_size);
         s->cow_bitmap = bitmap_new(length);
@@ -1116,8 +1119,9 @@ static void mirror_complete(Job *job, Error **errp)
     if (s->backing_mode == MIRROR_OPEN_BACKING_CHAIN) {
         int ret;
 
-        assert(!target->backing);
-        ret = bdrv_open_backing_file(target, NULL, "backing", errp);
+        assert(!bdrv_backing_chain_next(target));
+        ret = bdrv_open_backing_file(bdrv_skip_filters(target), NULL,
+                                     "backing", errp);
         if (ret < 0) {
             return;
         }
@@ -1565,8 +1569,8 @@ static BlockJob *mirror_start_job(
     MirrorBlockJob *s;
     MirrorBDSOpaque *bs_opaque;
     BlockDriverState *mirror_top_bs;
-    bool target_graph_mod;
     bool target_is_backing;
+    uint64_t target_perms, target_shared_perms;
     Error *local_err = NULL;
     int ret;
 
@@ -1585,7 +1589,7 @@ static BlockJob *mirror_start_job(
         buf_size = DEFAULT_MIRROR_BUF_SIZE;
     }
 
-    if (bs == target) {
+    if (bdrv_skip_filters(bs) == bdrv_skip_filters(target)) {
         error_setg(errp, "Can't mirror node into itself");
         return NULL;
     }
@@ -1649,15 +1653,50 @@ static BlockJob *mirror_start_job(
      * In the case of active commit, things look a bit different, though,
      * because the target is an already populated backing file in active use.
      * We can allow anything except resize there.*/
+
+    target_perms = BLK_PERM_WRITE;
+    target_shared_perms = BLK_PERM_WRITE_UNCHANGED;
+
     target_is_backing = bdrv_chain_contains(bs, target);
-    target_graph_mod = (backing_mode != MIRROR_LEAVE_BACKING_CHAIN);
+    if (target_is_backing) {
+        int64_t bs_size, target_size;
+        bs_size = bdrv_getlength(bs);
+        if (bs_size < 0) {
+            error_setg_errno(errp, -bs_size,
+                             "Could not inquire top image size");
+            goto fail;
+        }
+
+        target_size = bdrv_getlength(target);
+        if (target_size < 0) {
+            error_setg_errno(errp, -target_size,
+                             "Could not inquire base image size");
+            goto fail;
+        }
+
+        if (target_size < bs_size) {
+            target_perms |= BLK_PERM_RESIZE;
+        }
+
+        target_shared_perms |= BLK_PERM_CONSISTENT_READ
+                            |  BLK_PERM_WRITE
+                            |  BLK_PERM_GRAPH_MOD;
+    } else if (bdrv_chain_contains(bs, bdrv_skip_filters(target))) {
+        /*
+         * We may want to allow this in the future, but it would
+         * require taking some extra care.
+         */
+        error_setg(errp, "Cannot mirror to a filter on top of a node in the "
+                   "source's backing chain");
+        goto fail;
+    }
+
+    if (backing_mode != MIRROR_LEAVE_BACKING_CHAIN) {
+        target_perms |= BLK_PERM_GRAPH_MOD;
+    }
+
     s->target = blk_new(s->common.job.aio_context,
-                        BLK_PERM_WRITE | BLK_PERM_RESIZE |
-                        (target_graph_mod ? BLK_PERM_GRAPH_MOD : 0),
-                        BLK_PERM_WRITE_UNCHANGED |
-                        (target_is_backing ? BLK_PERM_CONSISTENT_READ |
-                                             BLK_PERM_WRITE |
-                                             BLK_PERM_GRAPH_MOD : 0));
+                        target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
     if (ret < 0) {
         goto fail;
@@ -1682,6 +1721,7 @@ static BlockJob *mirror_start_job(
     s->zero_target = zero_target;
     s->copy_mode = copy_mode;
     s->base = base;
+    s->base_overlay = bdrv_find_overlay(bs, base);
     s->granularity = granularity;
     s->buf_size = ROUND_UP(buf_size, granularity);
     s->unmap = unmap;
@@ -1712,15 +1752,39 @@ static BlockJob *mirror_start_job(
     /* In commit_active_start() all intermediate nodes disappear, so
      * any jobs in them must be blocked */
     if (target_is_backing) {
-        BlockDriverState *iter;
-        for (iter = backing_bs(bs); iter != target; iter = backing_bs(iter)) {
-            /* XXX BLK_PERM_WRITE needs to be allowed so we don't block
-             * ourselves at s->base (if writes are blocked for a node, they are
-             * also blocked for its backing file). The other options would be a
-             * second filter driver above s->base (== target). */
+        BlockDriverState *iter, *filtered_target;
+        uint64_t iter_shared_perms;
+
+        /*
+         * The topmost node with
+         * bdrv_skip_filters(filtered_target) == bdrv_skip_filters(target)
+         */
+        filtered_target = bdrv_cow_bs(bdrv_find_overlay(bs, target));
+
+        assert(bdrv_skip_filters(filtered_target) ==
+               bdrv_skip_filters(target));
+
+        /*
+         * XXX BLK_PERM_WRITE needs to be allowed so we don't block
+         * ourselves at s->base (if writes are blocked for a node, they are
+         * also blocked for its backing file). The other options would be a
+         * second filter driver above s->base (== target).
+         */
+        iter_shared_perms = BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE;
+
+        for (iter = bdrv_filter_or_cow_bs(bs); iter != target;
+             iter = bdrv_filter_or_cow_bs(iter))
+        {
+            if (iter == filtered_target) {
+                /*
+                 * From here on, all nodes are filters on the base.
+                 * This allows us to share BLK_PERM_CONSISTENT_READ.
+                 */
+                iter_shared_perms |= BLK_PERM_CONSISTENT_READ;
+            }
+
             ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
-                                     BLK_PERM_WRITE_UNCHANGED | BLK_PERM_WRITE,
-                                     errp);
+                                     iter_shared_perms, errp);
             if (ret < 0) {
                 goto fail;
             }
@@ -1756,7 +1820,7 @@ fail:
     bs_opaque->stop = true;
     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
                              &error_abort);
-    bdrv_replace_node(mirror_top_bs, backing_bs(mirror_top_bs), &error_abort);
+    bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
 
     bdrv_unref(mirror_top_bs);
 
@@ -1784,7 +1848,7 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
         return;
     }
     is_none_mode = mode == MIRROR_SYNC_MODE_NONE;
-    base = mode == MIRROR_SYNC_MODE_TOP ? backing_bs(bs) : NULL;
+    base = mode == MIRROR_SYNC_MODE_TOP ? bdrv_backing_chain_next(bs) : NULL;
     mirror_start_job(job_id, bs, creation_flags, target, replaces,
                      speed, granularity, buf_size, backing_mode, zero_target,
                      on_source_error, on_target_error, unmap, NULL, NULL,
diff --git a/blockdev.c b/blockdev.c
index aabe51036d..6ca9b19779 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2886,6 +2886,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
                                    bool has_auto_dismiss, bool auto_dismiss,
                                    Error **errp)
 {
+    BlockDriverState *unfiltered_bs;
     int job_flags = JOB_DEFAULT;
 
     if (!has_speed) {
@@ -2937,10 +2938,19 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
         return;
     }
 
-    if (!bs->backing && sync == MIRROR_SYNC_MODE_TOP) {
+    if (!bdrv_backing_chain_next(bs) && sync == MIRROR_SYNC_MODE_TOP) {
         sync = MIRROR_SYNC_MODE_FULL;
     }
 
+    if (!has_replaces) {
+        /* We want to mirror from @bs, but keep implicit filters on top */
+        unfiltered_bs = bdrv_skip_implicit_filters(bs);
+        if (unfiltered_bs != bs) {
+            replaces = unfiltered_bs->node_name;
+            has_replaces = true;
+        }
+    }
+
     if (has_replaces) {
         BlockDriverState *to_replace_bs;
         AioContext *replace_aio_context;
@@ -2987,7 +2997,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
 void qmp_drive_mirror(DriveMirror *arg, Error **errp)
 {
     BlockDriverState *bs;
-    BlockDriverState *source, *target_bs;
+    BlockDriverState *target_backing_bs, *target_bs;
     AioContext *aio_context;
     AioContext *old_context;
     BlockMirrorBackingMode backing_mode;
@@ -2996,6 +3006,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     int flags;
     int64_t size;
     const char *format = arg->format;
+    const char *replaces_node_name = NULL;
     bool zero_target;
     int ret;
 
@@ -3022,12 +3033,12 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     }
 
     flags = bs->open_flags | BDRV_O_RDWR;
-    source = backing_bs(bs);
-    if (!source && arg->sync == MIRROR_SYNC_MODE_TOP) {
+    target_backing_bs = bdrv_cow_bs(bdrv_skip_filters(bs));
+    if (!target_backing_bs && arg->sync == MIRROR_SYNC_MODE_TOP) {
         arg->sync = MIRROR_SYNC_MODE_FULL;
     }
     if (arg->sync == MIRROR_SYNC_MODE_NONE) {
-        source = bs;
+        target_backing_bs = bs;
     }
 
     size = bdrv_getlength(bs);
@@ -3042,6 +3053,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
                              " named node of the graph");
             goto out;
         }
+        replaces_node_name = arg->replaces;
     }
 
     if (arg->mode == NEW_IMAGE_MODE_ABSOLUTE_PATHS) {
@@ -3053,7 +3065,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     /* Don't open backing image in create() */
     flags |= BDRV_O_NO_BACKING;
 
-    if ((arg->sync == MIRROR_SYNC_MODE_FULL || !source)
+    if ((arg->sync == MIRROR_SYNC_MODE_FULL || !target_backing_bs)
         && arg->mode != NEW_IMAGE_MODE_EXISTING)
     {
         /* create new image w/o backing file */
@@ -3061,15 +3073,19 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
         bdrv_img_create(arg->target, format,
                         NULL, NULL, NULL, size, flags, false, &local_err);
     } else {
+        /* Implicit filters should not appear in the filename */
+        BlockDriverState *explicit_backing =
+            bdrv_skip_implicit_filters(target_backing_bs);
+
         switch (arg->mode) {
         case NEW_IMAGE_MODE_EXISTING:
             break;
         case NEW_IMAGE_MODE_ABSOLUTE_PATHS:
             /* create new image with backing file */
-            bdrv_refresh_filename(source);
+            bdrv_refresh_filename(explicit_backing);
             bdrv_img_create(arg->target, format,
-                            source->filename,
-                            source->drv->format_name,
+                            explicit_backing->filename,
+                            explicit_backing->drv->format_name,
                             NULL, size, flags, false, &local_err);
             break;
         default:
@@ -3119,7 +3135,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     aio_context_acquire(aio_context);
 
     blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs, target_bs,
-                           arg->has_replaces, arg->replaces, arg->sync,
+                           !!replaces_node_name, replaces_node_name, arg->sync,
                            backing_mode, zero_target,
                            arg->has_speed, arg->speed,
                            arg->has_granularity, arg->granularity,
-- 
2.26.2


