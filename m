Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179125544DB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:27:15 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wdl-0006VJ-Q7
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTP-0000UX-TD
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:32 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTN-0007LT-SD
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:31 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l4so15543975pgh.13
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPEIrnTqoADk7L45FDJ9i8TVUiQJQyhzRflA5RokFo0=;
 b=RsHa6TSJbEx0QCDEeRKjjihNmlTgih0/EToVKtts0Upkiy03r8zT54+SDOK4arQGqB
 itVywLk7coPvdSRi/cnAzgm8PDkT69N8eHwvK7aoJwB9MYFmu3wUXqJQyPg6dYoxIsM9
 VQWU96CIUxxL8AV8QOkQNuy00EhGrRbtcbdvAJCh28Y0dTmq4HaYpFDEnjP7Ydv73+O3
 bHqOQnQVgPOoNb+hutD7hmvB7iB/PCelhYXZZAUnP6Q253GRn44kPxl1XqF2eSIWAZqs
 U1J9N6tlYn5X9lXhcaiX9bM9VNmy05p0mILQLRNY/CKnqOneg+XJhsHKv6/lqPSqw2r4
 Si/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPEIrnTqoADk7L45FDJ9i8TVUiQJQyhzRflA5RokFo0=;
 b=wyRVkz0Bt5Ryw0RNulzJyQsg0H12oO1TBOJ8bDeZVSnDDqGm92/uF/ktDpIzbUa2uY
 oQNcLAUwL4Uglsv2ySibG6sAfHSP/EfGsoYLjuPG+LNKL4SJlK+O/W+PKJcJK/DAgkeQ
 y3/XqpikvFHA+IKG7A6YMWKdVoXyonQwtxrmiOcP78Mq5We+xQjwCe4VOkHWtT76LloK
 +LvwuekIqSoNHPR4tnRH6iXT5CuKO9GemXWAjuDsjfitTURoUBdtEYXCJYLcyYeFxgZR
 0jQc6qp5fS3Q9Sbb5I2siRM6Er4Wj8yzLETmrR1RZRQ/8xkpuEulIQmG1V14muOxtOK6
 27Sg==
X-Gm-Message-State: AJIora/7qzxKe+omNLUuJCrMz7FsgxESOqY14+0J3mWYBTOzyPeoPRbP
 zX4c4y3HwZTxifsFumkQ4yiKmGJ5Anu4Xw==
X-Google-Smtp-Source: AGRyM1t9t/yfEBZXxUV8iLAOEpABrFZkdQhrjQUwXuQRi0cmwrc7XLoortNiCpcFE971A0JOsNT2Sg==
X-Received: by 2002:a05:6a00:1350:b0:51c:26d2:9ce5 with SMTP id
 k16-20020a056a00135000b0051c26d29ce5mr34611004pfu.69.1655889387373; 
 Wed, 22 Jun 2022 02:16:27 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.234])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b0016a087cfad8sm9833900plb.264.2022.06.22.02.16.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:16:26 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	f4bug@amsat.org
Cc: mst@redhat.com, pizhenwei@bytedance.com, jasowang@redhat.com,
 helei.sig11@bytedance.com
Subject: [PATCH v2 5/7] crypto: Implement ECDSA algorithm by hogweed
Date: Wed, 22 Jun 2022 17:15:47 +0800
Message-Id: <20220622091549.31115-6-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220622091549.31115-1-helei.sig11@bytedance.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pg1-x52a.google.com
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

Implement ECDSA algorithm by hogweed and nettle.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/akcipher-nettle.c.inc | 282 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
index 02699e6e6d..b6ba53c5d5 100644
--- a/crypto/akcipher-nettle.c.inc
+++ b/crypto/akcipher-nettle.c.inc
@@ -20,6 +20,8 @@
  */
 
 #include <nettle/rsa.h>
+#include <nettle/ecc-curve.h>
+#include <nettle/ecdsa.h>
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
@@ -28,6 +30,7 @@
 #include "qapi/error.h"
 #include "sysemu/cryptodev.h"
 #include "rsakey.h"
+#include "ecdsakey.h"
 
 typedef struct QCryptoNettleRSA {
     QCryptoAkCipher akcipher;
@@ -37,6 +40,32 @@ typedef struct QCryptoNettleRSA {
     QCryptoHashAlgorithm hash_alg;
 } QCryptoNettleRSA;
 
+typedef struct QCryptoNettleECDSA {
+    QCryptoAkCipher akcipher;
+    QCryptoCurveID curve_id;
+    const struct ecc_curve *curve;
+    struct ecc_point pubkey;
+    struct ecc_scalar privkey;
+} QCryptoNettleECDSA;
+
+static int qcrypto_nettle_invalid_encrypt(QCryptoAkCipher *akcipher,
+                                          const void *data, size_t data_len,
+                                          void *enc, size_t enc_len,
+                                          Error **errp)
+{
+    error_setg(errp, "Invalid operation");
+    return -1;
+}
+
+static int qcrypto_nettle_invalid_decrypt(QCryptoAkCipher *akcipher,
+                                          const void *enc, size_t enc_len,
+                                          void *data, size_t data_len,
+                                          Error **errp)
+{
+    error_setg(errp, "Invalid operation");
+    return -1;
+}
+
 static void qcrypto_nettle_rsa_free(QCryptoAkCipher *akcipher)
 {
     QCryptoNettleRSA *rsa = (QCryptoNettleRSA *)akcipher;
@@ -55,6 +84,12 @@ static QCryptoAkCipher *qcrypto_nettle_rsa_new(
     const uint8_t *key,  size_t keylen,
     Error **errp);
 
+static QCryptoAkCipher *qcrypto_nettle_ecdsa_new(
+    const QCryptoAkCipherOptionsECDSA *opts,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp);
+
 QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       QCryptoAkCipherKeyType type,
                                       const uint8_t *key, size_t keylen,
@@ -64,6 +99,10 @@ QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
     case QCRYPTO_AKCIPHER_ALG_RSA:
         return qcrypto_nettle_rsa_new(&opts->u.rsa, type, key, keylen, errp);
 
+    case QCRYPTO_AKCIPHER_ALG_ECDSA:
+        return qcrypto_nettle_ecdsa_new(&opts->u.ecdsa, type,
+                                        key, keylen, errp);
+
     default:
         error_setg(errp, "Unsupported algorithm: %u", opts->alg);
         return NULL;
@@ -421,6 +460,238 @@ error:
     return NULL;
 }
 
+static int qcrypto_nettle_parse_curve_id(
+    QCryptoNettleECDSA *ecdsa,
+    const QCryptoAkCipherOptionsECDSA *opts, Error **errp)
+{
+    /* ECDSA algorithm can't used for encryption */
+    ecdsa->akcipher.max_plaintext_len = 0;
+    ecdsa->akcipher.max_ciphertext_len = 0;
+
+    switch (opts->curve_id) {
+    case QCRYPTO_CURVE_ID_NIST_P192:
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(192 / 8);
+        ecdsa->akcipher.max_dgst_len = 192 / 8;
+        ecdsa->curve = nettle_get_secp_192r1();
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P256:
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(256 / 8);
+        ecdsa->akcipher.max_dgst_len = 256 / 8;
+        ecdsa->curve = nettle_get_secp_256r1();
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P384:
+        ecdsa->akcipher.max_signature_len =
+            qcrypto_akcipher_ecdsasig_x9_62_size(384 / 8);
+        ecdsa->akcipher.max_dgst_len = 256 / 8;
+        ecdsa->curve = nettle_get_secp_384r1();
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
+static void qcrypto_nettle_ecdsa_free(QCryptoAkCipher *akcipher)
+{
+    QCryptoNettleECDSA *ecdsa = (QCryptoNettleECDSA *)akcipher;
+    if (!ecdsa) {
+        return;
+    }
+    ecc_point_clear(&ecdsa->pubkey);
+    ecc_scalar_clear(&ecdsa->privkey);
+    g_free(ecdsa);
+}
+
+static int qcrypt_nettle_parse_ecdsa_private_key(
+    QCryptoNettleECDSA *ecdsa,
+    const uint8_t *key,
+    size_t keylen,
+    Error **errp)
+{
+    g_autoptr(QCryptoAkCipherECDSAKey) ecdsa_key =
+        qcrypto_akcipher_ecdsakey_parse(QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+                                        key, keylen, errp);
+    mpz_t scalar, x, y;
+    int ret = -1;
+
+    if (!ecdsa_key) {
+        return ret;
+    }
+
+    mpz_init(x);
+    mpz_init(y);
+    nettle_mpz_init_set_str_256_u(
+        scalar, ecdsa_key->priv.len, ecdsa_key->priv.data);
+    if (ecc_scalar_set(&ecdsa->privkey, scalar) != 1) {
+        goto cleanup;
+    }
+
+    if (ecdsa_key->pub_x.len && ecdsa_key->pub_y.len) {
+        nettle_mpz_set_str_256_u(x,
+            ecdsa_key->pub_x.len, ecdsa_key->pub_x.data);
+        nettle_mpz_set_str_256_u(y,
+            ecdsa_key->pub_y.len, ecdsa_key->pub_y.data);
+        if (ecc_point_set(&ecdsa->pubkey, x, y) != 1) {
+            goto cleanup;
+        }
+    }
+    ret = 0;
+
+cleanup:
+    mpz_clear(scalar);
+    mpz_clear(x);
+    mpz_clear(y);
+    return ret;
+}
+
+static int qcrypt_nettle_parse_ecdsa_public_key(
+    QCryptoNettleECDSA *ecdsa,
+    const uint8_t *key,
+    size_t keylen,
+    Error **errp)
+{
+    g_autoptr(QCryptoAkCipherECDSAKey) ecdsa_key =
+        qcrypto_akcipher_ecdsakey_parse(QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+                                        key, keylen, errp);
+    mpz_t x, y;
+    int ret = -1;
+
+    if (!ecdsa_key) {
+        return ret;
+    }
+    nettle_mpz_init_set_str_256_u(
+        x, ecdsa_key->pub_x.len, ecdsa_key->pub_x.data);
+    nettle_mpz_init_set_str_256_u(
+        y, ecdsa_key->pub_y.len, ecdsa_key->pub_y.data);
+    if (ecc_point_set(&ecdsa->pubkey, x, y) != 1) {
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    mpz_clear(x);
+    mpz_clear(y);
+    return ret;
+}
+
+static int qcrypto_nettle_ecdsa_sign(QCryptoAkCipher *akcipher,
+                                     const void *data, size_t data_len,
+                                     void *sig, size_t sig_len, Error **errp)
+{
+    QCryptoNettleECDSA *ecdsa = (QCryptoNettleECDSA *)akcipher;
+    int ret = -1;
+    size_t actual_len;
+    struct dsa_signature nettle_sig;
+    g_autoptr(QCryptoAkCipherECDSASig) qcrypto_sig = NULL;
+
+    if (sig_len < akcipher->max_signature_len) {
+        error_setg(errp, "Signature buffer should be not less than: %d",
+                   akcipher->max_signature_len);
+        return ret;
+    }
+    dsa_signature_init(&nettle_sig);
+    qcrypto_sig = qcrypto_akcipher_ecdsasig_alloc(ecdsa->curve_id, errp);
+    ecdsa_sign(&ecdsa->privkey, NULL, wrap_nettle_random_func,
+               data_len, data, &nettle_sig);
+    qcrypto_sig->r.len = nettle_mpz_sizeinbase_256_s(nettle_sig.r);
+    qcrypto_sig->s.len = nettle_mpz_sizeinbase_256_s(nettle_sig.s);
+    nettle_mpz_get_str_256(
+        qcrypto_sig->r.len, qcrypto_sig->r.data, nettle_sig.r);
+    nettle_mpz_get_str_256(
+        qcrypto_sig->s.len, qcrypto_sig->s.data, nettle_sig.s);
+    qcrypto_akcipher_ecdsasig_x9_62_encode(qcrypto_sig, sig, &actual_len);
+    ret = actual_len;
+
+    dsa_signature_clear(&nettle_sig);
+    return ret;
+}
+
+static int qcrypto_nettle_ecdsa_verify(QCryptoAkCipher *akcipher,
+                                       const void *sig, size_t sig_len,
+                                       const void *data, size_t data_len,
+                                       Error **errp)
+{
+    QCryptoNettleECDSA *ecdsa = (QCryptoNettleECDSA *)akcipher;
+    int ret = -1;
+    struct dsa_signature nettle_sig;
+    g_autoptr(QCryptoAkCipherECDSASig) qcrypto_sig = NULL;
+
+    qcrypto_sig = qcrypto_akcipher_ecdsasig_parse(sig, sig_len, errp);
+    if (!qcrypto_sig) {
+        return ret;
+    }
+    dsa_signature_init(&nettle_sig);
+    nettle_mpz_init_set_str_256_u(
+        nettle_sig.r, qcrypto_sig->r.len, qcrypto_sig->r.data);
+    nettle_mpz_init_set_str_256_u(
+        nettle_sig.s, qcrypto_sig->s.len, qcrypto_sig->s.data);
+    if (ecdsa_verify(&ecdsa->pubkey, data_len, data, &nettle_sig) == 1) {
+        ret = 0;
+    } else {
+        error_setg(errp, "Failed to verify signature");
+    }
+
+    dsa_signature_clear(&nettle_sig);
+    return ret;
+}
+
+static QCryptoAkCipherDriver nettle_ecdsa = {
+    .encrypt = qcrypto_nettle_invalid_encrypt,
+    .decrypt = qcrypto_nettle_invalid_decrypt,
+    .sign = qcrypto_nettle_ecdsa_sign,
+    .verify = qcrypto_nettle_ecdsa_verify,
+    .free = qcrypto_nettle_ecdsa_free,
+};
+
+static QCryptoAkCipher *qcrypto_nettle_ecdsa_new(
+    const QCryptoAkCipherOptionsECDSA *opts,
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen,
+    Error **errp)
+{
+    QCryptoNettleECDSA *ecdsa = g_new0(QCryptoNettleECDSA, 1);
+    if (qcrypto_nettle_parse_curve_id(ecdsa, opts, errp) != 0) {
+        goto error;
+    }
+
+    ecdsa->akcipher.driver = &nettle_ecdsa;
+    ecdsa->curve_id = opts->curve_id;
+    ecc_scalar_init(&ecdsa->privkey, ecdsa->curve);
+    ecc_point_init(&ecdsa->pubkey, ecdsa->curve);
+
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        if (qcrypt_nettle_parse_ecdsa_private_key(
+            ecdsa, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        if (qcrypt_nettle_parse_ecdsa_public_key(
+            ecdsa, key, keylen, errp) != 0) {
+            goto error;
+        }
+        break;
+
+    default:
+        error_setg(errp, "Unknown akcipher key type %d", type);
+        goto error;
+    }
+
+    return (QCryptoAkCipher *)ecdsa;
+
+error:
+    qcrypto_nettle_ecdsa_free((QCryptoAkCipher *)ecdsa);
+    return NULL;
+}
 
 bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
@@ -445,6 +716,17 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
         }
         break;
 
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
         return false;
     }
-- 
2.11.0


