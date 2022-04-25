Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335ED50ECC2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:43:05 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8MC-0001UI-9z
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8ID-0006rG-Ly
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IA-0007hh-Un
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5X9bt/3RAsZQjwKglbnsbx8v9F0z8+wpzsDpKL6Fdo=;
 b=b/1d438bygHY1xcTcAsGNBGGDFL4RDawx6xXPomZrkMISFEqunSINRhKJJ4O8RweHtqPdS
 ydUIAvfN+2h1o5jaOrjvoiNy01aK/Mv6JEcrPTJ4D5hcPSizbxbBtQd8+UaLsSgHsClIaZ
 tCsxBfjR+rBpMVt8UFCOTSK7YchDeT4=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-rVAQaOCCN124MWOr0wDEIA-1; Mon, 25 Apr 2022 19:38:53 -0400
X-MC-Unique: rVAQaOCCN124MWOr0wDEIA-1
Received: by mail-io1-f70.google.com with SMTP id
 k20-20020a5e9314000000b00649d55ffa67so12528253iom.20
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u5X9bt/3RAsZQjwKglbnsbx8v9F0z8+wpzsDpKL6Fdo=;
 b=HHRAI9XfvuOXV1euzOq2ZrSUYjJfPZrCgjO26kRT0/aa8NhO+PgUQKozhVvGPGkklS
 ZKnH9n4F4FZ4PygQyQLGXtYeLXQYnMN+ahvnNFkftGvLP2eOM6tEDGE0635ic2jVi+ut
 wRTyKHBZFrwrgmCFOXIKCwvhjmGF6kTtj0dL056voPGIZADDCYNlqCAti6pQChsHWYgJ
 L2BntQTFUCK7MadJAVveLlUHdtlmLrLbbdObtXK+OMLECFiqFIHNrB2sGvVgun5Njq+Y
 yxHHsdUAlthu87zGRsCjohSVn8d/PlaGZuWxwO1t/KQTXT3m6EIXpFNvV4AxR/fA2Apv
 5hTg==
X-Gm-Message-State: AOAM533lSwyY/f8ELOyrP73yDsa8WASRhJhtJH6Mnn2yH8BwNn/d7Iqw
 /ekREeFWTtUTTHhLSYKHtVZ71waKEUMDZBozuqmmSYfK1U04oOOOYwrnl0mgTxrG3pf1Vdyj9wZ
 U24AWizG+0wcneIj4f4EMwJVXn3wo+U+cqfL+ANaYCy8ququI8uGk0Q6dTjUx9pLZ
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr8152868iom.80.1650929932460; 
 Mon, 25 Apr 2022 16:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ZGsA4VU05kSkval1TzG4Mt9akMHE0HflCtXMA8YKzMo85PXBtyv5Y78L4Wh4bYnILrGl5g==
X-Received: by 2002:a5e:930e:0:b0:649:d7f0:ebc5 with SMTP id
 k14-20020a5e930e000000b00649d7f0ebc5mr8152857iom.80.1650929932209; 
 Mon, 25 Apr 2022 16:38:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:51 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/21] tests: add more helper macros for creating TLS x509
 certs
Date: Mon, 25 Apr 2022 19:38:28 -0400
Message-Id: <20220425233847.10393-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

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
2.32.0


