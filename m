Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34F3370A0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:57:05 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJ04-0002IN-QT
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKIy3-0000nR-Bo
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:54:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lKIxz-00028I-J3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:54:59 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dx5Q131SJz17Jfh;
 Thu, 11 Mar 2021 18:52:57 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 18:54:39 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/3] crypto: add reload for QCryptoTLSCredsClass
Date: Thu, 11 Mar 2021 18:54:22 +0800
Message-ID: <20210311105424.1370-2-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210311105424.1370-1-changzihao1@huawei.com>
References: <20210311105424.1370-1-changzihao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 crypto/tlscredsx509.c     | 117 ++++++++++++++++++++++++++++++++++++++
 include/crypto/tlscreds.h |   8 ++-
 2 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index dbadad4df28e..6b57f14f2df1 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -23,8 +23,10 @@
 #include "tlscredspriv.h"
 #include "crypto/secret.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qstring.h"
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
+#include "qom/qom-qobject.h"
 #include "trace.h"
 
 
@@ -770,6 +772,118 @@ qcrypto_tls_creds_x509_prop_get_sanity(Object *obj,
 }
 
 
+#ifdef CONFIG_GNUTLS
+
+
+/*
+ * object_property_get_qobject() return "" for NULL QString,
+ * set NULL QString prop as "" is unsafe.
+ */
+static bool
+qcrypto_tls_creds_x509_need_set_prop(QObject *qobj)
+{
+    QString *qstring = qobject_to(QString, qobj);
+    /* prop type is not QString. */
+    if (!qstring) {
+        return true;
+    }
+
+    return strlen(qstring_get_str(qstring)) > 0;
+}
+
+
+static bool
+qcrypto_tls_creds_x509_copy_propertites(Object *new,
+                                        Object *old,
+                                        Error **errp)
+{
+    ObjectProperty *prop = NULL;
+    ObjectPropertyIterator iter;
+    Error *local_err = NULL;
+
+    object_property_iter_init(&iter, old);
+    while ((prop = object_property_iter_next(&iter))) {
+        QObject *value = NULL;
+        /* "loaded" depends on other props, copy it finally. */
+        if (g_strcmp0(prop->name, "loaded") == 0) {
+            continue;
+        }
+
+        /* prop do not support set. */
+        if (!prop->set) {
+            continue;
+        }
+
+        value = object_property_get_qobject(old, prop->name, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return false;
+        }
+
+        if (qcrypto_tls_creds_x509_need_set_prop(value)) {
+            object_property_set_qobject(new, prop->name, value, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                qobject_unref(value);
+                return false;
+            }
+        }
+        qobject_unref(value);
+    }
+
+    return true;
+}
+
+
+static bool
+qcrypto_tls_creds_x509_reload(QCryptoTLSCreds *creds, Error **errp)
+{
+    Object *old = OBJECT(creds);
+    QCryptoTLSCredsX509 *old_x509 = QCRYPTO_TLS_CREDS_X509(creds);
+    Object *new = object_new(TYPE_QCRYPTO_TLS_CREDS_X509);
+    QCryptoTLSCredsX509 *new_x509 = QCRYPTO_TLS_CREDS_X509(new);
+    Error *local_err = NULL;
+    bool ret = false;
+
+    if (!qcrypto_tls_creds_x509_copy_propertites(new, old, &local_err)) {
+        error_propagate(errp, local_err);
+        goto out;
+    }
+
+    qcrypto_tls_creds_x509_load(new_x509, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto out;
+    }
+
+    /* load new cert successfully, release old data and update */
+    qcrypto_tls_creds_x509_unload(old_x509);
+    old_x509->data = new_x509->data;
+    old_x509->parent_obj.dh_params = new_x509->parent_obj.dh_params;
+    new_x509->data = NULL;
+    new_x509->parent_obj.dh_params = NULL;
+
+    ret = true;
+
+ out:
+    object_unref(new);
+    return ret;
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
@@ -800,6 +914,9 @@ static void
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


