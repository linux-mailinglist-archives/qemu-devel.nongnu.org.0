Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE716FC243
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:03:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJFf-0004Uz-55; Tue, 09 May 2023 05:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pwJFQ-0004U7-Jq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:03:06 -0400
Received: from apollo.dupie.be ([51.159.20.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-louis@dupond.be>)
 id 1pwJFM-0004Pq-SW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:03:04 -0400
Received: from localhost.localdomain (unknown
 [IPv6:2a02:a03f:eaf7:ff01:cc6b:6666:e19c:b63f])
 by apollo.dupie.be (Postfix) with ESMTPSA id 81E6F1520F2A;
 Tue,  9 May 2023 11:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dupond.be; s=dkim;
 t=1683622968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WtZb69mxwSa8BlGfLRI7VTe099DLLJjqZsVUTYse9s8=;
 b=eMgIlfoEzBJG6kYlQHk6gUVGF+KeKjwhD0YxmUaaFJTw7WYMOB5GFhsyxiRLqNenvP6a5V
 cBshBc3QP8MhNWZ0VYNHs95R2H+UL2PRDGs1NsGLzWmJc5pMFGHl7esKu8Bs9mQHvnbC5I
 ICTMfs0fPKggc0dT8sOfqHtu4f6CJGXg7eLywmDBvgsr398XxSHx5FuRvut4MFjOKa5PZH
 JpUFu435YAZAHIPssEHlhTY7P5NEgYtBFGqcfcpq69op6SOWGauR4bB0Ug1dMdbpPKyHGJ
 +20BTlzp6wFj/NhiNocRTvkYh8jsjQ0YXic71GkFxyapUHjDv+Dem4gP9+ikxg==
From: Jean-Louis Dupond <jean-louis@dupond.be>
To: qemu-devel@nongnu.org
Cc: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: [RFC PATCH] QCOW2: Add zeroes discard option
Date: Tue,  9 May 2023 11:01:19 +0200
Message-Id: <20230509090118.358857-1-jean-louis@dupond.be>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=51.159.20.238; envelope-from=jean-louis@dupond.be;
 helo=apollo.dupie.be
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we have a sparse qcow2 image and discard: unmap is enabled, there
is a lot of fragmentation in the image after some time. Surely on VM's
that do a lot of writes/deletes.
This causes the qcow2 image to grow even over 110% of its virtual size,
this because the free gaps in the image get to small to allocate new
continuous clusters.

There are multiple ways to properly resolve this. One way is to not
discard the blocks on a discard request, but just zero them. This causes
the allocation the still exist, and results in no gaps.
This should also cause a perfectly continuous image when using full
preallocation.

RFC because my knowledge of qcow2 is limited, and I think its best some
developer with qcow2 knowledge has a look at it :)
Tested and seems to zero the blocks correctly instead of unmapping them.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1621
Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
---
 block.c                              |  2 +
 block/io.c                           |  2 +-
 block/qcow2-cluster.c                | 85 +++++++++++++++-------------
 include/block/block-common.h         |  1 +
 qapi/block-core.json                 |  3 +-
 qemu-nbd.c                           |  2 +-
 qemu-options.hx                      |  2 +-
 storage-daemon/qemu-storage-daemon.c |  2 +-
 8 files changed, 54 insertions(+), 45 deletions(-)

diff --git a/block.c b/block.c
index 5ec1a3897e..ed21d115dd 100644
--- a/block.c
+++ b/block.c
@@ -1146,6 +1146,8 @@ int bdrv_parse_discard_flags(const char *mode, int *flags)
         /* do nothing */
     } else if (!strcmp(mode, "on") || !strcmp(mode, "unmap")) {
         *flags |= BDRV_O_UNMAP;
+    } else if (!strcmp(mode, "zeroes")) {
+        *flags |= BDRV_O_UNMAP_ZERO;
     } else {
         return -1;
     }
diff --git a/block/io.c b/block/io.c
index 6fa1993374..2afc4b56b0 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2988,7 +2988,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
     }
 
     /* Do nothing if disabled.  */
-    if (!(bs->open_flags & BDRV_O_UNMAP)) {
+    if (!(bs->open_flags & BDRV_O_UNMAP) && !(bs->open_flags & BDRV_O_UNMAP_ZERO)) {
         return 0;
     }
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 39cda7f907..9e52537f50 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1969,46 +1969,6 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     return nb_clusters;
 }
 
-int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
-                          uint64_t bytes, enum qcow2_discard_type type,
-                          bool full_discard)
-{
-    BDRVQcow2State *s = bs->opaque;
-    uint64_t end_offset = offset + bytes;
-    uint64_t nb_clusters;
-    int64_t cleared;
-    int ret;
-
-    /* Caller must pass aligned values, except at image end */
-    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
-    assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
-           end_offset == bs->total_sectors << BDRV_SECTOR_BITS);
-
-    nb_clusters = size_to_clusters(s, bytes);
-
-    s->cache_discards = true;
-
-    /* Each L2 slice is handled by its own loop iteration */
-    while (nb_clusters > 0) {
-        cleared = discard_in_l2_slice(bs, offset, nb_clusters, type,
-                                      full_discard);
-        if (cleared < 0) {
-            ret = cleared;
-            goto fail;
-        }
-
-        nb_clusters -= cleared;
-        offset += (cleared * s->cluster_size);
-    }
-
-    ret = 0;
-fail:
-    s->cache_discards = false;
-    qcow2_process_discards(bs, ret);
-
-    return ret;
-}
-
 /*
  * This zeroes as many clusters of nb_clusters as possible at once (i.e.
  * all clusters in the same L2 slice) and returns the number of zeroed
@@ -2069,6 +2029,51 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     return nb_clusters;
 }
 
+int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
+                          uint64_t bytes, enum qcow2_discard_type type,
+                          bool full_discard)
+{
+    BDRVQcow2State *s = bs->opaque;
+    uint64_t end_offset = offset + bytes;
+    uint64_t nb_clusters;
+    int64_t cleared;
+    int ret;
+
+    /* Caller must pass aligned values, except at image end */
+    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
+    assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
+           end_offset == bs->total_sectors << BDRV_SECTOR_BITS);
+
+    nb_clusters = size_to_clusters(s, bytes);
+
+    s->cache_discards = true;
+
+    /* Each L2 slice is handled by its own loop iteration */
+    while (nb_clusters > 0) {
+        cleared = 0;
+        if (bs->open_flags & BDRV_O_UNMAP_ZERO) {
+            cleared = zero_in_l2_slice(bs, offset, nb_clusters, 0);
+        } else {
+            cleared = discard_in_l2_slice(bs, offset, nb_clusters, type,
+                                        full_discard);
+        }
+        if (cleared < 0) {
+            ret = cleared;
+            goto fail;
+        }
+
+        nb_clusters -= cleared;
+        offset += (cleared * s->cluster_size);
+    }
+
+    ret = 0;
+fail:
+    s->cache_discards = false;
+    qcow2_process_discards(bs, ret);
+
+    return ret;
+}
+
 static int coroutine_fn
 zero_l2_subclusters(BlockDriverState *bs, uint64_t offset,
                     unsigned nb_subclusters)
diff --git a/include/block/block-common.h b/include/block/block-common.h
index b5122ef8ab..d90206087e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -179,6 +179,7 @@ typedef enum {
 #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening
                                       read-write fails */
 #define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
+#define BDRV_O_UNMAP_ZERO  0x80000  /* execute guest UNMAP/TRIM operations but zero instead of deref */
 
 #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index c05ad0c07e..0f91d1a6b6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2971,11 +2971,12 @@
 #
 # @ignore: Ignore the request
 # @unmap: Forward as an unmap request
+# @zeroes: Zero the clusters instead of unmapping (since 8.1)
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDiscardOptions',
-  'data': [ 'ignore', 'unmap' ] }
+  'data': [ 'ignore', 'unmap', 'zeroes' ] }
 
 ##
 # @BlockdevDetectZeroesOptions:
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 6ff45308a9..6c0b326db4 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -148,7 +148,7 @@ static void usage(const char *name)
 "                            valid options are: 'none', 'writeback' (default),\n"
 "                            'writethrough', 'directsync' and 'unsafe'\n"
 "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
-"      --discard=MODE        set discard mode (ignore, unmap)\n"
+"      --discard=MODE        set discard mode (ignore, unmap, zeroes)\n"
 "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
 "      --image-opts          treat FILE as a full set of image options\n"
 "\n"
diff --git a/qemu-options.hx b/qemu-options.hx
index b5efa648ba..7e9d383499 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1209,7 +1209,7 @@ SRST
 ERST
 
 DEF("blockdev", HAS_ARG, QEMU_OPTION_blockdev,
-    "-blockdev [driver=]driver[,node-name=N][,discard=ignore|unmap]\n"
+    "-blockdev [driver=]driver[,node-name=N][,discard=ignore|unmap|zeroes]\n"
     "          [,cache.direct=on|off][,cache.no-flush=on|off]\n"
     "          [,read-only=on|off][,auto-read-only=on|off]\n"
     "          [,force-share=on|off][,detect-zeroes=on|off|unmap]\n"
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 0e9354faa6..08e8b1b3d9 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -86,7 +86,7 @@ static void help(void)
 "                         specify tracing options\n"
 "  -V, --version          output version information and exit\n"
 "\n"
-"  --blockdev [driver=]<driver>[,node-name=<N>][,discard=ignore|unmap]\n"
+"  --blockdev [driver=]<driver>[,node-name=<N>][,discard=ignore|unmap|zeroes]\n"
 "             [,cache.direct=on|off][,cache.no-flush=on|off]\n"
 "             [,read-only=on|off][,auto-read-only=on|off]\n"
 "             [,force-share=on|off][,detect-zeroes=on|off|unmap]\n"
-- 
2.40.1


