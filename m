Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3177137197
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:44:46 +0100 (CET)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipwSr-0006WL-O8
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwK0-0002zw-Hh
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwJz-0000GW-6S
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:35:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39673
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ipwJz-0000EX-16
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuNTQk2rQbJOajuif2FQL7DXi7eEHwESHuaGhfUP9Oc=;
 b=J/SvfP3lHkAT3DIrfdSSTwozQYD+hArAk536ZWjzHVpBU/5dl3VbxuMnrdVgo4wRfLQ96i
 Tv/e1GOhLAgu1SfXdixhySmPkAu3HvYyPqSsORNnibZfra0XO8fXZg11+8tlhYlOykPYB8
 GUQKZCKFXKHl1sOkv4siWtq/3yrDcI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-ohstqFS4NbC6ZLaDpXgN2Q-1; Fri, 10 Jan 2020 10:35:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68171800D78
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 15:35:31 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C91195DA66;
 Fri, 10 Jan 2020 15:35:25 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] qom: introduce object_property_help()
Date: Fri, 10 Jan 2020 19:30:37 +0400
Message-Id: <20200110153039.1379601-25-marcandre.lureau@redhat.com>
In-Reply-To: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ohstqFS4NbC6ZLaDpXgN2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out the code to format a help string for a property. We
are going to reuse it in qdev next, which will bring some consistency.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qom/object.h    | 13 +++++++++++++
 qom/object_interfaces.c | 39 +++++++++++++++++++++++----------------
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 933e5c6cb9..a28e37a648 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1854,6 +1854,19 @@ Object *container_get(Object *root, const char *path=
);
  */
 size_t object_type_get_instance_size(const char *typename);
=20
+/**
+ * object_property_help:
+ * @name: the name of the property
+ * @type: the type of the property
+ * @defval: the default value
+ * @description: description of the property
+ *
+ * Returns: a user-friendly formatted string describing the property
+ * for help purposes.
+ */
+char *object_property_help(const char *name, const char *type,
+                           const char *defval, const char *description);
+
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
=20
 #endif
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index edb4cc4a3d..b7157d6ab0 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -158,6 +158,25 @@ int user_creatable_add_opts_foreach(void *opaque, Qemu=
Opts *opts, Error **errp)
     return 0;
 }
=20
+char *object_property_help(const char *name, const char *type,
+                           const char *defval, const char *description)
+{
+    GString *str =3D g_string_new(NULL);
+
+    g_string_append_printf(str, "  %s=3D<%s>", name, type);
+    if (defval) {
+        g_string_append_printf(str, " (default: %s)", defval);
+    }
+    if (description) {
+        if (str->len < 24) {
+            g_string_append_printf(str, "%*s", 24 - (int)str->len, "");
+        }
+        g_string_append_printf(str, " - %s", description);
+    }
+
+    return g_string_free(str, false);
+}
+
 bool user_creatable_print_help(const char *type, QemuOpts *opts)
 {
     ObjectClass *klass;
@@ -184,27 +203,15 @@ bool user_creatable_print_help(const char *type, Qemu=
Opts *opts)
=20
         object_class_property_iter_init(&iter, klass);
         while ((prop =3D object_property_iter_next(&iter))) {
-            GString *str;
-            char *defval;
+            g_autofree char *defval =3D object_property_get_default(prop);
=20
             if (!prop->set) {
                 continue;
             }
=20
-            str =3D g_string_new(NULL);
-            g_string_append_printf(str, "  %s=3D<%s>", prop->name, prop->t=
ype);
-            defval =3D object_property_get_default(prop);
-            if (defval) {
-                g_string_append_printf(str, " (default: %s)", defval);
-                g_free(defval);
-            }
-            if (prop->description) {
-                if (str->len < 24) {
-                    g_string_append_printf(str, "%*s", 24 - (int)str->len,=
 "");
-                }
-                g_string_append_printf(str, " - %s", prop->description);
-            }
-            g_ptr_array_add(array, g_string_free(str, false));
+            g_ptr_array_add(array,
+                            object_property_help(prop->name, prop->type,
+                                                 defval, prop->description=
));
         }
         g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
         if (array->len > 0) {
--=20
2.25.0.rc1.20.g2443f3f80d.dirty


