Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881D1D175E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 16:19:26 +0200 (CEST)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYsEH-0001wu-3x
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 10:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYsB9-00057F-3a
 for qemu-devel@nongnu.org; Wed, 13 May 2020 10:16:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56517
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYsB7-0006LM-N5
 for qemu-devel@nongnu.org; Wed, 13 May 2020 10:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589379368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ysOTSXFgFTplyVuc/cMC44nqBzWf6hfe/8YlO8thdRQ=;
 b=AkJvhe5JANxMV1ZNQ5uAAuvztYiZVHKHs0th+5tiZvCMDX4wy4X+MY7Cb6VwYxC97A/2en
 t9lZJEU5G/XlPq1dxNmb2nSZLVIpponxsgvFHAFjQrhaWRM5/ude8X+maTRMQQd0ILhHUF
 Ded2eWrG+T0xdsQMe/CM8mPI/IXiSVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-VN2n0IPwNWCtGVUM1XDzLg-1; Wed, 13 May 2020 10:15:56 -0400
X-MC-Unique: VN2n0IPwNWCtGVUM1XDzLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4A82835B41;
 Wed, 13 May 2020 14:15:55 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18821610F2;
 Wed, 13 May 2020 14:15:54 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/5] qcow2: add zstd cluster compression
Date: Wed, 13 May 2020 16:15:42 +0200
Message-Id: <20200513141544.1459069-4-mreitz@redhat.com>
In-Reply-To: <20200513141544.1459069-1-mreitz@redhat.com>
References: <20200513141544.1459069-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <dplotnikov@virtuozzo.com>

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
Message-Id: <20200507082521.29210-4-dplotnikov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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
index 0d69c360c0..c50c006b86 100755
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
index b878a6a474..ad9ab4fafa 100644
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
2.26.2


