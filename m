Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D5D3AA139
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:26:38 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYNB-0007Xt-Od
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJM-0000Qf-Cz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJG-00024b-Pe
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMxZr8Rcry5WDgOL8lQycwuNpe1OS06Iy/sfLZSVq0s=;
 b=jUm/IaBclHwBfARz1VsIbJhmFGhrZR+HdvbNtjzcIUe5KvHWqqsGjvIWZlYer/kWezCfvr
 NDXHxuUzRmsfMOyw23cK++aLGP5YjIkGM6DmVkbHfc04t1OWrjQzv0KSbB8AFvzqAFLr9T
 N7z71rOZNsHdJkZBXiIl4JUxSH2bQgg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-STPk8HgtPnuRHEhfKvTeMQ-1; Wed, 16 Jun 2021 12:22:32 -0400
X-MC-Unique: STPk8HgtPnuRHEhfKvTeMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so1502684wrq.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMxZr8Rcry5WDgOL8lQycwuNpe1OS06Iy/sfLZSVq0s=;
 b=PCIUP/nHoJxf/QWR2VdNeuXoYiYAYMoMUKCp5Oaqoz7gNbQrxWKPokENjon3nz7VzS
 KmjL3OvzRJA0FpMoa5mPTHwQ6caRCLLLmt0pi+WDRoQaE8mp+z1ZrQj1BES4ZYnzGWI4
 ylrrIrsGbSvbyBBVrAHB/mFHYwfr35R+5fCl5RaGAwqzROw63jXqKmKVrJjSyYk1Uxbe
 YlxSqQzAsi/Ug+Pm/Oetq5fklgzCDrdJLyo65Ym2dfes2O7ZiCBPsRVy7UUxV9VpvAWu
 fGKOgaAYbskKmF2KszowXiZVfPV4z/qFUx7aUYch6E7mpuT4dSizAAo6aMhP1N9fABDB
 cVlQ==
X-Gm-Message-State: AOAM533ZC15ECez1vifMaOy3jfoT0ER+7Sqbgzopxs1RZDZGUwesOj4N
 ki8onBYaZtEVZEMZ3tKhugBveJis1PxTD1wWT2/hNkVpMOSRFoJUmkxp43aqPunGf4eczjCzLCq
 iV8fo5gK9cGJcZqvuV3nOTKLxxmyaPjbkOGojArPQz46NfLAWKJ6rCfD7GpTFtRM/
X-Received: by 2002:a1c:bad6:: with SMTP id
 k205mr12496228wmf.171.1623860551252; 
 Wed, 16 Jun 2021 09:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzObt1DCt9M9foiHycfxkymJzjcVhLdybGnUd5eUqWk7jNa+LtDTCRtn49RA2kofMmJfp87kQ==
X-Received: by 2002:a1c:bad6:: with SMTP id
 k205mr12496205wmf.171.1623860551015; 
 Wed, 16 Jun 2021 09:22:31 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o20sm5470293wms.3.2021.06.16.09.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Wed, 16 Jun 2021 18:22:19 +0200
Message-Id: <20210616162225.2517463-2-philmd@redhat.com>
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
to access QCryptoTLSCreds internal 'endpoint' field.

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


