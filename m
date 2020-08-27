Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2382547CE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 16:55:08 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBJIw-0002oJ-Us
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 10:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kBJI7-00020V-3d; Thu, 27 Aug 2020 10:54:15 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:48156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kBJI4-0008DY-2q; Thu, 27 Aug 2020 10:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=CsStH3FMmC5mlj+gkUTkxfQvf6o67kvPhrCOEM9vntE=; 
 b=dySgZDCscgsZZjWx2BKH0G5xW72ALgjBz0HTsD3oe24GHBhDa9soSSJtJUGP6RmzBJyyoays37q6KBRtBvljiE40OJdNexFSgXvk2lR6YWTCoEMIbJI98cY1QzwOUzcXUWgqQJwoPH4TCK+t7hTWd9QLmdiMMtQuP99S2JHq2E5AYIlDE1H+a8/ktWRvCb4Xfm9uSFkV4avh3s0kmJmozs4a+9gyHJnBFN+WKWxwVyzxeXlqGEg0aswGCoP+GxdMve2rocp4uYIK6S3FzoAm/A6qZnQIboKPjfznxUWneufJC4mNFV6n4tt5fr/rja9FjZi/W13NUfcmQ9mtQgxJjA==;
Received: from 92.red-79-158-239.dynamicip.rima-tde.net ([79.158.239.92]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1kBJHx-00023s-Lv; Thu, 27 Aug 2020 16:54:05 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1kBJHj-0006x9-WE; Thu, 27 Aug 2020 16:53:52 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qcow2: Skip copy-on-write when allocating a zero cluster
Date: Thu, 27 Aug 2020 16:53:50 +0200
Message-Id: <20200827145350.26686-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 10:54:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit c8bb23cbdbe32f5c326365e0a82e1b0e68cdcd8a when a write
request results in a new allocation QEMU first tries to see if the
rest of the cluster outside the written area contains only zeroes.

In that case, instead of doing a normal copy-on-write operation and
writing explicit zero buffers to disk, the code zeroes the whole
cluster efficiently using pwrite_zeroes() with BDRV_REQ_NO_FALLBACK.

This improves performance very significantly but it only happens when
we are writing to an area that was completely unallocated before. Zero
clusters (QCOW2_CLUSTER_ZERO_*) are treated like normal clusters and
are therefore slower to allocate.

This happens because the code uses bdrv_is_allocated_above() rather
bdrv_block_status_above(). The former is not as accurate for this
purpose but it is faster. However in the case of qcow2 the underlying
call does already report zero clusters just fine so there is no reason
why we cannot use that information.

After testing 4KB writes on an image that only contains zero clusters
this patch results in almost five times more IOPS.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
v2:
- Add new, simpler API: bdrv_is_unallocated_or_zero_above()

 include/block/block.h |  2 ++
 block/io.c            | 24 ++++++++++++++++++++++++
 block/qcow2.c         | 37 +++++++++++++++++++++----------------
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 6e36154061..477a72b2e9 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -496,6 +496,8 @@ int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
                             bool include_base, int64_t offset, int64_t bytes,
                             int64_t *pnum);
+int bdrv_is_unallocated_or_zero_above(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes);
 
 bool bdrv_is_read_only(BlockDriverState *bs);
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
diff --git a/block/io.c b/block/io.c
index ad3a51ed53..94faa3f9d7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2557,6 +2557,30 @@ int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
                                    offset, bytes, pnum, map, file);
 }
 
+/*
+ * Check @bs (and its backing chain) to see if the range defined
+ * by @offset and @bytes is unallocated or known to read as zeroes.
+ * Return 1 if that is the case, 0 otherwise and -errno on error.
+ * This test is meant to be fast rather than accurate so returning 0
+ * does not guarantee non-zero data.
+ */
+int bdrv_is_unallocated_or_zero_above(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes)
+{
+    int ret;
+    int64_t pnum = bytes;
+
+    ret = bdrv_common_block_status_above(bs, NULL, false, offset,
+                                         bytes, &pnum, NULL, NULL);
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    return (pnum == bytes) &&
+        ((ret & BDRV_BLOCK_ZERO) || (!(ret & BDRV_BLOCK_ALLOCATED)));
+}
+
 int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
                                    int64_t bytes, int64_t *pnum)
 {
diff --git a/block/qcow2.c b/block/qcow2.c
index da56b1a4df..29bea548db 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2391,26 +2391,28 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
     return false;
 }
 
-static bool is_unallocated(BlockDriverState *bs, int64_t offset, int64_t bytes)
-{
-    int64_t nr;
-    return !bytes ||
-        (!bdrv_is_allocated_above(bs, NULL, false, offset, bytes, &nr) &&
-         nr == bytes);
-}
-
-static bool is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
+/*
+ * Return 1 if the COW regions read as zeroes, 0 if not, < 0 on error.
+ * Note that returning 0 does not guarantee non-zero data.
+ */
+static int is_zero_cow(BlockDriverState *bs, QCowL2Meta *m)
 {
     /*
      * This check is designed for optimization shortcut so it must be
      * efficient.
-     * Instead of is_zero(), use is_unallocated() as it is faster (but not
-     * as accurate and can result in false negatives).
+     * Instead of is_zero(), use bdrv_is_unallocated_or_zero_above() as
+     * it is faster (but not as accurate and can result in false negatives).
      */
-    return is_unallocated(bs, m->offset + m->cow_start.offset,
-                          m->cow_start.nb_bytes) &&
-           is_unallocated(bs, m->offset + m->cow_end.offset,
-                          m->cow_end.nb_bytes);
+    int ret;
+
+    ret = bdrv_is_unallocated_or_zero_above(bs, m->offset + m->cow_start.offset,
+                                            m->cow_start.nb_bytes);
+    if (ret <= 0) {
+        return ret;
+    }
+
+    return bdrv_is_unallocated_or_zero_above(bs, m->offset + m->cow_end.offset,
+                                             m->cow_end.nb_bytes);
 }
 
 static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
@@ -2436,7 +2438,10 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
             continue;
         }
 
-        if (!is_zero_cow(bs, m)) {
+        ret = is_zero_cow(bs, m);
+        if (ret < 0) {
+            return ret;
+        } else if (ret == 0) {
             continue;
         }
 
-- 
2.20.1


