Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E15526DB9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 03:09:00 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npgHD-0003NU-5H
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 21:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg8K-0001xB-ES
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg8H-0008Sz-PV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so8861004pjb.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 17:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h34AXTj+8XUDrvB6MUnog+G/Mps9P+4k/0m79B0Juyk=;
 b=Gv8pKSglvH5a5FyHPh8FedxfR6/+yWjEuWXTKSfYfNg5JZAi2NN5VMWPt4ee4FBj43
 av3hOrGGfGYZeKR0cSeHUGAzFxhHVDvGn7VJnVKyEd/tAfOgYY63AoSqajftZsDvKHKT
 AHqwj+nV4qxyu1kWDY9II5KJU9FV2sTw+a23bn+zzUJnoygWPNw8Pj2642AkzYb+a7/E
 ZI3mWepUwMMlk0A9UZyBeH9arseKMJCfrdq4l7NekWWGSaVm2EHrJG7yL2+fyNfCXKA8
 MjKSXi+OHGbJS/huFNMr2xnwAPHWwxsK+2LMd7I+So07VyYnwXzwqajt37mVd97Ku2Ty
 lOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h34AXTj+8XUDrvB6MUnog+G/Mps9P+4k/0m79B0Juyk=;
 b=bEML4mdggeiNdZ85OBCUdInxmAGBBbsAby5tm6kjdxbdvQWVJhuImRXK/L6qFDTt8k
 YHOnBuk3w/jSuHUcFkx3tp12If+c9bw7a7aLRsEKOk5gdhW4yTJwe4DVShza7BzZ+u46
 +YH/ggOSS/0AmFpb4JNlx0jw2Nu+JEHY+SjIhEogrPXmbJjxdV2CKOGeWNPsA/gkwsS3
 Dm1tXBmkAScMgMhIJDpdDHEuYeivk5lh+lvQ9g2p/Zkn9zbwIAG4TWz9nfzzDmwNMkuf
 tRsgDSjrMqf6iey9C1UiYk4ExCQ+X7hnfSAznQ6fOowYzAE7UHNaoXf+R/Yly0fpyYvo
 LDxQ==
X-Gm-Message-State: AOAM532ERdSVSCB/cuSKJPFRQDxwIAAC+9PgyozyJvq+OXx773BfUTqR
 DerZJELN2ZOe8YveQ5Gq85AjEg==
X-Google-Smtp-Source: ABdhPJwKNXpv6ys3t5ZQgXZ8kQmZngYVkPBd0w14p7J13IRwVJ7tkyZpsqTNpeBcIB0d7P5ySKz9+g==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id
 m16-20020a170902f65000b0015f3a10a020mr7187672plg.61.1652489984280; 
 Fri, 13 May 2022 17:59:44 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b0015e8d4eb1dbsm2466125plr.37.2022.05.13.17.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 17:59:43 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, pizhenwei@bytedance.com, cohuck@redhat.com
Subject: [PATCH v6 6/9] crypto: Implement RSA algorithm by gcrypt
Date: Sat, 14 May 2022 08:55:01 +0800
Message-Id: <20220514005504.1042884-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514005504.1042884-1-pizhenwei@bytedance.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
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

Added gcryt implementation of RSA algorithm, RSA algorithm
implemented by gcrypt has a higher priority than nettle because
it supports raw padding.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/akcipher-gcrypt.c.inc | 597 +++++++++++++++++++++++++++++++++++
 crypto/akcipher.c            |   4 +-
 2 files changed, 600 insertions(+), 1 deletion(-)
 create mode 100644 crypto/akcipher-gcrypt.c.inc

diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
new file mode 100644
index 0000000000..6c5daa301e
--- /dev/null
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -0,0 +1,597 @@
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
+#include <gcrypt.h>
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "crypto/akcipher.h"
+#include "crypto/random.h"
+#include "qapi/error.h"
+#include "sysemu/cryptodev.h"
+#include "rsakey.h"
+
+typedef struct QCryptoGcryptRSA {
+    QCryptoAkCipher akcipher;
+    gcry_sexp_t key;
+    QCryptoRSAPaddingAlgorithm padding_alg;
+    QCryptoHashAlgorithm hash_alg;
+} QCryptoGcryptRSA;
+
+static void qcrypto_gcrypt_rsa_free(QCryptoAkCipher *akcipher)
+{
+    QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
+    if (!rsa) {
+        return;
+    }
+
+    gcry_sexp_release(rsa->key);
+    g_free(rsa);
+}
+
+static QCryptoGcryptRSA *qcrypto_gcrypt_rsa_new(
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
+        return (QCryptoAkCipher *)qcrypto_gcrypt_rsa_new(
+            &opts->u.rsa, type, key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", opts->alg);
+        return NULL;
+    }
+
+    return NULL;
+}
+
+static void qcrypto_gcrypt_set_rsa_size(QCryptoAkCipher *akcipher, gcry_mpi_t n)
+{
+    size_t key_size = (gcry_mpi_get_nbits(n) + 7) / 8;
+    akcipher->max_plaintext_len = key_size;
+    akcipher->max_ciphertext_len = key_size;
+    akcipher->max_dgst_len = key_size;
+    akcipher->max_signature_len = key_size;
+}
+
+static int qcrypto_gcrypt_parse_rsa_private_key(
+    QCryptoGcryptRSA *rsa,
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    g_autoptr(QCryptoAkCipherRSAKey) rsa_key = qcrypto_akcipher_rsakey_parse(
+        QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE, key, keylen, errp);
+    gcry_mpi_t n = NULL, e = NULL, d = NULL, p = NULL, q = NULL, u = NULL;
+    bool compute_mul_inv = false;
+    int ret = -1;
+    gcry_error_t err;
+
+    if (!rsa_key) {
+        return ret;
+    }
+
+    err = gcry_mpi_scan(&n, GCRYMPI_FMT_STD,
+                        rsa_key->n.data, rsa_key->n.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter n: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&e, GCRYMPI_FMT_STD,
+                        rsa_key->e.data, rsa_key->e.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter e: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&d, GCRYMPI_FMT_STD,
+                        rsa_key->d.data, rsa_key->d.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter d: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&p, GCRYMPI_FMT_STD,
+                        rsa_key->p.data, rsa_key->p.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter p: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&q, GCRYMPI_FMT_STD,
+                        rsa_key->q.data, rsa_key->q.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter q: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    if (gcry_mpi_cmp_ui(p, 0) > 0 && gcry_mpi_cmp_ui(q, 0) > 0) {
+        compute_mul_inv = true;
+
+        u = gcry_mpi_new(0);
+        if (gcry_mpi_cmp(p, q) > 0) {
+            gcry_mpi_swap(p, q);
+        }
+        gcry_mpi_invm(u, p, q);
+    }
+
+    if (compute_mul_inv) {
+        err = gcry_sexp_build(&rsa->key, NULL,
+            "(private-key (rsa (n %m) (e %m) (d %m) (p %m) (q %m) (u %m)))",
+            n, e, d, p, q, u);
+    } else {
+        err = gcry_sexp_build(&rsa->key, NULL,
+            "(private-key (rsa (n %m) (e %m) (d %m)))", n, e, d);
+    }
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build RSA private key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    qcrypto_gcrypt_set_rsa_size((QCryptoAkCipher *)rsa,  n);
+    ret = 0;
+
+cleanup:
+    gcry_mpi_release(n);
+    gcry_mpi_release(e);
+    gcry_mpi_release(d);
+    gcry_mpi_release(p);
+    gcry_mpi_release(q);
+    gcry_mpi_release(u);
+    return ret;
+}
+
+static int qcrypto_gcrypt_parse_rsa_public_key(QCryptoGcryptRSA *rsa,
+                                               const uint8_t *key,
+                                               size_t keylen,
+                                               Error **errp)
+{
+
+    g_autoptr(QCryptoAkCipherRSAKey) rsa_key = qcrypto_akcipher_rsakey_parse(
+        QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC, key, keylen, errp);
+    gcry_mpi_t n = NULL, e = NULL;
+    int ret = -1;
+    gcry_error_t err;
+
+    if (!rsa_key) {
+        return ret;
+    }
+
+    err = gcry_mpi_scan(&n, GCRYMPI_FMT_STD,
+                        rsa_key->n.data, rsa_key->n.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter n: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&e, GCRYMPI_FMT_STD,
+                        rsa_key->e.data, rsa_key->e.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse RSA parameter e: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_sexp_build(&rsa->key, NULL,
+                          "(public-key (rsa (n %m) (e %m)))", n, e);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build RSA public key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    qcrypto_gcrypt_set_rsa_size((QCryptoAkCipher *)rsa, n);
+    ret = 0;
+
+cleanup:
+    gcry_mpi_release(n);
+    gcry_mpi_release(e);
+    return ret;
+}
+
+static int qcrypto_gcrypt_rsa_encrypt(QCryptoAkCipher *akcipher,
+                                      const void *in, size_t in_len,
+                                      void *out, size_t out_len,
+                                      Error **errp)
+{
+    QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
+    int ret = -1;
+    gcry_sexp_t data_sexp = NULL, cipher_sexp = NULL;
+    gcry_sexp_t cipher_sexp_item = NULL;
+    gcry_mpi_t cipher_mpi = NULL;
+    const char *result;
+    gcry_error_t err;
+    size_t actual_len;
+
+    if (in_len > akcipher->max_plaintext_len) {
+        error_setg(errp, "Plaintext length is greater than key size: %d",
+                   akcipher->max_plaintext_len);
+        return ret;
+    }
+
+    err = gcry_sexp_build(&data_sexp, NULL,
+                          "(data (flags %s) (value %b))",
+                          QCryptoRSAPaddingAlgorithm_str(rsa->padding_alg),
+                          in_len, in);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build plaintext: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_encrypt(&cipher_sexp, data_sexp, rsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to encrypt: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    /* S-expression of cipher: (enc-val (rsa (a a-mpi))) */
+    cipher_sexp_item = gcry_sexp_find_token(cipher_sexp, "a", 0);
+    if (!cipher_sexp_item || gcry_sexp_length(cipher_sexp_item) != 2) {
+        error_setg(errp, "Invalid ciphertext result");
+        goto cleanup;
+    }
+
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        cipher_mpi = gcry_sexp_nth_mpi(cipher_sexp_item, 1, GCRYMPI_FMT_USG);
+        if (!cipher_mpi) {
+            error_setg(errp, "Invalid ciphertext result");
+            goto cleanup;
+        }
+        err = gcry_mpi_print(GCRYMPI_FMT_USG, out, out_len,
+                             &actual_len, cipher_mpi);
+        if (gcry_err_code(err) != 0) {
+            error_setg(errp, "Failed to print MPI: %s/%s",
+                       gcry_strsource(err), gcry_strerror(err));
+            goto cleanup;
+        }
+
+        if (actual_len > out_len) {
+            error_setg(errp, "Ciphertext buffer length is too small");
+            goto cleanup;
+        }
+
+        /* We always padding leading-zeros for RSA-RAW */
+        if (actual_len < out_len) {
+            memmove((uint8_t *)out + (out_len - actual_len), out, actual_len);
+            memset(out, 0, out_len - actual_len);
+        }
+        ret = out_len;
+
+    } else {
+        result = gcry_sexp_nth_data(cipher_sexp_item, 1, &actual_len);
+        if (!result) {
+            error_setg(errp, "Invalid ciphertext result");
+            goto cleanup;
+        }
+        if (actual_len > out_len) {
+            error_setg(errp, "Ciphertext buffer length is too small");
+            goto cleanup;
+        }
+        memcpy(out, result, actual_len);
+        ret = actual_len;
+    }
+
+cleanup:
+    gcry_sexp_release(data_sexp);
+    gcry_sexp_release(cipher_sexp);
+    gcry_sexp_release(cipher_sexp_item);
+    gcry_mpi_release(cipher_mpi);
+    return ret;
+}
+
+static int qcrypto_gcrypt_rsa_decrypt(QCryptoAkCipher *akcipher,
+                                      const void *in, size_t in_len,
+                                      void *out, size_t out_len,
+                                      Error **errp)
+{
+    QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
+    int ret = -1;
+    gcry_sexp_t data_sexp = NULL, cipher_sexp = NULL;
+    gcry_mpi_t data_mpi = NULL;
+    gcry_error_t err;
+    size_t actual_len;
+    const char *result;
+
+    if (in_len > akcipher->max_ciphertext_len) {
+        error_setg(errp, "Ciphertext length is greater than key size: %d",
+                   akcipher->max_ciphertext_len);
+        return ret;
+    }
+
+    err = gcry_sexp_build(&cipher_sexp, NULL,
+                          "(enc-val (flags %s) (rsa (a %b) ))",
+                          QCryptoRSAPaddingAlgorithm_str(rsa->padding_alg),
+                          in_len, in);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build ciphertext: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_decrypt(&data_sexp, cipher_sexp, rsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to decrypt: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    /* S-expression of plaintext: (value plaintext) */
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+        data_mpi = gcry_sexp_nth_mpi(data_sexp, 1, GCRYMPI_FMT_USG);
+        if (!data_mpi) {
+            error_setg(errp, "Invalid plaintext result");
+            goto cleanup;
+        }
+        err = gcry_mpi_print(GCRYMPI_FMT_USG, out, out_len,
+                             &actual_len, data_mpi);
+        if (gcry_err_code(err) != 0) {
+            error_setg(errp, "Failed to print MPI: %s/%s",
+                       gcry_strsource(err), gcry_strerror(err));
+            goto cleanup;
+        }
+        if (actual_len > out_len) {
+            error_setg(errp, "Plaintext buffer length is too small");
+            goto cleanup;
+        }
+        /* We always padding leading-zeros for RSA-RAW */
+        if (actual_len < out_len) {
+            memmove((uint8_t *)out + (out_len - actual_len), out, actual_len);
+            memset(out, 0, out_len - actual_len);
+        }
+        ret = out_len;
+    } else {
+        result = gcry_sexp_nth_data(data_sexp, 1, &actual_len);
+        if (!result) {
+            error_setg(errp, "Invalid plaintext result");
+            goto cleanup;
+        }
+        if (actual_len > out_len) {
+            error_setg(errp, "Plaintext buffer length is too small");
+            goto cleanup;
+        }
+        memcpy(out, result, actual_len);
+        ret = actual_len;
+    }
+
+cleanup:
+    gcry_sexp_release(cipher_sexp);
+    gcry_sexp_release(data_sexp);
+    gcry_mpi_release(data_mpi);
+    return ret;
+}
+
+static int qcrypto_gcrypt_rsa_sign(QCryptoAkCipher *akcipher,
+                                   const void *in, size_t in_len,
+                                   void *out, size_t out_len, Error **errp)
+{
+    QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
+    int ret = -1;
+    gcry_sexp_t dgst_sexp = NULL, sig_sexp = NULL;
+    gcry_sexp_t sig_sexp_item = NULL;
+    const char *result;
+    gcry_error_t err;
+    size_t actual_len;
+
+    if (in_len > akcipher->max_dgst_len) {
+        error_setg(errp, "Data length is greater than key size: %d",
+                   akcipher->max_dgst_len);
+        return ret;
+    }
+
+    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+        error_setg(errp, "Invalid padding %u", rsa->padding_alg);
+        return ret;
+    }
+
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags pkcs1) (hash %s %b))",
+                          QCryptoHashAlgorithm_str(rsa->hash_alg),
+                          in_len, in);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build dgst: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_sign(&sig_sexp, dgst_sexp, rsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to make signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    /* S-expression of signature: (sig-val (rsa (s s-mpi))) */
+    sig_sexp_item = gcry_sexp_find_token(sig_sexp, "s", 0);
+    if (!sig_sexp_item || gcry_sexp_length(sig_sexp_item) != 2) {
+        error_setg(errp, "Invalid signature result");
+        goto cleanup;
+    }
+
+    result = gcry_sexp_nth_data(sig_sexp_item, 1, &actual_len);
+    if (!result) {
+        error_setg(errp, "Invalid signature result");
+        goto cleanup;
+    }
+
+    if (actual_len > out_len) {
+        error_setg(errp, "Signature buffer length is too small");
+        goto cleanup;
+    }
+    memcpy(out, result, actual_len);
+    ret = actual_len;
+
+cleanup:
+    gcry_sexp_release(dgst_sexp);
+    gcry_sexp_release(sig_sexp);
+    gcry_sexp_release(sig_sexp_item);
+
+    return ret;
+}
+
+static int qcrypto_gcrypt_rsa_verify(QCryptoAkCipher *akcipher,
+                                     const void *in, size_t in_len,
+                                     const void *in2, size_t in2_len,
+                                     Error **errp)
+{
+    QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
+    int ret = -1;
+    gcry_sexp_t sig_sexp = NULL, dgst_sexp = NULL;
+    gcry_error_t err;
+
+    if (in_len > akcipher->max_signature_len) {
+        error_setg(errp, "Signature length is greater than key size: %d",
+                   akcipher->max_signature_len);
+        return ret;
+    }
+
+    if (in2_len > akcipher->max_dgst_len) {
+        error_setg(errp, "Data length is greater than key size: %d",
+                   akcipher->max_dgst_len);
+        return ret;
+    }
+
+    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+        error_setg(errp, "Invalid padding %u", rsa->padding_alg);
+        return ret;
+    }
+
+    err = gcry_sexp_build(&sig_sexp, NULL,
+                          "(sig-val (rsa (s %b)))", in_len, in);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags pkcs1) (hash %s %b))",
+                          QCryptoHashAlgorithm_str(rsa->hash_alg),
+                          in2_len, in2);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build dgst: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_verify(sig_sexp, dgst_sexp, rsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to verify signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    gcry_sexp_release(dgst_sexp);
+    gcry_sexp_release(sig_sexp);
+
+    return ret;
+}
+
+QCryptoAkCipherDriver gcrypt_rsa = {
+    .encrypt = qcrypto_gcrypt_rsa_encrypt,
+    .decrypt = qcrypto_gcrypt_rsa_decrypt,
+    .sign = qcrypto_gcrypt_rsa_sign,
+    .verify = qcrypto_gcrypt_rsa_verify,
+    .free = qcrypto_gcrypt_rsa_free,
+};
+
+static QCryptoGcryptRSA *qcrypto_gcrypt_rsa_new(
+    const QCryptoAkCipherOptionsRSA *opt,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    QCryptoGcryptRSA *rsa = g_new0(QCryptoGcryptRSA, 1);
+    rsa->padding_alg = opt->padding_alg;
+    rsa->hash_alg = opt->hash_alg;
+    rsa->akcipher.driver = &gcrypt_rsa;
+
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        if (qcrypto_gcrypt_parse_rsa_private_key(rsa, key, keylen, errp) != 0) {
+            error_setg(errp, "Failed to parse rsa private key");
+            goto error;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypto_gcrypt_parse_rsa_public_key(rsa, key, keylen, errp) != 0) {
+            error_setg(errp, "Failed to parse rsa public rsa key");
+            goto error;
+        }
+        break;
+
+    default:
+        error_setg(errp, "Unknown akcipher key type %d", type);
+        goto error;
+    }
+
+    return rsa;
+
+error:
+    qcrypto_gcrypt_rsa_free((QCryptoAkCipher *)rsa);
+    return NULL;
+}
+
+
+bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
+{
+    switch (opts->alg) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        switch (opts->u.rsa.padding_alg) {
+        case QCRYPTO_RSA_PADDING_ALG_RAW:
+            return true;
+
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
+        default:
+            return false;
+        }
+
+    default:
+        return true;
+    }
+}
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index f287083f92..ad88379c1e 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -23,7 +23,9 @@
 #include "crypto/akcipher.h"
 #include "akcipherpriv.h"
 
-#if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
+#if defined(CONFIG_GCRYPT)
+#include "akcipher-gcrypt.c.inc"
+#elif defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
 #include "akcipher-nettle.c.inc"
 #else
 QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
-- 
2.20.1


