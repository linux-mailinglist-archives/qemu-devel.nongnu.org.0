Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A43C860A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:23:14 +0200 (CEST)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fn7-0004OG-Oq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbn-0005iE-Ld
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbl-0007x3-Rm
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpT7DdRHg+ZpmSdb3BoQ52os2tuXylz98H/dphyyv80=;
 b=Ncw67sGB7brAbnzuYwiq3TvK7yekgk938zjOsN/WSSTE+gll0bv4eklZYSSQRN9nqBPZQ0
 jSsLlD/LGst0901f02Mp+ew66Yqa+0GNY/RWmj+qPhiBmEYY0Kp3RpZIYixqEu40bcG0e7
 pCnUZSC+LoFLBxC8M9/39Jm5MuNtswE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588--3bhyInmM6aXc5_2nOQt0w-1; Wed, 14 Jul 2021 10:11:27 -0400
X-MC-Unique: -3bhyInmM6aXc5_2nOQt0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38C4804155;
 Wed, 14 Jul 2021 14:11:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7953669CB4;
 Wed, 14 Jul 2021 14:11:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] crypto: add gnutls hash provider
Date: Wed, 14 Jul 2021 15:08:47 +0100
Message-Id: <20210714140858.2247409-16-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds support for using gnutls as a provider of the crypto
hash APIs.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/hash-gnutls.c | 104 +++++++++++++++++++++++++++++++++++++++++++
 crypto/meson.build   |   2 +
 2 files changed, 106 insertions(+)
 create mode 100644 crypto/hash-gnutls.c

diff --git a/crypto/hash-gnutls.c b/crypto/hash-gnutls.c
new file mode 100644
index 0000000000..17911ac5d1
--- /dev/null
+++ b/crypto/hash-gnutls.c
@@ -0,0 +1,104 @@
+/*
+ * QEMU Crypto hash algorithms
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
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
+#include <gnutls/crypto.h>
+#include "qapi/error.h"
+#include "crypto/hash.h"
+#include "hashpriv.h"
+
+
+static int qcrypto_hash_alg_map[QCRYPTO_HASH_ALG__MAX] = {
+    [QCRYPTO_HASH_ALG_MD5] = GNUTLS_DIG_MD5,
+    [QCRYPTO_HASH_ALG_SHA1] = GNUTLS_DIG_SHA1,
+    [QCRYPTO_HASH_ALG_SHA224] = GNUTLS_DIG_SHA224,
+    [QCRYPTO_HASH_ALG_SHA256] = GNUTLS_DIG_SHA256,
+    [QCRYPTO_HASH_ALG_SHA384] = GNUTLS_DIG_SHA384,
+    [QCRYPTO_HASH_ALG_SHA512] = GNUTLS_DIG_SHA512,
+    [QCRYPTO_HASH_ALG_RIPEMD160] = GNUTLS_DIG_RMD160,
+};
+
+gboolean qcrypto_hash_supports(QCryptoHashAlgorithm alg)
+{
+    size_t i;
+    const gnutls_digest_algorithm_t *algs;
+    if (alg >= G_N_ELEMENTS(qcrypto_hash_alg_map) ||
+        qcrypto_hash_alg_map[alg] == GNUTLS_DIG_UNKNOWN) {
+        return false;
+    }
+    algs = gnutls_digest_list();
+    for (i = 0; algs[i] != GNUTLS_DIG_UNKNOWN; i++) {
+        if (algs[i] == qcrypto_hash_alg_map[alg]) {
+            return true;
+        }
+    }
+    return false;
+}
+
+
+static int
+qcrypto_gnutls_hash_bytesv(QCryptoHashAlgorithm alg,
+                           const struct iovec *iov,
+                           size_t niov,
+                           uint8_t **result,
+                           size_t *resultlen,
+                           Error **errp)
+{
+    int i, ret;
+    gnutls_hash_hd_t hash;
+
+    if (!qcrypto_hash_supports(alg)) {
+        error_setg(errp,
+                   "Unknown hash algorithm %d",
+                   alg);
+        return -1;
+    }
+
+    ret = gnutls_hash_get_len(qcrypto_hash_alg_map[alg]);
+    if (*resultlen == 0) {
+        *resultlen = ret;
+        *result = g_new0(uint8_t, *resultlen);
+    } else if (*resultlen != ret) {
+        error_setg(errp,
+                   "Result buffer size %zu is smaller than hash %d",
+                   *resultlen, ret);
+        return -1;
+    }
+
+    ret = gnutls_hash_init(&hash, qcrypto_hash_alg_map[alg]);
+    if (ret < 0) {
+        error_setg(errp,
+                   "Unable to initialize hash algorithm: %s",
+                   gnutls_strerror(ret));
+        return -1;
+    }
+
+    for (i = 0; i < niov; i++) {
+        gnutls_hash(hash, iov[i].iov_base, iov[i].iov_len);
+    }
+
+    gnutls_hash_deinit(hash, *result);
+    return 0;
+}
+
+
+QCryptoHashDriver qcrypto_hash_lib_driver = {
+    .hash_bytesv = qcrypto_gnutls_hash_bytesv,
+};
diff --git a/crypto/meson.build b/crypto/meson.build
index f3bab7c067..e2f25810fc 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -28,6 +28,8 @@ if nettle.found()
   endif
 elif gcrypt.found()
   crypto_ss.add(gcrypt, files('hash-gcrypt.c', 'hmac-gcrypt.c', 'pbkdf-gcrypt.c'))
+elif gnutls_crypto.found()
+  crypto_ss.add(gnutls, files('hash-gnutls.c', 'hmac-glib.c', 'pbkdf-stub.c')
 else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
-- 
2.31.1


