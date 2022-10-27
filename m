Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E0561011D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:06:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7ii-00079l-Nw; Thu, 27 Oct 2022 14:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gf-00021Z-Hk
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gd-0002d7-9R
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OmiuYXeJCqhQVsmkndp3Yohrnn1wvuzWvpn0y6LrsY=;
 b=P+JjnSrR8oCmWCvMRDCPbQIyjbXarZTfLrwFSyz3PzqLJ7mJzmCJpPP+/B6vgZ3In4rGgq
 AlOyXPCJl3zlm1xjJV0O+6MM/kIQV3PVqBnOeMfXmuCB7BWUWsAa6VhFZeyDH/Ix6uItVN
 4lN6X9T+uC5+hD3gleG3NQWGdF9xKh4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-itkYPzyqP9658iBhmbBRmQ-1; Thu, 27 Oct 2022 14:32:55 -0400
X-MC-Unique: itkYPzyqP9658iBhmbBRmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67562800B23;
 Thu, 27 Oct 2022 18:32:55 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A713E1121320;
 Thu, 27 Oct 2022 18:32:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 45/58] qcow2: manually add more coroutine_fn annotations
Date: Thu, 27 Oct 2022 20:31:33 +0200
Message-Id: <20221027183146.463129-46-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

The validity of these was double-checked with Alberto Faria's static
analyzer.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221013123711.620631-13-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.h          | 18 +++++++++---------
 block/qcow2-bitmap.c   |  4 ++--
 block/qcow2-cluster.c  | 21 ++++++++++++---------
 block/qcow2-refcount.c |  8 ++++----
 4 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index ad6e7f65bd..2285f18a73 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -846,7 +846,7 @@ int qcow2_validate_table(BlockDriverState *bs, uint64_t offset,
                          Error **errp);
 
 /* qcow2-refcount.c functions */
-int qcow2_refcount_init(BlockDriverState *bs);
+int coroutine_fn qcow2_refcount_init(BlockDriverState *bs);
 void qcow2_refcount_close(BlockDriverState *bs);
 
 int qcow2_get_refcount(BlockDriverState *bs, int64_t cluster_index,
@@ -893,14 +893,14 @@ int qcow2_inc_refcounts_imrt(BlockDriverState *bs, BdrvCheckResult *res,
 int qcow2_change_refcount_order(BlockDriverState *bs, int refcount_order,
                                 BlockDriverAmendStatusCB *status_cb,
                                 void *cb_opaque, Error **errp);
-int qcow2_shrink_reftable(BlockDriverState *bs);
+int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs);
 int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
 int coroutine_fn qcow2_detect_metadata_preallocation(BlockDriverState *bs);
 
 /* qcow2-cluster.c functions */
 int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
                         bool exact_size);
-int qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
+int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t max_size);
 int qcow2_write_l1_entry(BlockDriverState *bs, int l1_index);
 int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *buf, int nb_sectors, bool enc, Error **errp);
@@ -911,10 +911,10 @@ int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
 int coroutine_fn qcow2_alloc_host_offset(BlockDriverState *bs, uint64_t offset,
                                          unsigned int *bytes,
                                          uint64_t *host_offset, QCowL2Meta **m);
-int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
-                                          uint64_t offset,
-                                          int compressed_size,
-                                          uint64_t *host_offset);
+int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
+                                                       uint64_t offset,
+                                                       int compressed_size,
+                                                       uint64_t *host_offset);
 void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
                                      uint64_t *coffset, int *csize);
 
@@ -982,8 +982,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
-                              Error **errp);
+bool coroutine_fn qcow2_load_dirty_bitmaps(BlockDriverState *bs,
+                                           bool *header_updated, Error **errp);
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 7197754843..bcad567c0c 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -955,8 +955,8 @@ static void set_readonly_helper(gpointer bitmap, gpointer value)
  * If header_updated is not NULL then it is set appropriately regardless of
  * the return value.
  */
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
-                              Error **errp)
+bool coroutine_fn qcow2_load_dirty_bitmaps(BlockDriverState *bs,
+                                           bool *header_updated, Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 0f293950a1..097f6484ed 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -31,7 +31,8 @@
 #include "qemu/memalign.h"
 #include "trace.h"
 
-int qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t exact_size)
+int coroutine_fn qcow2_shrink_l1_table(BlockDriverState *bs,
+                                       uint64_t exact_size)
 {
     BDRVQcow2State *s = bs->opaque;
     int new_l1_size, i, ret;
@@ -823,10 +824,10 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
  *
  * Return 0 on success and -errno in error cases
  */
-int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
-                                          uint64_t offset,
-                                          int compressed_size,
-                                          uint64_t *host_offset)
+int coroutine_fn qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
+                                                       uint64_t offset,
+                                                       int compressed_size,
+                                                       uint64_t *host_offset)
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index, ret;
@@ -1488,8 +1489,9 @@ static int coroutine_fn handle_dependencies(BlockDriverState *bs,
  *
  *  -errno: in error cases
  */
-static int handle_copied(BlockDriverState *bs, uint64_t guest_offset,
-    uint64_t *host_offset, uint64_t *bytes, QCowL2Meta **m)
+static int coroutine_fn handle_copied(BlockDriverState *bs,
+    uint64_t guest_offset, uint64_t *host_offset, uint64_t *bytes,
+    QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index;
@@ -1653,8 +1655,9 @@ static int do_alloc_cluster_offset(BlockDriverState *bs, uint64_t guest_offset,
  *
  *  -errno: in error cases
  */
-static int handle_alloc(BlockDriverState *bs, uint64_t guest_offset,
-    uint64_t *host_offset, uint64_t *bytes, QCowL2Meta **m)
+static int coroutine_fn handle_alloc(BlockDriverState *bs,
+    uint64_t guest_offset, uint64_t *host_offset, uint64_t *bytes,
+    QCowL2Meta **m)
 {
     BDRVQcow2State *s = bs->opaque;
     int l2_index;
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 1fbb07ca77..40e3870887 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -97,7 +97,7 @@ static void update_max_refcount_table_index(BDRVQcow2State *s)
     s->max_refcount_table_index = i;
 }
 
-int qcow2_refcount_init(BlockDriverState *bs)
+int coroutine_fn qcow2_refcount_init(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int refcount_table_size2, i;
@@ -3559,8 +3559,8 @@ static int64_t get_refblock_offset(BlockDriverState *bs, uint64_t offset)
     return covering_refblock_offset;
 }
 
-static int qcow2_discard_refcount_block(BlockDriverState *bs,
-                                        uint64_t discard_block_offs)
+static int coroutine_fn
+qcow2_discard_refcount_block(BlockDriverState *bs, uint64_t discard_block_offs)
 {
     BDRVQcow2State *s = bs->opaque;
     int64_t refblock_offs;
@@ -3616,7 +3616,7 @@ static int qcow2_discard_refcount_block(BlockDriverState *bs,
     return 0;
 }
 
-int qcow2_shrink_reftable(BlockDriverState *bs)
+int coroutine_fn qcow2_shrink_reftable(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t *reftable_tmp =
-- 
2.37.3


