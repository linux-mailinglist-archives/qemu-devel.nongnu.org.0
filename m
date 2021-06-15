Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C73A86E2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:52:39 +0200 (CEST)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCIo-0003k3-PY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEM-0003s3-Bd
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEK-0003Ju-Qo
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZSreQAzlorV+BiqdTF8qV7SiteVC4PUhE4rRujGY74=;
 b=GQF+5eCI24ujWFhuc0h4w2CBl13RHT2vVVAzN1bmLwOvqM/OrkKZ6pIrLPpE5JnWuMyi60
 X4UXnZ5ASSsZl+w4oaRYcnvtAmz+gwZLVGkJ7YtBQKjRLkZkTwZ2pKpslvKArWZXHfVdXu
 JjGrznfDGi8KmracZ/o8waMSHaI6Yns=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-k21D8YSSNYOnaQz2VDUJEA-1; Tue, 15 Jun 2021 12:47:58 -0400
X-MC-Unique: k21D8YSSNYOnaQz2VDUJEA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y12-20020adffa4c0000b0290119c11bd29eso6229169wrr.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZSreQAzlorV+BiqdTF8qV7SiteVC4PUhE4rRujGY74=;
 b=e01UcLf863ac0v0CckPsJsYOSUXthZZ1b0oHEJE1ntHbEqfdw9WGAcBJn12y7mLnXo
 1KP/sGiHgCOD2RiS5p+lxhKA/ELIVNTZB0iVsgGx6Nl5h1F0tB5RPY4c6hckzeifx6zE
 oyDLGvoQ3COA8SJch4JfIw4EDqQQQUmJ6zdeOo6CbBHG2PAMEEcmBwox6icM77ieAqfH
 3J7l3aH9vDXRfqo6CGfIB4U7fPh0jDHZmvVE4E7fxvD6dEeApfEGgxZy6klI2glZve1h
 5LhZSE08qOy8eBCHSK+NRZLLFLQYMSR6tkfhpZiT2fWUHs3VSKGl+teaASolgGU+7fPc
 xJDQ==
X-Gm-Message-State: AOAM533OlJavHhYEf2fZxUa0HwU0Yk8b5HaYUR5VYppmz65BNi2SBjjE
 s9f1Du9gOdIgfsIcrwXaTddALYILIYrVbJS9+uUeP2zzV0pg0+mvjbTWaZJ64Vmtn9aB00cnYyz
 H/ICy3Jw6iblD/KNNdvOkwQqmzMYKnhcGPmW5bXqj11jC6Cl5Ef5UGGkolGzUTLTk
X-Received: by 2002:a1c:b306:: with SMTP id c6mr6302521wmf.37.1623775677064;
 Tue, 15 Jun 2021 09:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeCwSkAa0ZyxyT73LtF8vv5+938GqB+bjxN87rCVJTPRDHZC/VhFkGzh8Zq2AsDeqmwbQGQA==
X-Received: by 2002:a1c:b306:: with SMTP id c6mr6302504wmf.37.1623775676920;
 Tue, 15 Jun 2021 09:47:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x7sm2044746wrn.3.2021.06.15.09.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:47:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Tue, 15 Jun 2021 18:47:45 +0200
Message-Id: <20210615164751.2192807-2-philmd@redhat.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to access QCryptoTLSCreds internal 'endpoint' field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/crypto/tlscreds.h | 12 ++++++++++++
 crypto/tlscreds.c         |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index d0808e391e9..eb9d5e75a84 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -65,5 +65,17 @@ struct QCryptoTLSCredsClass {
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
+                                      QCryptoTLSCredsEndpoint endpoint);
 
 #endif /* QCRYPTO_TLSCREDS_H */
diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index b68735f06fe..f9f45e12db1 100644
--- a/crypto/tlscreds.c
+++ b/crypto/tlscreds.c
@@ -259,6 +259,11 @@ qcrypto_tls_creds_finalize(Object *obj)
     g_free(creds->priority);
 }
 
+bool qcrypto_tls_creds_check_endpoint(QCryptoTLSCreds *creds,
+                                      QCryptoTLSCredsEndpoint endpoint)
+{
+    return creds->endpoint == endpoint;
+}
 
 static const TypeInfo qcrypto_tls_creds_info = {
     .parent = TYPE_OBJECT,
-- 
2.31.1


