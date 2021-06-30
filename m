Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299513B8188
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:58:52 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYrj-0000CQ-2G
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpU-0005ws-9k
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyYpS-0000fm-OO
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625054190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6Y1ydFjNek8sSs+yumq0UnZLReBA1004h4j+QFgAOE=;
 b=KBw10wgb2FKHZRvrRGSp9TsajuKXFYBXxEBXDEZhz8DsE/lexazb3SkqP+9QUMrvscwK0P
 3QHO02cqeoXC/f36fpxc4x8RJlekiZJoulpyIFtf1+khLnfBvMLvt0vHYZvC7RQ8lC+cF2
 1SaOwU0Iq1W9GlEQXAqiih0khXmWbnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-EbR6RvosPJGn5GnLPA6VPQ-1; Wed, 30 Jun 2021 07:56:28 -0400
X-MC-Unique: EbR6RvosPJGn5GnLPA6VPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AEBA100CF72;
 Wed, 30 Jun 2021 11:56:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-116.ams2.redhat.com
 [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8874F5D6AD;
 Wed, 30 Jun 2021 11:56:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] crypto/tlscreds: Introduce
 qcrypto_tls_creds_check_endpoint() helper
Date: Wed, 30 Jun 2021 12:56:06 +0100
Message-Id: <20210630115612.827664-2-berrange@redhat.com>
In-Reply-To: <20210630115612.827664-1-berrange@redhat.com>
References: <20210630115612.827664-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce the qcrypto_tls_creds_check_endpoint() helper
to access QCryptoTLSCreds internal 'endpoint' field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlscreds.c         | 12 ++++++++++++
 include/crypto/tlscreds.h | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index b68735f06f..084ce0d51a 100644
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
diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index d0808e391e..a14e44fac1 100644
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
-- 
2.31.1


