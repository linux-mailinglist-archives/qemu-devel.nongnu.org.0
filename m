Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3329F75C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 23:06:02 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYG3V-0004rS-La
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 18:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG0g-0002us-IM
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kYG0d-0006Xf-OI
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 18:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604008982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgONCAVKKy9Cj4TpncDvo/cdkkaIBMRVsuiSBqiz1qs=;
 b=J72onVZiiELV+oSJKmAlGN8cbqTU/vHQvpXGuAVLJ9UhX1IRqG+p0I+ghZLwmZahfFY22n
 pX/gw4CkiVym1MFOoUQ00W84G1hJ93XYuJ8j6Bp7YNYY/WkfnX6w4758KD85+stS5nM/zq
 vLhMO8u+VbNC28kWMu9KQvgsf+HGO/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-a7xaehvePyK8QydeH6sJrg-1; Thu, 29 Oct 2020 18:03:00 -0400
X-MC-Unique: a7xaehvePyK8QydeH6sJrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E0E1018F79
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 22:02:59 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7226D5D9D3;
 Thu, 29 Oct 2020 22:02:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/36] qdev: Move property code to qdev-properties.[ch]
Date: Thu, 29 Oct 2020 18:02:13 -0400
Message-Id: <20201029220246.472693-4-ehabkost@redhat.com>
In-Reply-To: <20201029220246.472693-1-ehabkost@redhat.com>
References: <20201029220246.472693-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move everything related to Property and PropertyInfo to
qdev-properties.[ch] to make it easier to refactor that code.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-core.h       |  37 -----------
 include/hw/qdev-properties.h |  38 +++++++++++
 hw/core/qdev-properties.c    | 120 +++++++++++++++++++++++++++++++++++
 hw/core/qdev.c               | 120 -----------------------------------
 softmmu/qdev-monitor.c       |   1 +
 5 files changed, 159 insertions(+), 157 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index a653295d6f..aea49355fa 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -274,43 +274,6 @@ struct BusState {
     ResettableState reset;
 };
 
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
-    const char   *name;
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
-    int (*print)(DeviceState *dev, Property *prop, char *dest, size_t len);
-    void (*set_default_value)(ObjectProperty *op, const Property *prop);
-    void (*create)(ObjectClass *oc, Property *prop);
-    ObjectPropertyAccessor *get;
-    ObjectPropertyAccessor *set;
-    ObjectPropertyRelease *release;
-};
-
 /**
  * GlobalProperty:
  * @used: Set to true if property was used when initializing a device.
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 4437450065..db7ce51dd5 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -3,6 +3,44 @@
 
 #include "hw/qdev-core.h"
 
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
+    const char   *name;
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
+    int (*print)(DeviceState *dev, Property *prop, char *dest, size_t len);
+    void (*set_default_value)(ObjectProperty *op, const Property *prop);
+    void (*create)(ObjectClass *oc, Property *prop);
+    ObjectPropertyAccessor *get;
+    ObjectPropertyAccessor *set;
+    ObjectPropertyRelease *release;
+};
+
+
 /*** qdev-properties.c ***/
 
 extern const PropertyInfo qdev_prop_bit;
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 509cbf155d..12a053e732 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -929,3 +929,123 @@ const PropertyInfo qdev_prop_link = {
     .name = "link",
     .create = create_link_property,
 };
+
+void qdev_property_add_static(DeviceState *dev, Property *prop)
+{
+    Object *obj = OBJECT(dev);
+    ObjectProperty *op;
+
+    assert(!prop->info->create);
+
+    op = object_property_add(obj, prop->name, prop->info->name,
+                             prop->info->get, prop->info->set,
+                             prop->info->release,
+                             prop);
+
+    object_property_set_description(obj, prop->name,
+                                    prop->info->description);
+
+    if (prop->set_default) {
+        prop->info->set_default_value(op, prop);
+        if (op->init) {
+            op->init(obj, op);
+        }
+    }
+}
+
+static void qdev_class_add_property(DeviceClass *klass, Property *prop)
+{
+    ObjectClass *oc = OBJECT_CLASS(klass);
+
+    if (prop->info->create) {
+        prop->info->create(oc, prop);
+    } else {
+        ObjectProperty *op;
+
+        op = object_class_property_add(oc,
+                                       prop->name, prop->info->name,
+                                       prop->info->get, prop->info->set,
+                                       prop->info->release,
+                                       prop);
+        if (prop->set_default) {
+            prop->info->set_default_value(op, prop);
+        }
+    }
+    object_class_property_set_description(oc, prop->name,
+                                          prop->info->description);
+}
+
+/**
+ * Legacy property handling
+ */
+
+static void qdev_get_legacy_property(Object *obj, Visitor *v,
+                                     const char *name, void *opaque,
+                                     Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    Property *prop = opaque;
+
+    char buffer[1024];
+    char *ptr = buffer;
+
+    prop->info->print(dev, prop, buffer, sizeof(buffer));
+    visit_type_str(v, name, &ptr, errp);
+}
+
+/**
+ * qdev_class_add_legacy_property:
+ * @dev: Device to add the property to.
+ * @prop: The qdev property definition.
+ *
+ * Add a legacy QOM property to @dev for qdev property @prop.
+ *
+ * Legacy properties are string versions of QOM properties.  The format of
+ * the string depends on the property type.  Legacy properties are only
+ * needed for "info qtree".
+ *
+ * Do not use this in new code!  QOM Properties added through this interface
+ * will be given names in the "legacy" namespace.
+ */
+static void qdev_class_add_legacy_property(DeviceClass *dc, Property *prop)
+{
+    g_autofree char *name = NULL;
+
+    /* Register pointer properties as legacy properties */
+    if (!prop->info->print && prop->info->get) {
+        return;
+    }
+
+    name = g_strdup_printf("legacy-%s", prop->name);
+    object_class_property_add(OBJECT_CLASS(dc), name, "str",
+        prop->info->print ? qdev_get_legacy_property : prop->info->get,
+        NULL, NULL, prop);
+}
+
+void device_class_set_props(DeviceClass *dc, Property *props)
+{
+    Property *prop;
+
+    dc->props_ = props;
+    for (prop = props; prop && prop->name; prop++) {
+        qdev_class_add_legacy_property(dc, prop);
+        qdev_class_add_property(dc, prop);
+    }
+}
+
+void qdev_alias_all_properties(DeviceState *target, Object *source)
+{
+    ObjectClass *class;
+    Property *prop;
+
+    class = object_get_class(OBJECT(target));
+    do {
+        DeviceClass *dc = DEVICE_CLASS(class);
+
+        for (prop = dc->props_; prop && prop->name; prop++) {
+            object_property_add_alias(source, prop->name,
+                                      OBJECT(target), prop->name);
+        }
+        class = object_class_get_parent(class);
+    } while (class != object_class_by_name(TYPE_DEVICE));
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index fc4daa36fa..3c43107f71 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -714,115 +714,6 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
-/**
- * Legacy property handling
- */
-
-static void qdev_get_legacy_property(Object *obj, Visitor *v,
-                                     const char *name, void *opaque,
-                                     Error **errp)
-{
-    DeviceState *dev = DEVICE(obj);
-    Property *prop = opaque;
-
-    char buffer[1024];
-    char *ptr = buffer;
-
-    prop->info->print(dev, prop, buffer, sizeof(buffer));
-    visit_type_str(v, name, &ptr, errp);
-}
-
-/**
- * qdev_class_add_legacy_property:
- * @dev: Device to add the property to.
- * @prop: The qdev property definition.
- *
- * Add a legacy QOM property to @dev for qdev property @prop.
- *
- * Legacy properties are string versions of QOM properties.  The format of
- * the string depends on the property type.  Legacy properties are only
- * needed for "info qtree".
- *
- * Do not use this in new code!  QOM Properties added through this interface
- * will be given names in the "legacy" namespace.
- */
-static void qdev_class_add_legacy_property(DeviceClass *dc, Property *prop)
-{
-    g_autofree char *name = NULL;
-
-    /* Register pointer properties as legacy properties */
-    if (!prop->info->print && prop->info->get) {
-        return;
-    }
-
-    name = g_strdup_printf("legacy-%s", prop->name);
-    object_class_property_add(OBJECT_CLASS(dc), name, "str",
-        prop->info->print ? qdev_get_legacy_property : prop->info->get,
-        NULL, NULL, prop);
-}
-
-void qdev_property_add_static(DeviceState *dev, Property *prop)
-{
-    Object *obj = OBJECT(dev);
-    ObjectProperty *op;
-
-    assert(!prop->info->create);
-
-    op = object_property_add(obj, prop->name, prop->info->name,
-                             prop->info->get, prop->info->set,
-                             prop->info->release,
-                             prop);
-
-    object_property_set_description(obj, prop->name,
-                                    prop->info->description);
-
-    if (prop->set_default) {
-        prop->info->set_default_value(op, prop);
-        if (op->init) {
-            op->init(obj, op);
-        }
-    }
-}
-
-static void qdev_class_add_property(DeviceClass *klass, Property *prop)
-{
-    ObjectClass *oc = OBJECT_CLASS(klass);
-
-    if (prop->info->create) {
-        prop->info->create(oc, prop);
-    } else {
-        ObjectProperty *op;
-
-        op = object_class_property_add(oc,
-                                       prop->name, prop->info->name,
-                                       prop->info->get, prop->info->set,
-                                       prop->info->release,
-                                       prop);
-        if (prop->set_default) {
-            prop->info->set_default_value(op, prop);
-        }
-    }
-    object_class_property_set_description(oc, prop->name,
-                                          prop->info->description);
-}
-
-void qdev_alias_all_properties(DeviceState *target, Object *source)
-{
-    ObjectClass *class;
-    Property *prop;
-
-    class = object_get_class(OBJECT(target));
-    do {
-        DeviceClass *dc = DEVICE_CLASS(class);
-
-        for (prop = dc->props_; prop && prop->name; prop++) {
-            object_property_add_alias(source, prop->name,
-                                      OBJECT(target), prop->name);
-        }
-        class = object_class_get_parent(class);
-    } while (class != object_class_by_name(TYPE_DEVICE));
-}
-
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -1217,17 +1108,6 @@ static void device_class_init(ObjectClass *class, void *data)
                                    offsetof(DeviceState, parent_bus), NULL, 0);
 }
 
-void device_class_set_props(DeviceClass *dc, Property *props)
-{
-    Property *prop;
-
-    dc->props_ = props;
-    for (prop = props; prop && prop->name; prop++) {
-        qdev_class_add_legacy_property(dc, prop);
-        qdev_class_add_property(dc, prop);
-    }
-}
-
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
                                    DeviceReset *parent_reset)
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bcfb90a08f..79164e4a3f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -38,6 +38,7 @@
 #include "migration/misc.h"
 #include "migration/migration.h"
 #include "qemu/cutils.h"
+#include "hw/qdev-properties.h"
 #include "hw/clock.h"
 
 /*
-- 
2.28.0


