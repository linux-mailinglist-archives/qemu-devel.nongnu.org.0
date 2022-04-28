Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDE513681
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:12:40 +0200 (CEST)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4so-0003XA-OM
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4l8-0003aI-1v
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4l2-0007uo-1W
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id i62so4064041pgd.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbLj4epjW6ZvurRp3t1wVu3fCU1F78uwTpoV4SHLZDE=;
 b=W4eaiu2v671QD+KeyKKsVnXHr9TgjldcbtWTobOvtrILhcYJuiUvxKhZWEnocI/GHm
 CWSFn6++EvFWlMHMfRZqTFk7XDR+iZs+anvWs8lPt2u1LIjoumCaMyDiVmuTV0Bjkl5R
 JLm1PAZ550w2/7eRwAF8soo0mmzoAgMy/abUFSb0CeVyCdK26pb7tdnQQ4ynTFc2YMBr
 p3ViND+qNhVxwuo/uG6/h/gSF5qrsX+vkdD2MC2ZIgb7Zz53gt2NtQ0AYIeZO2TfpxIZ
 stRVtqGV6eH+XjGWtS47RaN7l/fsDPAZUNjWqtrsXmsOKblJkv3MYXGe9UfVpgK9mNhN
 M7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbLj4epjW6ZvurRp3t1wVu3fCU1F78uwTpoV4SHLZDE=;
 b=ZCZ42r+ezJf2yW6ej58EgzIufIkFTUFQUDlc14rtqYSG+xlm+DEIgUeL9RTIKb/xZT
 VUzaFfk7Y8zqRwB3zftwT8iyXb/tYjWuS1790FZ9jSEpPDXRP+84/6c+z2A4dBLQgFSl
 i+Qc5fCGrqts9Sh+6rgAI02kP0I0gnEM/WtddiYvwAIxrHzi9rC7Sm83lALWnQVnWhTD
 7KINoSAYiSFEsrGei1mGhV4b35iBz/KRxqdYo8pUpoBChpp3oFBXmPthIAmi+taX5Bni
 Sh9mXRI3ffMej6ZF+Il5W1gM0a51Q9yZRbHKBTj+ESXhsNQosbhZoZ1bksAFv2I3LBT2
 3LwA==
X-Gm-Message-State: AOAM533l4bdpo0yUmUYdstwa+CEZfbWgxTlXZPQdWAqqxMVT6xM6u3nQ
 J6wiSBVNG0uWvoxL6vJasWJqBQ==
X-Google-Smtp-Source: ABdhPJxSlosodERzxS/9FDEELC3eVT8tg0s+Prqgs8Ucvix3FVSDMA9qR7CRcGMnyTuSoolRKW0fRQ==
X-Received: by 2002:a63:fb02:0:b0:3c1:9513:2e11 with SMTP id
 o2-20020a63fb02000000b003c195132e11mr898858pgh.258.1651154674022; 
 Thu, 28 Apr 2022 07:04:34 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0050835f6d6a1sm38975pfx.9.2022.04.28.07.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:04:33 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Subject: [PATCH v5 3/9] crypto: Introduce akcipher crypto class
Date: Thu, 28 Apr 2022 21:59:37 +0800
Message-Id: <20220428135943.178254-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428135943.178254-1-pizhenwei@bytedance.com>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x534.google.com
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
Cc: helei.sig11@bytedance.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce new akcipher crypto class 'QCryptoAkCIpher', which supports
basic asymmetric operations: encrypt, decrypt, sign and verify.

Suggested by Daniel P. Berrangé, also add autoptr cleanup for the new
class. Thanks to Daniel!

Co-developed-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 crypto/akcipher.c         | 102 ++++++++++++++++++++++++
 crypto/akcipherpriv.h     |  55 +++++++++++++
 crypto/meson.build        |   1 +
 include/crypto/akcipher.h | 158 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 316 insertions(+)
 create mode 100644 crypto/akcipher.c
 create mode 100644 crypto/akcipherpriv.h
 create mode 100644 include/crypto/akcipher.h

diff --git a/crypto/akcipher.c b/crypto/akcipher.c
new file mode 100644
index 0000000000..ab28bf415b
--- /dev/null
+++ b/crypto/akcipher.c
@@ -0,0 +1,102 @@
+/*
+ * QEMU Crypto akcipher algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: zhenwei pi <pizhenwei@bytedance.com>
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
+#include "crypto/akcipher.h"
+#include "akcipherpriv.h"
+
+QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
+                                      QCryptoAkCipherKeyType type,
+                                      const uint8_t *key, size_t keylen,
+                                      Error **errp)
+{
+    QCryptoAkCipher *akcipher = NULL;
+
+    return akcipher;
+}
+
+bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
+{
+    return false;
+}
+
+int qcrypto_akcipher_encrypt(QCryptoAkCipher *akcipher,
+                             const void *in, size_t in_len,
+                             void *out, size_t out_len, Error **errp)
+{
+    const QCryptoAkCipherDriver *drv = akcipher->driver;
+
+    return drv->encrypt(akcipher, in, in_len, out, out_len, errp);
+}
+
+int qcrypto_akcipher_decrypt(QCryptoAkCipher *akcipher,
+                             const void *in, size_t in_len,
+                             void *out, size_t out_len, Error **errp)
+{
+    const QCryptoAkCipherDriver *drv = akcipher->driver;
+
+    return drv->decrypt(akcipher, in, in_len, out, out_len, errp);
+}
+
+int qcrypto_akcipher_sign(QCryptoAkCipher *akcipher,
+                          const void *in, size_t in_len,
+                          void *out, size_t out_len, Error **errp)
+{
+    const QCryptoAkCipherDriver *drv = akcipher->driver;
+
+    return drv->sign(akcipher, in, in_len, out, out_len, errp);
+}
+
+int qcrypto_akcipher_verify(QCryptoAkCipher *akcipher,
+                            const void *in, size_t in_len,
+                            const void *in2, size_t in2_len, Error **errp)
+{
+    const QCryptoAkCipherDriver *drv = akcipher->driver;
+
+    return drv->verify(akcipher, in, in_len, in2, in2_len, errp);
+}
+
+int qcrypto_akcipher_max_plaintext_len(QCryptoAkCipher *akcipher)
+{
+    return akcipher->max_plaintext_len;
+}
+
+int qcrypto_akcipher_max_ciphertext_len(QCryptoAkCipher *akcipher)
+{
+    return akcipher->max_ciphertext_len;
+}
+
+int qcrypto_akcipher_max_signature_len(QCryptoAkCipher *akcipher)
+{
+    return akcipher->max_signature_len;
+}
+
+int qcrypto_akcipher_max_dgst_len(QCryptoAkCipher *akcipher)
+{
+    return akcipher->max_dgst_len;
+}
+
+void qcrypto_akcipher_free(QCryptoAkCipher *akcipher)
+{
+    const QCryptoAkCipherDriver *drv = akcipher->driver;
+
+    drv->free(akcipher);
+}
diff --git a/crypto/akcipherpriv.h b/crypto/akcipherpriv.h
new file mode 100644
index 0000000000..739f639bcf
--- /dev/null
+++ b/crypto/akcipherpriv.h
@@ -0,0 +1,55 @@
+/*
+ * QEMU Crypto asymmetric algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: zhenwei pi <pizhenwei@bytedance.com>
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
+#ifndef QCRYPTO_AKCIPHERPRIV_H
+#define QCRYPTO_AKCIPHERPRIV_H
+
+#include "qapi/qapi-types-crypto.h"
+
+typedef struct QCryptoAkCipherDriver QCryptoAkCipherDriver;
+
+struct QCryptoAkCipher {
+    QCryptoAkCipherAlgorithm alg;
+    QCryptoAkCipherKeyType type;
+    int max_plaintext_len;
+    int max_ciphertext_len;
+    int max_signature_len;
+    int max_dgst_len;
+    QCryptoAkCipherDriver *driver;
+};
+
+struct QCryptoAkCipherDriver {
+    int (*encrypt)(QCryptoAkCipher *akcipher,
+                   const void *in, size_t in_len,
+                   void *out, size_t out_len, Error **errp);
+    int (*decrypt)(QCryptoAkCipher *akcipher,
+                   const void *out, size_t out_len,
+                   void *in, size_t in_len, Error **errp);
+    int (*sign)(QCryptoAkCipher *akcipher,
+                const void *in, size_t in_len,
+                void *out, size_t out_len, Error **errp);
+    int (*verify)(QCryptoAkCipher *akcipher,
+                  const void *in, size_t in_len,
+                  const void *in2, size_t in2_len, Error **errp);
+    void (*free)(QCryptoAkCipher *akcipher);
+};
+
+#endif /* QCRYPTO_AKCIPHER_H */
diff --git a/crypto/meson.build b/crypto/meson.build
index 19c44bea89..7647d5e243 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -1,6 +1,7 @@
 crypto_ss.add(genh)
 crypto_ss.add(files(
   'afsplit.c',
+  'akcipher.c',
   'block-luks.c',
   'block-qcow.c',
   'block.c',
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
new file mode 100644
index 0000000000..51f5fa2774
--- /dev/null
+++ b/include/crypto/akcipher.h
@@ -0,0 +1,158 @@
+/*
+ * QEMU Crypto asymmetric algorithms
+ *
+ * Copyright (c) 2022 Bytedance
+ * Author: zhenwei pi <pizhenwei@bytedance.com>
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
+#ifndef QCRYPTO_AKCIPHER_H
+#define QCRYPTO_AKCIPHER_H
+
+#include "qapi/qapi-types-crypto.h"
+
+typedef struct QCryptoAkCipher QCryptoAkCipher;
+
+/**
+ * qcrypto_akcipher_supports:
+ * @opts: the asymmetric key algorithm and related options
+ *
+ * Determine if asymmetric key cipher decribed with @opts is
+ * supported by the current configured build
+ *
+ * Returns: true if it is supported, false otherwise.
+ */
+bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts);
+
+/**
+ * qcrypto_akcipher_new:
+ * @opts: specify the algorithm and the related arguments
+ * @type: private or public key type
+ * @key: buffer to store the key
+ * @key_len: the length of key buffer
+ * @errp: error pointer
+ *
+ * Create akcipher context
+ *
+ * Returns: On success, a new QCryptoAkCipher initialized with @opt
+ * is created and returned, otherwise NULL is returned.
+ */
+
+QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
+                                      QCryptoAkCipherKeyType type,
+                                      const uint8_t *key, size_t key_len,
+                                      Error **errp);
+
+/**
+ * qcrypto_akcipher_encrypt:
+ * @akcipher: akcipher context
+ * @in: plaintext pending to be encrypted
+ * @in_len: length of plaintext, less or equal to the size reported
+ *          by a call to qcrypto_akcipher_max_plaintext_len()
+ * @out: buffer to store the ciphertext
+ * @out_len: length of ciphertext, less or equal to the size reported
+ *           by a call to qcrypto_akcipher_max_ciphertext_len()
+ * @errp: error pointer
+ *
+ * Encrypt @in and write ciphertext into @out
+ *
+ * Returns: length of ciphertext if encrypt succeed,
+ *          otherwise -1 is returned
+ */
+int qcrypto_akcipher_encrypt(QCryptoAkCipher *akcipher,
+                             const void *in, size_t in_len,
+                             void *out, size_t out_len, Error **errp);
+
+/**
+ * qcrypto_akcipher_decrypt:
+ * @akcipher: akcipher context
+ * @in: ciphertext to be decrypted
+ * @in_len: the length of ciphertext, less or equal to the size reported
+ *          by a call to qcrypto_akcipher_max_ciphertext_len()
+ * @out: buffer to store the plaintext
+ * @out_len: length of the plaintext buffer, less or equal to the size
+ *           reported by a call to qcrypto_akcipher_max_plaintext_len()
+ * @errp: error pointer
+ *
+ * Decrypt @in and write plaintext into @out
+ *
+ * Returns: length of plaintext if decrypt succeed,
+ *          otherwise -1 is returned
+ */
+int qcrypto_akcipher_decrypt(QCryptoAkCipher *akcipher,
+                             const void *in, size_t in_len,
+                             void *out, size_t out_len, Error **errp);
+
+/**
+ * qcrypto_akcipher_sign:
+ * @akcipher: akcipher context
+ * @in: data to be signed
+ * @in_len: the length of data, less or equal to the size reported
+ *          by a call to qcrypto_akcipher_max_dgst_len()
+ * @out: buffer to store the signature
+ * @out_len: length of the signature buffer, less or equal to the size
+ *           by a call to qcrypto_akcipher_max_signature_len()
+ * @errp: error pointer
+ *
+ * Generate signature for @in, write into @out
+ *
+ * Returns: length of signature if succeed,
+ *          otherwise -1 is returned
+ */
+int qcrypto_akcipher_sign(QCryptoAkCipher *akcipher,
+                          const void *in, size_t in_len,
+                          void *out, size_t out_len, Error **errp);
+
+/**
+ * qcrypto_akcipher_verify:
+ * @akcipher: akcipher context
+ * @in: pointer to the signature
+ * @in_len: length of signature, ess or equal to the size reported
+ *          by a call to qcrypto_akcipher_max_signature_len()
+ * @in2: pointer to original data
+ * @in2_len: the length of original data, less or equal to the size
+ *           by a call to qcrypto_akcipher_max_dgst_len()
+ * @errp: error pointer
+ *
+ * Verify @in and @in2 match or not
+ *
+ * Returns: 0 for succeed,
+ *          otherwise -1 is returned
+ */
+int qcrypto_akcipher_verify(QCryptoAkCipher *akcipher,
+                            const void *in, size_t in_len,
+                            const void *in2, size_t in2_len, Error **errp);
+
+int qcrypto_akcipher_max_plaintext_len(QCryptoAkCipher *akcipher);
+
+int qcrypto_akcipher_max_ciphertext_len(QCryptoAkCipher *akcipher);
+
+int qcrypto_akcipher_max_signature_len(QCryptoAkCipher *akcipher);
+
+int qcrypto_akcipher_max_dgst_len(QCryptoAkCipher *akcipher);
+
+/**
+ * qcrypto_akcipher_free:
+ * @akcipher: akcipher context
+ *
+ * Free the akcipher context
+ *
+ */
+void qcrypto_akcipher_free(QCryptoAkCipher *akcipher);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipher, qcrypto_akcipher_free)
+
+#endif /* QCRYPTO_AKCIPHER_H */
-- 
2.20.1


