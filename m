Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54E3BC8F3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:02:18 +0200 (CEST)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0huD-0007yY-QC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrw-00054T-C4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrp-00011O-Gj
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xk3L7KzTWNvUUp45tOVA/1BXYLgc5Y2eLB8dxlNjw9k=;
 b=es+ZRmYN4EZuudQadevlOitB6doMsBLrjjf8Il/w59KyadxmB/yXb+iT1nOhvYStZsEe84
 hL+ZEbXUD8lXCHDsUYQSC6NEt5qlQtICDiPayoFwhkVSlv8KjcrtWfaqM8kAO0aosUKwmN
 5aEVx4Ust0tHo6VRuFPe+hpafjrQTNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-nMJ5x9sROSSboh-DD6pQMA-1; Tue, 06 Jul 2021 05:59:46 -0400
X-MC-Unique: nMJ5x9sROSSboh-DD6pQMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54752362F9
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:45 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62AE25D6A1;
 Tue,  6 Jul 2021 09:59:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] crypto: drop custom XTS support in gcrypt driver
Date: Tue,  6 Jul 2021 10:59:13 +0100
Message-Id: <20210706095924.764117-8-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XTS cipher mode was introduced in gcrypt 1.8.0, which
matches QEMU's current minimum version.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-gcrypt.c.inc | 127 -------------------------------------
 meson.build                |  14 +---
 2 files changed, 1 insertion(+), 140 deletions(-)

diff --git a/crypto/cipher-gcrypt.c.inc b/crypto/cipher-gcrypt.c.inc
index 42d4137534..3aab08a1a9 100644
--- a/crypto/cipher-gcrypt.c.inc
+++ b/crypto/cipher-gcrypt.c.inc
@@ -18,10 +18,6 @@
  *
  */
 
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-#include "crypto/xts.h"
-#endif
-
 #include <gcrypt.h>
 
 bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
@@ -59,10 +55,6 @@ typedef struct QCryptoCipherGcrypt {
     QCryptoCipher base;
     gcry_cipher_hd_t handle;
     size_t blocksize;
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-    gcry_cipher_hd_t tweakhandle;
-    uint8_t iv[XTS_BLOCK_SIZE];
-#endif
 } QCryptoCipherGcrypt;
 
 
@@ -178,90 +170,6 @@ static const struct QCryptoCipherDriver qcrypto_gcrypt_ctr_driver = {
     .cipher_free = qcrypto_gcrypt_ctx_free,
 };
 
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-static void qcrypto_gcrypt_xts_ctx_free(QCryptoCipher *cipher)
-{
-    QCryptoCipherGcrypt *ctx = container_of(cipher, QCryptoCipherGcrypt, base);
-
-    gcry_cipher_close(ctx->tweakhandle);
-    qcrypto_gcrypt_ctx_free(cipher);
-}
-
-static void qcrypto_gcrypt_xts_wrape(const void *ctx, size_t length,
-                                     uint8_t *dst, const uint8_t *src)
-{
-    gcry_error_t err;
-    err = gcry_cipher_encrypt((gcry_cipher_hd_t)ctx, dst, length, src, length);
-    g_assert(err == 0);
-}
-
-static void qcrypto_gcrypt_xts_wrapd(const void *ctx, size_t length,
-                                     uint8_t *dst, const uint8_t *src)
-{
-    gcry_error_t err;
-    err = gcry_cipher_decrypt((gcry_cipher_hd_t)ctx, dst, length, src, length);
-    g_assert(err == 0);
-}
-
-static int qcrypto_gcrypt_xts_encrypt(QCryptoCipher *cipher, const void *in,
-                                      void *out, size_t len, Error **errp)
-{
-    QCryptoCipherGcrypt *ctx = container_of(cipher, QCryptoCipherGcrypt, base);
-
-    if (len & (ctx->blocksize - 1)) {
-        error_setg(errp, "Length %zu must be a multiple of block size %zu",
-                   len, ctx->blocksize);
-        return -1;
-    }
-
-    xts_encrypt(ctx->handle, ctx->tweakhandle,
-                qcrypto_gcrypt_xts_wrape, qcrypto_gcrypt_xts_wrapd,
-                ctx->iv, len, out, in);
-    return 0;
-}
-
-static int qcrypto_gcrypt_xts_decrypt(QCryptoCipher *cipher, const void *in,
-                                      void *out, size_t len, Error **errp)
-{
-    QCryptoCipherGcrypt *ctx = container_of(cipher, QCryptoCipherGcrypt, base);
-
-    if (len & (ctx->blocksize - 1)) {
-        error_setg(errp, "Length %zu must be a multiple of block size %zu",
-                   len, ctx->blocksize);
-        return -1;
-    }
-
-    xts_decrypt(ctx->handle, ctx->tweakhandle,
-                qcrypto_gcrypt_xts_wrape, qcrypto_gcrypt_xts_wrapd,
-                ctx->iv, len, out, in);
-    return 0;
-}
-
-static int qcrypto_gcrypt_xts_setiv(QCryptoCipher *cipher,
-                                    const uint8_t *iv, size_t niv,
-                                    Error **errp)
-{
-    QCryptoCipherGcrypt *ctx = container_of(cipher, QCryptoCipherGcrypt, base);
-
-    if (niv != ctx->blocksize) {
-        error_setg(errp, "Expected IV size %zu not %zu",
-                   ctx->blocksize, niv);
-        return -1;
-    }
-
-    memcpy(ctx->iv, iv, niv);
-    return 0;
-}
-
-static const struct QCryptoCipherDriver qcrypto_gcrypt_xts_driver = {
-    .cipher_encrypt = qcrypto_gcrypt_xts_encrypt,
-    .cipher_decrypt = qcrypto_gcrypt_xts_decrypt,
-    .cipher_setiv = qcrypto_gcrypt_xts_setiv,
-    .cipher_free = qcrypto_gcrypt_xts_ctx_free,
-};
-#endif /* CONFIG_QEMU_PRIVATE_XTS */
-
-
 static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
                                              QCryptoCipherMode mode,
                                              const uint8_t *key,
@@ -323,12 +231,7 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
         gcrymode = GCRY_CIPHER_MODE_ECB;
         break;
     case QCRYPTO_CIPHER_MODE_XTS:
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-        drv = &qcrypto_gcrypt_xts_driver;
-        gcrymode = GCRY_CIPHER_MODE_ECB;
-#else
         gcrymode = GCRY_CIPHER_MODE_XTS;
-#endif
         break;
     case QCRYPTO_CIPHER_MODE_CBC:
         gcrymode = GCRY_CIPHER_MODE_CBC;
@@ -354,23 +257,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     }
     ctx->blocksize = gcry_cipher_get_algo_blklen(gcryalg);
 
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-    if (mode == QCRYPTO_CIPHER_MODE_XTS) {
-        if (ctx->blocksize != XTS_BLOCK_SIZE) {
-            error_setg(errp,
-                       "Cipher block size %zu must equal XTS block size %d",
-		       ctx->blocksize, XTS_BLOCK_SIZE);
-            goto error;
-        }
-        err = gcry_cipher_open(&ctx->tweakhandle, gcryalg, gcrymode, 0);
-        if (err != 0) {
-            error_setg(errp, "Cannot initialize cipher: %s",
-                       gcry_strerror(err));
-            goto error;
-        }
-    }
-#endif
-
     if (alg == QCRYPTO_CIPHER_ALG_DES_RFB) {
         /* We're using standard DES cipher from gcrypt, so we need
          * to munge the key so that the results are the same as the
@@ -380,16 +266,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
         err = gcry_cipher_setkey(ctx->handle, rfbkey, nkey);
         g_free(rfbkey);
     } else {
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-        if (mode == QCRYPTO_CIPHER_MODE_XTS) {
-            nkey /= 2;
-            err = gcry_cipher_setkey(ctx->tweakhandle, key + nkey, nkey);
-            if (err != 0) {
-                error_setg(errp, "Cannot set key: %s", gcry_strerror(err));
-                goto error;
-            }
-        }
-#endif
         err = gcry_cipher_setkey(ctx->handle, key, nkey);
     }
     if (err != 0) {
@@ -400,9 +276,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     return &ctx->base;
 
  error:
-#ifdef CONFIG_QEMU_PRIVATE_XTS
-    gcry_cipher_close(ctx->tweakhandle);
-#endif
     gcry_cipher_close(ctx->handle);
     g_free(ctx);
     return NULL;
diff --git a/meson.build b/meson.build
index 945ae9c81d..2821edc0f5 100644
--- a/meson.build
+++ b/meson.build
@@ -838,16 +838,7 @@ if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
                          method: 'config-tool',
                          required: get_option('gcrypt'),
                          kwargs: static_kwargs)
-  if gcrypt.found() and cc.compiles('''
-    #include <gcrypt.h>
-    int main(void) {
-      gcry_cipher_hd_t handle;
-      gcry_cipher_open(&handle, GCRY_CIPHER_AES, GCRY_CIPHER_MODE_XTS, 0);
-      return 0;
-    }
-    ''', dependencies: gcrypt)
-    xts = 'gcrypt'
-  endif
+  xts = 'gcrypt'
   # Debian has removed -lgpg-error from libgcrypt-config
   # as it "spreads unnecessary dependencies" which in
   # turn breaks static builds...
@@ -2731,9 +2722,6 @@ summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    gnutls.found()}
 # TODO: add back version
 summary_info += {'libgcrypt':         gcrypt.found()}
-if gcrypt.found()
-   summary_info += {'  XTS':             xts != 'private'}
-endif
 # TODO: add back version
 summary_info += {'nettle':            nettle.found()}
 if nettle.found()
-- 
2.31.1


