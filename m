Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB32C82B4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:59:28 +0100 (CET)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgtz-0007e5-Bj
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgro-0006eM-FU
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrm-00063m-06
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606733829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Z8YIHOTrHAJZIp7WFpZLFjT3VYESTLOytA7J/XdD1M=;
 b=BoA+KJs6zD4cZLXi8i7WI3H1DOj/ru4IKC8LvlcxFY4Ab9tInK3MSuH79XD8XphOcmlQ9S
 WBHmYZqrpL3hvcdXLTBLvmmeV4cM/UW2/5u3IihAFqoFVsVhFCfJSIr9y0Yxs8eyJyJdof
 iJsM8JktSS/e7PBwBGUEpSRjBqDLOdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-Johi0LqpMdqm5h9ZbCvuLg-1; Mon, 30 Nov 2020 05:57:07 -0500
X-MC-Unique: Johi0LqpMdqm5h9ZbCvuLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E515380B736;
 Mon, 30 Nov 2020 10:57:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A014F18A9D;
 Mon, 30 Nov 2020 10:57:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] crypto: Move USER_CREATABLE to secret_common base class
Date: Mon, 30 Nov 2020 11:56:12 +0100
Message-Id: <20201130105615.21799-2-kwolf@redhat.com>
In-Reply-To: <20201130105615.21799-1-kwolf@redhat.com>
References: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, jasowang@redhat.com, fnu.vikram@xilinx.com,
 berrange@redhat.com, pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of duplicating the code for user creatable objects in secret and
secret_keyring, move it to the common base clase secret_common. As the
base class is abstract, it won't become user creatable itself.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 crypto/secret.c         | 14 --------------
 crypto/secret_common.c  | 15 +++++++++++++++
 crypto/secret_keyring.c | 14 --------------
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/crypto/secret.c b/crypto/secret.c
index 281cb81f0f..44eaff16f6 100644
--- a/crypto/secret.c
+++ b/crypto/secret.c
@@ -107,13 +107,6 @@ qcrypto_secret_prop_get_file(Object *obj,
 }
 
 
-static void
-qcrypto_secret_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_secret_finalize(Object *obj)
 {
@@ -129,9 +122,6 @@ qcrypto_secret_class_init(ObjectClass *oc, void *data)
     QCryptoSecretCommonClass *sic = QCRYPTO_SECRET_COMMON_CLASS(oc);
     sic->load_data = qcrypto_secret_load_data;
 
-    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
-    ucc->complete = qcrypto_secret_complete;
-
     object_class_property_add_str(oc, "data",
                                   qcrypto_secret_prop_get_data,
                                   qcrypto_secret_prop_set_data);
@@ -148,10 +138,6 @@ static const TypeInfo qcrypto_secret_info = {
     .instance_finalize = qcrypto_secret_finalize,
     .class_size = sizeof(QCryptoSecretClass),
     .class_init = qcrypto_secret_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_USER_CREATABLE },
-        { }
-    }
 };
 
 
diff --git a/crypto/secret_common.c b/crypto/secret_common.c
index b03d530867..35b82cb531 100644
--- a/crypto/secret_common.c
+++ b/crypto/secret_common.c
@@ -268,6 +268,13 @@ qcrypto_secret_prop_get_keyid(Object *obj,
 }
 
 
+static void
+qcrypto_secret_complete(UserCreatable *uc, Error **errp)
+{
+    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
+}
+
+
 static void
 qcrypto_secret_finalize(Object *obj)
 {
@@ -281,6 +288,10 @@ qcrypto_secret_finalize(Object *obj)
 static void
 qcrypto_secret_class_init(ObjectClass *oc, void *data)
 {
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = qcrypto_secret_complete;
+
     object_class_property_add_bool(oc, "loaded",
                                    qcrypto_secret_prop_get_loaded,
                                    qcrypto_secret_prop_set_loaded);
@@ -390,6 +401,10 @@ static const TypeInfo qcrypto_secret_info = {
     .class_size = sizeof(QCryptoSecretCommonClass),
     .class_init = qcrypto_secret_class_init,
     .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
 };
 
 
diff --git a/crypto/secret_keyring.c b/crypto/secret_keyring.c
index 10d8bc48a0..1b7edec84a 100644
--- a/crypto/secret_keyring.c
+++ b/crypto/secret_keyring.c
@@ -102,22 +102,12 @@ qcrypto_secret_prop_get_key(Object *obj, Visitor *v,
 }
 
 
-static void
-qcrypto_secret_keyring_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "loaded", true, errp);
-}
-
-
 static void
 qcrypto_secret_keyring_class_init(ObjectClass *oc, void *data)
 {
     QCryptoSecretCommonClass *sic = QCRYPTO_SECRET_COMMON_CLASS(oc);
     sic->load_data = qcrypto_secret_keyring_load_data;
 
-    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
-    ucc->complete = qcrypto_secret_keyring_complete;
-
     object_class_property_add(oc, "serial", "int32_t",
                                   qcrypto_secret_prop_get_key,
                                   qcrypto_secret_prop_set_key,
@@ -130,10 +120,6 @@ static const TypeInfo qcrypto_secret_info = {
     .name = TYPE_QCRYPTO_SECRET_KEYRING,
     .instance_size = sizeof(QCryptoSecretKeyring),
     .class_init = qcrypto_secret_keyring_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_USER_CREATABLE },
-        { }
-    }
 };
 
 
-- 
2.28.0


