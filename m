Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F25544D5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:23:47 +0200 (CEST)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3waQ-0008Us-Hd
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTS-0000VN-Ti
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:36 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTP-0007Ky-VZ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:34 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 p3-20020a17090a428300b001ec865eb4a2so11072055pjg.3
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vo3XO71+0j9yCCAaMuStwHp9brRX3FsHuLnnD5WivWg=;
 b=ksBpFambKD1aeY4PrkR4Y3zLNmMDYIvBIYhKY03sktbB1FZnxi8yKl9lCjqfaHSDoR
 OgkIGAyzemde+KysUNeyVAE6mCXWeQFuGqI86mQRBsPuKf62TD2seGdvLBU+wV1Y8ijp
 eXm3OfUu/JaY6DtByCEYzO7pI7HUOa+rfd7U3+oF9lv+oAzVdSqDv7KHYqgCU7xFteKM
 l8jrENSksCgxUzwUebzZpIM2vd5lGLqh6g/cBYwM/vtFpjF+3OkTLhL16KOPwKuQO8jn
 CVQ+isj+hoQPQsM6kyCHzH4ukr+lU8yCcp8SeRYI/Wrg8yRr9J6OIHHEde/HZJjkDTkd
 Vlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vo3XO71+0j9yCCAaMuStwHp9brRX3FsHuLnnD5WivWg=;
 b=6iZYkG5TqYvLIu2CUlb+9GV+Kv2om5g0WxAUAvvqUzaAFDSousj7RuIBICTwZ7OAMb
 ry1GdMsaXD8fKQjZalP7J5brWLfyzt9xU2uIPWslQVGwORFWfeedOIwYepbgJRAraXv+
 Qahqe2yKWC2/8xPdUP5gKZ3mGVpo+Z3nohUr0L4DLRRxZfdatPlStFn0fnRA5wyQy8h7
 GRm1KxRlBIgsrbE0Cs26999qfhsFE4UkvLrY2uDM1FsEQX2dihpQi1ar8slwHHVUVnIz
 vnXS2xTFMkojauXgSpKauWoYaWEjw/B0S8d9nSKBMT9j5D5fDxdX7M5F9zN6c2sf71jR
 XlPw==
X-Gm-Message-State: AJIora80ClMr/rT20f3IZk1sOpy+RkCiSlo7NV3gn3FlMNxiXW4/xuga
 unM4x1XbZdn97S6tXCB3YdynBtJ9MLxHOg==
X-Google-Smtp-Source: AGRyM1szohMmcS5bPPyLV0QSyLRU++45Q3GiFngSke2prAJ+ApAIS7T1/rretr/fvzmHj4JpiDaJnA==
X-Received: by 2002:a17:902:e5cb:b0:165:1500:a69b with SMTP id
 u11-20020a170902e5cb00b001651500a69bmr32923256plf.29.1655889390842; 
 Wed, 22 Jun 2022 02:16:30 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.234])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b0016a087cfad8sm9833900plb.264.2022.06.22.02.16.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:16:30 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	f4bug@amsat.org
Cc: mst@redhat.com, pizhenwei@bytedance.com, jasowang@redhat.com,
 helei.sig11@bytedance.com
Subject: [PATCH v2 6/7] crypto: Implement ECDSA algorithm by gcrypt
Date: Wed, 22 Jun 2022 17:15:48 +0800
Message-Id: <20220622091549.31115-7-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220622091549.31115-1-helei.sig11@bytedance.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/akcipher-gcrypt.c.inc | 409 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 409 insertions(+)

diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
index abb1fb272e..28dad71deb 100644
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
@@ -470,6 +488,7 @@ static int qcrypto_gcrypt_rsa_verify(QCryptoAkCipher *akcipher,
     gcry_sexp_t sig_sexp = NULL, dgst_sexp = NULL;
     gcry_error_t err;
 
+
     if (in_len > akcipher->max_signature_len) {
         error_setg(errp, "Signature length is greater than key size: %d",
                    akcipher->max_signature_len);
@@ -564,6 +583,385 @@ error:
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
+    g_autofree uint8_t *pubkey = NULL;
+    int ret = -1, pubkey_len;
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
+    /**
+     * Note: Gcrypt cannot automatically calculate the public key from the
+     * private key. If we do not add the public key into private key's
+     * S-expression, the private key will not be able to used for verification.
+     */
+    if (ecdsa_key->pub_x.len != 0 && ecdsa_key->pub_y.len != 0) {
+        /* if public key is found, add it into private key's S-expression */
+        pubkey_len = ecdsa_key->pub_x.len + ecdsa_key->pub_y.len + 1;
+        pubkey = g_new0(uint8_t, pubkey_len);
+        /* 0x04 for uncompressed public key format */
+        pubkey[0] = 0x04;
+        memcpy(pubkey + 1, ecdsa_key->pub_x.data, ecdsa_key->pub_x.len);
+        memcpy(pubkey + 1 + ecdsa_key->pub_x.len,
+            ecdsa_key->pub_y.data, ecdsa_key->pub_y.len);
+
+        err = gcry_sexp_build(&ecdsa->key, NULL,
+            "(private-key (ecc (curve %s) (q %b) (d %m)))",
+            curve_name, pubkey_len, pubkey, d);
+    } else {
+      err = gcry_sexp_build(&ecdsa->key, NULL,
+          "(private-key (ecc (curve %s) (d %m)))", curve_name, d);
+    }
+
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
+    gcry_error_t err;
+    int ret = -1;
+
+    err = gcry_sexp_build(&ecdsa->key, NULL,
+        "(public-key (ecc (curve %s) (q %b)))", curve_name, keylen, key);
+    if (gcry_err_code(err) != 0) {
+        error_setg(errp, "Failed to build ECDSA public key: %s/%s",
+                   gcry_strsource(err), gcry_strerror(err));
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
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
+    /**
+     * Note:
+     * 1. for ECDSA, digest length less than key length is recommended but not
+     * required, truncation occurs when digest is too long, see FIPS 186-4:
+     * https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf.
+     * 2. in order for gcrypt to truncate(if needed) the digest correctly, we
+     * must use the S-expression '(hash hash-alg block)' to store the digest.
+     * When the flags is 'raw', gcrypt will ignore the paramter 'hash-alg'(
+     * in below code, hard encoded as 'sha1').
+     */
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags raw) (hash sha1 %b))", in_len, in);
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
+    /**
+     * gcrypt will ignore the paremeter 'sha1', see commment in function:
+     * qcrypto_gcrypt_ecdsa_verify
+     */
+    err = gcry_sexp_build(&dgst_sexp, NULL,
+                          "(data (flags raw) (hash sha1 %b))", in2_len, in2);
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
@@ -589,6 +987,17 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
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


