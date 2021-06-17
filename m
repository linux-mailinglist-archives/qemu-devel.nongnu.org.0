Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2293AB416
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:54:00 +0200 (CEST)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrWx-00045q-Oz
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyp-0005Fh-8h
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyn-000874-FN
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0szslgGWkXREoQifXmaYK6z/LFg8qkIY67jvHG2HCU=;
 b=D4sQblBufqUHBgD1zg2UJre9vPKpOUQqjPeK+Uv7YH3KnIadjADbBgf0ZV9MhshhBk2Pmi
 EOIbsDjJtuUeZi0IgMi1ACPI+iLlIET4s8seUr2bXhPsUV/LdNqrVvMT23v+d72xHp1Pev
 ewBB1apW9xFWqVxpILPS0MxCAVWUPUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-H1ZZcBgcMsiVXpvd8knHvw-1; Thu, 17 Jun 2021 08:18:37 -0400
X-MC-Unique: H1ZZcBgcMsiVXpvd8knHvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020a5d688a0000b0290119c2ce2499so2811459wru.19
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u0szslgGWkXREoQifXmaYK6z/LFg8qkIY67jvHG2HCU=;
 b=L2mDUrgjd5vZK4z3Mv4aQacoqtbDOT/QGFD4oLac9iDgd1FhxLZ7byOmUdmeRHrrWp
 omOG2m7GtSvp9kaaSOeXpMuqSaVZXQMIqD4pVUJVQbF7ulKmRlwPDntqzE83EkuGNiHW
 /d+ekLFEoNGCCw5fG+yjIPQbKeAJuu3YPUcrFITPDGqWcT09Xac9StywwDWB/cQbCuEv
 2SfbscCug7yJ9jR17gteIgrTuIyrUkyxQA6CphDGWgsAiLvDpYfxN1Ca9ruPH9wN//Dy
 XbZnR/SYH5637IMZG10juMeBTNhSPlg0//GBYe5qIEKiGyzd5eCAVKwaQ4I92lgHCy5N
 RxPw==
X-Gm-Message-State: AOAM532qgVnXLGBUpzXemFM/iBzAUTJKrlXGfgpdwUV30WKGAgQCO8PZ
 xcRk5/LdXuWM+hPnp3YZFjPHLX85l9EIw1BKdTO4xmT/iQ1vSV9WKFLZjPPprVnwmPFZGHqKDoy
 RcFGCByWQSYpeNMl16dYr3i6ZUGyUnmkfqZgmtFO7yc7tVmIdaiA760DVjznoVn7g
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr5232356wri.232.1623932316582; 
 Thu, 17 Jun 2021 05:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN5acs7AP9wz1+J7adMWiUM5Q9XoruQoYp5RfMBAEDeWD6w1lwNkEbjk7KsTU6dxEDe0/ysw==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr5232333wri.232.1623932316390; 
 Thu, 17 Jun 2021 05:18:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i9sm2147102wrn.13.2021.06.17.05.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Thu, 17 Jun 2021 14:18:25 +0200
Message-Id: <20210617121830.2776182-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617121830.2776182-1-philmd@redhat.com>
References: <20210617121830.2776182-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to access QCryptoTLSCreds internal 'endpoint' field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlscreds.h | 14 ++++++++++++++
 crypto/tlscreds.c         | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index d0808e391e9..a14e44fac15 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -65,5 +65,19 @@ struct QCryptoTLSCredsClass {
     CryptoTLSCredsReload reload;
 };
 
+/**
+ * qcrypto_tls_creds_check_endpoint:
+ * @creds: pointer to a TLS credentials object
+ * @endpoint: type of network endpoint that will be using the credentials
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Check whether the credentials is setup according to
+ * the type of @endpoint argument.
+ *
+ * Returns true if the credentials is setup for the endpoint, false otherwise
+ */
+bool qcrypto_tls_creds_check_endpoint(QCryptoTLSCreds *creds,
+                                      QCryptoTLSCredsEndpoint endpoint,
+                                      Error **errp);
 
 #endif /* QCRYPTO_TLSCREDS_H */
diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index b68735f06fe..084ce0d51ae 100644
--- a/crypto/tlscreds.c
+++ b/crypto/tlscreds.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi-types-crypto.h"
 #include "qemu/module.h"
 #include "tlscredspriv.h"
 #include "trace.h"
@@ -259,6 +260,17 @@ qcrypto_tls_creds_finalize(Object *obj)
     g_free(creds->priority);
 }
 
+bool qcrypto_tls_creds_check_endpoint(QCryptoTLSCreds *creds,
+                                      QCryptoTLSCredsEndpoint endpoint,
+                                      Error **errp)
+{
+    if (creds->endpoint != endpoint) {
+        error_setg(errp, "Expected TLS credentials for a %s endpoint",
+                   QCryptoTLSCredsEndpoint_str(endpoint));
+        return false;
+    }
+    return true;
+}
 
 static const TypeInfo qcrypto_tls_creds_info = {
     .parent = TYPE_OBJECT,
-- 
2.31.1


