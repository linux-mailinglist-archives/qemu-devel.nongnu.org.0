Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C62526DBB
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 03:13:12 +0200 (CEST)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npgLH-0000Z1-Ss
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 21:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg8H-0001r8-VO
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg8E-0008SU-FS
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:45 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y41so9059009pfw.12
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHp6x+RgUf91v2PU6qOPT3X3oTasdELFvgG0EyiPvfA=;
 b=QnRRCJuXB+5/Xgvqohh6L6EEKjByUBV25iI52o8QhBW6HKcANQ8kQqDeLHCOCQX6Mj
 +/Xn0GdlyyPXfR3Fplggv1WLo1Z4f8dqrPqAZp0N1UA8TSdlidtgEFCcoMK3S8zNsvVz
 9CnhdbWbwIoJaWFAT1lY4Uzr/vKoE0+1jb4KbI7OWQtVUZMI4aGrsiHaTIlRG+Qm0TDD
 FVxKPx0jjZ7BIoRwrFWh0cGQvHpVFFdotRrugReUNUZO7IjVV3TsM5sIVLav5PC6Lf1P
 Agj+bDRq89WYulgK+Wl/7ZVbYl3CPVSNCC7YeHL3IZub6F22e3+AWmpiZTu6MazQEJ+z
 5fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHp6x+RgUf91v2PU6qOPT3X3oTasdELFvgG0EyiPvfA=;
 b=Bep6fhPornZxzT7ArvlR336F4i6aZSuGbq+9nhFyvib0KtIdQ1ygPQF716FHIVhUDx
 RFCjxgZ4u3hYtao92nXE1RctuYeaXAfNn55fVFLPElhmzASM+CfBomi24Y2L88SxQt+p
 vRwsP3OAj+gyGATOv9WF8mxhsmmTuATSgVmQRPKiaHbwIaDD8YHjffaQNYsA3ZRMNhTQ
 Ui75y6PGyy4pE57nZ0ezEEMZXUQ28WThGghwLt0n5SGgmte+PiDVHtty0KF16k3vCIRW
 AmRK7uYOH3s13rgId/MHTTOHclKlbGHI6Oq0MM8foM0aijKyDtVv0EQhju04aMZyUM//
 z1eg==
X-Gm-Message-State: AOAM533bT1ui0qH9iPLxZOIMYrxvAPYt15NhhnRKV9JKuwJzyM5jgv45
 NcRkUD569Z9eLiLy+F++Ytc4wA==
X-Google-Smtp-Source: ABdhPJxSk257YKPMX0Axk2NrCj4EnFXO3vLtWNu4sDlBhEoqXZDuWspCKJDLZfQdsuNgYo1LIL6efQ==
X-Received: by 2002:a63:8442:0:b0:3c6:4271:cad with SMTP id
 k63-20020a638442000000b003c642710cadmr6133198pgd.275.1652489979985; 
 Fri, 13 May 2022 17:59:39 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b0015e8d4eb1dbsm2466125plr.37.2022.05.13.17.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 17:59:39 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, pizhenwei@bytedance.com, cohuck@redhat.com
Subject: [PATCH v6 5/9] crypto: Implement RSA algorithm by hogweed
Date: Sat, 14 May 2022 08:55:00 +0800
Message-Id: <20220514005504.1042884-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514005504.1042884-1-pizhenwei@bytedance.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Lei He <helei.sig11@bytedance.com>

Implement RSA algorithm by hogweed from nettle. Thus QEMU supports
a 'real' RSA backend to handle request from guest side. It's
important to test RSA offload case without OS & hardware requirement.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 crypto/akcipher-nettle.c.inc | 451 +++++++++++++++++++++++++++++++++++
 crypto/akcipher.c            |   4 +
 crypto/meson.build           |   4 +
 crypto/rsakey-builtin.c.inc  | 200 ++++++++++++++++
 crypto/rsakey-nettle.c.inc   | 158 ++++++++++++
 crypto/rsakey.c              |  44 ++++
 crypto/rsakey.h              |  94 ++++++++
 meson.build                  |  11 +
 8 files changed, 966 insertions(+)
 create mode 100644 crypto/akcipher-nettle.c.inc
 create mode 100644 crypto/rsakey-builtin.c.inc
 create mode 100644 crypto/rsakey-nettle.c.inc
 create mode 100644 crypto/rsakey.c
 create mode 100644 crypto/rsakey.h

diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
new file mode 100644
index 0000000000..0796bddcaa
--- /dev/null
+++ b/crypto/akcipher-nettle.c.inc
@@ -0,0 +1,451 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
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
+#include <nettle/rsa.h>
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "crypto/akcipher.h"
+#include "crypto/random.h"
+#include "qapi/error.h"
+#include "sysemu/cryptodev.h"
+#include "rsakey.h"
+
+typedef struct QCryptoNettleRSA {
+    QCryptoAkCipher akcipher;
+    struct rsa_public_key pub;
+    struct rsa_private_key priv;
+    QCryptoRSAPaddingAlgorithm padding_alg;
+    QCryptoHashAlgorithm hash_alg;
+} QCryptoNettleRSA;
+
+static void qcrypto_nettle_rsa_free(QCryptoAkCipher *akcipher)
+{
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
+    if (!rsa) {
+        return;
+    }
+
+    rsa_public_key_clear(&rsa->pub);
+    rsa_private_key_clear(&rsa->priv);
+    g_free(rsa);
+}
+
+static QCryptoAkCipher *qcrypto_nettle_rsa_new(
+    const QCryptoAkCipherOptionsRSA *opt,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key,  size_t keylen,
+    Error **errp);
+
+QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
+                                      QCryptoAkCipherKeyType type,
+                                      const uint8_t *key, size_t keylen,
+                                      Error **errp)
+{
+    switch (opts->alg) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        return qcrypto_nettle_rsa_new(&opts->u.rsa, type, key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", opts->alg);
+        return NULL;
+    }
+
+    return NULL;
+}
+
+static void qcrypto_nettle_rsa_set_akcipher_size(QCryptoAkCipher *akcipher,
+                                                 int key_size)
+{
+    akcipher->max_plaintext_len = key_size;
+    akcipher->max_ciphertext_len = key_size;
+    akcipher->max_signature_len = key_size;
+    akcipher->max_dgst_len = key_size;
+}
+
+static int qcrypt_nettle_parse_rsa_private_key(QCryptoNettleRSA *rsa,
+                                               const uint8_t *key,
+                                               size_t keylen,
+                                               Error **errp)
+{
+    g_autoptr(QCryptoAkCipherRSAKey) rsa_key = qcrypto_akcipher_rsakey_parse(
+        QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE, key, keylen, errp);
+
+    if (!rsa_key) {
+        return -1;
+    }
+
+    nettle_mpz_init_set_str_256_u(rsa->pub.n, rsa_key->n.len, rsa_key->n.data);
+    nettle_mpz_init_set_str_256_u(rsa->pub.e, rsa_key->e.len, rsa_key->e.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.d, rsa_key->d.len, rsa_key->d.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.p, rsa_key->p.len, rsa_key->p.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.q, rsa_key->q.len, rsa_key->q.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.a, rsa_key->dp.len,
+                                  rsa_key->dp.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.b, rsa_key->dq.len,
+                                  rsa_key->dq.data);
+    nettle_mpz_init_set_str_256_u(rsa->priv.c, rsa_key->u.len, rsa_key->u.data);
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        error_setg(errp, "Failed to check RSA key");
+        return -1;
+    }
+
+    /**
+     * Since in the kernel's unit test, the p, q, a, b, c of some
+     * private keys is 0, only the simplest length check is done here
+     */
+    if (rsa_key->p.len > 1 &&
+        rsa_key->q.len > 1 &&
+        rsa_key->dp.len > 1 &&
+        rsa_key->dq.len > 1 &&
+        rsa_key->u.len > 1) {
+        if (!rsa_private_key_prepare(&rsa->priv)) {
+            error_setg(errp, "Failed to check RSA key");
+            return -1;
+        }
+    } else {
+        rsa->priv.size = rsa->pub.size;
+    }
+    qcrypto_nettle_rsa_set_akcipher_size(
+        (QCryptoAkCipher *)rsa, rsa->priv.size);
+
+    return 0;
+}
+
+static int qcrypt_nettle_parse_rsa_public_key(QCryptoNettleRSA *rsa,
+                                              const uint8_t *key,
+                                              size_t keylen,
+                                              Error **errp)
+{
+    g_autoptr(QCryptoAkCipherRSAKey) rsa_key = qcrypto_akcipher_rsakey_parse(
+        QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC, key, keylen, errp);
+
+    if (!rsa_key) {
+        return -1;
+    }
+    nettle_mpz_init_set_str_256_u(rsa->pub.n, rsa_key->n.len, rsa_key->n.data);
+    nettle_mpz_init_set_str_256_u(rsa->pub.e, rsa_key->e.len, rsa_key->e.data);
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        error_setg(errp, "Failed to check RSA key");
+        return -1;
+    }
+    qcrypto_nettle_rsa_set_akcipher_size(
+        (QCryptoAkCipher *)rsa, rsa->pub.size);
+
+    return 0;
+}
+
+static void wrap_nettle_random_func(void *ctx, size_t len, uint8_t *out)
+{
+    qcrypto_random_bytes(out, len, &error_abort);
+}
+
+static int qcrypto_nettle_rsa_encrypt(QCryptoAkCipher *akcipher,
+                                      const void *data, size_t data_len,
+                                      void *enc, size_t enc_len,
+                                      Error **errp)
+{
+
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
+    mpz_t c;
+    int ret = -1;
+
+    if (data_len > rsa->pub.size) {
+        error_setg(errp, "Plaintext length should be less than key size: %lu",
+                   rsa->pub.size);
+        return ret;
+    }
+
+    if (enc_len < rsa->pub.size) {
+        error_setg(errp, "Ciphertext buffer length cannot less than "
+                         "key size: %lu", rsa->pub.size);
+        return ret;
+    }
+
+    /* Nettle do not support RSA encryption without any padding */
+    switch (rsa->padding_alg) {
+    case QCRYPTO_RSA_PADDING_ALG_RAW:
+        error_setg(errp, "RSA with raw padding is not supported");
+        break;
+
+    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        mpz_init(c);
+        if (rsa_encrypt(&rsa->pub, NULL, wrap_nettle_random_func,
+                        data_len, (uint8_t *)data, c) != 1) {
+            error_setg(errp, "Failed to encrypt");
+        } else {
+            nettle_mpz_get_str_256(enc_len, (uint8_t *)enc, c);
+            ret = nettle_mpz_sizeinbase_256_u(c);
+        }
+        mpz_clear(c);
+        break;
+
+    default:
+        error_setg(errp, "Unknown padding");
+    }
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_decrypt(QCryptoAkCipher *akcipher,
+                                      const void *enc, size_t enc_len,
+                                      void *data, size_t data_len,
+                                      Error **errp)
+{
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
+    mpz_t c;
+    int ret = -1;
+
+    if (enc_len > rsa->priv.size) {
+        error_setg(errp, "Ciphertext length is greater than key size: %lu",
+                   rsa->priv.size);
+        return ret;
+    }
+
+    switch (rsa->padding_alg) {
+    case QCRYPTO_RSA_PADDING_ALG_RAW:
+        error_setg(errp, "RSA with raw padding is not supported");
+        break;
+
+    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        nettle_mpz_init_set_str_256_u(c, enc_len, enc);
+        if (!rsa_decrypt(&rsa->priv, &data_len, (uint8_t *)data, c)) {
+            error_setg(errp, "Failed to decrypt");
+        } else {
+            ret = data_len;
+        }
+
+        mpz_clear(c);
+        break;
+
+    default:
+        error_setg(errp, "Unknown padding algorithm: %d", rsa->padding_alg);
+    }
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_sign(QCryptoAkCipher *akcipher,
+                                   const void *data, size_t data_len,
+                                   void *sig, size_t sig_len, Error **errp)
+{
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
+    int ret = -1, rv;
+    mpz_t s;
+
+    /**
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        error_setg(errp, "Try to make signature without padding");
+        return ret;
+    }
+
+    if (data_len > rsa->priv.size) {
+        error_setg(errp, "Data length is greater than key size: %lu",
+                   rsa->priv.size);
+        return ret;
+    }
+
+    if (sig_len < rsa->priv.size) {
+        error_setg(errp, "Signature buffer length cannot less than "
+                         "key size: %lu", rsa->priv.size);
+        return ret;
+    }
+
+    mpz_init(s);
+    switch (rsa->hash_alg) {
+    case QCRYPTO_HASH_ALG_MD5:
+        rv = rsa_md5_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA1:
+        rv = rsa_sha1_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA256:
+        rv = rsa_sha256_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA512:
+        rv = rsa_sha512_sign_digest(&rsa->priv, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unknown hash algorithm: %d", rsa->hash_alg);
+        goto cleanup;
+    }
+
+    if (rv != 1) {
+        error_setg(errp, "Failed to make signature");
+        goto cleanup;
+    }
+    nettle_mpz_get_str_256(sig_len, (uint8_t *)sig, s);
+    ret = nettle_mpz_sizeinbase_256_u(s);
+
+cleanup:
+    mpz_clear(s);
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_verify(QCryptoAkCipher *akcipher,
+                                     const void *sig, size_t sig_len,
+                                     const void *data, size_t data_len,
+                                     Error **errp)
+{
+    QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
+
+    int ret = -1, rv;
+    mpz_t s;
+
+    /**
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        error_setg(errp, "Try to verify signature without padding");
+        return ret;
+    }
+    if (data_len > rsa->pub.size) {
+        error_setg(errp, "Data length is greater than key size: %lu",
+                   rsa->pub.size);
+        return ret;
+    }
+    if (sig_len < rsa->pub.size) {
+        error_setg(errp, "Signature length is greater than key size: %lu",
+                   rsa->pub.size);
+        return ret;
+    }
+
+    nettle_mpz_init_set_str_256_u(s, sig_len, sig);
+    switch (rsa->hash_alg) {
+    case QCRYPTO_HASH_ALG_MD5:
+        rv = rsa_md5_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA1:
+        rv = rsa_sha1_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA256:
+        rv = rsa_sha256_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case QCRYPTO_HASH_ALG_SHA512:
+        rv = rsa_sha512_verify_digest(&rsa->pub, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unsupported hash algorithm: %d", rsa->hash_alg);
+        goto cleanup;
+    }
+
+    if (rv != 1) {
+        error_setg(errp, "Failed to verify signature");
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    mpz_clear(s);
+
+    return ret;
+}
+
+QCryptoAkCipherDriver nettle_rsa = {
+    .encrypt = qcrypto_nettle_rsa_encrypt,
+    .decrypt = qcrypto_nettle_rsa_decrypt,
+    .sign = qcrypto_nettle_rsa_sign,
+    .verify = qcrypto_nettle_rsa_verify,
+    .free = qcrypto_nettle_rsa_free,
+};
+
+static QCryptoAkCipher *qcrypto_nettle_rsa_new(
+    const QCryptoAkCipherOptionsRSA *opt,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    QCryptoNettleRSA *rsa = g_new0(QCryptoNettleRSA, 1);
+
+    rsa->padding_alg = opt->padding_alg;
+    rsa->hash_alg = opt->hash_alg;
+    rsa->akcipher.driver = &nettle_rsa;
+    rsa_public_key_init(&rsa->pub);
+    rsa_private_key_init(&rsa->priv);
+
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        if (qcrypt_nettle_parse_rsa_private_key(rsa, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypt_nettle_parse_rsa_public_key(rsa, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    default:
+        error_setg(errp, "Unknown akcipher key type %d", type);
+        goto error;
+    }
+
+    return (QCryptoAkCipher *)rsa;
+
+error:
+    qcrypto_nettle_rsa_free((QCryptoAkCipher *)rsa);
+    return NULL;
+}
+
+
+bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
+{
+    switch (opts->alg) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        switch (opts->u.rsa.padding_alg) {
+        case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+            switch (opts->u.rsa.hash_alg) {
+            case QCRYPTO_HASH_ALG_MD5:
+            case QCRYPTO_HASH_ALG_SHA1:
+            case QCRYPTO_HASH_ALG_SHA256:
+            case QCRYPTO_HASH_ALG_SHA512:
+                return true;
+
+            default:
+                return false;
+            }
+
+        case QCRYPTO_RSA_PADDING_ALG_RAW:
+        default:
+            return false;
+        }
+        break;
+
+    default:
+        return false;
+    }
+}
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index ab28bf415b..f287083f92 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -23,6 +23,9 @@
 #include "crypto/akcipher.h"
 #include "akcipherpriv.h"
 
+#if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
+#include "akcipher-nettle.c.inc"
+#else
 QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       QCryptoAkCipherKeyType type,
                                       const uint8_t *key, size_t keylen,
@@ -37,6 +40,7 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
     return false;
 }
+#endif
 
 int qcrypto_akcipher_encrypt(QCryptoAkCipher *akcipher,
                              const void *in, size_t in_len,
diff --git a/crypto/meson.build b/crypto/meson.build
index b8152ae7cb..5f03a30d34 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -21,10 +21,14 @@ crypto_ss.add(files(
   'tlscredspsk.c',
   'tlscredsx509.c',
   'tlssession.c',
+  'rsakey.c',
 ))
 
 if nettle.found()
   crypto_ss.add(nettle, files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
+  if hogweed.found()
+    crypto_ss.add(gmp, hogweed)
+  endif
   if xts == 'private'
     crypto_ss.add(files('xts.c'))
   endif
diff --git a/crypto/rsakey-builtin.c.inc b/crypto/rsakey-builtin.c.inc
new file mode 100644
index 0000000000..aeeacc8f9b
--- /dev/null
+++ b/crypto/rsakey-builtin.c.inc
@@ -0,0 +1,200 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
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
+#include "der.h"
+#include "rsakey.h"
+
+static int extract_mpi(void *ctx, const uint8_t *value,
+                       size_t vlen, Error **errp)
+{
+    QCryptoAkCipherMPI *mpi = (QCryptoAkCipherMPI *)ctx;
+    if (vlen == 0) {
+        error_setg(errp, "Empty mpi field");
+        return -1;
+    }
+    mpi->data = g_memdup2(value, vlen);
+    mpi->len = vlen;
+    return 0;
+}
+
+static int extract_version(void *ctx, const uint8_t *value,
+                           size_t vlen, Error **errp)
+{
+    uint8_t *version = (uint8_t *)ctx;
+    if (vlen != 1 || *value > 1) {
+        error_setg(errp, "Invalid rsakey version");
+        return -1;
+    }
+    *version = *value;
+    return 0;
+}
+
+static int extract_seq_content(void *ctx, const uint8_t *value,
+                               size_t vlen, Error **errp)
+{
+    const uint8_t **content = (const uint8_t **)ctx;
+    if (vlen == 0) {
+        error_setg(errp, "Empty sequence");
+        return -1;
+    }
+    *content = value;
+    return 0;
+}
+
+/**
+ *
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ */
+static QCryptoAkCipherRSAKey *qcrypto_builtin_rsa_public_key_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    const uint8_t *seq;
+    size_t seq_length;
+    int decode_ret;
+
+    decode_ret = qcrypto_der_decode_seq(&key, &keylen,
+                                        extract_seq_content, &seq, errp);
+    if (decode_ret < 0 || keylen != 0) {
+        goto error;
+    }
+    seq_length = decode_ret;
+
+    if (qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &rsa->n, errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &rsa->e, errp) < 0) {
+        goto error;
+    }
+    if (seq_length != 0) {
+        goto error;
+    }
+
+    return rsa;
+
+error:
+    if (errp && !*errp) {
+        error_setg(errp, "Invalid RSA public key");
+    }
+    qcrypto_akcipher_rsakey_free(rsa);
+    return NULL;
+}
+
+/**
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *       otherPrimeInfos   OtherPrimeInfos OPTIONAL
+ *         }
+ */
+static QCryptoAkCipherRSAKey *qcrypto_builtin_rsa_private_key_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    uint8_t version;
+    const uint8_t *seq;
+    int decode_ret;
+    size_t seq_length;
+
+    decode_ret = qcrypto_der_decode_seq(&key, &keylen, extract_seq_content,
+                                        &seq, errp);
+    if (decode_ret < 0 || keylen != 0) {
+        goto error;
+    }
+    seq_length = decode_ret;
+
+    decode_ret = qcrypto_der_decode_int(&seq, &seq_length, extract_version,
+                                        &version, errp);
+
+    if (qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &rsa->n, errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &rsa->e, errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &rsa->d, errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi, &rsa->p,
+                               errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi, &rsa->q,
+                               errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi, &rsa->dp,
+                               errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi, &rsa->dq,
+                               errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi, &rsa->u,
+                               errp) < 0) {
+        goto error;
+    }
+
+    /**
+     * According to the standard, otherPrimeInfos must be present for version 1.
+     * There is no strict verification here, this is to be compatible with
+     * the unit test of the kernel. TODO: remove this until linux kernel's
+     * unit-test is fixed.
+     */
+    if (version == 1 && seq_length != 0) {
+        if (qcrypto_der_decode_seq(&seq, &seq_length, NULL, NULL, errp) < 0) {
+            goto error;
+        }
+        if (seq_length != 0) {
+            goto error;
+        }
+        return rsa;
+    }
+    if (seq_length != 0) {
+        goto error;
+    }
+
+    return rsa;
+
+error:
+    if (errp && !*errp) {
+        error_setg(errp, "Invalid RSA private key");
+    }
+    qcrypto_akcipher_rsakey_free(rsa);
+    return NULL;
+}
+
+QCryptoAkCipherRSAKey *qcrypto_akcipher_rsakey_parse(
+    QCryptoAkCipherKeyType type, const uint8_t *key,
+    size_t keylen, Error **errp)
+{
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        return qcrypto_builtin_rsa_private_key_parse(key, keylen, errp);
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        return qcrypto_builtin_rsa_public_key_parse(key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unknown key type: %d", type);
+        return NULL;
+    }
+}
diff --git a/crypto/rsakey-nettle.c.inc b/crypto/rsakey-nettle.c.inc
new file mode 100644
index 0000000000..cc49872e78
--- /dev/null
+++ b/crypto/rsakey-nettle.c.inc
@@ -0,0 +1,158 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
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
+#include <nettle/asn1.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "rsakey.h"
+
+static bool DumpMPI(struct asn1_der_iterator *i, QCryptoAkCipherMPI *mpi)
+{
+    mpi->data = g_memdup2(i->data, i->length);
+    mpi->len = i->length;
+    return true;
+}
+
+static bool GetMPI(struct asn1_der_iterator *i, QCryptoAkCipherMPI *mpi)
+{
+    if (asn1_der_iterator_next(i) != ASN1_ITERATOR_PRIMITIVE ||
+        i->type != ASN1_INTEGER) {
+        return false;
+    }
+    return DumpMPI(i, mpi);
+}
+
+/**
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *       otherPrimeInfos   OtherPrimeInfos OPTIONAL
+ *         }
+ */
+static QCryptoAkCipherRSAKey *qcrypto_nettle_rsa_private_key_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    struct asn1_der_iterator i;
+    uint32_t version;
+    int tag;
+
+    /* Parse entire struct */
+    if (asn1_der_iterator_first(&i, keylen, key) != ASN1_ITERATOR_CONSTRUCTED ||
+        i.type != ASN1_SEQUENCE ||
+        asn1_der_decode_constructed_last(&i) != ASN1_ITERATOR_PRIMITIVE ||
+        i.type != ASN1_INTEGER ||
+        !asn1_der_get_uint32(&i, &version) ||
+        version > 1 ||
+        !GetMPI(&i, &rsa->n) ||
+        !GetMPI(&i, &rsa->e) ||
+        !GetMPI(&i, &rsa->d) ||
+        !GetMPI(&i, &rsa->p) ||
+        !GetMPI(&i, &rsa->q) ||
+        !GetMPI(&i, &rsa->dp) ||
+        !GetMPI(&i, &rsa->dq) ||
+        !GetMPI(&i, &rsa->u)) {
+        goto error;
+    }
+
+    if (version == 1) {
+        tag = asn1_der_iterator_next(&i);
+        /**
+         * According to the standard otherPrimeInfos must be present for
+         * version 1. There is no strict verification here, this is to be
+         * compatible with the unit test of the kernel. TODO: remove this
+         * until linux-kernel's unit-test is fixed;
+         */
+        if (tag == ASN1_ITERATOR_END) {
+            return rsa;
+        }
+        if (tag != ASN1_ITERATOR_CONSTRUCTED ||
+            i.type != ASN1_SEQUENCE) {
+            goto error;
+        }
+    }
+
+    if (asn1_der_iterator_next(&i) != ASN1_ITERATOR_END) {
+        goto error;
+    }
+
+    return rsa;
+
+error:
+    error_setg(errp, "Failed to parse RSA private key");
+    qcrypto_akcipher_rsakey_free(rsa);
+    return NULL;
+}
+
+/**
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ */
+static QCryptoAkCipherRSAKey *qcrypto_nettle_rsa_public_key_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+
+    QCryptoAkCipherRSAKey *rsa = g_new0(QCryptoAkCipherRSAKey, 1);
+    struct asn1_der_iterator i;
+
+    if (asn1_der_iterator_first(&i, keylen, key) != ASN1_ITERATOR_CONSTRUCTED ||
+        i.type != ASN1_SEQUENCE ||
+        asn1_der_decode_constructed_last(&i) != ASN1_ITERATOR_PRIMITIVE ||
+        !DumpMPI(&i, &rsa->n) ||
+        !GetMPI(&i, &rsa->e) ||
+        asn1_der_iterator_next(&i) != ASN1_ITERATOR_END) {
+        goto error;
+    }
+
+    return rsa;
+
+error:
+    error_setg(errp, "Failed to parse RSA public key");
+    qcrypto_akcipher_rsakey_free(rsa);
+    return NULL;
+}
+
+QCryptoAkCipherRSAKey *qcrypto_akcipher_rsakey_parse(
+    QCryptoAkCipherKeyType type, const uint8_t *key,
+    size_t keylen, Error **errp)
+{
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        return qcrypto_nettle_rsa_private_key_parse(key, keylen, errp);
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        return qcrypto_nettle_rsa_public_key_parse(key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unknown key type: %d", type);
+        return NULL;
+    }
+}
diff --git a/crypto/rsakey.c b/crypto/rsakey.c
new file mode 100644
index 0000000000..cc40e072f0
--- /dev/null
+++ b/crypto/rsakey.c
@@ -0,0 +1,44 @@
+/*
+ * QEMU Crypto RSA key parser
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
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
+#include "rsakey.h"
+
+void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
+{
+    if (!rsa_key) {
+        return;
+    }
+    g_free(rsa_key->n.data);
+    g_free(rsa_key->e.data);
+    g_free(rsa_key->d.data);
+    g_free(rsa_key->p.data);
+    g_free(rsa_key->q.data);
+    g_free(rsa_key->dp.data);
+    g_free(rsa_key->dq.data);
+    g_free(rsa_key->u.data);
+    g_free(rsa_key);
+}
+
+#if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
+#include "rsakey-nettle.c.inc"
+#else
+#include "rsakey-builtin.c.inc"
+#endif
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
new file mode 100644
index 0000000000..17bb22333d
--- /dev/null
+++ b/crypto/rsakey.h
@@ -0,0 +1,94 @@
+/*
+ * QEMU Crypto RSA key parser
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: lei he <helei.sig11@bytedance.com>
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
+#ifndef QCRYPTO_RSAKEY_H
+#define QCRYPTO_RSAKEY_H
+
+#include <nettle/bignum.h>
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "crypto/akcipher.h"
+
+typedef struct QCryptoAkCipherRSAKey QCryptoAkCipherRSAKey;
+typedef struct QCryptoAkCipherMPI QCryptoAkCipherMPI;
+
+/**
+ * Multiple precious integer, encoded as two' complement,
+ * copied directly from DER encoded ASN.1 structures.
+ */
+struct QCryptoAkCipherMPI {
+    uint8_t *data;
+    size_t len;
+};
+
+/* See rfc2437: https://datatracker.ietf.org/doc/html/rfc2437 */
+struct QCryptoAkCipherRSAKey {
+    /* The modulus */
+    QCryptoAkCipherMPI n;
+    /* The public exponent */
+    QCryptoAkCipherMPI e;
+    /* The private exponent */
+    QCryptoAkCipherMPI d;
+    /* The first factor */
+    QCryptoAkCipherMPI p;
+    /* The second factor */
+    QCryptoAkCipherMPI q;
+    /* The first factor's exponent */
+    QCryptoAkCipherMPI dp;
+    /* The second factor's exponent */
+    QCryptoAkCipherMPI dq;
+    /* The CRT coefficient */
+    QCryptoAkCipherMPI u;
+};
+
+/**
+ * Parse DER encoded ASN.1 RSA keys, expected ASN.1 schemas:
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             dp          INTEGER
+ *             dq          INTEGER
+ *             u           INTEGER
+ *       otherPrimeInfos   OtherPrimeInfos OPTIONAL
+ *         }
+ *
+ *        RsaPubKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ *
+ * Returns: On success QCryptoAkCipherRSAKey is returned, otherwise returns NULL
+ */
+QCryptoAkCipherRSAKey *qcrypto_akcipher_rsakey_parse(
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen, Error **errp);
+
+void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *key);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipherRSAKey,
+                              qcrypto_akcipher_rsakey_free);
+
+#endif
diff --git a/meson.build b/meson.build
index 40132b4804..68bd083189 100644
--- a/meson.build
+++ b/meson.build
@@ -1098,6 +1098,7 @@ endif
 # gcrypt over nettle for performance reasons.
 gcrypt = not_found
 nettle = not_found
+hogweed = not_found
 xts = 'none'
 
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
@@ -1135,6 +1136,15 @@ if not gnutls_crypto.found()
   endif
 endif
 
+gmp = dependency('gmp', required: false, method: 'pkg-config', kwargs: static_kwargs)
+if nettle.found() and gmp.found()
+  hogweed = dependency('hogweed', version: '>=3.4',
+                       method: 'pkg-config',
+                       required: get_option('nettle'),
+                       kwargs: static_kwargs)
+endif
+
+
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
@@ -1744,6 +1754,7 @@ config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
+config_host_data.set('CONFIG_HOGWEED', hogweed.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
-- 
2.20.1


