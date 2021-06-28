Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB53B668B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:17:02 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtwT-0005Vx-Oa
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtp9-0008MT-4k
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtp7-0001nI-Mf
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0szslgGWkXREoQifXmaYK6z/LFg8qkIY67jvHG2HCU=;
 b=OS1oe0J19yhfZ7Hc9F3QbfQvbtR7Y2NMAUXxCEIvTQC7fQAg46e3i2H7xVCYJbPNQ+HLaA
 LB7GK7RJcvVG8Pf7h52+lAGHTum0oesth5k0cO4HT1ChFSUN7hY5xrW/1Vmt99EeXnP/nz
 bESBYaexAnpgGCP4ti9bZffzfC7baxg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-t9xTsKvHPmuNTzuv45HDIQ-1; Mon, 28 Jun 2021 12:09:22 -0400
X-MC-Unique: t9xTsKvHPmuNTzuv45HDIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so9178710wms.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u0szslgGWkXREoQifXmaYK6z/LFg8qkIY67jvHG2HCU=;
 b=KqSsmOduojx+i+EtOBpryivfEtJLEh6afrh3BTjPAaVKSK/Skw1ELAwP+2qSw/hnl0
 HH1hzVZpMfAEYEZMutHExmMe154Uhfwkrt7FpxqhHZMvcG2rthlYadcaWmx++y3d02FA
 hqMXq/PvKD+B0mOOF14mKQr5E4EPvTE8DN1cnllpW2OL09BiQkopHryfRZvBjYOv02fB
 yJmAeZthqg9L3dnPcspXL4QvM/XJVEtnNoBb5vxXGMWyvZ34tBU5HiYLymEweBlsmJ4M
 lO2ojWDJLi1vOwk4cViUlvpaqhtRX4bJQHpu8TSyl/Ikw3MNkz9zFtsfpD1wG5G9Hk81
 ii4A==
X-Gm-Message-State: AOAM532eXuCPflb8+DO6DdkGs2PHy4pKKcIQ4Kmd78sGHWXL/Oa91KmF
 psG9Kpiatv8q1d9Fj/QR0/f//s4SfyeHzx6QjhaM3Y4CZR43lDxrXbl3/eP3h5+7eOOIF8DC4kh
 w6UMisB+SnE9K8sqOG3VmkfvqWUtAJ1IKOAiCBziQjX9ZEIFQan+6zGuY1dOulqOe
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr27874527wrx.7.1624896560916; 
 Mon, 28 Jun 2021 09:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxp7sBYNDZ+tIxlu3VM/Ofvbnmyo974+LJ+okDa00qUiU+KL3ROEa2ta0GL/MqyOym4OB/iw==
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr27874488wrx.7.1624896560566; 
 Mon, 28 Jun 2021 09:09:20 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n29sm8884871wms.34.2021.06.28.09.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Mon, 28 Jun 2021 18:09:08 +0200
Message-Id: <20210628160914.2461906-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628160914.2461906-1-philmd@redhat.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org
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


