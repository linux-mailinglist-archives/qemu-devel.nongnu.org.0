Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F09213D1F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:00:15 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrO6o-0004er-DJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5N-0002Si-Ly; Fri, 03 Jul 2020 11:58:45 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5K-0007QA-8L; Fri, 03 Jul 2020 11:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=dOSk5RtXsBiuIPpToOq43XU4r5AYUmfGVWpe4E+bRiQ=; 
 b=CmqmRVL633RBiYkcef6xPqUAPXIU8dCM8O50GfQCdqwSSaY0iKjSFAAyZzf61icR63K/tuES43hyDD1pJzVSMXNUmL+X7zB43VIY9ySIK5Spnz92J5HdphaWt6HAyEMDu8EMMyCAmeaqjH3P9ApOsTa2Mp4zKtDnzu/ptBFHxOwEj9PiyhLNLQaZT3K9b/uF3wLw9si08kBD7JG73HPxpcjYlQDY/tdFc+oE5cGEreZTeMOvbBN2Anor1oTIgJ+DrGctD9qctpVB9eScayr11DneBz4v4TtwcN2VqsvbqQ+hcb4gna80lU40ZLhsAzDAQRuuZTNG6cX1m0AIqoZVdA==;
Received: from [81.0.49.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jrO5G-0001QF-63; Fri, 03 Jul 2020 17:58:38 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jrO51-0007PP-M8; Fri, 03 Jul 2020 17:58:23 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 06/34] qcow2: Add get_l2_entry() and set_l2_entry()
Date: Fri,  3 Jul 2020 17:57:52 +0200
Message-Id: <9176bf3a155f45b569b2c071394edc953a30ee35.1593791819.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593791819.git.berto@igalia.com>
References: <cover.1593791819.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 11:21:00
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

The size of an L2 entry is 64 bits, but if we want to have subclusters
we need extended L2 entries. This means that we have to access L2
tables and slices differently depending on whether an image has
extended L2 entries or not.

This patch replaces all l2_slice[] accesses with calls to
get_l2_entry() and set_l2_entry().

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h          | 12 ++++++++
 block/qcow2-cluster.c  | 63 ++++++++++++++++++++++--------------------
 block/qcow2-refcount.c | 17 ++++++------
 3 files changed, 54 insertions(+), 38 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 06475e0849..eecbadc4cb 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -510,6 +510,18 @@ typedef enum QCow2MetadataOverlap {
 
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
index 723a122977..b501642c56 100644
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
@@ -610,7 +613,7 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
     case QCOW2_CLUSTER_UNALLOCATED:
         /* how many empty clusters ? */
         c = count_contiguous_clusters_unallocated(bs, nb_clusters,
-                                                  &l2_slice[l2_index], type);
+                                                  l2_slice, l2_index, type);
         break;
     case QCOW2_CLUSTER_ZERO_ALLOC:
     case QCOW2_CLUSTER_NORMAL: {
@@ -618,7 +621,7 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
         *host_offset = host_cluster_offset + offset_in_cluster;
         /* how many allocated clusters ? */
         c = count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      &l2_slice[l2_index], QCOW_OFLAG_ZERO);
+                                      l2_slice, l2_index, QCOW_OFLAG_ZERO);
         if (offset_into_cluster(s, host_cluster_offset)) {
             qcow2_signal_corruption(bs, true, -1, -1,
                                     "Cluster allocation offset %#"
@@ -770,7 +773,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 
     /* Compression can't overwrite anything. Fail if the cluster was already
      * allocated. */
-    cluster_offset = be64_to_cpu(l2_slice[l2_index]);
+    cluster_offset = get_l2_entry(s, l2_slice, l2_index);
     if (cluster_offset & L2E_OFFSET_MASK) {
         qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
         return -EIO;
@@ -799,7 +802,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
 
     BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE_COMPRESSED);
     qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-    l2_slice[l2_index] = cpu_to_be64(cluster_offset);
+    set_l2_entry(s, l2_slice, l2_index, cluster_offset);
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
@@ -992,14 +995,14 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
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
 
 
@@ -1013,8 +1016,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
      */
     if (!m->keep_old_clusters && j != 0) {
         for (i = 0; i < j; i++) {
-            qcow2_free_any_clusters(bs, be64_to_cpu(old_cluster[i]), 1,
-                                    QCOW2_DISCARD_NEVER);
+            qcow2_free_any_clusters(bs, old_cluster[i], 1, QCOW2_DISCARD_NEVER);
         }
     }
 
@@ -1077,7 +1079,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     if (keep_old) {
         int i;
         for (i = 0; i < nb_clusters; i++) {
-            l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+            l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
             if (qcow2_get_cluster_type(bs, l2_entry) != QCOW2_CLUSTER_NORMAL) {
                 break;
             }
@@ -1088,7 +1090,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     }
 
     /* Get the L2 entry of the first cluster */
-    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index);
     type = qcow2_get_cluster_type(bs, l2_entry);
 
     if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
@@ -1098,7 +1100,7 @@ static void calculate_l2_meta(BlockDriverState *bs,
     }
 
     /* Get the L2 entry of the last cluster */
-    l2_entry = be64_to_cpu(l2_slice[l2_index + nb_clusters - 1]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index + nb_clusters - 1);
     type = qcow2_get_cluster_type(bs, l2_entry);
 
     if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
@@ -1171,12 +1173,12 @@ static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
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
@@ -1312,7 +1314,7 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
         return ret;
     }
 
-    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    l2_entry = get_l2_entry(s, l2_slice, l2_index);
     cluster_offset = l2_entry & L2E_OFFSET_MASK;
 
     if (!cluster_needs_new_alloc(bs, l2_entry)) {
@@ -1689,7 +1691,7 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     for (i = 0; i < nb_clusters; i++) {
         uint64_t old_l2_entry;
 
-        old_l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+        old_l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
 
         /*
          * If full_discard is false, make sure that a discarded area reads back
@@ -1729,9 +1731,9 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
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
@@ -1811,7 +1813,7 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
         uint64_t old_offset;
         QCow2ClusterType cluster_type;
 
-        old_offset = be64_to_cpu(l2_slice[l2_index + i]);
+        old_offset = get_l2_entry(s, l2_slice, l2_index + i);
 
         /*
          * Minimize L2 changes if the cluster already reads back as
@@ -1825,10 +1827,11 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
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
 
@@ -1966,7 +1969,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
             }
 
             for (j = 0; j < s->l2_slice_size; j++) {
-                uint64_t l2_entry = be64_to_cpu(l2_slice[j]);
+                uint64_t l2_entry = get_l2_entry(s, l2_slice, j);
                 int64_t offset = l2_entry & L2E_OFFSET_MASK;
                 QCow2ClusterType cluster_type =
                     qcow2_get_cluster_type(bs, l2_entry);
@@ -1980,7 +1983,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                     if (!bs->backing) {
                         /* not backed; therefore we can simply deallocate the
                          * cluster */
-                        l2_slice[j] = 0;
+                        set_l2_entry(s, l2_slice, j, 0);
                         l2_dirty = true;
                         continue;
                     }
@@ -2046,9 +2049,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
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
index 0457a6060d..04546838e8 100644
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


