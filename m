Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE18D128DC9
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:59:35 +0100 (CET)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiztW-0008N0-KZ
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZA-0003Nn-81
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ7-0006od-V6
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:31 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ7-0004V2-9M; Sun, 22 Dec 2019 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=9iMosx7u4f6rdZZvmG+CDPsOCgSu+D4AascyNAkVXR8=; 
 b=PCO91fBulDti5ftVodihVg7DWKeHtTbQvkE1W6jFmcrX1NLJsTdIhwqP+CPCdGSDtMgpRyoVrFMBfjArnhC6NffV4PptLkMN+H0onpijscPKsTVS1pIPQvGvZU5gG71+hCwCebLNYP6kNtlDQD7EeWAmB889WUb3GaCZ0QN5WDnN2Kt+HdUiJmyiNQ0NM8yq3xaUlL1rWxsbpva7fMr4o7cl1hbYL3fziuuVhdu5KXbWFuI81WNQmzEuFnO4LCOMIXO75M6bgjZTFNBzBrduHY4ZeP9mUMR4lt8BkAGhlPiixO3hA5e6nODoS7P8qHtqs07sDBNv//p59dTedXSGhA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dH-SN; Sun, 22 Dec 2019 12:37:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001Vw-MG; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 15/27] qcow2: Add subcluster support to
 qcow2_get_cluster_offset()
Date: Sun, 22 Dec 2019 12:36:56 +0100
Message-Id: <020909580d10ee5b9681961b52b8372ee892d35d.1577014346.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577014346.git.berto@igalia.com>
References: <cover.1577014346.git.berto@igalia.com>
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

The logic of this function remains pretty much the same, except that
it uses count_contiguous_subclusters(), which combines the logic of
count_contiguous_clusters() / count_contiguous_clusters_unallocated()
and checks individual subclusters.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 136 ++++++++++++++++++++----------------------
 block/qcow2.h         |  36 +++++------
 2 files changed, 80 insertions(+), 92 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index c6eb480ee8..c10601a828 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -372,66 +372,55 @@ fail:
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
  */
-static int count_contiguous_clusters(BlockDriverState *bs, int nb_clusters,
-        int cluster_size, uint64_t *l2_slice, int l2_index, uint64_t stop_flags)
+static int count_contiguous_subclusters(BlockDriverState *bs, int nb_clusters,
+                                        unsigned sc_index, uint64_t *l2_slice,
+                                        int l2_index)
 {
     BDRVQcow2State *s = bs->opaque;
-    int i;
-    QCow2ClusterType first_cluster_type;
-    uint64_t mask = stop_flags | L2E_OFFSET_MASK | QCOW_OFLAG_COMPRESSED;
-    uint64_t first_entry = get_l2_entry(s, l2_slice, l2_index);
-    uint64_t offset = first_entry & mask;
-
-    first_cluster_type = qcow2_get_cluster_type(bs, first_entry);
-    if (first_cluster_type == QCOW2_CLUSTER_UNALLOCATED) {
-        return 0;
+    int i, j, count = 0;
+    uint64_t l2_entry = get_l2_entry(s, l2_slice, l2_index);
+    uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
+    uint64_t expected_offset = l2_entry & L2E_OFFSET_MASK;
+    bool check_offset = true;
+    QCow2SubclusterType type =
+        qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc_index);
+
+    assert(type != QCOW2_SUBCLUSTER_INVALID); /* The caller should check this */
+
+    if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+        /* Compressed clusters are always processed one by one */
+        return s->subclusters_per_cluster - sc_index;
     }
 
-    /* must be allocated */
-    assert(first_cluster_type == QCOW2_CLUSTER_NORMAL ||
-           first_cluster_type == QCOW2_CLUSTER_ZERO_ALLOC);
-
-    for (i = 0; i < nb_clusters; i++) {
-        uint64_t l2_entry = get_l2_entry(s, l2_slice, l2_index + i) & mask;
-        if (offset + (uint64_t) i * cluster_size != l2_entry) {
-            break;
-        }
+    if (type == QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN ||
+        type == QCOW2_SUBCLUSTER_ZERO_PLAIN) {
+        check_offset = false;
     }
 
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
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
-        QCow2ClusterType type = qcow2_get_cluster_type(bs, entry);
-
-        if (type != wanted_type) {
-            break;
+        l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
+        l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+        if (check_offset && expected_offset != (l2_entry & L2E_OFFSET_MASK)) {
+            goto out;
+        }
+        for (j = (i == 0) ? sc_index : 0; j < s->subclusters_per_cluster; j++) {
+            if (qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, j) != type) {
+                goto out;
+            }
+            count++;
         }
+        expected_offset += s->cluster_size;
     }
 
-    return i;
+out:
+    return count;
 }
 
 static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
@@ -515,12 +504,12 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
                              QCow2SubclusterType *subcluster_type)
 {
     BDRVQcow2State *s = bs->opaque;
-    unsigned int l2_index;
-    uint64_t l1_index, l2_offset, *l2_slice;
-    int c;
+    unsigned int l2_index, sc_index;
+    uint64_t l1_index, l2_offset, *l2_slice, l2_bitmap;
+    int sc;
     unsigned int offset_in_cluster;
     uint64_t bytes_available, bytes_needed, nb_clusters;
-    QCow2ClusterType type;
+    QCow2SubclusterType type;
     int ret;
 
     offset_in_cluster = offset_into_cluster(s, offset);
@@ -570,7 +559,9 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
     /* find the cluster offset for the given disk offset */
 
     l2_index = offset_to_l2_slice_index(s, offset);
+    sc_index = offset_to_sc_index(s, offset);
     *cluster_offset = get_l2_entry(s, l2_slice, l2_index);
+    l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
 
     nb_clusters = size_to_clusters(s, bytes_needed);
     /* bytes_needed <= *bytes + offset_in_cluster, both of which are unsigned
@@ -578,9 +569,9 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
      * true */
     assert(nb_clusters <= INT_MAX);
 
-    type = qcow2_get_cluster_type(bs, *cluster_offset);
-    if (s->qcow_version < 3 && (type == QCOW2_CLUSTER_ZERO_PLAIN ||
-                                type == QCOW2_CLUSTER_ZERO_ALLOC)) {
+    type = qcow2_get_subcluster_type(bs, *cluster_offset, l2_bitmap, sc_index);
+    if (s->qcow_version < 3 && (type == QCOW2_SUBCLUSTER_ZERO_PLAIN ||
+                                type == QCOW2_SUBCLUSTER_ZERO_ALLOC)) {
         qcow2_signal_corruption(bs, true, -1, -1, "Zero cluster entry found"
                                 " in pre-v3 image (L2 offset: %#" PRIx64
                                 ", L2 index: %#x)", l2_offset, l2_index);
@@ -588,7 +579,13 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
         goto fail;
     }
     switch (type) {
-    case QCOW2_CLUSTER_COMPRESSED:
+    case QCOW2_SUBCLUSTER_INVALID:
+        qcow2_signal_corruption(bs, true, -1, -1, "Invalid cluster entry found "
+                                " (L2 offset: %#" PRIx64 ", L2 index: %#x)",
+                                l2_offset, l2_index);
+        ret = -EIO;
+        goto fail;
+    case QCOW2_SUBCLUSTER_COMPRESSED:
         if (has_data_file(bs)) {
             qcow2_signal_corruption(bs, true, -1, -1, "Compressed cluster "
                                     "entry found in image with external data "
@@ -598,21 +595,20 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
             goto fail;
         }
         /* Compressed clusters can only be processed one by one */
-        c = 1;
+        sc = s->subclusters_per_cluster - sc_index;
         *cluster_offset &= L2E_COMPRESSED_OFFSET_SIZE_MASK;
         break;
-    case QCOW2_CLUSTER_ZERO_PLAIN:
-    case QCOW2_CLUSTER_UNALLOCATED:
-        /* how many empty clusters ? */
-        c = count_contiguous_clusters_unallocated(bs, nb_clusters,
-                                                  l2_slice, l2_index, type);
+    case QCOW2_SUBCLUSTER_ZERO_PLAIN:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
+        sc = count_contiguous_subclusters(bs, nb_clusters, sc_index,
+                                          l2_slice, l2_index);
         *cluster_offset = 0;
         break;
-    case QCOW2_CLUSTER_ZERO_ALLOC:
-    case QCOW2_CLUSTER_NORMAL:
-        /* how many allocated clusters ? */
-        c = count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      l2_slice, l2_index, QCOW_OFLAG_ZERO);
+    case QCOW2_SUBCLUSTER_ZERO_ALLOC:
+    case QCOW2_SUBCLUSTER_NORMAL:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC:
+        sc = count_contiguous_subclusters(bs, nb_clusters, sc_index,
+                                          l2_slice, l2_index);
         *cluster_offset &= L2E_OFFSET_MASK;
         if (offset_into_cluster(s, *cluster_offset)) {
             qcow2_signal_corruption(bs, true, -1, -1,
@@ -641,7 +637,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
 
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
-    bytes_available = (int64_t)c * s->cluster_size;
+    bytes_available = ((int64_t)sc + sc_index) << s->subcluster_bits;
 
 out:
     if (bytes_available > bytes_needed) {
@@ -654,7 +650,7 @@ out:
     assert(bytes_available - offset_in_cluster <= UINT_MAX);
     *bytes = bytes_available - offset_in_cluster;
 
-    *subcluster_type = qcow2_cluster_to_subcluster_type(type);
+    *subcluster_type = type;
 
     return 0;
 
diff --git a/block/qcow2.h b/block/qcow2.h
index 37b7e25989..ae7973a2c2 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -651,27 +651,6 @@ static inline QCow2ClusterType qcow2_get_cluster_type(BlockDriverState *bs,
     }
 }
 
-/* For an image without extended L2 entries, return the
- * QCow2SubclusterType equivalent of a given QCow2ClusterType */
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
 /* In an image without subsclusters @l2_bitmap is ignored and
  * @sc_index must be 0. */
 static inline
@@ -720,7 +699,20 @@ QCow2SubclusterType qcow2_get_subcluster_type(BlockDriverState *bs,
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
 
-- 
2.20.1


