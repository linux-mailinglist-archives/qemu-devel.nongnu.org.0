Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6E171183
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:33:32 +0100 (CET)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Dfm-000363-5A
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7Dca-0000GC-PK
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7DcV-00009L-1t
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:12 -0500
Received: from relay.sw.ru ([185.231.240.75]:33956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcU-00005d-Lz; Thu, 27 Feb 2020 02:30:06 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcO-0003Tx-JC; Thu, 27 Feb 2020 10:30:00 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/8] qcow2: add zstd cluster compression
Date: Thu, 27 Feb 2020 10:29:48 +0300
Message-Id: <20200227072953.25445-4-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
References: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 den@vrtuozzo.com, armbru@redhat.com, mreitz@redhat.com
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
---
 block/qcow2-threads.c  | 122 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |   7 +++
 configure              |  29 ++++++++++
 docs/interop/qcow2.txt |  18 ++++++
 qapi/block-core.json   |   3 +-
 5 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 1c128e9840..e942c4d7e5 100644
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
@@ -164,6 +169,113 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
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
+
+static ssize_t qcow2_zstd_compress(void *dest, size_t dest_size,
+                                   const void *src, size_t src_size)
+{
+    size_t ret;
+
+    /*
+     * steal ZSTD_LEN_BUF bytes in the very beginng of the buffer
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
+    /* paraniod sanity check that we can store the commpressed size */
+    if (ret > UINT_MAX) {
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
+
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
@@ -215,6 +327,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
         fn = qcow2_zlib_compress;
         break;
 
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+        fn = qcow2_zstd_compress;
+        break;
+#endif
     default:
         return -ENOTSUP;
     }
@@ -247,6 +364,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
         fn = qcow2_zlib_decompress;
         break;
 
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+        fn = qcow2_zstd_decompress;
+        break;
+#endif
     default:
         return -ENOTSUP;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index 2ccb2cabd1..9c8ad9d580 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1257,6 +1257,9 @@ static int validate_compression_type(BDRVQcow2State *s, Error **errp)
 
     switch (s->compression_type) {
     case QCOW2_COMPRESSION_TYPE_ZLIB:
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+#endif
         break;
 
     default:
@@ -3506,6 +3509,10 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         }
 
         switch (qcow2_opts->compression_type) {
+#ifdef CONFIG_ZSTD
+        case QCOW2_COMPRESSION_TYPE_ZSTD:
+            break;
+#endif
         default:
             error_setg_errno(errp, -EINVAL, "Unknown compression type");
             goto out;
diff --git a/configure b/configure
index 48d6f89d57..4690a7ea9f 100755
--- a/configure
+++ b/configure
@@ -444,6 +444,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt=""
 zlib="yes"
+zstd=""
 capstone=""
 lzo=""
 snappy=""
@@ -1371,6 +1372,10 @@ for opt do
   ;;
   --disable-lzfse) lzfse="no"
   ;;
+  --enable-zstd) zstd="yes"
+  ;;
+  --disable-zstd) zstd="no"
+  ;;
   --enable-guest-agent) guest_agent="yes"
   ;;
   --disable-guest-agent) guest_agent="no"
@@ -1829,6 +1834,7 @@ disabled with --disable-FEATURE, default is enabled if available:
                   (for reading bzip2-compressed dmg images)
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
+  zstd            support of zstd compression library
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
@@ -2453,6 +2459,25 @@ EOF
     fi
 fi
 
+#########################################
+# zstd check
+
+if test "$zstd" != "no" ; then
+    cat > $TMPC << EOF
+#include <zstd.h>
+int main(void) { ZSTD_versionNumber(); return 0; }
+EOF
+    if compile_prog "" "-lzstd" ; then
+        LIBS="$LIBS -lzstd"
+        zstd="yes"
+    else
+        if test "$zstd" = "yes"; then
+            feature_not_found "zstd" "Install libzstd-devel"
+        fi
+        zstd="no"
+    fi
+fi
+
 ##########################################
 # libseccomp check
 
@@ -6668,6 +6693,7 @@ echo "lzo support       $lzo"
 echo "snappy support    $snappy"
 echo "bzip2 support     $bzip2"
 echo "lzfse support     $lzfse"
+echo "zstd support      $zstd"
 echo "NUMA host support $numa"
 echo "libxml2           $libxml2"
 echo "tcmalloc support  $tcmalloc"
@@ -7559,6 +7585,9 @@ if test "$plugins" = "yes" ; then
 	    "\$ld_exported_symbols_list should have been set to 'yes'."
     fi
 fi
+if test "$zstd" = "yes" ; then
+  echo "CONFIG_ZSTD=y" >> $config_host_mak
+fi
 
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 5597e24474..aeca2ddebd 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -208,6 +208,7 @@ version 2.
 
                     Available compression type values:
                         0: zlib <https://www.zlib.net/>
+                        1: zstd <http://github.com/facebook/zstd>
 
 
 === Header padding ===
@@ -575,11 +576,28 @@ Compressed Clusters Descriptor (x = 62 - (cluster_bits - 8)):
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
+(x = data_space_length - 1)
+
+    0:  (default)  zlib <http://zlib.net/>:
+            Byte  0 -  x:     the compressed data content
+                              all the space provided used for compressed data
+    1:  zstd <http://github.com/facebook/zstd>:
+            Byte  0 -  3:     the length of compressed data in bytes
+                  4 -  x:     the compressed data content
 
 == Snapshots ==
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 873fbef3b5..4b6e576c44 100644
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
-- 
2.17.0


