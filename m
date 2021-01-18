Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51A2FA6EF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:03:12 +0100 (CET)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Xvr-0004bo-Ks
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRV-0002Vq-P6
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRP-0001Wn-ST
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Shhn7vKc2ipuhBBRT1BgItsROvR5A+86lilzex1Fcb4=;
 b=avFhEO1I2nPc5Er3Tyy7+b0vwvLKuqXYGq2YoqvDgCIB1eRM/iiHYy8ZHG9HChNuLVIv+D
 QRK3tm4EQuhPy1txJoyE2QwWDFpl2q8VF/BG9wN7dbGPSlMmVG+UXTttxEUUR5v0IhTm4N
 aMQJqOXgkdMeiSJJGCmlkXuhJxeP4Zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-MZTKVSovM1KL-nQCM1j3ZQ-1; Mon, 18 Jan 2021 11:31:40 -0500
X-MC-Unique: MZTKVSovM1KL-nQCM1j3ZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A95E1005504
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A64DE19C66;
 Mon, 18 Jan 2021 16:31:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/25] qom: export more functions for use with
 non-UserCreatable objects
Date: Mon, 18 Jan 2021 11:31:10 -0500
Message-Id: <20210118163113.780171-23-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines and accelerators are not user-creatable but they share
similar parsing machinery.  Export functions that will be used
with -machine and -accel in softmmu/vl.c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h    | 21 +++++++++++++++++
 qom/object_interfaces.c | 51 +++++++++++++++++++++++++++++------------
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index d378f13a11..cd27facd8a 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -860,6 +860,27 @@ static void do_qemu_init_ ## type_array(void)                               \
 }                                                                           \
 type_init(do_qemu_init_ ## type_array)
 
+/**
+ * type_print_class_properties:
+ * @type: a QOM class name
+ *
+ * Print the object's class properties to stdout or the monitor.
+ * Return whether an object was found.
+ */
+bool type_print_class_properties(const char *type);
+
+/**
+ * object_set_properties_from_keyval:
+ * @obj: a QOM object
+ * @qdict: a dictionary whose leaf values are strings
+ * @errp: pointer to error object
+ *
+ * For each key in the dictionary, parse the value string and set the
+ * corresponding property in @obj.
+ */
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+				       Error **errp);
+
 /**
  * object_class_dynamic_cast_assert:
  * @klass: The #ObjectClass to attempt to cast.
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 654f717431..80efea2ca9 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -38,13 +38,45 @@ bool user_creatable_can_be_deleted(UserCreatable *uc)
     }
 }
 
+static void object_set_properties_from_qdict(Object *obj, const QDict *qdict,
+                                             Visitor *v, Error **errp)
+{
+    const QDictEntry *e;
+    Error *local_err = NULL;
+
+    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
+        goto out;
+    }
+    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
+        if (!object_property_set(obj, e->key, v, &local_err)) {
+            break;
+        }
+    }
+    if (!local_err) {
+        visit_check_struct(v, &local_err);
+    }
+    visit_end_struct(v, NULL);
+
+out:
+    if (local_err) {
+        error_propagate(errp, local_err);
+    }
+}
+
+void object_set_properties_from_keyval(Object *obj, const QDict *qdict,
+                                       Error **errp)
+{
+    Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    object_set_properties_from_qdict(obj, qdict, v, errp);
+    visit_free(v);
+}
+
 Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp)
 {
     Object *obj;
     ObjectClass *klass;
-    const QDictEntry *e;
     Error *local_err = NULL;
 
     klass = object_class_by_name(type);
@@ -66,18 +98,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
 
     assert(qdict);
     obj = object_new(type);
-    if (!visit_start_struct(v, NULL, NULL, 0, &local_err)) {
-        goto out;
-    }
-    for (e = qdict_first(qdict); e; e = qdict_next(qdict, e)) {
-        if (!object_property_set(obj, e->key, v, &local_err)) {
-            break;
-        }
-    }
-    if (!local_err) {
-        visit_check_struct(v, &local_err);
-    }
-    visit_end_struct(v, NULL);
+    object_set_properties_from_qdict(obj, qdict, v, &local_err);
     if (local_err) {
         goto out;
     }
@@ -177,7 +198,7 @@ void user_creatable_print_types(void)
     g_slist_free(list);
 }
 
-static bool user_creatable_print_type_properites(const char *type)
+bool type_print_class_properties(const char *type)
 {
     ObjectClass *klass;
     ObjectPropertyIterator iter;
@@ -219,7 +240,7 @@ void user_creatable_print_help_from_qdict(const QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
 
-    if (!type || !user_creatable_print_type_properites(type)) {
+    if (!type || !type_print_class_properties(type)) {
         user_creatable_print_types();
     }
 }
-- 
2.26.2



