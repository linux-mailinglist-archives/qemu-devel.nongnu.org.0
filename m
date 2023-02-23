Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80706A0FD1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhJ-0006mF-2B; Thu, 23 Feb 2023 13:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhG-0006kP-AK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhD-0002ue-QR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDRGbnEDbcsZxBLgnF6tSdN5oYvYd7u38MD2XJZG2xg=;
 b=KwaA7Lmtee9IDNqxhj6ngmNDflTHHoKdsRnInaFuWeHltuK2xWlx1m/qGOJLLXXPOkhTxf
 t/cfvoLs6sZmu/Rg0xsSzbKQyDvVd60NqDpJUYE2KQxMOuwkJJI4J3R/i7ZJCu7aYvN1AL
 FMXwtSNI5EzyqsABhoa+F5ns3jySYXs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-u2tQm1NeMGqvABmg-sJyGA-1; Thu, 23 Feb 2023 13:51:55 -0500
X-MC-Unique: u2tQm1NeMGqvABmg-sJyGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6489C86C14C;
 Thu, 23 Feb 2023 18:51:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9776A1121314;
 Thu, 23 Feb 2023 18:51:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/29] block: Mark bdrv_co_block_status() and callers
 GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:21 +0100
Message-Id: <20230223185146.306454-5-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This adds GRAPH_RDLOCK annotations to declare that callers of
bdrv_co_block_status() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-5-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/coroutines.h               |  2 +-
 include/block/block-copy.h       |  6 +++---
 include/block/block-io.h         | 22 +++++++++++-----------
 include/block/block_int-common.h |  3 ++-
 block/backup.c                   |  3 +++
 block/block-backend.c            |  2 ++
 block/block-copy.c               | 19 +++++++++++--------
 block/io.c                       | 13 ++++++++-----
 block/mirror.c                   | 14 +++++++++-----
 block/qcow.c                     | 11 ++++-------
 block/quorum.c                   |  9 ++++-----
 block/stream.c                   | 32 ++++++++++++++++++--------------
 qemu-img.c                       |  4 +++-
 tests/unit/test-block-iothread.c |  3 ++-
 14 files changed, 81 insertions(+), 62 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 2a1e0b3c9d..dd9f3d449b 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -43,7 +43,7 @@ bdrv_co_check(BlockDriverState *bs, BdrvCheckResult *res, BdrvCheckMode fix);
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
 
-int coroutine_fn
+int coroutine_fn GRAPH_RDLOCK
 bdrv_co_common_block_status_above(BlockDriverState *bs,
                                   BlockDriverState *base,
                                   bool include_base,
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index d0f8386554..0700953ab8 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -36,9 +36,9 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 void block_copy_state_free(BlockCopyState *s);
 
 void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
-int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
-                                                  int64_t offset,
-                                                  int64_t *count);
+
+int64_t coroutine_fn GRAPH_RDLOCK
+block_copy_reset_unallocated(BlockCopyState *s, int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool ignore_ratelimit, uint64_t timeout_ns,
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 9a09ec2bdd..6303501b0f 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -109,24 +109,24 @@ int bdrv_block_status(BlockDriverState *bs, int64_t offset,
                       int64_t bytes, int64_t *pnum, int64_t *map,
                       BlockDriverState **file);
 
-int coroutine_fn bdrv_co_block_status_above(BlockDriverState *bs,
-                                            BlockDriverState *base,
-                                            int64_t offset, int64_t bytes,
-                                            int64_t *pnum, int64_t *map,
-                                            BlockDriverState **file);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_block_status_above(BlockDriverState *bs, BlockDriverState *base,
+                           int64_t offset, int64_t bytes, int64_t *pnum,
+                           int64_t *map, BlockDriverState **file);
 int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
                             int64_t offset, int64_t bytes, int64_t *pnum,
                             int64_t *map, BlockDriverState **file);
 
-int coroutine_fn bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset,
-                                      int64_t bytes, int64_t *pnum);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     int64_t *pnum);
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum);
 
-int coroutine_fn bdrv_co_is_allocated_above(BlockDriverState *top,
-                                            BlockDriverState *base,
-                                            bool include_base, int64_t offset,
-                                            int64_t bytes, int64_t *pnum);
+int coroutine_fn GRAPH_RDLOCK
+bdrv_co_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
+                           bool include_base, int64_t offset, int64_t bytes,
+                           int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index eaf62beaff..5f0104a1af 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -606,7 +606,8 @@ struct BlockDriver {
      * *pnum value for the block-status cache on protocol nodes, prior
      * to clamping *pnum for return to its caller.
      */
-    int coroutine_fn (*bdrv_co_block_status)(BlockDriverState *bs,
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_block_status)(
+        BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
 
diff --git a/block/backup.c b/block/backup.c
index 824d39acaa..46fca2459d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -270,7 +270,10 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
                 return -ECANCELED;
             }
 
+            /* rdlock protects the subsequent call to bdrv_is_allocated() */
+            bdrv_graph_co_rdlock();
             ret = block_copy_reset_unallocated(s->bcs, offset, &count);
+            bdrv_graph_co_rdunlock();
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/block-backend.c b/block/block-backend.c
index f25f3ba5e7..f5d9e3e269 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1431,6 +1431,7 @@ int coroutine_fn blk_co_block_status_above(BlockBackend *blk,
                                            BlockDriverState **file)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
     return bdrv_co_block_status_above(blk_bs(blk), base, offset, bytes, pnum,
                                       map, file);
 }
@@ -1441,6 +1442,7 @@ int coroutine_fn blk_co_is_allocated_above(BlockBackend *blk,
                                            int64_t bytes, int64_t *pnum)
 {
     IO_CODE();
+    GRAPH_RDLOCK_GUARD();
     return bdrv_co_is_allocated_above(blk_bs(blk), base, include_base, offset,
                                       bytes, pnum);
 }
diff --git a/block/block-copy.c b/block/block-copy.c
index 30a4da0f2e..d299fac7cc 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -581,9 +581,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     return ret;
 }
 
-static coroutine_fn int block_copy_block_status(BlockCopyState *s,
-                                                int64_t offset,
-                                                int64_t bytes, int64_t *pnum)
+static coroutine_fn GRAPH_RDLOCK
+int block_copy_block_status(BlockCopyState *s, int64_t offset, int64_t bytes,
+                            int64_t *pnum)
 {
     int64_t num;
     BlockDriverState *base;
@@ -618,9 +618,9 @@ static coroutine_fn int block_copy_block_status(BlockCopyState *s,
  * Check if the cluster starting at offset is allocated or not.
  * return via pnum the number of contiguous clusters sharing this allocation.
  */
-static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
-                                                        int64_t offset,
-                                                        int64_t *pnum)
+static int coroutine_fn GRAPH_RDLOCK
+block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
+                                int64_t *pnum)
 {
     BlockDriverState *bs = s->source->bs;
     int64_t count, total_count = 0;
@@ -630,6 +630,7 @@ static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
 
     while (true) {
+        /* protected in backup_run() */
         ret = bdrv_co_is_allocated(bs, offset, bytes, &count);
         if (ret < 0) {
             return ret;
@@ -704,7 +705,7 @@ int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
  * Returns 1 if dirty clusters found and successfully copied, 0 if no dirty
  * clusters found and -errno on failure.
  */
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 block_copy_dirty_clusters(BlockCopyCallState *call_state)
 {
     BlockCopyState *s = call_state->s;
@@ -827,7 +828,8 @@ void block_copy_kick(BlockCopyCallState *call_state)
  * it means that some I/O operation failed in context of _this_ block_copy call,
  * not some parallel operation.
  */
-static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
+static int coroutine_fn GRAPH_RDLOCK
+block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
     BlockCopyState *s = call_state->s;
@@ -892,6 +894,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 
 static void coroutine_fn block_copy_async_co_entry(void *opaque)
 {
+    GRAPH_RDLOCK_GUARD();
     block_copy_common(opaque);
 }
 
diff --git a/block/io.c b/block/io.c
index 35025fc11b..a0f8efc9a1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2224,11 +2224,10 @@ int bdrv_flush_all(void)
  * BDRV_BLOCK_OFFSET_VALID bit is set, 'map' and 'file' (if non-NULL) are
  * set to the host mapping and BDS corresponding to the guest offset.
  */
-static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
-                                             bool want_zero,
-                                             int64_t offset, int64_t bytes,
-                                             int64_t *pnum, int64_t *map,
-                                             BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_co_block_status(BlockDriverState *bs, bool want_zero,
+                     int64_t offset, int64_t bytes,
+                     int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
     int64_t total_size;
     int64_t n; /* bytes */
@@ -2240,6 +2239,7 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     bool has_filtered_child;
 
     assert(pnum);
+    assert_bdrv_graph_readable();
     *pnum = 0;
     total_size = bdrv_getlength(bs);
     if (total_size < 0) {
@@ -2470,6 +2470,7 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
     IO_CODE();
 
     assert(!include_base || base); /* Can't include NULL base */
+    assert_bdrv_graph_readable();
 
     if (!depth) {
         depth = &dummy;
@@ -2595,6 +2596,8 @@ int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
     int64_t pnum = bytes;
     IO_CODE();
 
+    assume_graph_lock(); /* FIXME */
+
     if (!bytes) {
         return 1;
     }
diff --git a/block/mirror.c b/block/mirror.c
index fbbb4f619e..94c523af28 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -558,9 +558,11 @@ static uint64_t coroutine_fn mirror_iteration(MirrorBlockJob *s)
         MirrorMethod mirror_method = MIRROR_METHOD_COPY;
 
         assert(!(offset % s->granularity));
-        ret = bdrv_block_status_above(source, NULL, offset,
-                                      nb_chunks * s->granularity,
-                                      &io_bytes, NULL, NULL);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_block_status_above(source, NULL, offset,
+                                        nb_chunks * s->granularity,
+                                        &io_bytes, NULL, NULL);
+        }
         if (ret < 0) {
             io_bytes = MIN(nb_chunks * s->granularity, max_io_bytes);
         } else if (ret & BDRV_BLOCK_DATA) {
@@ -863,8 +865,10 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
             return 0;
         }
 
-        ret = bdrv_is_allocated_above(bs, s->base_overlay, true, offset, bytes,
-                                      &count);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_is_allocated_above(bs, s->base_overlay, true, offset,
+                                          bytes, &count);
+        }
         if (ret < 0) {
             return ret;
         }
diff --git a/block/qcow.c b/block/qcow.c
index 5eb1ab5e59..2d19a78818 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -524,19 +524,16 @@ get_cluster_offset(BlockDriverState *bs, uint64_t offset, int allocate,
     return 1;
 }
 
-static int coroutine_fn qcow_co_block_status(BlockDriverState *bs,
-                                             bool want_zero,
-                                             int64_t offset, int64_t bytes,
-                                             int64_t *pnum, int64_t *map,
-                                             BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+qcow_co_block_status(BlockDriverState *bs, bool want_zero,
+                     int64_t offset, int64_t bytes, int64_t *pnum,
+                     int64_t *map, BlockDriverState **file)
 {
     BDRVQcowState *s = bs->opaque;
     int index_in_cluster, ret;
     int64_t n;
     uint64_t cluster_offset;
 
-    assume_graph_lock(); /* FIXME */
-
     qemu_co_mutex_lock(&s->lock);
     ret = get_cluster_offset(bs, offset, 0, 0, 0, 0, &cluster_offset);
     qemu_co_mutex_unlock(&s->lock);
diff --git a/block/quorum.c b/block/quorum.c
index d1dcf2eaba..f3fe067541 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1217,11 +1217,10 @@ static void quorum_child_perm(BlockDriverState *bs, BdrvChild *c,
  * return BDRV_BLOCK_ZERO if *all* children agree that a certain
  * region contains zeroes, and BDRV_BLOCK_DATA otherwise.
  */
-static int coroutine_fn quorum_co_block_status(BlockDriverState *bs,
-                                               bool want_zero,
-                                               int64_t offset, int64_t count,
-                                               int64_t *pnum, int64_t *map,
-                                               BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+quorum_co_block_status(BlockDriverState *bs, bool want_zero,
+                       int64_t offset, int64_t count,
+                       int64_t *pnum, int64_t *map, BlockDriverState **file)
 {
     BDRVQuorumState *s = bs->opaque;
     int i, ret;
diff --git a/block/stream.c b/block/stream.c
index 8744ad103f..22368ce186 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -161,21 +161,25 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 
         copy = false;
 
-        ret = bdrv_is_allocated(unfiltered_bs, offset, STREAM_CHUNK, &n);
-        if (ret == 1) {
-            /* Allocated in the top, no need to copy.  */
-        } else if (ret >= 0) {
-            /* Copy if allocated in the intermediate images.  Limit to the
-             * known-unallocated area [offset, offset+n*BDRV_SECTOR_SIZE).  */
-            ret = bdrv_is_allocated_above(bdrv_cow_bs(unfiltered_bs),
-                                          s->base_overlay, true,
-                                          offset, n, &n);
-            /* Finish early if end of backing file has been reached */
-            if (ret == 0 && n == 0) {
-                n = len - offset;
+        WITH_GRAPH_RDLOCK_GUARD() {
+            ret = bdrv_is_allocated(unfiltered_bs, offset, STREAM_CHUNK, &n);
+            if (ret == 1) {
+                /* Allocated in the top, no need to copy.  */
+            } else if (ret >= 0) {
+                /*
+                 * Copy if allocated in the intermediate images.  Limit to the
+                 * known-unallocated area [offset, offset+n*BDRV_SECTOR_SIZE).
+                 */
+                ret = bdrv_is_allocated_above(bdrv_cow_bs(unfiltered_bs),
+                                            s->base_overlay, true,
+                                            offset, n, &n);
+                /* Finish early if end of backing file has been reached */
+                if (ret == 0 && n == 0) {
+                    n = len - offset;
+                }
+
+                copy = (ret > 0);
             }
-
-            copy = (ret > 0);
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
diff --git a/qemu-img.c b/qemu-img.c
index 7c05931866..cd0178b51b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1991,7 +1991,9 @@ static void coroutine_fn convert_co_do_copy(void *opaque)
             qemu_co_mutex_unlock(&s->lock);
             break;
         }
-        n = convert_iteration_sectors(s, s->sector_num);
+        WITH_GRAPH_RDLOCK_GUARD() {
+            n = convert_iteration_sectors(s, s->sector_num);
+        }
         if (n < 0) {
             qemu_co_mutex_unlock(&s->lock);
             s->ret = n;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 6dfac6468a..3a5e1eb2c4 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -312,7 +312,8 @@ static void test_sync_op_blk_truncate(BlockBackend *blk)
     g_assert_cmpint(ret, ==, -EINVAL);
 }
 
-static void test_sync_op_block_status(BdrvChild *c)
+/* Disable TSA to make bdrv_test.bdrv_co_block_status writable */
+static void TSA_NO_TSA test_sync_op_block_status(BdrvChild *c)
 {
     int ret;
     int64_t n;
-- 
2.39.2


