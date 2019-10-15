Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC9D7A61
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 17:49:05 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKP4J-0005Qy-5O
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 11:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iKOhN-0003Ov-51
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iKOhK-0003sX-6G
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:20 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iKOhJ-0003cN-E1; Tue, 15 Oct 2019 11:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=LyRBVk6DPKgZU3xdCKP6t9qXcnMtdtrOc91PUHA4dPc=; 
 b=N5+CnfJTTXGuI+IyvQKw6z2MrrVDoy6tA4UmRfQ1srOdw3CmNtCZV43sI9AYN5vQd82WLcGvPRDluvB/oBUM1DSHSCxBm9JZ7TjaVX5UU4bG97qmVGphOK9Xy7EYy5qsJTbHw7BbO5De0rhp0ujQzGNjOGlcfbJ5FHklmG4Q2eJueLCwcn0FY+H0+VVhcDVE6z3z6mqvE8bx1L6eDHry4ztXAYqlrllV/8Z56GbPN/lcKuVImELWON93OdKNqoibV83H8rj8uyFYVFEoLBmoFUYpcI53MA1rgz6fceQEOYnTf1MDpoce1icFIhtIqUzm4cnI67y0AIDiUyvmVJe0HQ==;
Received: from 82-181-115-92.bb.dnainternet.fi ([82.181.115.92]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iKOge-0003aa-21; Tue, 15 Oct 2019 17:24:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iKOfm-00061b-Te; Tue, 15 Oct 2019 18:23:42 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/23] qcow2: Add subcluster support to calculate_l2_meta()
Date: Tue, 15 Oct 2019 18:23:24 +0300
Message-Id: <c0540617479cbfc4c70e403d6374dd315e8830a9.1571152571.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1571152571.git.berto@igalia.com>
References: <cover.1571152571.git.berto@igalia.com>
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
 Max Reitz <mreitz@redhat.com>, "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If an image has subclusters then there are more copy-on-write
scenarios that we need to consider. Let's say we have a write request
from the middle of subcluster #3 until the end of the cluster:

   - If the cluster is new, then subclusters #0 to #3 from the old
     cluster must be copied into the new one.

   - If the cluster is new but the old cluster was unallocated, then
     only subcluster #3 needs copy-on-write. #0 to #2 are marked as
     unallocated in the bitmap of the new L2 entry.

   - If we are overwriting an old cluster and subcluster #3 is
     unallocated or has the all-zeroes bit set then we need
     copy-on-write on subcluster #3.

   - If we are overwriting an old cluster and subcluster #3 was
     allocated then there is no need to copy-on-write.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 136 +++++++++++++++++++++++++++++++++---------
 1 file changed, 108 insertions(+), 28 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 67f90e415d..8df0f67316 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1034,14 +1034,16 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
  * If @keep_old is true it means that the clusters were already
  * allocated and will be overwritten. If false then the clusters are
  * new and we have to decrease the reference count of the old ones.
+ *
+ * Returns 1 on success, -errno on failure.
  */
-static void calculate_l2_meta(BlockDriverState *bs, uint64_t host_offset,
-                              uint64_t guest_offset, uint64_t bytes,
-                              uint64_t *l2_slice, QCowL2Meta **m, bool keep_old)
+static int calculate_l2_meta(BlockDriverState *bs, uint64_t host_offset,
+                             uint64_t guest_offset, uint64_t bytes,
+                             uint64_t *l2_slice, QCowL2Meta **m, bool keep_old)
 {
     BDRVQcow2State *s = bs->opaque;
-    int l2_index = offset_to_l2_slice_index(s, guest_offset);
-    uint64_t l2_entry;
+    int sc_index, l2_index = offset_to_l2_slice_index(s, guest_offset);
+    uint64_t l2_entry, l2_bitmap;
     unsigned cow_start_from, cow_end_to;
     unsigned cow_start_to = offset_into_cluster(s, guest_offset);
     unsigned cow_end_from = cow_start_to + bytes;
@@ -1049,38 +1051,108 @@ static void calculate_l2_meta(BlockDriverState *bs, uint64_t host_offset,
     QCowL2Meta *old_m = *m;
     QCow2ClusterType type;
 
-    /* Return if there's no COW (all clusters are normal and we keep them) */
+    /* Return if there's no COW (all subclusters are normal and we are
+     * keeping the clusters) */
     if (keep_old) {
+        unsigned first_sc = cow_start_to / s->subcluster_size;
+        unsigned last_sc = (cow_end_from - 1) / s->subcluster_size;
         int i;
-        for (i = 0; i < nb_clusters; i++) {
-            l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
-            if (qcow2_get_cluster_type(bs, l2_entry) != QCOW2_CLUSTER_NORMAL) {
+        for (i = first_sc; i <= last_sc; i++) {
+            unsigned c = i / s->subclusters_per_cluster;
+            unsigned sc = i % s->subclusters_per_cluster;
+            l2_entry = get_l2_entry(s, l2_slice, l2_index + c);
+            l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + c);
+            type = qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc);
+            if (type == QCOW2_CLUSTER_INVALID) {
+                l2_index += c; /* Point to the invalid entry */
+                goto fail;
+            }
+            if (type != QCOW2_CLUSTER_NORMAL) {
                 break;
             }
         }
-        if (i == nb_clusters) {
-            return;
+        if (i == last_sc + 1) {
+            return 1;
         }
     }
 
     /* Get the L2 entry from the first cluster */
     l2_entry = get_l2_entry(s, l2_slice, l2_index);
-    type = qcow2_get_cluster_type(bs, l2_entry);
+    l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
+    sc_index = offset_to_sc_index(s, guest_offset);
+    type = qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc_index);
 
-    if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
-        cow_start_from = cow_start_to;
+    if (type == QCOW2_CLUSTER_INVALID) {
+        goto fail;
+    }
+
+    if (!keep_old) {
+        switch (type) {
+        case QCOW2_CLUSTER_NORMAL:
+        case QCOW2_CLUSTER_COMPRESSED:
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+        case QCOW2_CLUSTER_UNALLOCATED_SUBCLUSTER:
+            cow_start_from = 0;
+            break;
+        case QCOW2_CLUSTER_ZERO_PLAIN:
+        case QCOW2_CLUSTER_UNALLOCATED:
+            cow_start_from = sc_index << s->subcluster_bits;
+            break;
+        default:
+            g_assert_not_reached();
+        }
     } else {
-        cow_start_from = 0;
+        switch (type) {
+        case QCOW2_CLUSTER_NORMAL:
+            cow_start_from = cow_start_to;
+            break;
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+        case QCOW2_CLUSTER_UNALLOCATED_SUBCLUSTER:
+            cow_start_from = sc_index << s->subcluster_bits;
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 
     /* Get the L2 entry from the last cluster */
-    l2_entry = get_l2_entry(s, l2_slice, l2_index + nb_clusters - 1);
-    type = qcow2_get_cluster_type(bs, l2_entry);
+    l2_index += nb_clusters - 1;
+    l2_entry = get_l2_entry(s, l2_slice, l2_index);
+    l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
+    sc_index = offset_to_sc_index(s, guest_offset + bytes - 1);
+    type = qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc_index);
 
-    if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
-        cow_end_to = cow_end_from;
+    if (type == QCOW2_CLUSTER_INVALID) {
+        goto fail;
+    }
+
+    if (!keep_old) {
+        switch (type) {
+        case QCOW2_CLUSTER_NORMAL:
+        case QCOW2_CLUSTER_COMPRESSED:
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+        case QCOW2_CLUSTER_UNALLOCATED_SUBCLUSTER:
+            cow_end_to = ROUND_UP(cow_end_from, s->cluster_size);
+            break;
+        case QCOW2_CLUSTER_ZERO_PLAIN:
+        case QCOW2_CLUSTER_UNALLOCATED:
+            cow_end_to = ROUND_UP(cow_end_from, s->subcluster_size);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     } else {
-        cow_end_to = ROUND_UP(cow_end_from, s->cluster_size);
+        switch (type) {
+        case QCOW2_CLUSTER_NORMAL:
+            cow_end_to = cow_end_from;
+            break;
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+        case QCOW2_CLUSTER_UNALLOCATED_SUBCLUSTER:
+            cow_end_to = ROUND_UP(cow_end_from, s->subcluster_size);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 
     *m = g_malloc0(sizeof(**m));
@@ -1105,6 +1177,18 @@ static void calculate_l2_meta(BlockDriverState *bs, uint64_t host_offset,
 
     qemu_co_queue_init(&(*m)->dependent_requests);
     QLIST_INSERT_HEAD(&s->cluster_allocs, *m, next_in_flight);
+
+fail:
+    if (type == QCOW2_CLUSTER_INVALID) {
+        uint64_t l1_index = offset_to_l1_index(s, guest_offset);
+        uint64_t l2_offset = s->l1_table[l1_index] & L1E_OFFSET_MASK;
+        qcow2_signal_corruption(bs, true, -1, -1, "Invalid cluster entry found "
+                                " (L2 offset: %#" PRIx64 ", L2 index: %#x)",
+                                l2_offset, l2_index);
+        return -EIO;
+    }
+
+    return 1;
 }
 
 /* Returns true if the cluster is unallocated or has refcount > 1 */
@@ -1313,10 +1397,8 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
                  - offset_into_cluster(s, guest_offset));
         assert(*bytes != 0);
 
-        calculate_l2_meta(bs, cluster_offset & L2E_OFFSET_MASK, guest_offset,
-                          *bytes, l2_slice, m, true);
-
-        ret = 1;
+        ret = calculate_l2_meta(bs, cluster_offset & L2E_OFFSET_MASK,
+                                guest_offset, *bytes, l2_slice, m, true);
     } else {
         ret = 0;
     }
@@ -1488,10 +1570,8 @@ static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
     *bytes = MIN(*bytes, nb_bytes - offset_into_cluster(s, guest_offset));
     assert(*bytes != 0);
 
-    calculate_l2_meta(bs, alloc_cluster_offset, guest_offset, *bytes, l2_slice,
-                      m, false);
-
-    ret = 1;
+    ret = calculate_l2_meta(bs, alloc_cluster_offset, guest_offset, *bytes,
+                            l2_slice, m, false);
 
 out:
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
-- 
2.20.1


