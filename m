Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871540CC87
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:24:52 +0200 (CEST)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZaV-0007xl-8c
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6x-0007RB-S2
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6v-00078B-0o
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dq0zmom0FvUhfkvzz53bwNPvankO7VvUk2WY/lGZZgA=;
 b=Cy7amBpad9XzFvIMQvih4Z/jKCxc6+HjiwbDrQNDXiOMpU7tHe7jSs8uvfdtWQehr72Pb7
 SrTyQ5QZ5hZWsR5KHjRA4y950bAdx4hrxENHjBTlrmcFUk1NqXURyOZ0ABIfJFP9Zrb8L1
 z4CmxuZRDOsmsDoZa5N6ytPJ+ezximk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-aBu1VH21ODezo87jjuUkvA-1; Wed, 15 Sep 2021 13:54:13 -0400
X-MC-Unique: aBu1VH21ODezo87jjuUkvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14CDF1966320;
 Wed, 15 Sep 2021 17:54:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8564F5C1C5;
 Wed, 15 Sep 2021 17:54:11 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/32] qcow2: introduce qcow2_parse_compressed_l2_entry() helper
Date: Wed, 15 Sep 2021 19:53:10 +0200
Message-Id: <20210915175318.853225-25-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add helper to parse compressed l2_entry and use it everywhere instead
of open-coding.

Note, that in most places we move to precise coffset/csize instead of
sector-aligned. Still it should work good enough for updating
refcounts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210914122454.141075-4-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2.h          |  3 ++-
 block/qcow2-cluster.c  | 15 +++++++++++++++
 block/qcow2-refcount.c | 36 +++++++++++++++++-------------------
 block/qcow2.c          |  9 ++-------
 4 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 42a0058ab7..c0e1e83796 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -110,7 +110,6 @@
 
 /* Defined in the qcow2 spec (compressed cluster descriptor) */
 #define QCOW2_COMPRESSED_SECTOR_SIZE 512U
-#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1ULL))
 
 /* Must be at least 2 to cover COW */
 #define MIN_L2_CACHE_SIZE 2 /* cache entries */
@@ -913,6 +912,8 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 3d53657c26..4ebb49a087 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2480,3 +2480,18 @@ fail:
     g_free(l1_table);
     return ret;
 }
+
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int nb_csectors;
+
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    *coffset = l2_entry & s->cluster_offset_mask;
+
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & (QCOW2_COMPRESSED_SECTOR_SIZE - 1));
+}
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2734338625..66cbb94ef9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1177,11 +1177,11 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     switch (ctype) {
     case QCOW2_CLUSTER_COMPRESSED:
         {
-            int64_t offset = (l2_entry & s->cluster_offset_mask)
-                & QCOW2_COMPRESSED_SECTOR_MASK;
-            int size = QCOW2_COMPRESSED_SECTOR_SIZE *
-                (((l2_entry >> s->csize_shift) & s->csize_mask) + 1);
-            qcow2_free_clusters(bs, offset, size, type);
+            uint64_t coffset;
+            int csize;
+
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
+            qcow2_free_clusters(bs, coffset, csize, type);
         }
         break;
     case QCOW2_CLUSTER_NORMAL:
@@ -1247,7 +1247,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     bool l1_allocated = false;
     int64_t old_entry, old_l2_offset;
     unsigned slice, slice_size2, n_slices;
-    int i, j, l1_modified = 0, nb_csectors;
+    int i, j, l1_modified = 0;
     int ret;
 
     assert(addend >= -1 && addend <= 1);
@@ -1318,14 +1318,14 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 
                     switch (qcow2_get_cluster_type(bs, entry)) {
                     case QCOW2_CLUSTER_COMPRESSED:
-                        nb_csectors = ((entry >> s->csize_shift) &
-                                       s->csize_mask) + 1;
                         if (addend != 0) {
-                            uint64_t coffset = (entry & s->cluster_offset_mask)
-                                & QCOW2_COMPRESSED_SECTOR_MASK;
+                            uint64_t coffset;
+                            int csize;
+
+                            qcow2_parse_compressed_l2_entry(bs, entry,
+                                                            &coffset, &csize);
                             ret = update_refcount(
-                                bs, coffset,
-                                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE,
+                                bs, coffset, csize,
                                 abs(addend), addend < 0,
                                 QCOW2_DISCARD_SNAPSHOT);
                             if (ret < 0) {
@@ -1603,7 +1603,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVQcow2State *s = bs->opaque;
     uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, nb_csectors, ret;
+    int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
@@ -1617,6 +1617,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
     /* Do the actual checks */
     for (i = 0; i < s->l2_size; i++) {
+        uint64_t coffset;
+        int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1638,13 +1640,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             }
 
             /* Mark cluster as used */
-            nb_csectors = ((l2_entry >> s->csize_shift) &
-                           s->csize_mask) + 1;
-            l2_entry &= s->cluster_offset_mask;
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
-                bs, res, refcount_table, refcount_table_size,
-                l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
-                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
+                bs, res, refcount_table, refcount_table_size, coffset, csize);
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/qcow2.c b/block/qcow2.c
index e5d8ab679e..02f9f3e636 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4700,17 +4700,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
-
-    coffset = l2_entry & s->cluster_offset_mask;
-    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.31.1


