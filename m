Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973573C85EB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:17:57 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fi0-0007XQ-LG
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3faN-0003V8-0e
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3faK-0006vj-3W
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1Wq8HxVURS9jmIQccCvK7NmEc6zsZtIpHC7fJgIgEk=;
 b=DPMwUlZcTJo6jp8duDFfsFruQk9qIn7z+DWiwvGjB8F5RPncB/GOj59RWMMlxBshJqXbDj
 KzkCLkBc4/59d0jP9JXLoq8Dsd9GGXBOAy3HTZmnWIo61bVStC5ExGjEAAgikmx1sjaqDo
 FyXhcQxaW3nZpR9CFHHsGciFtno6dd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-QTLYpB22OrS41f4x08cbqw-1; Wed, 14 Jul 2021 10:09:58 -0400
X-MC-Unique: QTLYpB22OrS41f4x08cbqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1394F804144;
 Wed, 14 Jul 2021 14:09:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48CAD69CB4;
 Wed, 14 Jul 2021 14:09:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] crypto: delete built-in XTS cipher mode support
Date: Wed, 14 Jul 2021 15:08:42 +0100
Message-Id: <20210714140858.2247409-11-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

The built-in AES+XTS implementation is used for the LUKS encryption
When building system emulators it is reasonable to expect that an
external crypto library is being used instead. The performance of the
builtin XTS implementation is terrible as it has no CPU acceleration
support. It is thus not worth keeping a home grown XTS implementation
for the built-in cipher backend.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-builtin.c.inc | 60 -------------------------------------
 crypto/meson.build          |  6 ++--
 meson.build                 |  7 ++---
 3 files changed, 6 insertions(+), 67 deletions(-)

diff --git a/crypto/cipher-builtin.c.inc b/crypto/cipher-builtin.c.inc
index 70743f253c..b409089095 100644
--- a/crypto/cipher-builtin.c.inc
+++ b/crypto/cipher-builtin.c.inc
@@ -19,7 +19,6 @@
  */
 
 #include "crypto/aes.h"
-#include "crypto/xts.h"
 
 typedef struct QCryptoCipherBuiltinAESContext QCryptoCipherBuiltinAESContext;
 struct QCryptoCipherBuiltinAESContext {
@@ -31,7 +30,6 @@ typedef struct QCryptoCipherBuiltinAES QCryptoCipherBuiltinAES;
 struct QCryptoCipherBuiltinAES {
     QCryptoCipher base;
     QCryptoCipherBuiltinAESContext key;
-    QCryptoCipherBuiltinAESContext key_tweak;
     uint8_t iv[AES_BLOCK_SIZE];
 };
 
@@ -193,39 +191,6 @@ static int qcrypto_cipher_aes_decrypt_cbc(QCryptoCipher *cipher,
     return 0;
 }
 
-static int qcrypto_cipher_aes_encrypt_xts(QCryptoCipher *cipher,
-                                          const void *in, void *out,
-                                          size_t len, Error **errp)
-{
-    QCryptoCipherBuiltinAES *ctx
-        = container_of(cipher, QCryptoCipherBuiltinAES, base);
-
-    if (!qcrypto_length_check(len, AES_BLOCK_SIZE, errp)) {
-        return -1;
-    }
-    xts_encrypt(&ctx->key, &ctx->key_tweak,
-                do_aes_encrypt_ecb, do_aes_decrypt_ecb,
-                ctx->iv, len, out, in);
-    return 0;
-}
-
-static int qcrypto_cipher_aes_decrypt_xts(QCryptoCipher *cipher,
-                                          const void *in, void *out,
-                                          size_t len, Error **errp)
-{
-    QCryptoCipherBuiltinAES *ctx
-        = container_of(cipher, QCryptoCipherBuiltinAES, base);
-
-    if (!qcrypto_length_check(len, AES_BLOCK_SIZE, errp)) {
-        return -1;
-    }
-    xts_decrypt(&ctx->key, &ctx->key_tweak,
-                do_aes_encrypt_ecb, do_aes_decrypt_ecb,
-                ctx->iv, len, out, in);
-    return 0;
-}
-
-
 static int qcrypto_cipher_aes_setiv(QCryptoCipher *cipher, const uint8_t *iv,
                              size_t niv, Error **errp)
 {
@@ -256,14 +221,6 @@ static const struct QCryptoCipherDriver qcrypto_cipher_aes_driver_cbc = {
     .cipher_free = qcrypto_cipher_ctx_free,
 };
 
-static const struct QCryptoCipherDriver qcrypto_cipher_aes_driver_xts = {
-    .cipher_encrypt = qcrypto_cipher_aes_encrypt_xts,
-    .cipher_decrypt = qcrypto_cipher_aes_decrypt_xts,
-    .cipher_setiv = qcrypto_cipher_aes_setiv,
-    .cipher_free = qcrypto_cipher_ctx_free,
-};
-
-
 bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
                              QCryptoCipherMode mode)
 {
@@ -274,7 +231,6 @@ bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
         switch (mode) {
         case QCRYPTO_CIPHER_MODE_ECB:
         case QCRYPTO_CIPHER_MODE_CBC:
-        case QCRYPTO_CIPHER_MODE_XTS:
             return true;
         default:
             return false;
@@ -310,9 +266,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
             case QCRYPTO_CIPHER_MODE_CBC:
                 drv = &qcrypto_cipher_aes_driver_cbc;
                 break;
-            case QCRYPTO_CIPHER_MODE_XTS:
-                drv = &qcrypto_cipher_aes_driver_xts;
-                break;
             default:
                 goto bad_mode;
             }
@@ -320,19 +273,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
             ctx = g_new0(QCryptoCipherBuiltinAES, 1);
             ctx->base.driver = drv;
 
-            if (mode == QCRYPTO_CIPHER_MODE_XTS) {
-                nkey /= 2;
-                if (AES_set_encrypt_key(key + nkey, nkey * 8,
-                                        &ctx->key_tweak.enc)) {
-                    error_setg(errp, "Failed to set encryption key");
-                    goto error;
-                }
-                if (AES_set_decrypt_key(key + nkey, nkey * 8,
-                                        &ctx->key_tweak.dec)) {
-                    error_setg(errp, "Failed to set decryption key");
-                    goto error;
-                }
-            }
             if (AES_set_encrypt_key(key, nkey * 8, &ctx->key.enc)) {
                 error_setg(errp, "Failed to set encryption key");
                 goto error;
diff --git a/crypto/meson.build b/crypto/meson.build
index b384ca8b57..fc8de287e1 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -23,14 +23,14 @@ crypto_ss.add(files(
 
 if nettle.found()
   crypto_ss.add(nettle, files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
+  if xts == 'private'
+    crypto_ss.add(files('xts.c'))
+  endif
 elif gcrypt.found()
   crypto_ss.add(gcrypt, files('hash-gcrypt.c', 'hmac-gcrypt.c', 'pbkdf-gcrypt.c'))
 else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
-if xts == 'private'
-  crypto_ss.add(files('xts.c'))
-endif
 
 crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: files('secret_keyring.c'))
 crypto_ss.add(when: 'CONFIG_AF_ALG', if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
diff --git a/meson.build b/meson.build
index a96c8b858c..8f899e1e9b 100644
--- a/meson.build
+++ b/meson.build
@@ -826,7 +826,7 @@ endif
 # Nettle has priority over gcrypt
 gcrypt = not_found
 nettle = not_found
-xts = 'private'
+xts = 'none'
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
   error('Only one of gcrypt & nettle can be enabled')
 elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt').enabled()
@@ -834,8 +834,8 @@ elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt
                       method: 'pkg-config',
                       required: get_option('nettle'),
                       kwargs: static_kwargs)
-  if nettle.found() and cc.has_header('nettle/xts.h', dependencies: nettle)
-    xts = 'nettle'
+  if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
+    xts = 'private'
   endif
 endif
 if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
@@ -843,7 +843,6 @@ if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
                          method: 'config-tool',
                          required: get_option('gcrypt'),
                          kwargs: static_kwargs)
-  xts = 'gcrypt'
   # Debian has removed -lgpg-error from libgcrypt-config
   # as it "spreads unnecessary dependencies" which in
   # turn breaks static builds...
-- 
2.31.1


