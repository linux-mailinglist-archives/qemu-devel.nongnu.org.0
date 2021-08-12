Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7566B3EA0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:44:39 +0200 (CEST)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6KM-00005D-Fu
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hs-0004gk-D3
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hp-0004hO-5u
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gkOTyAa9y1A2m2kyR9anUa1YwnNOJ7rfWB5mmiA2LQ=;
 b=SPwEOU7dlD0tmJf2vM4ODHlRk6R7xY4U6g0+VyAeDOTrxeiXrGXyzfMjYwDDq32iK88+yG
 P2T4fKlPcbVDiqk9Wbd77Rgy02dGklV3cVBiG9I1KtbMFktnO1Co+cT6D+JPIqfIkQt9x+
 TXbq1ire6nlle5BzLJCU3iYNdKGC9Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-n-2KzTz8MaubU4z-qYyEQA-1; Thu, 12 Aug 2021 04:41:55 -0400
X-MC-Unique: n-2KzTz8MaubU4z-qYyEQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BD487D542;
 Thu, 12 Aug 2021 08:41:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7AD4536;
 Thu, 12 Aug 2021 08:41:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 2/6] block: block-status cache for data regions
Date: Thu, 12 Aug 2021 10:41:44 +0200
Message-Id: <20210812084148.14458-3-hreitz@redhat.com>
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we have attempted before
(https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06451.html,
"file-posix: Cache lseek result for data regions";
https://lists.nongnu.org/archive/html/qemu-block/2021-02/msg00934.html,
"file-posix: Cache next hole"), this patch seeks to reduce the number of
SEEK_DATA/HOLE operations the file-posix driver has to perform.  The
main difference is that this time it is implemented as part of the
general block layer code.

The problem we face is that on some filesystems or in some
circumstances, SEEK_DATA/HOLE is unreasonably slow.  Given the
implementation is outside of qemu, there is little we can do about its
performance.

We have already introduced the want_zero parameter to
bdrv_co_block_status() to reduce the number of SEEK_DATA/HOLE calls
unless we really want zero information; but sometimes we do want that
information, because for files that consist largely of zero areas,
special-casing those areas can give large performance boosts.  So the
real problem is with files that consist largely of data, so that
inquiring the block status does not gain us much performance, but where
such an inquiry itself takes a lot of time.

To address this, we want to cache data regions.  Most of the time, when
bad performance is reported, it is in places where the image is iterated
over from start to end (qemu-img convert or the mirror job), so a simple
yet effective solution is to cache only the current data region.

(Note that only caching data regions but not zero regions means that
returning false information from the cache is not catastrophic: Treating
zeroes as data is fine.  While we try to invalidate the cache on zero
writes and discards, such incongruences may still occur when there are
other processes writing to the image.)

We only use the cache for nodes without children (i.e. protocol nodes),
because that is where the problem is: Drivers that rely on block-status
implementations outside of qemu (e.g. SEEK_DATA/HOLE).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/307
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int.h | 50 ++++++++++++++++++++++++
 block.c                   | 80 +++++++++++++++++++++++++++++++++++++++
 block/io.c                | 65 +++++++++++++++++++++++++++++--
 3 files changed, 192 insertions(+), 3 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 12e5750fe8..437d746733 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -34,6 +34,7 @@
 #include "qemu/hbitmap.h"
 #include "block/snapshot.h"
 #include "qemu/throttle.h"
+#include "qemu/rcu.h"
 
 #define BLOCK_FLAG_LAZY_REFCOUNTS   8
 
@@ -839,6 +840,24 @@ struct BdrvChild {
     QLIST_ENTRY(BdrvChild) next_parent;
 };
 
+/*
+ * Allows bdrv_co_block_status() to cache one data region for a
+ * protocol node.
+ *
+ * @valid: Whether the cache is valid (should be accessed with atomic
+ *         functions so this can be reset by RCU readers)
+ * @data_start: Offset where we know (or strongly assume) is data
+ * @data_end: Offset where the data region ends (which is not necessarily
+ *            the start of a zeroed region)
+ */
+typedef struct BdrvBlockStatusCache {
+    struct rcu_head rcu;
+
+    bool valid;
+    int64_t data_start;
+    int64_t data_end;
+} BdrvBlockStatusCache;
+
 struct BlockDriverState {
     /* Protected by big QEMU lock or read-only after opening.  No special
      * locking needed during I/O...
@@ -1004,6 +1023,11 @@ struct BlockDriverState {
 
     /* BdrvChild links to this node may never be frozen */
     bool never_freeze;
+
+    /* Lock for block-status cache RCU writers */
+    CoMutex bsc_modify_lock;
+    /* Always non-NULL, but must only be dereferenced under an RCU read guard */
+    BdrvBlockStatusCache *block_status_cache;
 };
 
 struct BlockBackendRootState {
@@ -1429,4 +1453,30 @@ static inline BlockDriverState *bdrv_primary_bs(BlockDriverState *bs)
  */
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
 
+/**
+ * Check whether the given offset is in the cached block-status data
+ * region.
+ *
+ * If it is, and @pnum is not NULL, *pnum is set to
+ * `bsc.data_end - offset`, i.e. how many bytes, starting from
+ * @offset, are data (according to the cache).
+ * Otherwise, *pnum is not touched.
+ */
+bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum);
+
+/**
+ * If [offset, offset + bytes) overlaps with the currently cached
+ * block-status region, invalidate the cache.
+ *
+ * (To be used by I/O paths that cause data regions to be zero or
+ * holes.)
+ */
+void bdrv_bsc_invalidate_range(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes);
+
+/**
+ * Mark the range [offset, offset + bytes) as a data region.
+ */
+void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes);
+
 #endif /* BLOCK_INT_H */
diff --git a/block.c b/block.c
index e97ce0b1c8..28b00d7239 100644
--- a/block.c
+++ b/block.c
@@ -49,6 +49,8 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
+#include "qemu/range.h"
+#include "qemu/rcu.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -401,6 +403,9 @@ BlockDriverState *bdrv_new(void)
 
     qemu_co_queue_init(&bs->flush_queue);
 
+    qemu_co_mutex_init(&bs->bsc_modify_lock);
+    bs->block_status_cache = g_new0(BdrvBlockStatusCache, 1);
+
     for (i = 0; i < bdrv_drain_all_count; i++) {
         bdrv_drained_begin(bs);
     }
@@ -4694,6 +4699,8 @@ static void bdrv_close(BlockDriverState *bs)
     bs->explicit_options = NULL;
     qobject_unref(bs->full_open_options);
     bs->full_open_options = NULL;
+    g_free(bs->block_status_cache);
+    bs->block_status_cache = NULL;
 
     bdrv_release_named_dirty_bitmaps(bs);
     assert(QLIST_EMPTY(&bs->dirty_bitmaps));
@@ -7653,3 +7660,76 @@ BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
 {
     return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
 }
+
+/**
+ * Check whether [offset, offset + bytes) overlaps with the cached
+ * block-status data region.
+ *
+ * If so, and @pnum is not NULL, set *pnum to `bsc.data_end - offset`,
+ * which is what bdrv_bsc_is_data()'s interface needs.
+ * Otherwise, *pnum is not touched.
+ */
+static bool bdrv_bsc_range_overlaps_locked(BlockDriverState *bs,
+                                           int64_t offset, int64_t bytes,
+                                           int64_t *pnum)
+{
+    BdrvBlockStatusCache *bsc = qatomic_rcu_read(&bs->block_status_cache);
+    bool overlaps;
+
+    overlaps =
+        qatomic_read(&bsc->valid) &&
+        ranges_overlap(offset, bytes, bsc->data_start,
+                       bsc->data_end - bsc->data_start);
+
+    if (overlaps && pnum) {
+        *pnum = bsc->data_end - offset;
+    }
+
+    return overlaps;
+}
+
+/**
+ * See block_int.h for this function's documentation.
+ */
+bool bdrv_bsc_is_data(BlockDriverState *bs, int64_t offset, int64_t *pnum)
+{
+    RCU_READ_LOCK_GUARD();
+
+    return bdrv_bsc_range_overlaps_locked(bs, offset, 1, pnum);
+}
+
+/**
+ * See block_int.h for this function's documentation.
+ */
+void bdrv_bsc_invalidate_range(BlockDriverState *bs,
+                               int64_t offset, int64_t bytes)
+{
+    RCU_READ_LOCK_GUARD();
+
+    if (bdrv_bsc_range_overlaps_locked(bs, offset, bytes, NULL)) {
+        qatomic_set(&bs->block_status_cache->valid, false);
+    }
+}
+
+/**
+ * See block_int.h for this function's documentation.
+ */
+void bdrv_bsc_fill(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BdrvBlockStatusCache *new_bsc = g_new(BdrvBlockStatusCache, 1);
+    BdrvBlockStatusCache *old_bsc;
+
+    *new_bsc = (BdrvBlockStatusCache) {
+        .valid = true,
+        .data_start = offset,
+        .data_end = offset + bytes,
+    };
+
+    QEMU_LOCK_GUARD(&bs->bsc_modify_lock);
+
+    old_bsc = qatomic_rcu_read(&bs->block_status_cache);
+    qatomic_rcu_set(&bs->block_status_cache, new_bsc);
+    if (old_bsc) {
+        g_free_rcu(old_bsc, rcu);
+    }
+}
diff --git a/block/io.c b/block/io.c
index a19942718b..e62cdbda99 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1883,6 +1883,9 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
         return -ENOTSUP;
     }
 
+    /* Invalidate the cached block-status data range if this write overlaps */
+    bdrv_bsc_invalidate_range(bs, offset, bytes);
+
     assert(alignment % bs->bl.request_alignment == 0);
     head = offset % alignment;
     tail = (offset + bytes) % alignment;
@@ -2447,9 +2450,62 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
     aligned_bytes = ROUND_UP(offset + bytes, align) - aligned_offset;
 
     if (bs->drv->bdrv_co_block_status) {
-        ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
-                                            aligned_bytes, pnum, &local_map,
-                                            &local_file);
+        /*
+         * Use the block-status cache only for protocol nodes: Format
+         * drivers are generally quick to inquire the status, but protocol
+         * drivers often need to get information from outside of qemu, so
+         * we do not have control over the actual implementation.  There
+         * have been cases where inquiring the status took an unreasonably
+         * long time, and we can do nothing in qemu to fix it.
+         * This is especially problematic for images with large data areas,
+         * because finding the few holes in them and giving them special
+         * treatment does not gain much performance.  Therefore, we try to
+         * cache the last-identified data region.
+         *
+         * Second, limiting ourselves to protocol nodes allows us to assume
+         * the block status for data regions to be DATA | OFFSET_VALID, and
+         * that the host offset is the same as the guest offset.
+         *
+         * Note that it is possible that external writers zero parts of
+         * the cached regions without the cache being invalidated, and so
+         * we may report zeroes as data.  This is not catastrophic,
+         * however, because reporting zeroes as data is fine.
+         */
+        if (QLIST_EMPTY(&bs->children) &&
+            bdrv_bsc_is_data(bs, aligned_offset, pnum))
+        {
+            ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
+            local_file = bs;
+            local_map = aligned_offset;
+        } else {
+            ret = bs->drv->bdrv_co_block_status(bs, want_zero, aligned_offset,
+                                                aligned_bytes, pnum, &local_map,
+                                                &local_file);
+
+            /*
+             * Note that checking QLIST_EMPTY(&bs->children) is also done when
+             * the cache is queried above.  Technically, we do not need to check
+             * it here; the worst that can happen is that we fill the cache for
+             * non-protocol nodes, and then it is never used.  However, filling
+             * the cache requires an RCU update, so double check here to avoid
+             * such an update if possible.
+             */
+            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
+                QLIST_EMPTY(&bs->children))
+            {
+                /*
+                 * When a protocol driver reports BLOCK_OFFSET_VALID, the
+                 * returned local_map value must be the same as the offset we
+                 * have passed (aligned_offset).
+                 * Assert this, because we follow this rule when reading from
+                 * the cache (see the `local_map = aligned_offset` assignment
+                 * above), and the result the cache delivers must be the same
+                 * as the driver would deliver.
+                 */
+                assert(local_map == aligned_offset);
+                bdrv_bsc_fill(bs, aligned_offset, *pnum);
+            }
+        }
     } else {
         /* Default code for filters */
 
@@ -3002,6 +3058,9 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         return 0;
     }
 
+    /* Invalidate the cached block-status data range if this discard overlaps */
+    bdrv_bsc_invalidate_range(bs, offset, bytes);
+
     /* Discard is advisory, but some devices track and coalesce
      * unaligned requests, so we must pass everything down rather than
      * round here.  Still, most devices will just silently ignore
-- 
2.31.1


