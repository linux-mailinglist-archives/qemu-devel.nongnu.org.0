Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AED21BB0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 18:33:20 +0200 (CEST)
Received: from localhost ([::1]:42856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtvxf-0003eU-Pi
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 12:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtvfR-0003C1-38; Fri, 10 Jul 2020 12:14:29 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:43852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtvfJ-0004wD-Jz; Fri, 10 Jul 2020 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=B6kuSU8738lEGGuojoaZNwugeiQT7fxThQkC/uQWk2I=; 
 b=hVQ1hJkvvbnv5zxCVWJFitLORET4/WVBgu1gxV/7w75e4Psq8EzWSikpcrRMBw46fDxGbC6YJf9B/DNBFgM0HkrYXgDPRfA+zy/A6/plEYkuOcezq/yccsW2v/rDC/gHHGhLMlw5U8BbbWfCqxd3xhzdi9vR5jm1s5JQyVwM86bFR+Or/mK9uRBLg0NmViwhtEEZzDrD5XjCP+6k5luMtjdFhUYzA1mp/wCe3uo+8uRbfNU3tbiWg52hbO9BzMKf53YFhofSC4HnbJiyCOydK9y4YUWcwUx309e203xJuPFXmMFnUe1bsMhXy/wFscb9Co01ZRDXUs76l6/5QTwYAA==;
Received: from [81.0.43.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jtvea-0003jp-KZ; Fri, 10 Jul 2020 18:13:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jtveL-0001R3-A0; Fri, 10 Jul 2020 18:13:21 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 21/34] qcow2: Add subcluster support to
 qcow2_get_host_offset()
Date: Fri, 10 Jul 2020 18:13:03 +0200
Message-Id: <d2193fd48653a350d80f0eca1c67b1d9053fb2f3.1594396418.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1594396418.git.berto@igalia.com>
References: <cover.1594396418.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 12:13:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

The logic of this function remains pretty much the same, except that
it uses count_contiguous_subclusters(), which combines the logic of
count_contiguous_clusters() / count_contiguous_clusters_unallocated()
and checks individual subclusters.

qcow2_cluster_to_subcluster_type() is not necessary as a separate
function anymore so it's inlined into its caller.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h         |  38 ++++-------
 block/qcow2-cluster.c | 150 ++++++++++++++++++++++--------------------
 2 files changed, 92 insertions(+), 96 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 5df761edc3..4fad40b96b 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -710,29 +710,6 @@ static inline QCow2ClusterType qcow2_get_cluster_type(BlockDriverState *bs,
     }
 }
 
-/*
- * For an image without extended L2 entries, return the
- * QCow2SubclusterType equivalent of a given QCow2ClusterType.
- */
-static inline
-QCow2SubclusterType qcow2_cluster_to_subcluster_type(QCow2ClusterType type)
-{
-    switch (type) {
-    case QCOW2_CLUSTER_COMPRESSED:
-        return QCOW2_SUBCLUSTER_COMPRESSED;
-    case QCOW2_CLUSTER_ZERO_PLAIN:
-        return QCOW2_SUBCLUSTER_ZERO_PLAIN;
-    case QCOW2_CLUSTER_ZERO_ALLOC:
-        return QCOW2_SUBCLUSTER_ZERO_ALLOC;
-    case QCOW2_CLUSTER_NORMAL:
-        return QCOW2_SUBCLUSTER_NORMAL;
-    case QCOW2_CLUSTER_UNALLOCATED:
-        return QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /*
  * In an image without subsclusters @l2_bitmap is ignored and
  * @sc_index must be 0.
@@ -776,7 +753,20 @@ QCow2SubclusterType qcow2_get_subcluster_type(BlockDriverState *bs,
             g_assert_not_reached();
         }
     } else {
-        return qcow2_cluster_to_subcluster_type(type);
+        switch (type) {
+        case QCOW2_CLUSTER_COMPRESSED:
+            return QCOW2_SUBCLUSTER_COMPRESSED;
+        case QCOW2_CLUSTER_ZERO_PLAIN:
+            return QCOW2_SUBCLUSTER_ZERO_PLAIN;
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+            return QCOW2_SUBCLUSTER_ZERO_ALLOC;
+        case QCOW2_CLUSTER_NORMAL:
+            return QCOW2_SUBCLUSTER_NORMAL;
+        case QCOW2_CLUSTER_UNALLOCATED:
+            return QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
+        default:
+            g_assert_not_reached();
+        }
     }
 }
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 01495cb1c0..492296a90f 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -426,66 +426,66 @@ static int qcow2_get_subcluster_range_type(BlockDriverState *bs,
 }
 
 /*
- * Checks how many clusters in a given L2 slice are contiguous in the image
- * file. As soon as one of the flags in the bitmask stop_flags changes compared
- * to the first cluster, the search is stopped and the cluster is not counted
- * as contiguous. (This allows it, for example, to stop at the first compressed
- * cluster which may require a different handling)
+ * Return the number of contiguous subclusters of the exact same type
+ * in a given L2 slice, starting from cluster @l2_index, subcluster
+ * @sc_index. Allocated subclusters are required to be contiguous in
+ * the image file.
+ * At most @nb_clusters are checked (note that this means clusters,
+ * not subclusters).
+ * Compressed clusters are always processed one by one but for the
+ * purpose of this count they are treated as if they were divided into
+ * subclusters of size s->subcluster_size.
+ * On failure return -errno and update @l2_index to point to the
+ * invalid entry.
  */
-static int count_contiguous_clusters(BlockDriverState *bs, int nb_clusters,
-        int cluster_size, uint64_t *l2_slice, int l2_index, uint64_t stop_flags)
+static int count_contiguous_subclusters(BlockDriverState *bs, int nb_clusters,
+                                        unsigned sc_index, uint64_t *l2_slice,
+                                        unsigned *l2_index)
 {
     BDRVQcow2State *s = bs->opaque;
-    int i;
-    QCow2ClusterType first_cluster_type;
-    uint64_t mask = stop_flags | L2E_OFFSET_MASK | QCOW_OFLAG_COMPRESSED;
-    uint64_t first_entry = get_l2_entry(s, l2_slice, l2_index);
-    uint64_t offset = first_entry & mask;
+    int i, count = 0;
+    bool check_offset = false;
+    uint64_t expected_offset = 0;
+    QCow2SubclusterType expected_type, type;
 
-    first_cluster_type = qcow2_get_cluster_type(bs, first_entry);
-    if (first_cluster_type == QCOW2_CLUSTER_UNALLOCATED) {
-        return 0;
-    }
-
-    /* must be allocated */
-    assert(first_cluster_type == QCOW2_CLUSTER_NORMAL ||
-           first_cluster_type == QCOW2_CLUSTER_ZERO_ALLOC);
+    assert(*l2_index + nb_clusters <= s->l2_slice_size);
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t l2_entry = get_l2_entry(s, l2_slice, l2_index + i) & mask;
-        if (offset + (uint64_t) i * cluster_size != l2_entry) {
+        unsigned first_sc = (i == 0) ? sc_index : 0;
+        uint64_t l2_entry = get_l2_entry(s, l2_slice, *l2_index + i);
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, *l2_index + i);
+        int ret = qcow2_get_subcluster_range_type(bs, l2_entry, l2_bitmap,
+                                                  first_sc, &type);
+        if (ret < 0) {
+            *l2_index += i; /* Point to the invalid entry */
+            return -EIO;
+        }
+        if (i == 0) {
+            if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+                /* Compressed clusters are always processed one by one */
+                return ret;
+            }
+            expected_type = type;
+            expected_offset = l2_entry & L2E_OFFSET_MASK;
+            check_offset = (type == QCOW2_SUBCLUSTER_NORMAL ||
+                            type == QCOW2_SUBCLUSTER_ZERO_ALLOC ||
+                            type == QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC);
+        } else if (type != expected_type) {
             break;
+        } else if (check_offset) {
+            expected_offset += s->cluster_size;
+            if (expected_offset != (l2_entry & L2E_OFFSET_MASK)) {
+                break;
+            }
         }
-    }
-
-        return i;
-}
-
-/*
- * Checks how many consecutive unallocated clusters in a given L2
- * slice have the same cluster type.
- */
-static int count_contiguous_clusters_unallocated(BlockDriverState *bs,
-                                                 int nb_clusters,
-                                                 uint64_t *l2_slice,
-                                                 int l2_index,
-                                                 QCow2ClusterType wanted_type)
-{
-    BDRVQcow2State *s = bs->opaque;
-    int i;
-
-    assert(wanted_type == QCOW2_CLUSTER_ZERO_PLAIN ||
-           wanted_type == QCOW2_CLUSTER_UNALLOCATED);
-    for (i = 0; i < nb_clusters; i++) {
-        uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
-        QCow2ClusterType type = qcow2_get_cluster_type(bs, entry);
-
-        if (type != wanted_type) {
+        count += ret;
+        /* Stop if there are type changes before the end of the cluster */
+        if (first_sc + ret < s->subclusters_per_cluster) {
             break;
         }
     }
 
-    return i;
+    return count;
 }
 
 static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
@@ -574,12 +574,12 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
                           QCow2SubclusterType *subcluster_type)
 {
     BDRVQcow2State *s = bs->opaque;
-    unsigned int l2_index;
-    uint64_t l1_index, l2_offset, *l2_slice, l2_entry;
-    int c;
+    unsigned int l2_index, sc_index;
+    uint64_t l1_index, l2_offset, *l2_slice, l2_entry, l2_bitmap;
+    int sc;
     unsigned int offset_in_cluster;
     uint64_t bytes_available, bytes_needed, nb_clusters;
-    QCow2ClusterType type;
+    QCow2SubclusterType type;
     int ret;
 
     offset_in_cluster = offset_into_cluster(s, offset);
@@ -602,13 +602,13 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
 
     l1_index = offset_to_l1_index(s, offset);
     if (l1_index >= s->l1_size) {
-        type = QCOW2_CLUSTER_UNALLOCATED;
+        type = QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
         goto out;
     }
 
     l2_offset = s->l1_table[l1_index] & L1E_OFFSET_MASK;
     if (!l2_offset) {
-        type = QCOW2_CLUSTER_UNALLOCATED;
+        type = QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
         goto out;
     }
 
@@ -629,7 +629,9 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
     /* find the cluster offset for the given disk offset */
 
     l2_index = offset_to_l2_slice_index(s, offset);
+    sc_index = offset_to_sc_index(s, offset);
     l2_entry = get_l2_entry(s, l2_slice, l2_index);
+    l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
 
     nb_clusters = size_to_clusters(s, bytes_needed);
     /* bytes_needed <= *bytes + offset_in_cluster, both of which are unsigned
@@ -637,9 +639,9 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
      * true */
     assert(nb_clusters <= INT_MAX);
 
-    type = qcow2_get_cluster_type(bs, l2_entry);
-    if (s->qcow_version < 3 && (type == QCOW2_CLUSTER_ZERO_PLAIN ||
-                                type == QCOW2_CLUSTER_ZERO_ALLOC)) {
+    type = qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc_index);
+    if (s->qcow_version < 3 && (type == QCOW2_SUBCLUSTER_ZERO_PLAIN ||
+                                type == QCOW2_SUBCLUSTER_ZERO_ALLOC)) {
         qcow2_signal_corruption(bs, true, -1, -1, "Zero cluster entry found"
                                 " in pre-v3 image (L2 offset: %#" PRIx64
                                 ", L2 index: %#x)", l2_offset, l2_index);
@@ -647,7 +649,9 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
         goto fail;
     }
     switch (type) {
-    case QCOW2_CLUSTER_COMPRESSED:
+    case QCOW2_SUBCLUSTER_INVALID:
+        break; /* This is handled by count_contiguous_subclusters() below */
+    case QCOW2_SUBCLUSTER_COMPRESSED:
         if (has_data_file(bs)) {
             qcow2_signal_corruption(bs, true, -1, -1, "Compressed cluster "
                                     "entry found in image with external data "
@@ -656,23 +660,16 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
             ret = -EIO;
             goto fail;
         }
-        /* Compressed clusters can only be processed one by one */
-        c = 1;
         *host_offset = l2_entry & L2E_COMPRESSED_OFFSET_SIZE_MASK;
         break;
-    case QCOW2_CLUSTER_ZERO_PLAIN:
-    case QCOW2_CLUSTER_UNALLOCATED:
-        /* how many empty clusters ? */
-        c = count_contiguous_clusters_unallocated(bs, nb_clusters,
-                                                  l2_slice, l2_index, type);
+    case QCOW2_SUBCLUSTER_ZERO_PLAIN:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
         break;
-    case QCOW2_CLUSTER_ZERO_ALLOC:
-    case QCOW2_CLUSTER_NORMAL: {
+    case QCOW2_SUBCLUSTER_ZERO_ALLOC:
+    case QCOW2_SUBCLUSTER_NORMAL:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC: {
         uint64_t host_cluster_offset = l2_entry & L2E_OFFSET_MASK;
         *host_offset = host_cluster_offset + offset_in_cluster;
-        /* how many allocated clusters ? */
-        c = count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      l2_slice, l2_index, QCOW_OFLAG_ZERO);
         if (offset_into_cluster(s, host_cluster_offset)) {
             qcow2_signal_corruption(bs, true, -1, -1,
                                     "Cluster allocation offset %#"
@@ -698,9 +695,18 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
         abort();
     }
 
+    sc = count_contiguous_subclusters(bs, nb_clusters, sc_index,
+                                      l2_slice, &l2_index);
+    if (sc < 0) {
+        qcow2_signal_corruption(bs, true, -1, -1, "Invalid cluster entry found "
+                                " (L2 offset: %#" PRIx64 ", L2 index: %#x)",
+                                l2_offset, l2_index);
+        ret = -EIO;
+        goto fail;
+    }
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
-    bytes_available = (int64_t)c * s->cluster_size;
+    bytes_available = ((int64_t)sc + sc_index) << s->subcluster_bits;
 
 out:
     if (bytes_available > bytes_needed) {
@@ -713,7 +719,7 @@ out:
     assert(bytes_available - offset_in_cluster <= UINT_MAX);
     *bytes = bytes_available - offset_in_cluster;
 
-    *subcluster_type = qcow2_cluster_to_subcluster_type(type);
+    *subcluster_type = type;
 
     return 0;
 
-- 
2.20.1


