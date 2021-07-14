Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DE3C85CC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:14:25 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fea-0000K7-9I
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fa5-0002ki-QA
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fa3-0006jd-5g
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHfMrtKP8qsKhWs9RV7wgA0BFU6cKeAAq4UM1pnDqgU=;
 b=XopIDgUdiJzdL2iIkA2NFkMSdng54lAZUzwcsr7m5YMkTR3NWoNsSeMKgZQ3pRrbx4Elwb
 R30rd8kSZKlFQUp7K/6cDvORPXVCqM0/j3yLrE0RNuIQmZpCsgsdCcTXNNYHf+arcyzWpt
 99tztRdugPhBiTHVhOEoTosTgkOEPag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-_Na8GD7EPwW9rnFA5yth8w-1; Wed, 14 Jul 2021 10:09:40 -0400
X-MC-Unique: _Na8GD7EPwW9rnFA5yth8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D643C1835AC2;
 Wed, 14 Jul 2021 14:09:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA8219C87;
 Wed, 14 Jul 2021 14:09:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] crypto: drop custom XTS support in gcrypt driver
Date: Wed, 14 Jul 2021 15:08:39 +0100
Message-Id: <20210714140858.2247409-8-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XTS cipher mode was introduced in gcrypt 1.8.0, which
matches QEMU's current minimum version.

Reviewed-by: Eric Blake <eblake@redhat.com>
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
index e7de68d795..a96c8b858c 100644
--- a/meson.build
+++ b/meson.build
@@ -843,16 +843,7 @@ if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
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
@@ -2970,9 +2961,6 @@ summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
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


