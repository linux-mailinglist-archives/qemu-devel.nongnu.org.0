Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787983C85F7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:20:33 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fkW-0006Oz-GX
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fby-0006Fd-VV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fbx-00083Q-4I
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626271900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjrIXH/H450LNv8nZolKqhxP5e7A1CQjlY9lYhADSCk=;
 b=hlngJsQO5D/iRKyY04g4al9MleijCt72wFcukjCrxXytoIh8VMjJo9V8Xtyd5CAdPaAWY8
 5vwARUFk1kD0gAh8yjatdUIuNpVM4nfI3TexMGaawG2TA+R6YUmNfoHoN+zgUF2Il+mVmc
 uLq+u5z37qqPcuuCLCmwkhyE16A1My0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-mLcGeqFKOI2YgbZ40MxttQ-1; Wed, 14 Jul 2021 10:11:38 -0400
X-MC-Unique: mLcGeqFKOI2YgbZ40MxttQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 969421030C25;
 Wed, 14 Jul 2021 14:11:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E533F69CB4;
 Wed, 14 Jul 2021 14:11:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] crypto: add gnutls pbkdf provider
Date: Wed, 14 Jul 2021 15:08:49 +0100
Message-Id: <20210714140858.2247409-18-berrange@redhat.com>
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
pbkdf APIs.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/meson.build    |  2 +-
 crypto/pbkdf-gnutls.c | 90 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 crypto/pbkdf-gnutls.c

diff --git a/crypto/meson.build b/crypto/meson.build
index e2f25810fc..95a6a83504 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -29,7 +29,7 @@ if nettle.found()
 elif gcrypt.found()
   crypto_ss.add(gcrypt, files('hash-gcrypt.c', 'hmac-gcrypt.c', 'pbkdf-gcrypt.c'))
 elif gnutls_crypto.found()
-  crypto_ss.add(gnutls, files('hash-gnutls.c', 'hmac-glib.c', 'pbkdf-stub.c')
+  crypto_ss.add(gnutls, files('hash-gnutls.c', 'hmac-gnutls.c', 'pbkdf-gnutls.c'))
 else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
diff --git a/crypto/pbkdf-gnutls.c b/crypto/pbkdf-gnutls.c
new file mode 100644
index 0000000000..2dfbbd382c
--- /dev/null
+++ b/crypto/pbkdf-gnutls.c
@@ -0,0 +1,90 @@
+/*
+ * QEMU Crypto PBKDF support (Password-Based Key Derivation Function)
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
+#include "crypto/pbkdf.h"
+
+bool qcrypto_pbkdf2_supports(QCryptoHashAlgorithm hash)
+{
+    switch (hash) {
+    case QCRYPTO_HASH_ALG_MD5:
+    case QCRYPTO_HASH_ALG_SHA1:
+    case QCRYPTO_HASH_ALG_SHA224:
+    case QCRYPTO_HASH_ALG_SHA256:
+    case QCRYPTO_HASH_ALG_SHA384:
+    case QCRYPTO_HASH_ALG_SHA512:
+    case QCRYPTO_HASH_ALG_RIPEMD160:
+        return true;
+    default:
+        return false;
+    }
+}
+
+int qcrypto_pbkdf2(QCryptoHashAlgorithm hash,
+                   const uint8_t *key, size_t nkey,
+                   const uint8_t *salt, size_t nsalt,
+                   uint64_t iterations,
+                   uint8_t *out, size_t nout,
+                   Error **errp)
+{
+    static const int hash_map[QCRYPTO_HASH_ALG__MAX] = {
+        [QCRYPTO_HASH_ALG_MD5] = GNUTLS_DIG_MD5,
+        [QCRYPTO_HASH_ALG_SHA1] = GNUTLS_DIG_SHA1,
+        [QCRYPTO_HASH_ALG_SHA224] = GNUTLS_DIG_SHA224,
+        [QCRYPTO_HASH_ALG_SHA256] = GNUTLS_DIG_SHA256,
+        [QCRYPTO_HASH_ALG_SHA384] = GNUTLS_DIG_SHA384,
+        [QCRYPTO_HASH_ALG_SHA512] = GNUTLS_DIG_SHA512,
+        [QCRYPTO_HASH_ALG_RIPEMD160] = GNUTLS_DIG_RMD160,
+    };
+    int ret;
+    const gnutls_datum_t gkey = { (unsigned char *)key, nkey };
+    const gnutls_datum_t gsalt = { (unsigned char *)salt, nsalt };
+
+    if (iterations > ULONG_MAX) {
+        error_setg_errno(errp, ERANGE,
+                         "PBKDF iterations %llu must be less than %lu",
+                         (long long unsigned)iterations, ULONG_MAX);
+        return -1;
+    }
+
+    if (hash >= G_N_ELEMENTS(hash_map) ||
+        hash_map[hash] == GNUTLS_DIG_UNKNOWN) {
+        error_setg_errno(errp, ENOSYS,
+                         "PBKDF does not support hash algorithm %s",
+                         QCryptoHashAlgorithm_str(hash));
+        return -1;
+    }
+
+    ret = gnutls_pbkdf2(hash_map[hash],
+                        &gkey,
+                        &gsalt,
+                        iterations,
+                        out,
+                        nout);
+    if (ret != 0) {
+        error_setg(errp, "Cannot derive password: %s",
+                   gnutls_strerror(ret));
+        return -1;
+    }
+
+    return 0;
+}
-- 
2.31.1


