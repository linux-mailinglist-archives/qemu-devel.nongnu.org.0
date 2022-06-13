Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D7548293
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:02:01 +0200 (CEST)
Received: from localhost ([::1]:36296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fxQ-0004xb-6j
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fii-0006fR-Fc
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:48 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fig-0001Nb-Gm
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:48 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 187so5147072pfu.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vdcp5/gfud2bu8rGoud9NM888gX0gdOYujIhd6pG9dA=;
 b=pNdaUKksizNHEIHTmAYjmN+P2MmQzAnmjoCGVKpKlAA+TD7Fy638PaXsu3ROhJJfoi
 7jzBhvTaUVeWJyA6/tpQnMvCUVUwv4xWVI9oFLDfnPv5ajBYalOGJFNrhQWJgS5lW3ET
 y5xZJItzTC1B04tyG+W7UcPjuml96JdIhkCl7p1jg51o9LbOGSGo4d8Ltl8wS1YWze7k
 uBo2+Xiqf+TjwwA9kESICJ3NU5ygZuO24jpi7nDggnnLe/Hasd80ffB70Y3tPFKlKYYB
 GsIfwqpZbHSUGDmWJcyoNwXqoj43G0OnZfShzpkLM7Zincp1325/Ynzl3HIRQYIEKZgo
 +Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vdcp5/gfud2bu8rGoud9NM888gX0gdOYujIhd6pG9dA=;
 b=fskZHd4tZGbwPHb5b499CbtHWxVrpzHAs7NigkGD930SxwDe8ZVA0CafAwq405ogNa
 SQETrk+OvEnOt3Q4i5E8fSlR8rwNT4fQZpALlvbXZ8/fzd+2URlOvSsQM92gDrgneLni
 mPReWJEpHzd897nIL7c8B56kuck/qIaWH1b/js4QqbdL88kKZQa4CSUgnZjFf44Lzbz2
 nN+wQsIePKF3vM769ZeSXgxELMoxr9AAEYQt7P3PEqnoBzZ8KAYldJ6W1de43RGto4WH
 AxxcQ9ai0kjsxJ3mn9vYDi4Jw9EMF2LEISjOKuzYAeH6C/ZMryJAc0pbIkncSf//5be+
 LIKw==
X-Gm-Message-State: AOAM532TCpeTQJqm23dUzdCtvE7jxSWIWf5DIOKaPccuwB1FxsqAgBii
 2Y0Gg8lvPLP3/8tx2oTo01VpQw==
X-Google-Smtp-Source: ABdhPJxNxC99WWVb0o9hIU4hdps5wmIrnZK5oK51+iAZDZFGDYy6P59tZU+kr7PW8Y73EALWaB80kA==
X-Received: by 2002:aa7:93a5:0:b0:51b:e0f8:97a6 with SMTP id
 x5-20020aa793a5000000b0051be0f897a6mr51006694pff.44.1655110005218; 
 Mon, 13 Jun 2022 01:46:45 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:44 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 5/7] crypto: Implement ECDSA algorithm by hogweed
Date: Mon, 13 Jun 2022 16:45:29 +0800
Message-Id: <20220613084531.8086-6-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x42c.google.com
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
---
 crypto/akcipher-nettle.c.inc | 268 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 268 insertions(+)

diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
index 02699e6e6d..94d6e0b629 100644
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
@@ -37,6 +40,33 @@ typedef struct QCryptoNettleRSA {
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
@@ -55,6 +85,12 @@ static QCryptoAkCipher *qcrypto_nettle_rsa_new(
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
@@ -64,6 +100,10 @@ QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
     case QCRYPTO_AKCIPHER_ALG_RSA:
         return qcrypto_nettle_rsa_new(&opts->u.rsa, type, key, keylen, errp);
 
+    case QCRYPTO_AKCIPHER_ALG_ECDSA:
+        return qcrypto_nettle_ecdsa_new(&opts->u.ecdsa, type,
+                                        key, keylen, errp);
+
     default:
         error_setg(errp, "Unsupported algorithm: %u", opts->alg);
         return NULL;
@@ -421,6 +461,223 @@ error:
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
+    mpz_t scalar;
+    int ret = -1;
+
+    if (!ecdsa_key) {
+        return ret;
+    }
+    nettle_mpz_init_set_str_256_u(
+        scalar, ecdsa_key->priv.len, ecdsa_key->priv.data);
+    if (ecc_scalar_set(&ecdsa->privkey, scalar) != 1) {
+        goto cleanup;
+    }
+    ret = 0;
+
+cleanup:
+    mpz_clear(scalar);
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
+
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
@@ -445,6 +702,17 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
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


