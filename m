Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA2B6A0FE4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhQ-0006qL-3u; Thu, 23 Feb 2023 13:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhK-0006o9-8v
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhG-00031X-FM
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+l5BiCRTOkG4ePBIaZmhyP81REPgwjl5X5eo/FTiKt0=;
 b=Ovc1uZYVEIjVVxc11Td8wMfC36gh+3oorm9nHQqBd7Gd8zD5uM2WdYfRkw29y7Rz2kQWHb
 un0J+1fAj+nUgzdbby4XVoQ39Qvjkg7SfVh3967kxfWFi7FZVdP6FQXvABVMpEc2sjQGky
 +PRJlcHJaVCid9Yqb6zsOQLwH2sBWw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-9Bd4_KcmORyWfYBrsOZHfA-1; Thu, 23 Feb 2023 13:51:58 -0500
X-MC-Unique: 9Bd4_KcmORyWfYBrsOZHfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2125E802D2A;
 Thu, 23 Feb 2023 18:51:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D1E01121314;
 Thu, 23 Feb 2023 18:51:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/29] block: Mark bdrv_co_flush() and callers GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:24 +0100
Message-Id: <20230223185146.306454-8-kwolf@redhat.com>
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
bdrv_co_flush() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-8-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h                    |  5 +++-
 block/qed.h                      | 29 +++++++++++++--------
 include/block/block-io.h         |  2 +-
 include/block/block_int-common.h | 12 +++++----
 block/blkdebug.c                 |  2 +-
 block/blklogwrites.c             | 21 ++++++++++-----
 block/blkreplay.c                |  2 +-
 block/blkverify.c                |  2 +-
 block/block-backend.c            |  3 ++-
 block/copy-before-write.c        |  2 +-
 block/file-posix.c               |  4 +--
 block/io.c                       |  7 +++++
 block/mirror.c                   |  2 +-
 block/preallocate.c              |  2 +-
 block/qed-check.c                |  3 ++-
 block/qed-table.c                |  6 ++---
 block/qed.c                      | 44 +++++++++++++++++++-------------
 block/quorum.c                   |  2 +-
 block/throttle.c                 |  2 +-
 block/vmdk.c                     |  6 +++--
 20 files changed, 98 insertions(+), 60 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 2285f18a73..7a02699bfa 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -900,7 +900,10 @@ int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
-int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
+
+int coroutine_fn GRAPH_RDLOCK
+qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
+
 int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
 int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *buf, int nb_sectors, bool enc, Error **errp);
diff --git a/block/qed.h b/block/qed.h
index 3d12bf78d4..e48f7c2480 100644
--- a/block/qed.h
+++ b/block/qed.h
@@ -201,20 +201,25 @@ void qed_commit_l2_cache_entry(L2TableCache *l2_cache, CachedL2Table *l2_table);
  * Table I/O functions
  */
 int coroutine_fn qed_read_l1_table_sync(BDRVQEDState *s);
-int coroutine_fn qed_write_l1_table(BDRVQEDState *s, unsigned int index,
-                                    unsigned int n);
-int coroutine_fn qed_write_l1_table_sync(BDRVQEDState *s, unsigned int index,
-                                         unsigned int n);
+
+int coroutine_fn GRAPH_RDLOCK
+qed_write_l1_table(BDRVQEDState *s, unsigned int index, unsigned int n);
+
+int coroutine_fn GRAPH_RDLOCK
+qed_write_l1_table_sync(BDRVQEDState *s, unsigned int index, unsigned int n);
+
 int coroutine_fn qed_read_l2_table_sync(BDRVQEDState *s, QEDRequest *request,
                                         uint64_t offset);
 int coroutine_fn qed_read_l2_table(BDRVQEDState *s, QEDRequest *request,
                                    uint64_t offset);
-int coroutine_fn qed_write_l2_table(BDRVQEDState *s, QEDRequest *request,
-                                    unsigned int index, unsigned int n,
-                                    bool flush);
-int coroutine_fn qed_write_l2_table_sync(BDRVQEDState *s, QEDRequest *request,
-                                         unsigned int index, unsigned int n,
-                                         bool flush);
+
+int coroutine_fn GRAPH_RDLOCK
+qed_write_l2_table(BDRVQEDState *s, QEDRequest *request, unsigned int index,
+                   unsigned int n, bool flush);
+
+int coroutine_fn GRAPH_RDLOCK
+qed_write_l2_table_sync(BDRVQEDState *s, QEDRequest *request,
+                        unsigned int index, unsigned int n, bool flush);
 
 /**
  * Cluster functions
@@ -226,7 +231,9 @@ int coroutine_fn qed_find_cluster(BDRVQEDState *s, QEDRequest *request,
 /**
  * Consistency check
  */
-int coroutine_fn qed_check(BDRVQEDState *s, BdrvCheckResult *result, bool fix);
+int coroutine_fn GRAPH_RDLOCK
+qed_check(BDRVQEDState *s, BdrvCheckResult *result, bool fix);
+
 
 QEDTable *qed_alloc_table(BDRVQEDState *s);
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 3f42c76f23..7e96506138 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -101,7 +101,7 @@ int coroutine_fn GRAPH_RDLOCK
 bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 
 /* Ensure contents are flushed to disk.  */
-int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
+int coroutine_fn GRAPH_RDLOCK bdrv_co_flush(BlockDriverState *bs);
 
 int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                   int64_t bytes);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 64700daf38..51eaabd9d1 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -477,8 +477,8 @@ struct BlockDriver {
     BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
-    BlockAIOCB *(*bdrv_aio_flush)(BlockDriverState *bs,
-        BlockCompletionFunc *cb, void *opaque);
+    BlockAIOCB * GRAPH_RDLOCK_PTR (*bdrv_aio_flush)(
+        BlockDriverState *bs, BlockCompletionFunc *cb, void *opaque);
     BlockAIOCB *(*bdrv_aio_pdiscard)(BlockDriverState *bs,
         int64_t offset, int bytes,
         BlockCompletionFunc *cb, void *opaque);
@@ -646,7 +646,7 @@ struct BlockDriver {
      * layers, if needed. This function is needed for deterministic
      * synchronization of the flush finishing callback.
      */
-    int coroutine_fn (*bdrv_co_flush)(BlockDriverState *bs);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_flush)(BlockDriverState *bs);
 
     /* Delete a created file. */
     int coroutine_fn (*bdrv_co_delete_file)(BlockDriverState *bs,
@@ -656,14 +656,16 @@ struct BlockDriver {
      * Flushes all data that was already written to the OS all the way down to
      * the disk (for example file-posix.c calls fsync()).
      */
-    int coroutine_fn (*bdrv_co_flush_to_disk)(BlockDriverState *bs);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_flush_to_disk)(
+        BlockDriverState *bs);
 
     /*
      * Flushes all internal caches to the OS. The data may still sit in a
      * writeback cache of the host OS, but it will survive a crash of the qemu
      * process.
      */
-    int coroutine_fn (*bdrv_co_flush_to_os)(BlockDriverState *bs);
+    int coroutine_fn GRAPH_RDLOCK_PTR (*bdrv_co_flush_to_os)(
+        BlockDriverState *bs);
 
     /*
      * Truncate @bs to @offset bytes using the given @prealloc mode
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 28772be73f..5ba3766a2c 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -668,7 +668,7 @@ blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
+static int GRAPH_RDLOCK coroutine_fn blkdebug_co_flush(BlockDriverState *bs)
 {
     int err = rule_check(bs, 0, 0, BLKDEBUG_IO_TYPE_FLUSH);
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index b00b8a6dd0..5ec1d23f29 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -307,7 +307,7 @@ typedef struct BlkLogWritesFileReq {
     uint64_t bytes;
     int file_flags;
     QEMUIOVector *qiov;
-    int (*func)(struct BlkLogWritesFileReq *r);
+    int GRAPH_RDLOCK_PTR (*func)(struct BlkLogWritesFileReq *r);
     int file_ret;
 } BlkLogWritesFileReq;
 
@@ -319,7 +319,8 @@ typedef struct {
     int log_ret;
 } BlkLogWritesLogReq;
 
-static void coroutine_fn blk_log_writes_co_do_log(BlkLogWritesLogReq *lr)
+static void coroutine_fn GRAPH_RDLOCK
+blk_log_writes_co_do_log(BlkLogWritesLogReq *lr)
 {
     BDRVBlkLogWritesState *s = lr->bs->opaque;
     uint64_t cur_log_offset = s->cur_log_sector << s->sectorbits;
@@ -368,15 +369,16 @@ static void coroutine_fn blk_log_writes_co_do_log(BlkLogWritesLogReq *lr)
     }
 }
 
-static void coroutine_fn blk_log_writes_co_do_file(BlkLogWritesFileReq *fr)
+static void coroutine_fn GRAPH_RDLOCK
+blk_log_writes_co_do_file(BlkLogWritesFileReq *fr)
 {
     fr->file_ret = fr->func(fr);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_log(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
                       QEMUIOVector *qiov, int flags,
-                      int (*file_func)(BlkLogWritesFileReq *r),
+                      int /*GRAPH_RDLOCK*/ (*file_func)(BlkLogWritesFileReq *r),
                       uint64_t entry_flags, bool is_zero_write)
 {
     QEMUIOVector log_qiov;
@@ -442,7 +444,8 @@ blk_log_writes_co_do_file_pwrite_zeroes(BlkLogWritesFileReq *fr)
                                  fr->file_flags);
 }
 
-static int coroutine_fn blk_log_writes_co_do_file_flush(BlkLogWritesFileReq *fr)
+static int coroutine_fn GRAPH_RDLOCK
+blk_log_writes_co_do_file_flush(BlkLogWritesFileReq *fr)
 {
     return bdrv_co_flush(fr->bs->file->bs);
 }
@@ -457,6 +460,7 @@ static int coroutine_fn
 blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                           QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
+    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, qiov, flags,
                                  blk_log_writes_co_do_file_pwritev, 0, false);
 }
@@ -465,12 +469,14 @@ static int coroutine_fn
 blk_log_writes_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
                                 int64_t bytes, BdrvRequestFlags flags)
 {
+    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, NULL, flags,
                                  blk_log_writes_co_do_file_pwrite_zeroes, 0,
                                  true);
 }
 
-static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK
+blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 {
     return blk_log_writes_co_log(bs, 0, 0, NULL, 0,
                                  blk_log_writes_co_do_file_flush,
@@ -480,6 +486,7 @@ static int coroutine_fn blk_log_writes_co_flush_to_disk(BlockDriverState *bs)
 static int coroutine_fn
 blk_log_writes_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 {
+    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, NULL, 0,
                                  blk_log_writes_co_do_file_pdiscard,
                                  LOG_DISCARD_FLAG, false);
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 16543f585a..ce13fa5ba5 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -113,7 +113,7 @@ static int coroutine_fn blkreplay_co_pdiscard(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn blkreplay_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK blkreplay_co_flush(BlockDriverState *bs)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_flush(bs->file->bs);
diff --git a/block/blkverify.c b/block/blkverify.c
index edf1a550f2..8c11c2eae4 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -256,7 +256,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
 }
 
-static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK blkverify_co_flush(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 5c731a1c6c..3e58b95b8a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1762,8 +1762,9 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
-    blk_wait_while_drained(blk);
     IO_CODE();
+    blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     if (!blk_is_available(blk)) {
         return -ENOMEDIUM;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c9fb809ba0..4ba72c6309 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -185,7 +185,7 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK cbw_co_flush(BlockDriverState *bs)
 {
     if (!bs->file) {
         return 0;
diff --git a/block/file-posix.c b/block/file-posix.c
index 9a99111f45..d106f4efa5 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2920,8 +2920,8 @@ static void coroutine_fn check_cache_dropped(BlockDriverState *bs, Error **errp)
 }
 #endif /* __linux__ */
 
-static void coroutine_fn raw_co_invalidate_cache(BlockDriverState *bs,
-                                                 Error **errp)
+static void coroutine_fn GRAPH_RDLOCK
+raw_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
     int ret;
diff --git a/block/io.c b/block/io.c
index c03233ae94..cfc93dc912 100644
--- a/block/io.c
+++ b/block/io.c
@@ -933,6 +933,8 @@ int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
     int ret;
     IO_CODE();
 
+    assume_graph_lock(); /* FIXME */
+
     ret = bdrv_co_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
         return ret;
@@ -1041,6 +1043,8 @@ static int coroutine_fn bdrv_driver_pwritev(BlockDriverState *bs,
     QEMUIOVector local_qiov;
     int ret;
 
+    assume_graph_lock(); /* FIXME */
+
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
     if (!drv) {
@@ -1680,6 +1684,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
+    assume_graph_lock(); /* FIXME */
+
     int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
                                             INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
@@ -2839,6 +2845,7 @@ int coroutine_fn bdrv_co_flush(BlockDriverState *bs)
     int ret = 0;
     IO_CODE();
 
+    assert_bdrv_graph_readable();
     bdrv_inc_in_flight(bs);
 
     if (!bdrv_co_is_inserted(bs) || bdrv_is_read_only(bs) ||
diff --git a/block/mirror.c b/block/mirror.c
index 94c523af28..d1d79f2319 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1535,7 +1535,7 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn bdrv_mirror_top_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK bdrv_mirror_top_flush(BlockDriverState *bs)
 {
     if (bs->backing == NULL) {
         /* we can be here after failed bdrv_append in mirror_start_job */
diff --git a/block/preallocate.c b/block/preallocate.c
index 42da9cb9f1..483b596280 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -437,7 +437,7 @@ preallocate_co_truncate(BlockDriverState *bs, int64_t offset,
     return 0;
 }
 
-static int coroutine_fn preallocate_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK preallocate_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
 }
diff --git a/block/qed-check.c b/block/qed-check.c
index a6612be00f..8fd94f405e 100644
--- a/block/qed-check.c
+++ b/block/qed-check.c
@@ -107,7 +107,8 @@ static unsigned int qed_check_l2_table(QEDCheck *check, QEDTable *table)
 /**
  * Descend tables and check each cluster is referenced once only
  */
-static int coroutine_fn qed_check_l1_table(QEDCheck *check, QEDTable *table)
+static int coroutine_fn GRAPH_RDLOCK
+qed_check_l1_table(QEDCheck *check, QEDTable *table)
 {
     BDRVQEDState *s = check->s;
     unsigned int i, num_invalid_l1 = 0;
diff --git a/block/qed-table.c b/block/qed-table.c
index e41c87a157..e9c72814c8 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -63,9 +63,9 @@ out:
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_write_table(BDRVQEDState *s, uint64_t offset,
-                                        QEDTable *table, unsigned int index,
-                                        unsigned int n, bool flush)
+static int coroutine_fn GRAPH_RDLOCK
+qed_write_table(BDRVQEDState *s, uint64_t offset, QEDTable *table,
+                unsigned int index, unsigned int n, bool flush)
 {
     unsigned int sector_mask = BDRV_SECTOR_SIZE / sizeof(uint64_t) - 1;
     unsigned int start, end, i;
diff --git a/block/qed.c b/block/qed.c
index 7690d0215d..cf794a1add 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -395,8 +395,8 @@ static void bdrv_qed_init_state(BlockDriverState *bs)
 }
 
 /* Called with table_lock held.  */
-static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
-                                         int flags, Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_do_open(BlockDriverState *bs, QDict *options, int flags, Error **errp)
 {
     BDRVQEDState *s = bs->opaque;
     QEDHeader le_header;
@@ -557,7 +557,7 @@ typedef struct QEDOpenCo {
     int ret;
 } QEDOpenCo;
 
-static void coroutine_fn bdrv_qed_open_entry(void *opaque)
+static void coroutine_fn GRAPH_RDLOCK bdrv_qed_open_entry(void *opaque)
 {
     QEDOpenCo *qoc = opaque;
     BDRVQEDState *s = qoc->bs->opaque;
@@ -579,6 +579,8 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
     };
     int ret;
 
+    assume_graph_lock(); /* FIXME */
+
     ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
     if (ret < 0) {
         return ret;
@@ -995,7 +997,7 @@ static void coroutine_fn qed_aio_complete(QEDAIOCB *acb)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_l1_update(QEDAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK qed_aio_write_l1_update(QEDAIOCB *acb)
 {
     BDRVQEDState *s = acb_to_s(acb);
     CachedL2Table *l2_table = acb->request.l2_table;
@@ -1025,7 +1027,8 @@ static int coroutine_fn qed_aio_write_l1_update(QEDAIOCB *acb)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_l2_update(QEDAIOCB *acb, uint64_t offset)
+static int coroutine_fn GRAPH_RDLOCK
+qed_aio_write_l2_update(QEDAIOCB *acb, uint64_t offset)
 {
     BDRVQEDState *s = acb_to_s(acb);
     bool need_alloc = acb->find_cluster_ret == QED_CLUSTER_L1;
@@ -1081,7 +1084,7 @@ static int coroutine_fn qed_aio_write_main(QEDAIOCB *acb)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_cow(QEDAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK qed_aio_write_cow(QEDAIOCB *acb)
 {
     BDRVQEDState *s = acb_to_s(acb);
     uint64_t start, len, offset;
@@ -1159,7 +1162,8 @@ static bool qed_should_set_need_check(BDRVQEDState *s)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_alloc(QEDAIOCB *acb, size_t len)
+static int coroutine_fn GRAPH_RDLOCK
+qed_aio_write_alloc(QEDAIOCB *acb, size_t len)
 {
     BDRVQEDState *s = acb_to_s(acb);
     int ret;
@@ -1265,8 +1269,8 @@ out:
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_data(void *opaque, int ret,
-                                           uint64_t offset, size_t len)
+static int coroutine_fn GRAPH_RDLOCK
+qed_aio_write_data(void *opaque, int ret, uint64_t offset, size_t len)
 {
     QEDAIOCB *acb = opaque;
 
@@ -1336,7 +1340,7 @@ static int coroutine_fn qed_aio_read_data(void *opaque, int ret,
 /**
  * Begin next I/O or complete the request
  */
-static int coroutine_fn qed_aio_next_io(QEDAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK qed_aio_next_io(QEDAIOCB *acb)
 {
     BDRVQEDState *s = acb_to_s(acb);
     uint64_t offset;
@@ -1381,9 +1385,9 @@ static int coroutine_fn qed_aio_next_io(QEDAIOCB *acb)
     return ret;
 }
 
-static int coroutine_fn qed_co_request(BlockDriverState *bs, int64_t sector_num,
-                                       QEMUIOVector *qiov, int nb_sectors,
-                                       int flags)
+static int coroutine_fn GRAPH_RDLOCK
+qed_co_request(BlockDriverState *bs, int64_t sector_num, QEMUIOVector *qiov,
+               int nb_sectors, int flags)
 {
     QEDAIOCB acb = {
         .bs         = bs,
@@ -1404,6 +1408,7 @@ static int coroutine_fn bdrv_qed_co_readv(BlockDriverState *bs,
                                           int64_t sector_num, int nb_sectors,
                                           QEMUIOVector *qiov)
 {
+    assume_graph_lock(); /* FIXME */
     return qed_co_request(bs, sector_num, qiov, nb_sectors, 0);
 }
 
@@ -1411,6 +1416,7 @@ static int coroutine_fn bdrv_qed_co_writev(BlockDriverState *bs,
                                            int64_t sector_num, int nb_sectors,
                                            QEMUIOVector *qiov, int flags)
 {
+    assume_graph_lock(); /* FIXME */
     return qed_co_request(bs, sector_num, qiov, nb_sectors, QED_AIOCB_WRITE);
 }
 
@@ -1421,6 +1427,8 @@ static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
 {
     BDRVQEDState *s = bs->opaque;
 
+    assume_graph_lock(); /* FIXME */
+
     /*
      * Zero writes start without an I/O buffer.  If a buffer becomes necessary
      * then it will be allocated during request processing.
@@ -1571,8 +1579,8 @@ static int bdrv_qed_change_backing_file(BlockDriverState *bs,
     return ret;
 }
 
-static void coroutine_fn bdrv_qed_co_invalidate_cache(BlockDriverState *bs,
-                                                      Error **errp)
+static void coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BDRVQEDState *s = bs->opaque;
     int ret;
@@ -1588,9 +1596,9 @@ static void coroutine_fn bdrv_qed_co_invalidate_cache(BlockDriverState *bs,
     }
 }
 
-static int coroutine_fn bdrv_qed_co_check(BlockDriverState *bs,
-                                          BdrvCheckResult *result,
-                                          BdrvCheckMode fix)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_check(BlockDriverState *bs, BdrvCheckResult *result,
+                  BdrvCheckMode fix)
 {
     BDRVQEDState *s = bs->opaque;
     int ret;
diff --git a/block/quorum.c b/block/quorum.c
index f3fe067541..3fe3791ab2 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -778,7 +778,7 @@ static int64_t coroutine_fn quorum_co_getlength(BlockDriverState *bs)
     return result;
 }
 
-static coroutine_fn int quorum_co_flush(BlockDriverState *bs)
+static coroutine_fn GRAPH_RDLOCK int quorum_co_flush(BlockDriverState *bs)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumVoteVersion *winner = NULL;
diff --git a/block/throttle.c b/block/throttle.c
index 64fa0f5acc..a0db840927 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -162,7 +162,7 @@ static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-static int coroutine_fn throttle_co_flush(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK throttle_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
 }
diff --git a/block/vmdk.c b/block/vmdk.c
index 3fcb75319f..d074f696aa 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1484,8 +1484,8 @@ exit:
     return ret;
 }
 
-static int coroutine_fn vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data,
-                                      uint32_t offset)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data, uint32_t offset)
 {
     offset = cpu_to_le32(offset);
     /* update L2 table */
@@ -2028,6 +2028,8 @@ static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
     uint64_t bytes_done = 0;
     VmdkMetaData m_data;
 
+    assume_graph_lock(); /* FIXME */
+
     if (DIV_ROUND_UP(offset, BDRV_SECTOR_SIZE) > bs->total_sectors) {
         error_report("Wrong offset: offset=0x%" PRIx64
                      " total_sectors=0x%" PRIx64,
-- 
2.39.2


