Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DFE4CC149
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:31:01 +0100 (CET)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnPw-00087i-RZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEC-00079t-HD
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEA-0005d6-Dq
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvmwUR7g8Dazg9LTDTySnlj7SB7PRgNHUqp8dpK4qK4=;
 b=NIqbq1eUZBv1a5pjnR2SjjkoKJ3wLwFTDzBYMSrE/o1WVsY9pb4Q3CQ+Dm3ExV+OFEZjBh
 pvghGI5D7V4PAWYne3UPGihv2iVHfJi6YNmm92oh602bS7RVunkzgd0NZY04t7aC0vHoWc
 qiLtrJ8STfquMHJnsXEQA777Go5J3zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-2coAKO6VPKOiKzEXp9m4bg-1; Thu, 03 Mar 2022 10:18:46 -0500
X-MC-Unique: 2coAKO6VPKOiKzEXp9m4bg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 362E551DF;
 Thu,  3 Mar 2022 15:18:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D1677C032;
 Thu,  3 Mar 2022 15:18:43 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 13/31] IO_CODE and IO_OR_GS_CODE for block_int I/O API
Date: Thu,  3 Mar 2022 10:15:58 -0500
Message-Id: <20220303151616.325444-14-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Mark all I/O functions with IO_CODE, and all "I/O OR GS" with
IO_OR_GS_CODE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                      | 14 +++++++++++++-
 block/block-backend.c        |  2 ++
 block/dirty-bitmap.c         |  3 +++
 block/io.c                   | 13 +++++++++++++
 include/block/block_int-io.h |  6 ++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3bf2689a99..cf656e5b26 100644
--- a/block.c
+++ b/block.c
@@ -999,6 +999,7 @@ BlockDriver *bdrv_probe_all(const uint8_t *buf, int buf_size,
 {
     int score_max = 0, score;
     BlockDriver *drv = NULL, *d;
+    IO_CODE();
 
     QLIST_FOREACH(d, &bdrv_drivers, list) {
         if (d->bdrv_probe) {
@@ -1051,6 +1052,7 @@ static int find_image_format(BlockBackend *file, const char *filename,
 int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 {
     BlockDriver *drv = bs->drv;
+    IO_CODE();
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -6197,6 +6199,7 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
 {
     BdrvChild *c;
     const char *name;
+    IO_CODE();
 
     /* If multiple parents have a name, just pick the first one. */
     QLIST_FOREACH(c, &bs->parents, next_parent) {
@@ -7933,6 +7936,8 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
  */
 BdrvChild *bdrv_cow_child(BlockDriverState *bs)
 {
+    IO_CODE();
+
     if (!bs || !bs->drv) {
         return NULL;
     }
@@ -7956,6 +7961,7 @@ BdrvChild *bdrv_cow_child(BlockDriverState *bs)
 BdrvChild *bdrv_filter_child(BlockDriverState *bs)
 {
     BdrvChild *c;
+    IO_CODE();
 
     if (!bs || !bs->drv) {
         return NULL;
@@ -7987,6 +7993,7 @@ BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs)
 {
     BdrvChild *cow_child = bdrv_cow_child(bs);
     BdrvChild *filter_child = bdrv_filter_child(bs);
+    IO_CODE();
 
     /* Filter nodes cannot have COW backing files */
     assert(!(cow_child && filter_child));
@@ -8007,6 +8014,7 @@ BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs)
 BdrvChild *bdrv_primary_child(BlockDriverState *bs)
 {
     BdrvChild *c, *found = NULL;
+    IO_CODE();
 
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & BDRV_CHILD_PRIMARY) {
@@ -8069,6 +8077,7 @@ BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
  */
 BlockDriverState *bdrv_skip_filters(BlockDriverState *bs)
 {
+    IO_CODE();
     return bdrv_do_skip_filters(bs, false);
 }
 
@@ -8078,6 +8087,7 @@ BlockDriverState *bdrv_skip_filters(BlockDriverState *bs)
  */
 BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
 {
+    IO_CODE();
     return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
 }
 
@@ -8113,8 +8123,8 @@ static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
  */
 bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
 {
+    IO_CODE();
     RCU_READ_LOCK_GUARD();
-
     return bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
 }
 
@@ -8124,6 +8134,7 @@ bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
 void bdrv_bsc_invalidate_range(BlockDriverState *bs,
                                int64_t offset, int64_t bytes)
 {
+    IO_CODE();
     RCU_READ_LOCK_GUARD();
 
     if (bdrv_bsc_range_overlaps_locked(bs, offset, bytes, NULL)) {
@@ -8138,6 +8149,7 @@ void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BdrvBlockStatusCache *new_bsc = g_new(BdrvBlockStatusCache, 1);
     BdrvBlockStatusCache *old_bsc;
+    IO_CODE();
 
     *new_bsc = (BdrvBlockStatusCache) {
         .valid = true,
diff --git a/block/block-backend.c b/block/block-backend.c
index 93dc5cd8d6..7d2181ec01 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1115,6 +1115,7 @@ bool blk_dev_has_removable_media(BlockBackend *blk)
  */
 bool blk_dev_has_tray(BlockBackend *blk)
 {
+    IO_CODE();
     return blk->dev_ops && blk->dev_ops->is_tray_open;
 }
 
@@ -1135,6 +1136,7 @@ void blk_dev_eject_request(BlockBackend *blk, bool force)
  */
 bool blk_dev_is_tray_open(BlockBackend *blk)
 {
+    IO_CODE();
     if (blk_dev_has_tray(blk)) {
         return blk->dev_ops->is_tray_open(blk->dev_opaque);
     }
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index e2a1648deb..0334b85805 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -657,6 +657,7 @@ void bdrv_reset_dirty_bitmap(BdrvDirtyBitmap *bitmap,
 
 void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out)
 {
+    IO_CODE();
     assert(!bdrv_dirty_bitmap_readonly(bitmap));
     bdrv_dirty_bitmaps_lock(bitmap->bs);
     if (!out) {
@@ -739,6 +740,7 @@ void bdrv_dirty_bitmap_deserialize_finish(BdrvDirtyBitmap *bitmap)
 void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
     BdrvDirtyBitmap *bitmap;
+    IO_CODE();
 
     if (QLIST_EMPTY(&bs->dirty_bitmaps)) {
         return;
@@ -930,6 +932,7 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       bool lock)
 {
     bool ret;
+    IO_CODE();
 
     assert(!bdrv_dirty_bitmap_readonly(dest));
     assert(!bdrv_dirty_bitmap_inconsistent(dest));
diff --git a/block/io.c b/block/io.c
index 83bf18c1fe..6a0bad10a3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -570,6 +570,7 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 {
     int i;
+    IO_OR_GS_CODE();
 
     for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_begin(child->bs, true, child, false, true);
@@ -580,6 +581,7 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
 {
     int drained_end_counter = 0;
     int i;
+    IO_OR_GS_CODE();
 
     for (i = 0; i < old_parent->recursive_quiesce_counter; i++) {
         bdrv_do_drained_end(child->bs, true, child, false,
@@ -887,6 +889,7 @@ BdrvTrackedRequest *coroutine_fn bdrv_co_get_self_request(BlockDriverState *bs)
 {
     BdrvTrackedRequest *req;
     Coroutine *self = qemu_coroutine_self();
+    IO_CODE();
 
     QLIST_FOREACH(req, &bs->tracked_requests, list) {
         if (req->co == self) {
@@ -932,16 +935,19 @@ static int bdrv_get_cluster_size(BlockDriverState *bs)
 
 void bdrv_inc_in_flight(BlockDriverState *bs)
 {
+    IO_CODE();
     qatomic_inc(&bs->in_flight);
 }
 
 void bdrv_wakeup(BlockDriverState *bs)
 {
+    IO_CODE();
     aio_wait_kick();
 }
 
 void bdrv_dec_in_flight(BlockDriverState *bs)
 {
+    IO_CODE();
     qatomic_dec(&bs->in_flight);
     bdrv_wakeup(bs);
 }
@@ -966,6 +972,7 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
                                                 uint64_t align)
 {
     bool waited;
+    IO_CODE();
 
     qemu_co_mutex_lock(&req->bs->reqs_lock);
 
@@ -1822,6 +1829,7 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
+    IO_CODE();
     return bdrv_co_preadv_part(child, offset, bytes, qiov, 0, flags);
 }
 
@@ -1834,6 +1842,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     BdrvTrackedRequest req;
     BdrvRequestPadding pad;
     int ret;
+    IO_CODE();
 
     trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
@@ -2255,6 +2264,7 @@ int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags)
 {
+    IO_CODE();
     return bdrv_co_pwritev_part(child, offset, bytes, qiov, 0, flags);
 }
 
@@ -2268,6 +2278,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     BdrvRequestPadding pad;
     int ret;
     bool padded = false;
+    IO_CODE();
 
     trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
@@ -3451,6 +3462,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
                                          BdrvRequestFlags read_flags,
                                          BdrvRequestFlags write_flags)
 {
+    IO_CODE();
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3467,6 +3479,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags read_flags,
                                        BdrvRequestFlags write_flags)
 {
+    IO_CODE();
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 677b8b49f4..3da5f01c42 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -50,6 +50,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
     int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_CODE();
 
     return bdrv_co_preadv(child, offset, bytes, &qiov, flags);
 }
@@ -58,6 +59,7 @@ static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
     int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
+    IO_CODE();
 
     return bdrv_co_pwritev(child, offset, bytes, &qiov, flags);
 }
@@ -120,21 +122,25 @@ BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs);
 
 static inline BlockDriverState *bdrv_cow_bs(BlockDriverState *bs)
 {
+    IO_CODE();
     return child_bs(bdrv_cow_child(bs));
 }
 
 static inline BlockDriverState *bdrv_filter_bs(BlockDriverState *bs)
 {
+    IO_CODE();
     return child_bs(bdrv_filter_child(bs));
 }
 
 static inline BlockDriverState *bdrv_filter_or_cow_bs(BlockDriverState *bs)
 {
+    IO_CODE();
     return child_bs(bdrv_filter_or_cow_child(bs));
 }
 
 static inline BlockDriverState *bdrv_primary_bs(BlockDriverState *bs)
 {
+    IO_CODE();
     return child_bs(bdrv_primary_child(bs));
 }
 
-- 
2.31.1


