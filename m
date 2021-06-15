Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903243A8791
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:31:29 +0200 (CEST)
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCuO-0004MA-HF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCqz-000466-7Y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCqx-0003hI-JM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YUxkcREe+oRV0WuFPVPw6I/e1CnZd/+DTRnaH5xN54=;
 b=cIws1rA+gSBJC7tHFk0sy7CGzscQARS7O127Wg8iVy/9n1SOxOai4cxCw76irdtHdIrPMS
 H6/J9GTjsw4MoBrz6VRedJA+i0/TEYLhj4PD79g089LpeAKxXLlgUdRimClEpFrG7423sK
 GXhPjM8FZlxEo3Waq1JZg2Afp1RBis4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-e_6A-ojZMDi_9t7gZRYKyA-1; Tue, 15 Jun 2021 13:27:53 -0400
X-MC-Unique: e_6A-ojZMDi_9t7gZRYKyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n21-20020a7bcbd50000b02901a2ee0826aeso782136wmi.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YUxkcREe+oRV0WuFPVPw6I/e1CnZd/+DTRnaH5xN54=;
 b=lIYqSJPe1cqFWh+oy+dgPirdOn322ZQYyo7+4EjcytwF38z/15DxmVt80QFyieDDha
 L9EXA/ruMsW82WPOlip+LUxmtLhYn6SHTm8vDTAHP5DmUuUuropUW0fi8x3r7K9Q2y30
 PpFABVCYMtdIb0K7Hd/vOozz5SVIkAWsR0pM9fS7m/6FjIOWTkMgQi3D7e1lr5tLna3v
 y0jDm/V9JYH86gNJatc7UAN23kyL/FV19X6xYG3FlXNvZrKVryJp5Tnmkboa95SwxG/e
 5dj7DejpewsiGWE71QRuWykNMHs+dZT7ODIAdVd+Z7JO91fyRLSTxHE2BFtjq6/yoMnd
 Y1ZQ==
X-Gm-Message-State: AOAM531z+fCc/da+L9gfsNQu9TpDkCiuolu457CS45vGwLY8B99WV216
 bttvsi6RKGSI5POqgeBqBNigBh1AmeUuP5i+V0Nv21AakaHCf3sMjL8HOcbYuA2wcMCvUsaD3qt
 774VYsp7WEYwoHz/tEzb4DUuUn5AN9ZDl0HQhEfqrEdsy+G/J+MPVAmO0RvNenYGR
X-Received: by 2002:adf:ed03:: with SMTP id a3mr243866wro.166.1623778072289;
 Tue, 15 Jun 2021 10:27:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ1Q2Lt5OY9Jn4cIx8McjG9WIL61GGHQhflZ2Je/+HXtpFNCs94cA/kM0qWs5Em5flhqjNlA==
X-Received: by 2002:adf:ed03:: with SMTP id a3mr243836wro.166.1623778071994;
 Tue, 15 Jun 2021 10:27:51 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm2441212wmq.1.2021.06.15.10.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:27:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Tue, 15 Jun 2021 19:27:40 +0200
Message-Id: <20210615172746.2212998-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615172746.2212998-1-philmd@redhat.com>
References: <20210615172746.2212998-1-philmd@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to access QCryptoTLSCreds internal 'endpoint' field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlscreds.h | 13 +++++++++++++
 crypto/tlscreds.c         | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index d0808e391e9..e45f1e34853 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -65,5 +65,18 @@ struct QCryptoTLSCredsClass {
     CryptoTLSCredsReload reload;
 };
 
+/**
+ * qcrypto_tls_creds_check_endpoint:
+ * @creds: pointer to a TLS credentials object
+ * @endpoint: type of network endpoint that will be using the credentials
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


