Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76118A025B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:59:31 +0200 (CEST)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2xXu-0002GM-59
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1i2xVb-0000rw-K5
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1i2xVZ-0000gY-5z
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:57:07 -0400
Received: from relay.sw.ru ([185.231.240.75]:44834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1i2xVY-0000fD-QX; Wed, 28 Aug 2019 08:57:05 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1i2xVW-0006aK-4J; Wed, 28 Aug 2019 15:57:02 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 15:56:54 +0300
Message-Id: <20190828125654.10544-4-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190828125654.10544-1-dplotnikov@virtuozzo.com>
References: <20190828125654.10544-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4 3/3] qcow2: add zstd cluster compression
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, armbru@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zstd significantly reduces cluster compression time.
It provides better compression performance maintaining
the same level of compression ratio in comparison with
zlib, which, at the moment, has been the only compression
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
 block/qcow2-threads.c  | 107 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          |   7 +++
 configure              |  34 +++++++++++++
 docs/interop/qcow2.txt |  20 ++++++++
 qapi/block-core.json   |   3 +-
 5 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 14b5bd76fb..f6643976f4 100644
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
@@ -165,6 +170,98 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
     return ret;
 }
 
+#ifdef CONFIG_ZSTD
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
+    ssize_t ret;
+    uint32_t *c_size = dest;
+    /* steal some bytes to store compressed chunk size */
+    char *d_buf = ((char *) dest) + sizeof(*c_size);
+
+    /* snaity check that we can store the compressed data length */
+    if (dest_size < sizeof(*c_size)) {
+        return -ENOMEM;
+    }
+
+    dest_size -= sizeof(*c_size);
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
+    /* store the compressed chunk size in the very beginning of the buffer */
+    *c_size = cpu_to_be32(ret);
+
+    return ret + sizeof(*c_size);
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
+    ssize_t ret;
+    /*
+     * zstd decompress wants to know the exact length of the data
+     * for that purpose, on the compression the length is stored in
+     * the very beginning of the compressed buffer
+     */
+    uint32_t s_size;
+    const char *s_buf = ((const char *) src) + sizeof(s_size);
+
+    /* sanity check that we can read the content length */
+    if (src_size < sizeof(s_size)) {
+        return -EIO;
+    }
+
+    s_size = be32_to_cpu( *(const uint32_t *) src);
+
+    /* sanity check that the buffer is big enough to read the content */
+    if (src_size - sizeof(s_size) < s_size) {
+        return -EIO;
+    }
+
+    ret = ZSTD_decompress(dest, dest_size, s_buf, s_size);
+
+    if (ZSTD_isError(ret)) {
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
@@ -216,6 +313,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
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
@@ -248,6 +350,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
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
index 2884b9d9f2..06f346e8cc 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1201,6 +1201,9 @@ static int check_compression_type(BDRVQcow2State *s, Error **errp)
 {
     switch (s->compression_type) {
     case QCOW2_COMPRESSION_TYPE_ZLIB:
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+#endif
         break;
 
     default:
@@ -3293,6 +3296,10 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
 
         switch (qcow2_opts->compression_type) {
+#ifdef CONFIG_ZSTD
+        case QCOW2_COMPRESSION_TYPE_ZSTD:
+            break;
+#endif
         default:
             error_setg_errno(errp, -EINVAL, "Unknown compression type");
             goto out;
diff --git a/configure b/configure
index 714e7fb6a1..111c34878d 100755
--- a/configure
+++ b/configure
@@ -441,6 +441,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt=""
 zlib="yes"
+zstd=""
 capstone=""
 lzo=""
 snappy=""
@@ -1358,6 +1359,10 @@ for opt do
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
@@ -1812,6 +1817,7 @@ disabled with --disable-FEATURE, default is enabled if available:
                   (for reading bzip2-compressed dmg images)
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
+  zstd            support of zstd compression library
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
@@ -2407,6 +2413,30 @@ EOF
     fi
 fi
 
+#########################################
+# zstd check
+
+if test "$zstd" == "yes" ; then
+    if $pkg_config --exists libzstd; then
+        zstd_cflags=$($pkg_config --cflags libzstd)
+        zstd_libs=$($pkg_config --libs libzstd)
+        QEMU_CFLAGS="$zstd_cflags $QEMU_CFLAGS"
+        LIBS="$zstd_libs $LIBS"
+    else
+        cat > $TMPC << EOF
+#include <zstd.h>
+int main(void) { ZSTD_versionNumber(); return 0; }
+EOF
+        if compile_prog "" "-lzstd" ; then
+            LIBS="$LIBS -lzstd"
+        else
+            feature_not_found "zstd" "Install libzstd-devel"
+        fi
+    fi
+else
+    zstd="no"
+fi
+
 ##########################################
 # libseccomp check
 
@@ -6460,6 +6490,7 @@ echo "lzo support       $lzo"
 echo "snappy support    $snappy"
 echo "bzip2 support     $bzip2"
 echo "lzfse support     $lzfse"
+echo "zstd support      $zstd"
 echo "NUMA host support $numa"
 echo "libxml2           $libxml2"
 echo "tcmalloc support  $tcmalloc"
@@ -7306,6 +7337,9 @@ fi
 if test "$sheepdog" = "yes" ; then
   echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
 fi
+if test "$zstd" = "yes" ; then
+  echo "CONFIG_ZSTD=y" >> $config_host_mak
+fi
 
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index e1be8bd5c3..4b0dc124f5 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -181,6 +181,7 @@ in the description of a field.
                     must be set.
                     Available compression type values:
                         0: zlib <https://www.zlib.net/> (default)
+                        1: zstd <http://github.com/facebook/zstd>
 
 Directly after the image header, optional sections called header extensions can
 be stored. Each extension has a structure like the following:
@@ -536,6 +537,9 @@ Compressed Clusters Descriptor (x = 62 - (cluster_bits - 8)):
                     Another compressed cluster may map to the tail of the final
                     sector used by this compressed cluster.
 
+                    The layout of the compressed data depends on the compression
+                    type used for the image (see compressed cluster layout).
+
 If a cluster is unallocated, read requests shall read the data from the backing
 file (except if bit 0 in the Standard Cluster Descriptor is set). If there is
 no backing file or the backing file is smaller than the image, they shall read
@@ -788,3 +792,19 @@ In the image file the 'enabled' state is reflected by the 'auto' flag. If this
 flag is set, the software must consider the bitmap as 'enabled' and start
 tracking virtual disk changes to this bitmap from the first write to the
 virtual disk. If this flag is not set then the bitmap is disabled.
+
+=== Compressed cluster layout ===
+
+The compressed cluster data may have a different layout depending on the
+compression type used for the image, and store specific data for the particular
+compression type.
+
+Compressed data layout for the available compression types:
+(x = data_space_length - 1)
+
+    zlib <http://zlib.net/>:
+        Byte  0 -  x:     the compressed data content
+                          all the space provided used for compressed data
+    zstd <http://github.com/facebook/zstd>:
+        Byte  0 -  3:     the length of compressed data
+              4 -  x:     the compressed data content
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2c002ca6a9..9e458d5b40 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4283,11 +4283,12 @@
 # Compression type used in qcow2 image file
 #
 # @zlib:  zlib compression, see <http://zlib.net/>
+# @zstd:  zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 4.2
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
-- 
2.17.0


