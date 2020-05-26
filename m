Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6A1C84C8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 10:28:48 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWbte-0001YL-04
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 04:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbqo-0005z2-Lj; Thu, 07 May 2020 04:25:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:37758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbql-0004mc-Ql; Thu, 07 May 2020 04:25:50 -0400
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jWbqb-00024P-2r; Thu, 07 May 2020 11:25:37 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v24 3/4] qcow2: add zstd cluster compression
Date: Thu,  7 May 2020 11:25:20 +0300
Message-Id: <20200507082521.29210-4-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200507082521.29210-1-dplotnikov@virtuozzo.com>
References: <20200507082521.29210-1-dplotnikov@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=dplotnikov@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 04:25:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 block/qcow2-threads.c  | 169 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |   7 ++
 5 files changed, 180 insertions(+), 2 deletions(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 298a031310..cb723463f2 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -212,6 +212,7 @@ version 2.
 
                     Available compression type values:
                         0: zlib <https://www.zlib.net/>
+                        1: zstd <http://github.com/facebook/zstd>
 
 
 === Header padding ===
diff --git a/configure b/configure
index 23b5e93752..4e3a1690ea 100755
--- a/configure
+++ b/configure
@@ -1861,7 +1861,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
   zstd            support for zstd compression library
-                  (for migration compression)
+                  (for migration compression and qcow2 cluster compression)
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1522e2983f..6fbacddab2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4293,11 +4293,12 @@
 # Compression type used in qcow2 image file
 #
 # @zlib: zlib compression, see <http://zlib.net/>
+# @zstd: zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 5.1
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 7dbaf53489..1914baf456 100644
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
@@ -166,6 +171,160 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
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
+    ssize_t ret;
+    size_t zstd_ret;
+    ZSTD_outBuffer output = {
+        .dst = dest,
+        .size = dest_size,
+        .pos = 0
+    };
+    ZSTD_inBuffer input = {
+        .src = src,
+        .size = src_size,
+        .pos = 0
+    };
+    ZSTD_CCtx *cctx = ZSTD_createCCtx();
+
+    if (!cctx) {
+        return -EIO;
+    }
+    /*
+     * Use the zstd streamed interface for symmetry with decompression,
+     * where streaming is essential since we don't record the exact
+     * compressed size.
+     *
+     * ZSTD_compressStream2() tries to compress everything it could
+     * with a single call. Although, ZSTD docs says that:
+     * "You must continue calling ZSTD_compressStream2() with ZSTD_e_end
+     * until it returns 0, at which point you are free to start a new frame",
+     * in out tests we saw the only case when it returned with >0 -
+     * when the output buffer was too small. In that case,
+     * ZSTD_compressStream2() expects a bigger buffer on the next call.
+     * We can't provide a bigger buffer because we are limited with dest_size
+     * which we pass to the ZSTD_compressStream2() at once.
+     * So, we don't need any loops and just abort the compression when we
+     * don't get 0 result on the first call.
+     */
+    zstd_ret = ZSTD_compressStream2(cctx, &output, &input, ZSTD_e_end);
+
+    if (zstd_ret) {
+        if (zstd_ret > output.size - output.pos) {
+            ret = -ENOMEM;
+        } else {
+            ret = -EIO;
+        }
+        goto out;
+    }
+
+    /* make sure that zstd didn't overflow the dest buffer */
+    assert(output.pos <= dest_size);
+    ret = output.pos;
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
+    size_t zstd_ret = 0;
+    ssize_t ret = 0;
+    ZSTD_outBuffer output = {
+        .dst = dest,
+        .size = dest_size,
+        .pos = 0
+    };
+    ZSTD_inBuffer input = {
+        .src = src,
+        .size = src_size,
+        .pos = 0
+    };
+    ZSTD_DCtx *dctx = ZSTD_createDCtx();
+
+    if (!dctx) {
+        return -EIO;
+    }
+
+    /*
+     * The compressed stream from the input buffer may consist of more
+     * than one zstd frame. So we iterate until we get a fully
+     * uncompressed cluster.
+     * From zstd docs related to ZSTD_decompressStream:
+     * "return : 0 when a frame is completely decoded and fully flushed"
+     * We suppose that this means: each time ZSTD_decompressStream reads
+     * only ONE full frame and returns 0 if and only if that frame
+     * is completely decoded and flushed. Only after returning 0,
+     * ZSTD_decompressStream reads another ONE full frame.
+     */
+    while (output.pos < output.size) {
+        size_t last_in_pos = input.pos;
+        size_t last_out_pos = output.pos;
+        zstd_ret = ZSTD_decompressStream(dctx, &output, &input);
+
+        if (ZSTD_isError(zstd_ret)) {
+            ret = -EIO;
+            break;
+        }
+
+        /*
+         * The ZSTD manual is vague about what to do if it reads
+         * the buffer partially, and we don't want to get stuck
+         * in an infinite loop where ZSTD_decompressStream
+         * returns > 0 waiting for another input chunk. So, we add
+         * a check which ensures that the loop makes some progress
+         * on each step.
+         */
+        if (last_in_pos >= input.pos &&
+            last_out_pos >= output.pos) {
+            ret = -EIO;
+            break;
+        }
+    }
+    /*
+     * Make sure that we have the frame fully flushed here
+     * if not, we somehow managed to get uncompressed cluster
+     * greater then the cluster size, possibly because of its
+     * damage.
+     */
+    if (zstd_ret > 0) {
+        ret = -EIO;
+    }
+
+    ZSTD_freeDCtx(dctx);
+    assert(ret == 0 || ret == -EIO);
+    return ret;
+}
+#endif
+
 static int qcow2_compress_pool_func(void *opaque)
 {
     Qcow2CompressData *data = opaque;
@@ -217,6 +376,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
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
@@ -249,6 +413,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
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
index a5587de1d2..90559e28f8 100644
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
@@ -3479,6 +3482,10 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
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


