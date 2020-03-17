Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616D188D1C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:28:01 +0100 (CET)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGwa-0001Ww-BK
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jEGmc-0002ox-5L
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jEGmZ-0007V0-2A
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:17:41 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57719)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jEGmX-0005V1-Qz; Tue, 17 Mar 2020 14:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=DJzqjcVKxNmjEGn0/Fro88mKEALPyKfXPzU/B5HHeZA=; 
 b=OUKIUZjz+Vpdr7y7nhFhJigaVnVHcNaLzrJ7teyPpfrHZDR1lLWyR+ZKoYEJa7NLvXoRCQEZxHIEshDaqlOAr4nuyciHLQ3Wqs1s+1mgtrVRa8Y4YIGlPWta3YEwLgkUKdJGr8kCNaQ3Anug44edqOABuv+kSuRQcU55uih8aj5HJ+WHP/5hYECVFGonNETEmb5VjC0Psla9Moe7wls1+iZLPM+/HtNRlvg+1MVG/0BlqiN+IJ/PXnegtYnLu7SBlMfy2r1vL7F1H33zsHISfrcJnp16f7o1rVEqdzDbltuCT6luN1zFGqcgNtl+WTjCHRIAz2R0sSbWqJTMRgNUyw==;
Received: from [81.0.35.138] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jEGmD-00015V-0y; Tue, 17 Mar 2020 19:17:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jEGlw-0006OF-7v; Tue, 17 Mar 2020 19:17:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/30] qcow2: Add get_l2_entry() and set_l2_entry()
Date: Tue, 17 Mar 2020 19:16:03 +0100
Message-Id: <bd054be18d469233e7ebcb81d8e8190c1f2eda0a.1584468723.git.berto@igalia.com>
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

The size of an L2 entry is 64 bits, but if we want to have subclusters
we need extended L2 entries. This means that we have to access L2
tables and slices differently depending on whether an image has
extended L2 entries or not.

This patch replaces all l2_slice[] accesses with calls to
get_l2_entry() and set_l2_entry().

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h          | 12 ++++++++
 block/qcow2-cluster.c  | 63 ++++++++++++++++++++++--------------------
 block/qcow2-refcount.c | 17 ++++++------
 3 files changed, 54 insertions(+), 38 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index f47ef6ca4e..7754d9bd02 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -495,6 +495,18 @@ typedef enum QCow2MetadataOverlap {
 
 #define INV_OFFSET (-1ULL)
 
+static inline uint64_t get_l2_entry(BDRVQcow2State *s, uint64_t *l2_slice,
+                                    int idx)
+{
+    return be64_to_cpu(l2_slice[idx]);
+}
+
+static inline void set_l2_entry(BDRVQcow2State *s, uint64_t *l2_slice,
+                                int idx, uint64_t entry)
+{
+    l2_slice[idx] = cpu_to_be64(entry);
+}
+
 static inline bool has_data_file(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 5c81046c34..cd48ab0223 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -383,12 +383,13 @@ fail:
  * cluster which may require a different handling)
  */
 static int count_contiguous_clusters(BlockDriverState *bs, int nb_clusters,
-        int cluster_size, uint64_t *l2_slice, uint64_t stop_flags)
+        int cluster_size, uint64_t *l2_slice, int l2_index, uint64_t stop_flags)
 {
+    BDRVQcow2State *s = bs->opaque;
     int i;
     QCow2ClusterType first_cluster_type;
     uint64_t mask = stop_flags | L2E_OFFSET_MASK | QCOW_OFLAG_COMPRESSED;
-    uint64_t first_entry = be64_to_cpu(l2_slice[0]);
+    uint64_t first_entry = get_l2_entry(s, l2_slice, l2_index);
     uint64_t offset = first_entry & mask;
 
     first_cluster_type = qcow2_get_cluster_type(bs, first_entry);
@@ -401,7 +402,7 @@ static int count_contiguous_clusters(BlockDriverState *bs, int nb_clusters,
            first_cluster_type == QCOW2_CLUSTER_ZERO_ALLOC);
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t l2_entry = be64_to_cpu(l2_slice[i]) & mask;
+        uint64_t l2_entry = get_l2_entry(s, l2_slice, l2_index + i) & mask;
         if (offset + (uint64_t) i * cluster_size != l2_entry) {
             break;
         }
@@ -417,14 +418,16 @@ static int count_contiguous_clusters(BlockDriverState *bs, int nb_clusters,
 static int count_contiguous_clusters_unallocated(BlockDriverState *bs,
                                                  int nb_clusters,
                                                  uint64_t *l2_slice,
+                                                 int l2_index,
                                                  QCow2ClusterType wanted_type)
 {
+    BDRVQcow2State *s = bs->opaque;
     int i;
 
     assert(wanted_type == QCOW2_CLUSTER_ZERO_PLAIN ||
            wanted_type == QCOW2_CLUSTER_UNALLOCATED);
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t entry = be64_to_cpu(l2_slice[i]);
+        uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
         QCow2ClusterType type = qcow2_get_cluster_type(bs, entry);
 
         if (type != wanted_type) {
@@ -575,7 +578,7 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
     /* find the cluster offset for the given disk offset */
 
     l2_index = offset_to_l2_slice_index(s, offset);
-    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index);
 
     nb_clusters = size_to_clusters(s, bytes_needed);
     /* bytes_needed <= *bytes + offset_in_cluster, both of which are unsigned
@@ -610,14 +613,14 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
     case QCOW2_CLUSTER_UNALLOCATED:
         /* how many empty clusters ? */
         c = count_contiguous_clusters_unallocated(bs, nb_clusters,
-                                                  &l2_slice[l2_index], type);
+                                                  l2_slice, l2_index, type);
         *host_offset = 0;
         break;
     case QCOW2_CLUSTER_ZERO_ALLOC:
     case QCOW2_CLUSTER_NORMAL:
         /* how many allocated clusters ? */
         c = count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      &l2_slice[l2_index], QCOW_OFLAG_ZERO);
+                                      l2_slice, l2_index, QCOW_OFLAG_ZERO);
         *host_offset = l2_entry & L2E_OFFSET_MASK;
         if (offset_into_cluster(s, *host_offset)) {
             qcow2_signal_corruption(bs, true, -1, -1,
@@ -771,7 +774,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 
     /* Compression can't overwrite anything. Fail if the cluster was already
      * allocated. */
-    cluster_offset = be64_to_cpu(l2_slice[l2_index]);
+    cluster_offset = get_l2_entry(s, l2_slice, l2_index);
     if (cluster_offset & L2E_OFFSET_MASK) {
         qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
         return -EIO;
@@ -800,7 +803,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 
     BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE_COMPRESSED);
     qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-    l2_slice[l2_index] = cpu_to_be64(cluster_offset);
+    set_l2_entry(s, l2_slice, l2_index, cluster_offset);
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
@@ -993,14 +996,14 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
          * cluster the second one has to do RMW (which is done above by
          * perform_cow()), update l2 table with its cluster pointer and free
          * old cluster. This is what this loop does */
-        if (l2_slice[l2_index + i] != 0) {
-            old_cluster[j++] = l2_slice[l2_index + i];
+        if (get_l2_entry(s, l2_slice, l2_index + i) != 0) {
+            old_cluster[j++] = get_l2_entry(s, l2_slice, l2_index + i);
         }
 
         /* The offset must fit in the offset field of the L2 table entry */
         assert((offset & L2E_OFFSET_MASK) == offset);
 
-        l2_slice[l2_index + i] = cpu_to_be64(offset | QCOW_OFLAG_COPIED);
+        set_l2_entry(s, l2_slice, l2_index + i, offset | QCOW_OFLAG_COPIED);
      }
 
 
@@ -1014,8 +1017,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
      */
     if (!m->keep_old_clusters && j != 0) {
         for (i = 0; i < j; i++) {
-            qcow2_free_any_clusters(bs, be64_to_cpu(old_cluster[i]), 1,
-                                    QCOW2_DISCARD_NEVER);
+            qcow2_free_any_clusters(bs, old_cluster[i], 1, QCOW2_DISCARD_NEVER);
         }
     }
 
@@ -1078,7 +1080,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     if (keep_old) {
         int i;
         for (i = 0; i < nb_clusters; i++) {
-            l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+            l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
             if (qcow2_get_cluster_type(bs, l2_entry) != QCOW2_CLUSTER_NORMAL) {
                 break;
             }
@@ -1089,7 +1091,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     }
 
     /* Get the L2 entry of the first cluster */
-    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index);
     type = qcow2_get_cluster_type(bs, l2_entry);
 
     if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
@@ -1099,7 +1101,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     }
 
     /* Get the L2 entry of the last cluster */
-    l2_entry = be64_to_cpu(l2_slice[l2_index + nb_clusters - 1]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index + nb_clusters - 1);
     type = qcow2_get_cluster_type(bs, l2_entry);
 
     if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
@@ -1172,12 +1174,12 @@ static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
                                        bool new_alloc)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    uint64_t l2_entry = get_l2_entry(s, l2_slice, l2_index);
     uint64_t expected_offset = l2_entry & L2E_OFFSET_MASK;
     int i;
 
     for (i = 0; i < nb_clusters; i++) {
-        l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+        l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
         if (cluster_needs_new_alloc(bs, l2_entry) != new_alloc) {
             break;
         }
@@ -1313,7 +1315,7 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
         return ret;
     }
 
-    cluster_offset = be64_to_cpu(l2_slice[l2_index]);
+    cluster_offset = get_l2_entry(s, l2_slice, l2_index);
 
     if (!cluster_needs_new_alloc(bs, cluster_offset)) {
         /* If a specific host_offset is required, check it */
@@ -1694,7 +1696,7 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     for (i = 0; i < nb_clusters; i++) {
         uint64_t old_l2_entry;
 
-        old_l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+        old_l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
 
         /*
          * If full_discard is false, make sure that a discarded area reads back
@@ -1734,9 +1736,9 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
         /* First remove L2 entries */
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
         if (!full_discard && s->qcow_version >= 3) {
-            l2_slice[l2_index + i] = cpu_to_be64(QCOW_OFLAG_ZERO);
+            set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
         } else {
-            l2_slice[l2_index + i] = cpu_to_be64(0);
+            set_l2_entry(s, l2_slice, l2_index + i, 0);
         }
 
         /* Then decrease the refcount */
@@ -1816,7 +1818,7 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
         uint64_t old_offset;
         QCow2ClusterType cluster_type;
 
-        old_offset = be64_to_cpu(l2_slice[l2_index + i]);
+        old_offset = get_l2_entry(s, l2_slice, l2_index + i);
 
         /*
          * Minimize L2 changes if the cluster already reads back as
@@ -1830,10 +1832,11 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
         if (cluster_type == QCOW2_CLUSTER_COMPRESSED || unmap) {
-            l2_slice[l2_index + i] = cpu_to_be64(QCOW_OFLAG_ZERO);
+            set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
             qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
         } else {
-            l2_slice[l2_index + i] |= cpu_to_be64(QCOW_OFLAG_ZERO);
+            uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
+            set_l2_entry(s, l2_slice, l2_index + i, entry | QCOW_OFLAG_ZERO);
         }
     }
 
@@ -1971,7 +1974,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
             }
 
             for (j = 0; j < s->l2_slice_size; j++) {
-                uint64_t l2_entry = be64_to_cpu(l2_slice[j]);
+                uint64_t l2_entry = get_l2_entry(s, l2_slice, j);
                 int64_t offset = l2_entry & L2E_OFFSET_MASK;
                 QCow2ClusterType cluster_type =
                     qcow2_get_cluster_type(bs, l2_entry);
@@ -1985,7 +1988,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                     if (!bs->backing) {
                         /* not backed; therefore we can simply deallocate the
                          * cluster */
-                        l2_slice[j] = 0;
+                        set_l2_entry(s, l2_slice, j, 0);
                         l2_dirty = true;
                         continue;
                     }
@@ -2051,9 +2054,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                 }
 
                 if (l2_refcount == 1) {
-                    l2_slice[j] = cpu_to_be64(offset | QCOW_OFLAG_COPIED);
+                    set_l2_entry(s, l2_slice, j, offset | QCOW_OFLAG_COPIED);
                 } else {
-                    l2_slice[j] = cpu_to_be64(offset);
+                    set_l2_entry(s, l2_slice, j, offset);
                 }
                 l2_dirty = true;
             }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 7ef1c0e42a..141e4fdcb1 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1310,7 +1310,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                     uint64_t cluster_index;
                     uint64_t offset;
 
-                    entry = be64_to_cpu(l2_slice[j]);
+                    entry = get_l2_entry(s, l2_slice, j);
                     old_entry = entry;
                     entry &= ~QCOW_OFLAG_COPIED;
                     offset = entry & L2E_OFFSET_MASK;
@@ -1384,7 +1384,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
                             qcow2_cache_set_dependency(bs, s->l2_table_cache,
                                                        s->refcount_block_cache);
                         }
-                        l2_slice[j] = cpu_to_be64(entry);
+                        set_l2_entry(s, l2_slice, j, entry);
                         qcow2_cache_entry_mark_dirty(s->l2_table_cache,
                                                      l2_slice);
                     }
@@ -1617,7 +1617,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
     /* Do the actual checks */
     for(i = 0; i < s->l2_size; i++) {
-        l2_entry = be64_to_cpu(l2_table[i]);
+        l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
         case QCOW2_CLUSTER_COMPRESSED:
@@ -1686,7 +1686,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                            QCOW2_OL_INACTIVE_L2;
 
                         l2_entry = QCOW_OFLAG_ZERO;
-                        l2_table[i] = cpu_to_be64(l2_entry);
+                        set_l2_entry(s, l2_table, i, l2_entry);
                         ret = qcow2_pre_write_overlap_check(bs, ign,
                                 l2e_offset, sizeof(uint64_t), false);
                         if (ret < 0) {
@@ -1914,7 +1914,7 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
         }
 
         for (j = 0; j < s->l2_size; j++) {
-            uint64_t l2_entry = be64_to_cpu(l2_table[j]);
+            uint64_t l2_entry = get_l2_entry(s, l2_table, j);
             uint64_t data_offset = l2_entry & L2E_OFFSET_MASK;
             QCow2ClusterType cluster_type = qcow2_get_cluster_type(bs, l2_entry);
 
@@ -1937,9 +1937,10 @@ static int check_oflag_copied(BlockDriverState *bs, BdrvCheckResult *res,
                             "l2_entry=%" PRIx64 " refcount=%" PRIu64 "\n",
                             repair ? "Repairing" : "ERROR", l2_entry, refcount);
                     if (repair) {
-                        l2_table[j] = cpu_to_be64(refcount == 1
-                                    ? l2_entry |  QCOW_OFLAG_COPIED
-                                    : l2_entry & ~QCOW_OFLAG_COPIED);
+                        set_l2_entry(s, l2_table, j,
+                                     refcount == 1 ?
+                                     l2_entry |  QCOW_OFLAG_COPIED :
+                                     l2_entry & ~QCOW_OFLAG_COPIED);
                         l2_dirty++;
                     }
                 }
-- 
2.20.1


