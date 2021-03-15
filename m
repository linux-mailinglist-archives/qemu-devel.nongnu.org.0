Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B181F33B3AA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:18:56 +0100 (CET)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLn7X-0000ie-Nj
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lLn5Z-0007p9-3p
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:16:53 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lLn5V-0006Ph-D3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:16:52 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzcMt6TjBz8y8N;
 Mon, 15 Mar 2021 21:14:50 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 21:16:32 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 1/3] crypto: add reload for QCryptoTLSCredsClass
Date: Mon, 15 Mar 2021 21:16:07 +0800
Message-ID: <20210315131609.2208-2-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210315131609.2208-1-changzihao1@huawei.com>
References: <20210315131609.2208-1-changzihao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=changzihao1@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, changzihao1@huawei.com,
 armbru@redhat.com, xiexiangyou@huawei.com, yebiaoxiang@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds reload interface for QCryptoTLSCredsClass and implements
the interface for QCryptoTLSCredsX509.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 crypto/tlscredsx509.c     | 48 +++++++++++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |  8 ++++---
 2 files changed, 53 insertions(+), 3 deletions(-)

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
 
 
-- 
2.28.0


