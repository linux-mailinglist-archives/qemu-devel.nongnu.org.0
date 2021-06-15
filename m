Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E13A86E0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:51:12 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCHP-0001sJ-5Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEd-0004bX-1w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEb-0003UD-24
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2lT3CjVv1bZEYZLmYC8EbTX4byvBsRg1m9eoqp1Vsg=;
 b=H/7FSJGQcCRf3hoJG0tldK3xfPdKoRx5zMWTpNAt57yxlx+WfYSYvRQDDCDNjJEr9xbEcP
 YQFYjWzWZYZJ4Vm2SgCmzewqqs/0s26lwIoV/wIMpF8YJrLOwJSgSOr97tZZ/fPZUTohPQ
 aFAOiaMUR3o2ACr4ZScLDILJateYipE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-6SGLh2rhPem4S4fIu699cA-1; Tue, 15 Jun 2021 12:48:15 -0400
X-MC-Unique: 6SGLh2rhPem4S4fIu699cA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z13-20020adfec8d0000b0290114cc6b21c4so8839183wrn.22
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2lT3CjVv1bZEYZLmYC8EbTX4byvBsRg1m9eoqp1Vsg=;
 b=SQoXpKCytTKc8HfpPYUVHxL18b+RAA6ZjWPa8h7p7ie84uKFVzXdrCWUROWGgwqbeX
 Kc7OnW7Ev7UTeK6L2FkIUjHnDXYeu4s0i/O4g+c2v1ZJATdk/dfBsCwg0DncF9KBtqMs
 k5Li/48ZM78sHEAui/sa6OKZ9H9t16RxPHLhrT9Vx3cmST8y1M8Yzo+BciB3t8o/UzV+
 lfnlFZ6wkPnu7B2avW6R9VTYuo5/nhbWIAJGQ/dj/6nH7sm6uC3lvh4LK6U9PukgXjX5
 KMiUcgCyUBghipwXQ3QM4XPNAwOVcSz1e9sGh4gVkyW/Q2y/PIC0f9mhaahplNTFefJE
 8d5Q==
X-Gm-Message-State: AOAM53245tOQmAGMBKO3/3+KprovJkClggIGbdE8CNqQEo8Rtxo/PXcl
 at+vxUcAFESzYYEmbg4s3fZ9U+nfacD2cQHC0je/LLoqfhGBi7FM98m4vLXLhrgEzqItY4dorWj
 ycLQPV9OppuwWFy0ArFMg6ciPWHLKuGeNpVZoDpfy4rCPOJuTI45U5gECMt3xLolW
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr216583wmk.41.1623775694188;
 Tue, 15 Jun 2021 09:48:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEwKCYqY64oLIugwpvHf3zoOZHS/DX/LPpAuBYUHphZIRhj4cICWSu6bOS6PfxVPZoREgGDQ==
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr216553wmk.41.1623775693979;
 Tue, 15 Jun 2021 09:48:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b11sm4630620wrf.43.2021.06.15.09.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Tue, 15 Jun 2021 18:47:49 +0200
Message-Id: <20210615164751.2192807-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to avoid accessing QCryptoTLSCreds internal 'endpoint' field
directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlssession.h | 13 +++++++++++++
 crypto/tlssession.c         |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 15b9cef086c..fdf7578609c 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -162,6 +162,19 @@ void qcrypto_tls_session_free(QCryptoTLSSession *sess);
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoTLSSession, qcrypto_tls_session_free)
 
+/**
+ * qcrypto_tls_session_check_role:
+ * @creds: pointer to a TLS credentials object
+ * @endpoint: role of the TLS session, client or server
+ *
+ * Check whether the session object operates according to
+ * the role of the @endpoint argument.
+ *
+ * Returns true if the session is setup for the endpoint role, false otherwise
+ */
+bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
+                                    QCryptoTLSCredsEndpoint endpoint);
+
 /**
  * qcrypto_tls_session_check_credentials:
  * @sess: the TLS session object
diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index 33203e8ca71..cf2781363fe 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -640,3 +640,9 @@ qcrypto_tls_session_get_peer_name(QCryptoTLSSession *sess)
 }
 
 #endif
+
+bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
+                                    QCryptoTLSCredsEndpoint endpoint)
+{
+    return qcrypto_tls_creds_check_endpoint(creds, endpoint);
+}
-- 
2.31.1


