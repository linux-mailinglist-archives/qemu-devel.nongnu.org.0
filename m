Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E04616841
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGIK-0002g5-QA; Wed, 02 Nov 2022 12:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIJ-0002fU-8I
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIG-000240-K3
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=Jv+g0wekFrslOss96Rpqzgzogr7Cp6FNIdJaSFWT5cOAETjDQ2LtzuUQznao1oBKOTy1Kf
 Eliyo4d+4z2X71vANje9gdeukJmkPFmm7Cy+2DKaa1koRaMP39qeq40LeX/WoCnii6Rx9w
 iUuuUVo7Z8d+CVwWU5mOMPeaVUqtQnU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-WTOeKtiEPL6dDe41BUDoFQ-1; Wed, 02 Nov 2022 12:08:40 -0400
X-MC-Unique: WTOeKtiEPL6dDe41BUDoFQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so5054124wra.23
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=pBrFE2+JKLq5bze5TCciDDpWQfajbJPzQcB9EuDXL02PBr7AX91+LCyoz1igb1auGu
 dobUP0sZ0T3O93luoDEoNrkAira2Mqhp26T6nqCGHW848mG1y1P/c8UMsO3X+SQunSWi
 ZWQcGBw5fT192XMyKCK4j6xPT8BJEYaoyRIfTApUuRcpcQVSyp5tocg5V9iBdzxIApIO
 Gxtvrlkcof80LiX23YYWEVoqfgTftQpc0Yvo/SJnnbgAmu0V/CIeBM47/stR+WEDeJKg
 7mhDAYXqiR8W8hhVTtTYaZY7cFz9DHkMLSh6o62ofqBJ2ioU9YcpmPAnK4oCLKDMv/QE
 gb9w==
X-Gm-Message-State: ACrzQf1Pq4JPQ6adqgo3RU7W6R5ho2JmIVLJj9FB096DpFA+bgMO6G4X
 Pstgb4+Awws6wuNIHM1CGsu8bHIidFbVUHkV7oLFPBFhb4GUASOTDXLgJcFplW+drFy3WrJh/LL
 7X2DEYyyQGKnDmwFqpPyC2ABoi65r/tqUgi9ay/SH18M9otRY5nGOnqISfX1F
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr15384113wrw.602.1667405318924; 
 Wed, 02 Nov 2022 09:08:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lsOKCG4TiHEFuGI/BWDxdxISp49L+mfhGAl7gWVSMcUPk6+q4zqDTJ7Du0Mq46wXkEHcZEQ==
X-Received: by 2002:a5d:65cf:0:b0:236:9119:be3 with SMTP id
 e15-20020a5d65cf000000b0023691190be3mr15384070wrw.602.1667405318531; 
 Wed, 02 Nov 2022 09:08:38 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q124-20020a1c4382000000b003cf568a736csm2535691wma.20.2022.11.02.09.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:37 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lei He <helei.sig11@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: [PULL v2 09/82] crypto: Support export akcipher to pkcs8
Message-ID: <20221102160336.616599-10-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Lei He <helei.sig11@bytedance.com>

crypto: support export RSA private keys with PKCS#8 standard.
So that users can upload this private key to linux kernel.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Message-Id: <20221008085030.70212-4-helei.sig11@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/rsakey.h           | 11 +++++++++-
 include/crypto/akcipher.h | 21 ++++++++++++++++++++
 crypto/akcipher.c         | 18 +++++++++++++++++
 crypto/rsakey.c           | 42 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 1 deletion(-)

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
-- 
MST


