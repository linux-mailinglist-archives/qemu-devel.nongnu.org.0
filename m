Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C796D42A076
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 10:59:15 +0200 (CEST)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDcw-0007JG-Ra
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 04:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDTy-0005nT-Oa
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDTw-0002Zo-IK
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BeeOyaMHh4Xwn9iq0LSveBxzzyw/Vr3UAUeAXXqN4U=;
 b=SPyxyEPiMJFhYZkHSOihcXw9C3zo04mKnwnfuGCyMSZgcmcpwDcbmiM0hkErK7tcg0uG2z
 bMa4famGYK2dOaPoBIyxvaGCscbIq+QvRqx2wcFAKJ9s0B33wsbhlmsfk2buY/y8fxE7lG
 FtIN7D2Y62ipgomcCjRZHHuhnxQjLEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-TNe79XIPPz2AQe-eWAs2FQ-1; Tue, 12 Oct 2021 04:49:53 -0400
X-MC-Unique: TNe79XIPPz2AQe-eWAs2FQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20A3100F943;
 Tue, 12 Oct 2021 08:49:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8985C1B4;
 Tue, 12 Oct 2021 08:49:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 07/25] assertions for block_int global state API
Date: Tue, 12 Oct 2021 04:48:48 -0400
Message-Id: <20211012084906.2060507-8-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c                         | 17 +++++++++++++++++
 block/backup.c                  |  1 +
 block/block-backend.c           |  3 +++
 block/commit.c                  |  2 ++
 block/dirty-bitmap.c            |  1 +
 block/io.c                      |  6 ++++++
 block/mirror.c                  |  4 ++++
 block/monitor/bitmap-qmp-cmds.c |  6 ++++++
 block/stream.c                  |  2 ++
 blockdev.c                      |  7 +++++++
 10 files changed, 49 insertions(+)

diff --git a/block.c b/block.c
index 672f946065..41c5883c5c 100644
--- a/block.c
+++ b/block.c
@@ -653,6 +653,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
     Error *local_err = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     size = qemu_opt_get_size_del(opts, BLOCK_OPT_SIZE, 0);
     buf = qemu_opt_get_del(opts, BLOCK_OPT_PREALLOC);
     prealloc = qapi_enum_parse(&PreallocMode_lookup, buf,
@@ -2428,6 +2430,8 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     uint64_t cumulative_perms = 0;
     uint64_t cumulative_shared_perms = BLK_PERM_ALL;
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         cumulative_perms |= c->perm;
         cumulative_shared_perms &= c->shared_perm;
@@ -2486,6 +2490,8 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
@@ -2516,6 +2522,8 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
     uint64_t parent_perms, parent_shared;
     uint64_t perms, shared;
 
+    assert(qemu_in_main_thread());
+
     bdrv_get_cumulative_perm(bs, &parent_perms, &parent_shared);
     bdrv_child_perm(bs, c->bs, c, c->role, NULL,
                     parent_perms, parent_shared, &perms, &shared);
@@ -2658,6 +2666,7 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
                         uint64_t perm, uint64_t shared,
                         uint64_t *nperm, uint64_t *nshared)
 {
+    assert(qemu_in_main_thread());
     if (role & BDRV_CHILD_FILTERED) {
         assert(!(role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                          BDRV_CHILD_COW)));
@@ -2984,6 +2993,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
@@ -6027,6 +6038,8 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
     BdrvChild *c;
     const char *name;
 
+    assert(qemu_in_main_thread());
+
     /* If multiple parents have a name, just pick the first one. */
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass->get_name) {
@@ -7302,6 +7315,8 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
 {
     BlockDriverState *filtered;
 
+    assert(qemu_in_main_thread());
+
     if (!bs || !bs->drv) {
         return false;
     }
@@ -7473,6 +7488,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
  * would result in exactly bs->backing. */
 bool bdrv_backing_overridden(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (bs->backing) {
         return strcmp(bs->auto_backing_file,
                       bs->backing->bs->filename);
@@ -7861,6 +7877,7 @@ static BlockDriverState *bdrv_do_skip_filters(BlockDriverState *bs,
  */
 BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     return bdrv_do_skip_filters(bs, true);
 }
 
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..c53041772c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -372,6 +372,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
 
     assert(bs);
     assert(target);
+    assert(qemu_in_main_thread());
 
     /* QMP interface protects us from these cases */
     assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
diff --git a/block/block-backend.c b/block/block-backend.c
index 55aaaf7527..6f36a54e82 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1086,6 +1086,7 @@ static void blk_root_change_media(BdrvChild *child, bool load)
  */
 bool blk_dev_has_removable_media(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return !blk->dev || (blk->dev_ops && blk->dev_ops->change_media_cb);
 }
 
@@ -1103,6 +1104,7 @@ bool blk_dev_has_tray(BlockBackend *blk)
  */
 void blk_dev_eject_request(BlockBackend *blk, bool force)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->eject_request_cb) {
         blk->dev_ops->eject_request_cb(blk->dev_opaque, force);
     }
@@ -1125,6 +1127,7 @@ bool blk_dev_is_tray_open(BlockBackend *blk)
  */
 bool blk_dev_is_medium_locked(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->is_medium_locked) {
         return blk->dev_ops->is_medium_locked(blk->dev_opaque);
     }
diff --git a/block/commit.c b/block/commit.c
index 45a414a19b..f639eb49c5 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -253,6 +253,8 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     uint64_t base_perms, iter_shared_perms;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     assert(top != bs);
     if (bdrv_skip_filters(top) == bdrv_skip_filters(base)) {
         error_setg(errp, "Invalid files for merge: top and base are the same");
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..49462ca121 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -673,6 +673,7 @@ void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup)
 {
     HBitmap *tmp = bitmap->bitmap;
     assert(!bdrv_dirty_bitmap_readonly(bitmap));
+    assert(qemu_in_main_thread());
     bitmap->bitmap = backup;
     hbitmap_free(tmp);
 }
diff --git a/block/io.c b/block/io.c
index c5d7f8495e..f271ab3684 100644
--- a/block/io.c
+++ b/block/io.c
@@ -560,6 +560,7 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 {
     int i;
+    assert(qemu_in_main_thread());
 
     for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_begin(child->bs, true, child, false, true);
@@ -571,6 +572,8 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
     int drained_end_counter = 0;
     int i;
 
+    assert(qemu_in_main_thread());
+
     for (i = 0; i < old_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_end(child->bs, true, child, false,
                             &drained_end_counter);
@@ -690,6 +693,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
 
+    assert(qemu_in_main_thread());
     g_assert(bs->quiesce_counter > 0);
     g_assert(!bs->refcnt);
 
@@ -3419,6 +3423,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
 {
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
+    assert(qemu_in_main_thread());
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
                                        bytes, read_flags, write_flags, true);
 }
@@ -3435,6 +3440,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
 {
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
+    assert(qemu_in_main_thread());
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
                                        bytes, read_flags, write_flags, false);
 }
diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..00089e519b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1880,6 +1880,8 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
     bool is_none_mode;
     BlockDriverState *base;
 
+    assert(qemu_in_main_thread());
+
     if ((mode == MIRROR_SYNC_MODE_INCREMENTAL) ||
         (mode == MIRROR_SYNC_MODE_BITMAP)) {
         error_setg(errp, "Sync mode '%s' not supported",
@@ -1905,6 +1907,8 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
     bool base_read_only;
     BlockJob *job;
 
+    assert(qemu_in_main_thread());
+
     base_read_only = bdrv_is_read_only(base);
 
     if (base_read_only) {
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..8b8d30287a 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -56,6 +56,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_lookup(const char *node,
     BlockDriverState *bs;
     BdrvDirtyBitmap *bitmap;
 
+    assert(qemu_in_main_thread());
+
     if (!node) {
         error_setg(errp, "Node cannot be NULL");
         return NULL;
@@ -155,6 +157,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
     BdrvDirtyBitmap *bitmap;
     AioContext *aio_context;
 
+    assert(qemu_in_main_thread());
+
     bitmap = block_dirty_bitmap_lookup(node, name, &bs, errp);
     if (!bitmap || !bs) {
         return NULL;
@@ -261,6 +265,8 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDirtyBitmapMergeSourceList *lst;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
         return NULL;
diff --git a/block/stream.c b/block/stream.c
index 97bee482dc..b85c3742b2 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -216,6 +216,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     QDict *opts;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
 
diff --git a/blockdev.c b/blockdev.c
index ddba382abd..c1f6171c6c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -69,6 +69,7 @@ QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
 
 void bdrv_set_monitor_owned(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
@@ -661,6 +662,7 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
 {
     int bdrv_flags = 0;
 
+    assert(qemu_in_main_thread());
     /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
@@ -679,6 +681,7 @@ void blockdev_close_all_bdrv_states(void)
 {
     BlockDriverState *bs, *next_bs;
 
+    assert(qemu_in_main_thread());
     QTAILQ_FOREACH_SAFE(bs, &monitor_bdrv_states, monitor_list, next_bs) {
         AioContext *ctx = bdrv_get_aio_context(bs);
 
@@ -2332,6 +2335,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     BlkActionState *state, *next;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
     QTAILQ_INIT(&snap_bdrv_states);
 
@@ -3625,6 +3630,8 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     AioContext *aio_context;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-- 
2.27.0


