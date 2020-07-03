Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46C213D4F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:09:43 +0200 (CEST)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOFy-0005E8-9n
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5p-0003Zz-PI; Fri, 03 Jul 2020 11:59:13 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5l-0007Ru-2W; Fri, 03 Jul 2020 11:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=h1tUALmvXwwcN+G6WSnuDER4EwjjJOc+FCTEjklmrao=; 
 b=nqnZBzlSwZDkWtO3A/WQFv6opJEibirwJ9Dh1qVC0RDkrBq8D7JGTA19jjnyFvx3KNkboYhEupPihGs/hlBkScBMxzVU51SDBbCbf4c3yXnxfdv0GsQsMgBY4xV223T+7vyxqRwlBBX8GLdeZpLX1tNzuWZDZu+cVkEuKvBbBMFoGET95MNax+gANEz6TnfqbGwMfFgo00RhM6wmnZft0qI1Oa4wdRcoloFbWBM1Wd4IZEMM8FkFLwMUgRdkU93OuGfkawn2RbFdSwpulh9uH/gZMHyKjWEpkfXf8ulKctVgJ0RHJ5GTkQh19YBCqmw3Ky1P9r9qzXPw4YxzOxWs9A==;
Received: from [81.0.49.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jrO5L-0001QY-KV; Fri, 03 Jul 2020 17:58:43 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jrO52-0007Pw-1t; Fri, 03 Jul 2020 17:58:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 17/34] qcow2: Add cluster type parameter to
 qcow2_get_host_offset()
Date: Fri,  3 Jul 2020 17:58:03 +0200
Message-Id: <f8b4134a9d42cbe87d82e41d47aed981e06148a2.1593791819.git.berto@igalia.com>
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

This function returns an integer that can be either an error code or a
cluster type (a value from the QCow2ClusterType enum).

We are going to start using subcluster types instead of cluster types
in some functions so it's better to use the exact data types instead
of integers for clarity and in order to detect errors more easily.

This patch makes qcow2_get_host_offset() return 0 on success and
puts the returned cluster type in a separate parameter. There are no
semantic changes.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h         |  3 ++-
 block/qcow2-cluster.c | 11 +++++++----
 block/qcow2.c         | 37 ++++++++++++++++++++++---------------
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index ea647c8bb5..74f65793bd 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -893,7 +893,8 @@ int qcow2_encrypt_sectors(BDRVQcow2State *s, int64_t sector_num,
                           uint8_t *buf, int nb_sectors, bool enc, Error **errp);
 
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
-                          unsigned int *bytes, uint64_t *host_offset);
+                          unsigned int *bytes, uint64_t *host_offset,
+                          QCow2ClusterType *cluster_type);
 int qcow2_alloc_cluster_offset(BlockDriverState *bs, uint64_t offset,
                                unsigned int *bytes, uint64_t *host_offset,
                                QCowL2Meta **m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 751906c330..8e1e928852 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -565,13 +565,14 @@ static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
  *
  * On exit, *bytes is the number of bytes starting at offset that have the same
  * cluster type and (if applicable) are stored contiguously in the image file.
+ * The cluster type is stored in *cluster_type.
  * Compressed clusters are always returned one by one.
  *
- * Returns the cluster type (QCOW2_CLUSTER_*) on success, -errno in error
- * cases.
+ * Returns 0 on success, -errno in error cases.
  */
 int qcow2_get_host_offset(BlockDriverState *bs, uint64_t offset,
-                          unsigned int *bytes, uint64_t *host_offset)
+                          unsigned int *bytes, uint64_t *host_offset,
+                          QCow2ClusterType *cluster_type)
 {
     BDRVQcow2State *s = bs->opaque;
     unsigned int l2_index;
@@ -713,7 +714,9 @@ out:
     assert(bytes_available - offset_in_cluster <= UINT_MAX);
     *bytes = bytes_available - offset_in_cluster;
 
-    return type;
+    *cluster_type = type;
+
+    return 0;
 
 fail:
     qcow2_cache_put(s->l2_table_cache, (void **)&l2_slice);
diff --git a/block/qcow2.c b/block/qcow2.c
index 7df55a88a8..89e17bdaba 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2033,6 +2033,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     uint64_t host_offset;
     unsigned int bytes;
+    QCow2ClusterType type;
     int ret, status = 0;
 
     qemu_co_mutex_lock(&s->lock);
@@ -2044,7 +2045,7 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
     }
 
     bytes = MIN(INT_MAX, count);
-    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset);
+    ret = qcow2_get_host_offset(bs, offset, &bytes, &host_offset, &type);
     qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
         return ret;
@@ -2052,15 +2053,15 @@ static int coroutine_fn qcow2_co_block_status(BlockDriverState *bs,
 
     *pnum = bytes;
 
-    if ((ret == QCOW2_CLUSTER_NORMAL || ret == QCOW2_CLUSTER_ZERO_ALLOC) &&
+    if ((type == QCOW2_CLUSTER_NORMAL || type == QCOW2_CLUSTER_ZERO_ALLOC) &&
         !s->crypto) {
         *map = host_offset;
         *file = s->data_file->bs;
         status |= BDRV_BLOCK_OFFSET_VALID;
     }
-    if (ret == QCOW2_CLUSTER_ZERO_PLAIN || ret == QCOW2_CLUSTER_ZERO_ALLOC) {
+    if (type == QCOW2_CLUSTER_ZERO_PLAIN || type == QCOW2_CLUSTER_ZERO_ALLOC) {
         status |= BDRV_BLOCK_ZERO;
-    } else if (ret != QCOW2_CLUSTER_UNALLOCATED) {
+    } else if (type != QCOW2_CLUSTER_UNALLOCATED) {
         status |= BDRV_BLOCK_DATA;
     }
     if (s->metadata_preallocation && (status & BDRV_BLOCK_DATA) &&
@@ -2269,6 +2270,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
     int ret = 0;
     unsigned int cur_bytes; /* number of bytes in current iteration */
     uint64_t host_offset = 0;
+    QCow2ClusterType type;
     AioTaskPool *aio = NULL;
 
     while (bytes != 0 && aio_task_pool_status(aio) == 0) {
@@ -2280,22 +2282,23 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         }
 
         qemu_co_mutex_lock(&s->lock);
-        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset);
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes,
+                                    &host_offset, &type);
         qemu_co_mutex_unlock(&s->lock);
         if (ret < 0) {
             goto out;
         }
 
-        if (ret == QCOW2_CLUSTER_ZERO_PLAIN ||
-            ret == QCOW2_CLUSTER_ZERO_ALLOC ||
-            (ret == QCOW2_CLUSTER_UNALLOCATED && !bs->backing))
+        if (type == QCOW2_CLUSTER_ZERO_PLAIN ||
+            type == QCOW2_CLUSTER_ZERO_ALLOC ||
+            (type == QCOW2_CLUSTER_UNALLOCATED && !bs->backing))
         {
             qemu_iovec_memset(qiov, qiov_offset, 0, cur_bytes);
         } else {
             if (!aio && cur_bytes != bytes) {
                 aio = aio_task_pool_new(QCOW2_MAX_WORKERS);
             }
-            ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, ret,
+            ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, type,
                                  host_offset, offset, cur_bytes,
                                  qiov, qiov_offset, NULL);
             if (ret < 0) {
@@ -3841,6 +3844,7 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
     if (head || tail) {
         uint64_t off;
         unsigned int nr;
+        QCow2ClusterType type;
 
         assert(head + bytes <= s->cluster_size);
 
@@ -3856,10 +3860,11 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
         bytes = s->cluster_size;
         nr = s->cluster_size;
-        ret = qcow2_get_host_offset(bs, offset, &nr, &off);
-        if (ret != QCOW2_CLUSTER_UNALLOCATED &&
-            ret != QCOW2_CLUSTER_ZERO_PLAIN &&
-            ret != QCOW2_CLUSTER_ZERO_ALLOC) {
+        ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
+        if (ret < 0 ||
+            (type != QCOW2_CLUSTER_UNALLOCATED &&
+             type != QCOW2_CLUSTER_ZERO_PLAIN &&
+             type != QCOW2_CLUSTER_ZERO_ALLOC)) {
             qemu_co_mutex_unlock(&s->lock);
             return -ENOTSUP;
         }
@@ -3923,16 +3928,18 @@ qcow2_co_copy_range_from(BlockDriverState *bs,
 
     while (bytes != 0) {
         uint64_t copy_offset = 0;
+        QCow2ClusterType type;
         /* prepare next request */
         cur_bytes = MIN(bytes, INT_MAX);
         cur_write_flags = write_flags;
 
-        ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes, &copy_offset);
+        ret = qcow2_get_host_offset(bs, src_offset, &cur_bytes,
+                                    &copy_offset, &type);
         if (ret < 0) {
             goto out;
         }
 
-        switch (ret) {
+        switch (type) {
         case QCOW2_CLUSTER_UNALLOCATED:
             if (bs->backing && bs->backing->bs) {
                 int64_t backing_length = bdrv_getlength(bs->backing->bs);
-- 
2.20.1


