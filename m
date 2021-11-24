Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1E45B551
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:26:07 +0100 (CET)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmfK-0004UG-Ux
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2E-0004cQ-Ph
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm2A-0004w4-JF
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQsNj5jHL5QxWzYUFq8f3FOO5s+KOeryWeSDtm/mOZk=;
 b=gtdKzM6n6RVUkTD6/mcqxblUpKl9ay5u49Q2xvLbEepjoEsdxzwYskuZwo1Y843/qizO8j
 UG7mYuyCfz2RwcwhODCPmK52SmRXKOJ0EWZ5PxE1lO0Dodey/WPUpGbRn4QkcIr8R0SHIh
 oXCOjrbxjyZZNs6bhc/dLFD5e0nnmpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-0nIqQSxWNIqkPQRhIq5dig-1; Wed, 24 Nov 2021 01:45:28 -0500
X-MC-Unique: 0nIqQSxWNIqkPQRhIq5dig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BE331006AA5;
 Wed, 24 Nov 2021 06:45:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4427F60843;
 Wed, 24 Nov 2021 06:45:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 08/31] assertions for block_int global state API
Date: Wed, 24 Nov 2021 01:43:55 -0500
Message-Id: <20211124064418.3120601-9-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 49bee69e27..198ec636ff 100644
--- a/block.c
+++ b/block.c
@@ -662,6 +662,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
     Error *local_err = NULL;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     size = qemu_opt_get_size_del(opts, BLOCK_OPT_SIZE, 0);
     buf = qemu_opt_get_del(opts, BLOCK_OPT_PREALLOC);
     prealloc = qapi_enum_parse(&PreallocMode_lookup, buf,
@@ -2492,6 +2494,8 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     uint64_t cumulative_perms = 0;
     uint64_t cumulative_shared_perms = BLK_PERM_ALL;
 
+    assert(qemu_in_main_thread());
+
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         cumulative_perms |= c->perm;
         cumulative_shared_perms &= c->shared_perm;
@@ -2552,6 +2556,8 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
     Transaction *tran = tran_new();
     int ret;
 
+    assert(qemu_in_main_thread());
+
     bdrv_child_set_perm(c, perm, shared, tran);
 
     ret = bdrv_refresh_perms(c->bs, &local_err);
@@ -2582,6 +2588,8 @@ int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
     uint64_t parent_perms, parent_shared;
     uint64_t perms, shared;
 
+    assert(qemu_in_main_thread());
+
     bdrv_get_cumulative_perm(bs, &parent_perms, &parent_shared);
     bdrv_child_perm(bs, c->bs, c, c->role, NULL,
                     parent_perms, parent_shared, &perms, &shared);
@@ -2724,6 +2732,7 @@ void bdrv_default_perms(BlockDriverState *bs, BdrvChild *c,
                         uint64_t perm, uint64_t shared,
                         uint64_t *nperm, uint64_t *nshared)
 {
+    assert(qemu_in_main_thread());
     if (role & BDRV_CHILD_FILTERED) {
         assert(!(role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                          BDRV_CHILD_COW)));
@@ -3084,6 +3093,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     BdrvChild *child = NULL;
     Transaction *tran = tran_new();
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
@@ -7436,6 +7447,8 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
 {
     BlockDriverState *filtered;
 
+    assert(qemu_in_main_thread());
+
     if (!bs || !bs->drv) {
         return false;
     }
@@ -7607,6 +7620,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
  * would result in exactly bs->backing. */
 static bool bdrv_backing_overridden(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     if (bs->backing) {
         return strcmp(bs->auto_backing_file,
                       bs->backing->bs->filename);
@@ -7995,6 +8009,7 @@ static BlockDriverState *bdrv_do_skip_filters(BlockDriverState *bs,
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
index 11131ca68c..56670a774f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1095,6 +1095,7 @@ static void blk_root_change_media(BdrvChild *child, bool load)
  */
 bool blk_dev_has_removable_media(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return !blk->dev || (blk->dev_ops && blk->dev_ops->change_media_cb);
 }
 
@@ -1112,6 +1113,7 @@ bool blk_dev_has_tray(BlockBackend *blk)
  */
 void blk_dev_eject_request(BlockBackend *blk, bool force)
 {
+    assert(qemu_in_main_thread());
     if (blk->dev_ops && blk->dev_ops->eject_request_cb) {
         blk->dev_ops->eject_request_cb(blk->dev_opaque, force);
     }
@@ -1134,6 +1136,7 @@ bool blk_dev_is_tray_open(BlockBackend *blk)
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
index 51497d1b27..cb095deeec 100644
--- a/block/io.c
+++ b/block/io.c
@@ -687,6 +687,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
 
+    assert(qemu_in_main_thread());
     g_assert(bs->quiesce_counter > 0);
     g_assert(!bs->refcnt);
 
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
index e45113aed6..3dff31beb8 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -219,6 +219,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     QDict *opts;
     int ret;
 
+    assert(qemu_in_main_thread());
+
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
 
diff --git a/blockdev.c b/blockdev.c
index 0698398a94..7706919410 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -69,6 +69,7 @@ QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
 
 void bdrv_set_monitor_owned(BlockDriverState *bs)
 {
+    assert(qemu_in_main_thread());
     QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
 }
 
@@ -619,6 +620,7 @@ BlockDriverState *bds_tree_init(QDict *bs_opts, Error **errp)
 {
     int bdrv_flags = 0;
 
+    assert(qemu_in_main_thread());
     /* bdrv_open() defaults to the values in bdrv_flags (for compatibility
      * with other callers) rather than what we want as the real defaults.
      * Apply the defaults here instead. */
@@ -637,6 +639,7 @@ void blockdev_close_all_bdrv_states(void)
 {
     BlockDriverState *bs, *next_bs;
 
+    assert(qemu_in_main_thread());
     QTAILQ_FOREACH_SAFE(bs, &monitor_bdrv_states, monitor_list, next_bs) {
         AioContext *ctx = bdrv_get_aio_context(bs);
 
@@ -2290,6 +2293,8 @@ void qmp_transaction(TransactionActionList *dev_list,
     BlkActionState *state, *next;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
     QTAILQ_INIT(&snap_bdrv_states);
 
@@ -3583,6 +3588,8 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     AioContext *aio_context;
     BlockDriverState *bs;
 
+    assert(qemu_in_main_thread());
+
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-- 
2.27.0


