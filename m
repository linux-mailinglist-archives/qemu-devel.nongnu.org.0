Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C1572282
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:24:36 +0200 (CEST)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKYl-0004h8-EP
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHQ-0003Gk-V1
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHM-0006Uq-3D
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSWYvTWW7xGsM9YVUppOpDdFXo+nuCuHgctdWWpC7zo=;
 b=FVD5/A2wDPEvelNemctIDFr3e7PCVhLSq4ahJA8D652j+CvvbjlLpq7Cts3RmEKbevYFB7
 j7uTrPAiYzhspAsz4KZRxbpL1wkPsvlG/8Ms0gHzYXiJBytSu5+S9EYyxp8+ztdp7RLFna
 ORroJ/SzudOtKb+kR6g7Lj3eQGFHtpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-5LVY0WEJOh6LjZjV9EzxrA-1; Tue, 12 Jul 2022 14:06:26 -0400
X-MC-Unique: 5LVY0WEJOh6LjZjV9EzxrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16C16811E80;
 Tue, 12 Jul 2022 18:06:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D261121314;
 Tue, 12 Jul 2022 18:06:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 03/35] block: Make bdrv_{pread,pwrite}() return 0 on success
Date: Tue, 12 Jul 2022 20:05:45 +0200
Message-Id: <20220712180617.1362407-4-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Faria <afaria@redhat.com>

They currently return the value of their 'bytes' parameter on success.

Make them return 0 instead, for consistency with other I/O functions and
in preparation to implement them using generated_co_wrapper. This also
makes it clear that short reads/writes are not possible.

The few callers that rely on the previous behavior are adjusted
accordingly by hand.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609152744.3891847-4-afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/cloop.c                    |  2 +-
 block/crypto.c                   |  4 ++--
 block/dmg.c                      | 10 +++++-----
 block/io.c                       | 10 ++--------
 block/qcow.c                     |  2 +-
 block/qcow2.c                    |  4 ++--
 block/qed.c                      |  7 +------
 block/vdi.c                      |  2 +-
 block/vmdk.c                     |  5 ++---
 tests/unit/test-block-iothread.c |  4 ++--
 10 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/block/cloop.c b/block/cloop.c
index 9a2334495e..40b146e714 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -222,7 +222,7 @@ static inline int cloop_read_block(BlockDriverState *bs, int block_num)
 
         ret = bdrv_pread(bs->file, s->offsets[block_num], bytes,
                          s->compressed_block, 0);
-        if (ret != bytes) {
+        if (ret < 0) {
             return -1;
         }
 
diff --git a/block/crypto.c b/block/crypto.c
index deec7fae2f..e7f5c4e31a 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -70,7 +70,7 @@ static ssize_t block_crypto_read_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return ret;
     }
-    return ret;
+    return buflen;
 }
 
 static ssize_t block_crypto_write_func(QCryptoBlock *block,
@@ -88,7 +88,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
     }
-    return ret;
+    return buflen;
 }
 
 
diff --git a/block/dmg.c b/block/dmg.c
index 5a460c3eb1..98db18d82a 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -390,7 +390,7 @@ static int dmg_read_plist_xml(BlockDriverState *bs, DmgHeaderState *ds,
     buffer = g_malloc(info_length + 1);
     buffer[info_length] = '\0';
     ret = bdrv_pread(bs->file, info_begin, info_length, buffer, 0);
-    if (ret != info_length) {
+    if (ret < 0) {
         ret = -EINVAL;
         goto fail;
     }
@@ -611,7 +611,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -637,7 +637,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -658,7 +658,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
              * inflated. */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->compressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
 
@@ -674,7 +674,7 @@ static inline int dmg_read_chunk(BlockDriverState *bs, uint64_t sector_num)
         case UDRW: /* copy */
             ret = bdrv_pread(bs->file, s->offsets[chunk], s->lengths[chunk],
                              s->uncompressed_chunk, 0);
-            if (ret != s->lengths[chunk]) {
+            if (ret < 0) {
                 return -1;
             }
             break;
diff --git a/block/io.c b/block/io.c
index d4a39b5569..86b5e8b471 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1100,7 +1100,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
 int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
                BdrvRequestFlags flags)
 {
-    int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
 
@@ -1108,9 +1107,7 @@ int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
         return -EINVAL;
     }
 
-    ret = bdrv_preadv(child, offset, bytes, &qiov, flags);
-
-    return ret < 0 ? ret : bytes;
+    return bdrv_preadv(child, offset, bytes, &qiov, flags);
 }
 
 /* Return no. of bytes on success or < 0 on error. Important errors are:
@@ -1122,7 +1119,6 @@ int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
 int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
                 const void *buf, BdrvRequestFlags flags)
 {
-    int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
 
@@ -1130,9 +1126,7 @@ int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
         return -EINVAL;
     }
 
-    ret = bdrv_pwritev(child, offset, bytes, &qiov, flags);
-
-    return ret < 0 ? ret : bytes;
+    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
 }
 
 /*
diff --git a/block/qcow.c b/block/qcow.c
index c94524b814..c646d6b16d 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -597,7 +597,7 @@ static int decompress_cluster(BlockDriverState *bs, uint64_t cluster_offset)
         csize &= (s->cluster_size - 1);
         BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
         ret = bdrv_pread(bs->file, coffset, csize, s->cluster_data, 0);
-        if (ret != csize)
+        if (ret < 0)
             return -1;
         if (decompress_buffer(s->cluster_cache, s->cluster_size,
                               s->cluster_data, csize) < 0) {
diff --git a/block/qcow2.c b/block/qcow2.c
index 5493e6b847..d5a1e8bc43 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -113,7 +113,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return ret;
+    return buflen;
 }
 
 
@@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return ret;
+    return buflen;
 }
 
 static QDict*
diff --git a/block/qed.c b/block/qed.c
index ba93e99570..55da91eb72 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -87,14 +87,9 @@ static void qed_header_cpu_to_le(const QEDHeader *cpu, QEDHeader *le)
 int qed_write_header_sync(BDRVQEDState *s)
 {
     QEDHeader le;
-    int ret;
 
     qed_header_cpu_to_le(&s->header, &le);
-    ret = bdrv_pwrite(s->bs->file, 0, sizeof(le), &le, 0);
-    if (ret != sizeof(le)) {
-        return ret;
-    }
-    return 0;
+    return bdrv_pwrite(s->bs->file, 0, sizeof(le), &le, 0);
 }
 
 /**
diff --git a/block/vdi.c b/block/vdi.c
index 9ef55a117a..a0be2a23b9 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -730,7 +730,7 @@ nonallocating_write:
                           n_sectors * SECTOR_SIZE, base, 0);
     }
 
-    return ret < 0 ? ret : 0;
+    return ret;
 }
 
 static int coroutine_fn vdi_co_do_create(BlockdevCreateOptions *create_options,
diff --git a/block/vmdk.c b/block/vmdk.c
index aacea1095f..332565c80f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -473,7 +473,6 @@ static int vmdk_parent_open(BlockDriverState *bs)
     if (ret < 0) {
         goto out;
     }
-    ret = 0;
 
     p_name = strstr(desc, "parentFileNameHint");
     if (p_name != NULL) {
@@ -905,7 +904,7 @@ static char *vmdk_read_desc(BdrvChild *file, uint64_t desc_offset, Error **errp)
         g_free(buf);
         return NULL;
     }
-    buf[ret] = 0;
+    buf[size] = 0;
 
     return buf;
 }
@@ -1630,7 +1629,7 @@ static int get_cluster_offset(BlockDriverState *bs,
                 l2_size_bytes,
                 l2_table,
                 0
-            ) != l2_size_bytes) {
+            ) < 0) {
         return VMDK_ERROR;
     }
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 49fb1ef1ea..a5c163af7e 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -89,7 +89,7 @@ static void test_sync_op_pread(BdrvChild *c)
 
     /* Success */
     ret = bdrv_pread(c, 0, sizeof(buf), buf, 0);
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = bdrv_pread(c, -2, sizeof(buf), buf, 0);
@@ -103,7 +103,7 @@ static void test_sync_op_pwrite(BdrvChild *c)
 
     /* Success */
     ret = bdrv_pwrite(c, 0, sizeof(buf), buf, 0);
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = bdrv_pwrite(c, -2, sizeof(buf), buf, 0);
-- 
2.35.3


