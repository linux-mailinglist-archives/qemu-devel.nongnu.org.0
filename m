Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B047533994
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:11:36 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntn3D-0005RD-6z
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ntmuJ-0002Lr-Kx
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:02:20 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ntmuH-0003Em-4i
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:02:19 -0400
Received: by mail-pf1-x430.google.com with SMTP id c14so18699345pfn.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J27HSN/26l4mSe0p+wDKY9IBQUhfByuvjVoRLZxLcjI=;
 b=r8C2sqybRZ85zRdPy0UpZ2G3M+8IXSfaQ4+0erFZkD17BmvYSv10eA7VUYBQ8WcIMS
 GnD1hruaUDuDtaP+Jt6Ia1faUiFi9i9SIPHOd9C3fxwvgBAnMPwta6mAvbVe/cX84lJH
 J4stlASB6sCdtKZZJ0HNa2k3dj2Mla5ZNjVlkUmVMYOEOE9DsmNzH24ICvBDMkURdmhO
 /bOvq6ClCe41RpThT5Qrvucl7Hg19jYtjyztBNn6gYchfsQPQWB+3wgBILGpw6YI9RGv
 fPnu5Us9PMqmWITlX4fVnfLlX7Q2x+qO13xcZOernpYCtpvr1awFmI79OwmCQ5a5h8qe
 8R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J27HSN/26l4mSe0p+wDKY9IBQUhfByuvjVoRLZxLcjI=;
 b=W9otwfC3WqZ5n4KXhXFfbyqlAqX5qFbsZZQkG/TqvZEQJPDRV6442fEKuiUw8Y/8+l
 0HnMZhOa9277YUV19s7dwctJIXLxulgKP+8v4f161d4TUba8Iuzu4uV89fVbYu8yywsZ
 U/RV3rwxGd2ytTl5yXdahtRM5T7YPGSA4SNoTkRXl3lU3D0gJ3/2hDzxG4cc+IouBmdO
 R2+OhmlrcOzDoLiuvDF8nP1hsn+k+dYnTpxLIayKB14r0FANDLTV97eHgrzBXY3Bswfn
 Kc7H7Chsbop2Kq9s+RMj2o1Dco+EREDHXthF7s3TL6/Lw6CJw5NO5ydUJplKYSxKxzJv
 Osnw==
X-Gm-Message-State: AOAM532QR2ju5eSLuFJKBrhgmabXPjOYdchoCvzjakcDIYLFTIWJBQx4
 T80ijSPHoniyn+EjsDwxiAIkXQ==
X-Google-Smtp-Source: ABdhPJxDuPdYJaOrXuKjt5o5A0dFiIbGHKrNYtMSvfmr9z0u9vD4BRBgbIoZsAzXz1QUHHBuzUM6sw==
X-Received: by 2002:a63:80c7:0:b0:3fa:a80c:aefd with SMTP id
 j190-20020a6380c7000000b003faa80caefdmr6265707pgd.351.1653469334567; 
 Wed, 25 May 2022 02:02:14 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.226])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a17090a6aca00b001deb92de665sm1015424pjm.46.2022.05.25.02.02.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 02:02:14 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, jasowang@redhat.com, cohuck@redhat.com,
 pizhenwei@bytedance.com, helei.sig11@bytedance.com
Subject: [PATCH 3/9] crypto: Introduce akcipher crypto class
Date: Wed, 25 May 2022 17:01:12 +0800
Message-Id: <20220525090118.43403-4-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220525090118.43403-1-helei.sig11@bytedance.com>
References: <20220525090118.43403-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x430.google.com
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

From: zhenwei pi <pizhenwei@bytedance.com>

Introduce new akcipher crypto class 'QCryptoAkCIpher', which supports
basic asymmetric operations: encrypt, decrypt, sign and verify.

Suggested by Daniel P. Berrangé, also add autoptr cleanup for the new
class. Thanks to Daniel!

Co-developed-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/akcipher.c         | 102 ++++++++++++++++++++++++++++++
 crypto/akcipherpriv.h     |  55 ++++++++++++++++
 crypto/meson.build        |   1 +
 include/crypto/akcipher.h | 158 ++++++++++++++++++++++++++++++++++++++++++++++
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
index 685fb37097..313f935f27 100644
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
2.11.0


