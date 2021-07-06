Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC063BC936
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:12:37 +0200 (CEST)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i4C-0005jt-Ex
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs7-0005ci-HP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs3-00017u-9f
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpOdXS6IWnRTQTmRoi+12pEKhmDZzyBVRhaBH2rAPwk=;
 b=gO8xtsKp6Ys4DGvc6zSGRSJiPo+tFUC84telBvsXUT5g4f5dhJZ5DRTBhsXdCW8/24TSYP
 x8lqOA2qignYtrhQH3nI3u9JGYJMztWYCh1ugprX1NZMJz2dEpwVhPbttL4uy29Es+UC79
 2bFPa3GYvF00Fj6aKodMSkHxyhjH4AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-2kB6rDkQPdy0WryYQsRbyg-1; Tue, 06 Jul 2021 06:00:00 -0400
X-MC-Unique: 2kB6rDkQPdy0WryYQsRbyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C5A362FA
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:59 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D6F85D6A1;
 Tue,  6 Jul 2021 09:59:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/18] crypto: add gnutls cipher provider
Date: Tue,  6 Jul 2021 10:59:20 +0100
Message-Id: <20210706095924.764117-15-berrange@redhat.com>
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

Add an implementation of the QEMU cipher APIs to the gnutls
crypto backend. XTS support is only available for gnutls
version >= 3.6.8. Since ECB mode is not exposed by gnutls
APIs, we can't use the private XTS code for compatibility.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-gnutls.c.inc | 325 +++++++++++++++++++++++++++++++++++++
 crypto/cipher.c            |   2 +
 2 files changed, 327 insertions(+)
 create mode 100644 crypto/cipher-gnutls.c.inc

diff --git a/crypto/cipher-gnutls.c.inc b/crypto/cipher-gnutls.c.inc
new file mode 100644
index 0000000000..eb6eb49546
--- /dev/null
+++ b/crypto/cipher-gnutls.c.inc
@@ -0,0 +1,325 @@
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
+        return true;
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


