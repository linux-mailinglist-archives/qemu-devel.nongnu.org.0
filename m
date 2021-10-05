Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A295A422B7D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:51:00 +0200 (CEST)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlmV-0005s9-Mz
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlX3-0003GO-GE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlWz-0004eP-Dx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDYsdedDpJQB8zjyL8KWX4vLDcV9e/Ns5PLVXS2+RtY=;
 b=HC7H+4Ev0nPxkquxMbB16KjsxOwH+GgTvra1AT/0riKKBqjjVPBVbGe/I4AJyXFntpYFEl
 L4LvURLsbPZg848GYQ1iK7KevD5gmgkDT45/l29tlioYj+JH7E0cqaLtSTq8uxKdaEw1Ng
 e61iKbj/HJDLGzp4LZr2Y04o0IYILLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-1g8Rm4QfOwWlWuRUG19BHQ-1; Tue, 05 Oct 2021 10:34:55 -0400
X-MC-Unique: 1g8Rm4QfOwWlWuRUG19BHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E46184A5E0;
 Tue,  5 Oct 2021 14:34:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B698D1002391;
 Tue,  5 Oct 2021 14:34:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 07/25] assertions for block_int global state API
Date: Tue,  5 Oct 2021 10:31:57 -0400
Message-Id: <20211005143215.29500-8-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                         | 17 +++++++++++++++++
 block/backup.c                  |  1 +
 block/block-backend.c           |  3 +++
 block/commit.c                  |  2 ++
 block/dirty-bitmap.c            |  2 ++
 block/io.c                      |  6 ++++++
 block/mirror.c                  |  4 ++++
 block/monitor/bitmap-qmp-cmds.c |  6 ++++++
 block/stream.c                  |  2 ++
 blockdev.c                      |  7 +++++++
 10 files changed, 50 insertions(+)

diff --git a/block.c b/block.c
index 6121af7040..b912f517a4 100644
--- a/block.c
+++ b/block.c
@@ -648,6 +648,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
     Error *local_err = NULL;
     int ret;
 
+    g_assert(qemu_in_main_thread());
+
     size = qemu_opt_get_size_del(opts, BLOCK_OPT_SIZE, 0);
     buf = qemu_opt_get_del(opts, BLOCK_OPT_PREALLOC);
     prealloc = qapi_enum_parse(&PreallocMode_lookup, buf,
@@ -2405,6 +2407,8 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     uint64_t cumulative_perms = 0;
     uint64_t cumulative_shared_perms = BLK_PERM_ALL;
 
+    g_assert(qemu_in_main_thread());
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         cumulative_perms |= c->perm;
         cumulative_shared_perms &= c->shared_perm;
@@ -2463,6 +2467,8 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
+    g_assert(qemu_in_main_thread());
+
     bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
@@ -2493,6 +2499,8 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
     uint64_t parent_perms, parent_shared;
     uint64_t perms, shared;
 
+    g_assert(qemu_in_main_thread());
+
     bdrv_get_cumulative_perm(bs, &parent_perms, &parent_shared);
     bdrv_child_perm(bs, c->bs, c, c->role, NULL,
                     parent_perms, parent_shared, &perms, &shared);
@@ -2635,6 +2643,7 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
                         uint64_t perm, uint64_t shared,
                         uint64_t *nperm, uint64_t *nshared)
 {
+    g_assert(qemu_in_main_thread());
     if (role & BDRV_CHILD_FILTERED) {
         assert(!(role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                          BDRV_CHILD_COW)));
@@ -2961,6 +2970,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    g_assert(qemu_in_main_thread());
+
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
@@ -5939,6 +5950,8 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
     BdrvChild *c;
     const char *name;
 
+    g_assert(qemu_in_main_thread());
+
     /* If multiple parents have a name, just pick the first one. */
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass->get_name) {
@@ -7206,6 +7219,8 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
 {
     BlockDriverState *filtered;
 
+    g_assert(qemu_in_main_thread());
+
     if (!bs || !bs->drv) {
         return false;
     }
@@ -7377,6 +7392,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
  * would result in exactly bs->backing. */
 bool bdrv_backing_overridden(BlockDriverState *bs)
 {
+    g_assert(qemu_in_main_thread());
     if (bs->backing) {
         return strcmp(bs->auto_backing_file,
                       bs->backing->bs->filename);
@@ -7765,6 +7781,7 @@ static BlockDriverState *bdrv_do_skip_filters(BlockDriverState *bs,
  */
 BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
 {
+    g_assert(qemu_in_main_thread());
     return bdrv_do_skip_filters(bs, true);
 }
 
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..8677dd44dc 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -413,6 +413,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
 
     assert(bs);
     assert(target);
+    g_assert(qemu_in_main_thread());
 
     /* QMP interface protects us from these cases */
     assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
diff --git a/block/block-backend.c b/block/block-backend.c
index 9cd3b27b53..9f09245069 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1078,6 +1078,7 @@ static void blk_root_change_media(BdrvChild *child, bool load)
  */
 bool blk_dev_has_removable_media(BlockBackend *blk)
 {
+    g_assert(qemu_in_main_thread());
     return !blk->dev || (blk->dev_ops && blk->dev_ops->change_media_cb);
 }
 
@@ -1095,6 +1096,7 @@ bool blk_dev_has_tray(BlockBackend *blk)
  */
 void blk_dev_eject_request(BlockBackend *blk, bool force)
 {
+    g_assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->eject_request_cb) {
         blk->dev_ops->eject_request_cb(blk->dev_opaque, force);
     }
@@ -1117,6 +1119,7 @@ bool blk_dev_is_tray_open(BlockBackend *blk)
  */
 bool blk_dev_is_medium_locked(BlockBackend *blk)
 {
+    g_assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->is_medium_locked) {
         return blk->dev_ops->is_medium_locked(blk->dev_opaque);
     }
diff --git a/block/commit.c b/block/commit.c
index 87d7a764d8..a030e0afbf 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -253,6 +253,8 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     uint64_t base_perms, iter_shared_perms;
     int ret;
 
+    g_assert(qemu_in_main_thread());
+
     assert(top != bs);
     if (bdrv_skip_filters(top) == bdrv_skip_filters(base)) {
         error_setg(errp, "Invalid files for merge: top and base are the same");
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..a9e87d92d9 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -657,6 +657,7 @@ void bdrv_reset_dirty_bitmap(BdrvDirtyBitmap *bitmap,
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out)
 {
     assert(!bdrv_dirty_bitmap_readonly(bitmap));
+    g_assert(qemu_in_main_thread());
     bdrv_dirty_bitmaps_lock(bitmap->bs);
     if (!out) {
         hbitmap_reset_all(bitmap->bitmap);
@@ -673,6 +674,7 @@ void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup)
 {
     HBitmap *tmp = bitmap->bitmap;
     assert(!bdrv_dirty_bitmap_readonly(bitmap));
+    g_assert(qemu_in_main_thread());
     bitmap->bitmap = backup;
     hbitmap_free(tmp);
 }
diff --git a/block/io.c b/block/io.c
index 85242c0302..21dcc5d962 100644
--- a/block/io.c
+++ b/block/io.c
@@ -559,6 +559,7 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 {
     int i;
+    g_assert(qemu_in_main_thread());
 
     for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_begin(child->bs, true, child, false, true);
@@ -570,6 +571,8 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
     int drained_end_counter = 0;
     int i;
 
+    g_assert(qemu_in_main_thread());
+
     for (i = 0; i < old_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_end(child->bs, true, child, false,
                             &drained_end_counter);
@@ -689,6 +692,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
 
+    g_assert(qemu_in_main_thread());
     g_assert(bs->quiesce_counter > 0);
     g_assert(!bs->refcnt);
 
@@ -3334,6 +3338,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
 {
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
+    g_assert(qemu_in_main_thread());
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
                                        bytes, read_flags, write_flags, true);
 }
@@ -3350,6 +3355,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
 {
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
+    g_assert(qemu_in_main_thread());
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
                                        bytes, read_flags, write_flags, false);
 }
diff --git a/block/mirror.c b/block/mirror.c
index 98fc66eabf..589dd35b16 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1865,6 +1865,8 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
     bool is_none_mode;
     BlockDriverState *base;
 
+    g_assert(qemu_in_main_thread());
+
     if ((mode == MIRROR_SYNC_MODE_INCREMENTAL) ||
         (mode == MIRROR_SYNC_MODE_BITMAP)) {
         error_setg(errp, "Sync mode '%s' not supported",
@@ -1890,6 +1892,8 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
     bool base_read_only;
     BlockJob *job;
 
+    g_assert(qemu_in_main_thread());
+
     base_read_only = bdrv_is_read_only(base);
 
     if (base_read_only) {
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..787ca17834 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -56,6 +56,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
 
+    g_assert(qemu_in_main_thread());
+
     if (!node) {
         error_setg(errp, "Node cannot be NULL");
         return NULL;
@@ -155,6 +157,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
     BdrvDirtyBitmap *bitmap;
     AioContext *aio_context;
 
+    g_assert(qemu_in_main_thread());
+
     bitmap = block_dirty_bitmap_lookup(node, name, &bs, errp);
     if (!bitmap || !bs) {
         return NULL;
@@ -261,6 +265,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDirtyBitmapMergeSourceList *lst;
     Error *local_err = NULL;
 
+    g_assert(qemu_in_main_thread());
+
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
         return NULL;
diff --git a/block/stream.c b/block/stream.c
index 97bee482dc..a079c3c10d 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -216,6 +216,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     QDict *opts;
     int ret;
 
+    g_assert(qemu_in_main_thread());
+
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
 
diff --git a/blockdev.c b/blockdev.c
index 75407cbf67..5608b78f8f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -70,6 +70,7 @@ QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
 
 void bdrv_set_monitor_owned(BlockDriverState *bs)
 {
+    g_assert(qemu_in_main_thread());
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
@@ -662,6 +663,7 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
 {
     int bdrv_flags = 0;
 
+    g_assert(qemu_in_main_thread());
     /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
@@ -680,6 +682,7 @@ void blockdev_close_all_bdrv_states(void)
 {
     BlockDriverState *bs, *next_bs;
 
+    g_assert(qemu_in_main_thread());
     QTAILQ_FOREACH_SAFE(bs, &monitor_bdrv_states, monitor_list, next_bs) {
         AioContext *ctx = bdrv_get_aio_context(bs);
 
@@ -2333,6 +2336,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     BlkActionState *state, *next;
     Error *local_err = NULL;
 
+    g_assert(qemu_in_main_thread());
+
     QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
     QTAILQ_INIT(&snap_bdrv_states);
 
@@ -3626,6 +3631,8 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     AioContext *aio_context;
     BlockDriverState *bs;
 
+    g_assert(qemu_in_main_thread());
+
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-- 
2.27.0


