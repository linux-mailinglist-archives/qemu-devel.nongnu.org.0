Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F820C790
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 13:15:26 +0200 (CEST)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpVHR-0000N6-DN
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 07:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6S-0007X7-UV; Sun, 28 Jun 2020 07:04:05 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6K-0000WW-7H; Sun, 28 Jun 2020 07:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=rG3HtHSB2vY898CvBDGVh5MfaibllWEuf52ko3hA7Is=; 
 b=nLhy2Lf/XGZnHXO0OXXP0BjWHlrJVG3Ib2sUzD1B17hPmPPpVVuXmR2LPTPDpfS1r9PiNSLGYwXg5acudtf9RJaC4Lk9oy46Y0DvSjbCkVw8MtPglVc8pe92t5FQHvFWMGmYuCwZ9/73dvRIX97BhVl9+OUtsAji88KI6H5zs5ZZ4XLx3qANFbnmoL3mb/Bgi/590f/sVqw3dTZrwYmH3oOPWNLY+NCSRzPxT0MRfgBMvGSTp8uEDnRz0giqBdL6fAUO+j1OFuPlOVzsUB/0EI+1+3RIyNBEIZah3I79CDR76GrUoDzFuS8F73ZCSxtIH3AM1AP/7YM6debfCTiBpw==;
Received: from 26.red-79-158-236.dynamicip.rima-tde.net ([79.158.236.26]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jpV5X-0002gP-05; Sun, 28 Jun 2020 13:03:07 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jpV5H-000389-Em; Sun, 28 Jun 2020 13:02:51 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/34] qcow2: Make Qcow2AioTask store the full host offset
Date: Sun, 28 Jun 2020 13:02:10 +0200
Message-Id: <02c9a7133a220ab2279a8cb360bf3488e444be1e.1593342067.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593342067.git.berto@igalia.com>
References: <cover.1593342067.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 07:03:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file_cluster_offset field of Qcow2AioTask stores a cluster-aligned
host offset. In practice this is not very useful because all users(*)
of this structure need the final host offset into the cluster, which
they calculate using

   host_offset = file_cluster_offset + offset_into_cluster(s, offset)

There is no reason why Qcow2AioTask cannot store host_offset directly
and that is what this patch does.

(*) compressed clusters are the exception: in this case what
    file_cluster_offset was storing was the full compressed cluster
    descriptor (offset + size). This does not change with this patch
    but it is documented now.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c      | 69 ++++++++++++++++++++++------------------------
 block/trace-events |  2 +-
 2 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index e20590c3b7..d792137af6 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -74,7 +74,7 @@ typedef struct {
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t cluster_descriptor,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2103,7 +2103,7 @@ out:
 
 static coroutine_fn int
 qcow2_co_preadv_encrypted(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t host_offset,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -2130,16 +2130,12 @@ qcow2_co_preadv_encrypted(BlockDriverState *bs,
     }
 
     BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-    ret = bdrv_co_pread(s->data_file,
-                        file_cluster_offset + offset_into_cluster(s, offset),
-                        bytes, buf, 0);
+    ret = bdrv_co_pread(s->data_file, host_offset, bytes, buf, 0);
     if (ret < 0) {
         goto fail;
     }
 
-    if (qcow2_co_decrypt(bs,
-                         file_cluster_offset + offset_into_cluster(s, offset),
-                         offset, buf, bytes) < 0)
+    if (qcow2_co_decrypt(bs, host_offset, offset, buf, bytes) < 0)
     {
         ret = -EIO;
         goto fail;
@@ -2157,7 +2153,7 @@ typedef struct Qcow2AioTask {
 
     BlockDriverState *bs;
     QCow2ClusterType cluster_type; /* only for read */
-    uint64_t file_cluster_offset;
+    uint64_t host_offset; /* or full descriptor in compressed clusters */
     uint64_t offset;
     uint64_t bytes;
     QEMUIOVector *qiov;
@@ -2170,7 +2166,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        AioTaskPool *pool,
                                        AioTaskFunc func,
                                        QCow2ClusterType cluster_type,
-                                       uint64_t file_cluster_offset,
+                                       uint64_t host_offset,
                                        uint64_t offset,
                                        uint64_t bytes,
                                        QEMUIOVector *qiov,
@@ -2185,7 +2181,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
         .bs = bs,
         .cluster_type = cluster_type,
         .qiov = qiov,
-        .file_cluster_offset = file_cluster_offset,
+        .host_offset = host_offset,
         .offset = offset,
         .bytes = bytes,
         .qiov_offset = qiov_offset,
@@ -2194,7 +2190,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 
     trace_qcow2_add_task(qemu_coroutine_self(), bs, pool,
                          func == qcow2_co_preadv_task_entry ? "read" : "write",
-                         cluster_type, file_cluster_offset, offset, bytes,
+                         cluster_type, host_offset, offset, bytes,
                          qiov, qiov_offset);
 
     if (!pool) {
@@ -2208,13 +2204,12 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 
 static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              QCow2ClusterType cluster_type,
-                                             uint64_t file_cluster_offset,
+                                             uint64_t host_offset,
                                              uint64_t offset, uint64_t bytes,
                                              QEMUIOVector *qiov,
                                              size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int offset_in_cluster = offset_into_cluster(s, offset);
 
     switch (cluster_type) {
     case QCOW2_CLUSTER_ZERO_PLAIN:
@@ -2230,19 +2225,17 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                    qiov, qiov_offset, 0);
 
     case QCOW2_CLUSTER_COMPRESSED:
-        return qcow2_co_preadv_compressed(bs, file_cluster_offset,
+        return qcow2_co_preadv_compressed(bs, host_offset,
                                           offset, bytes, qiov, qiov_offset);
 
     case QCOW2_CLUSTER_NORMAL:
-        assert(offset_into_cluster(s, file_cluster_offset) == 0);
         if (bs->encrypted) {
-            return qcow2_co_preadv_encrypted(bs, file_cluster_offset,
+            return qcow2_co_preadv_encrypted(bs, host_offset,
                                              offset, bytes, qiov, qiov_offset);
         }
 
         BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-        return bdrv_co_preadv_part(s->data_file,
-                                   file_cluster_offset + offset_in_cluster,
+        return bdrv_co_preadv_part(s->data_file, host_offset,
                                    bytes, qiov, qiov_offset, 0);
 
     default:
@@ -2258,7 +2251,7 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 
     assert(!t->l2meta);
 
-    return qcow2_co_preadv_task(t->bs, t->cluster_type, t->file_cluster_offset,
+    return qcow2_co_preadv_task(t->bs, t->cluster_type, t->host_offset,
                                 t->offset, t->bytes, t->qiov, t->qiov_offset);
 }
 
@@ -2294,11 +2287,20 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
         } else {
+            /*
+             * For compressed clusters the variable cluster_offset
+             * does not actually store the offset but the full
+             * descriptor. We need to leave it unchanged because
+             * that's what qcow2_co_preadv_compressed() expects.
+             */
+            uint64_t host_offset = (ret == QCOW2_CLUSTER_COMPRESSED) ?
+                cluster_offset :
+                cluster_offset + offset_into_cluster(s, offset);
             if (!aio && cur_bytes != bytes) {
                 aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
             }
             ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, ret,
-                                 cluster_offset, offset, cur_bytes,
+                                 host_offset, offset, cur_bytes,
                                  qiov, qiov_offset, NULL);
             if (ret < 0) {
                 goto out;
@@ -2449,7 +2451,7 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
  *           not use it somehow after qcow2_co_pwritev_task() call
  */
 static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
-                                              uint64_t file_cluster_offset,
+                                              uint64_t host_offset,
                                               uint64_t offset, uint64_t bytes,
                                               QEMUIOVector *qiov,
                                               uint64_t qiov_offset,
@@ -2458,7 +2460,6 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
     int ret;
     BDRVQcow2State *s = bs->opaque;
     void *crypt_buf = NULL;
-    int offset_in_cluster = offset_into_cluster(s, offset);
     QEMUIOVector encrypted_qiov;
 
     if (bs->encrypted) {
@@ -2471,9 +2472,7 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
         }
         qemu_iovec_to_buf(qiov, qiov_offset, crypt_buf, bytes);
 
-        if (qcow2_co_encrypt(bs, file_cluster_offset + offset_in_cluster,
-                             offset, crypt_buf, bytes) < 0)
-        {
+        if (qcow2_co_encrypt(bs, host_offset, offset, crypt_buf, bytes) < 0) {
             ret = -EIO;
             goto out_unlocked;
         }
@@ -2497,10 +2496,8 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
      */
     if (!merge_cow(offset, bytes, qiov, qiov_offset, l2meta)) {
         BLKDBG_EVENT(bs->file, BLKDBG_WRITE_AIO);
-        trace_qcow2_writev_data(qemu_coroutine_self(),
-                                file_cluster_offset + offset_in_cluster);
-        ret = bdrv_co_pwritev_part(s->data_file,
-                                   file_cluster_offset + offset_in_cluster,
+        trace_qcow2_writev_data(qemu_coroutine_self(), host_offset);
+        ret = bdrv_co_pwritev_part(s->data_file, host_offset,
                                    bytes, qiov, qiov_offset, 0);
         if (ret < 0) {
             goto out_unlocked;
@@ -2530,7 +2527,7 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 
     assert(!t->cluster_type);
 
-    return qcow2_co_pwritev_task(t->bs, t->file_cluster_offset,
+    return qcow2_co_pwritev_task(t->bs, t->host_offset,
                                  t->offset, t->bytes, t->qiov, t->qiov_offset,
                                  t->l2meta);
 }
@@ -2585,8 +2582,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
         }
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_task_entry, 0,
-                             cluster_offset, offset, cur_bytes,
-                             qiov, qiov_offset, l2meta);
+                             cluster_offset + offset_in_cluster, offset,
+                             cur_bytes, qiov, qiov_offset, l2meta);
         l2meta = NULL; /* l2meta is consumed by qcow2_co_pwritev_task() */
         if (ret < 0) {
             goto fail_nometa;
@@ -4569,7 +4566,7 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
 
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
-                           uint64_t file_cluster_offset,
+                           uint64_t cluster_descriptor,
                            uint64_t offset,
                            uint64_t bytes,
                            QEMUIOVector *qiov,
@@ -4581,8 +4578,8 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = file_cluster_offset & s->cluster_offset_mask;
-    nb_csectors = ((file_cluster_offset >> s->csize_shift) & s->csize_mask) + 1;
+    coffset = cluster_descriptor & s->cluster_offset_mask;
+    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
     csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
         (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
 
diff --git a/block/trace-events b/block/trace-events
index dbe76a7613..e21b95f3e6 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -77,7 +77,7 @@ luring_io_uring_submit(void *s, int ret) "LuringState %p ret %d"
 luring_resubmit_short_read(void *s, void *luringcb, int nread) "LuringState %p luringcb %p nread %d"
 
 # qcow2.c
-qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t file_cluster_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
+qcow2_add_task(void *co, void *bs, void *pool, const char *action, int cluster_type, uint64_t host_offset, uint64_t offset, uint64_t bytes, void *qiov, size_t qiov_offset) "co %p bs %p pool %p: %s: cluster_type %d file_cluster_offset %" PRIu64 " offset %" PRIu64 " bytes %" PRIu64 " qiov %p qiov_offset %zu"
 qcow2_writev_start_req(void *co, int64_t offset, int bytes) "co %p offset 0x%" PRIx64 " bytes %d"
 qcow2_writev_done_req(void *co, int ret) "co %p ret %d"
 qcow2_writev_start_part(void *co) "co %p"
-- 
2.20.1


