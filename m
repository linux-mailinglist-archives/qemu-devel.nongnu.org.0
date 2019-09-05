Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E155FA9E71
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 11:34:11 +0200 (CEST)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5o9a-0007Tg-Lx
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 05:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1i5o6t-00062L-EN
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 05:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1i5o6r-00019L-Oi
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 05:31:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:38098)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1i5o6r-00017M-HQ; Thu, 05 Sep 2019 05:31:21 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1i5o6o-0004LP-Jd; Thu, 05 Sep 2019 12:31:18 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: armbru@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  5 Sep 2019 12:31:08 +0300
Message-Id: <20190905093109.12261-3-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190905093109.12261-1-dplotnikov@virtuozzo.com>
References: <20190905093109.12261-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 2/3] qcow2: rework the cluster compression
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch allows processing the image compression type defined
in the image header and chooses an appropriate method for
image clusters (de)compression.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-threads.c | 77 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 14 deletions(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 3b1e63fe41..ebeef9e568 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -74,7 +74,9 @@ typedef struct Qcow2CompressData {
 } Qcow2CompressData;
 
 /*
- * qcow2_compress()
+ * qcow2_zlib_compress()
+ *
+ * Compress @src_size bytes of data using zlib compression method
  *
  * @dest - destination buffer, @dest_size bytes
  * @src - source buffer, @src_size bytes
@@ -83,8 +85,8 @@ typedef struct Qcow2CompressData {
  *          -ENOMEM destination buffer is not enough to store compressed data
  *          -EIO    on any other error
  */
-static ssize_t qcow2_compress(void *dest, size_t dest_size,
-                              const void *src, size_t src_size)
+static ssize_t qcow2_zlib_compress(void *dest, size_t dest_size,
+                                   const void *src, size_t src_size)
 {
     ssize_t ret;
     z_stream strm;
@@ -119,19 +121,19 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
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
  *
  * Returns: 0 on success
- *          -1 on fail
+ *          -EIO on failure
  */
-static ssize_t qcow2_decompress(void *dest, size_t dest_size,
-                                const void *src, size_t src_size)
+static ssize_t qcow2_zlib_decompress(void *dest, size_t dest_size,
+                                     const void *src, size_t src_size)
 {
     int ret = 0;
     z_stream strm;
@@ -144,7 +146,7 @@ static ssize_t qcow2_decompress(void *dest, size_t dest_size,
 
     ret = inflateInit2(&strm, -12);
     if (ret != Z_OK) {
-        return -1;
+        return -EIO;
     }
 
     ret = inflate(&strm, Z_FINISH);
@@ -154,7 +156,7 @@ static ssize_t qcow2_decompress(void *dest, size_t dest_size,
          * @src buffer may be processed partly (because in qcow2 we know size of
          * compressed data with precision of one sector)
          */
-        ret = -1;
+        ret = -EIO;
     }
 
     inflateEnd(&strm);
@@ -189,20 +191,67 @@ qcow2_co_do_compress(BlockDriverState *bs, void *dest, size_t dest_size,
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
+ *          a negative error code on failure
+ */
 ssize_t coroutine_fn
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
+ *          a negative error code on failure
+ */
 ssize_t coroutine_fn
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
 
 
-- 
2.17.0


