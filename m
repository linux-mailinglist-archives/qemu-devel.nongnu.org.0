Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332801C5F2A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 19:46:02 +0200 (CEST)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW1dp-0007gx-71
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 13:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1XM-0006H1-An; Tue, 05 May 2020 13:39:20 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1XJ-00089w-6g; Tue, 05 May 2020 13:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=hDMIMlnpXea5FRz+ReK1Y6bUzIugilnmdD3dd/jyLqo=; 
 b=B9lO/tXBxiT41yH/3UZ3c8oNOrxHQWGsQiiYVL8KHKmRN4q22HLWAoFcoMh/V6yslT2rxRxkqbsdRnjErOhSwmTarTIcNIfJ6MfdVHRAvYM9cTdwNcLScyNU6j7KDyEnRhLwr5X+g/R3J/pTjasSRZMQArqWjUKO9Y18ah+/uYMC7o5qVIKJyLTQo2NL20QQg5bClyRvx3CjnEm/gUlWe3JtjDz0KnmcRn8oBz1IeGLdm4DYDaSlCEfpvvNRF6MzKL++gQZZ6fCtdneKgWZlWds/cKJHTFMy9KLvbyWBDkhGM+rtyLnvI4erg1iT4U7ld4IYf5fhSfJRPvNRBQ+3VA==;
Received: from static.160.43.0.81.ibercom.com ([81.0.43.160]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jW1Ws-00025M-CR; Tue, 05 May 2020 19:38:50 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jW1Wc-00043a-Ep; Tue, 05 May 2020 19:38:34 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/31] qcow2: Convert qcow2_get_cluster_offset() into
 qcow2_get_host_offset()
Date: Tue,  5 May 2020 19:38:02 +0200
Message-Id: <d5b7d9fc4da0fabcbb695d48eb1e6c36c06573f4.1588699789.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1588699789.git.berto@igalia.com>
References: <cover.1588699789.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 13:38:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2_get_cluster_offset() takes an (unaligned) guest offset and
returns the (aligned) offset of the corresponding cluster in the qcow2
image.

In practice none of the callers need to know where the cluster starts
so this patch makes the function calculate and return the final host
offset directly. The function is also renamed accordingly.

There is a pre-existing exception with compressed clusters: in this
case the function returns the complete cluster descriptor (containing
the offset and size of the compressed data). This does not change with
this patch but it is now documented.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h         |  4 ++--
 block/qcow2-cluster.c | 42 +++++++++++++++++++++++-------------------
 block/qcow2.c         | 24 +++++++-----------------
 3 files changed, 32 insertions(+), 38 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index f4de0a27d5..37e4f79e39 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -676,8 +676,8 @@ int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
 int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *buf, int nb_sectors, bool enc, Error **errp);
 
-int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
-                             unsigned int *bytes, uint64_t *cluster_offset);
+int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
+                          unsigned int *bytes, uint64_t *host_offset);
 int qcow2_alloc_cluster_offset(BlockDriverState *bs, uint64_t offset,
                                unsigned int *bytes, uint64_t *host_offset,
                                QCowL2Meta **m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 4b5fc8c4a7..9ab41cb728 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -496,10 +496,15 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
 
 
 /*
- * get_cluster_offset
+ * get_host_offset
  *
- * For a given offset of the virtual disk, find the cluster type and offset in
- * the qcow2 file. The offset is stored in *cluster_offset.
+ * For a given offset of the virtual disk find the equivalent host
+ * offset in the qcow2 file and store it in *host_offset. Neither
+ * offset needs to be aligned to a cluster boundary.
+ *
+ * If the cluster is unallocated then *host_offset will be 0.
+ * If the cluster is compressed then *host_offset will contain the
+ * complete compressed cluster descriptor.
  *
  * On entry, *bytes is the maximum number of contiguous bytes starting at
  * offset that we are interested in.
@@ -511,12 +516,12 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  * Returns the cluster type (QCOW2_CLUSTER_*) on success, -errno in error
  * cases.
  */
-int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
-                             unsigned int *bytes, uint64_t *cluster_offset)
+int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
+                          unsigned int *bytes, uint64_t *host_offset)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int l2_index;
-    uint64_t l1_index, l2_offset, *l2_slice;
+    uint64_t l1_index, l2_offset, *l2_slice, l2_entry;
     int c;
     unsigned int offset_in_cluster;
     uint64_t bytes_available, bytes_needed, nb_clusters;
@@ -537,8 +542,6 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
         bytes_needed = bytes_available;
     }
 
-    *cluster_offset = 0;
-
     /* seek to the l2 offset in the l1 table */
 
     l1_index = offset_to_l1_index(s, offset);
@@ -570,7 +573,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
     /* find the cluster offset for the given disk offset */
 
     l2_index = offset_to_l2_slice_index(s, offset);
-    *cluster_offset = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = be64_to_cpu(l2_slice[l2_index]);
 
     nb_clusters = size_to_clusters(s, bytes_needed);
     /* bytes_needed <= *bytes + offset_in_cluster, both of which are unsigned
@@ -578,7 +581,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
      * true */
     assert(nb_clusters <= INT_MAX);
 
-    type = qcow2_get_cluster_type(bs, *cluster_offset);
+    type = qcow2_get_cluster_type(bs, l2_entry);
     if (s->qcow_version < 3 && (type == QCOW2_CLUSTER_ZERO_PLAIN ||
                                 type == QCOW2_CLUSTER_ZERO_ALLOC)) {
         qcow2_signal_corruption(bs, true, -1, -1, "Zero cluster entry found"
@@ -599,42 +602,43 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
         }
         /* Compressed clusters can only be processed one by one */
         c = 1;
-        *cluster_offset &= L2E_COMPRESSED_OFFSET_SIZE_MASK;
+        *host_offset = l2_entry & L2E_COMPRESSED_OFFSET_SIZE_MASK;
         break;
     case QCOW2_CLUSTER_ZERO_PLAIN:
     case QCOW2_CLUSTER_UNALLOCATED:
         /* how many empty clusters ? */
         c = count_contiguous_clusters_unallocated(bs, nb_clusters,
                                                   &l2_slice[l2_index], type);
-        *cluster_offset = 0;
+        *host_offset = 0;
         break;
     case QCOW2_CLUSTER_ZERO_ALLOC:
-    case QCOW2_CLUSTER_NORMAL:
+    case QCOW2_CLUSTER_NORMAL: {
+        uint64_t host_cluster_offset = l2_entry & L2E_OFFSET_MASK;
+        *host_offset = host_cluster_offset + offset_in_cluster;
         /* how many allocated clusters ? */
         c = count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
                                       &l2_slice[l2_index], QCOW_OFLAG_ZERO);
-        *cluster_offset &= L2E_OFFSET_MASK;
-        if (offset_into_cluster(s, *cluster_offset)) {
+        if (offset_into_cluster(s, host_cluster_offset)) {
             qcow2_signal_corruption(bs, true, -1, -1,
                                     "Cluster allocation offset %#"
                                     PRIx64 " unaligned (L2 offset: %#" PRIx64
-                                    ", L2 index: %#x)", *cluster_offset,
+                                    ", L2 index: %#x)", host_cluster_offset,
                                     l2_offset, l2_index);
             ret = -EIO;
             goto fail;
         }
-        if (has_data_file(bs) && *cluster_offset != offset - offset_in_cluster)
-        {
+        if (has_data_file(bs) && *host_offset != offset) {
             qcow2_signal_corruption(bs, true, -1, -1,
                                     "External data file host cluster offset %#"
                                     PRIx64 " does not match guest cluster "
                                     "offset: %#" PRIx64
-                                    ", L2 index: %#x)", *cluster_offset,
+                                    ", L2 index: %#x)", host_cluster_offset,
                                     offset - offset_in_cluster, l2_index);
             ret = -EIO;
             goto fail;
         }
         break;
+    }
     default:
         abort();
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index a387809aa9..951fc19dd2 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1966,7 +1966,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
                                               BlockDriverState **file)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t cluster_offset;
+    uint64_t host_offset;
     unsigned int bytes;
     int ret, status = 0;
 
@@ -1979,7 +1979,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     }
 
     bytes = MIN(INT_MAX, count);
-    ret = qcow2_get_cluster_offset(bs, offset, &bytes, &cluster_offset);
+    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset);
     qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
         return ret;
@@ -1989,7 +1989,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
 
     if ((ret == QCOW2_CLUSTER_NORMAL || ret == QCOW2_CLUSTER_ZERO_ALLOC) &&
         !s->crypto) {
-        *map = cluster_offset | offset_into_cluster(s, offset);
+        *map = host_offset;
         *file = s->data_file->bs;
         status |= BDRV_BLOCK_OFFSET_VALID;
     }
@@ -2203,7 +2203,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
     unsigned int cur_bytes; /* number of bytes in current iteration */
-    uint64_t cluster_offset = 0;
+    uint64_t host_offset = 0;
     AioTaskPool *aio = NULL;
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -2215,7 +2215,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         }
 
         qemu_co_mutex_lock(&s->lock);
-        ret = qcow2_get_cluster_offset(bs, offset, &cur_bytes, &cluster_offset);
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset);
         qemu_co_mutex_unlock(&s->lock);
         if (ret < 0) {
             goto out;
@@ -2227,15 +2227,6 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
         } else {
-            /*
-             * For compressed clusters the variable cluster_offset
-             * does not actually store the offset but the full
-             * descriptor. We need to leave it unchanged because
-             * that's what qcow2_co_preadv_compressed() expects.
-             */
-            uint64_t host_offset = (ret == QCOW2_CLUSTER_COMPRESSED) ?
-                cluster_offset :
-                cluster_offset + offset_into_cluster(s, offset);
             if (!aio && cur_bytes != bytes) {
                 aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
             }
@@ -3756,7 +3747,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
         bytes = s->cluster_size;
         nr = s->cluster_size;
-        ret = qcow2_get_cluster_offset(bs, offset, &nr, &off);
+        ret = qcow2_get_host_offset(bs, offset, &nr, &off);
         if (ret != QCOW2_CLUSTER_UNALLOCATED &&
             ret != QCOW2_CLUSTER_ZERO_PLAIN &&
             ret != QCOW2_CLUSTER_ZERO_ALLOC) {
@@ -3827,7 +3818,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         cur_bytes = MIN(bytes, INT_MAX);
         cur_write_flags = write_flags;
 
-        ret = qcow2_get_cluster_offset(bs, src_offset, &cur_bytes, &copy_offset);
+        ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes, &copy_offset);
         if (ret < 0) {
             goto out;
         }
@@ -3859,7 +3850,6 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
 
         case QCOW2_CLUSTER_NORMAL:
             child = s->data_file;
-            copy_offset += offset_into_cluster(s, src_offset);
             break;
 
         default:
-- 
2.20.1


