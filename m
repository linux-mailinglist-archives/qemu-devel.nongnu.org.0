Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1095A689E10
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxu4-0007XG-TC; Fri, 03 Feb 2023 10:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxu1-0007T6-N8
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxtz-0005ML-Mu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EH+7Hq7DlBviiyJzr3E1dGvYTqlIAtdXFSDO3noMALQ=;
 b=fi/4f3aheUudZdfcxoYgUk3wvCOCq8mzUaounvV4WoVZMEwc0yUscK7u/q7gJ8Huz0R8R1
 KApPb4CYCmO7OL0k0128NCxIOh0VyuyOtilQ7iBe6nKqwpZWyXhzAD5Hbmc9ZEKM9Wa9Vp
 iqPxP46XH7XKWhXtoRATUgYkdSFibxc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-NZ-jM4-LNE-1IExE-RqNhA-1; Fri, 03 Feb 2023 10:22:55 -0500
X-MC-Unique: NZ-jM4-LNE-1IExE-RqNhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DA3985D062;
 Fri,  3 Feb 2023 15:22:55 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71090410B1AD;
 Fri,  3 Feb 2023 15:22:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 14/23] block: Mark bdrv_co_copy_range() GRAPH_RDLOCK
Date: Fri,  3 Feb 2023 16:21:53 +0100
Message-Id: <20230203152202.49054-15-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
index 7481ccddb6..bdb8a56c9e 100644
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
index a56e565b12..b060561929 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3243,6 +3243,7 @@ static int coroutine_fn GRAPH_RDLOCK bdrv_co_copy_range_internal(
 {
     BdrvTrackedRequest req;
     int ret;
+    assert_bdrv_graph_readable();
 
     /* TODO We can support BDRV_REQ_NO_FALLBACK here */
     assert(!(read_flags & BDRV_REQ_NO_FALLBACK));
@@ -3324,7 +3325,7 @@ int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
                                          BdrvRequestFlags write_flags)
 {
     IO_CODE();
-    assume_graph_lock(); /* FIXME */
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, bytes,
                                   read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3342,7 +3343,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_offset,
                                        BdrvRequestFlags write_flags)
 {
     IO_CODE();
-    assume_graph_lock(); /* FIXME */
+    assert_bdrv_graph_readable();
     trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, bytes,
                                 read_flags, write_flags);
     return bdrv_co_copy_range_internal(src, src_offset, dst, dst_offset,
@@ -3355,6 +3356,8 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     BdrvRequestFlags write_flags)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
+
     return bdrv_co_copy_range_from(src, src_offset,
                                    dst, dst_offset,
                                    bytes, read_flags, write_flags);
diff --git a/block/iscsi.c b/block/iscsi.c
index b3e10f40b6..2aa5975543 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2186,14 +2186,12 @@ static void coroutine_fn iscsi_co_invalidate_cache(BlockDriverState *bs,
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
@@ -2327,14 +2325,12 @@ static void iscsi_xcopy_data(struct iscsi_data *data,
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
2.38.1


