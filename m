Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28152188D06
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:22:02 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGqm-0008QV-TH
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jEGmc-0002pC-MI
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jEGmZ-0007VX-28
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:17:42 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jEGmX-0005Ur-Ab; Tue, 17 Mar 2020 14:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=wvlhvR/WHqHAGsuHWv9RBqJIQK3AknXCaH3EJegJnr8=; 
 b=kkV/vc3XO3Vz4h9SYEE1YCWl9IWPB80pl6Pe8ZGqaQu/YL+MNyG3ATedOSkbQ8MvWCPsrkVD+fRi3m+EiNAKbbrofMMnvx0nIsBxmGd0L3ErlNSb6rHCatqh3L1gHhhtvF+qNcJJ3AIpBE6rwqqcpUGLlasLWB9+DVJj84p+1TOdwmpcEpFmoejbtiDczymtkd7KXy6CBSokHZGi7xdIKDu5aVatmcFm6LD5AskN9wpXg/TyONzbvUcedvE1yeg1nJp+u1ncl58Tn0fJ1DNVyGfjVJbuzMNNHsBTqopBdxrcMCgvaopqdeFKyituQXfHjj426HbgOUhdgsP9SeB6cQ==;
Received: from [81.0.35.138] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jEGmD-00015N-0i; Tue, 17 Mar 2020 19:17:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jEGlw-0006OX-I0; Tue, 17 Mar 2020 19:17:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/30] qcow2: Replace QCOW2_CLUSTER_* with
 QCOW2_SUBCLUSTER_*
Date: Tue, 17 Mar 2020 19:16:12 +0100
Message-Id: <8e28c82079d24482fce8e9422dc45503a0401b9b.1584468723.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1584468723.git.berto@igalia.com>
References: <cover.1584468723.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to support extended L2 entries some functions of the qcow2
driver need to start dealing with subclusters instead of clusters.

qcow2_get_host_offset() is modified to return the subcluster type
instead of the cluster type, and all callers are updated to replace
all values of QCow2ClusterType with their QCow2SubclusterType
equivalents.

This patch only changes the data types, there are no semantic changes.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h         |  2 +-
 block/qcow2-cluster.c | 10 +++----
 block/qcow2.c         | 70 ++++++++++++++++++++++---------------------
 3 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 6b7b286b91..e6fbb7d987 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -860,7 +860,7 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
 
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
-                          QCow2ClusterType *cluster_type);
+                          QCow2SubclusterType *subcluster_type);
 int qcow2_alloc_cluster_offset(BlockDriverState *bs, uint64_t offset,
                                unsigned int *bytes, uint64_t *host_offset,
                                QCowL2Meta **m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index acfcf8ea4c..8cdf8a23b6 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -513,15 +513,15 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * offset that we are interested in.
  *
  * On exit, *bytes is the number of bytes starting at offset that have the same
- * cluster type and (if applicable) are stored contiguously in the image file.
- * The cluster type is stored in *cluster_type.
- * Compressed clusters are always returned one by one.
+ * subcluster type and (if applicable) are stored contiguously in the image
+ * file. The subcluster type is stored in *subcluster_type.
+ * Compressed clusters are always processed one by one.
  *
  * Returns 0 on success, -errno in error cases.
  */
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           unsigned int *bytes, uint64_t *host_offset,
-                          QCow2ClusterType *cluster_type)
+                          QCow2SubclusterType *subcluster_type)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int l2_index;
@@ -664,7 +664,7 @@ out:
     assert(bytes_available - offset_in_cluster <= UINT_MAX);
     *bytes = bytes_available - offset_in_cluster;
 
-    *cluster_type = type;
+    *subcluster_type = qcow2_cluster_to_subcluster_type(type);
 
     return 0;
 
diff --git a/block/qcow2.c b/block/qcow2.c
index 48e188152c..f8788d6305 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1971,7 +1971,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     uint64_t host_offset;
     unsigned int bytes;
-    QCow2ClusterType type;
+    QCow2SubclusterType type;
     int ret, status = 0;
 
     qemu_co_mutex_lock(&s->lock);
@@ -1991,15 +1991,16 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
 
     *pnum = bytes;
 
-    if ((type == QCOW2_CLUSTER_NORMAL || type == QCOW2_CLUSTER_ZERO_ALLOC) &&
-        !s->crypto) {
+    if ((type == QCOW2_SUBCLUSTER_NORMAL ||
+         type == QCOW2_SUBCLUSTER_ZERO_ALLOC) && !s->crypto) {
         *map = host_offset;
         *file = s->data_file->bs;
         status |= BDRV_BLOCK_OFFSET_VALID;
     }
-    if (type == QCOW2_CLUSTER_ZERO_PLAIN || type == QCOW2_CLUSTER_ZERO_ALLOC) {
+    if (type == QCOW2_SUBCLUSTER_ZERO_PLAIN ||
+        type == QCOW2_SUBCLUSTER_ZERO_ALLOC) {
         status |= BDRV_BLOCK_ZERO;
-    } else if (type != QCOW2_CLUSTER_UNALLOCATED) {
+    } else if (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN) {
         status |= BDRV_BLOCK_DATA;
     }
     if (s->metadata_preallocation && (status & BDRV_BLOCK_DATA) &&
@@ -2096,7 +2097,7 @@ typedef struct Qcow2AioTask {
     AioTask task;
 
     BlockDriverState *bs;
-    QCow2ClusterType cluster_type; /* only for read */
+    QCow2SubclusterType subcluster_type; /* only for read */
     uint64_t host_offset; /* or full descriptor in compressed clusters */
     uint64_t offset;
     uint64_t bytes;
@@ -2109,7 +2110,7 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task);
 static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        AioTaskPool *pool,
                                        AioTaskFunc func,
-                                       QCow2ClusterType cluster_type,
+                                       QCow2SubclusterType subcluster_type,
                                        uint64_t host_offset,
                                        uint64_t offset,
                                        uint64_t bytes,
@@ -2123,7 +2124,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
     *task = (Qcow2AioTask) {
         .task.func = func,
         .bs = bs,
-        .cluster_type = cluster_type,
+        .subcluster_type = subcluster_type,
         .qiov = qiov,
         .host_offset = host_offset,
         .offset = offset,
@@ -2134,7 +2135,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 
     trace_qcow2_add_task(qemu_coroutine_self(), bs, pool,
                          func == qcow2_co_preadv_task_entry ? "read" : "write",
-                         cluster_type, host_offset, offset, bytes,
+                         subcluster_type, host_offset, offset, bytes,
                          qiov, qiov_offset);
 
     if (!pool) {
@@ -2147,7 +2148,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
 }
 
 static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
-                                             QCow2ClusterType cluster_type,
+                                             QCow2SubclusterType subc_type,
                                              uint64_t host_offset,
                                              uint64_t offset, uint64_t bytes,
                                              QEMUIOVector *qiov,
@@ -2155,24 +2156,24 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
 {
     BDRVQcow2State *s = bs->opaque;
 
-    switch (cluster_type) {
-    case QCOW2_CLUSTER_ZERO_PLAIN:
-    case QCOW2_CLUSTER_ZERO_ALLOC:
+    switch (subc_type) {
+    case QCOW2_SUBCLUSTER_ZERO_PLAIN:
+    case QCOW2_SUBCLUSTER_ZERO_ALLOC:
         /* Both zero types are handled in qcow2_co_preadv_part */
         g_assert_not_reached();
 
-    case QCOW2_CLUSTER_UNALLOCATED:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
         assert(bs->backing); /* otherwise handled in qcow2_co_preadv_part */
 
         BLKDBG_EVENT(bs->file, BLKDBG_READ_BACKING_AIO);
         return bdrv_co_preadv_part(bs->backing, offset, bytes,
                                    qiov, qiov_offset, 0);
 
-    case QCOW2_CLUSTER_COMPRESSED:
+    case QCOW2_SUBCLUSTER_COMPRESSED:
         return qcow2_co_preadv_compressed(bs, host_offset,
                                           offset, bytes, qiov, qiov_offset);
 
-    case QCOW2_CLUSTER_NORMAL:
+    case QCOW2_SUBCLUSTER_NORMAL:
         if (bs->encrypted) {
             return qcow2_co_preadv_encrypted(bs, host_offset,
                                              offset, bytes, qiov, qiov_offset);
@@ -2195,8 +2196,9 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
 
     assert(!t->l2meta);
 
-    return qcow2_co_preadv_task(t->bs, t->cluster_type, t->host_offset,
-                                t->offset, t->bytes, t->qiov, t->qiov_offset);
+    return qcow2_co_preadv_task(t->bs, t->subcluster_type,
+                                t->host_offset, t->offset, t->bytes,
+                                t->qiov, t->qiov_offset);
 }
 
 static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
@@ -2208,7 +2210,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
     int ret = 0;
     unsigned int cur_bytes; /* number of bytes in current iteration */
     uint64_t host_offset = 0;
-    QCow2ClusterType type;
+    QCow2SubclusterType type;
     AioTaskPool *aio = NULL;
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -2227,9 +2229,9 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
             goto out;
         }
 
-        if (type == QCOW2_CLUSTER_ZERO_PLAIN ||
-            type == QCOW2_CLUSTER_ZERO_ALLOC ||
-            (type == QCOW2_CLUSTER_UNALLOCATED && !bs->backing))
+        if (type == QCOW2_SUBCLUSTER_ZERO_PLAIN ||
+            type == QCOW2_SUBCLUSTER_ZERO_ALLOC ||
+            (type == QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN && !bs->backing))
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
         } else {
@@ -2463,7 +2465,7 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 {
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
-    assert(!t->cluster_type);
+    assert(!t->subcluster_type);
 
     return qcow2_co_pwritev_task(t->bs, t->host_offset,
                                  t->offset, t->bytes, t->qiov, t->qiov_offset,
@@ -3719,7 +3721,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
     if (head || tail) {
         uint64_t off;
         unsigned int nr;
-        QCow2ClusterType type;
+        QCow2SubclusterType type;
 
         assert(head + bytes <= s->cluster_size);
 
@@ -3737,9 +3739,9 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         nr = s->cluster_size;
         ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
         if (ret < 0 ||
-            (type != QCOW2_CLUSTER_UNALLOCATED &&
-             type != QCOW2_CLUSTER_ZERO_PLAIN &&
-             type != QCOW2_CLUSTER_ZERO_ALLOC)) {
+            (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
+             type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
+             type != QCOW2_SUBCLUSTER_ZERO_ALLOC)) {
             qemu_co_mutex_unlock(&s->lock);
             return -ENOTSUP;
         }
@@ -3797,7 +3799,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
 
     while (bytes != 0) {
         uint64_t copy_offset = 0;
-        QCow2ClusterType type;
+        QCow2SubclusterType type;
         /* prepare next request */
         cur_bytes = MIN(bytes, INT_MAX);
         cur_write_flags = write_flags;
@@ -3809,7 +3811,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         }
 
         switch (type) {
-        case QCOW2_CLUSTER_UNALLOCATED:
+        case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
             if (bs->backing && bs->backing->bs) {
                 int64_t backing_length = bdrv_getlength(bs->backing->bs);
                 if (src_offset >= backing_length) {
@@ -3824,16 +3826,16 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
             }
             break;
 
-        case QCOW2_CLUSTER_ZERO_PLAIN:
-        case QCOW2_CLUSTER_ZERO_ALLOC:
+        case QCOW2_SUBCLUSTER_ZERO_PLAIN:
+        case QCOW2_SUBCLUSTER_ZERO_ALLOC:
             cur_write_flags |= BDRV_REQ_ZERO_WRITE;
             break;
 
-        case QCOW2_CLUSTER_COMPRESSED:
+        case QCOW2_SUBCLUSTER_COMPRESSED:
             ret = -ENOTSUP;
             goto out;
 
-        case QCOW2_CLUSTER_NORMAL:
+        case QCOW2_SUBCLUSTER_NORMAL:
             child = s->data_file;
             break;
 
@@ -4289,7 +4291,7 @@ static coroutine_fn int qcow2_co_pwritev_compressed_task_entry(AioTask *task)
 {
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
-    assert(!t->cluster_type && !t->l2meta);
+    assert(!t->subcluster_type && !t->l2meta);
 
     return qcow2_co_pwritev_compressed_task(t->bs, t->offset, t->bytes, t->qiov,
                                             t->qiov_offset);
-- 
2.20.1


