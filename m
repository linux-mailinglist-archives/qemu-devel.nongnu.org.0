Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FFF21BACD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 18:25:08 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtvpj-0005sJ-Cv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 12:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtvfQ-0003Bb-VQ; Fri, 10 Jul 2020 12:14:29 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:43817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtvfJ-0004w3-BI; Fri, 10 Jul 2020 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=Bay4CRj8PVmv/ZOWpL/sl2sQau3pb5+Wj664PQg8x+I=; 
 b=QOE1xpvzvJKhsuK2+g7HZbsUxmZ1J5nYuzjk7+9k97xjyW/pX3uLqTw/TxipExEoY1MzOm+w+ZyeIJC9CBvH54lmCnSxJa+tS2+cmCl8rmPkehGjbkVxaOCg06UtiRnOFx0ATEsHDCHtWQ4afuzLWSdcdDODh4frdbm3J8513yaBVsRNjMQt38XIcGf764xXK6m+84LDuYbXGT7HT0A2kckH9bn/OXgPVEWsr71uT6z1xqN7IRlUzjgxz94ecr7rzwPPvXPDZv3Ew6INxju9lr7XE5u/GUQc5xd75c4KCNhB66cx7V5MNstbD7Qj15cgoR/RrumLcz5Z6cu4MLh+KQ==;
Received: from [81.0.43.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jtvea-0003k4-Ms; Fri, 10 Jul 2020 18:13:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jtveL-0001RN-HL; Fri, 10 Jul 2020 18:13:21 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 28/34] qcow2: Add subcluster support to
 qcow2_co_pwrite_zeroes()
Date: Fri, 10 Jul 2020 18:13:10 +0200
Message-Id: <17e05e2ee7e12f10dcf012da81e83ebe27eb3bef.1594396418.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1594396418.git.berto@igalia.com>
References: <cover.1594396418.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 12:13:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

This works now at the subcluster level and pwrite_zeroes_alignment is
updated accordingly.

qcow2_cluster_zeroize() is turned into qcow2_subcluster_zeroize() with
the following changes:

   - The request can now be subcluster-aligned.

   - The cluster-aligned body of the request is still zeroized using
     zero_in_l2_slice() as before.

   - The subcluster-aligned head and tail of the request are zeroized
     with the new zero_l2_subclusters() function.

There is just one thing to take into account for a possible future
improvement: compressed clusters cannot be partially zeroized so
zero_l2_subclusters() on the head or the tail can return -ENOTSUP.
This makes the caller repeat the *complete* request and write actual
zeroes to disk. This is sub-optimal because

   1) if the head area was compressed we would still be able to use
      the fast path for the body and possibly the tail.

   2) if the tail area was compressed we are writing zeroes to the
      head and the body areas, which are already zeroized.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h         |  4 +--
 block/qcow2-cluster.c | 81 +++++++++++++++++++++++++++++++++++++++----
 block/qcow2.c         | 33 +++++++++---------
 3 files changed, 94 insertions(+), 24 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 4fad40b96b..4ef4ae4ab0 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -898,8 +898,8 @@ void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
 int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
                           uint64_t bytes, enum qcow2_discard_type type,
                           bool full_discard);
-int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                          uint64_t bytes, int flags);
+int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                             uint64_t bytes, int flags);
 
 int qcow2_expand_zero_clusters(BlockDriverState *bs,
                                BlockDriverAmendStatusCB *status_cb,
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 6b5d0698d0..e023bc4b01 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2016,12 +2016,59 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     return nb_clusters;
 }
 
-int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
-                          uint64_t bytes, int flags)
+static int zero_l2_subclusters(BlockDriverState *bs, uint64_t offset,
+                               unsigned nb_subclusters)
+{
+    BDRVQcow2State *s = bs->opaque;
+    uint64_t *l2_slice;
+    uint64_t old_l2_bitmap, l2_bitmap;
+    int l2_index, ret, sc = offset_to_sc_index(s, offset);
+
+    /* For full clusters use zero_in_l2_slice() instead */
+    assert(nb_subclusters > 0 && nb_subclusters < s->subclusters_per_cluster);
+    assert(sc + nb_subclusters <= s->subclusters_per_cluster);
+    assert(offset_into_subcluster(s, offset) == 0);
+
+    ret = get_cluster_table(bs, offset, &l2_slice, &l2_index);
+    if (ret < 0) {
+        return ret;
+    }
+
+    switch (qcow2_get_cluster_type(bs, get_l2_entry(s, l2_slice, l2_index))) {
+    case QCOW2_CLUSTER_COMPRESSED:
+        ret = -ENOTSUP; /* We cannot partially zeroize compressed clusters */
+        goto out;
+    case QCOW2_CLUSTER_NORMAL:
+    case QCOW2_CLUSTER_UNALLOCATED:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    old_l2_bitmap = l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index);
+
+    l2_bitmap |=  QCOW_OFLAG_SUB_ZERO_RANGE(sc, sc + nb_subclusters);
+    l2_bitmap &= ~QCOW_OFLAG_SUB_ALLOC_RANGE(sc, sc + nb_subclusters);
+
+    if (old_l2_bitmap != l2_bitmap) {
+        set_l2_bitmap(s, l2_slice, l2_index, l2_bitmap);
+        qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
+    }
+
+    ret = 0;
+out:
+    qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
+
+    return ret;
+}
+
+int qcow2_subcluster_zeroize(BlockDriverState *bs, uint64_t offset,
+                             uint64_t bytes, int flags)
 {
     BDRVQcow2State *s = bs->opaque;
     uint64_t end_offset = offset + bytes;
     uint64_t nb_clusters;
+    unsigned head, tail;
     int64_t cleared;
     int ret;
 
@@ -2036,8 +2083,8 @@ int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
     }
 
     /* Caller must pass aligned values, except at image end */
-    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
-    assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
+    assert(offset_into_subcluster(s, offset) == 0);
+    assert(offset_into_subcluster(s, end_offset) == 0 ||
            end_offset >= bs->total_sectors << BDRV_SECTOR_BITS);
 
     /* The zero flag is only supported by version 3 and newer */
@@ -2045,11 +2092,26 @@ int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
         return -ENOTSUP;
     }
 
-    /* Each L2 slice is handled by its own loop iteration */
-    nb_clusters = size_to_clusters(s, bytes);
+    head = MIN(end_offset, ROUND_UP(offset, s->cluster_size)) - offset;
+    offset += head;
+
+    tail = (end_offset >= bs->total_sectors << BDRV_SECTOR_BITS) ? 0 :
+        end_offset - MAX(offset, start_of_cluster(s, end_offset));
+    end_offset -= tail;
 
     s->cache_discards = true;
 
+    if (head) {
+        ret = zero_l2_subclusters(bs, offset - head,
+                                  size_to_subclusters(s, head));
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
+    /* Each L2 slice is handled by its own loop iteration */
+    nb_clusters = size_to_clusters(s, end_offset - offset);
+
     while (nb_clusters > 0) {
         cleared = zero_in_l2_slice(bs, offset, nb_clusters, flags);
         if (cleared < 0) {
@@ -2061,6 +2123,13 @@ int qcow2_cluster_zeroize(BlockDriverState *bs, uint64_t offset,
         offset += (cleared * s->cluster_size);
     }
 
+    if (tail) {
+        ret = zero_l2_subclusters(bs, end_offset, size_to_subclusters(s, tail));
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
     ret = 0;
 fail:
     s->cache_discards = false;
diff --git a/block/qcow2.c b/block/qcow2.c
index b58c421c28..358e60a261 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1913,7 +1913,7 @@ static void qcow2_refresh_limits(BlockDriverState *bs, Error **errp)
         /* Encryption works on a sector granularity */
         bs->bl.request_alignment = qcrypto_block_get_sector_size(s->crypto);
     }
-    bs->bl.pwrite_zeroes_alignment = s->cluster_size;
+    bs->bl.pwrite_zeroes_alignment = s->subcluster_size;
     bs->bl.pdiscard_alignment = s->cluster_size;
 }
 
@@ -3833,8 +3833,9 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
     int ret;
     BDRVQcow2State *s = bs->opaque;
 
-    uint32_t head = offset % s->cluster_size;
-    uint32_t tail = (offset + bytes) % s->cluster_size;
+    uint32_t head = offset_into_subcluster(s, offset);
+    uint32_t tail = ROUND_UP(offset + bytes, s->subcluster_size) -
+        (offset + bytes);
 
     trace_qcow2_pwrite_zeroes_start_req(qemu_coroutine_self(), offset, bytes);
     if (offset + bytes == bs->total_sectors * BDRV_SECTOR_SIZE) {
@@ -3846,20 +3847,19 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
         unsigned int nr;
         QCow2SubclusterType type;
 
-        assert(head + bytes <= s->cluster_size);
+        assert(head + bytes + tail <= s->subcluster_size);
 
         /* check whether remainder of cluster already reads as zero */
         if (!(is_zero(bs, offset - head, head) &&
-              is_zero(bs, offset + bytes,
-                      tail ? s->cluster_size - tail : 0))) {
+              is_zero(bs, offset + bytes, tail))) {
             return -ENOTSUP;
         }
 
         qemu_co_mutex_lock(&s->lock);
         /* We can have new write after previous check */
-        offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
-        bytes = s->cluster_size;
-        nr = s->cluster_size;
+        offset -= head;
+        bytes = s->subcluster_size;
+        nr = s->subcluster_size;
         ret = qcow2_get_host_offset(bs, offset, &nr, &off, &type);
         if (ret < 0 ||
             (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
@@ -3875,8 +3875,8 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
 
     trace_qcow2_pwrite_zeroes(qemu_coroutine_self(), offset, bytes);
 
-    /* Whatever is left can use real zero clusters */
-    ret = qcow2_cluster_zeroize(bs, offset, bytes, flags);
+    /* Whatever is left can use real zero subclusters */
+    ret = qcow2_subcluster_zeroize(bs, offset, bytes, flags);
     qemu_co_mutex_unlock(&s->lock);
 
     return ret;
@@ -4357,15 +4357,16 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
     }
 
     if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
-        uint64_t zero_start = QEMU_ALIGN_UP(old_length, s->cluster_size);
+        uint64_t zero_start = QEMU_ALIGN_UP(old_length, s->subcluster_size);
 
         /*
-         * Use zero clusters as much as we can. qcow2_cluster_zeroize()
-         * requires a cluster-aligned start. The end may be unaligned if it is
-         * at the end of the image (which it is here).
+         * Use zero clusters as much as we can. qcow2_subcluster_zeroize()
+         * requires a subcluster-aligned start. The end may be unaligned if
+         * it is at the end of the image (which it is here).
          */
         if (offset > zero_start) {
-            ret = qcow2_cluster_zeroize(bs, zero_start, offset - zero_start, 0);
+            ret = qcow2_subcluster_zeroize(bs, zero_start, offset - zero_start,
+                                           0);
             if (ret < 0) {
                 error_setg_errno(errp, -ret, "Failed to zero out new clusters");
                 goto fail;
-- 
2.20.1


