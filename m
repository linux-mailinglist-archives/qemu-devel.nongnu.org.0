Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A252E548203
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:53:49 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fpU-0005Xr-NV
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fib-0006PP-VX
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiZ-0001M2-GY
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:41 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so5310883pjo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jLoybdhZ8rI68KgKRSB/QPKQ9adxgKqW+o2E3Sep1jc=;
 b=g61eXz3KbOPbzE53AGPk7GdzEyx02IUsx3DrRZqgYYwpJMQsbDi/j1cCWw/78TBOB9
 qE/G8k6i9kQCJZNym+OvvmXlMn3aj8ap+6XcpLdGRrTJShUncZHNLJbFy+zWPjIerKql
 8X9kZmntZBnT+9mQt7X0AhMRvV2XfxSGGka9RhKSJeYqS04Pms1H9mtyijc5K149Tf6O
 m6t6xmOzlnzThCfXGV7tMCGf099bpO1M5yp+kgZOUT/k+8idJpiIssob4Eh4aMyi3VMD
 RKXmQ3GiacVykdJVkHYvL8sBy08/ajfgiGlkijXbj7ftAeEunnCw9oa2j1N9bRktARe9
 OLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLoybdhZ8rI68KgKRSB/QPKQ9adxgKqW+o2E3Sep1jc=;
 b=mldq/JBWn4ynuLsCOgDoeIll3bsy7TYx/RVY/oda7W1WIbavKE0lo26M3TUAh2ORsr
 84AJKec61HlpZ7zsRCOZuHQl66x/GJzAitcrWBcEeX4oUPtVRyxEsdQ5HB+HsXKMoBwF
 thQftU09lKrz9QZJGYfWtX+q6hoVF8aGxn3FZfZ8F2T9MbOF0WDwjFiuCZViqb5nfq5J
 jIkjBKW1euxcvPOCiLdt/2yVMVdcNLDzaUdZz+CKNnbmwzq+X8A8E6tdq2tmwxsRcXhJ
 jfxvWbZt+7U6UJ/VXM3GDnRuv9ZsPwzjTBuoP140bUfEE+ko4/DKaBm5lH6SKID7Cqi5
 NXEA==
X-Gm-Message-State: AOAM532YJtqFlDksAym2MsGDm+wueqYxXX92f+EBnZ6oBJIxCuHK8Pdx
 mqaFEjn7tgND6CwLBaOX7k4ORQ==
X-Google-Smtp-Source: ABdhPJy+dM9/F2CL/700V6iXxd6Ch+0kuO6u7j/9gmtxfpN1y6xfG/ewRfSPwZQoMKXOM2zKV69mPQ==
X-Received: by 2002:a17:90b:38c1:b0:1e8:5df7:cfd8 with SMTP id
 nn1-20020a17090b38c100b001e85df7cfd8mr14435234pjb.79.1655109998019; 
 Mon, 13 Jun 2022 01:46:38 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:37 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 4/7] crypto: Add ECDSA key parser
Date: Mon, 13 Jun 2022 16:45:28 +0800
Message-Id: <20220613084531.8086-5-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x102a.google.com
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

Add ECDSA key parser and ECDSA signautre parser.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
 crypto/ecdsakey.c             | 118 ++++++++++++++++++++
 crypto/ecdsakey.h             |  66 +++++++++++
 crypto/meson.build            |   1 +
 4 files changed, 433 insertions(+)
 create mode 100644 crypto/ecdsakey-builtin.c.inc
 create mode 100644 crypto/ecdsakey.c
 create mode 100644 crypto/ecdsakey.h

diff --git a/crypto/ecdsakey-builtin.c.inc b/crypto/ecdsakey-builtin.c.inc
new file mode 100644
index 0000000000..5da317ec44
--- /dev/null
+++ b/crypto/ecdsakey-builtin.c.inc
@@ -0,0 +1,248 @@
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
+#include "ecdsakey.h"
+
+#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
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
+static int extract_cons_content(void *ctx, const uint8_t *value,
+                                size_t vlen, Error **errp)
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
+static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
+    QCryptoAkCipherECDSAKey *ecdsa,
+    const uint8_t *key, size_t keylen, Error **errp);
+
+static int extract_pubkey(void *ctx, const uint8_t *value,
+                          size_t vlen, Error **errp)
+{
+    QCryptoAkCipherECDSAKey *ecdsa = (QCryptoAkCipherECDSAKey *)ctx;
+    if (vlen < 4) {
+        error_setg(errp, "Public key part too short");
+        return -1;
+    }
+    /* Skip meta bit of BIT STRING */
+    value++;
+    vlen--;
+    return __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
+        ecdsa, value, vlen, errp);
+}
+
+/**
+ *
+ *        ECDSASignature ::= SEQUENCE {
+ *             r           INTEGER
+ *             s           INTEGER
+ *         }
+ */
+QCryptoAkCipherECDSASig *qcrypto_akcipher_ecdsasig_parse(
+    const uint8_t *signature, size_t len, Error **errp)
+{
+    QCryptoAkCipherECDSASig *sig = g_new0(QCryptoAkCipherECDSASig, 1);
+    const uint8_t *seq;
+    size_t seq_length;
+    int decode_ret;
+
+    decode_ret = qcrypto_der_decode_seq(&signature, &len,
+                                        extract_cons_content, &seq, errp);
+
+    if (decode_ret < 0 || len != 0) {
+        goto error;
+    }
+    seq_length = decode_ret;
+
+    if (qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &sig->r, errp) < 0 ||
+        qcrypto_der_decode_int(&seq, &seq_length, extract_mpi,
+                               &sig->s, errp) < 0) {
+        goto error;
+    }
+    if (seq_length != 0) {
+        goto error;
+    }
+
+    return sig;
+
+error:
+    if (errp && !*errp) {
+        error_setg(errp, "Invalid RSA public key");
+    }
+    qcrypto_akcipher_ecdsasig_free(sig);
+    return NULL;
+}
+
+/**
+ *   ECDSAPublicKey: compress-format | x coordinate | y coordinate
+ */
+static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
+    QCryptoAkCipherECDSAKey *ecdsa,
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    if (keylen < 3) {
+        error_setg(errp, "keylen is too short: %zu", keylen);
+        return -1;
+    }
+    if (key[0] != QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED) {
+        error_setg(errp, "Only uncompressed ECDSA public key is supported");
+        return -1;
+    }
+
+    /* Skip format byte */
+    key++;
+    keylen--;
+    if (keylen % 2 != 0) {
+        error_setg(errp, "ECDSA public key's length must be odd");
+        return -1;
+    }
+
+    ecdsa->pub_x.data = g_memdup2(key, keylen / 2);
+    ecdsa->pub_x.len = keylen / 2;
+    ecdsa->pub_y.data = g_memdup2(key + keylen / 2, keylen / 2);
+    ecdsa->pub_y.len = keylen / 2;
+
+    return 0;
+}
+
+static QCryptoAkCipherECDSAKey *qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    QCryptoAkCipherECDSAKey *ecdsa = g_new0(QCryptoAkCipherECDSAKey, 1);
+    if (__qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
+        ecdsa, key, keylen, errp) != 0) {
+        goto error;
+    }
+    return ecdsa;
+
+error:
+    qcrypto_akcipher_ecdsakey_free(ecdsa);
+    return NULL;
+}
+
+/**
+ *     ECDSAPrivateKey ::= SEQUENCE {
+ *          version         INTEGER
+ *             k            OCTET STRING
+ *          parameters [0]    OID         OPTIONAL
+ *          publickey  [1]  BIT STRING    OPTIONAL
+ *     }
+ */
+static QCryptoAkCipherECDSAKey *qcrypto_akcipher_builtin_ecdsa_privkey_parse(
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    QCryptoAkCipherECDSAKey *ecdsa = g_new0(QCryptoAkCipherECDSAKey, 1);
+    uint8_t version;
+    const uint8_t *seq, *pubkey;
+    int decode_ret;
+    size_t seq_length, pubkey_length;
+
+    decode_ret = qcrypto_der_decode_seq(&key, &keylen, extract_cons_content,
+                                        &seq, errp);
+    if (decode_ret < 0 || keylen != 0) {
+        goto error;
+    }
+    seq_length = decode_ret;
+
+    if (qcrypto_der_decode_int(&seq, &seq_length, extract_version,
+                               &version, errp) < 0 ||
+        qcrypto_der_decode_octet_str(&seq, &seq_length, extract_mpi,
+                                     &ecdsa->priv, errp) < 0) {
+        goto error;
+    }
+
+    /* Here we just ignore curve id */
+    qcrypto_der_decode_ctx_tag(&seq, &seq_length, 0, NULL, NULL, NULL);
+
+    decode_ret = qcrypto_der_decode_ctx_tag(&seq, &seq_length, 1,
+                                            extract_cons_content,
+                                            &pubkey, NULL);
+    if (decode_ret > 0) {
+        pubkey_length = decode_ret;
+        if (qcrypto_der_decode_bit_str(&pubkey, &pubkey_length,
+                                       extract_pubkey, ecdsa, errp) < 0 ||
+            pubkey_length != 0) {
+            goto error;
+        }
+    }
+
+    if (seq_length != 0) {
+        goto error;
+    }
+
+    return ecdsa;
+
+error:
+    if (errp && !*errp) {
+        error_setg(errp, "Failed to parse ecdsa private key");
+    }
+    qcrypto_akcipher_ecdsakey_free(ecdsa);
+    return NULL;
+}
+
+QCryptoAkCipherECDSAKey *qcrypto_akcipher_ecdsakey_parse(
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen, Error **errp)
+{
+    switch (type) {
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE:
+        return qcrypto_akcipher_builtin_ecdsa_privkey_parse(key, keylen, errp);
+
+    case QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC:
+        return qcrypto_akcipher_builtin_ecdsa_pubkey_parse(key, keylen, errp);
+
+    default:
+        error_setg(errp, "Unknown key type: %d", type);
+        return NULL;
+    }
+}
diff --git a/crypto/ecdsakey.c b/crypto/ecdsakey.c
new file mode 100644
index 0000000000..466dcffbc7
--- /dev/null
+++ b/crypto/ecdsakey.c
@@ -0,0 +1,118 @@
+/*
+ * QEMU Crypto ECDSA key parser
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
+#include "qemu/osdep.h"
+#include "ecdsakey.h"
+#include "der.h"
+
+void qcrypto_akcipher_ecdsasig_free(QCryptoAkCipherECDSASig *sig)
+{
+    if (!sig) {
+        return;
+    }
+    g_free(sig->r.data);
+    g_free(sig->s.data);
+    g_free(sig);
+}
+
+void qcrypto_akcipher_ecdsasig_x9_62_encode(QCryptoAkCipherECDSASig *sig,
+    uint8_t *dst, size_t *dst_len)
+{
+    size_t r_len, s_len;
+    uint8_t *r_dst, *s_dst;
+    g_autofree uint8_t *buff = NULL;
+
+    qcrypto_der_encode_int(NULL, sig->r.len, NULL, &r_len);
+    qcrypto_der_encode_int(NULL, sig->s.len, NULL, &s_len);
+
+    buff = g_new0(uint8_t, r_len + s_len);
+    r_dst = buff;
+    qcrypto_der_encode_int(sig->r.data, sig->r.len, r_dst, &r_len);
+    s_dst = buff + r_len;
+    qcrypto_der_encode_int(sig->s.data, sig->s.len, s_dst, &s_len);
+
+    qcrypto_der_encode_seq(buff, r_len + s_len, dst, dst_len);
+}
+
+QCryptoAkCipherECDSASig *qcrypto_akcipher_ecdsasig_alloc(
+    QCryptoCurveID curve_id, Error **errp)
+{
+    int keylen;
+    QCryptoAkCipherECDSASig *sig;
+
+    switch (curve_id) {
+    case QCRYPTO_CURVE_ID_NIST_P192:
+        keylen = 192 / 8;
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P256:
+        keylen = 256 / 8;
+        break;
+
+    case QCRYPTO_CURVE_ID_NIST_P384:
+        keylen = 384 / 8;
+        break;
+
+    default:
+        error_setg(errp, "Unknown curve id: %d", curve_id);
+        return NULL;
+    }
+
+    /*
+     * Note: when encoding positive bignum in tow'complement, we have to add
+     * a leading zero if the most significant byte is greater than or
+     * equal to 0x80.
+     */
+    sig = g_new0(QCryptoAkCipherECDSASig, 1);
+    sig->r.data = g_new0(uint8_t, keylen + 1);
+    sig->r.len = keylen + 1;
+    sig->s.data = g_new0(uint8_t, keylen + 1);
+    sig->s.len = keylen + 1;
+    return sig;
+}
+
+size_t qcrypto_akcipher_ecdsasig_x9_62_size(size_t keylen)
+{
+    size_t integer_len;
+    size_t seq_len;
+
+    /*
+     * Note: when encoding positive bignum in tow'complement, we have to add
+     * a leading zero if the most significant byte is greater than or
+     * equal to 0x80.
+     */
+    qcrypto_der_encode_int(NULL, keylen + 1, NULL, &integer_len);
+    qcrypto_der_encode_seq(NULL, integer_len * 2, NULL, &seq_len);
+    return seq_len;
+}
+
+void qcrypto_akcipher_ecdsakey_free(QCryptoAkCipherECDSAKey *ecdsa)
+{
+    if (!ecdsa) {
+        return;
+    }
+    g_free(ecdsa->priv.data);
+    g_free(ecdsa->pub_x.data);
+    g_free(ecdsa->pub_y.data);
+    g_free(ecdsa);
+}
+
+#include "ecdsakey-builtin.c.inc"
diff --git a/crypto/ecdsakey.h b/crypto/ecdsakey.h
new file mode 100644
index 0000000000..a0532a0e75
--- /dev/null
+++ b/crypto/ecdsakey.h
@@ -0,0 +1,66 @@
+/*
+ * QEMU Crypto ECDSA signature parser
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
+#ifndef QCRYPTO_ECDSASIG_H
+#define QCRYPTO_ECDSASIG_H
+
+#include "qemu/host-utils.h"
+#include "crypto/akcipher.h"
+#include "crypto/rsakey.h"
+
+typedef struct QCryptoAkCipherECDSAKey QCryptoAkCipherECDSAKey;
+typedef struct QCryptoAkCipherECDSASig QCryptoAkCipherECDSASig;
+
+struct QCryptoAkCipherECDSASig {
+    QCryptoAkCipherMPI r;
+    QCryptoAkCipherMPI s;
+};
+
+struct QCryptoAkCipherECDSAKey {
+    QCryptoAkCipherMPI priv;
+    QCryptoAkCipherMPI pub_x;
+    QCryptoAkCipherMPI pub_y;
+};
+
+QCryptoAkCipherECDSASig *qcrypto_akcipher_ecdsasig_parse(
+    const uint8_t *sig, size_t len, Error **errp);
+
+QCryptoAkCipherECDSASig *qcrypto_akcipher_ecdsasig_alloc(
+    QCryptoCurveID curve_id, Error **errp);
+
+void qcrypto_akcipher_ecdsasig_free(QCryptoAkCipherECDSASig *sig);
+
+void qcrypto_akcipher_ecdsasig_x9_62_encode(
+    QCryptoAkCipherECDSASig *sig, uint8_t *dst, size_t *dst_len);
+
+size_t qcrypto_akcipher_ecdsasig_x9_62_size(size_t keylen);
+
+QCryptoAkCipherECDSAKey *qcrypto_akcipher_ecdsakey_parse(
+    QCryptoAkCipherKeyType type,
+    const uint8_t *key, size_t keylen, Error **errp);
+
+void qcrypto_akcipher_ecdsakey_free(QCryptoAkCipherECDSAKey *key);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipherECDSASig,
+                              qcrypto_akcipher_ecdsasig_free);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipherECDSAKey,
+                              qcrypto_akcipher_ecdsakey_free);
+#endif
diff --git a/crypto/meson.build b/crypto/meson.build
index 5f03a30d34..36e2e08938 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -7,6 +7,7 @@ crypto_ss.add(files(
   'block.c',
   'cipher.c',
   'der.c',
+  'ecdsakey.c',
   'hash.c',
   'hmac.c',
   'ivgen-essiv.c',
-- 
2.11.0


