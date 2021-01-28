Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B03307C51
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:26:44 +0100 (CET)
Received: from localhost ([::1]:55956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5B47-00029o-SV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@mini.fritz.box>)
 id 1l5Az7-0006My-Du
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:33 -0500
Received: from p5b1511bf.dip0.t-ipconnect.de ([91.21.17.191]:51064
 helo=mini.fritz.box) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan@mini.fritz.box>) id 1l5Az4-0000Z0-Sz
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:33 -0500
Received: by mini.fritz.box (Postfix, from userid 502)
 id EFF8392CA8D; Thu, 28 Jan 2021 18:15:26 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests: Replace deprecated ASN1 code
Date: Thu, 28 Jan 2021 18:15:23 +0100
Message-Id: <20210128171523.45921-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.21.17.191; envelope-from=stefan@mini.fritz.box;
 helo=mini.fritz.box
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, RCVD_IN_PBL=3.335, RCVD_IN_SORBS_DUL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes several compiler warnings on MacOS with Homebrew.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tests/crypto-tls-x509-helpers.c | 10 +++++-----
 tests/crypto-tls-x509-helpers.h |  2 +-
 tests/pkix_asn1_tab.c           |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/crypto-tls-x509-helpers.c b/tests/crypto-tls-x509-helpers.c
index 01b3daf358..97658592a2 100644
--- a/tests/crypto-tls-x509-helpers.c
+++ b/tests/crypto-tls-x509-helpers.c
@@ -30,7 +30,7 @@
  * This stores some static data that is needed when
  * encoding extensions in the x509 certs
  */
-ASN1_TYPE pkix_asn1;
+asn1_node pkix_asn1;
 
 /*
  * To avoid consuming random entropy to generate keys,
@@ -139,7 +139,7 @@ void test_tls_cleanup(const char *keyfile)
 /*
  * Turns an ASN1 object into a DER encoded byte array
  */
-static void test_tls_der_encode(ASN1_TYPE src,
+static void test_tls_der_encode(asn1_node src,
                                 const char *src_name,
                                 gnutls_datum_t *res)
 {
@@ -317,7 +317,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * the 'critical' field which we want control over
      */
     if (req->basicConstraintsEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
 
         asn1_create_element(pkix_asn1, "PKIX1.BasicConstraints", &ext);
         asn1_write_value(ext, "cA",
@@ -344,7 +344,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * to be 'critical'
      */
     if (req->keyUsageEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
         char str[2];
 
         str[0] = req->keyUsageValue & 0xff;
@@ -374,7 +374,7 @@ test_tls_generate_cert(QCryptoTLSTestCertReq *req,
      * set this the hard way building up ASN1 data ourselves
      */
     if (req->keyPurposeEnable) {
-        ASN1_TYPE ext = ASN1_TYPE_EMPTY;
+        asn1_node ext = NULL;
 
         asn1_create_element(pkix_asn1, "PKIX1.ExtKeyUsageSyntax", &ext);
         if (req->keyPurposeOID1) {
diff --git a/tests/crypto-tls-x509-helpers.h b/tests/crypto-tls-x509-helpers.h
index 08efba4e19..8fcd7785ab 100644
--- a/tests/crypto-tls-x509-helpers.h
+++ b/tests/crypto-tls-x509-helpers.h
@@ -125,7 +125,7 @@ void test_tls_cleanup(const char *keyfile);
     };                                                                  \
     test_tls_generate_cert(&varname, NULL)
 
-extern const ASN1_ARRAY_TYPE pkix_asn1_tab[];
+extern const asn1_static_node pkix_asn1_tab[];
 
 #endif /* QCRYPTO_HAVE_TLS_TEST_SUPPORT */
 
diff --git a/tests/pkix_asn1_tab.c b/tests/pkix_asn1_tab.c
index f15fc515cb..4aaf736d3f 100644
--- a/tests/pkix_asn1_tab.c
+++ b/tests/pkix_asn1_tab.c
@@ -8,7 +8,7 @@
 
 #ifdef QCRYPTO_HAVE_TLS_TEST_SUPPORT
 
-const ASN1_ARRAY_TYPE pkix_asn1_tab[] = {
+const asn1_static_node pkix_asn1_tab[] = {
   {"PKIX1", 536875024, 0},
   {0, 1073741836, 0},
   {"id-ce", 1879048204, 0},
-- 
2.24.3 (Apple Git-128)


