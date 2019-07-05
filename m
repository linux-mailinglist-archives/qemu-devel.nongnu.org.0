Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1475F8ED
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 15:13:36 +0200 (CEST)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj1YN-0006xU-UO
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 09:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46104)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hj1V8-0004Y4-Oj
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 09:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1hj1V5-0008N2-DJ
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 09:10:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:54572)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hj1Uw-0008Gw-0W; Thu, 04 Jul 2019 09:10:02 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1hj1Uq-000226-4J; Thu, 04 Jul 2019 16:09:56 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: kwolf@redhat.com, mreitz@redhat.com, eblake@redhat.com, armbru@redhat.com
Date: Thu,  4 Jul 2019 16:09:48 +0300
Message-Id: <20190704130949.14017-3-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
References: <20190704130949.14017-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 2/3] qcow2: rework the cluster compression
 routine
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

The patch allow to process image compression type defined
in the image header and choose an appropriate method for
image clusters (de)compression.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/qcow2.c | 93 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 20 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 8fa932a349..a107f76e98 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4005,8 +4005,11 @@ fail:
 }
 
 /*
- * qcow2_compress()
+ * qcow2_zlib_compress()
  *
+ * Compress @src_size bytes of data using zlib compression method
+ *
+ * @dest_size bytes.
  * @dest - destination buffer, @dest_size bytes
  * @src - source buffer, @src_size bytes
  *
@@ -4014,8 +4017,8 @@ fail:
  *          -1 destination buffer is not enough to store compressed data
  *          -2 on any other error
  */
-static ssize_t qcow2_compress(void *dest, size_t dest_size,
-                              const void *src, size_t src_size)
+static ssize_t qcow2_zlib_compress(void *dest, size_t dest_size,
+                                   const void *src, size_t src_size)
 {
     ssize_t ret;
     z_stream strm;
@@ -4025,7 +4028,7 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
     ret = deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED,
                        -12, 9, Z_DEFAULT_STRATEGY);
     if (ret != Z_OK) {
-        return -2;
+        return -EIO;
     }
 
     /* strm.next_in is not const in old zlib versions, such as those used on
@@ -4039,7 +4042,7 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
     if (ret == Z_STREAM_END) {
         ret = dest_size - strm.avail_out;
     } else {
-        ret = (ret == Z_OK ? -1 : -2);
+        ret = (ret == Z_OK ? -ENOMEM : -EIO);
     }
 
     deflateEnd(&strm);
@@ -4048,10 +4051,10 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
 }
 
 /*
- * qcow2_decompress()
+ * qcow2_zlib_decompress()
  *
  * Decompress some data (not more than @src_size bytes) to produce exactly
- * @dest_size bytes.
+ * @dest_size bytes using zlib compression method
  *
  * @dest - destination buffer, @dest_size bytes
  * @src - source buffer, @src_size bytes
@@ -4059,8 +4062,8 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
  * Returns: 0 on success
  *          -1 on fail
  */
-static ssize_t qcow2_decompress(void *dest, size_t dest_size,
-                                const void *src, size_t src_size)
+static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
+                                     const void *src, size_t src_size)
 {
     int ret = 0;
     z_stream strm;
@@ -4073,7 +4076,7 @@ static ssize_t qcow2_decompress(void *dest, size_t dest_size,
 
     ret = inflateInit2(&strm, -12);
     if (ret != Z_OK) {
-        return -1;
+        return -EIO;
     }
 
     ret = inflate(&strm, Z_FINISH);
@@ -4081,7 +4084,7 @@ static ssize_t qcow2_decompress(void *dest, size_t dest_size,
         /* We approve Z_BUF_ERROR because we need @dest buffer to be filled, but
          * @src buffer may be processed partly (because in qcow2 we know size of
          * compressed data with precision of one sector) */
-        ret = -1;
+        ret = -EIO;
     }
 
     inflateEnd(&strm);
@@ -4153,20 +4156,67 @@ qcow2_co_do_compress(BlockDriverState *bs, void *dest, size_t dest_size,
     return arg.ret;
 }
 
+/*
+ * qcow2_co_compress()
+ *
+ * Compress @src_size bytes of data using the compression
+ * method defined by the image compression type
+ *
+ * @dest - destination buffer, @dest_size bytes
+ * @src - source buffer, @src_size bytes
+ *
+ * Returns: 0 on success
+ *          a negative error code on fail
+ */
 static ssize_t coroutine_fn
 qcow2_co_compress(BlockDriverState *bs, void *dest, size_t dest_size,
                   const void *src, size_t src_size)
 {
-    return qcow2_co_do_compress(bs, dest, dest_size, src, src_size,
-                                qcow2_compress);
+    BDRVQcow2State *s = bs->opaque;
+    Qcow2CompressFunc fn;
+
+    switch (s->compression_type) {
+    case QCOW2_COMPRESSION_TYPE_ZLIB:
+        fn = qcow2_zlib_compress;
+        break;
+
+    default:
+        return -ENOTSUP;
+    }
+
+    return qcow2_co_do_compress(bs, dest, dest_size, src, src_size, fn);
 }
 
+/*
+ * qcow2_co_decompress()
+ *
+ * Decompress some data (not more than @src_size bytes) to produce exactly
+ * @dest_size bytes using the compression method defined by the image
+ * compression type
+ *
+ * @dest - destination buffer, @dest_size bytes
+ * @src - source buffer, @src_size bytes
+ *
+ * Returns: 0 on success
+ *          a negative error code on fail
+ */
 static ssize_t coroutine_fn
 qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
                     const void *src, size_t src_size)
 {
-    return qcow2_co_do_compress(bs, dest, dest_size, src, src_size,
-                                qcow2_decompress);
+    BDRVQcow2State *s = bs->opaque;
+    Qcow2CompressFunc fn;
+
+    switch (s->compression_type) {
+    case QCOW2_COMPRESSION_TYPE_ZLIB:
+        fn = qcow2_zlib_decompress;
+        break;
+
+    default:
+        return -ENOTSUP;
+    }
+
+    return qcow2_co_do_compress(bs, dest, dest_size, src, src_size, fn);
 }
 
 /* XXX: put compressed sectors first, then all the cluster aligned
@@ -4178,7 +4228,7 @@ qcow2_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
     BDRVQcow2State *s = bs->opaque;
     QEMUIOVector hd_qiov;
     int ret;
-    size_t out_len;
+    ssize_t out_len;
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
 
@@ -4217,16 +4267,19 @@ qcow2_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
 
     out_len = qcow2_co_compress(bs, out_buf, s->cluster_size - 1,
                                 buf, s->cluster_size);
-    if (out_len == -2) {
-        ret = -EINVAL;
-        goto fail;
-    } else if (out_len == -1) {
+    if (out_len == -ENOMEM) {
         /* could not compress: write normal cluster */
         ret = qcow2_co_pwritev(bs, offset, bytes, qiov, 0);
         if (ret < 0) {
             goto fail;
         }
         goto success;
+    } else if (out_len < 0) {
+        /*
+         * encounter other compression issues propagate error to the upper level
+         */
+        ret = out_len;
+        goto fail;
     }
 
     qemu_co_mutex_lock(&s->lock);
-- 
2.17.0


