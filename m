Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA622C14EA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:00:16 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI0V-0008Og-Rp
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHph-0006Ps-Pm
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpb-0007rZ-BL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjrJDyHRZnEGjoa99QSepbIyWviCAoV3REvh6+9FNrY=;
 b=ShoaURv7Yiz4UpETASzYYpIicCWNBEsBt+ixuaTFSPowPE6/2RLaoHvv24Vr4Jxp6MgsfY
 lPUv4b1U++1+bREzD9+Th6/Z6vTWfEkOEOkT0DYGEpbaEGTREqGWYESV+2+JkDxqt0H3NV
 hP/WTX+2T3DLPu/CRe0j1x8rCLwjxxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-_pev7KstOaGiOD7fIGtu4A-1; Mon, 23 Nov 2020 14:48:55 -0500
X-MC-Unique: _pev7KstOaGiOD7fIGtu4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9623C1012E6C
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:53 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 414515D9CC;
 Mon, 23 Nov 2020 19:48:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/19] qom: Replace defval value in Property with QLitObject
Date: Mon, 23 Nov 2020 14:48:11 -0500
Message-Id: <20201123194818.2773508-13-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QLitObject is capable of representing a wider range of values,
and it will allow us to simplify a lot of the existing code
setting property defaults, later.  Replace the bool and union
fields with QLitObject.

In short, this is just a direct translation from:
  prop->set_default
to
  prop->defval.type != QTYPE_NONE

from
  prop->defval.i
to
  qnum_get_int(qobject_to(QNum, prop->defval)

and from
  prop->defval.u
to
  qnum_get_uint(qobject_to(QNum, prop->defval)

Note that this doesn't replace any of the default property
setters (yet), but just make them safer.  Now the actual type of
.defval is validated before it is used.

Also note that set_default_uuid_auto() is a bit weird: it ignores
.defval completely.  This patch keeps the existing behavior, and
set_default_uuid_auto() weirdness will be addressed later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.

I am splitting the changes and making them in smaller steps to
make them easier to understand and review.  With this, I intend
to demonstrate that the conversion from bool+union to QLitObject
is an improvement even if the removal of custom .set_defaul_value
functions isn't 100% finished yet.
---
 include/hw/qdev-properties-system.h   |  7 ++++++-
 include/qom/field-property-internal.h |  9 ++++++---
 include/qom/field-property.h          | 27 ++++++++++-----------------
 include/qom/property-types.h          | 18 ++++++------------
 hw/core/qdev-properties-system.c      |  3 ++-
 qom/field-property.c                  |  8 ++++++--
 qom/property-types.c                  | 26 ++++++++++++++++++--------
 7 files changed, 54 insertions(+), 44 deletions(-)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 0ac327ae60..6221da704e 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -65,7 +65,12 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 
 #define DEFINE_PROP_UUID(_name, _state, _field) \
     DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
-                .set_default = true)
+                /*                                               \
+                 * Note that set_default_uuid_auto() currently   \
+                 * ignores the actual value value of .defval,    \
+                 * we just need it to not be not QTYPE_NONE      \
+                 */                                              \
+                .defval = QLIT_QNULL)
 
 #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
diff --git a/include/qom/field-property-internal.h b/include/qom/field-property-internal.h
index a7b7e2b69d..7ed0d8d160 100644
--- a/include/qom/field-property-internal.h
+++ b/include/qom/field-property-internal.h
@@ -14,11 +14,14 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp);
 
 void field_prop_set_default_value_enum(ObjectProperty *op,
-                                       const Property *prop);
+                                       const Property *prop,
+                                       const QObject *defval);
 void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop);
+                                      const Property *prop,
+                                       const QObject *defval);
 void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop);
+                                       const Property *prop,
+                                       const QObject *defval);
 
 void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp);
diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index 0cb1fe2217..951cec2fb0 100644
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
@@ -61,8 +49,13 @@ struct PropertyInfo {
     const QEnumLookup *enum_table;
     /** @print: String formatting function, for the human monitor */
     int (*print)(Object *obj, Property *prop, char *dest, size_t len);
-    /** @set_default_value: Callback for initializing the default value */
-    void (*set_default_value)(ObjectProperty *op, const Property *prop);
+    /**
+     * @set_default_value: Callback for initializing the default value
+     *
+     * @defval is a weak reference.
+     */
+    void (*set_default_value)(ObjectProperty *op, const Property *prop,
+                              const QObject *defval);
     /** @create: Optional callback for creation of property */
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
                               Property *prop);
diff --git a/include/qom/property-types.h b/include/qom/property-types.h
index 3132ddafd9..46e691dab4 100644
--- a/include/qom/property-types.h
+++ b/include/qom/property-types.h
@@ -25,34 +25,29 @@ extern const PropertyInfo prop_info_link;
 
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
@@ -131,8 +126,7 @@ extern const PropertyInfo prop_info_link;
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
index 8da68f076c..217e041152 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -1080,7 +1080,8 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     g_free(str);
 }
 
-static void set_default_uuid_auto(ObjectProperty *op, const Property *prop)
+static void set_default_uuid_auto(ObjectProperty *op, const Property *prop,
+                                  const QObject *defval)
 {
     object_property_set_default_str(op, UUID_VALUE_AUTO);
 }
diff --git a/qom/field-property.c b/qom/field-property.c
index 6a0df7c6ea..593ffb53e9 100644
--- a/qom/field-property.c
+++ b/qom/field-property.c
@@ -65,12 +65,16 @@ static void static_prop_release_dynamic_prop(Object *obj, const char *name,
 static void field_prop_set_default_value(ObjectProperty *op,
                                          Property *prop)
 {
-    if (!prop->set_default) {
+    QObject *defval;
+
+    if (prop->defval.type == QTYPE_NONE) {
         return;
     }
 
+    defval = qobject_from_qlit(&prop->defval);
     assert(prop->info->set_default_value);
-    prop->info->set_default_value(op, prop);
+    prop->info->set_default_value(op, prop, defval);
+    qobject_unref(defval);
 }
 
 ObjectProperty *
diff --git a/qom/property-types.c b/qom/property-types.c
index 4b3fe15b6a..0fc24b3687 100644
--- a/qom/property-types.c
+++ b/qom/property-types.c
@@ -6,6 +6,8 @@
 #include "qapi/visitor.h"
 #include "qapi/error.h"
 #include "qemu/uuid.h"
+#include "qapi/qmp/qnum.h"
+#include "qapi/qmp/qbool.h"
 
 void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
@@ -26,10 +28,12 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
 }
 
 void field_prop_set_default_value_enum(ObjectProperty *op,
-                                       const Property *prop)
+                                       const Property *prop,
+                                       const QObject *defval)
 {
+    QNum *qn = qobject_to(QNum, defval);
     object_property_set_default_str(op,
-        qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
+        qapi_enum_lookup(prop->info->enum_table, qnum_get_int(qn)));
 }
 
 const PropertyInfo prop_info_enum = {
@@ -80,9 +84,11 @@ static void prop_set_bit(Object *obj, Visitor *v, const char *name,
     bit_prop_set(obj, prop, value);
 }
 
-static void set_default_value_bool(ObjectProperty *op, const Property *prop)
+static void set_default_value_bool(ObjectProperty *op, const Property *prop,
+                                   const QObject *defval)
 {
-    object_property_set_default_bool(op, prop->defval.u);
+    QBool *qb = qobject_to(QBool, defval);
+    object_property_set_default_bool(op, qbool_get_bool(qb));
 }
 
 const PropertyInfo prop_info_bit = {
@@ -190,15 +196,19 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
 }
 
 void field_prop_set_default_value_int(ObjectProperty *op,
-                                      const Property *prop)
+                                      const Property *prop,
+                                      const QObject *defval)
 {
-    object_property_set_default_int(op, prop->defval.i);
+    QNum *qn = qobject_to(QNum, defval);
+    object_property_set_default_int(op, qnum_get_int(qn));
 }
 
 void field_prop_set_default_value_uint(ObjectProperty *op,
-                                       const Property *prop)
+                                       const Property *prop,
+                                       const QObject *defval)
 {
-    object_property_set_default_uint(op, prop->defval.u);
+    QNum *qn = qobject_to(QNum, defval);
+    object_property_set_default_uint(op, qnum_get_uint(qn));
 }
 
 const PropertyInfo prop_info_uint8 = {
-- 
2.28.0


