Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08D57223D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:11:43 +0200 (CEST)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKMI-0002DJ-EM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHR-0003Gn-H9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHG-0006Rx-2u
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyjFkgdDiBvAtIPcNxDUZwUhvhgRtb0+sGSaWsorI/o=;
 b=YWE08ljE6hp2FOXeja0F+v4cU/hw3XQe4gfvNyJBkKbyupnbZQHF2OKiF+jWkU1C0ODycC
 AifiQTeC2dOmC94U03Vs/kPWDSDLY/9M/xIA+57RQRvR8wJxW4gtyZ3a1tB4aJ3g7JdWds
 gUO8W8EUMSGWG26OHlBRpekPPmYh7r0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-SwQ0A07gMwKMrY7fC4wCcw-1; Tue, 12 Jul 2022 14:06:28 -0400
X-MC-Unique: SwQ0A07gMwKMrY7fC4wCcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAF0E811E76;
 Tue, 12 Jul 2022 18:06:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C968414A7E7;
 Tue, 12 Jul 2022 18:06:27 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 04/35] crypto: Make block callbacks return 0 on success
Date: Tue, 12 Jul 2022 20:05:46 +0200
Message-Id: <20220712180617.1362407-5-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

They currently return the value of their headerlen/buflen parameter on
success. Returning 0 instead makes it clear that short reads/writes are
not possible.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220609152744.3891847-5-afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/crypto/block.h         | 32 ++++++++++-----------
 block/crypto.c                 | 52 +++++++++++++++++-----------------
 block/qcow2.c                  | 22 +++++++-------
 crypto/block-luks.c            |  8 +++---
 crypto/block.c                 |  6 ++--
 tests/unit/test-crypto-block.c | 38 ++++++++++++-------------
 6 files changed, 79 insertions(+), 79 deletions(-)

diff --git a/include/crypto/block.h b/include/crypto/block.h
index 7a65e8e402..4f63a37872 100644
--- a/include/crypto/block.h
+++ b/include/crypto/block.h
@@ -29,24 +29,24 @@ typedef struct QCryptoBlock QCryptoBlock;
 /* See also QCryptoBlockFormat, QCryptoBlockCreateOptions
  * and QCryptoBlockOpenOptions in qapi/crypto.json */
 
-typedef ssize_t (*QCryptoBlockReadFunc)(QCryptoBlock *block,
-                                        size_t offset,
-                                        uint8_t *buf,
-                                        size_t buflen,
-                                        void *opaque,
-                                        Error **errp);
+typedef int (*QCryptoBlockReadFunc)(QCryptoBlock *block,
+                                    size_t offset,
+                                    uint8_t *buf,
+                                    size_t buflen,
+                                    void *opaque,
+                                    Error **errp);
 
-typedef ssize_t (*QCryptoBlockInitFunc)(QCryptoBlock *block,
-                                        size_t headerlen,
-                                        void *opaque,
-                                        Error **errp);
+typedef int (*QCryptoBlockInitFunc)(QCryptoBlock *block,
+                                    size_t headerlen,
+                                    void *opaque,
+                                    Error **errp);
 
-typedef ssize_t (*QCryptoBlockWriteFunc)(QCryptoBlock *block,
-                                         size_t offset,
-                                         const uint8_t *buf,
-                                         size_t buflen,
-                                         void *opaque,
-                                         Error **errp);
+typedef int (*QCryptoBlockWriteFunc)(QCryptoBlock *block,
+                                     size_t offset,
+                                     const uint8_t *buf,
+                                     size_t buflen,
+                                     void *opaque,
+                                     Error **errp);
 
 /**
  * qcrypto_block_has_format:
diff --git a/block/crypto.c b/block/crypto.c
index e7f5c4e31a..11c3ddbc73 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -55,12 +55,12 @@ static int block_crypto_probe_generic(QCryptoBlockFormat format,
 }
 
 
-static ssize_t block_crypto_read_func(QCryptoBlock *block,
-                                      size_t offset,
-                                      uint8_t *buf,
-                                      size_t buflen,
-                                      void *opaque,
-                                      Error **errp)
+static int block_crypto_read_func(QCryptoBlock *block,
+                                  size_t offset,
+                                  uint8_t *buf,
+                                  size_t buflen,
+                                  void *opaque,
+                                  Error **errp)
 {
     BlockDriverState *bs = opaque;
     ssize_t ret;
@@ -70,15 +70,15 @@ static ssize_t block_crypto_read_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return ret;
     }
-    return buflen;
+    return 0;
 }
 
-static ssize_t block_crypto_write_func(QCryptoBlock *block,
-                                       size_t offset,
-                                       const uint8_t *buf,
-                                       size_t buflen,
-                                       void *opaque,
-                                       Error **errp)
+static int block_crypto_write_func(QCryptoBlock *block,
+                                   size_t offset,
+                                   const uint8_t *buf,
+                                   size_t buflen,
+                                   void *opaque,
+                                   Error **errp)
 {
     BlockDriverState *bs = opaque;
     ssize_t ret;
@@ -88,7 +88,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
     }
-    return buflen;
+    return 0;
 }
 
 
@@ -99,12 +99,12 @@ struct BlockCryptoCreateData {
 };
 
 
-static ssize_t block_crypto_create_write_func(QCryptoBlock *block,
-                                              size_t offset,
-                                              const uint8_t *buf,
-                                              size_t buflen,
-                                              void *opaque,
-                                              Error **errp)
+static int block_crypto_create_write_func(QCryptoBlock *block,
+                                          size_t offset,
+                                          const uint8_t *buf,
+                                          size_t buflen,
+                                          void *opaque,
+                                          Error **errp)
 {
     struct BlockCryptoCreateData *data = opaque;
     ssize_t ret;
@@ -114,13 +114,13 @@ static ssize_t block_crypto_create_write_func(QCryptoBlock *block,
         error_setg_errno(errp, -ret, "Could not write encryption header");
         return ret;
     }
-    return ret;
+    return 0;
 }
 
-static ssize_t block_crypto_create_init_func(QCryptoBlock *block,
-                                             size_t headerlen,
-                                             void *opaque,
-                                             Error **errp)
+static int block_crypto_create_init_func(QCryptoBlock *block,
+                                         size_t headerlen,
+                                         void *opaque,
+                                         Error **errp)
 {
     struct BlockCryptoCreateData *data = opaque;
     Error *local_error = NULL;
@@ -139,7 +139,7 @@ static ssize_t block_crypto_create_init_func(QCryptoBlock *block,
                        data->prealloc, 0, &local_error);
 
     if (ret >= 0) {
-        return ret;
+        return 0;
     }
 
 error:
diff --git a/block/qcow2.c b/block/qcow2.c
index d5a1e8bc43..c43238a006 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -94,9 +94,9 @@ static int qcow2_probe(const uint8_t *buf, int buf_size, const char *filename)
 }
 
 
-static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
-                                          uint8_t *buf, size_t buflen,
-                                          void *opaque, Error **errp)
+static int qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
+                                      uint8_t *buf, size_t buflen,
+                                      void *opaque, Error **errp)
 {
     BlockDriverState *bs = opaque;
     BDRVQcow2State *s = bs->opaque;
@@ -113,12 +113,12 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return buflen;
+    return 0;
 }
 
 
-static ssize_t qcow2_crypto_hdr_init_func(QCryptoBlock *block, size_t headerlen,
-                                          void *opaque, Error **errp)
+static int qcow2_crypto_hdr_init_func(QCryptoBlock *block, size_t headerlen,
+                                      void *opaque, Error **errp)
 {
     BlockDriverState *bs = opaque;
     BDRVQcow2State *s = bs->opaque;
@@ -151,13 +151,13 @@ static ssize_t qcow2_crypto_hdr_init_func(QCryptoBlock *block, size_t headerlen,
         return -1;
     }
 
-    return ret;
+    return 0;
 }
 
 
-static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
-                                           const uint8_t *buf, size_t buflen,
-                                           void *opaque, Error **errp)
+static int qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
+                                       const uint8_t *buf, size_t buflen,
+                                       void *opaque, Error **errp)
 {
     BlockDriverState *bs = opaque;
     BDRVQcow2State *s = bs->opaque;
@@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
         error_setg_errno(errp, -ret, "Could not read encryption header");
         return -1;
     }
-    return buflen;
+    return 0;
 }
 
 static QDict*
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index fe8f04ffb2..f62be6836b 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -495,7 +495,7 @@ qcrypto_block_luks_load_header(QCryptoBlock *block,
                                 void *opaque,
                                 Error **errp)
 {
-    ssize_t rv;
+    int rv;
     size_t i;
     QCryptoBlockLUKS *luks = block->opaque;
 
@@ -856,7 +856,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,
                   QCRYPTO_BLOCK_LUKS_SECTOR_SIZE,
                   splitkey, splitkeylen,
                   opaque,
-                  errp) != splitkeylen) {
+                  errp) < 0) {
         goto cleanup;
     }
 
@@ -903,7 +903,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
     g_autofree uint8_t *splitkey = NULL;
     size_t splitkeylen;
     g_autofree uint8_t *possiblekey = NULL;
-    ssize_t rv;
+    int rv;
     g_autoptr(QCryptoCipher) cipher = NULL;
     uint8_t keydigest[QCRYPTO_BLOCK_LUKS_DIGEST_LEN];
     g_autoptr(QCryptoIVGen) ivgen = NULL;
@@ -1193,7 +1193,7 @@ qcrypto_block_luks_erase_key(QCryptoBlock *block,
                       garbagesplitkey,
                       splitkeylen,
                       opaque,
-                      &local_err) != splitkeylen) {
+                      &local_err) < 0) {
             error_propagate(errp, local_err);
             return -1;
         }
diff --git a/crypto/block.c b/crypto/block.c
index eb057948b5..7bb4b74a37 100644
--- a/crypto/block.c
+++ b/crypto/block.c
@@ -115,7 +115,7 @@ QCryptoBlock *qcrypto_block_create(QCryptoBlockCreateOptions *options,
 }
 
 
-static ssize_t qcrypto_block_headerlen_hdr_init_func(QCryptoBlock *block,
+static int qcrypto_block_headerlen_hdr_init_func(QCryptoBlock *block,
         size_t headerlen, void *opaque, Error **errp)
 {
     size_t *headerlenp = opaque;
@@ -126,12 +126,12 @@ static ssize_t qcrypto_block_headerlen_hdr_init_func(QCryptoBlock *block,
 }
 
 
-static ssize_t qcrypto_block_headerlen_hdr_write_func(QCryptoBlock *block,
+static int qcrypto_block_headerlen_hdr_write_func(QCryptoBlock *block,
         size_t offset, const uint8_t *buf, size_t buflen,
         void *opaque, Error **errp)
 {
     /* Discard the bytes, we're not actually writing to an image */
-    return buflen;
+    return 0;
 }
 
 
diff --git a/tests/unit/test-crypto-block.c b/tests/unit/test-crypto-block.c
index 3b1f0d509f..3417b67be5 100644
--- a/tests/unit/test-crypto-block.c
+++ b/tests/unit/test-crypto-block.c
@@ -188,12 +188,12 @@ static struct QCryptoBlockTestData {
 };
 
 
-static ssize_t test_block_read_func(QCryptoBlock *block,
-                                    size_t offset,
-                                    uint8_t *buf,
-                                    size_t buflen,
-                                    void *opaque,
-                                    Error **errp)
+static int test_block_read_func(QCryptoBlock *block,
+                                size_t offset,
+                                uint8_t *buf,
+                                size_t buflen,
+                                void *opaque,
+                                Error **errp)
 {
     Buffer *header = opaque;
 
@@ -201,14 +201,14 @@ static ssize_t test_block_read_func(QCryptoBlock *block,
 
     memcpy(buf, header->buffer + offset, buflen);
 
-    return buflen;
+    return 0;
 }
 
 
-static ssize_t test_block_init_func(QCryptoBlock *block,
-                                    size_t headerlen,
-                                    void *opaque,
-                                    Error **errp)
+static int test_block_init_func(QCryptoBlock *block,
+                                size_t headerlen,
+                                void *opaque,
+                                Error **errp)
 {
     Buffer *header = opaque;
 
@@ -216,16 +216,16 @@ static ssize_t test_block_init_func(QCryptoBlock *block,
 
     buffer_reserve(header, headerlen);
 
-    return headerlen;
+    return 0;
 }
 
 
-static ssize_t test_block_write_func(QCryptoBlock *block,
-                                     size_t offset,
-                                     const uint8_t *buf,
-                                     size_t buflen,
-                                     void *opaque,
-                                     Error **errp)
+static int test_block_write_func(QCryptoBlock *block,
+                                 size_t offset,
+                                 const uint8_t *buf,
+                                 size_t buflen,
+                                 void *opaque,
+                                 Error **errp)
 {
     Buffer *header = opaque;
 
@@ -234,7 +234,7 @@ static ssize_t test_block_write_func(QCryptoBlock *block,
     memcpy(header->buffer + offset, buf, buflen);
     header->offset = offset + buflen;
 
-    return buflen;
+    return 0;
 }
 
 
-- 
2.35.3


