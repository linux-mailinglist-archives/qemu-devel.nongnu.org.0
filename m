Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785A4B2881
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:58:56 +0100 (CET)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXNv-00044P-9U
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHl-0003XB-Op
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXHd-0001kf-Vq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwiF7+pOi4QZ/AlXg4OJ1bgi67eiXq/jcoHVKapJdwk=;
 b=OZDv+ENnxR2ZcjPTbnR7t05B5/6J6koLeTzzN1gXaEPLVrhpjp7YVLPjLIyLw5zGsVyL8x
 t3LqchYt9w+nFqggNDuBOhVlnW/NliRRnhraJUNHv1GriyjncJSFuP1GOQ91T4Sqf5A7BH
 oDzobgEf+Hw90ioLISMsh75HfDe4u/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-pqBRo6T7NkW3GaCilVNr5w-1; Fri, 11 Feb 2022 09:52:19 -0500
X-MC-Unique: pqBRo6T7NkW3GaCilVNr5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C5731018728;
 Fri, 11 Feb 2022 14:52:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 012487DE52;
 Fri, 11 Feb 2022 14:52:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 12/31] assertions for block_int global state API
Date: Fri, 11 Feb 2022 09:51:34 -0500
Message-Id: <20220211145153.2861415-13-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                         | 15 +++++++++++++++
 block/backup.c                  |  1 +
 block/block-backend.c           |  3 +++
 block/commit.c                  |  2 ++
 block/dirty-bitmap.c            |  1 +
 block/io.c                      |  1 +
 block/mirror.c                  |  4 ++++
 block/monitor/bitmap-qmp-cmds.c |  6 ++++++
 block/stream.c                  |  2 ++
 blockdev.c                      |  7 +++++++
 10 files changed, 42 insertions(+)

diff --git a/block.c b/block.c
index 2540ce3534..1fee5e41e8 100644
--- a/block.c
+++ b/block.c
@@ -665,6 +665,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
     Error *local_err = NULL;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     size = qemu_opt_get_size_del(opts, BLOCK_OPT_SIZE, 0);
     buf = qemu_opt_get_del(opts, BLOCK_OPT_PREALLOC);
     prealloc = qapi_enum_parse(&PreallocMode_lookup, buf,
@@ -2504,6 +2506,8 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     uint64_t cumulative_perms = 0;
     uint64_t cumulative_shared_perms = BLK_PERM_ALL;
 
+    GLOBAL_STATE_CODE();
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         cumulative_perms |= c->perm;
         cumulative_shared_perms &= c->shared_perm;
@@ -2562,6 +2566,8 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
@@ -2592,6 +2598,8 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
     uint64_t parent_perms, parent_shared;
     uint64_t perms, shared;
 
+    GLOBAL_STATE_CODE();
+
     bdrv_get_cumulative_perm(bs, &parent_perms, &parent_shared);
     bdrv_child_perm(bs, c->bs, c, c->role, NULL,
                     parent_perms, parent_shared, &perms, &shared);
@@ -2736,6 +2744,7 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
                         uint64_t perm, uint64_t shared,
                         uint64_t *nperm, uint64_t *nshared)
 {
+    GLOBAL_STATE_CODE();
     if (role & BDRV_CHILD_FILTERED) {
         assert(!(role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                          BDRV_CHILD_COW)));
@@ -3093,6 +3102,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    GLOBAL_STATE_CODE();
+
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
@@ -7484,6 +7495,8 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
 {
     BlockDriverState *filtered;
 
+    GLOBAL_STATE_CODE();
+
     if (!bs || !bs->drv) {
         return false;
     }
@@ -7655,6 +7668,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
  * would result in exactly bs->backing. */
 static bool bdrv_backing_overridden(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     if (bs->backing) {
         return strcmp(bs->auto_backing_file,
                       bs->backing->bs->filename);
@@ -8043,6 +8057,7 @@ static BlockDriverState *bdrv_do_skip_filters(BlockDriverState *bs,
  */
 BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     return bdrv_do_skip_filters(bs, true);
 }
 
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..5cfd0b999c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -372,6 +372,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
 
     assert(bs);
     assert(target);
+    GLOBAL_STATE_CODE();
 
     /* QMP interface protects us from these cases */
     assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
diff --git a/block/block-backend.c b/block/block-backend.c
index 03b1e36a3c..292481069f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1106,6 +1106,7 @@ static void blk_root_change_media(BdrvChild *child, bool load)
  */
 bool blk_dev_has_removable_media(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return !blk->dev || (blk->dev_ops && blk->dev_ops->change_media_cb);
 }
 
@@ -1123,6 +1124,7 @@ bool blk_dev_has_tray(BlockBackend *blk)
  */
 void blk_dev_eject_request(BlockBackend *blk, bool force)
 {
+    GLOBAL_STATE_CODE();
     if (blk->dev_ops && blk->dev_ops->eject_request_cb) {
         blk->dev_ops->eject_request_cb(blk->dev_opaque, force);
     }
@@ -1145,6 +1147,7 @@ bool blk_dev_is_tray_open(BlockBackend *blk)
  */
 bool blk_dev_is_medium_locked(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     if (blk->dev_ops && blk->dev_ops->is_medium_locked) {
         return blk->dev_ops->is_medium_locked(blk->dev_opaque);
     }
diff --git a/block/commit.c b/block/commit.c
index 2ce6637ca6..c76899f640 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -253,6 +253,8 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     uint64_t base_perms, iter_shared_perms;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     assert(top != bs);
     if (bdrv_skip_filters(top) == bdrv_skip_filters(base)) {
         error_setg(errp, "Invalid files for merge: top and base are the same");
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 7569a9cd73..e2a1648deb 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -674,6 +674,7 @@ void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup)
 {
     HBitmap *tmp = bitmap->bitmap;
     assert(!bdrv_dirty_bitmap_readonly(bitmap));
+    GLOBAL_STATE_CODE();
     bitmap->bitmap = backup;
     hbitmap_free(tmp);
 }
diff --git a/block/io.c b/block/io.c
index 8697e85f25..680bc8cc6d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -700,6 +700,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
 
+    GLOBAL_STATE_CODE();
     g_assert(bs->quiesce_counter > 0);
     g_assert(!bs->refcnt);
 
diff --git a/block/mirror.c b/block/mirror.c
index 69b2c1c697..ce6bc58d1f 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1864,6 +1864,8 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
     bool is_none_mode;
     BlockDriverState *base;
 
+    GLOBAL_STATE_CODE();
+
     if ((mode == MIRROR_SYNC_MODE_INCREMENTAL) ||
         (mode == MIRROR_SYNC_MODE_BITMAP)) {
         error_setg(errp, "Sync mode '%s' not supported",
@@ -1889,6 +1891,8 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
     bool base_read_only;
     BlockJob *job;
 
+    GLOBAL_STATE_CODE();
+
     base_read_only = bdrv_is_read_only(base);
 
     if (base_read_only) {
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..972e8a0afc 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -56,6 +56,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
 
+    GLOBAL_STATE_CODE();
+
     if (!node) {
         error_setg(errp, "Node cannot be NULL");
         return NULL;
@@ -155,6 +157,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
     BdrvDirtyBitmap *bitmap;
     AioContext *aio_context;
 
+    GLOBAL_STATE_CODE();
+
     bitmap = block_dirty_bitmap_lookup(node, name, &bs, errp);
     if (!bitmap || !bs) {
         return NULL;
@@ -261,6 +265,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDirtyBitmapMergeSourceList *lst;
     Error *local_err = NULL;
 
+    GLOBAL_STATE_CODE();
+
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
         return NULL;
diff --git a/block/stream.c b/block/stream.c
index 7c6b173ddd..3acb59fe6a 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -220,6 +220,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     QDict *opts;
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
 
diff --git a/blockdev.c b/blockdev.c
index 99a651a64f..9e638f1982 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -69,6 +69,7 @@ QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
 
 void bdrv_set_monitor_owned(BlockDriverState *bs)
 {
+    GLOBAL_STATE_CODE();
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
@@ -629,6 +630,7 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
 {
     int bdrv_flags = 0;
 
+    GLOBAL_STATE_CODE();
     /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
@@ -647,6 +649,7 @@ void blockdev_close_all_bdrv_states(void)
 {
     BlockDriverState *bs, *next_bs;
 
+    GLOBAL_STATE_CODE();
     QTAILQ_FOREACH_SAFE(bs, &monitor_bdrv_states, monitor_list, next_bs) {
         AioContext *ctx = bdrv_get_aio_context(bs);
 
@@ -2300,6 +2303,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     BlkActionState *state, *next;
     Error *local_err = NULL;
 
+    GLOBAL_STATE_CODE();
+
     QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
     QTAILQ_INIT(&snap_bdrv_states);
 
@@ -3593,6 +3598,8 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     AioContext *aio_context;
     BlockDriverState *bs;
 
+    GLOBAL_STATE_CODE();
+
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-- 
2.31.1


