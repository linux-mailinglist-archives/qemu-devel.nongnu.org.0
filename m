Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838614C24E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 22:22:55 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdh6Y-000652-Lu
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 16:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35297)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hdgv7-0004JJ-6j
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hdgv4-000163-4X
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52238)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hdgv3-00012R-8o
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:10:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1EC07307D9D1
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-85.ams2.redhat.com
 [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9439D19C79;
 Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B03A111385C7; Wed, 19 Jun 2019 22:10:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 22:10:38 +0200
Message-Id: <20190619201050.19040-6-armbru@redhat.com>
In-Reply-To: <20190619201050.19040-1-armbru@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 05/17] qom: Move QMP command handlers to qom/
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The handlers for qapi/qom.json's QMP commands are in
monitor/qmp-cmds.c.  Move them to new qom/qom-qmp-cmds.c, where they
are covered by MAINTAINERS section QOM, just like qapi/qom.json.

Move along qmp_device_list_properties() even though it's specified in
qapi/qdev.json, because it's so similar to qmp_qom_list_properties().

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp-cmds.c | 303 ------------------------------------------
 qom/Makefile.objs  |   1 +
 qom/qom-qmp-cmds.c | 323 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 324 insertions(+), 303 deletions(-)
 create mode 100644 qom/qom-qmp-cmds.c

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index ae7f201dc0..884eeaab80 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -27,20 +27,14 @@
 #include "ui/vnc.h"
 #include "sysemu/kvm.h"
 #include "sysemu/arch_init.h"
-#include "hw/qdev.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
-#include "qom/qom-qobject.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-misc.h"
-#include "qapi/qapi-commands-qdev.h"
 #include "qapi/qapi-commands-ui.h"
-#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-#include "qapi/qobject-input-visitor.h"
 #include "hw/boards.h"
-#include "qom/object_interfaces.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
=20
@@ -197,69 +191,6 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
=20
-ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
-{
-    Object *obj;
-    bool ambiguous =3D false;
-    ObjectPropertyInfoList *props =3D NULL;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-
-    obj =3D object_resolve_path(path, &ambiguous);
-    if (obj =3D=3D NULL) {
-        if (ambiguous) {
-            error_setg(errp, "Path '%s' is ambiguous", path);
-        } else {
-            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                      "Device '%s' not found", path);
-        }
-        return NULL;
-    }
-
-    object_property_iter_init(&iter, obj);
-    while ((prop =3D object_property_iter_next(&iter))) {
-        ObjectPropertyInfoList *entry =3D g_malloc0(sizeof(*entry));
-
-        entry->value =3D g_malloc0(sizeof(ObjectPropertyInfo));
-        entry->next =3D props;
-        props =3D entry;
-
-        entry->value->name =3D g_strdup(prop->name);
-        entry->value->type =3D g_strdup(prop->type);
-    }
-
-    return props;
-}
-
-void qmp_qom_set(const char *path, const char *property, QObject *value,
-                 Error **errp)
-{
-    Object *obj;
-
-    obj =3D object_resolve_path(path, NULL);
-    if (!obj) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", path);
-        return;
-    }
-
-    object_property_set_qobject(obj, value, property, errp);
-}
-
-QObject *qmp_qom_get(const char *path, const char *property, Error **err=
p)
-{
-    Object *obj;
-
-    obj =3D object_resolve_path(path, NULL);
-    if (!obj) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", path);
-        return NULL;
-    }
-
-    return object_property_get_qobject(obj, property, errp);
-}
-
 void qmp_set_password(const char *protocol, const char *password,
                       bool has_connected, const char *connected, Error *=
*errp)
 {
@@ -408,208 +339,6 @@ void qmp_change(const char *device, const char *tar=
get,
     }
 }
=20
-static void qom_list_types_tramp(ObjectClass *klass, void *data)
-{
-    ObjectTypeInfoList *e, **pret =3D data;
-    ObjectTypeInfo *info;
-    ObjectClass *parent =3D object_class_get_parent(klass);
-
-    info =3D g_malloc0(sizeof(*info));
-    info->name =3D g_strdup(object_class_get_name(klass));
-    info->has_abstract =3D info->abstract =3D object_class_is_abstract(k=
lass);
-    if (parent) {
-        info->has_parent =3D true;
-        info->parent =3D g_strdup(object_class_get_name(parent));
-    }
-
-    e =3D g_malloc0(sizeof(*e));
-    e->value =3D info;
-    e->next =3D *pret;
-    *pret =3D e;
-}
-
-ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
-                                       const char *implements,
-                                       bool has_abstract,
-                                       bool abstract,
-                                       Error **errp)
-{
-    ObjectTypeInfoList *ret =3D NULL;
-
-    object_class_foreach(qom_list_types_tramp, implements, abstract, &re=
t);
-
-    return ret;
-}
-
-/* Return a DevicePropertyInfo for a qdev property.
- *
- * If a qdev property with the given name does not exist, use the given =
default
- * type.  If the qdev property info should not be shown, return NULL.
- *
- * The caller must free the return value.
- */
-static ObjectPropertyInfo *make_device_property_info(ObjectClass *klass,
-                                                  const char *name,
-                                                  const char *default_ty=
pe,
-                                                  const char *descriptio=
n)
-{
-    ObjectPropertyInfo *info;
-    Property *prop;
-
-    do {
-        for (prop =3D DEVICE_CLASS(klass)->props; prop && prop->name; pr=
op++) {
-            if (strcmp(name, prop->name) !=3D 0) {
-                continue;
-            }
-
-            /*
-             * TODO Properties without a parser are just for dirty hacks=
.
-             * qdev_prop_ptr is the only such PropertyInfo.  It's marked
-             * for removal.  This conditional should be removed along wi=
th
-             * it.
-             */
-            if (!prop->info->set && !prop->info->create) {
-                return NULL;           /* no way to set it, don't show *=
/
-            }
-
-            info =3D g_malloc0(sizeof(*info));
-            info->name =3D g_strdup(prop->name);
-            info->type =3D default_type ? g_strdup(default_type)
-                                      : g_strdup(prop->info->name);
-            info->has_description =3D !!prop->info->description;
-            info->description =3D g_strdup(prop->info->description);
-            return info;
-        }
-        klass =3D object_class_get_parent(klass);
-    } while (klass !=3D object_class_by_name(TYPE_DEVICE));
-
-    /* Not a qdev property, use the default type */
-    info =3D g_malloc0(sizeof(*info));
-    info->name =3D g_strdup(name);
-    info->type =3D g_strdup(default_type);
-    info->has_description =3D !!description;
-    info->description =3D g_strdup(description);
-
-    return info;
-}
-
-ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
-                                                Error **errp)
-{
-    ObjectClass *klass;
-    Object *obj;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-    ObjectPropertyInfoList *prop_list =3D NULL;
-
-    klass =3D object_class_by_name(typename);
-    if (klass =3D=3D NULL) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Device '%s' not found", typename);
-        return NULL;
-    }
-
-    klass =3D object_class_dynamic_cast(klass, TYPE_DEVICE);
-    if (klass =3D=3D NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_=
DEVICE);
-        return NULL;
-    }
-
-    if (object_class_is_abstract(klass)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename",
-                   "non-abstract device type");
-        return NULL;
-    }
-
-    obj =3D object_new(typename);
-
-    object_property_iter_init(&iter, obj);
-    while ((prop =3D object_property_iter_next(&iter))) {
-        ObjectPropertyInfo *info;
-        ObjectPropertyInfoList *entry;
-
-        /* Skip Object and DeviceState properties */
-        if (strcmp(prop->name, "type") =3D=3D 0 ||
-            strcmp(prop->name, "realized") =3D=3D 0 ||
-            strcmp(prop->name, "hotpluggable") =3D=3D 0 ||
-            strcmp(prop->name, "hotplugged") =3D=3D 0 ||
-            strcmp(prop->name, "parent_bus") =3D=3D 0) {
-            continue;
-        }
-
-        /* Skip legacy properties since they are just string versions of
-         * properties that we already list.
-         */
-        if (strstart(prop->name, "legacy-", NULL)) {
-            continue;
-        }
-
-        info =3D make_device_property_info(klass, prop->name, prop->type=
,
-                                         prop->description);
-        if (!info) {
-            continue;
-        }
-
-        entry =3D g_malloc0(sizeof(*entry));
-        entry->value =3D info;
-        entry->next =3D prop_list;
-        prop_list =3D entry;
-    }
-
-    object_unref(obj);
-
-    return prop_list;
-}
-
-ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
-                                             Error **errp)
-{
-    ObjectClass *klass;
-    Object *obj =3D NULL;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-    ObjectPropertyInfoList *prop_list =3D NULL;
-
-    klass =3D object_class_by_name(typename);
-    if (klass =3D=3D NULL) {
-        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
-                  "Class '%s' not found", typename);
-        return NULL;
-    }
-
-    klass =3D object_class_dynamic_cast(klass, TYPE_OBJECT);
-    if (klass =3D=3D NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_=
OBJECT);
-        return NULL;
-    }
-
-    if (object_class_is_abstract(klass)) {
-        object_class_property_iter_init(&iter, klass);
-    } else {
-        obj =3D object_new(typename);
-        object_property_iter_init(&iter, obj);
-    }
-    while ((prop =3D object_property_iter_next(&iter))) {
-        ObjectPropertyInfo *info;
-        ObjectPropertyInfoList *entry;
-
-        info =3D g_malloc0(sizeof(*info));
-        info->name =3D g_strdup(prop->name);
-        info->type =3D g_strdup(prop->type);
-        info->has_description =3D !!prop->description;
-        info->description =3D g_strdup(prop->description);
-
-        entry =3D g_malloc0(sizeof(*entry));
-        entry->value =3D info;
-        entry->next =3D prop_list;
-        prop_list =3D entry;
-    }
-
-    object_unref(obj);
-
-    return prop_list;
-}
-
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool=
 tls,
                     Error **errp)
@@ -654,38 +383,6 @@ void qmp_add_client(const char *protocol, const char=
 *fdname,
 }
=20
=20
-void qmp_object_add(const char *type, const char *id,
-                    bool has_props, QObject *props, Error **errp)
-{
-    QDict *pdict;
-    Visitor *v;
-    Object *obj;
-
-    if (props) {
-        pdict =3D qobject_to(QDict, props);
-        if (!pdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict=
");
-            return;
-        }
-        qobject_ref(pdict);
-    } else {
-        pdict =3D qdict_new();
-    }
-
-    v =3D qobject_input_visitor_new(QOBJECT(pdict));
-    obj =3D user_creatable_add_type(type, id, pdict, v, errp);
-    visit_free(v);
-    if (obj) {
-        object_unref(obj);
-    }
-    qobject_unref(pdict);
-}
-
-void qmp_object_del(const char *id, Error **errp)
-{
-    user_creatable_del(id, errp);
-}
-
 MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
 {
     return qmp_memory_device_list();
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
index 516349eec3..5fb43b842c 100644
--- a/qom/Makefile.objs
+++ b/qom/Makefile.objs
@@ -2,3 +2,4 @@ qom-obj-y =3D object.o container.o qom-qobject.o
 qom-obj-y +=3D object_interfaces.o
=20
 common-obj-y =3D cpu.o
+common-obj-$(CONFIG_SOFTMMU) +=3D qom-qmp-cmds.o
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
new file mode 100644
index 0000000000..e046a0f190
--- /dev/null
+++ b/qom/qom-qmp-cmds.c
@@ -0,0 +1,323 @@
+/*
+ * QMP commands related to QOM
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-qdev.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qemu/cutils.h"
+#include "qom/object_interfaces.h"
+#include "qom/qom-qobject.h"
+
+ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
+{
+    Object *obj;
+    bool ambiguous =3D false;
+    ObjectPropertyInfoList *props =3D NULL;
+    ObjectProperty *prop;
+    ObjectPropertyIterator iter;
+
+    obj =3D object_resolve_path(path, &ambiguous);
+    if (obj =3D=3D NULL) {
+        if (ambiguous) {
+            error_setg(errp, "Path '%s' is ambiguous", path);
+        } else {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                      "Device '%s' not found", path);
+        }
+        return NULL;
+    }
+
+    object_property_iter_init(&iter, obj);
+    while ((prop =3D object_property_iter_next(&iter))) {
+        ObjectPropertyInfoList *entry =3D g_malloc0(sizeof(*entry));
+
+        entry->value =3D g_malloc0(sizeof(ObjectPropertyInfo));
+        entry->next =3D props;
+        props =3D entry;
+
+        entry->value->name =3D g_strdup(prop->name);
+        entry->value->type =3D g_strdup(prop->type);
+    }
+
+    return props;
+}
+
+void qmp_qom_set(const char *path, const char *property, QObject *value,
+                 Error **errp)
+{
+    Object *obj;
+
+    obj =3D object_resolve_path(path, NULL);
+    if (!obj) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Device '%s' not found", path);
+        return;
+    }
+
+    object_property_set_qobject(obj, value, property, errp);
+}
+
+QObject *qmp_qom_get(const char *path, const char *property, Error **err=
p)
+{
+    Object *obj;
+
+    obj =3D object_resolve_path(path, NULL);
+    if (!obj) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Device '%s' not found", path);
+        return NULL;
+    }
+
+    return object_property_get_qobject(obj, property, errp);
+}
+
+static void qom_list_types_tramp(ObjectClass *klass, void *data)
+{
+    ObjectTypeInfoList *e, **pret =3D data;
+    ObjectTypeInfo *info;
+    ObjectClass *parent =3D object_class_get_parent(klass);
+
+    info =3D g_malloc0(sizeof(*info));
+    info->name =3D g_strdup(object_class_get_name(klass));
+    info->has_abstract =3D info->abstract =3D object_class_is_abstract(k=
lass);
+    if (parent) {
+        info->has_parent =3D true;
+        info->parent =3D g_strdup(object_class_get_name(parent));
+    }
+
+    e =3D g_malloc0(sizeof(*e));
+    e->value =3D info;
+    e->next =3D *pret;
+    *pret =3D e;
+}
+
+ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
+                                       const char *implements,
+                                       bool has_abstract,
+                                       bool abstract,
+                                       Error **errp)
+{
+    ObjectTypeInfoList *ret =3D NULL;
+
+    object_class_foreach(qom_list_types_tramp, implements, abstract, &re=
t);
+
+    return ret;
+}
+
+/* Return a DevicePropertyInfo for a qdev property.
+ *
+ * If a qdev property with the given name does not exist, use the given =
default
+ * type.  If the qdev property info should not be shown, return NULL.
+ *
+ * The caller must free the return value.
+ */
+static ObjectPropertyInfo *make_device_property_info(ObjectClass *klass,
+                                                  const char *name,
+                                                  const char *default_ty=
pe,
+                                                  const char *descriptio=
n)
+{
+    ObjectPropertyInfo *info;
+    Property *prop;
+
+    do {
+        for (prop =3D DEVICE_CLASS(klass)->props; prop && prop->name; pr=
op++) {
+            if (strcmp(name, prop->name) !=3D 0) {
+                continue;
+            }
+
+            /*
+             * TODO Properties without a parser are just for dirty hacks=
.
+             * qdev_prop_ptr is the only such PropertyInfo.  It's marked
+             * for removal.  This conditional should be removed along wi=
th
+             * it.
+             */
+            if (!prop->info->set && !prop->info->create) {
+                return NULL;           /* no way to set it, don't show *=
/
+            }
+
+            info =3D g_malloc0(sizeof(*info));
+            info->name =3D g_strdup(prop->name);
+            info->type =3D default_type ? g_strdup(default_type)
+                                      : g_strdup(prop->info->name);
+            info->has_description =3D !!prop->info->description;
+            info->description =3D g_strdup(prop->info->description);
+            return info;
+        }
+        klass =3D object_class_get_parent(klass);
+    } while (klass !=3D object_class_by_name(TYPE_DEVICE));
+
+    /* Not a qdev property, use the default type */
+    info =3D g_malloc0(sizeof(*info));
+    info->name =3D g_strdup(name);
+    info->type =3D g_strdup(default_type);
+    info->has_description =3D !!description;
+    info->description =3D g_strdup(description);
+
+    return info;
+}
+
+ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
+                                                Error **errp)
+{
+    ObjectClass *klass;
+    Object *obj;
+    ObjectProperty *prop;
+    ObjectPropertyIterator iter;
+    ObjectPropertyInfoList *prop_list =3D NULL;
+
+    klass =3D object_class_by_name(typename);
+    if (klass =3D=3D NULL) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Device '%s' not found", typename);
+        return NULL;
+    }
+
+    klass =3D object_class_dynamic_cast(klass, TYPE_DEVICE);
+    if (klass =3D=3D NULL) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_=
DEVICE);
+        return NULL;
+    }
+
+    if (object_class_is_abstract(klass)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename",
+                   "non-abstract device type");
+        return NULL;
+    }
+
+    obj =3D object_new(typename);
+
+    object_property_iter_init(&iter, obj);
+    while ((prop =3D object_property_iter_next(&iter))) {
+        ObjectPropertyInfo *info;
+        ObjectPropertyInfoList *entry;
+
+        /* Skip Object and DeviceState properties */
+        if (strcmp(prop->name, "type") =3D=3D 0 ||
+            strcmp(prop->name, "realized") =3D=3D 0 ||
+            strcmp(prop->name, "hotpluggable") =3D=3D 0 ||
+            strcmp(prop->name, "hotplugged") =3D=3D 0 ||
+            strcmp(prop->name, "parent_bus") =3D=3D 0) {
+            continue;
+        }
+
+        /* Skip legacy properties since they are just string versions of
+         * properties that we already list.
+         */
+        if (strstart(prop->name, "legacy-", NULL)) {
+            continue;
+        }
+
+        info =3D make_device_property_info(klass, prop->name, prop->type=
,
+                                         prop->description);
+        if (!info) {
+            continue;
+        }
+
+        entry =3D g_malloc0(sizeof(*entry));
+        entry->value =3D info;
+        entry->next =3D prop_list;
+        prop_list =3D entry;
+    }
+
+    object_unref(obj);
+
+    return prop_list;
+}
+
+ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
+                                             Error **errp)
+{
+    ObjectClass *klass;
+    Object *obj =3D NULL;
+    ObjectProperty *prop;
+    ObjectPropertyIterator iter;
+    ObjectPropertyInfoList *prop_list =3D NULL;
+
+    klass =3D object_class_by_name(typename);
+    if (klass =3D=3D NULL) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Class '%s' not found", typename);
+        return NULL;
+    }
+
+    klass =3D object_class_dynamic_cast(klass, TYPE_OBJECT);
+    if (klass =3D=3D NULL) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_=
OBJECT);
+        return NULL;
+    }
+
+    if (object_class_is_abstract(klass)) {
+        object_class_property_iter_init(&iter, klass);
+    } else {
+        obj =3D object_new(typename);
+        object_property_iter_init(&iter, obj);
+    }
+    while ((prop =3D object_property_iter_next(&iter))) {
+        ObjectPropertyInfo *info;
+        ObjectPropertyInfoList *entry;
+
+        info =3D g_malloc0(sizeof(*info));
+        info->name =3D g_strdup(prop->name);
+        info->type =3D g_strdup(prop->type);
+        info->has_description =3D !!prop->description;
+        info->description =3D g_strdup(prop->description);
+
+        entry =3D g_malloc0(sizeof(*entry));
+        entry->value =3D info;
+        entry->next =3D prop_list;
+        prop_list =3D entry;
+    }
+
+    object_unref(obj);
+
+    return prop_list;
+}
+
+void qmp_object_add(const char *type, const char *id,
+                    bool has_props, QObject *props, Error **errp)
+{
+    QDict *pdict;
+    Visitor *v;
+    Object *obj;
+
+    if (props) {
+        pdict =3D qobject_to(QDict, props);
+        if (!pdict) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict=
");
+            return;
+        }
+        qobject_ref(pdict);
+    } else {
+        pdict =3D qdict_new();
+    }
+
+    v =3D qobject_input_visitor_new(QOBJECT(pdict));
+    obj =3D user_creatable_add_type(type, id, pdict, v, errp);
+    visit_free(v);
+    if (obj) {
+        object_unref(obj);
+    }
+    qobject_unref(pdict);
+}
+
+void qmp_object_del(const char *id, Error **errp)
+{
+    user_creatable_del(id, errp);
+}
--=20
2.21.0


