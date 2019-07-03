Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090085E27F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 13:05:06 +0200 (CEST)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hid4T-00048H-7u
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 07:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59767)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hid0s-0000Vr-Co
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hid0q-0004WT-KY
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 07:01:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:59418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hid0V-0003oq-5p; Wed, 03 Jul 2019 07:00:59 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hid0P-0004EW-TI; Wed, 03 Jul 2019 14:00:54 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: kwolf@redhat.com, mreitz@redhat.com, eblake@redhat.com, armbru@redhat.com
Date: Wed,  3 Jul 2019 14:00:44 +0300
Message-Id: <20190703110044.25610-4-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190703110044.25610-1-dplotnikov@virtuozzo.com>
References: <20190703110044.25610-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v1 3/3] qcow2: add zstd cluster compression
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
Cc: vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zstd significantly reduces cluster compression time.
It provides better compression performance maintaining
the same level of compression ratio in comparison with
zlib, which, by the moment, has been the only compression
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
 block/qcow2.c        | 96 ++++++++++++++++++++++++++++++++++++++++++++
 configure            | 32 +++++++++++++++
 qapi/block-core.json |  3 +-
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 37a563a671..caa04b0beb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -27,6 +27,11 @@
 #define ZLIB_CONST
 #include <zlib.h>
 
+#ifdef CONFIG_ZSTD
+#include <zstd.h>
+#include <zstd_errors.h>
+#endif
+
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "sysemu/block-backend.h"
@@ -1209,6 +1214,9 @@ static int check_compression_type(BDRVQcow2State *s, Error **errp)
 
     switch (s->compression_type) {
     case QCOW2_COMPRESSION_TYPE_ZLIB:
+#ifdef CONFIG_ZSTD
+    case QCOW2_COMPRESSION_TYPE_ZSTD:
+#endif
         break;
 
     default:
@@ -4092,6 +4100,84 @@ static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
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
+ *          a negative error code on fail
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
+    if (dest_size < sizeof(*c_size)) {
+        return -ENOMEM;
+    }
+
+    dest_size -= sizeof(*c_size);
+
+    ret = ZSTD_compress(d_buf, dest_size, src, src_size, 5);
+
+    if (ZSTD_isError(ret)) {
+        if (ret == ZSTD_error_dstSize_tooSmall) {
+            return -ENOMEM;
+        } else {
+            return -EIO;
+        }
+    }
+
+    /* store the compressed chunk size in the very beginning of the buffer */
+    *c_size = ret;
+
+    return ret + sizeof(ret);
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
+ *          -EIO on fail
+ */
+
+static ssize_t qcow2_zstd_decompress(void *dest, size_t dest_size,
+                                     const void *src, size_t src_size)
+{
+    ssize_t ret;
+    /*
+     * zstd decompress wants to know the exact lenght of the data
+     * for that purpose, on the compression the length is stored in
+     * the very beginning of the compressed buffer
+     */
+    const uint32_t *s_size = src;
+    const char *s_buf = ((char *) src) + sizeof(*s_size);
+
+    ret = ZSTD_decompress(dest, dest_size, s_buf, *s_size);
+
+    if (ZSTD_isError(ret)) {
+        return -EIO;
+    }
+
+    return 0;
+}
+#endif
+
 #define MAX_COMPRESS_THREADS 4
 
 typedef ssize_t (*Qcow2CompressFunc)(void *dest, size_t dest_size,
@@ -4180,6 +4266,11 @@ qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
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
@@ -4212,6 +4303,11 @@ qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
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
diff --git a/configure b/configure
index 1c563a7027..57a80e38e7 100755
--- a/configure
+++ b/configure
@@ -433,6 +433,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt=""
 zlib="yes"
+zstd=""
 capstone=""
 lzo=""
 snappy=""
@@ -1333,6 +1334,10 @@ for opt do
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
@@ -1788,6 +1793,7 @@ disabled with --disable-FEATURE, default is enabled if available:
                   (for reading bzip2-compressed dmg images)
   lzfse           support of lzfse compression library
                   (for reading lzfse-compressed dmg images)
+  zstd            support of zstd compression library
   seccomp         seccomp support
   coroutine-pool  coroutine freelist (better performance)
   glusterfs       GlusterFS backend
@@ -2374,6 +2380,29 @@ EOF
     fi
 fi
 
+#########################################
+# zstd check
+
+if test "$zstd" != "no" ; then
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
+            error_exit "zstd check failed" \
+                "Make sure to have the zstd libs and headers installed."
+        fi
+    fi
+fi
+
 ##########################################
 # libseccomp check
 
@@ -7253,6 +7282,9 @@ fi
 if test "$sheepdog" = "yes" ; then
   echo "CONFIG_SHEEPDOG=y" >> $config_host_mak
 fi
+if test "$zstd" = "yes" ; then
+  echo "CONFIG_ZSTD=y" >> $config_host_mak
+fi
 
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6aa8b99993..2604f201ee 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4215,11 +4215,12 @@
 # Compression type used in qcow2 image file
 #
 # @zlib:  zlib compression, see <http://zlib.net/>
+# @zstd:  zstd compression, see <http://github.com/facebook/zstd>
 #
 # Since: 4.1
 ##
 { 'enum': 'Qcow2CompressionType',
-  'data': [ 'zlib' ] }
+  'data': [ 'zlib', 'zstd' ] }
 
 ##
 # @BlockdevCreateOptionsQcow2:
-- 
2.17.0


