Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3A251461
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 10:38:24 +0200 (CEST)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAUTH-0003Dp-8G
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 04:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOU-0002xW-5N
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37416
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOS-0000Y9-Bh
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598344403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sKN2BQeTY+D+vfJvhVYXWRYjlDFYE5zd5X8hsKK5BM=;
 b=ZaqGD1J0N9Vmq0+3ZbUD9DQ1SLaztlNrEkBuokBVkq3sDVBUzfGmbtK88/OjnpE3QviLFo
 N3+qLretDrHw8yTFGaMMI7BLwxScY4JzfOZApuTEdzyRJYHT6Cu0pM8I5ppr0wCD+30LJQ
 aC7m6VeRgSUIP29vdu88nxGO+lXbHXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-sLsFgIO3P2yHfyuEQhRVTA-1; Tue, 25 Aug 2020 04:33:19 -0400
X-MC-Unique: sLsFgIO3P2yHfyuEQhRVTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43487425D4;
 Tue, 25 Aug 2020 08:33:18 +0000 (UTC)
Received: from localhost (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3A97C874;
 Tue, 25 Aug 2020 08:33:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/34] qcow2: Convert qcow2_get_cluster_offset() into
 qcow2_get_host_offset()
Date: Tue, 25 Aug 2020 10:32:39 +0200
Message-Id: <20200825083311.1098442-3-mreitz@redhat.com>
In-Reply-To: <20200825083311.1098442-1-mreitz@redhat.com>
References: <20200825083311.1098442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

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
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <ffae6cdc5ca8950e8280ac0f696dcc376cb07095.1594396418.git.berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h         |  4 ++--
 block/qcow2-cluster.c | 41 +++++++++++++++++++++++------------------
 block/qcow2.c         | 24 +++++++-----------------
 3 files changed, 32 insertions(+), 37 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 7ce2c23bdb..06475e0849 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -694,8 +694,8 @@ int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
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
index 550850b264..71ddb0c462 100644
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
@@ -537,7 +542,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
         bytes_needed = bytes_available;
     }
 
-    *cluster_offset = 0;
+    *host_offset = 0;
 
     /* seek to the l2 offset in the l1 table */
 
@@ -570,7 +575,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
     /* find the cluster offset for the given disk offset */
 
     l2_index = offset_to_l2_slice_index(s, offset);
-    *cluster_offset = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = be64_to_cpu(l2_slice[l2_index]);
 
     nb_clusters = size_to_clusters(s, bytes_needed);
     /* bytes_needed <= *bytes + offset_in_cluster, both of which are unsigned
@@ -578,7 +583,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
      * true */
     assert(nb_clusters <= INT_MAX);
 
-    type = qcow2_get_cluster_type(bs, *cluster_offset);
+    type = qcow2_get_cluster_type(bs, l2_entry);
     if (s->qcow_version < 3 && (type == QCOW2_CLUSTER_ZERO_PLAIN ||
                                 type == QCOW2_CLUSTER_ZERO_ALLOC)) {
         qcow2_signal_corruption(bs, true, -1, -1, "Zero cluster entry found"
@@ -599,42 +604,42 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
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
index 5ab1f45fe2..6738daa247 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2036,7 +2036,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
                                               BlockDriverState **file)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t cluster_offset;
+    uint64_t host_offset;
     unsigned int bytes;
     int ret, status = 0;
 
@@ -2049,7 +2049,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     }
 
     bytes = MIN(INT_MAX, count);
-    ret = qcow2_get_cluster_offset(bs, offset, &bytes, &cluster_offset);
+    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset);
     qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
         return ret;
@@ -2059,7 +2059,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
 
     if ((ret == QCOW2_CLUSTER_NORMAL || ret == QCOW2_CLUSTER_ZERO_ALLOC) &&
         !s->crypto) {
-        *map = cluster_offset | offset_into_cluster(s, offset);
+        *map = host_offset;
         *file = s->data_file->bs;
         status |= BDRV_BLOCK_OFFSET_VALID;
     }
@@ -2273,7 +2273,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
     unsigned int cur_bytes; /* number of bytes in current iteration */
-    uint64_t cluster_offset = 0;
+    uint64_t host_offset = 0;
     AioTaskPool *aio = NULL;
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -2285,7 +2285,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         }
 
         qemu_co_mutex_lock(&s->lock);
-        ret = qcow2_get_cluster_offset(bs, offset, &cur_bytes, &cluster_offset);
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset);
         qemu_co_mutex_unlock(&s->lock);
         if (ret < 0) {
             goto out;
@@ -2297,15 +2297,6 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
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
@@ -3853,7 +3844,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
         bytes = s->cluster_size;
         nr = s->cluster_size;
-        ret = qcow2_get_cluster_offset(bs, offset, &nr, &off);
+        ret = qcow2_get_host_offset(bs, offset, &nr, &off);
         if (ret != QCOW2_CLUSTER_UNALLOCATED &&
             ret != QCOW2_CLUSTER_ZERO_PLAIN &&
             ret != QCOW2_CLUSTER_ZERO_ALLOC) {
@@ -3924,7 +3915,7 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
         cur_bytes = MIN(bytes, INT_MAX);
         cur_write_flags = write_flags;
 
-        ret = qcow2_get_cluster_offset(bs, src_offset, &cur_bytes, &copy_offset);
+        ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes, &copy_offset);
         if (ret < 0) {
             goto out;
         }
@@ -3956,7 +3947,6 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
 
         case QCOW2_CLUSTER_NORMAL:
             child = s->data_file;
-            copy_offset += offset_into_cluster(s, src_offset);
             break;
 
         default:
-- 
2.26.2


