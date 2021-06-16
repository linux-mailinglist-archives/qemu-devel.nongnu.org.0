Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FA3AA148
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:28:27 +0200 (CEST)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYOw-0004oK-By
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJc-0001EE-MA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJa-0002I9-MK
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQ+2M3Z1Th/Ec7i/HdYyIDKbmYICi5tPJM7BdnimDks=;
 b=Xbh8ypVzRM+IGY40VC8PDvbQ7CFwJYGHdHyXVog/ycKpWzS18xUK27KCfb0Vwjb2KH/I//
 fMZGQnI70L9gydLWETbbsJkR0Elx6bLN6YV6pCFvsYBmsweO2ZaF46/Jtku7zrii8NxFpO
 fwYzlETcp91dCNONwSL/RwpIRZ8Y80o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-ofVKBjj6PLWVPxcCWlCc9Q-1; Wed, 16 Jun 2021 12:22:49 -0400
X-MC-Unique: ofVKBjj6PLWVPxcCWlCc9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1434654wmh.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQ+2M3Z1Th/Ec7i/HdYyIDKbmYICi5tPJM7BdnimDks=;
 b=IIupdnZFCrlMKI36ngiDAZ7RDSjyMLBi+b1cqYbC92eW7bTUig2OJg568R0hDG33OZ
 YeCBVQoT+t79sIX9EYpZbDVejrYRH+xUow4EW/CmfX85E3I4dlwpU2B1z9st2mah5Mzo
 adGi5kS8WVroNBYkyzekzQtaIYrDCsApl1tStucYNderXincqIlUNzKvjwz+IPeXc459
 SPQ9IxHh6TgqurHV/5rIJNw0wRGM8+ucPbWJw2rGLqMs9uyUciUMXa+GJcpwebvF4Ff6
 MdHawN+qmGw0hl4aVdyVm0A0/09kfK4ohqdM8ZiUvCWrCJA7DSD7Pplve383OeZ5l6vK
 mztw==
X-Gm-Message-State: AOAM5317InxO9wYtec+fQnRCrfLfDn6zi3H0xT+5MAIyf5whJx9v05gb
 mUtcND3LkVzTpHupiBk/6fOLngj3hblpeAQKi/XgHkB6YKMF3DS5wbf6EcNujuJqsC/+mweAVgh
 aFz5gklD+kc1u7EAzxbUujjMO/IYFtMdCrS/thw7wzofYykRGGHaE3e87CWbtl6VF
X-Received: by 2002:a1c:7210:: with SMTP id n16mr11912088wmc.75.1623860568052; 
 Wed, 16 Jun 2021 09:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMaZiq/ObnBOCKWpuK/AJV8Y1V+dp7UYZKVzWUM5D9TQdZXCVM/nmylcAX4JIhWohomBRgtA==
X-Received: by 2002:a1c:7210:: with SMTP id n16mr11912068wmc.75.1623860567839; 
 Wed, 16 Jun 2021 09:22:47 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w8sm2829292wre.70.2021.06.16.09.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Wed, 16 Jun 2021 18:22:23 +0200
Message-Id: <20210616162225.2517463-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616162225.2517463-1-philmd@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to avoid accessing QCryptoTLSCreds internal 'endpoint' field
directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlssession.h | 15 +++++++++++++++
 crypto/tlssession.c         |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 15b9cef086c..2fb0bb02d9f 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -162,6 +162,21 @@ void qcrypto_tls_session_free(QCryptoTLSSession *sess);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoTLSSession, qcrypto_tls_session_free)
 
+/**
+ * qcrypto_tls_session_check_role:
+ * @creds: pointer to a TLS credentials object
+ * @endpoint: role of the TLS session, client or server
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Check whether the session object operates according to
+ * the role of the @endpoint argument.
+ *
+ * Returns true if the session is setup for the endpoint role, false otherwise
+ */
+bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
+                                    QCryptoTLSCredsEndpoint endpoint,
+                                    Error **errp);
+
 /**
  * qcrypto_tls_session_check_credentials:
  * @sess: the TLS session object
diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index 33203e8ca71..4e614b73a28 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -640,3 +640,10 @@ qcrypto_tls_session_get_peer_name(QCryptoTLSSession *sess)
 }
 
 #endif
+
+bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
+                                    QCryptoTLSCredsEndpoint endpoint,
+                                    Error **errp)
+{
+    return qcrypto_tls_creds_check_endpoint(creds, endpoint, errp);
+}
-- 
2.31.1


