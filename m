Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01690613714
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUGV-0001Q7-UF; Mon, 31 Oct 2022 08:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUG4-0000ph-UU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUG3-0002GF-96
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=CktT/H5sDzgmVCvIFn0ILxzByvDZ9tDdvnQOKgXjn3Zr47CI49ZDhIFk5TrpVzKdpRfyQA
 jg6qG5rWBjyLFUwow14P7A79USAMwe6FZy7ix2XsPN2I7ulRlwb8wtilKQt+ZDtWHNl2Ah
 uQHtk2I444e1bnfQgmubCFOJXsdHMfA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-Q-HZBOGsPcOlHqIJeohf4Q-1; Mon, 31 Oct 2022 08:51:13 -0400
X-MC-Unique: Q-HZBOGsPcOlHqIJeohf4Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so360300wmb.2
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPZHQzhfHMWUz5Qjgx793q/Gt+Rmc4j05x1TMLreu9M=;
 b=QLcpZUN3Vkqtg4TOszk3JtcFQ1RVWAtjm3LOWTUfCtLDb0Ze5EdwMQO9fdOwAyS6Rb
 CBhge7n6FsaFWH/J+OnV1VAWfxJtHsdXiE5FMlDScpVF924Cnm/3bBEW8LcHP7Bsgg0t
 DSqNegvpAGxfYxu5ArKJmn4Vf92OC0R3cZDrAJbEJ8yQPyo0fBGuoJBZwly8I2Itu4ad
 zl141vZWlLg0lL4KAKaEf9Q07p10LutBbWymUY1g2UCfeoil7wZZz1nkmu1MP0OvBkDR
 Sifn/671FoJ/flMPO0toEz4YPlUjngPUZvgdt2FjNuD6WIkegR7+5ubLesU8tRwM6vCg
 QBVA==
X-Gm-Message-State: ACrzQf2Qg88zuiS7Ra3EEYaazRrkO1Bggt2sURxRSX3CLed5q9oF7p2n
 OuF+npwyWS+OVVY3sp6LOKfGYwtIlRbOEQSCaYL6d6+LJ2QDtm+lYHX3DJG1+o/eRAT0a10HXiu
 Bh/5WzTK/nNAmOkdJyBqeyG4OrdFuYEgtMDh4WBdjdcdavxKSEN7bLX0javjH
X-Received: by 2002:a1c:f60d:0:b0:3be:708b:c96c with SMTP id
 w13-20020a1cf60d000000b003be708bc96cmr18333692wmc.168.1667220672091; 
 Mon, 31 Oct 2022 05:51:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gZhEBXgpngA/+//N1h40jHF1TJ4jWTLgHv++nTiAbvMcMoEv+E+/hyT8A1EWeYq0EIqNnwQ==
X-Received: by 2002:a1c:f60d:0:b0:3be:708b:c96c with SMTP id
 w13-20020a1cf60d000000b003be708bc96cmr18333668wmc.168.1667220671736; 
 Mon, 31 Oct 2022 05:51:11 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c4e1500b003c6bd91caa5sm1633141wmq.17.2022.10.31.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:11 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lei He <helei.sig11@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: [PULL 10/86] crypto: Support export akcipher to pkcs8
Message-ID: <20221031124928.128475-11-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


