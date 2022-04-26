Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC0510309
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:17:38 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNsf-0000Jo-Rg
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcZ-00040I-GC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcW-0007Pr-Ds
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650988855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSwaVpsZW+CWVjxt7/jW3bRhoZy3B4MN4icq2tZscWc=;
 b=QgNWWw0E2NWvBAJ9KAYWv7vTPYEwR3RoB65SoIJb6E2y0NoWfYXL2w3js5/jNboX4NAxoi
 CsHxNiab/AfXmKyibD9ljuUAQfsp852TxHYcC1N4Ej9D7pLfrvR2euY/yNX2rg1/fNRjnb
 epA2GfMVMVxkmDuvLczXZWHGdD8YiGM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-0fbZ7i4gPaO2leS6qCnuvQ-1; Tue, 26 Apr 2022 12:00:53 -0400
X-MC-Unique: 0fbZ7i4gPaO2leS6qCnuvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 562781E1AE47
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:00:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18601C202C8;
 Tue, 26 Apr 2022 16:00:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] tests: add more helper macros for creating TLS x509
 certs
Date: Tue, 26 Apr 2022 17:00:41 +0100
Message-Id: <20220426160048.812266-3-berrange@redhat.com>
In-Reply-To: <20220426160048.812266-1-berrange@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These macros are more suited to the general consumers of certs in the
test suite, where we don't need to exercise every single possible
permutation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/crypto-tls-x509-helpers.h | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/unit/crypto-tls-x509-helpers.h b/tests/unit/crypto-tls-x509-helpers.h
index cf6329e653..247e7160eb 100644
--- a/tests/unit/crypto-tls-x509-helpers.h
+++ b/tests/unit/crypto-tls-x509-helpers.h
@@ -26,6 +26,9 @@
 #include <libtasn1.h>
 
 
+#define QCRYPTO_TLS_TEST_CLIENT_NAME "ACME QEMU Client"
+#define QCRYPTO_TLS_TEST_CLIENT_HOSTILE_NAME "ACME Hostile Client"
+
 /*
  * This contains parameter about how to generate
  * certificates.
@@ -118,6 +121,56 @@ void test_tls_cleanup(const char *keyfile);
     };                                                                  \
     test_tls_generate_cert(&varname, NULL)
 
+# define TLS_ROOT_REQ_SIMPLE(varname, fname)                            \
+    QCryptoTLSTestCertReq varname = {                                   \
+        .filename = fname,                                              \
+        .cn = "qemu-CA",                                                \
+        .basicConstraintsEnable = true,                                 \
+        .basicConstraintsCritical = true,                               \
+        .basicConstraintsIsCA = true,                                   \
+        .keyUsageEnable = true,                                         \
+        .keyUsageCritical = true,                                       \
+        .keyUsageValue = GNUTLS_KEY_KEY_CERT_SIGN,                      \
+    };                                                                  \
+    test_tls_generate_cert(&varname, NULL)
+
+# define TLS_CERT_REQ_SIMPLE_CLIENT(varname, cavarname, cname, fname)   \
+    QCryptoTLSTestCertReq varname = {                                   \
+        .filename = fname,                                              \
+        .cn = cname,                                                    \
+        .basicConstraintsEnable = true,                                 \
+        .basicConstraintsCritical = true,                               \
+        .basicConstraintsIsCA = false,                                  \
+        .keyUsageEnable = true,                                         \
+        .keyUsageCritical = true,                                       \
+        .keyUsageValue =                                                \
+        GNUTLS_KEY_DIGITAL_SIGNATURE | GNUTLS_KEY_KEY_ENCIPHERMENT,     \
+        .keyPurposeEnable = true,                                       \
+        .keyPurposeCritical = true,                                     \
+        .keyPurposeOID1 = GNUTLS_KP_TLS_WWW_CLIENT,                     \
+    };                                                                  \
+    test_tls_generate_cert(&varname, cavarname.crt)
+
+# define TLS_CERT_REQ_SIMPLE_SERVER(varname, cavarname, fname,          \
+                                    hostname, ipaddr)                   \
+    QCryptoTLSTestCertReq varname = {                                   \
+        .filename = fname,                                              \
+        .cn = hostname ? hostname : ipaddr,                             \
+        .altname1 = hostname,                                           \
+        .ipaddr1 = ipaddr,                                              \
+        .basicConstraintsEnable = true,                                 \
+        .basicConstraintsCritical = true,                               \
+        .basicConstraintsIsCA = false,                                  \
+        .keyUsageEnable = true,                                         \
+        .keyUsageCritical = true,                                       \
+        .keyUsageValue =                                                \
+        GNUTLS_KEY_DIGITAL_SIGNATURE | GNUTLS_KEY_KEY_ENCIPHERMENT,     \
+        .keyPurposeEnable = true,                                       \
+        .keyPurposeCritical = true,                                     \
+        .keyPurposeOID1 = GNUTLS_KP_TLS_WWW_SERVER,                     \
+    };                                                                  \
+    test_tls_generate_cert(&varname, cavarname.crt)
+
 extern const asn1_static_node pkix_asn1_tab[];
 
 #endif
-- 
2.35.1


