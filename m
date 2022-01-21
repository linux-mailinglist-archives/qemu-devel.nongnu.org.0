Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC2495857
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 03:34:20 +0100 (CET)
Received: from localhost ([::1]:59654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAjkp-0002ho-DS
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 21:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjf8-0005MY-VY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:26 -0500
Received: from [2607:f8b0:4864:20::634] (port=38702
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjf5-0002Ba-1q
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:26 -0500
Received: by mail-pl1-x634.google.com with SMTP id c3so7089398pls.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 18:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkDys05u50jgSoEr6OQi7r95A4PzmOy/cRNz0+7Vqbw=;
 b=q5BMZris2TsBw/FWQ9D4YlCvKvUT+rvRbWaniwGRHwvzvKcQJqqUuyG41ZonTYiSss
 1sfR5qid+oJbOdk5GYN6tHllpVpLjiO8BcnS1MvLdUU/myvLn8FumzLRsElPNHSUO8yX
 fPAI8f1kOa1pot7jpABh5F+BZbs/SD5Zy7QgBuWYgsgbDtrdDW/jDAG8E6J9SXLlDCEi
 3UktsCGms2ewHGqWKwXPiqAUkHm+qLIb78LMp++9DqfXEkViXzKvF0ufxf1ANpFbNpmb
 aRdgtbCmwory/J43vfmuIKbhpIjgseqLa/gb43NhTAddPu/2vDuNOV4LX0KSe762b5yE
 8iHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkDys05u50jgSoEr6OQi7r95A4PzmOy/cRNz0+7Vqbw=;
 b=Nb4o17wSXSn8FbP5tEl7ItKNOi5haNGqCrXblTcW3cfefS4mVaKR1rH/KO/h+FQHL6
 J41e3C2PV4verIA9f2OxAsTmdhbsMPab8cyJdIVH+j2fVbCDhYacozj9wHWsiU3rBKn3
 OFxAZasut6oBD3+gWVDvdHxK0pyNw96T3hEPvTVtvyFiZbciVV2V9zrd487wmHIKeay8
 rWLo9y6GpOYuqWRjDAuUGfpWuPeyVXfbrRO6SC+zjygSNR7qa8mHL6Bxn+1ebj259tud
 eB2y04IqOrx5R/xKKtZXI4m9J7zRBCTshn+Dl9Lg8KQmt6DzQwXD9mbQyIrUhbgNXmYq
 ACOA==
X-Gm-Message-State: AOAM530qs97X/ya6/IFPM6jll1DfdtpUXh/XB+SDvTM6VAHImoGo3+NW
 i8VYcsuJLP4oOKe7hg2BwKFnRaHLLfSGqQ==
X-Google-Smtp-Source: ABdhPJyLEsrMIjWX9d/YtkNvpSqlYifA3ftZ6amj4s7TjJweEblnbO6opYy5ZoVBVnfAawwJy1Uysw==
X-Received: by 2002:a17:903:228c:b0:14a:fe2b:aeba with SMTP id
 b12-20020a170903228c00b0014afe2baebamr1700280plh.127.1642732101703; 
 Thu, 20 Jan 2022 18:28:21 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id d1sm4825404pfj.179.2022.01.20.18.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 18:28:21 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH 3/3] crypto: Introduce RSA algorithm
Date: Fri, 21 Jan 2022 10:27:00 +0800
Message-Id: <20220121022700.1042649-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121022700.1042649-1-pizhenwei@bytedance.com>
References: <20220121022700.1042649-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 helei.sig11@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lei He <helei.sig11@bytedance.com>

Implement RSA algorithm by nettle hogweed, and apply it for
virtio-crypto akcipher backend.

1, The self-test framework of crypto layer works fine in guest kernel
2, Test with Linux guest(with asym support), the following script
test(note that pkey_XXX is supported only in a newer version of keyutils):
  - both public key & private key
  - create/close session
  - encrypt/decrypt/sign/verify basic driver operation
  - also test with kernel crypto layer(pkey add/query)

All the cases work fine.

rm -rf *.der *.pem *.pfx
modprobe pkcs8_key_parser # if CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
rm -rf /tmp/data
dd if=/dev/random of=/tmp/data count=1 bs=226

openssl req -nodes -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/C=CN/ST=BJ/L=HD/O=qemu/OU=dev/CN=qemu/emailAddress=qemu@qemu.org"
openssl pkcs8 -in key.pem -topk8 -nocrypt -outform DER -out key.der
openssl x509 -in cert.pem -inform PEM -outform DER -out cert.der

PRIV_KEY_ID=`cat key.der | keyctl padd asymmetric test_priv_key @s`
echo "priv key id = "$PRIV_KEY_ID
PUB_KEY_ID=`cat cert.der | keyctl padd asymmetric test_pub_key @s`
echo "pub key id = "$PUB_KEY_ID

keyctl pkey_query $PRIV_KEY_ID 0
keyctl pkey_query $PUB_KEY_ID 0

echo "Enc with priv key..."
keyctl pkey_encrypt $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.priv
echo "Dec with pub key..."
keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.priv enc=pkcs1 >/tmp/dec
cmp /tmp/data /tmp/dec

echo "Sign with priv key..."
keyctl pkey_sign $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 hash=sha1 > /tmp/sig
echo "Verify with pub key..."
keyctl pkey_verify $PRIV_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1

echo "Enc with pub key..."
keyctl pkey_encrypt $PUB_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.pub
echo "Dec with priv key..."
keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.pub enc=pkcs1 >/tmp/dec
cmp /tmp/data /tmp/dec

echo "Verify with pub key..."
keyctl pkey_verify $PUB_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/akcipher-nettle.c | 486 +++++++++++++++++++++++++++++++++++++++
 crypto/akcipher.c        |  13 ++
 crypto/asn1_decoder.c    | 185 +++++++++++++++
 crypto/asn1_decoder.h    |  42 ++++
 crypto/meson.build       |   3 +
 meson.build              |  11 +
 6 files changed, 740 insertions(+)
 create mode 100644 crypto/akcipher-nettle.c
 create mode 100644 crypto/asn1_decoder.c
 create mode 100644 crypto/asn1_decoder.h

diff --git a/crypto/akcipher-nettle.c b/crypto/akcipher-nettle.c
new file mode 100644
index 0000000000..6ac39e7abc
--- /dev/null
+++ b/crypto/akcipher-nettle.c
@@ -0,0 +1,486 @@
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
+#include <stdbool.h>
+
+#include <nettle/rsa.h>
+
+#include "asn1_decoder.h"
+#include "crypto/akcipher.h"
+#include "crypto/random.h"
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "sysemu/cryptodev.h"
+#include "standard-headers/linux/virtio_crypto.h"
+
+typedef struct QCryptoNettleRsa {
+    QCryptoAkcipher akcipher;
+    struct rsa_public_key pub;
+    struct rsa_private_key priv;
+    int padding_algo;
+    int hash_algo;
+} QCryptoNettleRsa;
+
+struct asn1_parse_ctx {
+    const uint8_t *data;
+    size_t dlen;
+};
+
+static int extract_value(void *p, const uint8_t *data, size_t dlen)
+{
+    struct asn1_parse_ctx *ctx = (struct asn1_parse_ctx *)p;
+    ctx->data = (uint8_t *)data;
+    ctx->dlen = dlen;
+
+    return 0;
+}
+
+static int extract_mpi(void *p, const uint8_t *data, size_t dlen)
+{
+    mpz_t *target = (mpz_t *)p;
+    nettle_mpz_set_str_256_u(*target, dlen, data);
+
+    return 0;
+}
+
+static QCryptoNettleRsa *qcrypto_nettle_rsa_malloc(void);
+
+static void qcrypto_nettle_rsa_destroy(void *ptr)
+{
+    QCryptoNettleRsa *rsa = (QCryptoNettleRsa *)ptr;
+    if (!rsa) {
+        return;
+    }
+
+    rsa_public_key_clear(&rsa->pub);
+    rsa_private_key_clear(&rsa->priv);
+    g_free(rsa);
+}
+
+static QCryptoAkcipher *qcrypto_nettle_new_rsa(bool private, const uint8_t *key,
+                                               size_t keylen, void *para,
+                                               int index,  Error **errp);
+
+QCryptoAkcipher *qcrypto_akcipher_nettle_new(uint32_t alg, bool private,
+                                             const uint8_t *key,
+                                             size_t keylen, void *para,
+                                             int index, Error **errp);
+
+QCryptoAkcipher *qcrypto_akcipher_nettle_new(uint32_t alg, bool private,
+                                             const uint8_t *key,
+                                             size_t keylen, void *para,
+                                             int index, Error **errp)
+{
+    switch (alg) {
+    case VIRTIO_CRYPTO_AKCIPHER_RSA:
+        return qcrypto_nettle_new_rsa(private, key, keylen, para, index, errp);
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", alg);
+        return NULL;
+    }
+
+    return NULL;
+}
+
+/*
+ * Parse ber encoded rsa private key, asn1 schema:
+ *        RsaPrivKey ::= SEQUENCE {
+ *             version     INTEGER
+ *             n           INTEGER
+ *             e           INTEGER
+ *             d           INTEGER
+ *             p           INTEGER
+ *             q           INTEGER
+ *             e1          INTEGER
+ *             e2          INTEGER
+ *             u           INTEGER
+ *         }
+ */
+static int parse_rsa_private_key(QCryptoNettleRsa *rsa,
+                                 const uint8_t *key, size_t keylen)
+{
+    struct asn1_parse_ctx ctx;
+
+    if (ber_decode_seq(&key, &keylen, extract_value, &ctx) != 0 ||
+        keylen != 0) {
+        return -1;
+    }
+
+    if (ber_decode_int(&ctx.data, &ctx.dlen, NULL, NULL) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->pub.n) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->pub.e) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.d) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.p) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.q) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.a) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.b) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->priv.c) != 0 ||
+        ctx.dlen != 0) {
+        return -1;
+    }
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        return -1;
+    }
+
+    /*
+     * Since in the kernel's unit test, the p, q, a, b, c of some
+     * private keys is 0, only the simplest length check is done here
+     */
+    rsa->priv.size = rsa->pub.size;
+
+    return 0;
+}
+
+/*
+ * Parse ber encoded rsa pubkey, asn1 schema:
+ *        RsaPrivKey ::= SEQUENCE {
+ *             n           INTEGER
+ *             e           INTEGER
+ *         }
+ */
+static int parse_rsa_public_key(QCryptoNettleRsa *rsa,
+                                const uint8_t *key,
+                                size_t keylen)
+{
+    struct asn1_parse_ctx ctx;
+
+    if (ber_decode_seq(&key, &keylen, extract_value, &ctx) != 0 ||
+        keylen != 0) {
+        return -1;
+    }
+
+    if (ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->pub.n) != 0 ||
+        ber_decode_int(&ctx.data, &ctx.dlen, extract_mpi, &rsa->pub.e) != 0 ||
+        ctx.dlen != 0) {
+        return -1;
+    }
+
+    if (!rsa_public_key_prepare(&rsa->pub)) {
+        return -1;
+    }
+
+    return 0;
+}
+
+static QCryptoAkcipher *qcrypto_nettle_new_rsa(bool private, const uint8_t *key,
+                                               size_t keylen, void *para,
+                                               int index, Error **errp)
+{
+    QCryptoNettleRsa *rsa = qcrypto_nettle_rsa_malloc();
+    CryptoDevBackendRsaPara *p = (CryptoDevBackendRsaPara *)para;
+    rsa->padding_algo = p->padding_algo;
+    rsa->hash_algo = p->hash_algo;
+
+    if (private && parse_rsa_private_key(rsa, key, keylen) == 0) {
+        return (QCryptoAkcipher *)rsa;
+    } else if (!private && parse_rsa_public_key(rsa, key, keylen) == 0) {
+        return (QCryptoAkcipher *)rsa;
+    }
+
+    qcrypto_nettle_rsa_destroy(rsa);
+    error_setg(errp, "Failed to parse %s key", private ? "private" : "public");
+
+    return NULL;
+}
+
+
+/*
+ * nettle does not provide RSA interfaces without padding,
+ * here we implemented rsa algorithm with nettle/mpz.
+ */
+static int _rsa_enc_raw(QCryptoNettleRsa *rsa, const void *data,
+                        size_t data_len, void *enc,
+                        size_t enc_len, Error **errp)
+{
+    mpz_t m;
+
+    nettle_mpz_init_set_str_256_u(m, data_len, data);
+    /* (1) Validate 0 <= m < n */
+    if (mpz_cmp_ui(m, 0) < 0 || mpz_cmp(m, rsa->pub.n) >= 0) {
+        error_setg(errp, "Failed to validate input data");
+        return -VIRTIO_CRYPTO_BADMSG;
+    }
+
+    /* (2) c = m ^ e mod n */
+    mpz_powm(m, m, rsa->pub.e, rsa->pub.n);
+    nettle_mpz_get_str_256(enc_len, (uint8_t *)enc, m);
+
+    mpz_clear(m);
+
+    return 0;
+}
+
+static int _rsa_dec_raw(QCryptoNettleRsa *rsa,
+                        const void *enc,
+                        size_t enc_len,
+                        void *data,
+                        size_t data_len,
+                        Error **errp)
+{
+    mpz_t c;
+    nettle_mpz_init_set_str_256_u(c, enc_len, enc);
+
+    /* (1) Validate 0 <= c < n */
+    if (mpz_cmp_ui(c, 0) < 0 || mpz_cmp(c, rsa->pub.n) >= 0) {
+        error_setg(errp, "Failed to validate input data");
+        return -VIRTIO_CRYPTO_BADMSG;
+    }
+
+    /* (2) m = c ^ d mod n */
+    mpz_powm(c, c, rsa->priv.d, rsa->pub.n);
+    nettle_mpz_get_str_256(data_len, (uint8_t *)data, c);
+    mpz_clear(c);
+
+    return 0;
+}
+
+static void wrap_nettle_random_func(void *ctx, size_t len, uint8_t *out)
+{
+    /* TODO: check result */
+    qcrypto_random_bytes(out, len, NULL);
+}
+
+static int qcrypto_nettle_rsa_encrypt(QCryptoAkcipher *akcipher_driver,
+                                      const void *data, size_t data_len,
+                                      void *enc, size_t enc_len,
+                                      Error **errp)
+{
+
+    QCryptoNettleRsa *rsa =
+        container_of(akcipher_driver, QCryptoNettleRsa, akcipher);
+    mpz_t c;
+    int enc_ret;
+
+    if (data_len > rsa->pub.size || enc_len < rsa->pub.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -VIRTIO_CRYPTO_BADMSG;
+    }
+
+    switch (rsa->padding_algo) {
+    case VIRTIO_CRYPTO_RSA_RAW_PADDING:
+        return _rsa_enc_raw(rsa, data, data_len, enc, enc_len, errp);
+
+    case VIRTIO_CRYPTO_RSA_PKCS1_PADDING:
+        mpz_init(c);
+        enc_ret = rsa_encrypt(&rsa->pub, NULL, wrap_nettle_random_func,
+                              data_len, (uint8_t *)data, c);
+        if (enc_ret != 1) {
+            error_setg(errp, "Failed to encrypt");
+        } else {
+            nettle_mpz_get_str_256(enc_len, (uint8_t *)enc, c);
+        }
+        mpz_clear(c);
+        return enc_ret == 1 ? 0 : -1;
+
+    default:
+        error_setg(errp, "Unknown padding");
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    return -1;
+}
+
+static int qcrypto_nettle_rsa_decrypt(QCryptoAkcipher *akcipher,
+                                      const void *enc, size_t enc_len,
+                                      void *data, size_t data_len,
+                                      Error **errp)
+{
+    QCryptoNettleRsa *rsa = container_of(akcipher, QCryptoNettleRsa, akcipher);
+    mpz_t m;
+    int dec_ret;
+
+    if (enc_len > rsa->priv.size || data_len < rsa->priv.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -VIRTIO_CRYPTO_BADMSG;
+    }
+
+    switch (rsa->padding_algo) {
+    case VIRTIO_CRYPTO_RSA_RAW_PADDING:
+        return _rsa_dec_raw(rsa, enc, enc_len, data, data_len, errp);
+
+    case VIRTIO_CRYPTO_RSA_PKCS1_PADDING:
+        mpz_init(m);
+        dec_ret = rsa_encrypt(&rsa->pub, NULL, wrap_nettle_random_func,
+                              data_len, (uint8_t *)data, m);
+        if (dec_ret != 1) {
+            error_setg(errp, "Failed to encrypt");
+        } else {
+            nettle_mpz_get_str_256(data_len, (uint8_t *)data_len, m);
+        }
+        mpz_clear(m);
+        return dec_ret == 1 ? 0 : -1;
+
+    default:
+        error_setg(errp, "Unknown padding");
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    return -1;
+}
+
+
+static int qcrypto_nettle_rsa_sign(QCryptoAkcipher *akcipher,
+                                   const void *data, size_t data_len,
+                                   void *sig, size_t sig_len, Error **errp)
+{
+    QCryptoNettleRsa *rsa = container_of(akcipher, QCryptoNettleRsa, akcipher);
+    int ret;
+    mpz_t s;
+
+    /*
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
+        error_setg(errp, "Try to make signature without padding");
+        return -VIRTIO_CRYPTO_NOTSUPP;
+    }
+
+    if (data_len > rsa->priv.size || sig_len < rsa->priv.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -VIRTIO_CRYPTO_BADMSG;
+    }
+
+    mpz_init(s);
+    switch (rsa->hash_algo) {
+    case VIRTIO_CRYPTO_RSA_MD5:
+        ret = rsa_md5_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA1:
+        ret = rsa_sha1_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA256:
+        ret = rsa_sha256_sign_digest(&rsa->priv, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA512:
+        ret = rsa_sha512_sign_digest(&rsa->priv, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unknown hash algorithm");
+        ret = -VIRTIO_CRYPTO_NOTSUPP;
+        goto clear;
+    }
+
+    if (ret != 1) {
+        error_setg(errp, "Failed to make signature");
+        ret = -VIRTIO_CRYPTO_BADMSG;
+        goto clear;
+    }
+    nettle_mpz_get_str_256(sig_len, (uint8_t *)sig, s);
+    ret = 0;
+
+clear:
+    mpz_clear(s);
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_verify(QCryptoAkcipher *akcipher,
+                                     const void *sig, size_t sig_len,
+                                     const void *data, size_t data_len,
+                                     Error **errp)
+{
+    QCryptoNettleRsa *rsa = container_of(akcipher, QCryptoNettleRsa, akcipher);
+
+    int ret;
+    mpz_t s;
+
+    /*
+     * The RSA algorithm cannot be used for signature/verification
+     * without padding.
+     */
+    if (rsa->padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
+        error_setg(errp, "Operation not supported");
+        return -1;
+    }
+    if (data_len > rsa->pub.size || sig_len < rsa->pub.size) {
+        error_setg(errp, "Invalid buffer size");
+        return -1;
+    }
+
+    nettle_mpz_init_set_str_256_u(s, sig_len, sig);
+    switch (rsa->hash_algo) {
+    case VIRTIO_CRYPTO_RSA_MD5:
+        ret = rsa_md5_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA1:
+        ret = rsa_sha1_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA256:
+        ret = rsa_sha256_verify_digest(&rsa->pub, data, s);
+        break;
+
+    case VIRTIO_CRYPTO_RSA_SHA512:
+        ret = rsa_sha512_verify_digest(&rsa->pub, data, s);
+        break;
+
+    default:
+        error_setg(errp, "Unknown hash algorithm");
+        ret = -VIRTIO_CRYPTO_NOTSUPP;
+        goto clear;
+    }
+
+    if (ret != 1) {
+        error_setg(errp, "Failed to verify");
+        ret = -VIRTIO_CRYPTO_KEY_REJECTED;
+        goto clear;
+    }
+    ret = 0;
+
+clear:
+    mpz_clear(s);
+
+    return ret;
+}
+
+static int qcrypto_nettle_rsa_free(struct QCryptoAkcipher *akcipher,
+                                   Error **errp)
+{
+    qcrypto_nettle_rsa_destroy(akcipher);
+
+    return 0;
+}
+
+QCryptoAkcipherDriver nettle_rsa = {
+    .encrypt = qcrypto_nettle_rsa_encrypt,
+    .decrypt = qcrypto_nettle_rsa_decrypt,
+    .sign = qcrypto_nettle_rsa_sign,
+    .verify = qcrypto_nettle_rsa_verify,
+    .free = qcrypto_nettle_rsa_free,
+};
+
+static QCryptoNettleRsa *qcrypto_nettle_rsa_malloc(void)
+{
+    QCryptoNettleRsa *rsa = g_malloc0(sizeof(QCryptoNettleRsa));
+    memset(rsa, 0, sizeof(QCryptoNettleRsa));
+    rsa->akcipher.driver = &nettle_rsa;
+    rsa_public_key_init(&rsa->pub);
+    rsa_private_key_init(&rsa->priv);
+
+    return rsa;
+}
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index ac8d1c9bf1..f5bdc35e18 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -24,6 +24,12 @@
 #include "qapi/error.h"
 #include "crypto/akcipher.h"
 
+QCryptoAkcipher *qcrypto_akcipher_nettle_new(uint32_t alg, bool private,
+                                             const uint8_t *key,
+                                             size_t keylen,
+                                             void *para,
+                                             int index, Error **errp);
+
 QCryptoAkcipher *qcrypto_akcipher_new(uint32_t alg, bool private,
                                       const uint8_t *key, size_t keylen,
                                       void *para,
@@ -31,6 +37,13 @@ QCryptoAkcipher *qcrypto_akcipher_new(uint32_t alg, bool private,
 {
     QCryptoAkcipher *akcipher = NULL;
 
+#ifdef CONFIG_HOGWEED
+    akcipher = qcrypto_akcipher_nettle_new(alg, private, key, keylen,
+                                           para, index, errp);
+#else
+    error_setg(errp, "qcrypto akcipher has no nettle/hogweed support");
+#endif
+
     return akcipher;
 }
 
diff --git a/crypto/asn1_decoder.c b/crypto/asn1_decoder.c
new file mode 100644
index 0000000000..bfb145e84e
--- /dev/null
+++ b/crypto/asn1_decoder.c
@@ -0,0 +1,185 @@
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
+#include <stdint.h>
+#include <stddef.h>
+
+#include "crypto/asn1_decoder.h"
+
+enum ber_type_tag {
+    ber_type_tag_bool = 0x1,
+    ber_type_tag_int = 0x2,
+    ber_type_tag_bit_str = 0x3,
+    ber_type_tag_oct_str = 0x4,
+    ber_type_tag_oct_null = 0x5,
+    ber_type_tag_oct_oid = 0x6,
+    ber_type_tag_seq = 0x10,
+    ber_type_tag_set = 0x11,
+};
+
+#define BER_CONSTRUCTED_MASK 0x20
+#define BER_SHORT_LEN_MASK 0x80
+
+static uint8_t ber_peek_byte(const uint8_t **data, size_t *dlen)
+{
+    return **data;
+}
+
+static int invoke_callback(BerDecodeCb cb, void *ctx,
+                           const uint8_t *value, size_t vlen)
+{
+    if (!cb) {
+        return 0;
+    }
+
+    return cb(ctx, value, vlen);
+}
+
+static void ber_cut_nbytes(const uint8_t **data, size_t *dlen,
+                           size_t nbytes)
+{
+    *data += nbytes;
+    *dlen -= nbytes;
+}
+
+static uint8_t ber_cut_byte(const uint8_t **data, size_t *dlen)
+{
+    uint8_t val = ber_peek_byte(data, dlen);
+
+    ber_cut_nbytes(data, dlen, 1);
+
+    return val;
+}
+
+static int ber_extract_definite_data(const uint8_t **data, size_t *dlen,
+                                     BerDecodeCb cb, void *ctx)
+{
+    const uint8_t *value;
+    size_t vlen = 0;
+    uint8_t byte_count = ber_cut_byte(data, dlen);
+
+    /* short format of definite-length */
+    if (!(byte_count & BER_SHORT_LEN_MASK)) {
+        if (byte_count > *dlen) {
+            return -1;
+        }
+
+        value = *data;
+        vlen = byte_count;
+        ber_cut_nbytes(data, dlen, vlen);
+
+        return invoke_callback(cb, ctx, value, vlen);
+    }
+
+    /* Ignore highest bit */
+    byte_count &= ~BER_SHORT_LEN_MASK;
+
+    /*
+     * size_t is enough to express the length, although the ber encoding
+     * standard supports larger length.
+     */
+    if (byte_count > sizeof(size_t)) {
+        return -1;
+    }
+
+    while (byte_count--) {
+        vlen <<= 8;
+        vlen += ber_cut_byte(data, dlen);
+    }
+
+    if (vlen > *dlen) {
+        return -1;
+    }
+
+    value = *data;
+    ber_cut_nbytes(data, dlen, vlen);
+
+    return invoke_callback(cb, ctx, value, vlen);
+}
+
+static int ber_extract_undefinite_data(const uint8_t **data, size_t *dlen,
+                                       BerDecodeCb cb, void *ctx)
+{
+    size_t vlen = 0;
+    const uint8_t *value;
+
+    if (*dlen < 3) {
+        return -1;
+    }
+
+    /* skip undefinite-length-mask 0x80 */
+    ber_cut_nbytes(data, dlen, 1);
+
+    value = *data;
+    while (vlen < *dlen) {
+        if ((*data)[vlen] != 0) {
+            vlen++;
+            continue;
+        }
+
+        if (vlen + 1 < *dlen && (*data[vlen + 1] == 0)) {
+            ber_cut_nbytes(data, dlen, vlen + 2);
+            return invoke_callback(cb, ctx, value, vlen);
+        }
+
+        vlen += 2;
+    }
+
+    return -1;
+}
+
+static int ber_extract_data(const uint8_t **data, size_t *dlen,
+                            BerDecodeCb cb, void *ctx)
+{
+    uint8_t val = ber_peek_byte(data, dlen);
+
+    if (val == BER_SHORT_LEN_MASK) {
+        return ber_extract_undefinite_data(data, dlen, cb, ctx);
+    }
+
+    return ber_extract_definite_data(data, dlen, cb, ctx);
+}
+
+int ber_decode_int(const uint8_t **data, size_t *dlen,
+                   BerDecodeCb cb, void *ctx)
+{
+    uint8_t tag = ber_cut_byte(data, dlen);
+
+    /* INTEGER must encoded in primitive-form */
+    if (tag != ber_type_tag_int) {
+        return -1;
+    }
+
+    return ber_extract_data(data, dlen, cb, ctx);
+}
+
+int ber_decode_seq(const uint8_t **data, size_t *dlen,
+                   BerDecodeCb cb, void *ctx)
+{
+    uint8_t val = ber_cut_byte(data, dlen);
+
+    /* SEQUENCE must use constructed form */
+    if (val != (ber_type_tag_seq | BER_CONSTRUCTED_MASK)) {
+        return -1;
+    }
+
+    return ber_extract_data(data, dlen, cb, ctx);
+}
diff --git a/crypto/asn1_decoder.h b/crypto/asn1_decoder.h
new file mode 100644
index 0000000000..d33a7c81c4
--- /dev/null
+++ b/crypto/asn1_decoder.h
@@ -0,0 +1,42 @@
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
+#ifndef QCRYPTO_ASN1_DECODER_H
+#define QCRYPTO_ASN1_DECODER_H
+
+/*
+ *  ctx: user content.
+ *  value: the starting address of |value| part of 'Tag-Length-Value' pattern.
+ *  vlen: length of the |value|.
+ */
+typedef int (*BerDecodeCb) (void *ctx, const uint8_t *value, size_t vlen);
+
+int ber_decode_int(const uint8_t **data,
+                   size_t *dlen,
+                   BerDecodeCb cb,
+                   void *ctx);
+
+int ber_decode_seq(const uint8_t **data,
+                   size_t *dlen,
+                   BerDecodeCb cb,
+                   void *ctx);
+
+#endif  /* QCRYPTO_ASN1_DECODER_H */
diff --git a/crypto/meson.build b/crypto/meson.build
index 72b36f450a..28d14cb153 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -27,6 +27,9 @@ if nettle.found()
   if xts == 'private'
     crypto_ss.add(files('xts.c'))
   endif
+  if hogweed.found()
+    crypto_ss.add(gmp, hogweed, files('akcipher-nettle.c', 'asn1_decoder.c'))
+  endif
 elif gcrypt.found()
   crypto_ss.add(gcrypt, files('hash-gcrypt.c', 'hmac-gcrypt.c', 'pbkdf-gcrypt.c'))
 elif gnutls_crypto.found()
diff --git a/meson.build b/meson.build
index 333c61deba..373c04fecb 100644
--- a/meson.build
+++ b/meson.build
@@ -1023,6 +1023,7 @@ endif
 # gcrypt over nettle for performance reasons.
 gcrypt = not_found
 nettle = not_found
+hogweed = not_found
 xts = 'none'
 
 if get_option('nettle').enabled() and get_option('gcrypt').enabled()
@@ -1060,6 +1061,14 @@ if not gnutls_crypto.found()
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
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
@@ -1512,6 +1521,7 @@ config_host_data.set('CONFIG_GNUTLS', gnutls.found())
 config_host_data.set('CONFIG_GNUTLS_CRYPTO', gnutls_crypto.found())
 config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
 config_host_data.set('CONFIG_NETTLE', nettle.found())
+config_host_data.set('CONFIG_HOGWEED', hogweed.found())
 config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
@@ -3406,6 +3416,7 @@ summary_info += {'libgcrypt':         gcrypt}
 summary_info += {'nettle':            nettle}
 if nettle.found()
    summary_info += {'  XTS':             xts != 'private'}
+   summary_info += {'  hogweed':         hogweed.found()}
 endif
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
-- 
2.25.1


