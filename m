Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F4197619
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 10:03:46 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIpOb-0007w2-7G
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1jIpLc-0005As-Br
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 04:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1jIpLY-0002Hu-C4
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 04:00:39 -0400
Received: from relay.sw.ru ([185.231.240.75]:44738)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jIpLY-0002FP-4X; Mon, 30 Mar 2020 04:00:36 -0400
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jIpLP-0000He-7A; Mon, 30 Mar 2020 11:00:27 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 3/4] qcow2: add zstd cluster compression
Date: Mon, 30 Mar 2020 10:59:55 +0300
Message-Id: <20200330075956.6791-4-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200330075956.6791-1-dplotnikov@virtuozzo.com>
References: <20200330075956.6791-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zstd significantly reduces cluster compression time.
It provides better compression performance maintaining
the same level of the compression ratio in comparison with
zlib, which, at the moment, is the only compression
method available.

The performance test results:
Test compresses and decompresses qemu qcow2 image with just
installed rhel-7.6 guest.
Image cluster size: 64K. Image on disk size: 2.2G

The test was conducted with brd disk to reduce the influence
of disk subsystem to the test results.
The results is given in seconds.

compress cmd:
  time ./qemu-img convert -O qcow2 -c -o compression_type=[zlib|zstd]
                  src.img [zlib|zstd]_compressed.img
decompress cmd
  time ./qemu-img convert -O qcow2
                  [zlib|zstd]_compressed.img uncompressed.img

           compression               decompression
         zlib       zstd           zlib         zstd
------------------------------------------------------------
real     65.5       16.3 (-75 %)    1.9          1.6 (-16 %)
user     65.0       15.8            5.3          2.5
sys       3.3        0.2            2.0          2.0

Both ZLIB and ZSTD gave the same compression ratio: 1.57
compressed image size in both cases: 1.4G

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
QAPI part:
Acked-by: Markus Armbruster <armbru@redhat.com>
---
 docs/interop/qcow2.txt |   1 +
 configure              |   2 +-
 qapi/block-core.json   |   3 +-
 block/qcow2-threads.c  | 140 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |   7 +++
 5 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 5597e24474..795dbb21dd 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -208,6 +208,7 @@ version 2.
 
                     Available compression type values:
                         0: zlib <https://www.zlib.net/>
+                        1: zstd <http://github.com/facebook/zstd>
 
 
 === Header padding ===
diff --git a/configure b/configure
index caa65f5883..b2a0aa241a 100755
--- a/configure
+++ b/configure
@@ -1835,7 +1835,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
   zstd            support for zstd compression library
-                  (for migration compression)
+                  (for migration compression and qcow2 cluster compression)
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
diff --git a/qapi/block-core.json b/qapi/block-core.json
index a306484973..8953451818 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4401,11 +4401,12 @@
 # Compression type used in qcow2 image file
 #
 # @zlib: zlib compression, see <http://zlib.net/>
+# @zstd: zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 5.0
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 7dbaf53489..410953ce76 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -28,6 +28,11 @@
 #define ZLIB_CONST
 #include <zlib.h>
 
+#ifdef CONFIG_ZSTD
+#include <zstd.h>
+#include <zstd_errors.h>
+#endif
+
 #include "qcow2.h"
 #include "block/thread-pool.h"
 #include "crypto.h"
@@ -166,6 +171,131 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
     return ret;
 }
 
+#ifdef CONFIG_ZSTD
+
+/*
+ * qcow2_zstd_compress()
+ *
+ * Compress @src_size bytes of data using zstd compression method
+ *
+ * @dest - destination buffer, @dest_size bytes
+ * @src - source buffer, @src_size bytes
+ *
+ * Returns: compressed size on success
+ *          -ENOMEM destination buffer is not enough to store compressed data
+ *          -EIO    on any other error
+ */
+static ssize_t qcow2_zstd_compress(void *dest, size_t dest_size,
+                                   const void *src, size_t src_size)
+{
+    size_t ret;
+    ZSTD_outBuffer output = { dest, dest_size, 0 };
+    ZSTD_inBuffer input = { src, src_size, 0 };
+    ZSTD_CCtx *cctx = ZSTD_createCCtx();
+
+    if (!cctx) {
+        return -EIO;
+    }
+    /*
+     * ZSTD spec: "You must continue calling ZSTD_compressStream2()
+     * with ZSTD_e_end until it returns 0, at which point you are
+     * free to start a new frame".
+     * In the loop, we try to compress all the data into one zstd frame.
+     * ZSTD_compressStream2 can potentially finish a frame earlier
+     * than the full input data is consumed. That's why we are looping
+     * until all the input data is consumed.
+     */
+    {
+        /*
+         * zstd simple interface requires the exact compressed size.
+         * zstd stream interface reads the comressed size from
+         * the compressed stream frame.
+         * Instruct zstd to compress the whole buffer and write
+         * the frame which includes the compressed size.
+         * This allows as to use zstd streaming semantics and
+         * don't store the compressed size for the zstd decompression.
+         */
+        ret = ZSTD_compressStream2(cctx, &output, &input, ZSTD_e_end);
+        if (ZSTD_isError(ret)) {
+            ret = -EIO;
+            goto out;
+        }
+        /* Dest buffer isn't big enough to store compressed content */
+        if (output.pos + ret > output.size) {
+            ret = -ENOMEM;
+            goto out;
+        }
+    } while (input.pos < input.size);
+
+    /* make sure we can safely return compressed buffer size with ssize_t */
+    assert(output.pos <= SSIZE_MAX);
+    ret = output.pos;
+
+out:
+    ZSTD_freeCCtx(cctx);
+    return ret;
+}
+
+/*
+ * qcow2_zstd_decompress()
+ *
+ * Decompress some data (not more than @src_size bytes) to produce exactly
+ * @dest_size bytes using zstd compression method
+ *
+ * @dest - destination buffer, @dest_size bytes
+ * @src - source buffer, @src_size bytes
+ *
+ * Returns: 0 on success
+ *          -EIO on any error
+ */
+static ssize_t qcow2_zstd_decompress(void *dest, size_t dest_size,
+                                     const void *src, size_t src_size)
+{
+    size_t ret = 0;
+    ZSTD_outBuffer output = { dest, dest_size, 0 };
+    ZSTD_inBuffer input = { src, src_size, 0 };
+    ZSTD_DCtx *dctx = ZSTD_createDCtx();
+
+    if (!dctx) {
+        return -EIO;
+    }
+
+    /*
+     * The compressed stream from input buffer may consist from more
+     * than one zstd frames. So we iterate until we get a fully
+     * uncompressed cluster.
+     */
+    {
+        ret = ZSTD_decompressStream(dctx, &output, &input);
+        /*
+         * if we don't fully populate the output but have read
+         * all the frames from the input, we end up with error
+         * here
+         */
+        if (ZSTD_isError(ret)) {
+            ret = -EIO;
+            goto out;
+        }
+        /*
+         * Dest buffer size is the image cluster size.
+         * It should be big enough to store uncompressed content.
+         * There shouldn't be any cases when the decompressed content
+         * size is greater then the cluster size, except cluster
+         * damaging.
+         */
+        if (output.pos + ret > output.size) {
+            ret = -EIO;
+            goto out;
+        }
+    } while (output.pos < output.size);
+
+out:
+    ZSTD_freeDCtx(dctx);
+    return ret;
+
+}
+#endif
+
 static int qcow2_compress_pool_func(void *opaque)
 {
     Qcow2CompressData *data = opaque;
@@ -217,6 +347,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
         fn = qcow2_zlib_compress;
         break;
 
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+        fn = qcow2_zstd_compress;
+        break;
+#endif
     default:
         abort();
     }
@@ -249,6 +384,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
         fn = qcow2_zlib_decompress;
         break;
 
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+        fn = qcow2_zstd_decompress;
+        break;
+#endif
     default:
         abort();
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index eb30cfe811..de8e3f976d 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1246,6 +1246,9 @@ static int validate_compression_type(BDRVQcow2State *s, Error **errp)
 {
     switch (s->compression_type) {
     case QCOW2_COMPRESSION_TYPE_ZLIB:
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+#endif
         break;
 
     default:
@@ -3454,6 +3457,10 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         }
 
         switch (qcow2_opts->compression_type) {
+#ifdef CONFIG_ZSTD
+        case QCOW2_COMPRESSION_TYPE_ZSTD:
+            break;
+#endif
         default:
             error_setg(errp, "Unknown compression type");
             goto out;
-- 
2.17.0


