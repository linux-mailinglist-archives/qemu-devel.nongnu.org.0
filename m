Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017A7B3213
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 22:41:38 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9bKz-0007Oj-2q
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 16:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i9bGh-00034h-UC
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 16:37:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i9bGg-0000g9-HW
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 16:37:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32788)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i9bGd-0000dB-3N; Sun, 15 Sep 2019 16:37:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A5BC1DA2;
 Sun, 15 Sep 2019 20:37:06 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221CE5C21A;
 Sun, 15 Sep 2019 20:37:02 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 23:36:54 +0300
Message-Id: <20190915203655.21638-3-mlevitsk@redhat.com>
In-Reply-To: <20190915203655.21638-1-mlevitsk@redhat.com>
References: <20190915203655.21638-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Sun, 15 Sep 2019 20:37:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 2/3] block/qcow2: refactor encryption code
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Change the qcow2_co_{encrypt|decrypt} to just receive full host and
  guest offsets and use this function directly instead of calling
  do_perform_cow_encrypt (which is removed by that patch).

* Adjust qcow2_co_encdec to take full host and guest offsets as well.

* Document the qcow2_co_{encrypt|decrypt} arguments
  to prevent the bug fixed in former commit from hopefully
  happening again.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block/qcow2-cluster.c | 41 ++++++++++------------------
 block/qcow2-threads.c | 63 +++++++++++++++++++++++++++++++++----------
 block/qcow2.c         |  5 ++--
 block/qcow2.h         |  8 +++---
 4 files changed, 70 insertions(+), 47 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bfeb0241d7..a2d4909024 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -462,28 +462,6 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
     return 0;
 }
 
-static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
-                                                uint64_t src_cluster_offset,
-                                                uint64_t cluster_offset,
-                                                unsigned offset_in_cluster,
-                                                uint8_t *buffer,
-                                                unsigned bytes)
-{
-    if (bytes && bs->encrypted) {
-        BDRVQcow2State *s = bs->opaque;
-        assert((offset_in_cluster & ~BDRV_SECTOR_MASK) == 0);
-        assert((bytes & ~BDRV_SECTOR_MASK) == 0);
-        assert(s->crypto);
-        if (qcow2_co_encrypt(bs,
-                start_of_cluster(s, cluster_offset + offset_in_cluster),
-                src_cluster_offset + offset_in_cluster,
-                buffer, bytes) < 0) {
-            return false;
-        }
-    }
-    return true;
-}
-
 static int coroutine_fn do_perform_cow_write(BlockDriverState *bs,
                                              uint64_t cluster_offset,
                                              unsigned offset_in_cluster,
@@ -891,11 +869,20 @@ static int perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 
     /* Encrypt the data if necessary before writing it */
     if (bs->encrypted) {
-        if (!do_perform_cow_encrypt(bs, m->offset, m->alloc_offset,
-                                    start->offset, start_buffer,
-                                    start->nb_bytes) ||
-            !do_perform_cow_encrypt(bs, m->offset, m->alloc_offset,
-                                    end->offset, end_buffer, end->nb_bytes)) {
+        ret = qcow2_co_encrypt(bs,
+                               m->alloc_offset + start->offset,
+                               m->offset + start->offset,
+                               start_buffer, start->nb_bytes);
+        if (ret < 0) {
+            ret = -EIO;
+            goto fail;
+        }
+
+        ret = qcow2_co_encrypt(bs,
+                               m->alloc_offset + end->offset,
+                               m->offset + end->offset,
+                               end_buffer, end->nb_bytes);
+        if (ret < 0) {
             ret = -EIO;
             goto fail;
         }
diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 3b1e63fe41..8f5a0d1ebe 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -234,35 +234,70 @@ static int qcow2_encdec_pool_func(void *opaque)
 }
 
 static int coroutine_fn
-qcow2_co_encdec(BlockDriverState *bs, uint64_t file_cluster_offset,
-                  uint64_t offset, void *buf, size_t len, Qcow2EncDecFunc func)
+qcow2_co_encdec(BlockDriverState *bs, uint64_t host_offset,
+                uint64_t guest_offset, void *buf, size_t len,
+                Qcow2EncDecFunc func)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2EncDecData arg = {
         .block = s->crypto,
-        .offset = s->crypt_physical_offset ?
-                      file_cluster_offset + offset_into_cluster(s, offset) :
-                      offset,
+        .offset = s->crypt_physical_offset ? host_offset : guest_offset,
         .buf = buf,
         .len = len,
         .func = func,
     };
 
-    return qcow2_co_process(bs, qcow2_encdec_pool_func, &arg);
+    assert(QEMU_IS_ALIGNED(guest_offset, BDRV_SECTOR_SIZE));
+    assert(QEMU_IS_ALIGNED(host_offset, BDRV_SECTOR_SIZE));
+    assert(QEMU_IS_ALIGNED(len, BDRV_SECTOR_SIZE));
+    assert(s->crypto);
+
+    return len == 0 ? 0 : qcow2_co_process(bs, qcow2_encdec_pool_func, &arg);
 }
 
+/*
+ * qcow2_co_encrypt()
+ *
+ * Encrypts one or more contiguous aligned sectors
+ *
+ * @host_offset - underlying storage offset of the first sector of the
+ * data to be encrypted
+ *
+ * @guest_offset - guest (virtual) offset of the first sector of the
+ * data to be encrypted
+ *
+ * @buf - buffer with the data to encrypt, that after encryption
+ *        will be written to the underlying storage device at
+ *        @host_offset
+ *
+ * @len - length of the buffer (must be a BDRV_SECTOR_SIZE multiple)
+ *
+ * Depending on the encryption method, @host_offset and/or @guest_offset
+ * may be used for generating the initialization vector for
+ * encryption.
+ *
+ * Note that while the whole range must be aligned on sectors, it
+ * does not have to be aligned on clusters and can also cross cluster
+ * boundaries
+ */
 int coroutine_fn
-qcow2_co_encrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
-                 uint64_t offset, void *buf, size_t len)
+qcow2_co_encrypt(BlockDriverState *bs, uint64_t host_offset,
+                 uint64_t guest_offset, void *buf, size_t len)
 {
-    return qcow2_co_encdec(bs, file_cluster_offset, offset, buf, len,
-                             qcrypto_block_encrypt);
+    return qcow2_co_encdec(bs, host_offset, guest_offset, buf, len,
+                           qcrypto_block_encrypt);
 }
 
+/*
+ * qcow2_co_decrypt()
+ *
+ * Decrypts one or more contiguous aligned sectors
+ * Similar to qcow2_co_encrypt
+ */
 int coroutine_fn
-qcow2_co_decrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
-                 uint64_t offset, void *buf, size_t len)
+qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
+                 uint64_t guest_offset, void *buf, size_t len)
 {
-    return qcow2_co_encdec(bs, file_cluster_offset, offset, buf, len,
-                             qcrypto_block_decrypt);
+    return qcow2_co_encdec(bs, host_offset, guest_offset, buf, len,
+                           qcrypto_block_decrypt);
 }
diff --git a/block/qcow2.c b/block/qcow2.c
index 57734f20cf..ac768092bb 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2069,7 +2069,8 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
 
                 assert((offset & (BDRV_SECTOR_SIZE - 1)) == 0);
                 assert((cur_bytes & (BDRV_SECTOR_SIZE - 1)) == 0);
-                if (qcow2_co_decrypt(bs, cluster_offset, offset,
+                if (qcow2_co_decrypt(bs, cluster_offset + offset_in_cluster,
+                                     offset,
                                      cluster_data, cur_bytes) < 0) {
                     ret = -EIO;
                     goto fail;
@@ -2288,7 +2289,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
             qemu_iovec_to_buf(qiov, qiov_offset + bytes_done,
                               cluster_data, cur_bytes);
 
-            if (qcow2_co_encrypt(bs, cluster_offset, offset,
+            if (qcow2_co_encrypt(bs, cluster_offset + offset_in_cluster, offset,
                                  cluster_data, cur_bytes) < 0) {
                 ret = -EIO;
                 goto out_unlocked;
diff --git a/block/qcow2.h b/block/qcow2.h
index 998bcdaef1..a488d761ff 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -758,10 +758,10 @@ ssize_t coroutine_fn
 qcow2_co_decompress(BlockDriverState *bs, void *dest, size_t dest_size,
                     const void *src, size_t src_size);
 int coroutine_fn
-qcow2_co_encrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
-                 uint64_t offset, void *buf, size_t len);
+qcow2_co_encrypt(BlockDriverState *bs, uint64_t host_offset,
+                 uint64_t guest_offset, void *buf, size_t len);
 int coroutine_fn
-qcow2_co_decrypt(BlockDriverState *bs, uint64_t file_cluster_offset,
-                 uint64_t offset, void *buf, size_t len);
+qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
+                 uint64_t guest_offset, void *buf, size_t len);
 
 #endif
-- 
2.17.2


