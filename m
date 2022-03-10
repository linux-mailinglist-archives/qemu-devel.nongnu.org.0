Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D024D5020
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:22:32 +0100 (CET)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMUh-0005ya-Fq
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:22:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRq-000383-Iz
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRk-0003fP-Vf
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFVD8I5EulyUZT0V3ZlirHWb+BNB0ZKwZrsrOuLBmUA=;
 b=ZfznVlAjjS0TJbKLMv/0Xx6YERg+fE8J/MHt6QEUYuCNSZIyD+F/49q4bRQ1w0ucQRYA6M
 CAgMZCKL4QDyO9lJBQ/oNu7eGuP1ZI/GHCG7pLwV+etAK388obIuNGtSSr+WZSxcvo7wlt
 nNCz+8ip8VSFpBZVkCz6fg7/qmn/9ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-mJokvl1hMlyI7ikRtCeW6g-1; Thu, 10 Mar 2022 12:19:25 -0500
X-MC-Unique: mJokvl1hMlyI7ikRtCeW6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 686FB800D55
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27349106F74B;
 Thu, 10 Mar 2022 17:18:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/18] tests: add more helper macros for creating TLS x509
 certs
Date: Thu, 10 Mar 2022 17:18:08 +0000
Message-Id: <20220310171821.3724080-6-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
2.34.1


