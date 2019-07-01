Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C385B2E3F3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 19:58:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW2qJ-0005c6-TK
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 13:58:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hW2oL-0004WO-FS
	for qemu-devel@nongnu.org; Wed, 29 May 2019 13:56:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hW2oK-00073L-5b
	for qemu-devel@nongnu.org; Wed, 29 May 2019 13:56:25 -0400
Received: from relay.sw.ru ([185.231.240.75]:48114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hW2oJ-00072M-UA; Wed, 29 May 2019 13:56:24 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hW2oD-0006Rz-Nm; Wed, 29 May 2019 20:56:17 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed, 29 May 2019 20:56:14 +0300
Message-Id: <1559152576-281803-2-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559152576-281803-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1559152576-281803-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 1/3] block: include base when checking image
 chain for block allocation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
	berto@igalia.com, wencongyang2@huawei.com,
	xiechanglong.d@gmail.com, mreitz@redhat.com, stefanha@redhat.com,
	andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is used in the 'block/stream: introduce a bottom node'
that is following. Instead of the base node, the caller may pass
the node that has the base as its backing image to the function
bdrv_is_allocated_above() with a new parameter include_base = true
and get rid of the dependency on the base that may change during
commit/stream parallel jobs. Now, if the specified base is not
found in the backing image chain, the QEMU will abort.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/commit.c        |  2 +-
 block/io.c            | 21 +++++++++++++++------
 block/mirror.c        |  2 +-
 block/replication.c   |  2 +-
 block/stream.c        |  2 +-
 include/block/block.h |  3 ++-
 6 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 14e5bb3..62ca90b 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -176,7 +176,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
             break;
         }
         /* Copy if allocated above the base */
-        ret = bdrv_is_allocated_above(blk_bs(s->top), blk_bs(s->base),
+        ret = bdrv_is_allocated_above(blk_bs(s->top), blk_bs(s->base), false,
                                       offset, COMMIT_BUFFER_SIZE, &n);
         copy = (ret == 1);
         trace_commit_one_iteration(s, offset, n, ret);
diff --git a/block/io.c b/block/io.c
index 3134a60..43cefc3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2287,10 +2287,11 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
 /*
  * Given an image chain: ... -> [BASE] -> [INTER1] -> [INTER2] -> [TOP]
  *
- * Return true if (a prefix of) the given range is allocated in any image
- * between BASE and TOP (inclusive).  BASE can be NULL to check if the given
- * offset is allocated in any image of the chain.  Return false otherwise,
- * or negative errno on failure.
+ * Return 1 if (a prefix of) the given range is allocated in any image
+ * between BASE and TOP (BASE is only included if include_base is set).
+ * BASE can be NULL to check if the given offset is allocated in any
+ * image of the chain.  Return 0 otherwise, or negative errno on
+ * failure.
  *
  * 'pnum' is set to the number of bytes (including and immediately
  * following the specified offset) that are known to be in the same
@@ -2302,17 +2303,21 @@ int coroutine_fn bdrv_is_allocated(BlockDriverState *bs, int64_t offset,
  */
 int bdrv_is_allocated_above(BlockDriverState *top,
                             BlockDriverState *base,
-                            int64_t offset, int64_t bytes, int64_t *pnum)
+                            bool include_base, int64_t offset,
+                            int64_t bytes, int64_t *pnum)
 {
     BlockDriverState *intermediate;
     int ret;
     int64_t n = bytes;
 
+    assert(base || !include_base);
+
     intermediate = top;
-    while (intermediate && intermediate != base) {
+    while (include_base || intermediate != base) {
         int64_t pnum_inter;
         int64_t size_inter;
 
+        assert(intermediate);
         ret = bdrv_is_allocated(intermediate, offset, bytes, &pnum_inter);
         if (ret < 0) {
             return ret;
@@ -2331,6 +2336,10 @@ int bdrv_is_allocated_above(BlockDriverState *top,
             n = pnum_inter;
         }
 
+        if (intermediate == base) {
+            break;
+        }
+
         intermediate = backing_bs(intermediate);
     }
 
diff --git a/block/mirror.c b/block/mirror.c
index ec4bd9f..81c2967 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -807,7 +807,7 @@ static int coroutine_fn mirror_dirty_init(MirrorBlockJob *s)
             return 0;
         }
 
-        ret = bdrv_is_allocated_above(bs, base, offset, bytes, &count);
+        ret = bdrv_is_allocated_above(bs, base, false, offset, bytes, &count);
         if (ret < 0) {
             return ret;
         }
diff --git a/block/replication.c b/block/replication.c
index 3d4dedd..fc8d2ad 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -272,7 +272,7 @@ static coroutine_fn int replication_co_writev(BlockDriverState *bs,
     while (remaining_sectors > 0) {
         int64_t count;
 
-        ret = bdrv_is_allocated_above(top->bs, base->bs,
+        ret = bdrv_is_allocated_above(top->bs, base->bs, false,
                                       sector_num * BDRV_SECTOR_SIZE,
                                       remaining_sectors * BDRV_SECTOR_SIZE,
                                       &count);
diff --git a/block/stream.c b/block/stream.c
index 1a906fd..97fddb2 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -160,7 +160,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         } else if (ret >= 0) {
             /* Copy if allocated in the intermediate images.  Limit to the
              * known-unallocated area [offset, offset+n*BDRV_SECTOR_SIZE).  */
-            ret = bdrv_is_allocated_above(backing_bs(bs), base,
+            ret = bdrv_is_allocated_above(backing_bs(bs), base, false,
                                           offset, n, &n);
 
             /* Finish early if end of backing file has been reached */
diff --git a/include/block/block.h b/include/block/block.h
index 9b083e2..e19b972 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -443,7 +443,8 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
 int bdrv_is_allocated(BlockDriverState *bs, int64_t offset, int64_t bytes,
                       int64_t *pnum);
 int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
-                            int64_t offset, int64_t bytes, int64_t *pnum);
+                            bool include_base, int64_t offset, int64_t bytes,
+                            int64_t *pnum);
 
 bool bdrv_is_read_only(BlockDriverState *bs);
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
-- 
1.8.3.1


