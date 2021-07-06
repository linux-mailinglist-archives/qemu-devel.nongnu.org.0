Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B63BC951
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:15:45 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i7D-00055I-ST
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs9-0005fh-0w
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hs4-00019D-Bo
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJPoDEg9z2ujTQx8bHT3pi4oMrD8+XXsQ7Q7PLMGgqs=;
 b=S0FZlzUfbc0gnQprJBIYkmnbruEl7OoZs5d0p/0nw5id+DXNb2xD7h8rvXFTC/hvI/5ntw
 xCTxYHWUIcLhz6IncIqxYeNByX13IlD+ubvob0j/udDRUdUnbpFalT8xZ+uMyzalng//M/
 +Y3UGXbpSP3TsWeBpxzb0NkG9G/JnHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-PrK7Y2VVOYu0NaO8q2k4BQ-1; Tue, 06 Jul 2021 06:00:02 -0400
X-MC-Unique: PrK7Y2VVOYu0NaO8q2k4BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C124F19057A0
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 10:00:01 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C6D5D6A1;
 Tue,  6 Jul 2021 10:00:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/18] crypto: add gnutls hmac provider
Date: Tue,  6 Jul 2021 10:59:22 +0100
Message-Id: <20210706095924.764117-17-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds support for using gnutls as a provider of the crypto
hmac APIs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/hmac-gnutls.c | 136 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 crypto/hmac-gnutls.c

diff --git a/crypto/hmac-gnutls.c b/crypto/hmac-gnutls.c
new file mode 100644
index 0000000000..ea33b5753b
--- /dev/null
+++ b/crypto/hmac-gnutls.c
@@ -0,0 +1,136 @@
+/*
+ * QEMU Crypto hmac algorithms
+ *
+ * Derived from hmac-gcrypt.c:
+ *
+ *   Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.  See the COPYING file in the
+ * top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "crypto/hmac.h"
+#include "hmacpriv.h"
+#include <gnutls/crypto.h>
+
+static int qcrypto_hmac_alg_map[QCRYPTO_HASH_ALG__MAX] = {
+    [QCRYPTO_HASH_ALG_MD5] = GNUTLS_MAC_MD5,
+    [QCRYPTO_HASH_ALG_SHA1] = GNUTLS_MAC_SHA1,
+    [QCRYPTO_HASH_ALG_SHA224] = GNUTLS_MAC_SHA224,
+    [QCRYPTO_HASH_ALG_SHA256] = GNUTLS_MAC_SHA256,
+    [QCRYPTO_HASH_ALG_SHA384] = GNUTLS_MAC_SHA384,
+    [QCRYPTO_HASH_ALG_SHA512] = GNUTLS_MAC_SHA512,
+    [QCRYPTO_HASH_ALG_RIPEMD160] = GNUTLS_MAC_RMD160,
+};
+
+typedef struct QCryptoHmacGnutls QCryptoHmacGnutls;
+struct QCryptoHmacGnutls {
+    gnutls_hmac_hd_t handle;
+};
+
+bool qcrypto_hmac_supports(QCryptoHashAlgorithm alg)
+{
+    size_t i;
+    const gnutls_digest_algorithm_t *algs;
+    if (alg >= G_N_ELEMENTS(qcrypto_hmac_alg_map) ||
+        qcrypto_hmac_alg_map[alg] == GNUTLS_DIG_UNKNOWN) {
+        return false;
+    }
+    algs = gnutls_digest_list();
+    for (i = 0; algs[i] != GNUTLS_DIG_UNKNOWN; i++) {
+        if (algs[i] == qcrypto_hmac_alg_map[alg]) {
+            return true;
+        }
+    }
+    return false;
+}
+
+void *qcrypto_hmac_ctx_new(QCryptoHashAlgorithm alg,
+                           const uint8_t *key, size_t nkey,
+                           Error **errp)
+{
+    QCryptoHmacGnutls *ctx;
+    int err;
+
+    if (!qcrypto_hmac_supports(alg)) {
+        error_setg(errp, "Unsupported hmac algorithm %s",
+                   QCryptoHashAlgorithm_str(alg));
+        return NULL;
+    }
+
+    ctx = g_new0(QCryptoHmacGnutls, 1);
+
+    err = gnutls_hmac_init(&ctx->handle,
+                           qcrypto_hmac_alg_map[alg],
+                           (const void *)key, nkey);
+    if (err != 0) {
+        error_setg(errp, "Cannot initialize hmac: %s",
+                   gnutls_strerror(err));
+        goto error;
+    }
+
+    return ctx;
+
+error:
+    g_free(ctx);
+    return NULL;
+}
+
+static void
+qcrypto_gnutls_hmac_ctx_free(QCryptoHmac *hmac)
+{
+    QCryptoHmacGnutls *ctx;
+
+    ctx = hmac->opaque;
+    gnutls_hmac_deinit(ctx->handle, NULL);
+
+    g_free(ctx);
+}
+
+static int
+qcrypto_gnutls_hmac_bytesv(QCryptoHmac *hmac,
+                           const struct iovec *iov,
+                           size_t niov,
+                           uint8_t **result,
+                           size_t *resultlen,
+                           Error **errp)
+{
+    QCryptoHmacGnutls *ctx;
+    uint32_t ret;
+    int i;
+
+    ctx = hmac->opaque;
+
+    for (i = 0; i < niov; i++) {
+        gnutls_hmac(ctx->handle, iov[i].iov_base, iov[i].iov_len);
+    }
+
+    ret = gnutls_hmac_get_len(qcrypto_hmac_alg_map[hmac->alg]);
+    if (ret <= 0) {
+        error_setg(errp, "Unable to get hmac length: %s",
+                   gnutls_strerror(ret));
+        return -1;
+    }
+
+    if (*resultlen == 0) {
+        *resultlen = ret;
+        *result = g_new0(uint8_t, *resultlen);
+    } else if (*resultlen != ret) {
+        error_setg(errp, "Result buffer size %zu is smaller than hmac %d",
+                   *resultlen, ret);
+        return -1;
+    }
+
+    gnutls_hmac_output(ctx->handle, *result);
+
+    return 0;
+}
+
+QCryptoHmacDriver qcrypto_hmac_lib_driver = {
+    .hmac_bytesv = qcrypto_gnutls_hmac_bytesv,
+    .hmac_free = qcrypto_gnutls_hmac_ctx_free,
+};
-- 
2.31.1


