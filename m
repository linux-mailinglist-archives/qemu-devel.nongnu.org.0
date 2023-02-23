Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D19E6A0FC7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhV-0006ro-F9; Thu, 23 Feb 2023 13:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhO-0006q1-4w
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhK-00038b-Cg
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bP0xLKpnZjLL+XyMCalBjnNVhHD8Pd4vdl313PAlFCo=;
 b=CM2omWASkbsM/gqZyu87eu5j41KWF4/GsYod5h58QfxbRnjp1hAAV/9Qvwo+9uueE/Zo+F
 WTco2H6Wek+7yvPNvS7qHalW8OwcSnSgqIAyHzvxtvFutTaIWo8C/2ePKTO1ohcNUNbtxI
 +1m/HfYNfH1G3so4MAvyUSAOBkM14zw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-lqfbSksPMayJzy10QinKSQ-1; Thu, 23 Feb 2023 13:52:02 -0500
X-MC-Unique: lqfbSksPMayJzy10QinKSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70E32800486;
 Thu, 23 Feb 2023 18:52:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 225691121314;
 Thu, 23 Feb 2023 18:52:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 11/29] block: Mark public read/write functions GRAPH_RDLOCK
Date: Thu, 23 Feb 2023 19:51:28 +0100
Message-Id: <20230223185146.306454-12-kwolf@redhat.com>
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
 SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
bdrv_co_pread*/pwrite*() need to hold a reader lock for the graph.

For some places, we know that they will hold the lock, but we don't have
the GRAPH_RDLOCK annotations yet. In this case, add assume_graph_lock()
with a FIXME comment. These places will be removed once everything is
properly annotated.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-12-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h                |  9 ++---
 block/qed.h                  | 18 +++++-----
 include/block/block_int-io.h | 14 ++++----
 block/blkdebug.c             |  4 +--
 block/blklogwrites.c         |  7 ++--
 block/blkreplay.c            | 10 +++---
 block/block-backend.c        |  2 ++
 block/bochs.c                |  2 +-
 block/commit.c               |  5 +--
 block/copy-before-write.c    | 16 ++++-----
 block/copy-on-read.c         | 26 ++++++---------
 block/crypto.c               |  4 +--
 block/filter-compress.c      | 19 +++++------
 block/io.c                   |  7 ++--
 block/mirror.c               | 18 +++++-----
 block/parallels.c            |  8 +++--
 block/preallocate.c          | 18 +++++-----
 block/qcow.c                 |  8 ++---
 block/qcow2-cluster.c        |  7 ++--
 block/qcow2.c                | 53 +++++++++++++++--------------
 block/qed-table.c            |  4 +--
 block/qed.c                  | 31 +++++++++--------
 block/quorum.c               | 29 ++++++++++------
 block/raw-format.c           | 12 +++----
 block/replication.c          | 15 ++++-----
 block/throttle.c             | 21 +++++-------
 block/vdi.c                  |  4 +--
 block/vhdx.c                 | 11 +++---
 block/vmdk.c                 | 65 +++++++++++++++---------------------
 block/vpc.c                  |  4 +--
 tests/unit/test-bdrv-drain.c | 20 ++++++-----
 31 files changed, 233 insertions(+), 238 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 46dca53e45..7487bcfcf9 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -846,7 +846,7 @@ int qcow2_validate_table(BlockDriverState *bs, uint64_t offset,
                          Error **errp);
 
 /* qcow2-refcount.c functions */
-int coroutine_fn qcow2_refcount_init(BlockDriverState *bs);
+int coroutine_fn GRAPH_RDLOCK qcow2_refcount_init(BlockDriverState *bs);
 void qcow2_refcount_close(BlockDriverState *bs);
 
 int qcow2_get_refcount(BlockDriverState *bs, int64_t cluster_index,
@@ -954,9 +954,10 @@ void qcow2_free_snapshots(BlockDriverState *bs);
 int qcow2_read_snapshots(BlockDriverState *bs, Error **errp);
 int qcow2_write_snapshots(BlockDriverState *bs);
 
-int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
-                                                 BdrvCheckResult *result,
-                                                 BdrvCheckMode fix);
+int coroutine_fn GRAPH_RDLOCK
+qcow2_check_read_snapshot_table(BlockDriverState *bs, BdrvCheckResult *result,
+                                BdrvCheckMode fix);
+
 int coroutine_fn qcow2_check_fix_snapshot_table(BlockDriverState *bs,
                                                 BdrvCheckResult *result,
                                                 BdrvCheckMode fix);
diff --git a/block/qed.h b/block/qed.h
index e48f7c2480..988654cb86 100644
--- a/block/qed.h
+++ b/block/qed.h
@@ -200,7 +200,7 @@ void qed_commit_l2_cache_entry(L2TableCache *l2_cache, CachedL2Table *l2_table);
 /**
  * Table I/O functions
  */
-int coroutine_fn qed_read_l1_table_sync(BDRVQEDState *s);
+int coroutine_fn GRAPH_RDLOCK qed_read_l1_table_sync(BDRVQEDState *s);
 
 int coroutine_fn GRAPH_RDLOCK
 qed_write_l1_table(BDRVQEDState *s, unsigned int index, unsigned int n);
@@ -208,10 +208,11 @@ qed_write_l1_table(BDRVQEDState *s, unsigned int index, unsigned int n);
 int coroutine_fn GRAPH_RDLOCK
 qed_write_l1_table_sync(BDRVQEDState *s, unsigned int index, unsigned int n);
 
-int coroutine_fn qed_read_l2_table_sync(BDRVQEDState *s, QEDRequest *request,
-                                        uint64_t offset);
-int coroutine_fn qed_read_l2_table(BDRVQEDState *s, QEDRequest *request,
-                                   uint64_t offset);
+int coroutine_fn GRAPH_RDLOCK
+qed_read_l2_table_sync(BDRVQEDState *s, QEDRequest *request, uint64_t offset);
+
+int coroutine_fn GRAPH_RDLOCK
+qed_read_l2_table(BDRVQEDState *s, QEDRequest *request, uint64_t offset);
 
 int coroutine_fn GRAPH_RDLOCK
 qed_write_l2_table(BDRVQEDState *s, QEDRequest *request, unsigned int index,
@@ -224,9 +225,9 @@ qed_write_l2_table_sync(BDRVQEDState *s, QEDRequest *request,
 /**
  * Cluster functions
  */
-int coroutine_fn qed_find_cluster(BDRVQEDState *s, QEDRequest *request,
-                                  uint64_t pos, size_t *len,
-                                  uint64_t *img_offset);
+int coroutine_fn GRAPH_RDLOCK
+qed_find_cluster(BDRVQEDState *s, QEDRequest *request, uint64_t pos,
+                 size_t *len, uint64_t *img_offset);
 
 /**
  * Consistency check
@@ -234,7 +235,6 @@ int coroutine_fn qed_find_cluster(BDRVQEDState *s, QEDRequest *request,
 int coroutine_fn GRAPH_RDLOCK
 qed_check(BDRVQEDState *s, BdrvCheckResult *result, bool fix);
 
-
 QEDTable *qed_alloc_table(BDRVQEDState *s);
 
 /**
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index 4bb6ccaa34..34d4b0fb8e 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -44,33 +44,35 @@ int coroutine_fn GRAPH_RDLOCK bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
     int64_t offset, int64_t bytes);
 
 
-int coroutine_fn bdrv_co_preadv(BdrvChild *child,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_preadv(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
-int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_preadv_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
-int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_pwritev(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
-int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
+int coroutine_fn GRAPH_RDLOCK bdrv_co_pwritev_part(BdrvChild *child,
     int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 
-static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
+static inline int coroutine_fn GRAPH_RDLOCK bdrv_co_pread(BdrvChild *child,
     int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     return bdrv_co_preadv(child, offset, bytes, &qiov, flags);
 }
 
-static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
+static inline int coroutine_fn GRAPH_RDLOCK bdrv_co_pwrite(BdrvChild *child,
     int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     return bdrv_co_pwritev(child, offset, bytes, &qiov, flags);
 }
diff --git a/block/blkdebug.c b/block/blkdebug.c
index eed03bfe7e..f418a90873 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -626,7 +626,7 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     return -error;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -647,7 +647,7 @@ blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blkdebug_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                     QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index bdaa2a57a2..93086c31e1 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -294,7 +294,7 @@ static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **errp)
     bs->bl.request_alignment = s->sectorsize;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                          QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -430,7 +430,7 @@ blk_log_writes_co_log(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     return fr.file_ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_do_file_pwritev(BlkLogWritesFileReq *fr)
 {
     return bdrv_co_pwritev(fr->bs->file, fr->offset, fr->bytes,
@@ -456,11 +456,10 @@ blk_log_writes_co_do_file_pdiscard(BlkLogWritesFileReq *fr)
     return bdrv_co_pdiscard(fr->bs->file, fr->offset, fr->bytes);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 blk_log_writes_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                           QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
-    assume_graph_lock(); /* FIXME */
     return blk_log_writes_co_log(bs, offset, bytes, qiov, flags,
                                  blk_log_writes_co_do_file_pwritev, 0, false);
 }
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 2703a0c8c6..bc96bbd41e 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -69,8 +69,9 @@ static void block_request_create(uint64_t reqid, BlockDriverState *bs,
     replay_block_event(req->bh, reqid);
 }
 
-static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+blkreplay_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
@@ -80,8 +81,9 @@ static int coroutine_fn blkreplay_co_preadv(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn blkreplay_co_pwritev(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+blkreplay_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     uint64_t reqid = blkreplay_next_id();
     int ret = bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
diff --git a/block/block-backend.c b/block/block-backend.c
index b4d2387947..146ef91547 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1289,6 +1289,7 @@ blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
@@ -1363,6 +1364,7 @@ blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
     IO_CODE();
 
     blk_wait_while_drained(blk);
+    GRAPH_RDLOCK_GUARD();
 
     /* Call blk_bs() only after waiting, the graph may have changed */
     bs = blk_bs(blk);
diff --git a/block/bochs.c b/block/bochs.c
index 46e7958316..2f5ae52c90 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -237,7 +237,7 @@ static int64_t seek_to_sector(BlockDriverState *bs, int64_t sector_num)
     return bitmap_offset + (512 * (s->bitmap_blocks + extent_offset));
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 bochs_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
diff --git a/block/commit.c b/block/commit.c
index 41e3599281..10f6512e07 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -207,8 +207,9 @@ static const BlockJobDriver commit_job_driver = {
     },
 };
 
-static int coroutine_fn bdrv_commit_top_preadv(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_commit_top_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 61854beae2..e223e37300 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -78,9 +78,9 @@ typedef struct BDRVCopyBeforeWriteState {
     int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
-static coroutine_fn int cbw_co_preadv(
-        BlockDriverState *bs, int64_t offset, int64_t bytes,
-        QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+cbw_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
@@ -172,11 +172,9 @@ cbw_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
-static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
-                                       int64_t offset,
-                                       int64_t bytes,
-                                       QEMUIOVector *qiov,
-                                       BdrvRequestFlags flags)
+static coroutine_fn GRAPH_RDLOCK
+int cbw_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
@@ -266,6 +264,8 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
     BdrvChild *file;
     int ret;
 
+    assume_graph_lock(); /* FIXME */
+
     /* TODO: upgrade to async loop using AioTask */
     while (bytes) {
         int64_t cur_bytes;
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index ebf6864dd3..78da353f88 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -127,11 +127,10 @@ static int64_t coroutine_fn cor_co_getlength(BlockDriverState *bs)
 }
 
 
-static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
-                                           int64_t offset, int64_t bytes,
-                                           QEMUIOVector *qiov,
-                                           size_t qiov_offset,
-                                           BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+cor_co_preadv_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, size_t qiov_offset,
+                   BdrvRequestFlags flags)
 {
     int64_t n;
     int local_flags;
@@ -180,12 +179,10 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
 }
 
 
-static int coroutine_fn cor_co_pwritev_part(BlockDriverState *bs,
-                                            int64_t offset,
-                                            int64_t bytes,
-                                            QEMUIOVector *qiov,
-                                            size_t qiov_offset,
-                                            BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+cor_co_pwritev_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, size_t qiov_offset,
+                    BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags);
@@ -207,10 +204,9 @@ cor_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
 }
 
 
-static int coroutine_fn cor_co_pwritev_compressed(BlockDriverState *bs,
-                                                  int64_t offset,
-                                                  int64_t bytes,
-                                                  QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+cor_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                          QEMUIOVector *qiov)
 {
     return bdrv_co_pwritev(bs->file, offset, bytes, qiov,
                            BDRV_REQ_WRITE_COMPRESSED);
diff --git a/block/crypto.c b/block/crypto.c
index a15f77521f..0ebb846534 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -397,7 +397,7 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
  */
 #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -459,7 +459,7 @@ block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
 }
 
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 block_crypto_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 7a632f47fe..0dd5606410 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -61,23 +61,20 @@ static int64_t coroutine_fn compress_co_getlength(BlockDriverState *bs)
 }
 
 
-static int coroutine_fn compress_co_preadv_part(BlockDriverState *bs,
-                                                int64_t offset, int64_t bytes,
-                                                QEMUIOVector *qiov,
-                                                size_t qiov_offset,
-                                                BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+compress_co_preadv_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, size_t qiov_offset,
+                        BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
 }
 
 
-static int coroutine_fn compress_co_pwritev_part(BlockDriverState *bs,
-                                                 int64_t offset,
-                                                 int64_t bytes,
-                                                 QEMUIOVector *qiov,
-                                                 size_t qiov_offset,
-                                                 BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+compress_co_pwritev_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                         QEMUIOVector *qiov, size_t qiov_offset,
+                         BdrvRequestFlags flags)
 {
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
                                 flags | BDRV_REQ_WRITE_COMPRESSED);
diff --git a/block/io.c b/block/io.c
index 2dda1cf5c2..ec8b317818 100644
--- a/block/io.c
+++ b/block/io.c
@@ -971,6 +971,7 @@ bdrv_driver_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     unsigned int nb_sectors;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
     assert(!(flags & ~bs->supported_read_flags));
@@ -1041,6 +1042,7 @@ bdrv_driver_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     unsigned int nb_sectors;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
@@ -1119,6 +1121,7 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
     BlockDriver *drv = bs->drv;
     QEMUIOVector local_qiov;
     int ret;
+    assert_bdrv_graph_readable();
 
     bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
 
@@ -1621,8 +1624,6 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     int ret;
     IO_CODE();
 
-    assume_graph_lock(); /* FIXME */
-
     trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
     if (!bdrv_co_is_inserted(bs)) {
@@ -2073,8 +2074,6 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     bool padded = false;
     IO_CODE();
 
-    assume_graph_lock(); /* FIXME */
-
     trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
     if (!bdrv_co_is_inserted(bs)) {
diff --git a/block/mirror.c b/block/mirror.c
index a6f4ec6282..ec5cd22a7c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -390,8 +390,10 @@ static void coroutine_fn mirror_co_read(void *opaque)
     op->is_in_flight = true;
     trace_mirror_one_iteration(s, op->offset, op->bytes);
 
-    ret = bdrv_co_preadv(s->mirror_top_bs->backing, op->offset, op->bytes,
-                         &op->qiov, 0);
+    WITH_GRAPH_RDLOCK_GUARD() {
+        ret = bdrv_co_preadv(s->mirror_top_bs->backing, op->offset, op->bytes,
+                             &op->qiov, 0);
+    }
     mirror_read_complete(op, ret);
 }
 
@@ -1437,8 +1439,9 @@ static void coroutine_fn active_write_settle(MirrorOp *op)
     g_free(op);
 }
 
-static int coroutine_fn bdrv_mirror_top_preadv(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_mirror_top_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
@@ -1495,8 +1498,9 @@ out:
     return ret;
 }
 
-static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
-    int64_t offset, int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_mirror_top_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     MirrorBDSOpaque *s = bs->opaque;
     QEMUIOVector bounce_qiov;
@@ -1504,8 +1508,6 @@ static int coroutine_fn bdrv_mirror_top_pwritev(BlockDriverState *bs,
     int ret = 0;
     bool copy_to_target = false;
 
-    assume_graph_lock(); /* FIXME */
-
     if (s->job) {
         copy_to_target = s->job->ret >= 0 &&
                          !job_is_cancelled(&s->job->common.job) &&
diff --git a/block/parallels.c b/block/parallels.c
index 2cf5061524..a7e9cad146 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -261,7 +261,8 @@ allocate_clusters(BlockDriverState *bs, int64_t sector_num,
 }
 
 
-static coroutine_fn int parallels_co_flush_to_os(BlockDriverState *bs)
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_flush_to_os(BlockDriverState *bs)
 {
     BDRVParallelsState *s = bs->opaque;
     unsigned long size = DIV_ROUND_UP(s->header_size, s->bat_dirty_block);
@@ -363,8 +364,9 @@ parallels_co_writev(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
     return ret;
 }
 
-static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
-        int64_t sector_num, int nb_sectors, QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_readv(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+                   QEMUIOVector *qiov)
 {
     BDRVParallelsState *s = bs->opaque;
     uint64_t bytes_done = 0;
diff --git a/block/preallocate.c b/block/preallocate.c
index 91d73c81c6..63a296882d 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -226,9 +226,10 @@ static void preallocate_reopen_abort(BDRVReopenState *state)
     state->opaque = NULL;
 }
 
-static coroutine_fn int preallocate_co_preadv_part(
-        BlockDriverState *bs, int64_t offset, int64_t bytes,
-        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+preallocate_co_preadv_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                           QEMUIOVector *qiov, size_t qiov_offset,
+                           BdrvRequestFlags flags)
 {
     return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
                                flags);
@@ -359,14 +360,11 @@ preallocate_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
-static coroutine_fn int preallocate_co_pwritev_part(BlockDriverState *bs,
-                                                    int64_t offset,
-                                                    int64_t bytes,
-                                                    QEMUIOVector *qiov,
-                                                    size_t qiov_offset,
-                                                    BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+preallocate_co_pwritev_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            BdrvRequestFlags flags)
 {
-    assume_graph_lock(); /* FIXME */
     handle_write(bs, offset, bytes, false);
 
     return bdrv_co_pwritev_part(bs->file, offset, bytes, qiov, qiov_offset,
diff --git a/block/qcow.c b/block/qcow.c
index 1e1d1792d0..58a0b4e2f0 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -92,8 +92,8 @@ typedef struct BDRVQcowState {
 
 static QemuOptsList qcow_create_opts;
 
-static int coroutine_fn decompress_cluster(BlockDriverState *bs,
-                                           uint64_t cluster_offset);
+static int coroutine_fn GRAPH_RDLOCK
+decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset);
 
 static int qcow_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
@@ -584,8 +584,8 @@ static int decompress_buffer(uint8_t *out_buf, int out_buf_size,
     return 0;
 }
 
-static int coroutine_fn decompress_cluster(BlockDriverState *bs,
-                                           uint64_t cluster_offset)
+static int coroutine_fn GRAPH_RDLOCK
+decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
 {
     BDRVQcowState *s = bs->opaque;
     int ret, csize;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index a22607d90d..a9e6622fe3 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -534,10 +534,9 @@ do_perform_cow_read(BlockDriverState *bs, uint64_t src_cluster_offset,
     return 0;
 }
 
-static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
-                                             uint64_t cluster_offset,
-                                             unsigned offset_in_cluster,
-                                             QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+do_perform_cow_write(BlockDriverState *bs, uint64_t cluster_offset,
+                     unsigned offset_in_cluster, QEMUIOVector *qiov)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
diff --git a/block/qcow2.c b/block/qcow2.c
index 8f5ad75984..ddf9394bf0 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -601,9 +601,9 @@ static void qcow2_add_check_result(BdrvCheckResult *out,
     }
 }
 
-static int coroutine_fn qcow2_co_check_locked(BlockDriverState *bs,
-                                              BdrvCheckResult *result,
-                                              BdrvCheckMode fix)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_check_locked(BlockDriverState *bs, BdrvCheckResult *result,
+                      BdrvCheckMode fix)
 {
     BdrvCheckResult snapshot_res = {};
     BdrvCheckResult refcount_res = {};
@@ -640,9 +640,9 @@ static int coroutine_fn qcow2_co_check_locked(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn qcow2_co_check(BlockDriverState *bs,
-                                       BdrvCheckResult *result,
-                                       BdrvCheckMode fix)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_check(BlockDriverState *bs, BdrvCheckResult *result,
+               BdrvCheckMode fix)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
@@ -1294,9 +1294,9 @@ static int validate_compression_type(BDRVQcow2State *s, Error **errp)
 }
 
 /* Called with s->lock held.  */
-static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
-                                      int flags, bool open_data_file,
-                                      Error **errp)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_do_open(BlockDriverState *bs, QDict *options, int flags,
+              bool open_data_file, Error **errp)
 {
     ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
@@ -1890,6 +1890,8 @@ static void coroutine_fn qcow2_open_entry(void *opaque)
     QCow2OpenCo *qoc = opaque;
     BDRVQcow2State *s = qoc->bs->opaque;
 
+    assume_graph_lock(); /* FIXME */
+
     qemu_co_mutex_lock(&s->lock);
     qoc->ret = qcow2_do_open(qoc->bs, qoc->options, qoc->flags, true,
                              qoc->errp);
@@ -2169,7 +2171,7 @@ out:
     return ret;
 }
 
-static coroutine_fn int
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_preadv_encrypted(BlockDriverState *bs,
                            uint64_t host_offset,
                            uint64_t offset,
@@ -2270,12 +2272,10 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
     return 0;
 }
 
-static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
-                                             QCow2SubclusterType subc_type,
-                                             uint64_t host_offset,
-                                             uint64_t offset, uint64_t bytes,
-                                             QEMUIOVector *qiov,
-                                             size_t qiov_offset)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_preadv_task(BlockDriverState *bs, QCow2SubclusterType subc_type,
+                     uint64_t host_offset, uint64_t offset, uint64_t bytes,
+                     QEMUIOVector *qiov, size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
 
@@ -2314,7 +2314,11 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
     g_assert_not_reached();
 }
 
-static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
+/*
+ * This function can count as GRAPH_RDLOCK because qcow2_co_preadv_part() holds
+ * the graph lock and keeps it until this coroutine has terminated.
+ */
+static int coroutine_fn GRAPH_RDLOCK qcow2_co_preadv_task_entry(AioTask *task)
 {
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
@@ -2325,11 +2329,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
                                 t->qiov, t->qiov_offset);
 }
 
-static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
-                                             int64_t offset, int64_t bytes,
-                                             QEMUIOVector *qiov,
-                                             size_t qiov_offset,
-                                             BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+qcow2_co_preadv_part(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                     QEMUIOVector *qiov, size_t qiov_offset,
+                     BdrvRequestFlags flags)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
@@ -2774,8 +2777,8 @@ static void qcow2_close(BlockDriverState *bs)
     qcow2_do_close(bs, true);
 }
 
-static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
-                                                   Error **errp)
+static void coroutine_fn GRAPH_RDLOCK
+qcow2_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     ERRP_GUARD();
     BDRVQcow2State *s = bs->opaque;
@@ -4737,7 +4740,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 qcow2_co_preadv_compressed(BlockDriverState *bs,
                            uint64_t l2_entry,
                            uint64_t offset,
diff --git a/block/qed-table.c b/block/qed-table.c
index e9c72814c8..3b331ce709 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -21,8 +21,8 @@
 #include "qemu/memalign.h"
 
 /* Called with table_lock held.  */
-static int coroutine_fn qed_read_table(BDRVQEDState *s, uint64_t offset,
-                                       QEDTable *table)
+static int coroutine_fn GRAPH_RDLOCK
+qed_read_table(BDRVQEDState *s, uint64_t offset, QEDTable *table)
 {
     unsigned int bytes = s->header.cluster_size * s->header.table_size;
 
diff --git a/block/qed.c b/block/qed.c
index a4a74e59ef..c969b31e2c 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -100,7 +100,7 @@ int qed_write_header_sync(BDRVQEDState *s)
  *
  * No new allocating reqs can start while this function runs.
  */
-static int coroutine_fn qed_write_header(BDRVQEDState *s)
+static int coroutine_fn GRAPH_RDLOCK qed_write_header(BDRVQEDState *s)
 {
     /* We must write full sectors for O_DIRECT but cannot necessarily generate
      * the data following the header if an unrecognized compat feature is
@@ -826,11 +826,10 @@ fail:
     return ret;
 }
 
-static int coroutine_fn bdrv_qed_co_block_status(BlockDriverState *bs,
-                                                 bool want_zero,
-                                                 int64_t pos, int64_t bytes,
-                                                 int64_t *pnum, int64_t *map,
-                                                 BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_qed_co_block_status(BlockDriverState *bs, bool want_zero, int64_t pos,
+                         int64_t bytes, int64_t *pnum, int64_t *map,
+                         BlockDriverState **file)
 {
     BDRVQEDState *s = bs->opaque;
     size_t len = MIN(bytes, SIZE_MAX);
@@ -883,8 +882,8 @@ static BDRVQEDState *acb_to_s(QEDAIOCB *acb)
  * This function reads qiov->size bytes starting at pos from the backing file.
  * If there is no backing file then zeroes are read.
  */
-static int coroutine_fn qed_read_backing_file(BDRVQEDState *s, uint64_t pos,
-                                              QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+qed_read_backing_file(BDRVQEDState *s, uint64_t pos, QEMUIOVector *qiov)
 {
     if (s->bs->backing) {
         BLKDBG_EVENT(s->bs->file, BLKDBG_READ_BACKING_AIO);
@@ -902,9 +901,9 @@ static int coroutine_fn qed_read_backing_file(BDRVQEDState *s, uint64_t pos,
  * @len:        Number of bytes
  * @offset:     Byte offset in image file
  */
-static int coroutine_fn qed_copy_from_backing_file(BDRVQEDState *s,
-                                                   uint64_t pos, uint64_t len,
-                                                   uint64_t offset)
+static int coroutine_fn GRAPH_RDLOCK
+qed_copy_from_backing_file(BDRVQEDState *s, uint64_t pos, uint64_t len,
+                           uint64_t offset)
 {
     QEMUIOVector qiov;
     int ret;
@@ -1066,7 +1065,7 @@ qed_aio_write_l2_update(QEDAIOCB *acb, uint64_t offset)
  *
  * Called with table_lock *not* held.
  */
-static int coroutine_fn qed_aio_write_main(QEDAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK qed_aio_write_main(QEDAIOCB *acb)
 {
     BDRVQEDState *s = acb_to_s(acb);
     uint64_t offset = acb->cur_cluster +
@@ -1226,8 +1225,8 @@ qed_aio_write_alloc(QEDAIOCB *acb, size_t len)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_write_inplace(QEDAIOCB *acb, uint64_t offset,
-                                              size_t len)
+static int coroutine_fn GRAPH_RDLOCK
+qed_aio_write_inplace(QEDAIOCB *acb, uint64_t offset, size_t len)
 {
     BDRVQEDState *s = acb_to_s(acb);
     int r;
@@ -1302,8 +1301,8 @@ qed_aio_write_data(void *opaque, int ret, uint64_t offset, size_t len)
  *
  * Called with table_lock held.
  */
-static int coroutine_fn qed_aio_read_data(void *opaque, int ret,
-                                          uint64_t offset, size_t len)
+static int coroutine_fn GRAPH_RDLOCK
+qed_aio_read_data(void *opaque, int ret, uint64_t offset, size_t len)
 {
     QEDAIOCB *acb = opaque;
     BDRVQEDState *s = acb_to_s(acb);
diff --git a/block/quorum.c b/block/quorum.c
index ef6cda2868..d58f86d3a5 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -270,7 +270,11 @@ static void quorum_report_bad_versions(BDRVQuorumState *s,
     }
 }
 
-static void coroutine_fn quorum_rewrite_entry(void *opaque)
+/*
+ * This function can count as GRAPH_RDLOCK because read_quorum_children() holds
+ * the graph lock and keeps it until this coroutine has terminated.
+ */
+static void coroutine_fn GRAPH_RDLOCK quorum_rewrite_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -290,8 +294,8 @@ static void coroutine_fn quorum_rewrite_entry(void *opaque)
     }
 }
 
-static bool quorum_rewrite_bad_versions(QuorumAIOCB *acb,
-                                        QuorumVoteValue *value)
+static bool coroutine_fn GRAPH_RDLOCK
+quorum_rewrite_bad_versions(QuorumAIOCB *acb, QuorumVoteValue *value)
 {
     QuorumVoteVersion *version;
     QuorumVoteItem *item;
@@ -491,7 +495,7 @@ static int quorum_vote_error(QuorumAIOCB *acb)
     return ret;
 }
 
-static void quorum_vote(QuorumAIOCB *acb)
+static void coroutine_fn GRAPH_RDLOCK quorum_vote(QuorumAIOCB *acb)
 {
     bool quorum = true;
     int i, j, ret;
@@ -571,7 +575,11 @@ free_exit:
     quorum_free_vote_list(&acb->votes);
 }
 
-static void coroutine_fn read_quorum_children_entry(void *opaque)
+/*
+ * This function can count as GRAPH_RDLOCK because read_quorum_children() holds
+ * the graph lock and keeps it until this coroutine has terminated.
+ */
+static void coroutine_fn GRAPH_RDLOCK read_quorum_children_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -599,7 +607,7 @@ static void coroutine_fn read_quorum_children_entry(void *opaque)
     }
 }
 
-static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK read_quorum_children(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int i;
@@ -640,7 +648,7 @@ static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
     return acb->vote_ret;
 }
 
-static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)
+static int coroutine_fn GRAPH_RDLOCK read_fifo_child(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int n, ret;
@@ -661,10 +669,9 @@ static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
-                                         int64_t offset, int64_t bytes,
-                                         QEMUIOVector *qiov,
-                                         BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
diff --git a/block/raw-format.c b/block/raw-format.c
index 007d7f6e42..92adf97ab0 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -203,9 +203,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
     return 0;
 }
 
-static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
-                                      int64_t bytes, QEMUIOVector *qiov,
-                                      BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     int ret;
 
@@ -218,9 +218,9 @@ static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                       int64_t bytes, QEMUIOVector *qiov,
-                                       BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+raw_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     void *buf = NULL;
     BlockDriver *drv;
diff --git a/block/replication.c b/block/replication.c
index a27417d310..f9f899bfc8 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -220,10 +220,9 @@ static int replication_return_value(BDRVReplicationState *s, int ret)
     return ret;
 }
 
-static coroutine_fn int replication_co_readv(BlockDriverState *bs,
-                                             int64_t sector_num,
-                                             int remaining_sectors,
-                                             QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+replication_co_readv(BlockDriverState *bs, int64_t sector_num,
+                     int remaining_sectors, QEMUIOVector *qiov)
 {
     BDRVReplicationState *s = bs->opaque;
     int ret;
@@ -244,11 +243,9 @@ static coroutine_fn int replication_co_readv(BlockDriverState *bs,
     return replication_return_value(s, ret);
 }
 
-static coroutine_fn int replication_co_writev(BlockDriverState *bs,
-                                              int64_t sector_num,
-                                              int remaining_sectors,
-                                              QEMUIOVector *qiov,
-                                              int flags)
+static int coroutine_fn GRAPH_RDLOCK
+replication_co_writev(BlockDriverState *bs, int64_t sector_num,
+                      int remaining_sectors, QEMUIOVector *qiov, int flags)
 {
     BDRVReplicationState *s = bs->opaque;
     QEMUIOVector hd_qiov;
diff --git a/block/throttle.c b/block/throttle.c
index 3db4fa3c40..5cfea3d5f8 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -111,10 +111,9 @@ static int64_t coroutine_fn throttle_co_getlength(BlockDriverState *bs)
     return bdrv_co_getlength(bs->file->bs);
 }
 
-static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
-                                           int64_t offset, int64_t bytes,
-                                           QEMUIOVector *qiov,
-                                           BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+throttle_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                   QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
 
     ThrottleGroupMember *tgm = bs->opaque;
@@ -123,10 +122,9 @@ static int coroutine_fn throttle_co_preadv(BlockDriverState *bs,
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn throttle_co_pwritev(BlockDriverState *bs,
-                                            int64_t offset, int64_t bytes,
-                                            QEMUIOVector *qiov,
-                                            BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+throttle_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     ThrottleGroupMember *tgm = bs->opaque;
     throttle_group_co_io_limits_intercept(tgm, bytes, true);
@@ -153,10 +151,9 @@ throttle_co_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes)
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
-static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
-                                                       int64_t offset,
-                                                       int64_t bytes,
-                                                       QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+throttle_co_pwritev_compressed(BlockDriverState *bs, int64_t offset,
+                               int64_t bytes, QEMUIOVector *qiov)
 {
     return throttle_co_pwritev(bs, offset, bytes, qiov,
                                BDRV_REQ_WRITE_COMPRESSED);
diff --git a/block/vdi.c b/block/vdi.c
index 27db67d493..b50c0b7277 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -544,7 +544,7 @@ static int coroutine_fn vdi_co_block_status(BlockDriverState *bs,
         (s->header.image_type == VDI_TYPE_STATIC ? BDRV_BLOCK_RECURSE : 0);
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -600,7 +600,7 @@ vdi_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vdi_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
diff --git a/block/vhdx.c b/block/vhdx.c
index 59fbdb413b..ffa4455e82 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1172,8 +1172,9 @@ vhdx_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 }
 
 
-static coroutine_fn int vhdx_co_readv(BlockDriverState *bs, int64_t sector_num,
-                                      int nb_sectors, QEMUIOVector *qiov)
+static int coroutine_fn GRAPH_RDLOCK
+vhdx_co_readv(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+              QEMUIOVector *qiov)
 {
     BDRVVHDXState *s = bs->opaque;
     int ret = 0;
@@ -1324,9 +1325,9 @@ int vhdx_user_visible_write(BlockDriverState *bs, BDRVVHDXState *s)
     return ret;
 }
 
-static coroutine_fn int vhdx_co_writev(BlockDriverState *bs, int64_t sector_num,
-                                       int nb_sectors, QEMUIOVector *qiov,
-                                       int flags)
+static int coroutine_fn GRAPH_RDLOCK
+vhdx_co_writev(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
+               QEMUIOVector *qiov, int flags)
 {
     int ret = -ENOTSUP;
     BDRVVHDXState *s = bs->opaque;
diff --git a/block/vmdk.c b/block/vmdk.c
index 8b844300f4..c601ca85f4 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1403,13 +1403,11 @@ static void vmdk_refresh_limits(BlockDriverState *bs, Error **errp)
  * [@skip_start_sector, @skip_end_sector) is not copied or written, and leave
  * it for call to write user data in the request.
  */
-static int coroutine_fn get_whole_cluster(BlockDriverState *bs,
-                                          VmdkExtent *extent,
-                                          uint64_t cluster_offset,
-                                          uint64_t offset,
-                                          uint64_t skip_start_bytes,
-                                          uint64_t skip_end_bytes,
-                                          bool zeroed)
+static int coroutine_fn GRAPH_RDLOCK
+get_whole_cluster(BlockDriverState *bs, VmdkExtent *extent,
+                  uint64_t cluster_offset, uint64_t offset,
+                  uint64_t skip_start_bytes, uint64_t skip_end_bytes,
+                  bool zeroed)
 {
     int ret = VMDK_OK;
     int64_t cluster_bytes;
@@ -1536,14 +1534,11 @@ vmdk_L2update(VmdkExtent *extent, VmdkMetaData *m_data, uint32_t offset)
  *          VMDK_UNALLOC if cluster is not mapped and @allocate is false.
  *          VMDK_ERROR if failed.
  */
-static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
-                                           VmdkExtent *extent,
-                                           VmdkMetaData *m_data,
-                                           uint64_t offset,
-                                           bool allocate,
-                                           uint64_t *cluster_offset,
-                                           uint64_t skip_start_bytes,
-                                           uint64_t skip_end_bytes)
+static int coroutine_fn GRAPH_RDLOCK
+get_cluster_offset(BlockDriverState *bs, VmdkExtent *extent,
+                   VmdkMetaData *m_data, uint64_t offset, bool allocate,
+                   uint64_t *cluster_offset, uint64_t skip_start_bytes,
+                   uint64_t skip_end_bytes)
 {
     unsigned int l1_index, l2_offset, l2_index;
     int min_index, i, j;
@@ -1736,11 +1731,10 @@ static inline uint64_t vmdk_find_offset_in_cluster(VmdkExtent *extent,
     return extent_relative_offset % cluster_size;
 }
 
-static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
-                                             bool want_zero,
-                                             int64_t offset, int64_t bytes,
-                                             int64_t *pnum, int64_t *map,
-                                             BlockDriverState **file)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_block_status(BlockDriverState *bs, bool want_zero,
+                     int64_t offset, int64_t bytes, int64_t *pnum,
+                     int64_t *map, BlockDriverState **file)
 {
     BDRVVmdkState *s = bs->opaque;
     int64_t index_in_cluster, n, ret;
@@ -1785,7 +1779,7 @@ static int coroutine_fn vmdk_co_block_status(BlockDriverState *bs,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
                   int64_t offset_in_cluster, QEMUIOVector *qiov,
                   uint64_t qiov_offset, uint64_t n_bytes,
@@ -1867,10 +1861,9 @@ vmdk_write_extent(VmdkExtent *extent, int64_t cluster_offset,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
-                 int64_t offset_in_cluster, QEMUIOVector *qiov,
-                 int bytes)
+                 int64_t offset_in_cluster, QEMUIOVector *qiov, int bytes)
 {
     int ret;
     int cluster_bytes, buf_bytes;
@@ -1934,7 +1927,7 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vmdk_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -2016,9 +2009,9 @@ fail:
  *
  * Returns: error code with 0 for success.
  */
-static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
-                                     uint64_t bytes, QEMUIOVector *qiov,
-                                     bool zeroed, bool zero_dry_run)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_pwritev(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+             QEMUIOVector *qiov, bool zeroed, bool zero_dry_run)
 {
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent = NULL;
@@ -2028,8 +2021,6 @@ static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
     uint64_t bytes_done = 0;
     VmdkMetaData m_data;
 
-    assume_graph_lock(); /* FIXME */
-
     if (DIV_ROUND_UP(offset, BDRV_SECTOR_SIZE) > bs->total_sectors) {
         error_report("Wrong offset: offset=0x%" PRIx64
                      " total_sectors=0x%" PRIx64,
@@ -2116,7 +2107,7 @@ static int coroutine_fn vmdk_pwritev(BlockDriverState *bs, uint64_t offset,
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vmdk_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                 QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -2156,10 +2147,9 @@ vmdk_co_pwritev_compressed(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return vmdk_co_pwritev(bs, offset, bytes, qiov, 0);
 }
 
-static int coroutine_fn vmdk_co_pwrite_zeroes(BlockDriverState *bs,
-                                              int64_t offset,
-                                              int64_t bytes,
-                                              BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                      BdrvRequestFlags flags)
 {
     int ret;
     BDRVVmdkState *s = bs->opaque;
@@ -2920,9 +2910,8 @@ static VmdkExtentInfo *vmdk_get_extent_info(VmdkExtent *extent)
     return info;
 }
 
-static int coroutine_fn vmdk_co_check(BlockDriverState *bs,
-                                      BdrvCheckResult *result,
-                                      BdrvCheckMode fix)
+static int coroutine_fn GRAPH_RDLOCK
+vmdk_co_check(BlockDriverState *bs, BdrvCheckResult *result, BdrvCheckMode fix)
 {
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent = NULL;
diff --git a/block/vpc.c b/block/vpc.c
index 3c256fc5a4..1f0f26c0c4 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -610,7 +610,7 @@ vpc_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
     return 0;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vpc_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
               QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -660,7 +660,7 @@ fail:
     return ret;
 }
 
-static int coroutine_fn
+static int coroutine_fn GRAPH_RDLOCK
 vpc_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
                QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 4fed8b751f..d9d3807062 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -933,10 +933,9 @@ static void bdrv_test_top_close(BlockDriverState *bs)
     }
 }
 
-static int coroutine_fn bdrv_test_top_co_preadv(BlockDriverState *bs,
-                                                int64_t offset, int64_t bytes,
-                                                QEMUIOVector *qiov,
-                                                BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_test_top_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVTestTopState *tts = bs->opaque;
     return bdrv_co_preadv(tts->wait_child, offset, bytes, qiov, flags);
@@ -967,6 +966,8 @@ static void coroutine_fn test_co_delete_by_drain(void *opaque)
     void *buffer = g_malloc(65536);
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buffer, 65536);
 
+    GRAPH_RDLOCK_GUARD();
+
     /* Pretend some internal write operation from parent to child.
      * Important: We have to read from the child, not from the parent!
      * Draining works by first propagating it all up the tree to the
@@ -1698,11 +1699,9 @@ static void bdrv_replace_test_close(BlockDriverState *bs)
  * Otherwise:
  *   Set .has_read to true and return success.
  */
-static int coroutine_fn bdrv_replace_test_co_preadv(BlockDriverState *bs,
-                                                    int64_t offset,
-                                                    int64_t bytes,
-                                                    QEMUIOVector *qiov,
-                                                    BdrvRequestFlags flags)
+static int coroutine_fn GRAPH_RDLOCK
+bdrv_replace_test_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVReplaceTestState *s = bs->opaque;
 
@@ -1778,7 +1777,10 @@ static void coroutine_fn bdrv_replace_test_read_entry(void *opaque)
     int ret;
 
     /* Queue a read request post-drain */
+    bdrv_graph_co_rdlock();
     ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
+    bdrv_graph_co_rdunlock();
+
     g_assert(ret >= 0);
     bdrv_dec_in_flight(bs);
 }
-- 
2.39.2


