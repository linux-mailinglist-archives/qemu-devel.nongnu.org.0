Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B9534D9E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:59:28 +0200 (CEST)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBDD-0001Dv-G7
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB04-00007Z-Ne
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB01-0007y7-T3
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653561947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tj2rWfNstHPbm8VubLPJ4b3ThW7UUCFbNA0iDpjwaIw=;
 b=DV0Dl34XFRZFnPGXcgDA/gYZle+eYPvAnCDKEEK5VqkLSUlrD+aO4iDwrczcGbJdXayz2k
 SRL4JVw4JvbHpJapQP82vZSPHatPQQkoKMeYXV4DZEjTrOSA7yE3bgJg1/N4cYRM2xWvbo
 V1r8Ez11esbCSXAYbUOOhapqATv3lvU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-18RR_cgDOOmTBF2_iTzhAw-1; Thu, 26 May 2022 06:45:46 -0400
X-MC-Unique: 18RR_cgDOOmTBF2_iTzhAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DA03C00089;
 Thu, 26 May 2022 10:45:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED06D2166B26;
 Thu, 26 May 2022 10:45:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>, lei he <helei.sig11@bytedance.com>
Subject: [PULL 2/7] crypto: Introduce akcipher crypto class
Date: Thu, 26 May 2022 11:45:36 +0100
Message-Id: <20220526104541.492781-3-berrange@redhat.com>
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

From: zhenwei pi <pizhenwei@bytedance.com>

Introduce new akcipher crypto class 'QCryptoAkCIpher', which supports
basic asymmetric operations: encrypt, decrypt, sign and verify.

Suggested by Daniel P. Berrangé, also add autoptr cleanup for the new
class. Thanks to Daniel!

Co-developed-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.36.1


