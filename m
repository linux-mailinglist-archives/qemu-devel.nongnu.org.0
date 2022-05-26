Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BC534D9B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:54:28 +0200 (CEST)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuB8N-00045O-Ae
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB0H-0000Aq-Gs
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuB0F-00083I-9G
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653561962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sdvJ+clZYKCQE+tWsZ8mHNJQpIdykObCPHK1E/LCtM=;
 b=NWlXT2ZPdP/dFUILjoDVlGRGI1QpTBK5gbo1Y3qUB4MiEKM4sgdNRlHYZwoR1jO/ykYuLo
 FUxu+b8VtAIzN3X9duwsVtEozombrZhqD5TyolvebYMlbn79iX1wy0UZo15/RQ/bGIXNHi
 Q6Ha5SnQxv8CAaArvjEqQbiA7FNN77o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-ZArAjynjNKibC7TDyyhm1g-1; Thu, 26 May 2022 06:45:53 -0400
X-MC-Unique: ZArAjynjNKibC7TDyyhm1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95FD9803CB8;
 Thu, 26 May 2022 10:45:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F2C2166B26;
 Thu, 26 May 2022 10:45:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Lei He <helei.sig11@bytedance.com>
Subject: [PULL 7/7] tests/crypto: Add test suite for RSA keys
Date: Thu, 26 May 2022 11:45:41 +0100
Message-Id: <20220526104541.492781-8-berrange@redhat.com>
In-Reply-To: <20220526104541.492781-1-berrange@redhat.com>
References: <20220526104541.492781-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Lei He <helei.sig11@bytedance.com>

As Daniel suggested, Add tests suite for rsakey, as a way to prove
that we can handle DER errors correctly.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-akcipher.c | 285 +++++++++++++++++++++++++++++-
 1 file changed, 282 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-crypto-akcipher.c b/tests/unit/test-crypto-akcipher.c
index b5be563884..4f1f4214dd 100644
--- a/tests/unit/test-crypto-akcipher.c
+++ b/tests/unit/test-crypto-akcipher.c
@@ -517,6 +517,158 @@ static const uint8_t exp_ciphertext_rsa2048_pkcs1[] = {
     0xd0, 0x28, 0x03, 0x19, 0xa6, 0x06, 0x13, 0x45,
 };
 
+static const uint8_t rsa_private_key_lack_element[] = {
+    /* RSAPrivateKey, offset: 0, length: 176 */
+    0x30, 0x81, 0xb0,
+    /* version, offset: 4, length: 1 */
+    0x02, 0x01, 0x00,
+    /* n, offset: 7, length: 65 */
+    0x02, 0x41,
+    0x00, 0xb9, 0xe1, 0x22, 0xdb, 0x56, 0x2f, 0xb6,
+    0xf7, 0xf0, 0x0a, 0x87, 0x43, 0x07, 0x12, 0xdb,
+    0x6d, 0xb6, 0x2b, 0x41, 0x8d, 0x2c, 0x3c, 0xa5,
+    0xdd, 0x78, 0x9a, 0x8f, 0xab, 0x8e, 0xf2, 0x4a,
+    0xc8, 0x34, 0x0c, 0x12, 0x4f, 0x11, 0x90, 0xc6,
+    0xc2, 0xa5, 0xd0, 0xcd, 0xfb, 0xfc, 0x2c, 0x95,
+    0x56, 0x82, 0xdf, 0x39, 0xf3, 0x3b, 0x1d, 0x62,
+    0x26, 0x97, 0xb7, 0x93, 0x25, 0xc7, 0xec, 0x7e,
+    0xf7,
+    /* e, offset: 74, length: 3 */
+    0x02, 0x03, 0x01, 0x00, 0x01,
+    /* d, offset: 79, length: 64 */
+    0x02, 0x40,
+    0x1e, 0x80, 0xfe, 0xda, 0x65, 0xdb, 0x70, 0xb8,
+    0x61, 0x91, 0x28, 0xbf, 0x6c, 0x32, 0xc1, 0x05,
+    0xd1, 0x26, 0x6a, 0x1c, 0x83, 0xcc, 0xf4, 0x1f,
+    0x53, 0x42, 0x72, 0x1f, 0x62, 0x57, 0x0a, 0xc4,
+    0x66, 0x76, 0x30, 0x87, 0xb9, 0xb1, 0xb9, 0x6a,
+    0x63, 0xfd, 0x8f, 0x3e, 0xfc, 0x35, 0x3f, 0xd6,
+    0x2e, 0x6c, 0xc8, 0x70, 0x8a, 0x17, 0xc1, 0x28,
+    0x6a, 0xfe, 0x51, 0x56, 0xb3, 0x92, 0x6f, 0x09,
+    /* p, offset: 145, length: 33 */
+    0x02, 0x21,
+    0x00, 0xe3, 0x2e, 0x2d, 0x8d, 0xba, 0x1c, 0x34,
+    0x4c, 0x49, 0x9f, 0xc1, 0xa6, 0xdd, 0xd7, 0x13,
+    0x8d, 0x05, 0x48, 0xdd, 0xff, 0x5c, 0x30, 0xbc,
+    0x6b, 0xc4, 0x18, 0x9d, 0xfc, 0xa2, 0xd0, 0x9b,
+    0x4d,
+    /* q, offset: 180, length: 33 */
+    0x02, 0x21,
+    0x00, 0xd1, 0x75, 0xaf, 0x4b, 0xc6, 0x1a, 0xb0,
+    0x98, 0x14, 0x42, 0xae, 0x33, 0xf3, 0x44, 0xde,
+    0x21, 0xcb, 0x04, 0xda, 0xfb, 0x1e, 0x35, 0x92,
+    0xcd, 0x69, 0xc0, 0x83, 0x06, 0x83, 0x8e, 0x39,
+    0x53,
+    /* lack element: dp, dq, u */
+};
+
+static const uint8_t rsa_public_key_lack_element[] = {
+    /* RSAPublicKey, offset: 0, length: 67 */
+    0x30, 0x81, 0x43,
+    /* n, offset: 7, length: 65 */
+    0x02, 0x41,
+    0x00, 0xb9, 0xe1, 0x22, 0xdb, 0x56, 0x2f, 0xb6,
+    0xf7, 0xf0, 0x0a, 0x87, 0x43, 0x07, 0x12, 0xdb,
+    0x6d, 0xb6, 0x2b, 0x41, 0x8d, 0x2c, 0x3c, 0xa5,
+    0xdd, 0x78, 0x9a, 0x8f, 0xab, 0x8e, 0xf2, 0x4a,
+    0xc8, 0x34, 0x0c, 0x12, 0x4f, 0x11, 0x90, 0xc6,
+    0xc2, 0xa5, 0xd0, 0xcd, 0xfb, 0xfc, 0x2c, 0x95,
+    0x56, 0x82, 0xdf, 0x39, 0xf3, 0x3b, 0x1d, 0x62,
+    0x26, 0x97, 0xb7, 0x93, 0x25, 0xc7, 0xec, 0x7e,
+    0xf7,
+    /* lack element: e */
+};
+
+static const uint8_t rsa_public_key_empty_element[] = {
+    /* RSAPublicKey, offset: 0, length: 69 */
+    0x30, 0x81, 0x45,
+    /* n, offset: 7, length: 65 */
+    0x02, 0x41,
+    0x00, 0xb9, 0xe1, 0x22, 0xdb, 0x56, 0x2f, 0xb6,
+    0xf7, 0xf0, 0x0a, 0x87, 0x43, 0x07, 0x12, 0xdb,
+    0x6d, 0xb6, 0x2b, 0x41, 0x8d, 0x2c, 0x3c, 0xa5,
+    0xdd, 0x78, 0x9a, 0x8f, 0xab, 0x8e, 0xf2, 0x4a,
+    0xc8, 0x34, 0x0c, 0x12, 0x4f, 0x11, 0x90, 0xc6,
+    0xc2, 0xa5, 0xd0, 0xcd, 0xfb, 0xfc, 0x2c, 0x95,
+    0x56, 0x82, 0xdf, 0x39, 0xf3, 0x3b, 0x1d, 0x62,
+    0x26, 0x97, 0xb7, 0x93, 0x25, 0xc7, 0xec, 0x7e,
+    0xf7,
+    /* e: empty element */
+    0x02, 0x00,
+};
+
+static const uint8_t rsa_private_key_empty_element[] = {
+    /* RSAPrivateKey, offset: 0, length: 19 */
+    0x30, 0x81, 0x13,
+    /* version, offset: 4, length: 1 */
+    0x02, 0x01, 0x00,
+    /* n: empty element */
+    0x02, 0x00,
+    /* e: empty element */
+    0x02, 0x00,
+    /* d: empty element */
+    0x02, 0x00,
+    /* p: empty element */
+    0x02, 0x00,
+    /* q: empty element */
+    0x02, 0x00,
+    /* dp: empty element */
+    0x02, 0x00,
+    /* dq: empty element */
+    0x02, 0x00,
+    /* u: empty element */
+    0x02, 0x00,
+};
+
+static const uint8_t rsa_public_key_invalid_length_val[] = {
+    /* RSAPublicKey, INVALID length: 313 */
+    0x30, 0x82, 0x01, 0x39,
+    /* n, offset: 7, length: 65 */
+    0x02, 0x41,
+    0x00, 0xb9, 0xe1, 0x22, 0xdb, 0x56, 0x2f, 0xb6,
+    0xf7, 0xf0, 0x0a, 0x87, 0x43, 0x07, 0x12, 0xdb,
+    0x6d, 0xb6, 0x2b, 0x41, 0x8d, 0x2c, 0x3c, 0xa5,
+    0xdd, 0x78, 0x9a, 0x8f, 0xab, 0x8e, 0xf2, 0x4a,
+    0xc8, 0x34, 0x0c, 0x12, 0x4f, 0x11, 0x90, 0xc6,
+    0xc2, 0xa5, 0xd0, 0xcd, 0xfb, 0xfc, 0x2c, 0x95,
+    0x56, 0x82, 0xdf, 0x39, 0xf3, 0x3b, 0x1d, 0x62,
+    0x26, 0x97, 0xb7, 0x93, 0x25, 0xc7, 0xec, 0x7e,
+    0xf7,
+    /* e, */
+    0x02, 0x03, 0x01, 0x00, 0x01,  /* INTEGER, offset: 74, length: 3 */
+};
+
+static const uint8_t rsa_public_key_extra_elem[] = {
+    /* RSAPublicKey, length: 80 */
+    0x30, 0x81, 0x50,
+    /* n, offset: 7, length: 65 */
+    0x02, 0x41,
+    0x00, 0xb9, 0xe1, 0x22, 0xdb, 0x56, 0x2f, 0xb6,
+    0xf7, 0xf0, 0x0a, 0x87, 0x43, 0x07, 0x12, 0xdb,
+    0x6d, 0xb6, 0x2b, 0x41, 0x8d, 0x2c, 0x3c, 0xa5,
+    0xdd, 0x78, 0x9a, 0x8f, 0xab, 0x8e, 0xf2, 0x4a,
+    0xc8, 0x34, 0x0c, 0x12, 0x4f, 0x11, 0x90, 0xc6,
+    0xc2, 0xa5, 0xd0, 0xcd, 0xfb, 0xfc, 0x2c, 0x95,
+    0x56, 0x82, 0xdf, 0x39, 0xf3, 0x3b, 0x1d, 0x62,
+    0x26, 0x97, 0xb7, 0x93, 0x25, 0xc7, 0xec, 0x7e,
+    0xf7,
+    /* e, offset: 74, length: 3 */
+    0x02, 0x03, 0x01, 0x00, 0x01,
+    /* Additional integer field, length 3 */
+    0x02, 0x06, 0xe1, 0x22, 0xdb, 0xe1, 0x22, 0xdb,
+};
+
+typedef struct QCryptoRSAKeyTestData QCryptoRSAKeyTestData;
+struct QCryptoRSAKeyTestData {
+    const char *path;
+    QCryptoAkCipherKeyType key_type;
+    QCryptoAkCipherOptions opt;
+    const uint8_t *key;
+    size_t keylen;
+    bool is_valid_key;
+    size_t exp_key_len;
+};
+
 typedef struct QCryptoAkCipherTestData QCryptoAkCipherTestData;
 struct QCryptoAkCipherTestData {
     const char *path;
@@ -537,7 +689,98 @@ struct QCryptoAkCipherTestData {
     size_t slen;
 };
 
-static QCryptoAkCipherTestData test_data[] = {
+static QCryptoRSAKeyTestData rsakey_test_data[] = {
+    {
+        .path = "/crypto/akcipher/rsakey-1024-public",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa1024_public_key,
+        .keylen = sizeof(rsa1024_public_key),
+        .is_valid_key = true,
+        .exp_key_len = 128,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-1024-private",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+        .key = rsa1024_private_key,
+        .keylen = sizeof(rsa1024_private_key),
+        .is_valid_key = true,
+        .exp_key_len = 128,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-2048-public",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa2048_public_key,
+        .keylen = sizeof(rsa2048_public_key),
+        .is_valid_key = true,
+        .exp_key_len = 256,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-2048-private",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+        .key = rsa2048_private_key,
+        .keylen = sizeof(rsa2048_private_key),
+        .is_valid_key = true,
+        .exp_key_len = 256,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-public-lack-elem",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa_public_key_lack_element,
+        .keylen = sizeof(rsa_public_key_lack_element),
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-private-lack-elem",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+        .key = rsa_private_key_lack_element,
+        .keylen = sizeof(rsa_private_key_lack_element),
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-public-empty-elem",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa_public_key_empty_element,
+        .keylen = sizeof(rsa_public_key_empty_element),
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-private-empty-elem",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+        .key = rsa_private_key_empty_element,
+        .keylen = sizeof(rsa_private_key_empty_element),
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-public-empty-key",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = NULL,
+        .keylen = 0,
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-private-empty-key",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PRIVATE,
+        .key = NULL,
+        .keylen = 0,
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-public-invalid-length-val",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa_public_key_invalid_length_val,
+        .keylen = sizeof(rsa_public_key_invalid_length_val),
+        .is_valid_key = false,
+    },
+    {
+        .path = "/crypto/akcipher/rsakey-public-extra-elem",
+        .key_type = QCRYPTO_AKCIPHER_KEY_TYPE_PUBLIC,
+        .key = rsa_public_key_extra_elem,
+        .keylen = sizeof(rsa_public_key_extra_elem),
+        .is_valid_key = false,
+    },
+};
+
+static QCryptoAkCipherTestData akcipher_test_data[] = {
     /* rsa1024 with raw padding */
     {
         .path = "/crypto/akcipher/rsa1024-raw",
@@ -697,14 +940,50 @@ static void test_akcipher(const void *opaque)
     qcrypto_akcipher_free(priv_key);
 }
 
+static void test_rsakey(const void *opaque)
+{
+    const QCryptoRSAKeyTestData *data = (const QCryptoRSAKeyTestData *)opaque;
+    QCryptoAkCipherOptions opt = {
+        .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+        .u.rsa = {
+            .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
+            .hash_alg = QCRYPTO_HASH_ALG_SHA1,
+        }
+    };
+    g_autoptr(QCryptoAkCipher) key = qcrypto_akcipher_new(
+        &opt, data->key_type, data->key, data->keylen, NULL);
+
+    if (!qcrypto_akcipher_supports(&opt)) {
+        return;
+    }
+
+    if (!data->is_valid_key) {
+        g_assert(key == NULL);
+        return;
+    }
+
+    g_assert(key != NULL);
+    g_assert(qcrypto_akcipher_max_ciphertext_len(key) == data->exp_key_len);
+    g_assert(qcrypto_akcipher_max_plaintext_len(key) == data->exp_key_len);
+    g_assert(qcrypto_akcipher_max_signature_len(key) == data->exp_key_len);
+    g_assert(qcrypto_akcipher_max_dgst_len(key) == data->exp_key_len);
+}
+
 int main(int argc, char **argv)
 {
     size_t i;
     g_test_init(&argc, &argv, NULL);
     g_assert(qcrypto_init(NULL) == 0);
 
-    for (i = 0; i < G_N_ELEMENTS(test_data); i++) {
-        g_test_add_data_func(test_data[i].path, &test_data[i], test_akcipher);
+    for (i = 0; i < G_N_ELEMENTS(akcipher_test_data); i++) {
+        g_test_add_data_func(akcipher_test_data[i].path,
+                             &akcipher_test_data[i],
+                             test_akcipher);
+    }
+    for (i = 0; i < G_N_ELEMENTS(rsakey_test_data); i++) {
+        g_test_add_data_func(rsakey_test_data[i].path,
+                             &rsakey_test_data[i],
+                             test_rsakey);
     }
 
     return g_test_run();
-- 
2.36.1


