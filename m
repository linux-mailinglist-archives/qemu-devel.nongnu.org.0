Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E4534D9F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:59:31 +0200 (CEST)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBDG-0001Hr-Ot
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB09-00008L-6Y
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB05-0007yd-TB
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653561952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79cieLzni7prkasTupFZvWkpoLwtwiEEyb1zq58KOSE=;
 b=YwA5bjSk4LOGEpk5Y5FWzyoTmhA3KDXQVT5K7FpNa6zibeeW6Syo/zMfqh/vKNWlv+ack0
 u7pSKD633HilrHMzFn2CpLTsKRbHCL3OqyB9NdMDm4kiUNpKDdjHsgoOOGBGIw+qVcdoj5
 KkP8V23d+f6ExQ2zv/7y1HPuWvDz1Vw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-TJ8k58qhN_yXTzSU57U4KA-1; Thu, 26 May 2022 06:45:51 -0400
X-MC-Unique: TJ8k58qhN_yXTzSU57U4KA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C8DE801228;
 Thu, 26 May 2022 10:45:51 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1A3E2166B26;
 Thu, 26 May 2022 10:45:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Lei He <helei.sig11@bytedance.com>
Subject: [PULL 5/7] crypto: Implement RSA algorithm by gcrypt
Date: Thu, 26 May 2022 11:45:39 +0100
Message-Id: <20220526104541.492781-6-berrange@redhat.com>
In-Reply-To: <20220526104541.492781-1-berrange@redhat.com>
References: <20220526104541.492781-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/akcipher-gcrypt.c.inc | 595 +++++++++++++++++++++++++++++++++++
 crypto/akcipher.c            |   4 +-
 2 files changed, 598 insertions(+), 1 deletion(-)
 create mode 100644 crypto/akcipher-gcrypt.c.inc

diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
new file mode 100644
index 0000000000..abb1fb272e
--- /dev/null
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -0,0 +1,595 @@
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
+            goto error;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypto_gcrypt_parse_rsa_public_key(rsa, key, keylen, errp) != 0) {
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
2.36.1


