Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA82B10FC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:05:41 +0100 (CET)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKiq-0004hy-Jp
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQx-00088p-2K
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQu-0003jI-AY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtP7hkoUO/2D4UzMSq43kPT6M2wSx5R64H5fw4LILMg=;
 b=OskzSXb/qa0HHJSk248eA0uAg7YLORs3OlTDF7h+o//9o3EtR43s6r0UtBPwj8zIwysdNL
 8Fa+zPIWNoduNV+PeJfueQY+dFAx/hd1taSgTkvHW02bb2NT4vgvDcm97yLS6ZY5jG7c7P
 91I5VtomzUel7mb5rQjgs2YMhT1qdzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-K3qrJUprNfmKISncVNeGWA-1; Thu, 12 Nov 2020 16:47:05 -0500
X-MC-Unique: K3qrJUprNfmKISncVNeGWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C986E1074657;
 Thu, 12 Nov 2020 21:47:04 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 179C810016DA;
 Thu, 12 Nov 2020 21:47:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/53] qdev: Move core field property code to QOM
Date: Thu, 12 Nov 2020 16:43:42 -0500
Message-Id: <20201112214350.872250-46-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the core of the static property code to qom/field-property.c.

The actual property type implementations are still in
qdev-properties.c, they will be moved later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Redone patch after changes in previous patches of this series
* Reordered patch, tried to place it a bit earlier in the series

Changes v1 -> v2:
* Rename static-property.* to field-property.*
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h                  |  49 +------
 .../qom/field-property-internal.h             |   6 +-
 include/qom/field-property.h                  |  57 ++++++++
 include/qom/qom.h                             |   1 +
 hw/core/qdev-properties-system.c              |   2 +-
 hw/core/qdev-properties.c                     | 134 +----------------
 qom/field-property.c                          | 137 ++++++++++++++++++
 qom/meson.build                               |   1 +
 8 files changed, 202 insertions(+), 185 deletions(-)
 rename hw/core/qdev-prop-internal.h => include/qom/field-property-internal.h (95%)
 create mode 100644 include/qom/field-property.h
 create mode 100644 qom/field-property.c

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 1208e12b9b..6585a8e693 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -2,52 +2,7 @@
 #define QEMU_QDEV_PROPERTIES_H
 
 #include "hw/qdev-core.h"
-
-/**
- * Property:
- * @set_default: true if the default value should be set from @defval,
- *    in which case @info->set_default_value must not be NULL
- *    (if false then no default value is set by the property system
- *     and the field retains whatever value it was given by instance_init).
- * @defval: default value for the property. This is used only if @set_default
- *     is true.
- */
-struct Property {
-    /**
-     * @name_template: Property name template
-     *
-     * This is a string containing the template to be used when
-     * creating the property.  It can be NULL, and code shouldn't
-     * assume it will contain the actual property name.
-     */
-    const char   *name_template;
-    const PropertyInfo *info;
-    ptrdiff_t    offset;
-    uint8_t      bitnr;
-    bool         set_default;
-    union {
-        int64_t i;
-        uint64_t u;
-    } defval;
-    int          arrayoffset;
-    const PropertyInfo *arrayinfo;
-    int          arrayfieldsize;
-    const char   *link_type;
-};
-
-struct PropertyInfo {
-    const char *name;
-    const char *description;
-    const QEnumLookup *enum_table;
-    int (*print)(Object *obj, Property *prop, char *dest, size_t len);
-    void (*set_default_value)(ObjectProperty *op, const Property *prop);
-    ObjectProperty *(*create)(ObjectClass *oc, const char *name,
-                              Property *prop);
-    ObjectPropertyAccessor *get;
-    ObjectPropertyAccessor *set;
-    ObjectPropertyRelease *release;
-};
-
+#include "qom/field-property.h"
 
 /*** qdev-properties.c ***/
 
@@ -200,8 +155,6 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *object_field_prop_ptr(Object *obj, Property *prop);
-
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(Object *obj,
                                             const char *name);
diff --git a/hw/core/qdev-prop-internal.h b/include/qom/field-property-internal.h
similarity index 95%
rename from hw/core/qdev-prop-internal.h
rename to include/qom/field-property-internal.h
index 47bab46810..a7b7e2b69d 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/include/qom/field-property-internal.h
@@ -1,12 +1,12 @@
 /*
- * qdev property parsing
+ * QOM field property internal API (for implementing custom types)
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef HW_CORE_QDEV_PROP_INTERNAL_H
-#define HW_CORE_QDEV_PROP_INTERNAL_H
+#ifndef QOM_STATIC_PROPERTY_INTERNAL_H
+#define QOM_STATIC_PROPERTY_INTERNAL_H
 
 void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp);
diff --git a/include/qom/field-property.h b/include/qom/field-property.h
new file mode 100644
index 0000000000..91e7a43165
--- /dev/null
+++ b/include/qom/field-property.h
@@ -0,0 +1,57 @@
+/*
+ * QOM field property API
+ */
+#ifndef QOM_FIELD_PROPERTY_H
+#define QOM_FIELD_PROPERTY_H
+
+#include "qom/object.h"
+#include "qapi/util.h"
+
+/**
+ * Property:
+ * @set_default: true if the default value should be set from @defval,
+ *    in which case @info->set_default_value must not be NULL
+ *    (if false then no default value is set by the property system
+ *     and the field retains whatever value it was given by instance_init).
+ * @defval: default value for the property. This is used only if @set_default
+ *     is true.
+ */
+struct Property {
+    /**
+     * @name_template: Property name template
+     *
+     * This is a string containing the template to be used when
+     * creating the property.  It can be NULL, and code shouldn't
+     * assume it will contain the actual property name.
+     */
+    const char   *name_template;
+    const PropertyInfo *info;
+    ptrdiff_t    offset;
+    uint8_t      bitnr;
+    bool         set_default;
+    union {
+        int64_t i;
+        uint64_t u;
+    } defval;
+    int          arrayoffset;
+    const PropertyInfo *arrayinfo;
+    int          arrayfieldsize;
+    const char   *link_type;
+};
+
+struct PropertyInfo {
+    const char *name;
+    const char *description;
+    const QEnumLookup *enum_table;
+    int (*print)(Object *obj, Property *prop, char *dest, size_t len);
+    void (*set_default_value)(ObjectProperty *op, const Property *prop);
+    ObjectProperty *(*create)(ObjectClass *oc, const char *name,
+                              Property *prop);
+    ObjectPropertyAccessor *get;
+    ObjectPropertyAccessor *set;
+    ObjectPropertyRelease *release;
+};
+
+void *object_field_prop_ptr(Object *obj, Property *prop);
+
+#endif
diff --git a/include/qom/qom.h b/include/qom/qom.h
index 3286605083..9dbc88801d 100644
--- a/include/qom/qom.h
+++ b/include/qom/qom.h
@@ -8,3 +8,4 @@
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
 #include "qom/qom-qobject.h"
+#include "qom/field-property.h"
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 8781b856d3..8da68f076c 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -24,7 +24,7 @@
 #include "qemu/units.h"
 #include "qemu/uuid.h"
 #include "qemu/error-report.h"
-#include "qdev-prop-internal.h"
+#include "qom/field-property-internal.h"
 
 #include "audio/audio.h"
 #include "chardev/char-fe.h"
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 7aa5d2ff45..c79cb9a89b 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -8,7 +8,7 @@
 #include "qapi/visitor.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
-#include "qdev-prop-internal.h"
+#include "qom/field-property-internal.h"
 
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -50,48 +50,6 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *object_field_prop_ptr(Object *obj, Property *prop)
-{
-    void *ptr = obj;
-    ptr += prop->offset;
-    return ptr;
-}
-
-static void field_prop_get(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    return prop->info->get(obj, v, name, opaque, errp);
-}
-
-/**
- * field_prop_getter: Return getter function to be used for property
- *
- * Return value can be NULL if @info has no getter function.
- */
-static ObjectPropertyAccessor *field_prop_getter(const PropertyInfo *info)
-{
-    return info->get ? field_prop_get : NULL;
-}
-
-static void field_prop_set(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-
-    return prop->info->set(obj, v, name, opaque, errp);
-}
-
-/**
- * field_prop_setter: Return setter function to be used for property
- *
- * Return value can be NULL if @info has not setter function.
- */
-static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *info)
-{
-    return info->set ? field_prop_set : NULL;
-}
-
 void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
@@ -802,96 +760,6 @@ const PropertyInfo prop_info_link = {
     .create = create_link_property,
 };
 
-/*
- * Property release callback for dynamically-created properties:
- * We call the underlying element's property release hook, and
- * then free the memory we allocated when we added the property.
- */
-static void static_prop_release_dynamic_prop(Object *obj, const char *name,
-                                             void *opaque)
-{
-    Property *prop = opaque;
-    if (prop->info->release) {
-        prop->info->release(obj, name, opaque);
-    }
-    g_free(prop);
-}
-
-ObjectProperty *
-object_property_add_field(Object *obj, const char *name,
-                          Property *prop,
-                          ObjectPropertyAllowSet allow_set)
-{
-    ObjectProperty *op;
-    Property *newprop = g_new0(Property, 1);
-
-    assert(allow_set);
-    assert(!prop->info->create);
-
-    *newprop = *prop;
-    op = object_property_add(obj, name, newprop->info->name,
-                             field_prop_getter(newprop->info),
-                             field_prop_setter(newprop->info),
-                             static_prop_release_dynamic_prop,
-                             newprop);
-
-    object_property_set_description(obj, name,
-                                    newprop->info->description);
-
-    if (newprop->set_default) {
-        newprop->info->set_default_value(op, newprop);
-        if (op->init) {
-            op->init(obj, op);
-        }
-    }
-
-    op->allow_set = allow_set;
-    return op;
-}
-
-ObjectProperty *
-object_class_property_add_field_static(ObjectClass *oc, const char *name,
-                                       Property *prop,
-                                       ObjectPropertyAllowSet allow_set)
-{
-    ObjectProperty *op;
-
-    assert(allow_set);
-
-    if (prop->info->create) {
-        op = prop->info->create(oc, name, prop);
-    } else {
-        op = object_class_property_add(oc,
-                                       name, prop->info->name,
-                                       field_prop_getter(prop->info),
-                                       field_prop_setter(prop->info),
-                                       prop->info->release,
-                                       prop);
-    }
-    if (prop->set_default) {
-        prop->info->set_default_value(op, prop);
-    }
-    if (prop->info->description) {
-        object_class_property_set_description(oc, name,
-                                              prop->info->description);
-    }
-
-    op->allow_set = allow_set;
-    return op;
-}
-
-void object_class_add_field_properties(ObjectClass *oc, Property *props,
-                                       ObjectPropertyAllowSet allow_set)
-{
-    Property *prop;
-
-    for (prop = props; prop && prop->name_template; prop++) {
-        object_class_property_add_field_static(oc, prop->name_template, prop,
-                                               allow_set);
-    }
-}
-
-
 void qdev_property_add_static(DeviceState *dev, Property *prop)
 {
     object_property_add_field(OBJECT(dev), prop->name_template, prop,
diff --git a/qom/field-property.c b/qom/field-property.c
new file mode 100644
index 0000000000..1fd11f2ad3
--- /dev/null
+++ b/qom/field-property.c
@@ -0,0 +1,137 @@
+/*
+ * QOM field property API implementation
+ */
+#include "qemu/osdep.h"
+#include "qom/field-property.h"
+#include "qom/field-property-internal.h"
+
+void *object_field_prop_ptr(Object *obj, Property *prop)
+{
+    void *ptr = obj;
+    ptr += prop->offset;
+    return ptr;
+}
+
+static void field_prop_get(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    return prop->info->get(obj, v, name, opaque, errp);
+}
+
+/**
+ * field_prop_getter: Return getter function to be used for property
+ *
+ * Return value can be NULL if @info has no getter function.
+ */
+static ObjectPropertyAccessor *field_prop_getter(const PropertyInfo *info)
+{
+    return info->get ? field_prop_get : NULL;
+}
+
+static void field_prop_set(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+
+    return prop->info->set(obj, v, name, opaque, errp);
+}
+
+/**
+ * field_prop_setter: Return setter function to be used for property
+ *
+ * Return value can be NULL if @info has not setter function.
+ */
+static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *info)
+{
+    return info->set ? field_prop_set : NULL;
+}
+
+/*
+ * Property release callback for dynamically-created properties:
+ * We call the underlying element's property release hook, and
+ * then free the memory we allocated when we added the property.
+ */
+static void static_prop_release_dynamic_prop(Object *obj, const char *name,
+                                             void *opaque)
+{
+    Property *prop = opaque;
+    if (prop->info->release) {
+        prop->info->release(obj, name, opaque);
+    }
+    g_free(prop);
+}
+
+ObjectProperty *
+object_property_add_field(Object *obj, const char *name,
+                          Property *prop,
+                          ObjectPropertyAllowSet allow_set)
+{
+    ObjectProperty *op;
+    Property *newprop = g_new0(Property, 1);
+
+    assert(allow_set);
+    assert(!prop->info->create);
+
+    *newprop = *prop;
+    op = object_property_add(obj, name, newprop->info->name,
+                             field_prop_getter(newprop->info),
+                             field_prop_setter(newprop->info),
+                             static_prop_release_dynamic_prop,
+                             newprop);
+
+    object_property_set_description(obj, name,
+                                    newprop->info->description);
+
+    if (newprop->set_default) {
+        newprop->info->set_default_value(op, newprop);
+        if (op->init) {
+            op->init(obj, op);
+        }
+    }
+
+    op->allow_set = allow_set;
+    return op;
+}
+
+ObjectProperty *
+object_class_property_add_field_static(ObjectClass *oc, const char *name,
+                                       Property *prop,
+                                       ObjectPropertyAllowSet allow_set)
+{
+    ObjectProperty *op;
+
+    assert(allow_set);
+
+    if (prop->info->create) {
+        op = prop->info->create(oc, name, prop);
+    } else {
+        op = object_class_property_add(oc,
+                                       name, prop->info->name,
+                                       field_prop_getter(prop->info),
+                                       field_prop_setter(prop->info),
+                                       prop->info->release,
+                                       prop);
+    }
+    if (prop->set_default) {
+        prop->info->set_default_value(op, prop);
+    }
+    if (prop->info->description) {
+        object_class_property_set_description(oc, name,
+                                              prop->info->description);
+    }
+
+    op->allow_set = allow_set;
+    return op;
+}
+
+void object_class_add_field_properties(ObjectClass *oc, Property *props,
+                                       ObjectPropertyAllowSet allow_set)
+{
+    Property *prop;
+
+    for (prop = props; prop && prop->name_template; prop++) {
+        object_class_property_add_field_static(oc, prop->name_template, prop,
+                                               allow_set);
+    }
+}
diff --git a/qom/meson.build b/qom/meson.build
index 062a3789d8..e83794454d 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -4,6 +4,7 @@ qom_ss.add(files(
   'object.c',
   'object_interfaces.c',
   'qom-qobject.c',
+  'field-property.c',
 ))
 
 qmp_ss.add(files('qom-qmp-cmds.c'))
-- 
2.28.0


