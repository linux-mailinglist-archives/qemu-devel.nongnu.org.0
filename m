Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9FD33425A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:03:41 +0100 (CET)
Received: from localhost ([::1]:53462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1JE-0004VO-He
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1Ez-0003AV-Te
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lK1Ex-00023F-9N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1ebnv9CH4pPF48/3fnpmkUosTdpCnKcTQplkRE32yA=;
 b=JP4UXPGXNstjupzV/0hSy3STrM/BFqsLaYPegGItyGxyUPf2LM6xSEppstN5v0A1rz5fid
 whpjlZjuAT4guhfwXR1L7UYBdHDObB+RK9iLIw19crrMyEbZcvQtze3bGOntQ0FHQpTqgp
 pXoZdM+78UtsqHiWJHmNf6lj7MxfD0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-szdzuHBVMTmeg-qdyC6VLg-1; Wed, 10 Mar 2021 10:59:12 -0500
X-MC-Unique: szdzuHBVMTmeg-qdyC6VLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C878802690;
 Wed, 10 Mar 2021 15:59:11 +0000 (UTC)
Received: from localhost (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C13256062F;
 Wed, 10 Mar 2021 15:59:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/4] qcow2: Improve refcount structure rebuilding
Date: Wed, 10 Mar 2021 16:59:03 +0100
Message-Id: <20210310155906.147478-2-mreitz@redhat.com>
In-Reply-To: <20210310155906.147478-1-mreitz@redhat.com>
References: <20210310155906.147478-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
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

[1] Unless there is something allocated in the area pointed to by the
    last refblock, so we have to write that refblock.  In that case, we
    try to put the reftable in there.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-refcount.c | 126 ++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 59 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..162caeeb8e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2352,8 +2352,9 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
                                       int64_t *nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
-    int64_t first_free_cluster = 0, reftable_offset = -1, cluster = 0;
+    int64_t first_free_cluster = 0, reftable_offset = -1, cluster;
     int64_t refblock_offset, refblock_start, refblock_index;
+    int64_t first_cluster, end_cluster;
     uint32_t reftable_size = 0;
     uint64_t *on_disk_reftable = NULL;
     void *on_disk_refblock;
@@ -2365,8 +2366,11 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
 
     qcow2_cache_empty(bs, s->refcount_block_cache);
 
+    first_cluster = 0;
+    end_cluster = *nb_clusters;
+
 write_refblocks:
-    for (; cluster < *nb_clusters; cluster++) {
+    for (cluster = first_cluster; cluster < end_cluster; cluster++) {
         if (!s->get_refcount(*refcount_table, cluster)) {
             continue;
         }
@@ -2374,65 +2378,68 @@ write_refblocks:
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
-
-        if (reftable_size <= refblock_index) {
-            uint32_t old_reftable_size = reftable_size;
-            uint64_t *new_on_disk_reftable;
+        if (reftable_size > refblock_index &&
+            on_disk_reftable[refblock_index])
+        {
+            refblock_offset = on_disk_reftable[refblock_index];
+        } else {
+            int64_t refblock_cluster_index;
 
-            reftable_size = ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
-                                     s->cluster_size) / REFTABLE_ENTRY_SIZE;
-            new_on_disk_reftable = g_try_realloc(on_disk_reftable,
-                                                 reftable_size *
-                                                 REFTABLE_ENTRY_SIZE);
-            if (!new_on_disk_reftable) {
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
                 res->check_errors++;
-                ret = -ENOMEM;
+                ret = refblock_offset;
                 goto fail;
             }
-            on_disk_reftable = new_on_disk_reftable;
 
-            memset(on_disk_reftable + old_reftable_size, 0,
-                   (reftable_size - old_reftable_size) * REFTABLE_ENTRY_SIZE);
+            refblock_cluster_index = refblock_offset / s->cluster_size;
+            if (refblock_cluster_index >= end_cluster) {
+                /*
+                 * We must write the refblock that holds this refblock's
+                 * refcount
+                 */
+                end_cluster = refblock_cluster_index + 1;
+            }
 
-            /* The offset we have for the reftable is now no longer valid;
-             * this will leak that range, but we can easily fix that by running
-             * a leak-fixing check after this rebuild operation */
-            reftable_offset = -1;
-        } else {
-            assert(on_disk_reftable);
-        }
-        on_disk_reftable[refblock_index] = refblock_offset;
+            if (reftable_size <= refblock_index) {
+                uint32_t old_reftable_size = reftable_size;
+                uint64_t *new_on_disk_reftable;
+
+                reftable_size =
+                    ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
+                             s->cluster_size) / REFTABLE_ENTRY_SIZE;
+                new_on_disk_reftable =
+                    g_try_realloc(on_disk_reftable,
+                                  reftable_size * REFTABLE_ENTRY_SIZE);
+                if (!new_on_disk_reftable) {
+                    res->check_errors++;
+                    ret = -ENOMEM;
+                    goto fail;
+                }
+                on_disk_reftable = new_on_disk_reftable;
 
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
+                memset(on_disk_reftable + old_reftable_size, 0,
+                       (reftable_size - old_reftable_size) *
+                       REFTABLE_ENTRY_SIZE);
+
+                /*
+                 * The offset we have for the reftable is now no longer valid;
+                 * this will leak that range, but we can easily fix that by
+                 * running a leak-fixing check after this rebuild operation
+                 */
+                reftable_offset = -1;
+            } else {
+                assert(on_disk_reftable);
             }
+            on_disk_reftable[refblock_index] = refblock_offset;
         }
 
         ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
@@ -2459,15 +2466,12 @@ write_refblocks:
     }
 
     if (reftable_offset < 0) {
-        uint64_t post_refblock_start, reftable_clusters;
+        uint64_t reftable_clusters;
 
-        post_refblock_start = ROUND_UP(*nb_clusters, s->refcount_block_size);
         reftable_clusters =
             size_to_clusters(s, reftable_size * REFTABLE_ENTRY_SIZE);
-        /* Not pretty but simple */
-        if (first_free_cluster < post_refblock_start) {
-            first_free_cluster = post_refblock_start;
-        }
+
+        first_free_cluster = 0;
         reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
                                               refcount_table, nb_clusters,
                                               &first_free_cluster);
@@ -2479,6 +2483,10 @@ write_refblocks:
             goto fail;
         }
 
+        assert(offset_into_cluster(s, reftable_offset) == 0);
+        first_cluster = reftable_offset / s->cluster_size;
+        end_cluster = first_cluster + reftable_clusters;
+
         goto write_refblocks;
     }
 
-- 
2.29.2


