Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EC251454
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 10:36:52 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAURn-0000IU-9U
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOa-0003Cs-GU
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38639
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOX-0000ZE-Cj
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598344408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggnvqmczubq07GuaHsXyFe2PZU/ZmCGVTL0+/pjWjA4=;
 b=QDQuISoiU95ylbETiTgbR+Hg3BNSXaDMDv85k8QgGOJbvBPCsAJt03eJQGDBUX8IvKTc4K
 68GM9KY6OUxejgFnikSOhSGcW4TIPYQMbJ+MbVaix/MJBRFUgdWPjNAJuMU5kvywQOkP1/
 HsqsIMS9cD7B/RQAs+5/jmQIoHYsjg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ioVD41r8M1yP1Xh5wPcB2g-1; Tue, 25 Aug 2020 04:33:26 -0400
X-MC-Unique: ioVD41r8M1yP1Xh5wPcB2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3687C1074641;
 Tue, 25 Aug 2020 08:33:25 +0000 (UTC)
Received: from localhost (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7711950B3F;
 Tue, 25 Aug 2020 08:33:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/34] qcow2: Process QCOW2_CLUSTER_ZERO_ALLOC clusters in
 handle_copied()
Date: Tue, 25 Aug 2020 10:32:42 +0200
Message-Id: <20200825083311.1098442-6-mreitz@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When writing to a qcow2 file there are two functions that take a
virtual offset and return a host offset, possibly allocating new
clusters if necessary:

   - handle_copied() looks for normal data clusters that are already
     allocated and have a reference count of 1. In those clusters we
     can simply write the data and there is no need to perform any
     copy-on-write.

   - handle_alloc() looks for clusters that do need copy-on-write,
     either because they haven't been allocated yet, because their
     reference count is != 1 or because they are ZERO_ALLOC clusters.

The ZERO_ALLOC case is a bit special because those are clusters that
are already allocated and they could perfectly be dealt with in
handle_copied() (as long as copy-on-write is performed when required).

In fact, there is extra code specifically for them in handle_alloc()
that tries to reuse the existing allocation if possible and frees them
otherwise.

This patch changes the handling of ZERO_ALLOC clusters so the
semantics of these two functions are now like this:

   - handle_copied() looks for clusters that are already allocated and
     which we can overwrite (NORMAL and ZERO_ALLOC clusters with a
     reference count of 1).

   - handle_alloc() looks for clusters for which we need a new
     allocation (all other cases).

One important difference after this change is that clusters found
in handle_copied() may now require copy-on-write, but this will be
necessary anyway once we add support for subclusters.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <eb17fc938f6be7be2e8d8ff42763d2c19241f866.1594396418.git.berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-cluster.c | 252 +++++++++++++++++++++++-------------------
 1 file changed, 139 insertions(+), 113 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 369689b27c..b7b7b37062 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1040,13 +1040,18 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 
 /*
  * For a given write request, create a new QCowL2Meta structure, add
- * it to @m and the BDRVQcow2State.cluster_allocs list.
+ * it to @m and the BDRVQcow2State.cluster_allocs list. If the write
+ * request does not need copy-on-write or changes to the L2 metadata
+ * then this function does nothing.
  *
  * @host_cluster_offset points to the beginning of the first cluster.
  *
  * @guest_offset and @bytes indicate the offset and length of the
  * request.
  *
+ * @l2_slice contains the L2 entries of all clusters involved in this
+ * write request.
+ *
  * If @keep_old is true it means that the clusters were already
  * allocated and will be overwritten. If false then the clusters are
  * new and we have to decrease the reference count of the old ones.
@@ -1054,15 +1059,53 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 static void calculate_l2_meta(BlockDriverState *bs,
                               uint64_t host_cluster_offset,
                               uint64_t guest_offset, unsigned bytes,
-                              QCowL2Meta **m, bool keep_old)
+                              uint64_t *l2_slice, QCowL2Meta **m, bool keep_old)
 {
     BDRVQcow2State *s = bs->opaque;
-    unsigned cow_start_from = 0;
+    int l2_index = offset_to_l2_slice_index(s, guest_offset);
+    uint64_t l2_entry;
+    unsigned cow_start_from, cow_end_to;
     unsigned cow_start_to = offset_into_cluster(s, guest_offset);
     unsigned cow_end_from = cow_start_to + bytes;
-    unsigned cow_end_to = ROUND_UP(cow_end_from, s->cluster_size);
     unsigned nb_clusters = size_to_clusters(s, cow_end_from);
     QCowL2Meta *old_m = *m;
+    QCow2ClusterType type;
+
+    assert(nb_clusters <= s->l2_slice_size - l2_index);
+
+    /* Return if there's no COW (all clusters are normal and we keep them) */
+    if (keep_old) {
+        int i;
+        for (i = 0; i < nb_clusters; i++) {
+            l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+            if (qcow2_get_cluster_type(bs, l2_entry) != QCOW2_CLUSTER_NORMAL) {
+                break;
+            }
+        }
+        if (i == nb_clusters) {
+            return;
+        }
+    }
+
+    /* Get the L2 entry of the first cluster */
+    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    type = qcow2_get_cluster_type(bs, l2_entry);
+
+    if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
+        cow_start_from = cow_start_to;
+    } else {
+        cow_start_from = 0;
+    }
+
+    /* Get the L2 entry of the last cluster */
+    l2_entry = be64_to_cpu(l2_slice[l2_index + nb_clusters - 1]);
+    type = qcow2_get_cluster_type(bs, l2_entry);
+
+    if (type == QCOW2_CLUSTER_NORMAL && keep_old) {
+        cow_end_to = cow_end_from;
+    } else {
+        cow_end_to = ROUND_UP(cow_end_from, s->cluster_size);
+    }
 
     *m = g_malloc0(sizeof(**m));
     **m = (QCowL2Meta) {
@@ -1088,18 +1131,22 @@ static void calculate_l2_meta(BlockDriverState *bs,
     QLIST_INSERT_HEAD(&s->cluster_allocs, *m, next_in_flight);
 }
 
-/* Returns true if writing to a cluster requires COW */
-static bool cluster_needs_cow(BlockDriverState *bs, uint64_t l2_entry)
+/*
+ * Returns true if writing to the cluster pointed to by @l2_entry
+ * requires a new allocation (that is, if the cluster is unallocated
+ * or has refcount > 1 and therefore cannot be written in-place).
+ */
+static bool cluster_needs_new_alloc(BlockDriverState *bs, uint64_t l2_entry)
 {
     switch (qcow2_get_cluster_type(bs, l2_entry)) {
     case QCOW2_CLUSTER_NORMAL:
+    case QCOW2_CLUSTER_ZERO_ALLOC:
         if (l2_entry & QCOW_OFLAG_COPIED) {
             return false;
         }
     case QCOW2_CLUSTER_UNALLOCATED:
     case QCOW2_CLUSTER_COMPRESSED:
     case QCOW2_CLUSTER_ZERO_PLAIN:
-    case QCOW2_CLUSTER_ZERO_ALLOC:
         return true;
     default:
         abort();
@@ -1107,20 +1154,38 @@ static bool cluster_needs_cow(BlockDriverState *bs, uint64_t l2_entry)
 }
 
 /*
- * Returns the number of contiguous clusters that can be used for an allocating
- * write, but require COW to be performed (this includes yet unallocated space,
- * which must copy from the backing file)
+ * Returns the number of contiguous clusters that can be written to
+ * using one single write request, starting from @l2_index.
+ * At most @nb_clusters are checked.
+ *
+ * If @new_alloc is true this counts clusters that are either
+ * unallocated, or allocated but with refcount > 1 (so they need to be
+ * newly allocated and COWed).
+ *
+ * If @new_alloc is false this counts clusters that are already
+ * allocated and can be overwritten in-place (this includes clusters
+ * of type QCOW2_CLUSTER_ZERO_ALLOC).
  */
-static int count_cow_clusters(BlockDriverState *bs, int nb_clusters,
-    uint64_t *l2_slice, int l2_index)
+static int count_single_write_clusters(BlockDriverState *bs, int nb_clusters,
+                                       uint64_t *l2_slice, int l2_index,
+                                       bool new_alloc)
 {
+    BDRVQcow2State *s = bs->opaque;
+    uint64_t l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    uint64_t expected_offset = l2_entry & L2E_OFFSET_MASK;
     int i;
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
-        if (!cluster_needs_cow(bs, l2_entry)) {
+        l2_entry = be64_to_cpu(l2_slice[l2_index + i]);
+        if (cluster_needs_new_alloc(bs, l2_entry) != new_alloc) {
             break;
         }
+        if (!new_alloc) {
+            if (expected_offset != (l2_entry & L2E_OFFSET_MASK)) {
+                break;
+            }
+            expected_offset += s->cluster_size;
+        }
     }
 
     assert(i <= nb_clusters);
@@ -1191,10 +1256,10 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
 }
 
 /*
- * Checks how many already allocated clusters that don't require a copy on
- * write there are at the given guest_offset (up to *bytes). If *host_offset is
- * not INV_OFFSET, only physically contiguous clusters beginning at this host
- * offset are counted.
+ * Checks how many already allocated clusters that don't require a new
+ * allocation there are at the given guest_offset (up to *bytes).
+ * If *host_offset is not INV_OFFSET, only physically contiguous clusters
+ * beginning at this host offset are counted.
  *
  * Note that guest_offset may not be cluster aligned. In this case, the
  * returned *host_offset points to exact byte referenced by guest_offset and
@@ -1203,12 +1268,12 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
  * Returns:
  *   0:     if no allocated clusters are available at the given offset.
  *          *bytes is normally unchanged. It is set to 0 if the cluster
- *          is allocated and doesn't need COW, but doesn't have the right
- *          physical offset.
+ *          is allocated and can be overwritten in-place but doesn't have
+ *          the right physical offset.
  *
- *   1:     if allocated clusters that don't require a COW are available at
- *          the requested offset. *bytes may have decreased and describes
- *          the length of the area that can be written to.
+ *   1:     if allocated clusters that can be overwritten in place are
+ *          available at the requested offset. *bytes may have decreased
+ *          and describes the length of the area that can be written to.
  *
  *  -errno: in error cases
  */
@@ -1217,7 +1282,7 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index;
-    uint64_t cluster_offset;
+    uint64_t l2_entry, cluster_offset;
     uint64_t *l2_slice;
     uint64_t nb_clusters;
     unsigned int keep_clusters;
@@ -1238,7 +1303,8 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
 
     l2_index = offset_to_l2_slice_index(s, guest_offset);
     nb_clusters = MIN(nb_clusters, s->l2_slice_size - l2_index);
-    assert(nb_clusters <= INT_MAX);
+    /* Limit total byte count to BDRV_REQUEST_MAX_BYTES */
+    nb_clusters = MIN(nb_clusters, BDRV_REQUEST_MAX_BYTES >> s->cluster_bits);
 
     /* Find L2 entry for the first involved cluster */
     ret = get_cluster_table(bs, guest_offset, &l2_slice, &l2_index);
@@ -1246,41 +1312,39 @@ static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
         return ret;
     }
 
-    cluster_offset = be64_to_cpu(l2_slice[l2_index]);
-
-    /* Check how many clusters are already allocated and don't need COW */
-    if (qcow2_get_cluster_type(bs, cluster_offset) == QCOW2_CLUSTER_NORMAL
-        && (cluster_offset & QCOW_OFLAG_COPIED))
-    {
-        /* If a specific host_offset is required, check it */
-        bool offset_matches =
-            (cluster_offset & L2E_OFFSET_MASK) == *host_offset;
-
-        if (offset_into_cluster(s, cluster_offset & L2E_OFFSET_MASK)) {
-            qcow2_signal_corruption(bs, true, -1, -1, "Data cluster offset "
-                                    "%#llx unaligned (guest offset: %#" PRIx64
-                                    ")", cluster_offset & L2E_OFFSET_MASK,
-                                    guest_offset);
+    l2_entry = be64_to_cpu(l2_slice[l2_index]);
+    cluster_offset = l2_entry & L2E_OFFSET_MASK;
+
+    if (!cluster_needs_new_alloc(bs, l2_entry)) {
+        if (offset_into_cluster(s, cluster_offset)) {
+            qcow2_signal_corruption(bs, true, -1, -1, "%s cluster offset "
+                                    "%#" PRIx64 " unaligned (guest offset: %#"
+                                    PRIx64 ")", l2_entry & QCOW_OFLAG_ZERO ?
+                                    "Preallocated zero" : "Data",
+                                    cluster_offset, guest_offset);
             ret = -EIO;
             goto out;
         }
 
-        if (*host_offset != INV_OFFSET && !offset_matches) {
+        /* If a specific host_offset is required, check it */
+        if (*host_offset != INV_OFFSET && cluster_offset != *host_offset) {
             *bytes = 0;
             ret = 0;
             goto out;
         }
 
         /* We keep all QCOW_OFLAG_COPIED clusters */
-        keep_clusters =
-            count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      &l2_slice[l2_index],
-                                      QCOW_OFLAG_COPIED | QCOW_OFLAG_ZERO);
+        keep_clusters = count_single_write_clusters(bs, nb_clusters, l2_slice,
+                                                    l2_index, false);
         assert(keep_clusters <= nb_clusters);
 
         *bytes = MIN(*bytes,
                  keep_clusters * s->cluster_size
                  - offset_into_cluster(s, guest_offset));
+        assert(*bytes != 0);
+
+        calculate_l2_meta(bs, cluster_offset, guest_offset,
+                          *bytes, l2_slice, m, true);
 
         ret = 1;
     } else {
@@ -1294,8 +1358,7 @@ out:
     /* Only return a host offset if we actually made progress. Otherwise we
      * would make requirements for handle_alloc() that it can't fulfill */
     if (ret > 0) {
-        *host_offset = (cluster_offset & L2E_OFFSET_MASK)
-                     + offset_into_cluster(s, guest_offset);
+        *host_offset = cluster_offset + offset_into_cluster(s, guest_offset);
     }
 
     return ret;
@@ -1356,9 +1419,10 @@ static int do_alloc_cluster_offset(BlockDriverState *bs, uint64_t guest_offset,
 }
 
 /*
- * Allocates new clusters for an area that either is yet unallocated or needs a
- * copy on write. If *host_offset is not INV_OFFSET, clusters are only
- * allocated if the new allocation can match the specified host offset.
+ * Allocates new clusters for an area that is either still unallocated or
+ * cannot be overwritten in-place. If *host_offset is not INV_OFFSET,
+ * clusters are only allocated if the new allocation can match the specified
+ * host offset.
  *
  * Note that guest_offset may not be cluster aligned. In this case, the
  * returned *host_offset points to exact byte referenced by guest_offset and
@@ -1381,12 +1445,10 @@ static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
     BDRVQcow2State *s = bs->opaque;
     int l2_index;
     uint64_t *l2_slice;
-    uint64_t entry;
     uint64_t nb_clusters;
     int ret;
-    bool keep_old_clusters = false;
 
-    uint64_t alloc_cluster_offset = INV_OFFSET;
+    uint64_t alloc_cluster_offset;
 
     trace_qcow2_handle_alloc(qemu_coroutine_self(), guest_offset, *host_offset,
                              *bytes);
@@ -1401,10 +1463,8 @@ static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
 
     l2_index = offset_to_l2_slice_index(s, guest_offset);
     nb_clusters = MIN(nb_clusters, s->l2_slice_size - l2_index);
-    assert(nb_clusters <= INT_MAX);
-
-    /* Limit total allocation byte count to INT_MAX */
-    nb_clusters = MIN(nb_clusters, INT_MAX >> s->cluster_bits);
+    /* Limit total allocation byte count to BDRV_REQUEST_MAX_BYTES */
+    nb_clusters = MIN(nb_clusters, BDRV_REQUEST_MAX_BYTES >> s->cluster_bits);
 
     /* Find L2 entry for the first involved cluster */
     ret = get_cluster_table(bs, guest_offset, &l2_slice, &l2_index);
@@ -1412,67 +1472,32 @@ static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
         return ret;
     }
 
-    entry = be64_to_cpu(l2_slice[l2_index]);
-    nb_clusters = count_cow_clusters(bs, nb_clusters, l2_slice, l2_index);
+    nb_clusters = count_single_write_clusters(bs, nb_clusters,
+                                              l2_slice, l2_index, true);
 
     /* This function is only called when there were no non-COW clusters, so if
      * we can't find any unallocated or COW clusters either, something is
      * wrong with our code. */
     assert(nb_clusters > 0);
 
-    if (qcow2_get_cluster_type(bs, entry) == QCOW2_CLUSTER_ZERO_ALLOC &&
-        (entry & QCOW_OFLAG_COPIED) &&
-        (*host_offset == INV_OFFSET ||
-         start_of_cluster(s, *host_offset) == (entry & L2E_OFFSET_MASK)))
-    {
-        int preallocated_nb_clusters;
-
-        if (offset_into_cluster(s, entry & L2E_OFFSET_MASK)) {
-            qcow2_signal_corruption(bs, true, -1, -1, "Preallocated zero "
-                                    "cluster offset %#llx unaligned (guest "
-                                    "offset: %#" PRIx64 ")",
-                                    entry & L2E_OFFSET_MASK, guest_offset);
-            ret = -EIO;
-            goto fail;
-        }
-
-        /* Try to reuse preallocated zero clusters; contiguous normal clusters
-         * would be fine, too, but count_cow_clusters() above has limited
-         * nb_clusters already to a range of COW clusters */
-        preallocated_nb_clusters =
-            count_contiguous_clusters(bs, nb_clusters, s->cluster_size,
-                                      &l2_slice[l2_index], QCOW_OFLAG_COPIED);
-        assert(preallocated_nb_clusters > 0);
-
-        nb_clusters = preallocated_nb_clusters;
-        alloc_cluster_offset = entry & L2E_OFFSET_MASK;
-
-        /* We want to reuse these clusters, so qcow2_alloc_cluster_link_l2()
-         * should not free them. */
-        keep_old_clusters = true;
+    /* Allocate at a given offset in the image file */
+    alloc_cluster_offset = *host_offset == INV_OFFSET ? INV_OFFSET :
+        start_of_cluster(s, *host_offset);
+    ret = do_alloc_cluster_offset(bs, guest_offset, &alloc_cluster_offset,
+                                  &nb_clusters);
+    if (ret < 0) {
+        goto out;
     }
 
-    qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
-
-    if (alloc_cluster_offset == INV_OFFSET) {
-        /* Allocate, if necessary at a given offset in the image file */
-        alloc_cluster_offset = *host_offset == INV_OFFSET ? INV_OFFSET :
-                               start_of_cluster(s, *host_offset);
-        ret = do_alloc_cluster_offset(bs, guest_offset, &alloc_cluster_offset,
-                                      &nb_clusters);
-        if (ret < 0) {
-            goto fail;
-        }
-
-        /* Can't extend contiguous allocation */
-        if (nb_clusters == 0) {
-            *bytes = 0;
-            return 0;
-        }
-
-        assert(alloc_cluster_offset != INV_OFFSET);
+    /* Can't extend contiguous allocation */
+    if (nb_clusters == 0) {
+        *bytes = 0;
+        ret = 0;
+        goto out;
     }
 
+    assert(alloc_cluster_offset != INV_OFFSET);
+
     /*
      * Save info needed for meta data update.
      *
@@ -1495,13 +1520,14 @@ static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
     *bytes = MIN(*bytes, nb_bytes - offset_into_cluster(s, guest_offset));
     assert(*bytes != 0);
 
-    calculate_l2_meta(bs, alloc_cluster_offset, guest_offset, *bytes,
-                      m, keep_old_clusters);
+    calculate_l2_meta(bs, alloc_cluster_offset, guest_offset, *bytes, l2_slice,
+                      m, false);
 
-    return 1;
+    ret = 1;
 
-fail:
-    if (*m && (*m)->nb_clusters > 0) {
+out:
+    qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
+    if (ret < 0 && *m && (*m)->nb_clusters > 0) {
         QLIST_REMOVE(*m, next_in_flight);
     }
     return ret;
-- 
2.26.2


