Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCE5481FF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:51:06 +0200 (CEST)
Received: from localhost ([::1]:48370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fmr-0001Ag-Qw
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fin-0006lu-Dg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:54 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fil-0001O7-1p
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso2311930pjg.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6AlerjvsQvc/NrVxDKXKRzKkWNjt7+vi0/MlCAwjMGc=;
 b=MEmehw2gyhyQKMZAPD4zsqLoaiPwiZU861AcMslXLuEeAk4ZK1rlKZBBLLnm2zSZyG
 TyiTyULqVs8Iqqptt8NQhGBpFb0B9DTbOKMUPLrbO/3+5WZjX0GNH9eceJ3HnEK7iCKD
 lHI+QUhWCUNFKrLC1pjo/aOVXbXIGr0m3DzGsvlnVpQ8Y6vZ8OoFNslFvL5WRrqvm2P8
 fBY+R8LjMJ+3os/OmYDUCByfK6ODJngmU1+/1TGjnuB1uKHCAsrz9l10T0MTDm9r6aRq
 4WMMwlcASLbpNoZaH4cd248odbHqON++kelFi39Fa0s5V1+xJ1PLQvzxXVUP7h5nTzUz
 vWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6AlerjvsQvc/NrVxDKXKRzKkWNjt7+vi0/MlCAwjMGc=;
 b=MLRp6fLhyd1URpNGjrYjxENQtFwV/WO+gWaFCSbYn/djXlPFGyTCS5lOwP45InzBYU
 +mg2gxtVKBvqBWHfVMG5bqyaGpdPNjqhUCjsoLy2On7OKaJ1xvuffSmJc5Mmqg8QZ9FH
 kgTZmgUqU6nvwWNLWb72E91Gb7Z2wUmBs1ezQQFoA5K8X9wz+Tq44WhkcVIrFPpWH2rS
 0/UiEg346t2CWA6ML6yIrjcZrd66d5O2INeaYMzDi4DAPgbk4A8AWJjFVrgeVkleFDho
 YRPoZitNRUvwXO0+XPH93/MdhsWANZTNAGW5Pa6dbzAIGbmaiEfusX8pLurp09SutAwY
 eJAQ==
X-Gm-Message-State: AOAM532Chl7GGDouqMlcMnaK63keTOVQ8NjWqpBf/6OgYr6x4B+3bgjU
 05H65vk7QrKc0LdSM90XKpD1Cw==
X-Google-Smtp-Source: ABdhPJxrrzdgG4s91FOVXoWpMlGziKIpNK6dsHFbYAGGNIxuVuFpiOZxmq7VTr+nvDOeIsQImVCg6Q==
X-Received: by 2002:a17:90b:38c2:b0:1e8:7ad1:bec5 with SMTP id
 nn2-20020a17090b38c200b001e87ad1bec5mr14405647pjb.51.1655110009746; 
 Mon, 13 Jun 2022 01:46:49 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:49 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 6/7] crypto: Implement ECDSA algorithm by gcrypt
Date: Mon, 13 Jun 2022 16:45:30 +0800
Message-Id: <20220613084531.8086-7-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x102d.google.com
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

Implement ECDSA algorithm by gcrypt

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/akcipher-gcrypt.c.inc | 400 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 400 insertions(+)

diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
index abb1fb272e..24377bbec6 100644
--- a/crypto/akcipher-gcrypt.c.inc
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "sysemu/cryptodev.h"
 #include "rsakey.h"
+#include "ecdsakey.h"
 
 typedef struct QCryptoGcryptRSA {
     QCryptoAkCipher akcipher;
@@ -36,6 +37,13 @@ typedef struct QCryptoGcryptRSA {
     QCryptoHashAlgorithm hash_alg;
 } QCryptoGcryptRSA;
 
+typedef struct QCryptoGcryptECDSA {
+    QCryptoAkCipher akcipher;
+    gcry_sexp_t key;
+    QCryptoCurveID curve_id;
+    const char *curve_name;
+} QCryptoGcryptECDSA;
+
 static void qcrypto_gcrypt_rsa_free(QCryptoAkCipher *akcipher)
 {
     QCryptoGcryptRSA *rsa = (QCryptoGcryptRSA *)akcipher;
@@ -53,6 +61,12 @@ static QCryptoGcryptRSA *qcrypto_gcrypt_rsa_new(
     const uint8_t *key,  size_t keylen,
     Error **errp);
 
+static QCryptoGcryptECDSA *qcrypto_gcrypt_ecdsa_new(
+    const QCryptoAkCipherOptionsECDSA *opts,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp);
+
 QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       QCryptoAkCipherKeyType type,
                                       const uint8_t *key, size_t keylen,
@@ -63,6 +77,10 @@ QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
         return (QCryptoAkCipher *)qcrypto_gcrypt_rsa_new(
             &opts->u.rsa, type, key, keylen, errp);
 
+    case QCRYPTO_AKCIPHER_ALG_ECDSA:
+        return (QCryptoAkCipher *)qcrypto_gcrypt_ecdsa_new(
+            &opts->u.ecdsa, type, key, keylen, errp);
+
     default:
         error_setg(errp, "Unsupported algorithm: %u", opts->alg);
         return NULL;
@@ -564,6 +582,377 @@ error:
     return NULL;
 }
 
+static int qcrypto_gcrypt_parse_curve_id(QCryptoGcryptECDSA *ecdsa,
+    const QCryptoAkCipherOptionsECDSA *opts, Error **errp)
+{
+    /* ECDSA algorithm can't used for encryption */
+    ecdsa->akcipher.max_plaintext_len = 0;
+    ecdsa->akcipher.max_ciphertext_len = 0;
+
+    switch (opts->curve_id) {
+    case QCRYPTO_CURVE_ID_NIST_P192:
+        ecdsa->curve_name = "nistp192";
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(192 / 8);
+        ecdsa->akcipher.max_dgst_len = 192 / 8;
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P256:
+        ecdsa->curve_name = "nistp256";
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(256 / 8);
+        ecdsa->akcipher.max_dgst_len = 256 / 8;
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P384:
+        ecdsa->curve_name = "nistp384";
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(384 / 8);
+        ecdsa->akcipher.max_dgst_len = 256 / 8;
+        break;
+
+    default:
+        error_setg(errp, "Unknown curve id: %d", opts->curve_id);
+        return -1;
+    }
+
+    return 0;
+}
+
+static int qcrypto_gcrypt_parse_ecdsa_private_key(
+    QCryptoGcryptECDSA *ecdsa, const char *curve_name,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    g_autoptr(QCryptoAkCipherECDSAKey) ecdsa_key =
+        qcrypto_akcipher_ecdsakey_parse(QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+                                        key, keylen, errp);
+    gcry_mpi_t d = NULL;
+    gcry_error_t err;
+    int ret = -1;
+
+    if (!ecdsa_key) {
+        return ret;
+    }
+
+    err = gcry_mpi_scan(&d, GCRYMPI_FMT_USG, ecdsa_key->priv.data,
+                        ecdsa_key->priv.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse ECDSA parivate key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        return ret;
+    }
+
+    err = gcry_sexp_build(&ecdsa->key, NULL,
+        "(private-key (ecc (curve %s) (d %m)))", curve_name, d);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build ECDSA parivate key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    ret = 0;
+
+cleanup:
+    gcry_mpi_release(d);
+    return ret;
+}
+
+static int qcrypto_gcrypt_parse_ecdsa_public_key(
+    QCryptoGcryptECDSA *ecdsa, const char *curve_name,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    gcry_mpi_t q = NULL;
+    gcry_error_t err;
+    int ret = -1;
+
+    err = gcry_mpi_scan(&q, GCRYMPI_FMT_USG, key, keylen, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to scan public point: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        return -1;
+    }
+
+    err = gcry_sexp_build(&ecdsa->key, NULL,
+        "(public-key (ecc (curve %s) (q %m)))", curve_name, q);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build ECDSA public key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    gcry_mpi_release(q);
+    return ret;
+}
+
+static void qcrypto_gcrypt_ecdsa_free(QCryptoAkCipher *akcipher)
+{
+    QCryptoGcryptECDSA *ecdsa = (QCryptoGcryptECDSA *)akcipher;
+    if (!ecdsa) {
+        return;
+    }
+    gcry_sexp_release(ecdsa->key);
+    g_free(ecdsa);
+}
+
+static int qcrypto_gcrypt_invalid_encrypt(QCryptoAkCipher *akcipher,
+                                          const void *in, size_t in_len,
+                                          void *out, size_t out_len,
+                                          Error **errp)
+{
+    error_setg(errp, "Operation is invalid");
+    return -1;
+}
+
+static int qcrypto_gcrypt_invalid_decrypt(QCryptoAkCipher *akcipher,
+                                          const void *in, size_t in_len,
+                                          void *out, size_t out_len,
+                                          Error **errp)
+{
+    error_setg(errp, "Operation is invalid");
+    return -1;
+}
+
+static int qcrypto_gcrypt_ecdsa_sign(QCryptoAkCipher *akcipher,
+                                     const void *in, size_t in_len,
+                                     void *out, size_t out_len, Error **errp)
+{
+    QCryptoGcryptECDSA *ecdsa = (QCryptoGcryptECDSA *)akcipher;
+    int ret = -1;
+    gcry_mpi_t data = NULL, r_mpi = NULL, s_mpi = NULL;
+    gcry_sexp_t dgst_sexp = NULL, sig_sexp = NULL;
+    gcry_sexp_t r_sexp_item = NULL, s_sexp_item = NULL;
+    size_t actual_len;
+    gcry_error_t err;
+    g_autoptr(QCryptoAkCipherECDSASig) sig = NULL;
+
+    if (out_len < akcipher->max_signature_len) {
+        error_setg(errp, "Signature buffer should be not less than: %d",
+                   akcipher->max_signature_len);
+        return -1;
+    }
+    /*
+     * For ecdsa, digest length less than key length is recommended but not
+     * required, truncation occurs when digest is too long, see FIPS 186-4:
+     * https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf.
+     * Here we don't do the check, gcrypt will handle it.
+     */
+    err = gcry_mpi_scan(&data, GCRYMPI_FMT_USG, in, in_len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build data: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags raw) (value %m))", data);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build dgst signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_sign(&sig_sexp, dgst_sexp, ecdsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to make signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    sig = qcrypto_akcipher_ecdsasig_alloc(ecdsa->curve_id, errp);
+    if (!sig) {
+        goto cleanup;
+    }
+
+    /* S-expression of signature: (sig-val (ecdsa (r r-mpi) (s s-mpi))) */
+    r_sexp_item = gcry_sexp_find_token(sig_sexp, "r", 0);
+    if (!r_sexp_item || gcry_sexp_length(r_sexp_item) != 2) {
+        error_setg(errp, "Invalid signature result");
+        goto cleanup;
+    }
+    r_mpi = gcry_sexp_nth_mpi(r_sexp_item, 1, GCRYMPI_FMT_USG);
+    if (!r_mpi) {
+        error_setg(errp, "Invalid signature result");
+    }
+    err = gcry_mpi_print(GCRYMPI_FMT_STD, sig->r.data, sig->r.len,
+                         &actual_len, r_mpi);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to print MPI: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    if (unlikely(actual_len > sig->r.len)) {
+        error_setg(errp, "Internal error: signature buffer is too small");
+        goto cleanup;
+    }
+    sig->r.len = actual_len;
+
+    s_sexp_item = gcry_sexp_find_token(sig_sexp, "s", 0);
+    if (!s_sexp_item || gcry_sexp_length(s_sexp_item) != 2) {
+        error_setg(errp, "Invalid signature result");
+        goto cleanup;
+    }
+    s_mpi = gcry_sexp_nth_mpi(s_sexp_item, 1, GCRYMPI_FMT_USG);
+    if (!s_mpi) {
+        error_setg(errp, "Invalid signature result");
+    }
+    err = gcry_mpi_print(GCRYMPI_FMT_STD, sig->s.data, sig->s.len,
+                         &actual_len, s_mpi);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to print MPI: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    if (unlikely(actual_len > sig->s.len)) {
+        error_setg(errp, "Internal error: signature buffer is too small");
+        goto cleanup;
+    }
+    sig->s.len = actual_len;
+
+    qcrypto_akcipher_ecdsasig_x9_62_encode(sig, out, &out_len);
+    ret = out_len;
+
+cleanup:
+    gcry_mpi_release(data);
+    gcry_mpi_release(r_mpi);
+    gcry_mpi_release(s_mpi);
+    gcry_sexp_release(dgst_sexp);
+    gcry_sexp_release(sig_sexp);
+    gcry_sexp_release(r_sexp_item);
+
+    return ret;
+}
+
+static int qcrypto_gcrypt_ecdsa_verify(QCryptoAkCipher *akcipher,
+                                       const void *in, size_t in_len,
+                                       const void *in2, size_t in2_len,
+                                       Error **errp)
+{
+    QCryptoGcryptECDSA *ecdsa = (QCryptoGcryptECDSA *)akcipher;
+    int ret = -1;
+    QCryptoAkCipherECDSASig *sig;
+    gcry_mpi_t sig_s = NULL, sig_r = NULL, dgst_mpi = NULL;
+    gcry_sexp_t sig_sexp = NULL, dgst_sexp = NULL;
+    gcry_error_t err;
+
+    /*
+     * We only check the signature length, dgst length will be handled
+     * by gcrypt, see qcrypto_gcrypt_ecdsa_sign.
+     */
+    if (in_len > akcipher->max_signature_len) {
+        error_setg(errp, "Signature length is greater than %d",
+                   akcipher->max_signature_len);
+        return ret;
+    }
+
+    sig = qcrypto_akcipher_ecdsasig_parse(in, in_len, errp);
+    if (!sig) {
+        return ret;
+    }
+
+    err = gcry_mpi_scan(&sig_r, GCRYMPI_FMT_STD, sig->r.data, sig->r.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse ECDSA signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    err = gcry_mpi_scan(&sig_s, GCRYMPI_FMT_STD, sig->s.data, sig->s.len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse ECDSA signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    err = gcry_sexp_build(&sig_sexp, NULL,
+                          "(sig-val (ecdsa (r %m) (s %m)))", sig_r, sig_s);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_mpi_scan(&dgst_mpi, GCRYMPI_FMT_USG, in2, in2_len, NULL);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to parse scan mpi: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags raw) (value %m))", dgst_mpi);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build dgst: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+
+    err = gcry_pk_verify(sig_sexp, dgst_sexp, ecdsa->key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to verify signature: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    gcry_mpi_release(sig_s);
+    gcry_mpi_release(sig_r);
+    gcry_mpi_release(dgst_mpi);
+    gcry_sexp_release(dgst_sexp);
+    gcry_sexp_release(sig_sexp);
+    qcrypto_akcipher_ecdsasig_free(sig);
+
+    return ret;
+}
+
+static QCryptoAkCipherDriver gcrypt_ecdsa = {
+    .encrypt = qcrypto_gcrypt_invalid_encrypt,
+    .decrypt = qcrypto_gcrypt_invalid_decrypt,
+    .sign = qcrypto_gcrypt_ecdsa_sign,
+    .verify = qcrypto_gcrypt_ecdsa_verify,
+    .free = qcrypto_gcrypt_ecdsa_free,
+};
+
+static QCryptoGcryptECDSA *qcrypto_gcrypt_ecdsa_new(
+    const QCryptoAkCipherOptionsECDSA *opts,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    QCryptoGcryptECDSA *ecdsa = g_new0(QCryptoGcryptECDSA, 1);
+    if (qcrypto_gcrypt_parse_curve_id(ecdsa, opts, errp) != 0) {
+        goto error;
+    }
+    ecdsa->curve_id = opts->curve_id;
+    ecdsa->akcipher.driver = &gcrypt_ecdsa;
+
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        if (qcrypto_gcrypt_parse_ecdsa_private_key(
+            ecdsa, ecdsa->curve_name, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypto_gcrypt_parse_ecdsa_public_key(
+            ecdsa, ecdsa->curve_name, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    default:
+        error_setg(errp, "Unknown akcipher key type %d", type);
+        goto error;
+    }
+
+    return ecdsa;
+
+error:
+    qcrypto_gcrypt_ecdsa_free((QCryptoAkCipher *)ecdsa);
+    return NULL;
+}
 
 bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
@@ -589,6 +978,17 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
             return false;
         }
 
+    case QCRYPTO_AKCIPHER_ALG_ECDSA:
+        switch (opts->u.ecdsa.curve_id) {
+        case QCRYPTO_CURVE_ID_NIST_P192:
+        case QCRYPTO_CURVE_ID_NIST_P256:
+        case QCRYPTO_CURVE_ID_NIST_P384:
+            return true;
+
+        default:
+            return false;
+        }
+
     default:
         return true;
     }
-- 
2.11.0


