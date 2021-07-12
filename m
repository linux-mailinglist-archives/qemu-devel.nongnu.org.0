Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B93C5D4E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:31:22 +0200 (CEST)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w1p-0006Tc-1n
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vcg-0004rj-Nu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vcd-0006Xk-4J
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJsJepy7u8AlBnAfYO7q22R4Vl2jZ/ORFIodjxvAIt0=;
 b=JvrFf9vs5UErPZXv/xqyagabQ5TVzEe9LZboCve/1boUvxyKaiqhqKov24eUrRzLTX8Y0n
 ziMvwsPJAE/P7+Fh4KWlb07LrwdpbozmOYQ2NmxGf1yir5wTG23De74z2/EBAWfk1qVVaX
 SkotArg+xJJKVJivK0YSmMX4mPVfmSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-Ob2ax1ubPWOxXIqXqU0Usg-1; Mon, 12 Jul 2021 09:05:15 -0400
X-MC-Unique: Ob2ax1ubPWOxXIqXqU0Usg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E96910C1ADC;
 Mon, 12 Jul 2021 13:05:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25DED5C1D1;
 Mon, 12 Jul 2021 13:05:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] crypto: add gnutls cipher provider
Date: Mon, 12 Jul 2021 14:02:15 +0100
Message-Id: <20210712130223.1825930-15-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an implementation of the QEMU cipher APIs to the gnutls
crypto backend. XTS support is only available for gnutls
version >= 3.6.8. Since ECB mode is not exposed by gnutls
APIs, we can't use the private XTS code for compatibility.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-gnutls.c.inc | 324 +++++++++++++++++++++++++++++++++++++
 crypto/cipher.c            |   2 +
 2 files changed, 326 insertions(+)
 create mode 100644 crypto/cipher-gnutls.c.inc

diff --git a/crypto/cipher-gnutls.c.inc b/crypto/cipher-gnutls.c.inc
new file mode 100644
index 0000000000..b343adc7bc
--- /dev/null
+++ b/crypto/cipher-gnutls.c.inc
@@ -0,0 +1,324 @@
+/*
+ * QEMU Crypto cipher gnutls algorithms
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cipherpriv.h"
+
+#include <gnutls/crypto.h>
+
+#if GNUTLS_VERSION_NUMBER >= 0x030608
+#define QEMU_GNUTLS_XTS
+#endif
+
+bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
+                             QCryptoCipherMode mode)
+{
+
+    switch (mode) {
+    case QCRYPTO_CIPHER_MODE_ECB:
+    case QCRYPTO_CIPHER_MODE_CBC:
+        switch (alg) {
+        case QCRYPTO_CIPHER_ALG_AES_128:
+        case QCRYPTO_CIPHER_ALG_AES_192:
+        case QCRYPTO_CIPHER_ALG_AES_256:
+        case QCRYPTO_CIPHER_ALG_DES:
+        case QCRYPTO_CIPHER_ALG_3DES:
+            return true;
+        default:
+            return false;
+        }
+#ifdef QEMU_GNUTLS_XTS
+    case QCRYPTO_CIPHER_MODE_XTS:
+        switch (alg) {
+        case QCRYPTO_CIPHER_ALG_AES_128:
+        case QCRYPTO_CIPHER_ALG_AES_256:
+            return true;
+        default:
+            return false;
+        }
+#endif
+    default:
+        return false;
+    }
+}
+
+typedef struct QCryptoCipherGnutls QCryptoCipherGnutls;
+struct QCryptoCipherGnutls {
+    QCryptoCipher base;
+    gnutls_cipher_hd_t handle; /* XTS & CBC mode */
+    gnutls_cipher_algorithm_t galg; /* ECB mode */
+    guint8 *key; /* ECB mode */
+    size_t nkey; /* ECB mode */
+    size_t blocksize;
+};
+
+
+static void
+qcrypto_gnutls_cipher_free(QCryptoCipher *cipher)
+{
+    QCryptoCipherGnutls *ctx = container_of(cipher, QCryptoCipherGnutls, base);
+
+    g_free(ctx->key);
+    if (ctx->handle) {
+        gnutls_cipher_deinit(ctx->handle);
+    }
+    g_free(ctx);
+}
+
+
+static int
+qcrypto_gnutls_cipher_encrypt(QCryptoCipher *cipher,
+                              const void *in,
+                              void *out,
+                              size_t len,
+                              Error **errp)
+{
+    QCryptoCipherGnutls *ctx = container_of(cipher, QCryptoCipherGnutls, base);
+    int err;
+
+    if (len % ctx->blocksize) {
+        error_setg(errp, "Length %zu must be a multiple of block size %zu",
+                   len, ctx->blocksize);
+        return -1;
+    }
+
+    if (ctx->handle) { /* CBC / XTS mode */
+        err = gnutls_cipher_encrypt2(ctx->handle,
+                                     in, len,
+                                     out, len);
+        if (err != 0) {
+            error_setg(errp, "Cannot encrypt data: %s",
+                       gnutls_strerror(err));
+            return -1;
+        }
+    } else { /* ECB mode very inefficiently faked with CBC */
+        g_autofree unsigned char *iv = g_new0(unsigned char, ctx->blocksize);
+        while (len) {
+            gnutls_cipher_hd_t handle;
+            gnutls_datum_t gkey = { (unsigned char *)ctx->key, ctx->nkey };
+            int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
+            if (err != 0) {
+                error_setg(errp, "Cannot initialize cipher: %s",
+                           gnutls_strerror(err));
+                return -1;
+            }
+
+            gnutls_cipher_set_iv(handle, iv, ctx->blocksize);
+
+            err = gnutls_cipher_encrypt2(handle,
+                                         in, ctx->blocksize,
+                                         out, ctx->blocksize);
+            if (err != 0) {
+                gnutls_cipher_deinit(handle);
+                error_setg(errp, "Cannot encrypt data: %s",
+                           gnutls_strerror(err));
+                return -1;
+            }
+            gnutls_cipher_deinit(handle);
+
+            len -= ctx->blocksize;
+            in += ctx->blocksize;
+            out += ctx->blocksize;
+        }
+    }
+
+    return 0;
+}
+
+
+static int
+qcrypto_gnutls_cipher_decrypt(QCryptoCipher *cipher,
+                              const void *in,
+                              void *out,
+                              size_t len,
+                              Error **errp)
+{
+    QCryptoCipherGnutls *ctx = container_of(cipher, QCryptoCipherGnutls, base);
+    int err;
+
+    if (len % ctx->blocksize) {
+        error_setg(errp, "Length %zu must be a multiple of block size %zu",
+                   len, ctx->blocksize);
+        return -1;
+    }
+
+    if (ctx->handle) { /* CBC / XTS mode */
+        err = gnutls_cipher_decrypt2(ctx->handle,
+                                     in, len,
+                                     out, len);
+
+        if (err != 0) {
+            error_setg(errp, "Cannot decrypt data: %s",
+                       gnutls_strerror(err));
+            return -1;
+        }
+    } else { /* ECB mode very inefficiently faked with CBC */
+        g_autofree unsigned char *iv = g_new0(unsigned char, ctx->blocksize);
+        while (len) {
+            gnutls_cipher_hd_t handle;
+            gnutls_datum_t gkey = { (unsigned char *)ctx->key, ctx->nkey };
+            int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
+            if (err != 0) {
+                error_setg(errp, "Cannot initialize cipher: %s",
+                           gnutls_strerror(err));
+                return -1;
+            }
+
+            gnutls_cipher_set_iv(handle, iv, ctx->blocksize);
+
+            err = gnutls_cipher_decrypt2(handle,
+                                         in, ctx->blocksize,
+                                         out, ctx->blocksize);
+            if (err != 0) {
+                gnutls_cipher_deinit(handle);
+                error_setg(errp, "Cannot encrypt data: %s",
+                           gnutls_strerror(err));
+                return -1;
+            }
+            gnutls_cipher_deinit(handle);
+
+            len -= ctx->blocksize;
+            in += ctx->blocksize;
+            out += ctx->blocksize;
+        }
+    }
+
+    return 0;
+}
+
+static int
+qcrypto_gnutls_cipher_setiv(QCryptoCipher *cipher,
+                            const uint8_t *iv, size_t niv,
+                            Error **errp)
+{
+    QCryptoCipherGnutls *ctx = container_of(cipher, QCryptoCipherGnutls, base);
+
+    if (niv != ctx->blocksize) {
+        error_setg(errp, "Expected IV size %zu not %zu",
+                   ctx->blocksize, niv);
+        return -1;
+    }
+
+    gnutls_cipher_set_iv(ctx->handle, (unsigned char *)iv, niv);
+
+    return 0;
+}
+
+
+static struct QCryptoCipherDriver gnutls_driver = {
+    .cipher_encrypt = qcrypto_gnutls_cipher_encrypt,
+    .cipher_decrypt = qcrypto_gnutls_cipher_decrypt,
+    .cipher_setiv = qcrypto_gnutls_cipher_setiv,
+    .cipher_free = qcrypto_gnutls_cipher_free,
+};
+
+static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
+                                             QCryptoCipherMode mode,
+                                             const uint8_t *key,
+                                             size_t nkey,
+                                             Error **errp)
+{
+    QCryptoCipherGnutls *ctx;
+    gnutls_datum_t gkey = { (unsigned char *)key, nkey };
+    gnutls_cipher_algorithm_t galg = GNUTLS_CIPHER_UNKNOWN;
+    int err;
+
+    switch (mode) {
+#ifdef QEMU_GNUTLS_XTS
+    case QCRYPTO_CIPHER_MODE_XTS:
+        switch (alg) {
+        case QCRYPTO_CIPHER_ALG_AES_128:
+            galg = GNUTLS_CIPHER_AES_128_XTS;
+            break;
+        case QCRYPTO_CIPHER_ALG_AES_256:
+            galg = GNUTLS_CIPHER_AES_256_XTS;
+            break;
+        default:
+            break;
+        }
+        break;
+#endif
+
+    case QCRYPTO_CIPHER_MODE_ECB:
+    case QCRYPTO_CIPHER_MODE_CBC:
+        switch (alg) {
+        case QCRYPTO_CIPHER_ALG_AES_128:
+            galg = GNUTLS_CIPHER_AES_128_CBC;
+            break;
+        case QCRYPTO_CIPHER_ALG_AES_192:
+            galg = GNUTLS_CIPHER_AES_192_CBC;
+            break;
+        case QCRYPTO_CIPHER_ALG_AES_256:
+            galg = GNUTLS_CIPHER_AES_256_CBC;
+            break;
+        case QCRYPTO_CIPHER_ALG_DES:
+            galg = GNUTLS_CIPHER_DES_CBC;
+            break;
+        case QCRYPTO_CIPHER_ALG_3DES:
+            galg = GNUTLS_CIPHER_3DES_CBC;
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (galg == GNUTLS_CIPHER_UNKNOWN) {
+        error_setg(errp, "Unsupported cipher algorithm %s with %s mode",
+                   QCryptoCipherAlgorithm_str(alg),
+                   QCryptoCipherMode_str(mode));
+        return NULL;
+    }
+
+    if (!qcrypto_cipher_validate_key_length(alg, mode, nkey, errp)) {
+        return NULL;
+    }
+
+    ctx = g_new0(QCryptoCipherGnutls, 1);
+    ctx->base.driver = &gnutls_driver;
+
+    if (mode == QCRYPTO_CIPHER_MODE_ECB) {
+        ctx->key = g_new0(guint8, nkey);
+        memcpy(ctx->key, key, nkey);
+        ctx->nkey = nkey;
+        ctx->galg = galg;
+    } else {
+        err = gnutls_cipher_init(&ctx->handle, galg, &gkey, NULL);
+        if (err != 0) {
+            error_setg(errp, "Cannot initialize cipher: %s",
+                       gnutls_strerror(err));
+            goto error;
+        }
+    }
+
+    if (alg == QCRYPTO_CIPHER_ALG_DES ||
+        alg == QCRYPTO_CIPHER_ALG_3DES)
+        ctx->blocksize = 8;
+    else
+        ctx->blocksize = 16;
+
+    return &ctx->base;
+
+ error:
+    qcrypto_gnutls_cipher_free(&ctx->base);
+    return NULL;
+}
diff --git a/crypto/cipher.c b/crypto/cipher.c
index 1f5528be49..74b09a5b26 100644
--- a/crypto/cipher.c
+++ b/crypto/cipher.c
@@ -136,6 +136,8 @@ qcrypto_cipher_validate_key_length(QCryptoCipherAlgorithm alg,
 #include "cipher-gcrypt.c.inc"
 #elif defined CONFIG_NETTLE
 #include "cipher-nettle.c.inc"
+#elif defined CONFIG_GNUTLS_CRYPTO
+#include "cipher-gnutls.c.inc"
 #else
 #include "cipher-builtin.c.inc"
 #endif
-- 
2.31.1


