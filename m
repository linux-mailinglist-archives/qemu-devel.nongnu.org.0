Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89A05200C1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 17:11:00 +0200 (CEST)
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no52J-0001ML-Qr
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 11:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4ug-00010U-BB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4ue-0002kq-QN
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652108583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBzbxSzGkemj6L1jYRRa9lBxz6+YHAOxXVB3pLNq+oA=;
 b=TTOHg6ufQ76oxAfTU3FTU6U3seKneYKEzSv/+6YFH3damqccRj5pK5gSItOxJLypAzbYuo
 3e+WAVnvsk4k8vOZvFF8tM2mXgMp4/A/qASo2SflafHNDdR3O5U2MLMtATDTkvROLHUm0z
 vt+QEsIuHVAPUoLCjGEpcGwVa2lp23M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-MfkKyP2BPgy8CZ0vIMGOhg-1; Mon, 09 May 2022 11:03:02 -0400
X-MC-Unique: MfkKyP2BPgy8CZ0vIMGOhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB8191C08970
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 15:03:01 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005D1C28100;
 Mon,  9 May 2022 15:03:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 02/16] tests: add more helper macros for creating TLS x509 certs
Date: Mon,  9 May 2022 16:02:39 +0100
Message-Id: <20220509150253.218715-3-dgilbert@redhat.com>
In-Reply-To: <20220509150253.218715-1-dgilbert@redhat.com>
References: <20220509150253.218715-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

These macros are more suited to the general consumers of certs in the
test suite, where we don't need to exercise every single possible
permutation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-3-berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.36.0


