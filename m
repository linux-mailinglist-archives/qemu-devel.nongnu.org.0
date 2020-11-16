Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846972B5482
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:46:29 +0100 (CET)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kenGW-0000jT-GZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kenCM-00046d-Au
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:42:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kenCD-0000Hn-CV
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605566519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FD910N55Oayo7xuw8XipPIPdyeJyyT2iTKSF0tlXpo0=;
 b=aRhDXu/S6JEjtVQcRu8BDGZ3r7RRNk1/sCG1LJrvSdCS4mcUikiN3lyVgEP8ScuxeZadA4
 hSF75pi4J5KZpXRac+aXaYsTSR4Ev3ZSZYXVkg1vWJwuONxAfCbDKGHRfLAF/VYYqd7izz
 2K7wtChNDcCiwE2nZt1SfA+gU43cMe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-IEtSVNsHMI24nDCrQYfvgQ-1; Mon, 16 Nov 2020 17:41:57 -0500
X-MC-Unique: IEtSVNsHMI24nDCrQYfvgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45FE0800461
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 22:41:56 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7CD45C1C4;
 Mon, 16 Nov 2020 22:41:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] qom: Use qlit to represent property defaults
Date: Mon, 16 Nov 2020 17:41:43 -0500
Message-Id: <20201116224143.1284278-9-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-1-ehabkost@redhat.com>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using QLitObject lets us get rid of most of the
.set_default_value functions, and just use
object_property_set_default() directly.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Instead of initializing defval to QLIT_QNULL
  by default, just check for QTYPE_NONE, to find out if .defval
  was explicitly set.  This avoids extra complexity at
  set_prop_arraylen().
---
 include/hw/qdev-properties-system.h   |  2 +-
 include/qom/field-property-internal.h |  4 ---
 include/qom/field-property.h          | 26 ++++++++-----------
 include/qom/property-types.h          | 19 ++++++--------
 hw/core/qdev-properties-system.c      |  8 ------
 qom/field-property.c                  | 27 ++++++++++++++------
 qom/property-types.c                  | 36 ++++-----------------------
 7 files changed, 42 insertions(+), 80 deletions(-)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 0ac327ae60..a586424a33 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -65,7 +65,7 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 
 #define DEFINE_PROP_UUID(_name, _state, _field) \
     DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
-                .set_default = true)
+                .defval = QLIT_QSTR("auto"))
 
 #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
diff --git a/include/qom/field-property-internal.h b/include/qom/field-property-internal.h
index a7b7e2b69d..9bc29e9b67 100644
--- a/include/qom/field-property-internal.h
+++ b/include/qom/field-property-internal.h
@@ -15,10 +15,6 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
 
 void field_prop_set_default_value_enum(ObjectProperty *op,
                                        const Property *prop);
-void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop);
-void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop);
 
 void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp);
diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index 0cb1fe2217..3cfd19cc14 100644
--- a/include/qom/field-property.h
+++ b/include/qom/field-property.h
@@ -6,6 +6,7 @@
 
 #include "qom/object.h"
 #include "qapi/util.h"
+#include "qapi/qmp/qlit.h"
 
 /**
  * struct Property: definition of a field property
@@ -27,21 +28,8 @@ struct Property {
     const PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
-    /**
-     * @set_default: true if the default value should be set from @defval,
-     *    in which case @info->set_default_value must not be NULL
-     *    (if false then no default value is set by the property system
-     *     and the field retains whatever value it was given by instance_init).
-     */
-    bool         set_default;
-    /**
-     * @defval: default value for the property. This is used only if @set_default
-     *     is true.
-     */
-    union {
-        int64_t i;
-        uint64_t u;
-    } defval;
+    /** @defval: If not QTYPE_NONE, the default value for the property */
+    QLitObject defval;
     /* private: */
     int          arrayoffset;
     const PropertyInfo *arrayinfo;
@@ -61,7 +49,13 @@ struct PropertyInfo {
     const QEnumLookup *enum_table;
     /** @print: String formatting function, for the human monitor */
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
-    /** @set_default_value: Callback for initializing the default value */
+    /**
+     * @set_default_value: Optional callback for initializing the default value
+     *
+     * Most property types don't need to set this, as by default
+     * object_property_set_default() is called with the value at
+     * Property.defval.
+     */
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
     /** @create: Optional callback for creation of property */
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
diff --git a/include/qom/property-types.h b/include/qom/property-types.h
index 3132ddafd9..869d1a993a 100644
--- a/include/qom/property-types.h
+++ b/include/qom/property-types.h
@@ -5,6 +5,7 @@
 #define QOM_PROPERTY_TYPES_H
 
 #include "qom/field-property.h"
+#include "qapi/qmp/qlit.h"
 
 extern const PropertyInfo prop_info_bit;
 extern const PropertyInfo prop_info_bit64;
@@ -25,34 +26,29 @@ extern const PropertyInfo prop_info_link;
 
 #define PROP_SIGNED(_state, _field, _defval, _prop, _type, ...) \
     FIELD_PROP(_state, _field, _prop, _type,                    \
-               .set_default = true,                             \
-               .defval.i    = (_type)_defval,                   \
+               .defval = QLIT_QNUM_INT((_type)_defval),                \
                __VA_ARGS__)
 
 #define PROP_UNSIGNED(_state, _field, _defval, _prop, _type, ...) \
     FIELD_PROP(_state, _field, _prop, _type,                    \
-               .set_default = true,                             \
-               .defval.u  = (_type)_defval,                     \
+               .defval = QLIT_QNUM_UINT((_type)_defval),               \
                __VA_ARGS__)
 
 #define PROP_BIT(_state, _field, _bit, _defval, ...) \
     FIELD_PROP(_state, _field, prop_info_bit, uint32_t,         \
                .bitnr       = (_bit),                           \
-               .set_default = true,                             \
-               .defval.u    = (bool)_defval,                    \
+               .defval = QLIT_QBOOL(_defval),                   \
                __VA_ARGS__)
 
 #define PROP_BIT64(_state, _field, _bit, _defval, ...) \
     FIELD_PROP(_state, _field, prop_info_bit64, uint64_t,       \
                .bitnr    = (_bit),                              \
-               .set_default = true,                             \
-               .defval.u  = (bool)_defval,                      \
+               .defval = QLIT_QBOOL(_defval),                   \
                __VA_ARGS__)
 
 #define PROP_BOOL(_state, _field, _defval, ...) \
     FIELD_PROP(_state, _field, prop_info_bool, bool,            \
-               .set_default = true,                             \
-               .defval.u    = (bool)_defval,                    \
+               .defval = QLIT_QBOOL(_defval),                   \
                __VA_ARGS__)
 
 #define PROP_LINK(_state, _field, _type, _ptr_type, ...) \
@@ -131,8 +127,7 @@ extern const PropertyInfo prop_info_link;
                           _arrayfield, _arrayprop, _arraytype) \
     DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
                 _state, _field, prop_info_arraylen, uint32_t,  \
-                .set_default = true,                           \
-                .defval.u = 0,                                 \
+                .defval = QLIT_QNUM_UINT(0),                   \
                 .arrayinfo = &(_arrayprop),                    \
                 .arrayfieldsize = sizeof(_arraytype),          \
                 .arrayoffset = offsetof(_state, _arrayfield))
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 8da68f076c..d9be5372f6 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -570,7 +570,6 @@ const PropertyInfo qdev_prop_blocksize = {
                    " and " MAX_BLOCK_SIZE_STR,
     .get   = field_prop_get_size32,
     .set   = set_blocksize,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- Block device error handling policy --- */
@@ -768,7 +767,6 @@ const PropertyInfo qdev_prop_pci_devfn = {
     .print = print_pci_devfn,
     .get   = field_prop_get_int32,
     .set   = set_pci_devfn,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- pci host address --- */
@@ -1080,16 +1078,10 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     g_free(str);
 }
 
-static void set_default_uuid_auto(ObjectProperty *op, const Property *prop)
-{
-    object_property_set_default_str(op, UUID_VALUE_AUTO);
-}
-
 const PropertyInfo qdev_prop_uuid = {
     .name  = "str",
     .description = "UUID (aka GUID) or \"" UUID_VALUE_AUTO
         "\" for random value (default)",
     .get   = get_uuid,
     .set   = set_uuid,
-    .set_default_value = set_default_uuid_auto,
 };
diff --git a/qom/field-property.c b/qom/field-property.c
index cb729626ce..9cb5ded41a 100644
--- a/qom/field-property.c
+++ b/qom/field-property.c
@@ -47,6 +47,20 @@ static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *info)
     return info->set ? field_prop_set : NULL;
 }
 
+static void field_prop_set_default_value(ObjectProperty *op,
+                                         Property *prop)
+{
+    if (qlit_type(&prop->defval) == QTYPE_NONE) {
+        return;
+    }
+
+    if (prop->info->set_default_value) {
+        prop->info->set_default_value(op, prop);
+    } else {
+        object_property_set_default(op, qobject_from_qlit(&prop->defval));
+    }
+}
+
 /*
  * Property release callback for dynamically-created properties:
  * We call the underlying element's property release hook, and
@@ -83,11 +97,9 @@ object_property_add_field(Object *obj, const char *name,
     object_property_set_description(obj, name,
                                     newprop->info->description);
 
-    if (newprop->set_default) {
-        newprop->info->set_default_value(op, newprop);
-        if (op->init) {
-            op->init(obj, op);
-        }
+    field_prop_set_default_value(op, prop);
+    if (op->init) {
+        op->init(obj, op);
     }
 
     op->allow_set = allow_set;
@@ -113,9 +125,8 @@ object_class_property_add_field_static(ObjectClass *oc, const char *name,
                                        prop->info->release,
                                        prop);
     }
-    if (prop->set_default) {
-        prop->info->set_default_value(op, prop);
-    }
+
+    field_prop_set_default_value(op, prop);
     if (prop->info->description) {
         object_class_property_set_description(oc, name,
                                               prop->info->description);
diff --git a/qom/property-types.c b/qom/property-types.c
index 4b3fe15b6a..fe96f1f49a 100644
--- a/qom/property-types.c
+++ b/qom/property-types.c
@@ -28,8 +28,11 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
 void field_prop_set_default_value_enum(ObjectProperty *op,
                                        const Property *prop)
 {
-    object_property_set_default_str(op,
-        qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
+    QObject *defval = qobject_from_qlit(&prop->defval);
+    const char *str = qapi_enum_lookup(prop->info->enum_table,
+                                       qnum_get_int(qobject_to(QNum, defval)));
+    object_property_set_default_str(op, str);
+    qobject_unref(defval);
 }
 
 const PropertyInfo prop_info_enum = {
@@ -80,17 +83,11 @@ static void prop_set_bit(Object *obj, Visitor *v, const char *name,
     bit_prop_set(obj, prop, value);
 }
 
-static void set_default_value_bool(ObjectProperty *op, const Property *prop)
-{
-    object_property_set_default_bool(op, prop->defval.u);
-}
-
 const PropertyInfo prop_info_bit = {
     .name  = "bool",
     .description = "on/off",
     .get   = prop_get_bit,
     .set   = prop_set_bit,
-    .set_default_value = set_default_value_bool,
 };
 
 /* Bit64 */
@@ -139,7 +136,6 @@ const PropertyInfo prop_info_bit64 = {
     .description = "on/off",
     .get   = prop_get_bit64,
     .set   = prop_set_bit64,
-    .set_default_value = set_default_value_bool,
 };
 
 /* --- bool --- */
@@ -166,7 +162,6 @@ const PropertyInfo prop_info_bool = {
     .name  = "bool",
     .get   = get_bool,
     .set   = set_bool,
-    .set_default_value = set_default_value_bool,
 };
 
 /* --- 8bit integer --- */
@@ -189,23 +184,10 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_uint8(v, name, ptr, errp);
 }
 
-void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop)
-{
-    object_property_set_default_int(op, prop->defval.i);
-}
-
-void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop)
-{
-    object_property_set_default_uint(op, prop->defval.u);
-}
-
 const PropertyInfo prop_info_uint8 = {
     .name  = "uint8",
     .get   = get_uint8,
     .set   = set_uint8,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 16bit integer --- */
@@ -232,7 +214,6 @@ const PropertyInfo prop_info_uint16 = {
     .name  = "uint16",
     .get   = get_uint16,
     .set   = set_uint16,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 32bit integer --- */
@@ -277,14 +258,12 @@ const PropertyInfo prop_info_uint32 = {
     .name  = "uint32",
     .get   = get_uint32,
     .set   = set_uint32,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 const PropertyInfo prop_info_int32 = {
     .name  = "int32",
     .get   = field_prop_get_int32,
     .set   = set_int32,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- 64bit integer --- */
@@ -329,14 +308,12 @@ const PropertyInfo prop_info_uint64 = {
     .name  = "uint64",
     .get   = get_uint64,
     .set   = set_uint64,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 const PropertyInfo prop_info_int64 = {
     .name  = "int64",
     .get   = get_int64,
     .set   = set_int64,
-    .set_default_value = field_prop_set_default_value_int,
 };
 
 /* --- string --- */
@@ -431,7 +408,6 @@ const PropertyInfo prop_info_size32 = {
     .name  = "size",
     .get = field_prop_get_size32,
     .set = set_size32,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- support for array properties --- */
@@ -495,7 +471,6 @@ const PropertyInfo prop_info_arraylen = {
     .name = "uint32",
     .get = get_uint32,
     .set = set_prop_arraylen,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- 64bit unsigned int 'size' type --- */
@@ -522,7 +497,6 @@ const PropertyInfo prop_info_size = {
     .name  = "size",
     .get = get_size,
     .set = set_size,
-    .set_default_value = field_prop_set_default_value_uint,
 };
 
 /* --- object link property --- */
-- 
2.28.0


