Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0D3BC90A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:07:36 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hzL-0002uQ-HP
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrx-00056I-Ss
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrr-00011Z-AY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+B/5gJHXLTCpBRMsOySM7o6zt77m7u8+RRHqTi+BnM=;
 b=PX2ke8yvKT3pn1lc7LgREQpcNZrapW5Gscwa3T1TFpF4hmsPhA1Gbb44PzTkSbds/yqk/T
 pXg74AVkl1Gu+n4NpEglj1R5wq6cX6T9QC2MLqf57tM0Fbv0wX9izO0NvR8dMvZo6+DXaU
 gqD0p8i5cnnJqE2Dlcm9Lah8njd04iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-6KgJaDrbNiKvW6U6eASEVw-1; Tue, 06 Jul 2021 05:59:42 -0400
X-MC-Unique: 6KgJaDrbNiKvW6U6eASEVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C19C9100C660
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:41 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CED895D6A1;
 Tue,  6 Jul 2021 09:59:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/18] crypto: use &error_fatal in crypto tests
Date: Tue,  6 Jul 2021 10:59:10 +0100
Message-Id: <20210706095924.764117-5-berrange@redhat.com>
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

Using error_fatal provides better diagnostics when tests
failed, than using asserts, because we see the text of
the error message.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-hash.c | 12 ++++++------
 tests/unit/test-crypto-hmac.c | 28 ++++++++--------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/tests/unit/test-crypto-hash.c b/tests/unit/test-crypto-hash.c
index ce7d0ab9b5..b50e28f212 100644
--- a/tests/unit/test-crypto-hash.c
+++ b/tests/unit/test-crypto-hash.c
@@ -104,7 +104,7 @@ static void test_hash_alloc(void)
                                  strlen(INPUT_TEXT),
                                  &result,
                                  &resultlen,
-                                 NULL);
+                                 &error_fatal);
         g_assert(ret == 0);
         g_assert(resultlen == expected_lens[i]);
 
@@ -139,7 +139,7 @@ static void test_hash_prealloc(void)
                                  strlen(INPUT_TEXT),
                                  &result,
                                  &resultlen,
-                                 NULL);
+                                 &error_fatal);
         g_assert(ret == 0);
 
         g_assert(resultlen == expected_lens[i]);
@@ -176,7 +176,7 @@ static void test_hash_iov(void)
                                   iov, 3,
                                   &result,
                                   &resultlen,
-                                  NULL);
+                                  &error_fatal);
         g_assert(ret == 0);
         g_assert(resultlen == expected_lens[i]);
         for (j = 0; j < resultlen; j++) {
@@ -210,7 +210,7 @@ static void test_hash_digest(void)
                                   INPUT_TEXT,
                                   strlen(INPUT_TEXT),
                                   &digest,
-                                  NULL);
+                                  &error_fatal);
         g_assert(ret == 0);
         g_assert_cmpstr(digest, ==, expected_outputs[i]);
         g_free(digest);
@@ -234,7 +234,7 @@ static void test_hash_base64(void)
                                   INPUT_TEXT,
                                   strlen(INPUT_TEXT),
                                   &digest,
-                                  NULL);
+                                  &error_fatal);
         g_assert(ret == 0);
         g_assert_cmpstr(digest, ==, expected_outputs_b64[i]);
         g_free(digest);
@@ -243,7 +243,7 @@ static void test_hash_base64(void)
 
 int main(int argc, char **argv)
 {
-    g_assert(qcrypto_init(NULL) == 0);
+    g_assert(qcrypto_init(&error_fatal) == 0);
 
     g_test_init(&argc, &argv, NULL);
     g_test_add_func("/crypto/hash/iov", test_hash_iov);
diff --git a/tests/unit/test-crypto-hmac.c b/tests/unit/test-crypto-hmac.c
index ee55382a3c..23eb724d94 100644
--- a/tests/unit/test-crypto-hmac.c
+++ b/tests/unit/test-crypto-hmac.c
@@ -89,7 +89,6 @@ static void test_hmac_alloc(void)
         QCryptoHmac *hmac = NULL;
         uint8_t *result = NULL;
         size_t resultlen = 0;
-        Error *err = NULL;
         const char *exp_output = NULL;
         int ret;
         size_t j;
@@ -101,14 +100,12 @@ static void test_hmac_alloc(void)
         exp_output = data->hex_digest;
 
         hmac = qcrypto_hmac_new(data->alg, (const uint8_t *)KEY,
-                                strlen(KEY), &err);
-        g_assert(err == NULL);
+                                strlen(KEY), &error_fatal);
         g_assert(hmac != NULL);
 
         ret = qcrypto_hmac_bytes(hmac, (const char *)INPUT_TEXT,
                                  strlen(INPUT_TEXT), &result,
-                                 &resultlen, &err);
-        g_assert(err == NULL);
+                                 &resultlen, &error_fatal);
         g_assert(ret == 0);
 
         for (j = 0; j < resultlen; j++) {
@@ -131,7 +128,6 @@ static void test_hmac_prealloc(void)
         QCryptoHmac *hmac = NULL;
         uint8_t *result = NULL;
         size_t resultlen = 0;
-        Error *err = NULL;
         const char *exp_output = NULL;
         int ret;
         size_t j;
@@ -146,14 +142,12 @@ static void test_hmac_prealloc(void)
         result = g_new0(uint8_t, resultlen);
 
         hmac = qcrypto_hmac_new(data->alg, (const uint8_t *)KEY,
-                                strlen(KEY), &err);
-        g_assert(err == NULL);
+                                strlen(KEY), &error_fatal);
         g_assert(hmac != NULL);
 
         ret = qcrypto_hmac_bytes(hmac, (const char *)INPUT_TEXT,
                                  strlen(INPUT_TEXT), &result,
-                                 &resultlen, &err);
-        g_assert(err == NULL);
+                                 &resultlen, &error_fatal);
         g_assert(ret == 0);
 
         exp_output = data->hex_digest;
@@ -177,7 +171,6 @@ static void test_hmac_iov(void)
         QCryptoHmac *hmac = NULL;
         uint8_t *result = NULL;
         size_t resultlen = 0;
-        Error *err = NULL;
         const char *exp_output = NULL;
         int ret;
         size_t j;
@@ -194,13 +187,11 @@ static void test_hmac_iov(void)
         exp_output = data->hex_digest;
 
         hmac = qcrypto_hmac_new(data->alg, (const uint8_t *)KEY,
-                                strlen(KEY), &err);
-        g_assert(err == NULL);
+                                strlen(KEY), &error_fatal);
         g_assert(hmac != NULL);
 
         ret = qcrypto_hmac_bytesv(hmac, iov, 3, &result,
-                                  &resultlen, &err);
-        g_assert(err == NULL);
+                                  &resultlen, &error_fatal);
         g_assert(ret == 0);
 
         for (j = 0; j < resultlen; j++) {
@@ -222,7 +213,6 @@ static void test_hmac_digest(void)
         QCryptoHmacTestData *data = &test_data[i];
         QCryptoHmac *hmac = NULL;
         uint8_t *result = NULL;
-        Error *err = NULL;
         const char *exp_output = NULL;
         int ret;
 
@@ -233,14 +223,12 @@ static void test_hmac_digest(void)
         exp_output = data->hex_digest;
 
         hmac = qcrypto_hmac_new(data->alg, (const uint8_t *)KEY,
-                                strlen(KEY), &err);
-        g_assert(err == NULL);
+                                strlen(KEY), &error_fatal);
         g_assert(hmac != NULL);
 
         ret = qcrypto_hmac_digest(hmac, (const char *)INPUT_TEXT,
                                   strlen(INPUT_TEXT), (char **)&result,
-                                  &err);
-        g_assert(err == NULL);
+                                  &error_fatal);
         g_assert(ret == 0);
 
         g_assert_cmpstr((const char *)result, ==, exp_output);
-- 
2.31.1


