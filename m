Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0C5F8475
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 10:58:00 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh5eh-0002rP-71
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 04:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5Y0-0004Bn-U1
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 04:51:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oh5Xq-00052v-CL
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 04:51:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so9151742pjq.3
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CzkRGivMZQjOWms1Wd20gko6baVayfPDtHAfDlX/8j4=;
 b=zuBubiF8VTCbVoOKXC+izfhxCyjs7fanB+uXlhdhZcIcqfmL41S8HmE9bNyhzhKWVX
 WwVtCIq+2xXO6WfIA6tPNJH+FU0BdaxYAWuM5O7b0zg6Kkg3qRSNJCdCZpGwmdgqDYYN
 FkENJqRobEGOQSg7dq+CGab1lgeSjz3Ue55v/Wq3va6/BPAmbF6CVtDW/gE3qfC1UZDb
 m7fWg/iq6DvQ8e3kZbZccBLMN2Bg0XTcCObzpzpgwukrwEUua7Crwr7X/uy1QAzeni8S
 ap/NhRbgJx+HP0CCIQb4z/YGgKx7zM5jSwQs2sqGWyngp+dYUZ016qNGWGY8c3lbO08C
 miLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzkRGivMZQjOWms1Wd20gko6baVayfPDtHAfDlX/8j4=;
 b=TyZfYSWJ/7Eq5NydlwLeZV3+JRvuV4UXY8nedNnaYL7wvPHbbDC1cFMfU2+EepxzU5
 vzPRRLGCLxt+nZ2CnflCBcXkv+c2p+OPFCwnOPUrkFDYijWwd3ys8WjfoDk3qm7oo+Ly
 X/Kbhl5v0lDQfv/eMfnPRI70CQ0meDorKm9rSiQKRCZ3kH4FdL242kw3xx87binDJkBQ
 4t7iB0V9PQOY2TF9hKkXKapuF83dWQUp/fA5XERjRMV2ZZbmhOufz2iR1n0UYlC75/nG
 Yi9frYkMz1JKHrrQIvIdkYIlNdkfY5UAf+7TvchZg1vmV7+jLe/zJVeer0BeqvGteYhp
 tx6Q==
X-Gm-Message-State: ACrzQf0nfWusfWZ3lFMDUxe/+Nq7Cb8IHRGlB7KqwXe/DpgO5J4xnqqs
 hm8EGWiZlnOmOk0vCid3J2411w==
X-Google-Smtp-Source: AMsMyM65OC8mRx3l9gb2557IkR7hRmTjqpV0krhGVwU42MRnO6xFoYOYH9HAVVoWe9r/aU62I0gbbA==
X-Received: by 2002:a17:90b:4a04:b0:20c:37cf:6cc0 with SMTP id
 kk4-20020a17090b4a0400b0020c37cf6cc0mr4544570pjb.55.1665219053112; 
 Sat, 08 Oct 2022 01:50:53 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([63.216.146.187])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709028a9400b00179f442519csm2852861plo.40.2022.10.08.01.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 01:50:52 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: berrange@redhat.com,
	arei.gonglei@huawei.com,
	mst@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH v2 3/4] crypto: Support export akcipher to pkcs8
Date: Sat,  8 Oct 2022 16:50:29 +0800
Message-Id: <20221008085030.70212-4-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221008085030.70212-1-helei.sig11@bytedance.com>
References: <20221008085030.70212-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

crypto: support export RSA private keys with PKCS#8 standard.
So that users can upload this private key to linux kernel.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/akcipher.c         | 18 ++++++++++++++++++
 crypto/rsakey.c           | 42 ++++++++++++++++++++++++++++++++++++++++++
 crypto/rsakey.h           | 11 ++++++++++-
 include/crypto/akcipher.h | 21 +++++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index ad88379c1e..e4bbc6e5f1 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -22,6 +22,8 @@
 #include "qemu/osdep.h"
 #include "crypto/akcipher.h"
 #include "akcipherpriv.h"
+#include "der.h"
+#include "rsakey.h"
 
 #if defined(CONFIG_GCRYPT)
 #include "akcipher-gcrypt.c.inc"
@@ -106,3 +108,19 @@ void qcrypto_akcipher_free(QCryptoAkCipher *akcipher)
 
     drv->free(akcipher);
 }
+
+int qcrypto_akcipher_export_p8info(const QCryptoAkCipherOptions *opts,
+                                   uint8_t *key, size_t keylen,
+                                   uint8_t **dst, size_t *dst_len,
+                                   Error **errp)
+{
+    switch (opts->alg) {
+    case QCRYPTO_AKCIPHER_ALG_RSA:
+        qcrypto_akcipher_rsakey_export_p8info(key, keylen, dst, dst_len);
+        return 0;
+
+    default:
+        error_setg(errp, "Unsupported algorithm: %u", opts->alg);
+        return -1;
+    }
+}
diff --git a/crypto/rsakey.c b/crypto/rsakey.c
index cc40e072f0..7d6f273aef 100644
--- a/crypto/rsakey.c
+++ b/crypto/rsakey.c
@@ -19,6 +19,8 @@
  *
  */
 
+#include "qemu/osdep.h"
+#include "der.h"
 #include "rsakey.h"
 
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
@@ -37,6 +39,46 @@ void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *rsa_key)
     g_free(rsa_key);
 }
 
+/**
+ * PKCS#8 private key info for RSA
+ *
+ * PrivateKeyInfo ::= SEQUENCE {
+ * version         INTEGER,
+ * privateKeyAlgorithm PrivateKeyAlgorithmIdentifier,
+ * privateKey      OCTET STRING,
+ * attributes      [0] IMPLICIT Attributes OPTIONAL
+ * }
+ */
+void qcrypto_akcipher_rsakey_export_p8info(const uint8_t *key,
+                                           size_t keylen,
+                                           uint8_t **dst,
+                                           size_t *dlen)
+{
+    QCryptoEncodeContext *ctx = qcrypto_der_encode_ctx_new();
+    uint8_t version = 0;
+
+    qcrypto_der_encode_seq_begin(ctx);
+
+    /* version */
+    qcrypto_der_encode_int(ctx, &version, sizeof(version));
+
+    /* algorithm identifier */
+    qcrypto_der_encode_seq_begin(ctx);
+    qcrypto_der_encode_oid(ctx, (uint8_t *)QCRYPTO_OID_rsaEncryption,
+                           sizeof(QCRYPTO_OID_rsaEncryption) - 1);
+    qcrypto_der_encode_null(ctx);
+    qcrypto_der_encode_seq_end(ctx);
+
+    /* RSA private key */
+    qcrypto_der_encode_octet_str(ctx, key, keylen);
+
+    qcrypto_der_encode_seq_end(ctx);
+
+    *dlen = qcrypto_der_encode_ctx_buffer_len(ctx);
+    *dst = g_malloc(*dlen);
+    qcrypto_der_encode_ctx_flush_and_free(ctx, *dst);
+}
+
 #if defined(CONFIG_NETTLE) && defined(CONFIG_HOGWEED)
 #include "rsakey-nettle.c.inc"
 #else
diff --git a/crypto/rsakey.h b/crypto/rsakey.h
index 974b76f659..00b3eccec7 100644
--- a/crypto/rsakey.h
+++ b/crypto/rsakey.h
@@ -22,7 +22,6 @@
 #ifndef QCRYPTO_RSAKEY_H
 #define QCRYPTO_RSAKEY_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "crypto/akcipher.h"
 
@@ -84,6 +83,16 @@ QCryptoAkCipherRSAKey *qcrypto_akcipher_rsakey_parse(
     QCryptoAkCipherKeyType type,
     const uint8_t *key, size_t keylen, Error **errp);
 
+/**
+ * qcrypto_akcipher_rsakey_export_as_p8info:
+ *
+ * Export RSA private key to PKCS#8 private key info.
+ */
+void qcrypto_akcipher_rsakey_export_p8info(const uint8_t *key,
+                                           size_t keylen,
+                                           uint8_t **dst,
+                                           size_t *dlen);
+
 void qcrypto_akcipher_rsakey_free(QCryptoAkCipherRSAKey *key);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipherRSAKey,
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 51f5fa2774..214e58ca47 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -153,6 +153,27 @@ int qcrypto_akcipher_max_dgst_len(QCryptoAkCipher *akcipher);
  */
 void qcrypto_akcipher_free(QCryptoAkCipher *akcipher);
 
+/**
+ * qcrypto_akcipher_export_p8info:
+ * @opts: the options of the akcipher to be exported.
+ * @key: the original key of the akcipher to be exported.
+ * @keylen: length of the 'key'
+ * @dst: output parameter, if export succeed, *dst is set to the
+ * PKCS#8 encoded private key, caller MUST free this key with
+ * g_free after use.
+ * @dst_len: output parameter, indicates the length of PKCS#8 encoded
+ * key.
+ *
+ * Export the akcipher into DER encoded pkcs#8 private key info, expects
+ * |key| stores a valid asymmetric PRIVATE key.
+ *
+ * Returns: 0 for succeed, otherwise -1 is returned.
+ */
+int qcrypto_akcipher_export_p8info(const QCryptoAkCipherOptions *opts,
+                                   uint8_t *key, size_t keylen,
+                                   uint8_t **dst, size_t *dst_len,
+                                   Error **errp);
+
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoAkCipher, qcrypto_akcipher_free)
 
 #endif /* QCRYPTO_AKCIPHER_H */
-- 
2.11.0


