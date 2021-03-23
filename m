Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4427346314
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:38:58 +0100 (CET)
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj7R-0006oJ-V4
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj5G-0004hO-5X
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj53-000322-Jg
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mg5YXtikDewBDQKrDeIbHA61Ye7pegvjg0B1KrnboLQ=;
 b=D6Re6vEqfja/ZL6jmIufWEch8lLFAMo8gc+RjQw/EW2MXsqVOXsZRf+7sbn6JhSngaMF43
 fb2hZyXuVMcuDYrLETmXYg8YX06rhDDNfiETn9lMlX+nzPIEsFUNqH9nNIPgzA5ZhylJe/
 js7tEcTcDTd+d5X+t2f0q6ENdWe6SBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-07L7MalZPcGNKky7U4zlTw-1; Tue, 23 Mar 2021 11:36:26 -0400
X-MC-Unique: 07L7MalZPcGNKky7U4zlTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78BE38189C6;
 Tue, 23 Mar 2021 15:36:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D78C5C1C5;
 Tue, 23 Mar 2021 15:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E75421800393; Tue, 23 Mar 2021 16:36:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] crypto: add reload for QCryptoTLSCredsClass
Date: Tue, 23 Mar 2021 16:36:12 +0100
Message-Id: <20210323153616.873822-2-kraxel@redhat.com>
In-Reply-To: <20210323153616.873822-1-kraxel@redhat.com>
References: <20210323153616.873822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zihao Chang <changzihao1@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Chang <changzihao1@huawei.com>

This patch adds reload interface for QCryptoTLSCredsClass and implements
the interface for QCryptoTLSCredsX509.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210316075845.1476-2-changzihao1@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/crypto/tlscreds.h |  8 ++++---
 crypto/tlscredsx509.c     | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/include/crypto/tlscreds.h b/include/crypto/tlscreds.h
index 079e37604784..d0808e391e91 100644
--- a/include/crypto/tlscreds.h
+++ b/include/crypto/tlscreds.h
@@ -30,14 +30,15 @@
 
 #define TYPE_QCRYPTO_TLS_CREDS "tls-creds"
 typedef struct QCryptoTLSCreds QCryptoTLSCreds;
-DECLARE_INSTANCE_CHECKER(QCryptoTLSCreds, QCRYPTO_TLS_CREDS,
-                         TYPE_QCRYPTO_TLS_CREDS)
-
 typedef struct QCryptoTLSCredsClass QCryptoTLSCredsClass;
+DECLARE_OBJ_CHECKERS(QCryptoTLSCreds, QCryptoTLSCredsClass, QCRYPTO_TLS_CREDS,
+                     TYPE_QCRYPTO_TLS_CREDS)
+
 
 #define QCRYPTO_TLS_CREDS_DH_PARAMS "dh-params.pem"
 
 
+typedef bool (*CryptoTLSCredsReload)(QCryptoTLSCreds *, Error **);
 /**
  * QCryptoTLSCreds:
  *
@@ -61,6 +62,7 @@ struct QCryptoTLSCreds {
 
 struct QCryptoTLSCredsClass {
     ObjectClass parent_class;
+    CryptoTLSCredsReload reload;
 };
 
 
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index dbadad4df28e..bc503bab5585 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -770,6 +770,51 @@ qcrypto_tls_creds_x509_prop_get_sanity(Object *obj,
 }
 
 
+#ifdef CONFIG_GNUTLS
+
+
+static bool
+qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
+{
+    QCryptoTLSCredsX509 *x509_creds = QCRYPTO_TLS_CREDS_X509(creds);
+    Error *local_err = NULL;
+    gnutls_certificate_credentials_t creds_data = x509_creds->data;
+    gnutls_dh_params_t creds_dh_params = x509_creds->parent_obj.dh_params;
+
+    x509_creds->data = NULL;
+    x509_creds->parent_obj.dh_params = NULL;
+    qcrypto_tls_creds_x509_load(x509_creds, &local_err);
+    if (local_err) {
+        qcrypto_tls_creds_x509_unload(x509_creds);
+        x509_creds->data = creds_data;
+        x509_creds->parent_obj.dh_params = creds_dh_params;
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    if (creds_data) {
+        gnutls_certificate_free_credentials(creds_data);
+    }
+    if (creds_dh_params) {
+        gnutls_dh_params_deinit(creds_dh_params);
+    }
+    return true;
+}
+
+
+#else /* ! CONFIG_GNUTLS */
+
+
+static bool
+qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
+{
+    return false;
+}
+
+
+#endif /* ! CONFIG_GNUTLS */
+
+
 static void
 qcrypto_tls_creds_x509_complete(UserCreatable *uc, Error **errp)
 {
@@ -800,6 +845,9 @@ static void
 qcrypto_tls_creds_x509_class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+    QCryptoTLSCredsClass *ctcc = QCRYPTO_TLS_CREDS_CLASS(oc);
+
+    ctcc->reload = qcrypto_tls_creds_x509_reload;
 
     ucc->complete = qcrypto_tls_creds_x509_complete;
 
-- 
2.30.2


