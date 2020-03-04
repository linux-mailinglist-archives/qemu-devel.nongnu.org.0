Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EEA17918A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 14:39:31 +0100 (CET)
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9UFG-0007Cd-BY
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 08:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j9UBt-0002I9-JO
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:36:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j9UBr-0002XG-Oh
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:36:01 -0500
Received: from relay.sw.ru ([185.231.240.75]:44142)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j9UBr-0002Qd-Fm; Wed, 04 Mar 2020 08:35:59 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j9UBg-00070I-8o; Wed, 04 Mar 2020 16:35:48 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/5] qcow2: add zstd cluster compression
Date: Wed,  4 Mar 2020 16:35:37 +0300
Message-Id: <20200304133538.9159-5-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200304133538.9159-1-dplotnikov@virtuozzo.com>
References: <20200304133538.9159-1-dplotnikov@virtuozzo.com>
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/interop/qcow2.txt |  20 +++++++
 configure              |   2 +-
 qapi/block-core.json   |   3 +-
 block/qcow2-threads.c  | 123 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |   7 +++
 5 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 5597e24474..9048114445 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -208,6 +208,7 @@ version 2.
 
                     Available compression type values:
                         0: zlib <https://www.zlib.net/>
+                        1: zstd <http://github.com/facebook/zstd>
 
 
 === Header padding ===
@@ -575,11 +576,30 @@ Compressed Clusters Descriptor (x = 62 - (cluster_bits - 8)):
                     Another compressed cluster may map to the tail of the final
                     sector used by this compressed cluster.
 
+                    The layout of the compressed data depends on the compression
+                    type used for the image (see compressed cluster layout).
+
 If a cluster is unallocated, read requests shall read the data from the backing
 file (except if bit 0 in the Standard Cluster Descriptor is set). If there is
 no backing file or the backing file is smaller than the image, they shall read
 zeros for all parts that are not covered by the backing file.
 
+=== Compressed Cluster Layout ===
+
+The compressed cluster data has a layout depending on the compression
+type used for the image, as follows:
+
+Compressed data layout for the available compression types:
+data_space_lenght - data chunk length available to store a compressed cluster.
+(for more details see "Compressed Clusters Descriptor")
+x = data_space_length - 1
+
+    0:  (default)  zlib <http://zlib.net/>:
+            Byte  0 -  x:     the compressed data content
+                              all the space provided used for compressed data
+    1:  zstd <http://github.com/facebook/zstd>:
+            Byte  0 -  3:     the length of compressed data in bytes
+                  4 -  x:     the compressed data content
 
 == Snapshots ==
 
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
index a67eb8bff4..84889fb741 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4401,11 +4401,12 @@
 # Compression type used in qcow2 image file
 #
 # @zlib:  zlib compression, see <http://zlib.net/>
+# @zstd:  zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 5.0
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 7dbaf53489..eeae68e88e 100644
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
@@ -166,6 +171,114 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
     return ret;
 }
 
+#ifdef CONFIG_ZSTD
+
+#define ZSTD_LEN_BUF 4
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
+
+    /*
+     * steal ZSTD_LEN_BUF bytes in the very beginning of the buffer
+     * to store compressed chunk size
+     */
+    char *d_buf = ((char *) dest) + ZSTD_LEN_BUF;
+
+    /*
+     * sanity check that we can store the compressed data length,
+     * and there is some space left for the compressor buffer
+     */
+    if (dest_size <= ZSTD_LEN_BUF) {
+        return -ENOMEM;
+    }
+
+    dest_size -= ZSTD_LEN_BUF;
+
+    ret = ZSTD_compress(d_buf, dest_size, src, src_size, 5);
+
+    if (ZSTD_isError(ret)) {
+        if (ZSTD_getErrorCode(ret) == ZSTD_error_dstSize_tooSmall) {
+            return -ENOMEM;
+        } else {
+            return -EIO;
+        }
+    }
+
+    /*
+     * paranoid sanity check that we can store
+     * the compressed size in the first 4 bytes
+     */
+    if (ret > UINT32_MAX) {
+        return -ENOMEM;
+    }
+
+    /* store the compressed chunk size in the very beginning of the buffer */
+    stl_be_p(dest, ret);
+
+    return ret + ZSTD_LEN_BUF;
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
+    /*
+     * zstd decompress wants to know the exact length of the data.
+     * For that purpose, on compression, the length is stored in
+     * the very beginning of the compressed buffer
+     */
+    size_t s_size;
+    const char *s_buf = ((const char *) src) + ZSTD_LEN_BUF;
+
+    /*
+     * sanity check that we can read 4 byte the content length and
+     * and there is some content to decompress
+     */
+    if (src_size <= ZSTD_LEN_BUF) {
+        return -EIO;
+    }
+
+    s_size = ldl_be_p(src);
+
+    /* sanity check that the buffer is big enough to read the content from */
+    if (src_size - ZSTD_LEN_BUF < s_size) {
+        return -EIO;
+    }
+
+    if (ZSTD_isError(
+            ZSTD_decompress(dest, dest_size, s_buf, s_size))) {
+        return -EIO;
+    }
+
+    return 0;
+}
+#endif
+
 static int qcow2_compress_pool_func(void *opaque)
 {
     Qcow2CompressData *data = opaque;
@@ -217,6 +330,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
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
@@ -249,6 +367,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
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
index 3576412cdf..0848015ecb 100644
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
@@ -3455,6 +3458,10 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
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


