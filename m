Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0466A0FE7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhZ-0006zG-Om; Thu, 23 Feb 2023 13:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhP-0006qh-4d
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhN-00039e-5p
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efuwshswUNH9W5KguHoxBNUCy3/Fc5/WAxyBkN+jEXw=;
 b=bIHpVqYkLwHhoNOE6yKmDMRgxYXJu+rylm5ke/IZ/E2MShjTJZKY3u2NeGpzDmAZWMuRO1
 oCa7ryMuTV9pkbQmNikukRBXKKbc80WCgcx4STsZqj4bTgdQ2CabF7p0UPuVvqXCQ2NyCM
 lxiahr0aBjCQgERnje7QlQOaf/hZgcU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-GjdHt4idMO2d8SAuqVVjiA-1; Thu, 23 Feb 2023 13:52:05 -0500
X-MC-Unique: GjdHt4idMO2d8SAuqVVjiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1C0C1816ECE;
 Thu, 23 Feb 2023 18:52:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA2F1121315;
 Thu, 23 Feb 2023 18:52:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 14/29] block: Mark bdrv_co_copy_range() GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:31 +0100
Message-Id: <20230223185146.306454-15-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_copy_range() need to hold a reader lock for the graph.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-15-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         |  9 +++++----
 include/block/block_int-common.h | 24 ++++++++----------------
 include/block/block_int-io.h     | 20 ++++++++++----------
 block/block-backend.c            |  2 ++
 block/file-posix.c               | 16 +++++++---------
 block/io.c                       |  7 +++++--
 block/iscsi.c                    | 28 ++++++++++++----------------
 block/qcow2.c                    |  5 ++---
 block/raw-format.c               | 28 ++++++++++++----------------
 qemu-img.c                       |  4 +++-
 10 files changed, 66 insertions(+), 77 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index bbe8a5659a..c551742a86 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -274,10 +274,11 @@ bool co_wrapper bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs,
  *
  * Returns: 0 if succeeded; negative error code if failed.
  **/
-int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
-                                    BdrvChild *dst, int64_t dst_offset,
-                                    int64_t bytes, BdrvRequestFlags read_flags,
-                                    BdrvRequestFlags write_flags);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
+                   BdrvChild *dst, int64_t dst_offset,
+                   int64_t bytes, BdrvRequestFlags read_flags,
+                   BdrvRequestFlags write_flags);
 
 /*
  * "I/O or GS" API functions. These functions can run without
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 192841f040..29b230cc0b 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -559,14 +559,10 @@ struct BlockDriver {
      * See the comment of bdrv_co_copy_range for the parameter and return value
      * semantics.
      */
-    int coroutine_fn (*bdrv_co_copy_range_from)(BlockDriverState *bs,
-                                                BdrvChild *src,
-                                                int64_t offset,
-                                                BdrvChild *dst,
-                                                int64_t dst_offset,
-                                                int64_t bytes,
-                                                BdrvRequestFlags read_flags,
-                                                BdrvRequestFlags write_flags);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_copy_range_from)(
+        BlockDriverState *bs, BdrvChild *src, int64_t offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
+        BdrvRequestFlags read_flags, BdrvRequestFlags write_flags);
 
     /*
      * Map [offset, offset + nbytes) range onto a child of bs to copy data to,
@@ -577,14 +573,10 @@ struct BlockDriver {
      * See the comment of bdrv_co_copy_range for the parameter and return value
      * semantics.
      */
-    int coroutine_fn (*bdrv_co_copy_range_to)(BlockDriverState *bs,
-                                              BdrvChild *src,
-                                              int64_t src_offset,
-                                              BdrvChild *dst,
-                                              int64_t dst_offset,
-                                              int64_t bytes,
-                                              BdrvRequestFlags read_flags,
-                                              BdrvRequestFlags write_flags);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_copy_range_to)(
+        BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
+        BdrvChild *dst, int64_t dst_offset, int64_t bytes,
+        BdrvRequestFlags read_flags, BdrvRequestFlags write_flags);
 
     /*
      * Building block for bdrv_block_status[_above] and
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 34d4b0fb8e..5788bd66ba 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -113,16 +113,16 @@ void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
 void bdrv_inc_in_flight(BlockDriverState *bs);
 void bdrv_dec_in_flight(BlockDriverState *bs);
 
-int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
-                                         BdrvChild *dst, int64_t dst_offset,
-                                         int64_t bytes,
-                                         BdrvRequestFlags read_flags,
-                                         BdrvRequestFlags write_flags);
-int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
-                                       BdrvChild *dst, int64_t dst_offset,
-                                       int64_t bytes,
-                                       BdrvRequestFlags read_flags,
-                                       BdrvRequestFlags write_flags);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
+                        BdrvChild *dst, int64_t dst_offset,
+                        int64_t bytes, BdrvRequestFlags read_flags,
+                        BdrvRequestFlags write_flags);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
+                      BdrvChild *dst, int64_t dst_offset,
+                      int64_t bytes, BdrvRequestFlags read_flags,
+                      BdrvRequestFlags write_flags);
 
 int coroutine_fn bdrv_co_refresh_total_sectors(BlockDriverState *bs,
                                                int64_t hint);
diff --git a/block/block-backend.c b/block/block-backend.c
index 146ef91547..fdb1e1d5f7 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2644,6 +2644,8 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
     if (r) {
         return r;
     }
+
+    GRAPH_RDLOCK_GUARD();
     return bdrv_co_copy_range(blk_in->root, off_in,
                               blk_out->root, off_out,
                               bytes, read_flags, write_flags);
diff --git a/block/file-posix.c b/block/file-posix.c
index d106f4efa5..13da095efa 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3272,7 +3272,7 @@ static void raw_abort_perm_update(BlockDriverState *bs)
     raw_handle_perm_lock(bs, RAW_PL_ABORT, 0, 0, NULL);
 }
 
-static int coroutine_fn raw_co_copy_range_from(
+static int coroutine_fn GRAPH_RDLOCK raw_co_copy_range_from(
         BlockDriverState *bs, BdrvChild *src, int64_t src_offset,
         BdrvChild *dst, int64_t dst_offset, int64_t bytes,
         BdrvRequestFlags read_flags, BdrvRequestFlags write_flags)
@@ -3281,14 +3281,12 @@ static int coroutine_fn raw_co_copy_range_from(
                                  read_flags, write_flags);
 }
 
-static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
-                                             BdrvChild *src,
-                                             int64_t src_offset,
-                                             BdrvChild *dst,
-                                             int64_t dst_offset,
-                                             int64_t bytes,
-                                             BdrvRequestFlags read_flags,
-                                             BdrvRequestFlags write_flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_copy_range_to(BlockDriverState *bs,
+                     BdrvChild *src, int64_t src_offset,
+                     BdrvChild *dst, int64_t dst_offset,
+                     int64_t bytes, BdrvRequestFlags read_flags,
+                     BdrvRequestFlags write_flags)
 {
     RawPosixAIOData acb;
     BDRVRawState *s = bs->opaque;
diff --git a/block/io.c b/block/io.c
index 628b350002..86e5ea362d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3246,6 +3246,7 @@ static int coroutine_fn GRAPH_RDLOCK bdrv_co_copy_range_internal(
 {
     BdrvTrackedRequest req;
     int ret;
+    assert_bdrv_graph_readable();
 
     /* TODO We can support BDRV_REQ_NO_FALLBACK here */
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
@@ -3327,7 +3328,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
                                          BdrvRequestFlags write_flags)
 {
     IO_CODE();
-    assume_graph_lock(); /* FIXME */
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3345,7 +3346,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags write_flags)
 {
     IO_CODE();
-    assume_graph_lock(); /* FIXME */
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3358,6 +3359,8 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     return bdrv_co_copy_range_from(src, src_offset,
                                    dst, dst_offset,
                                    bytes, read_flags, write_flags);
diff --git a/block/iscsi.c b/block/iscsi.c
index dc9a33bbff..9fc0bed90b 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2190,14 +2190,12 @@ static void coroutine_fn iscsi_co_invalidate_cache(BlockDriverState *bs,
     iscsi_allocmap_invalidate(iscsilun);
 }
 
-static int coroutine_fn iscsi_co_copy_range_from(BlockDriverState *bs,
-                                                 BdrvChild *src,
-                                                 int64_t src_offset,
-                                                 BdrvChild *dst,
-                                                 int64_t dst_offset,
-                                                 int64_t bytes,
-                                                 BdrvRequestFlags read_flags,
-                                                 BdrvRequestFlags write_flags)
+static int coroutine_fn GRAPH_RDLOCK
+iscsi_co_copy_range_from(BlockDriverState *bs,
+                         BdrvChild *src, int64_t src_offset,
+                         BdrvChild *dst, int64_t dst_offset,
+                         int64_t bytes, BdrvRequestFlags read_flags,
+                         BdrvRequestFlags write_flags)
 {
     return bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                  read_flags, write_flags);
@@ -2331,14 +2329,12 @@ static void iscsi_xcopy_data(struct iscsi_data *data,
                               src_lba, dst_lba);
 }
 
-static int coroutine_fn iscsi_co_copy_range_to(BlockDriverState *bs,
-                                               BdrvChild *src,
-                                               int64_t src_offset,
-                                               BdrvChild *dst,
-                                               int64_t dst_offset,
-                                               int64_t bytes,
-                                               BdrvRequestFlags read_flags,
-                                               BdrvRequestFlags write_flags)
+static int coroutine_fn GRAPH_RDLOCK
+iscsi_co_copy_range_to(BlockDriverState *bs,
+                       BdrvChild *src, int64_t src_offset,
+                       BdrvChild *dst, int64_t dst_offset,
+                       int64_t bytes, BdrvRequestFlags read_flags,
+                       BdrvRequestFlags write_flags)
 {
     IscsiLun *dst_lun = dst->bs->opaque;
     IscsiLun *src_lun;
diff --git a/block/qcow2.c b/block/qcow2.c
index ddf9394bf0..c318f41f38 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4065,7 +4065,7 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_copy_range_from(BlockDriverState *bs,
                          BdrvChild *src, int64_t src_offset,
                          BdrvChild *dst, int64_t dst_offset,
@@ -4148,7 +4148,7 @@ out:
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_copy_range_to(BlockDriverState *bs,
                        BdrvChild *src, int64_t src_offset,
                        BdrvChild *dst, int64_t dst_offset,
@@ -4161,7 +4161,6 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
     uint64_t host_offset;
     QCowL2Meta *l2meta = NULL;
 
-    assume_graph_lock(); /* FIXME */
     assert(!bs->encrypted);
 
     qemu_co_mutex_lock(&s->lock);
diff --git a/block/raw-format.c b/block/raw-format.c
index 92adf97ab0..9913cb8174 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -536,14 +536,12 @@ static int raw_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
     return bdrv_probe_geometry(bs->file->bs, geo);
 }
 
-static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
-                                               BdrvChild *src,
-                                               int64_t src_offset,
-                                               BdrvChild *dst,
-                                               int64_t dst_offset,
-                                               int64_t bytes,
-                                               BdrvRequestFlags read_flags,
-                                               BdrvRequestFlags write_flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_copy_range_from(BlockDriverState *bs,
+                       BdrvChild *src, int64_t src_offset,
+                       BdrvChild *dst, int64_t dst_offset,
+                       int64_t bytes, BdrvRequestFlags read_flags,
+                       BdrvRequestFlags write_flags)
 {
     int ret;
 
@@ -555,14 +553,12 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
                                    bytes, read_flags, write_flags);
 }
 
-static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
-                                             BdrvChild *src,
-                                             int64_t src_offset,
-                                             BdrvChild *dst,
-                                             int64_t dst_offset,
-                                             int64_t bytes,
-                                             BdrvRequestFlags read_flags,
-                                             BdrvRequestFlags write_flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_copy_range_to(BlockDriverState *bs,
+                     BdrvChild *src, int64_t src_offset,
+                     BdrvChild *dst, int64_t dst_offset,
+                     int64_t bytes, BdrvRequestFlags read_flags,
+                     BdrvRequestFlags write_flags)
 {
     int ret;
 
diff --git a/qemu-img.c b/qemu-img.c
index cd0178b51b..9aeac69fa6 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2041,7 +2041,9 @@ retry:
 
         if (s->ret == -EINPROGRESS) {
             if (copy_range) {
-                ret = convert_co_copy_range(s, sector_num, n);
+                WITH_GRAPH_RDLOCK_GUARD() {
+                    ret = convert_co_copy_range(s, sector_num, n);
+                }
                 if (ret) {
                     s->copy_range = false;
                     goto retry;
-- 
2.39.2


