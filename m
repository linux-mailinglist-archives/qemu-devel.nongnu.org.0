Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21644146E30
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:19:40 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iufCk-0008Nf-Km
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iucu5-0000tY-OW
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iucu4-0000wp-JD
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iucu4-0000wT-GG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579787532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcS9avS7KL2nNo2Qs4sJPKqyNXTWAkkAQQ0V0ViLEnk=;
 b=W5bbElw6YNTetVF95LadHH7uD7eItkVckiZsPq2HZD4NCksA0iEBiOr/8yOsd1XedrFnUi
 ASHmJLlRUMCjNR4UgezoDldJtDWZLFAuNbXqCE8ElRI2HrmBuZLMmXxsfHy8vtZ4d225Ur
 7axMZ68mQ4dtfs56saF8d29kVO1JKtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-W1LmqmWEO2W7JVWi6-L9Lg-1; Thu, 23 Jan 2020 08:52:10 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C3F01080D51
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 13:52:10 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063B585780;
 Thu, 23 Jan 2020 13:52:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/59] object: add class property initializer
Date: Thu, 23 Jan 2020 14:50:26 +0100
Message-Id: <1579787449-27599-37-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
References: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: W1LmqmWEO2W7JVWi6-L9Lg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This callback is used to set default value in following patch "object:
add object_property_set_defaut_{bool,str,int,uint}()".

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200110153039.1379601-7-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h | 16 ++++++++++++++--
 qom/object.c         | 14 ++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 54a5488..29f47d3 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -309,6 +309,8 @@ typedef struct InterfaceInfo InterfaceInfo;
  */
=20
=20
+typedef struct ObjectProperty ObjectProperty;
+
 /**
  * ObjectPropertyAccessor:
  * @obj: the object that owns the property
@@ -356,7 +358,16 @@ typedef void (ObjectPropertyRelease)(Object *obj,
                                      const char *name,
                                      void *opaque);
=20
-typedef struct ObjectProperty
+/**
+ * ObjectPropertyInit:
+ * @obj: the object that owns the property
+ * @prop: the property to set
+ *
+ * Called when a property is initialized.
+ */
+typedef void (ObjectPropertyInit)(Object *obj, ObjectProperty *prop);
+
+struct ObjectProperty
 {
     gchar *name;
     gchar *type;
@@ -365,8 +376,9 @@ typedef struct ObjectProperty
     ObjectPropertyAccessor *set;
     ObjectPropertyResolve *resolve;
     ObjectPropertyRelease *release;
+    ObjectPropertyInit *init;
     void *opaque;
-} ObjectProperty;
+};
=20
 /**
  * ObjectUnparent:
diff --git a/qom/object.c b/qom/object.c
index e921363..cd7ce81 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -478,6 +478,19 @@ void object_apply_compat_props(Object *obj)
     }
 }
=20
+static void object_class_property_init_all(Object *obj)
+{
+    ObjectPropertyIterator iter;
+    ObjectProperty *prop;
+
+    object_class_property_iter_init(&iter, object_get_class(obj));
+    while ((prop =3D object_property_iter_next(&iter))) {
+        if (prop->init) {
+            prop->init(obj, prop);
+        }
+    }
+}
+
 static void object_initialize_with_type(void *data, size_t size, TypeImpl =
*type)
 {
     Object *obj =3D data;
@@ -491,6 +504,7 @@ static void object_initialize_with_type(void *data, siz=
e_t size, TypeImpl *type)
     memset(obj, 0, type->instance_size);
     obj->class =3D type->class;
     object_ref(obj);
+    object_class_property_init_all(obj);
     obj->properties =3D g_hash_table_new_full(g_str_hash, g_str_equal,
                                             NULL, object_property_free);
     object_init_with_type(obj, type);
--=20
1.8.3.1



