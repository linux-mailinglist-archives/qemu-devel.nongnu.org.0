Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17D3615D47
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8iV-0000jb-S7; Wed, 02 Nov 2022 04:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq8iF-0000Yi-IA
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:03:06 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq8iC-00018q-4K
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:03:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b29so15677092pfp.13
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONaCfCdDKaYeDbrvIHamCwzTyDKK4ZQBDg2IVmgH5BU=;
 b=PjC5n/0ASsbk/nx33lg8PP0JqsMZK9TIpoGNtFHU/Pn/DgMd13p2IwRxHTtRdIf6hQ
 jLtLbp34rW7jwfnQxpdZSlHPJDbG4NxaQQFYxcJFa+p9ltEj4zm73BZZg8j/tVUvLFQr
 I6nHnWM+70hbezXBKzruDh/UMO0Mzj2Ns/uYwntRasMcmof3qSAxyPLEFJIjmsMc7OpB
 Egj4y0qQhdWzZG9Sp5hF9xWbu7+evS5+PseJFYHfLKRHbw+H2q7F2i1Orbjtmp66OnrB
 tU056UxgRSpJJ8F8wcyLSZLLWjlwhfnUa+iMHxfQ0lnfU4na+xc41GHqSeEeEE4knSMq
 vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONaCfCdDKaYeDbrvIHamCwzTyDKK4ZQBDg2IVmgH5BU=;
 b=jOXC6V3osEQHSctj0a0eGBl7rIxYqtSqW/RPRjCH9a1Qi+SnJO0ux0i8NiozrTqKXW
 /huO/O9+2ORZfels939d88s16bVseJlA63FGVcjQNBYxQ30q/ifcpQ+3FFc8y4P9puV1
 Tr7tROZwEqztWGJMZcIjVcQZGsNh7OWDh+Vdjeau99r0JMCJDhIobioGCzRxJEs/M8MA
 BakhVrqcv3ru+309LYOw1yBK2AUas82t09GdQDY2tQKHnikCrlIoISrw7jyZnvSsT1+X
 93VnM4Lp6DxhFHEqZtJUb8M6p0pfN3rjttb3Ha40n+D+bkmKFsz+/X7eNTe3aVBfm8qO
 IQUg==
X-Gm-Message-State: ACrzQf0Z1W+k/0ye32SHV+AtGQ047tysedCLQtfn2d96DcLJ0gcx5uc0
 Z2qp1fCCNQ+vo4IYEzTFOuA/dg==
X-Google-Smtp-Source: AMsMyM6AT4RR869m/loH1zKgLM8zRLEbMFsOLo4jlQuQ6OkTM6wojSZTq63d7rfLpocgTCxzxqLHeQ==
X-Received: by 2002:a63:8942:0:b0:46e:c02e:2eb5 with SMTP id
 v63-20020a638942000000b0046ec02e2eb5mr20663196pgd.141.1667376178740; 
 Wed, 02 Nov 2022 01:02:58 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a63f214000000b0045ff216a0casm3916640pgh.3.2022.11.02.01.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 01:02:58 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH v3 3/4] crypto: Support export akcipher to pkcs8
Date: Wed,  2 Nov 2022 16:02:12 +0800
Message-Id: <20221102080213.46788-4-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221102080213.46788-1-helei.sig11@bytedance.com>
References: <20221102080213.46788-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

crypto: support export RSA private keys with PKCS#8 standard.
So that users can upload this private key to linux kernel.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


