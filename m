Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95A50885D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:43:47 +0200 (CEST)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh9gQ-0005NW-CO
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e4-0002FL-No
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nh9e1-00045L-Vt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 08:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650458477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOVPnb7qLsKScZDmafIoqnna6aPyF+7U8JLaxW3X37A=;
 b=EjuPraKslfuf8TFqOlEzCa44lM94BqDheX+PwvA/tjTlSDQgpjhqqyIVsEosu/n+WfTqtt
 u76Y1M2mZU5uEInzdgyMmRc7AElYP3sfStjnLRKpFM9Fkt09sqMEd3c9jLBIophjoW2yo8
 ZB2DT0ZltB/zA/29PkAMhXWWn3e9Jeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-7dxdNRjmPDaBmqaYfoFbrg-1; Wed, 20 Apr 2022 08:41:15 -0400
X-MC-Unique: 7dxdNRjmPDaBmqaYfoFbrg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A2B618F0261;
 Wed, 20 Apr 2022 12:41:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3F2111E3EA;
 Wed, 20 Apr 2022 12:41:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 6/8] qcow2: Improve refcount structure rebuilding
Date: Wed, 20 Apr 2022 14:41:02 +0200
Message-Id: <20220420124104.795836-7-hreitz@redhat.com>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
References: <20220420124104.795836-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When rebuilding the refcount structures (when qemu-img check -r found
errors with refcount = 0, but reference count > 0), the new refcount
table defaults to being put at the image file end[1].  There is no good
reason for that except that it means we will not have to rewrite any
refblocks we already wrote to disk.

Changing the code to rewrite those refblocks is not too difficult,
though, so let us do that.  That is beneficial for images on block
devices, where we cannot really write beyond the end of the image file.

Use this opportunity to add extensive comments to the code, and refactor
it a bit, getting rid of the backwards-jumping goto.

[1] Unless there is something allocated in the area pointed to by the
    last refblock, so we have to write that refblock.  In that case, we
    try to put the reftable in there.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
Closes: https://gitlab.com/qemu-project/qemu/-/issues/941
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220405134652.19278-2-hreitz@redhat.com>
---
 block/qcow2-refcount.c | 332 +++++++++++++++++++++++++++++------------
 1 file changed, 235 insertions(+), 97 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b91499410c..c5669eaa51 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2438,111 +2438,140 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
 }
 
 /*
- * Creates a new refcount structure based solely on the in-memory information
- * given through *refcount_table. All necessary allocations will be reflected
- * in that array.
+ * Helper function for rebuild_refcount_structure().
  *
- * On success, the old refcount structure is leaked (it will be covered by the
- * new refcount structure).
+ * Scan the range of clusters [first_cluster, end_cluster) for allocated
+ * clusters and write all corresponding refblocks to disk.  The refblock
+ * and allocation data is taken from the in-memory refcount table
+ * *refcount_table[] (of size *nb_clusters), which is basically one big
+ * (unlimited size) refblock for the whole image.
+ *
+ * For these refblocks, clusters are allocated using said in-memory
+ * refcount table.  Care is taken that these allocations are reflected
+ * in the refblocks written to disk.
+ *
+ * The refblocks' offsets are written into a reftable, which is
+ * *on_disk_reftable_ptr[] (of size *on_disk_reftable_entries_ptr).  If
+ * that reftable is of insufficient size, it will be resized to fit.
+ * This reftable is not written to disk.
+ *
+ * (If *on_disk_reftable_ptr is not NULL, the entries within are assumed
+ * to point to existing valid refblocks that do not need to be allocated
+ * again.)
+ *
+ * Return whether the on-disk reftable array was resized (true/false),
+ * or -errno on error.
  */
-static int rebuild_refcount_structure(BlockDriverState *bs,
-                                      BdrvCheckResult *res,
-                                      void **refcount_table,
-                                      int64_t *nb_clusters)
+static int rebuild_refcounts_write_refblocks(
+        BlockDriverState *bs, void **refcount_table, int64_t *nb_clusters,
+        int64_t first_cluster, int64_t end_cluster,
+        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr
+    )
 {
     BDRVQcow2State *s = bs->opaque;
-    int64_t first_free_cluster = 0, reftable_offset = -1, cluster = 0;
+    int64_t cluster;
     int64_t refblock_offset, refblock_start, refblock_index;
-    uint32_t reftable_size = 0;
-    uint64_t *on_disk_reftable = NULL;
+    int64_t first_free_cluster = 0;
+    uint64_t *on_disk_reftable = *on_disk_reftable_ptr;
+    uint32_t on_disk_reftable_entries = *on_disk_reftable_entries_ptr;
     void *on_disk_refblock;
-    int ret = 0;
-    struct {
-        uint64_t reftable_offset;
-        uint32_t reftable_clusters;
-    } QEMU_PACKED reftable_offset_and_clusters;
-
-    qcow2_cache_empty(bs, s->refcount_block_cache);
+    bool reftable_grown = false;
+    int ret;
 
-write_refblocks:
-    for (; cluster < *nb_clusters; cluster++) {
+    for (cluster = first_cluster; cluster < end_cluster; cluster++) {
+        /* Check all clusters to find refblocks that contain non-zero entries */
         if (!s->get_refcount(*refcount_table, cluster)) {
             continue;
         }
 
+        /*
+         * This cluster is allocated, so we need to create a refblock
+         * for it.  The data we will write to disk is just the
+         * respective slice from *refcount_table, so it will contain
+         * accurate refcounts for all clusters belonging to this
+         * refblock.  After we have written it, we will therefore skip
+         * all remaining clusters in this refblock.
+         */
+
         refblock_index = cluster >> s->refcount_block_bits;
         refblock_start = refblock_index << s->refcount_block_bits;
 
-        /* Don't allocate a cluster in a refblock already written to disk */
-        if (first_free_cluster < refblock_start) {
-            first_free_cluster = refblock_start;
-        }
-        refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
-                                              nb_clusters, &first_free_cluster);
-        if (refblock_offset < 0) {
-            fprintf(stderr, "ERROR allocating refblock: %s\n",
-                    strerror(-refblock_offset));
-            res->check_errors++;
-            ret = refblock_offset;
-            goto fail;
-        }
+        if (on_disk_reftable_entries > refblock_index &&
+            on_disk_reftable[refblock_index])
+        {
+            /*
+             * We can get here after a `goto write_refblocks`: We have a
+             * reftable from a previous run, and the refblock is already
+             * allocated.  No need to allocate it again.
+             */
+            refblock_offset = on_disk_reftable[refblock_index];
+        } else {
+            int64_t refblock_cluster_index;
 
-        if (reftable_size <= refblock_index) {
-            uint32_t old_reftable_size = reftable_size;
-            uint64_t *new_on_disk_reftable;
+            /* Don't allocate a cluster in a refblock already written to disk */
+            if (first_free_cluster < refblock_start) {
+                first_free_cluster = refblock_start;
+            }
+            refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
+                                                  nb_clusters,
+                                                  &first_free_cluster);
+            if (refblock_offset < 0) {
+                fprintf(stderr, "ERROR allocating refblock: %s\n",
+                        strerror(-refblock_offset));
+                return refblock_offset;
+            }
 
-            reftable_size = ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
-                                     s->cluster_size) / REFTABLE_ENTRY_SIZE;
-            new_on_disk_reftable = g_try_realloc(on_disk_reftable,
-                                                 reftable_size *
-                                                 REFTABLE_ENTRY_SIZE);
-            if (!new_on_disk_reftable) {
-                res->check_errors++;
-                ret = -ENOMEM;
-                goto fail;
+            refblock_cluster_index = refblock_offset / s->cluster_size;
+            if (refblock_cluster_index >= end_cluster) {
+                /*
+                 * We must write the refblock that holds this refblock's
+                 * refcount
+                 */
+                end_cluster = refblock_cluster_index + 1;
             }
-            on_disk_reftable = new_on_disk_reftable;
 
-            memset(on_disk_reftable + old_reftable_size, 0,
-                   (reftable_size - old_reftable_size) * REFTABLE_ENTRY_SIZE);
+            if (on_disk_reftable_entries <= refblock_index) {
+                on_disk_reftable_entries =
+                    ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
+                             s->cluster_size) / REFTABLE_ENTRY_SIZE;
+                on_disk_reftable =
+                    g_try_realloc(on_disk_reftable,
+                                  on_disk_reftable_entries *
+                                  REFTABLE_ENTRY_SIZE);
+                if (!on_disk_reftable) {
+                    return -ENOMEM;
+                }
 
-            /* The offset we have for the reftable is now no longer valid;
-             * this will leak that range, but we can easily fix that by running
-             * a leak-fixing check after this rebuild operation */
-            reftable_offset = -1;
-        } else {
-            assert(on_disk_reftable);
-        }
-        on_disk_reftable[refblock_index] = refblock_offset;
+                memset(on_disk_reftable + *on_disk_reftable_entries_ptr, 0,
+                       (on_disk_reftable_entries -
+                        *on_disk_reftable_entries_ptr) *
+                       REFTABLE_ENTRY_SIZE);
 
-        /* If this is apparently the last refblock (for now), try to squeeze the
-         * reftable in */
-        if (refblock_index == (*nb_clusters - 1) >> s->refcount_block_bits &&
-            reftable_offset < 0)
-        {
-            uint64_t reftable_clusters = size_to_clusters(s, reftable_size *
-                                                          REFTABLE_ENTRY_SIZE);
-            reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
-                                                  refcount_table, nb_clusters,
-                                                  &first_free_cluster);
-            if (reftable_offset < 0) {
-                fprintf(stderr, "ERROR allocating reftable: %s\n",
-                        strerror(-reftable_offset));
-                res->check_errors++;
-                ret = reftable_offset;
-                goto fail;
+                *on_disk_reftable_ptr = on_disk_reftable;
+                *on_disk_reftable_entries_ptr = on_disk_reftable_entries;
+
+                reftable_grown = true;
+            } else {
+                assert(on_disk_reftable);
             }
+            on_disk_reftable[refblock_index] = refblock_offset;
         }
 
+        /* Refblock is allocated, write it to disk */
+
         ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
                                             s->cluster_size, false);
         if (ret < 0) {
             fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
-            goto fail;
+            return ret;
         }
 
-        /* The size of *refcount_table is always cluster-aligned, therefore the
-         * write operation will not overflow */
+        /*
+         * The refblock is simply a slice of *refcount_table.
+         * Note that the size of *refcount_table is always aligned to
+         * whole clusters, so the write operation will not result in
+         * out-of-bounds accesses.
+         */
         on_disk_refblock = (void *)((char *) *refcount_table +
                                     refblock_index * s->cluster_size);
 
@@ -2550,23 +2579,99 @@ write_refblocks:
                           s->cluster_size);
         if (ret < 0) {
             fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
-            goto fail;
+            return ret;
         }
 
-        /* Go to the end of this refblock */
+        /* This refblock is done, skip to its end */
         cluster = refblock_start + s->refcount_block_size - 1;
     }
 
-    if (reftable_offset < 0) {
-        uint64_t post_refblock_start, reftable_clusters;
+    return reftable_grown;
+}
+
+/*
+ * Creates a new refcount structure based solely on the in-memory information
+ * given through *refcount_table (this in-memory information is basically just
+ * the concatenation of all refblocks).  All necessary allocations will be
+ * reflected in that array.
+ *
+ * On success, the old refcount structure is leaked (it will be covered by the
+ * new refcount structure).
+ */
+static int rebuild_refcount_structure(BlockDriverState *bs,
+                                      BdrvCheckResult *res,
+                                      void **refcount_table,
+                                      int64_t *nb_clusters)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t reftable_offset = -1;
+    int64_t reftable_length = 0;
+    int64_t reftable_clusters;
+    int64_t refblock_index;
+    uint32_t on_disk_reftable_entries = 0;
+    uint64_t *on_disk_reftable = NULL;
+    int ret = 0;
+    int reftable_size_changed = 0;
+    struct {
+        uint64_t reftable_offset;
+        uint32_t reftable_clusters;
+    } QEMU_PACKED reftable_offset_and_clusters;
+
+    qcow2_cache_empty(bs, s->refcount_block_cache);
+
+    /*
+     * For each refblock containing entries, we try to allocate a
+     * cluster (in the in-memory refcount table) and write its offset
+     * into on_disk_reftable[].  We then write the whole refblock to
+     * disk (as a slice of the in-memory refcount table).
+     * This is done by rebuild_refcounts_write_refblocks().
+     *
+     * Once we have scanned all clusters, we try to find space for the
+     * reftable.  This will dirty the in-memory refcount table (i.e.
+     * make it differ from the refblocks we have already written), so we
+     * need to run rebuild_refcounts_write_refblocks() again for the
+     * range of clusters where the reftable has been allocated.
+     *
+     * This second run might make the reftable grow again, in which case
+     * we will need to allocate another space for it, which is why we
+     * repeat all this until the reftable stops growing.
+     *
+     * (This loop will terminate, because with every cluster the
+     * reftable grows, it can accomodate a multitude of more refcounts,
+     * so that at some point this must be able to cover the reftable
+     * and all refblocks describing it.)
+     *
+     * We then convert the reftable to big-endian and write it to disk.
+     *
+     * Note that we never free any reftable allocations.  Doing so would
+     * needlessly complicate the algorithm: The eventual second check
+     * run we do will clean up all leaks we have caused.
+     */
+
+    reftable_size_changed =
+        rebuild_refcounts_write_refblocks(bs, refcount_table, nb_clusters,
+                                          0, *nb_clusters,
+                                          &on_disk_reftable,
+                                          &on_disk_reftable_entries);
+    if (reftable_size_changed < 0) {
+        res->check_errors++;
+        ret = reftable_size_changed;
+        goto fail;
+    }
+
+    /*
+     * There was no reftable before, so rebuild_refcounts_write_refblocks()
+     * must have increased its size (from 0 to something).
+     */
+    assert(reftable_size_changed);
+
+    do {
+        int64_t reftable_start_cluster, reftable_end_cluster;
+        int64_t first_free_cluster = 0;
+
+        reftable_length = on_disk_reftable_entries * REFTABLE_ENTRY_SIZE;
+        reftable_clusters = size_to_clusters(s, reftable_length);
 
-        post_refblock_start = ROUND_UP(*nb_clusters, s->refcount_block_size);
-        reftable_clusters =
-            size_to_clusters(s, reftable_size * REFTABLE_ENTRY_SIZE);
-        /* Not pretty but simple */
-        if (first_free_cluster < post_refblock_start) {
-            first_free_cluster = post_refblock_start;
-        }
         reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
                                               refcount_table, nb_clusters,
                                               &first_free_cluster);
@@ -2578,24 +2683,55 @@ write_refblocks:
             goto fail;
         }
 
-        goto write_refblocks;
-    }
+        /*
+         * We need to update the affected refblocks, so re-run the
+         * write_refblocks loop for the reftable's range of clusters.
+         */
+        assert(offset_into_cluster(s, reftable_offset) == 0);
+        reftable_start_cluster = reftable_offset / s->cluster_size;
+        reftable_end_cluster = reftable_start_cluster + reftable_clusters;
+        reftable_size_changed =
+            rebuild_refcounts_write_refblocks(bs, refcount_table, nb_clusters,
+                                              reftable_start_cluster,
+                                              reftable_end_cluster,
+                                              &on_disk_reftable,
+                                              &on_disk_reftable_entries);
+        if (reftable_size_changed < 0) {
+            res->check_errors++;
+            ret = reftable_size_changed;
+            goto fail;
+        }
+
+        /*
+         * If the reftable size has changed, we will need to find a new
+         * allocation, repeating the loop.
+         */
+    } while (reftable_size_changed);
 
-    for (refblock_index = 0; refblock_index < reftable_size; refblock_index++) {
+    /* The above loop must have run at least once */
+    assert(reftable_offset >= 0);
+
+    /*
+     * All allocations are done, all refblocks are written, convert the
+     * reftable to big-endian and write it to disk.
+     */
+
+    for (refblock_index = 0; refblock_index < on_disk_reftable_entries;
+         refblock_index++)
+    {
         cpu_to_be64s(&on_disk_reftable[refblock_index]);
     }
 
-    ret = qcow2_pre_write_overlap_check(bs, 0, reftable_offset,
-                                        reftable_size * REFTABLE_ENTRY_SIZE,
+    ret = qcow2_pre_write_overlap_check(bs, 0, reftable_offset, reftable_length,
                                         false);
     if (ret < 0) {
         fprintf(stderr, "ERROR writing reftable: %s\n", strerror(-ret));
         goto fail;
     }
 
-    assert(reftable_size < INT_MAX / REFTABLE_ENTRY_SIZE);
+    assert(reftable_length < INT_MAX);
     ret = bdrv_pwrite(bs->file, reftable_offset, on_disk_reftable,
-                      reftable_size * REFTABLE_ENTRY_SIZE);
+                      reftable_length);
     if (ret < 0) {
         fprintf(stderr, "ERROR writing reftable: %s\n", strerror(-ret));
         goto fail;
@@ -2604,7 +2740,7 @@ write_refblocks:
     /* Enter new reftable into the image header */
     reftable_offset_and_clusters.reftable_offset = cpu_to_be64(reftable_offset);
     reftable_offset_and_clusters.reftable_clusters =
-        cpu_to_be32(size_to_clusters(s, reftable_size * REFTABLE_ENTRY_SIZE));
+        cpu_to_be32(reftable_clusters);
     ret = bdrv_pwrite_sync(bs->file,
                            offsetof(QCowHeader, refcount_table_offset),
                            &reftable_offset_and_clusters,
@@ -2614,12 +2750,14 @@ write_refblocks:
         goto fail;
     }
 
-    for (refblock_index = 0; refblock_index < reftable_size; refblock_index++) {
+    for (refblock_index = 0; refblock_index < on_disk_reftable_entries;
+         refblock_index++)
+    {
         be64_to_cpus(&on_disk_reftable[refblock_index]);
     }
     s->refcount_table = on_disk_reftable;
     s->refcount_table_offset = reftable_offset;
-    s->refcount_table_size = reftable_size;
+    s->refcount_table_size = on_disk_reftable_entries;
     update_max_refcount_table_index(s);
 
     return 0;
-- 
2.35.1


