Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EBD3A87A0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:34:37 +0200 (CEST)
Received: from localhost ([::1]:54192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCxQ-0002OK-Mq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrL-0005Gy-OA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrJ-0003vz-E7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpfvMmDtEHWIbtTtqU5cvD2dvenPniYScyqJywSH4gE=;
 b=AS41D/XwcoopfTmGaTsg5b6kAyZQiBYlka+CrRlU8JVIPKZi4PQywJq8gUmnFxsgYcBARz
 P+N7C/J1bhRXGi3t/80Alwtrp8fx+E7nmnQLaw58yPyMxtvjCj2eDiiWf7CBoXCkYL0ACu
 adUF33+HnbGzE/ZkWTGSV5etquTW0ZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-co3UofFKO9CMMeHte0aGmw-1; Tue, 15 Jun 2021 13:28:11 -0400
X-MC-Unique: co3UofFKO9CMMeHte0aGmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s8-20020adff8080000b0290114e1eeb8c6so8898500wrp.23
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SpfvMmDtEHWIbtTtqU5cvD2dvenPniYScyqJywSH4gE=;
 b=WszIznzprENb/piL77G3cdwrA0fosEXSyudJaGl0Dg3dYU2mcgrmUgG7047fKYtotb
 L9HyY2y0/bnufW5NazEq55l0qgDXiFZsm+gleIkA/JjLu+hyoYgnWVepHS57eC86+3gl
 ZpSc5kUPLvSIpljdwe1Qo/lRFmQSsidkFxUVikzeOdRw/yygyZNRnKMdxFSSJTIZhpoW
 8qf2bHQG0Du5D5gNcSkTN67NvW4SNPjEtW/Jy/kH2iOn/MB/Suj8QE4KM8XkoVjPqxAJ
 ZwllQ0TgDdLWR1pFCyQU3xwvPdLXclmrmr2d0Oxa9aNQmb10qKgk+m5xsFadfPG85meA
 AgLw==
X-Gm-Message-State: AOAM530cNz+D5LOSeozLDfT4bUMNpMLZn4a/eUZweRDe68RAMMcDONwy
 GyBct6M26QoBb2aFFOo+ovbGst+IdTr8F89Ux2/RkXENNPXHEyqXRGKbxMMWufc9ZZZi3qMGlic
 YeLypxWxD3s1ILH31E27WZfhXT8TccnjLE+JZLFjUaho5JJuVB4i9dlFh1UcVoJFE
X-Received: by 2002:a5d:6409:: with SMTP id z9mr188888wru.279.1623778089297;
 Tue, 15 Jun 2021 10:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVHLV4e8LzitTWeWbAjkMiFGlzn+QBETA5uOOz97EpAsQJRIlzupnkliTcAUMFMd2iLw0+Qg==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr188868wru.279.1623778089110;
 Tue, 15 Jun 2021 10:28:09 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z12sm19081845wrw.97.2021.06.15.10.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:28:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Tue, 15 Jun 2021 19:27:44 +0200
Message-Id: <20210615172746.2212998-6-philmd@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to avoid accessing QCryptoTLSCreds internal 'endpoint' field
directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlssession.h | 14 ++++++++++++++
 crypto/tlssession.c         |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 15b9cef086c..657a2c05521 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -162,6 +162,20 @@ void qcrypto_tls_session_free(QCryptoTLSSession *sess);
 
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


