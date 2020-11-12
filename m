Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C42B1183
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:28:48 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdL5D-0004f9-VW
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKR0-0008FU-FM
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQv-0003jg-Up
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckHrdG7afHO+vYKYk5rCNQ2Za/jOvDXsKRnppkOWbgE=;
 b=UlGYS7DPrfgQKfHxlXMKwOsLpp4ryI8uc5AuWwRpGzUsaCajKAhs0V9/NjA/x/vl9EP4ar
 JmTGLNTLdpshW4IFGPxX6Ce8FYtb0T87q3mclQCWXTlH7Vl1VEBLoVVH52V0NsNC4AXZh2
 txkV1JYcCp9ILzbwRTL+MQ4J+ZAj6Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-KhsZAAkkPVWl6GLsredfmw-1; Thu, 12 Nov 2020 16:47:07 -0500
X-MC-Unique: KhsZAAkkPVWl6GLsredfmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44651185A0C0;
 Thu, 12 Nov 2020 21:47:06 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE4C71002382;
 Thu, 12 Nov 2020 21:47:05 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 46/53] qdev: Move base property types to
 qom/property-types.c
Date: Thu, 12 Nov 2020 16:43:43 -0500
Message-Id: <20201112214350.872250-47-ehabkost@redhat.com>
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

Move all property types from qdev-properties.c to
qom/property-types.c.  Declarations are moved from
hw/qdev-properties.h to qom/property-types.h.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Redone after changes in previous patches in this series
* Reordered patch, tried to put it a bit earlier in the series

Changes v1 -> v2:
* Rebased after changes in previous patches in the series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h | 125 +-------
 include/qom/property-types.h | 131 +++++++++
 include/qom/qom.h            |   1 +
 hw/core/qdev-properties.c    | 538 ----------------------------------
 qom/property-types.c         | 546 +++++++++++++++++++++++++++++++++++
 qom/meson.build              |   1 +
 6 files changed, 680 insertions(+), 662 deletions(-)
 create mode 100644 include/qom/property-types.h
 create mode 100644 qom/property-types.c

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 6585a8e693..939b6dbf4e 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -3,130 +3,7 @@
 
 #include "hw/qdev-core.h"
 #include "qom/field-property.h"
-
-/*** qdev-properties.c ***/
-
-extern const PropertyInfo prop_info_bit;
-extern const PropertyInfo prop_info_bit64;
-extern const PropertyInfo prop_info_bool;
-extern const PropertyInfo prop_info_enum;
-extern const PropertyInfo prop_info_uint8;
-extern const PropertyInfo prop_info_uint16;
-extern const PropertyInfo prop_info_uint32;
-extern const PropertyInfo prop_info_int32;
-extern const PropertyInfo prop_info_uint64;
-extern const PropertyInfo prop_info_int64;
-extern const PropertyInfo prop_info_size;
-extern const PropertyInfo prop_info_string;
-extern const PropertyInfo prop_info_on_off_auto;
-extern const PropertyInfo prop_info_size32;
-extern const PropertyInfo prop_info_arraylen;
-extern const PropertyInfo prop_info_link;
-
-#define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
-        .name_template = (_name),                           \
-        .info      = &(_prop),                                   \
-        .offset    = offsetof(_state, _field)                    \
-            + type_check(_type, typeof_field(_state, _field)),   \
-        __VA_ARGS__                                              \
-        }
-
-#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type,                     \
-                .set_default = true,                                     \
-                .defval.i    = (_type)_defval)
-
-#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type)
-
-#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, prop_info_bit, uint32_t, \
-                .bitnr       = (_bit),                          \
-                .set_default = true,                            \
-                .defval.u    = (bool)_defval)
-
-#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
-                .set_default = true,                                       \
-                .defval.u  = (_type)_defval)
-
-#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type)
-
-#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, prop_info_bit64, uint64_t, \
-                .bitnr    = (_bit),                               \
-                .set_default = true,                              \
-                .defval.u  = (bool)_defval)
-
-#define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
-    DEFINE_PROP(_name, _state, _field, prop_info_bool, bool, \
-                .set_default = true,                         \
-                .defval.u    = (bool)_defval)
-
-#define PROP_ARRAY_LEN_PREFIX "len-"
-
-/**
- * DEFINE_PROP_ARRAY:
- * @_name: name of the array
- * @_state: name of the device state structure type
- * @_field: uint32_t field in @_state to hold the array length
- * @_arrayfield: field in @_state (of type '@_arraytype *') which
- *               will point to the array
- * @_arrayprop: PropertyInfo defining what property the array elements have
- * @_arraytype: C type of the array elements
- *
- * Define device properties for a variable-length array _name.  A
- * static property "len-arrayname" is defined. When the device creator
- * sets this property to the desired length of array, further dynamic
- * properties "arrayname[0]", "arrayname[1]", ...  are defined so the
- * device creator can set the array element values. Setting the
- * "len-arrayname" property more than once is an error.
- *
- * When the array length is set, the @_field member of the device
- * struct is set to the array length, and @_arrayfield is set to point
- * to (zero-initialised) memory allocated for the array.  For a zero
- * length array, @_field will be set to 0 and @_arrayfield to NULL.
- * It is the responsibility of the device deinit code to free the
- * @_arrayfield memory.
- */
-#define DEFINE_PROP_ARRAY(_name, _state, _field,               \
-                          _arrayfield, _arrayprop, _arraytype) \
-    DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
-                _state, _field, prop_info_arraylen, uint32_t,  \
-                .set_default = true,                           \
-                .defval.u = 0,                                 \
-                .arrayinfo = &(_arrayprop),                    \
-                .arrayfieldsize = sizeof(_arraytype),          \
-                .arrayoffset = offsetof(_state, _arrayfield))
-
-#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
-    DEFINE_PROP(_name, _state, _field, prop_info_link, _ptr_type,     \
-                .link_type  = _type)
-
-#define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint8, uint8_t)
-#define DEFINE_PROP_UINT16(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint16, uint16_t)
-#define DEFINE_PROP_UINT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint32, uint32_t)
-#define DEFINE_PROP_INT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int32, int32_t)
-#define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint64, uint64_t)
-#define DEFINE_PROP_INT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int64, int64_t)
-#define DEFINE_PROP_SIZE(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size, uint64_t)
-#define DEFINE_PROP_STRING(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, prop_info_string, char*)
-#define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_on_off_auto, OnOffAuto)
-#define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size32, uint32_t)
-
-#define DEFINE_PROP_END_OF_LIST()               \
-    {}
+#include "qom/property-types.h"
 
 /*
  * Set properties between creation and realization.
diff --git a/include/qom/property-types.h b/include/qom/property-types.h
new file mode 100644
index 0000000000..0aff0d9474
--- /dev/null
+++ b/include/qom/property-types.h
@@ -0,0 +1,131 @@
+/*
+ * QOM field property types
+ */
+#ifndef QOM_PROPERTY_TYPES_H
+#define QOM_PROPERTY_TYPES_H
+
+#include "qom/field-property.h"
+
+extern const PropertyInfo prop_info_bit;
+extern const PropertyInfo prop_info_bit64;
+extern const PropertyInfo prop_info_bool;
+extern const PropertyInfo prop_info_enum;
+extern const PropertyInfo prop_info_uint8;
+extern const PropertyInfo prop_info_uint16;
+extern const PropertyInfo prop_info_uint32;
+extern const PropertyInfo prop_info_int32;
+extern const PropertyInfo prop_info_uint64;
+extern const PropertyInfo prop_info_int64;
+extern const PropertyInfo prop_info_size;
+extern const PropertyInfo prop_info_string;
+extern const PropertyInfo prop_info_on_off_auto;
+extern const PropertyInfo prop_info_size32;
+extern const PropertyInfo prop_info_arraylen;
+extern const PropertyInfo prop_info_link;
+
+#define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
+        .name_template = (_name),                           \
+        .info      = &(_prop),                                   \
+        .offset    = offsetof(_state, _field)                    \
+            + type_check(_type, typeof_field(_state, _field)),   \
+        __VA_ARGS__                                              \
+        }
+
+#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type,                     \
+                .set_default = true,                                     \
+                .defval.i    = (_type)_defval)
+
+#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type)
+
+#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
+    DEFINE_PROP(_name, _state, _field, prop_info_bit, uint32_t, \
+                .bitnr       = (_bit),                          \
+                .set_default = true,                            \
+                .defval.u    = (bool)_defval)
+
+#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
+                .set_default = true,                                       \
+                .defval.u  = (_type)_defval)
+
+#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type)
+
+#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
+    DEFINE_PROP(_name, _state, _field, prop_info_bit64, uint64_t, \
+                .bitnr    = (_bit),                               \
+                .set_default = true,                              \
+                .defval.u  = (bool)_defval)
+
+#define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
+    DEFINE_PROP(_name, _state, _field, prop_info_bool, bool, \
+                .set_default = true,                         \
+                .defval.u    = (bool)_defval)
+
+#define PROP_ARRAY_LEN_PREFIX "len-"
+
+/**
+ * DEFINE_PROP_ARRAY:
+ * @_name: name of the array
+ * @_state: name of the device state structure type
+ * @_field: uint32_t field in @_state to hold the array length
+ * @_arrayfield: field in @_state (of type '@_arraytype *') which
+ *               will point to the array
+ * @_arrayprop: PropertyInfo defining what property the array elements have
+ * @_arraytype: C type of the array elements
+ *
+ * Define device properties for a variable-length array _name.  A
+ * static property "len-arrayname" is defined. When the device creator
+ * sets this property to the desired length of array, further dynamic
+ * properties "arrayname[0]", "arrayname[1]", ...  are defined so the
+ * device creator can set the array element values. Setting the
+ * "len-arrayname" property more than once is an error.
+ *
+ * When the array length is set, the @_field member of the device
+ * struct is set to the array length, and @_arrayfield is set to point
+ * to (zero-initialised) memory allocated for the array.  For a zero
+ * length array, @_field will be set to 0 and @_arrayfield to NULL.
+ * It is the responsibility of the device deinit code to free the
+ * @_arrayfield memory.
+ */
+#define DEFINE_PROP_ARRAY(_name, _state, _field,               \
+                          _arrayfield, _arrayprop, _arraytype) \
+    DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
+                _state, _field, prop_info_arraylen, uint32_t,  \
+                .set_default = true,                           \
+                .defval.u = 0,                                 \
+                .arrayinfo = &(_arrayprop),                    \
+                .arrayfieldsize = sizeof(_arraytype),          \
+                .arrayoffset = offsetof(_state, _arrayfield))
+
+#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
+    DEFINE_PROP(_name, _state, _field, prop_info_link, _ptr_type,     \
+                .link_type  = _type)
+
+#define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint8, uint8_t)
+#define DEFINE_PROP_UINT16(_n, _s, _f, _d)                      \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint16, uint16_t)
+#define DEFINE_PROP_UINT32(_n, _s, _f, _d)                      \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint32, uint32_t)
+#define DEFINE_PROP_INT32(_n, _s, _f, _d)                      \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int32, int32_t)
+#define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint64, uint64_t)
+#define DEFINE_PROP_INT64(_n, _s, _f, _d)                      \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int64, int64_t)
+#define DEFINE_PROP_SIZE(_n, _s, _f, _d)                       \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size, uint64_t)
+#define DEFINE_PROP_STRING(_n, _s, _f)             \
+    DEFINE_PROP(_n, _s, _f, prop_info_string, char*)
+#define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_on_off_auto, OnOffAuto)
+#define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size32, uint32_t)
+
+#define DEFINE_PROP_END_OF_LIST()               \
+    {}
+
+#endif
diff --git a/include/qom/qom.h b/include/qom/qom.h
index 9dbc88801d..ef37a317c3 100644
--- a/include/qom/qom.h
+++ b/include/qom/qom.h
@@ -9,3 +9,4 @@
 #include "qom/object_interfaces.h"
 #include "qom/qom-qobject.h"
 #include "qom/field-property.h"
+#include "qom/property-types.h"
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index c79cb9a89b..8979c40486 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -50,497 +50,6 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    int *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
-}
-
-void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    int *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
-}
-
-void field_prop_set_default_value_enum(ObjectProperty *op,
-                                       const Property *prop)
-{
-    object_property_set_default_str(op,
-        qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
-}
-
-const PropertyInfo prop_info_enum = {
-    .name  = "enum",
-    .get   = field_prop_get_enum,
-    .set   = field_prop_set_enum,
-    .set_default_value = field_prop_set_default_value_enum,
-};
-
-/* Bit */
-
-static uint32_t qdev_get_prop_mask(Property *prop)
-{
-    assert(prop->info == &prop_info_bit);
-    return 0x1 << prop->bitnr;
-}
-
-static void bit_prop_set(Object *obj, Property *props, bool val)
-{
-    uint32_t *p = object_field_prop_ptr(obj, props);
-    uint32_t mask = qdev_get_prop_mask(props);
-    if (val) {
-        *p |= mask;
-    } else {
-        *p &= ~mask;
-    }
-}
-
-static void prop_get_bit(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint32_t *p = object_field_prop_ptr(obj, prop);
-    bool value = (*p & qdev_get_prop_mask(prop)) != 0;
-
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void prop_set_bit(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-    bit_prop_set(obj, prop, value);
-}
-
-static void set_default_value_bool(ObjectProperty *op, const Property *prop)
-{
-    object_property_set_default_bool(op, prop->defval.u);
-}
-
-const PropertyInfo prop_info_bit = {
-    .name  = "bool",
-    .description = "on/off",
-    .get   = prop_get_bit,
-    .set   = prop_set_bit,
-    .set_default_value = set_default_value_bool,
-};
-
-/* Bit64 */
-
-static uint64_t qdev_get_prop_mask64(Property *prop)
-{
-    assert(prop->info == &prop_info_bit64);
-    return 0x1ull << prop->bitnr;
-}
-
-static void bit64_prop_set(Object *obj, Property *props, bool val)
-{
-    uint64_t *p = object_field_prop_ptr(obj, props);
-    uint64_t mask = qdev_get_prop_mask64(props);
-    if (val) {
-        *p |= mask;
-    } else {
-        *p &= ~mask;
-    }
-}
-
-static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint64_t *p = object_field_prop_ptr(obj, prop);
-    bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
-
-    visit_type_bool(v, name, &value, errp);
-}
-
-static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    bool value;
-
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-    bit64_prop_set(obj, prop, value);
-}
-
-const PropertyInfo prop_info_bit64 = {
-    .name  = "bool",
-    .description = "on/off",
-    .get   = prop_get_bit64,
-    .set   = prop_set_bit64,
-    .set_default_value = set_default_value_bool,
-};
-
-/* --- bool --- */
-
-static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
-{
-    Property *prop = opaque;
-    bool *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_bool(v, name, ptr, errp);
-}
-
-static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
-{
-    Property *prop = opaque;
-    bool *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_bool(v, name, ptr, errp);
-}
-
-const PropertyInfo prop_info_bool = {
-    .name  = "bool",
-    .get   = get_bool,
-    .set   = set_bool,
-    .set_default_value = set_default_value_bool,
-};
-
-/* --- 8bit integer --- */
-
-static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
-{
-    Property *prop = opaque;
-    uint8_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint8(v, name, ptr, errp);
-}
-
-static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
-{
-    Property *prop = opaque;
-    uint8_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint8(v, name, ptr, errp);
-}
-
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
-const PropertyInfo prop_info_uint8 = {
-    .name  = "uint8",
-    .get   = get_uint8,
-    .set   = set_uint8,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-/* --- 16bit integer --- */
-
-static void get_uint16(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint16_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint16(v, name, ptr, errp);
-}
-
-static void set_uint16(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint16_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint16(v, name, ptr, errp);
-}
-
-const PropertyInfo prop_info_uint16 = {
-    .name  = "uint16",
-    .get   = get_uint16,
-    .set   = set_uint16,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-/* --- 32bit integer --- */
-
-static void get_uint32(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint32_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint32(v, name, ptr, errp);
-}
-
-static void set_uint32(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint32_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint32(v, name, ptr, errp);
-}
-
-void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    int32_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_int32(v, name, ptr, errp);
-}
-
-static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
-{
-    Property *prop = opaque;
-    int32_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_int32(v, name, ptr, errp);
-}
-
-const PropertyInfo prop_info_uint32 = {
-    .name  = "uint32",
-    .get   = get_uint32,
-    .set   = set_uint32,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-const PropertyInfo prop_info_int32 = {
-    .name  = "int32",
-    .get   = field_prop_get_int32,
-    .set   = set_int32,
-    .set_default_value = field_prop_set_default_value_int,
-};
-
-/* --- 64bit integer --- */
-
-static void get_uint64(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint64(v, name, ptr, errp);
-}
-
-static void set_uint64(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_uint64(v, name, ptr, errp);
-}
-
-static void get_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    int64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_int64(v, name, ptr, errp);
-}
-
-static void set_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    int64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_int64(v, name, ptr, errp);
-}
-
-const PropertyInfo prop_info_uint64 = {
-    .name  = "uint64",
-    .get   = get_uint64,
-    .set   = set_uint64,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-const PropertyInfo prop_info_int64 = {
-    .name  = "int64",
-    .get   = get_int64,
-    .set   = set_int64,
-    .set_default_value = field_prop_set_default_value_int,
-};
-
-/* --- string --- */
-
-static void release_string(Object *obj, const char *name, void *opaque)
-{
-    Property *prop = opaque;
-    g_free(*(char **)object_field_prop_ptr(obj, prop));
-}
-
-static void get_string(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    char **ptr = object_field_prop_ptr(obj, prop);
-
-    if (!*ptr) {
-        char *str = (char *)"";
-        visit_type_str(v, name, &str, errp);
-    } else {
-        visit_type_str(v, name, ptr, errp);
-    }
-}
-
-static void set_string(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    char **ptr = object_field_prop_ptr(obj, prop);
-    char *str;
-
-    if (!visit_type_str(v, name, &str, errp)) {
-        return;
-    }
-    g_free(*ptr);
-    *ptr = str;
-}
-
-const PropertyInfo prop_info_string = {
-    .name  = "str",
-    .release = release_string,
-    .get   = get_string,
-    .set   = set_string,
-};
-
-/* --- on/off/auto --- */
-
-const PropertyInfo prop_info_on_off_auto = {
-    .name = "OnOffAuto",
-    .description = "on/off/auto",
-    .enum_table = &OnOffAuto_lookup,
-    .get = field_prop_get_enum,
-    .set = field_prop_set_enum,
-    .set_default_value = field_prop_set_default_value_enum,
-};
-
-/* --- 32bit unsigned int 'size' type --- */
-
-void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    Property *prop = opaque;
-    uint32_t *ptr = object_field_prop_ptr(obj, prop);
-    uint64_t value = *ptr;
-
-    visit_type_size(v, name, &value, errp);
-}
-
-static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
-                       Error **errp)
-{
-    Property *prop = opaque;
-    uint32_t *ptr = object_field_prop_ptr(obj, prop);
-    uint64_t value;
-
-    if (!visit_type_size(v, name, &value, errp)) {
-        return;
-    }
-
-    if (value > UINT32_MAX) {
-        error_setg(errp,
-                   "Property %s.%s doesn't take value %" PRIu64
-                   " (maximum: %u)",
-                   object_get_typename(obj), name, value, UINT32_MAX);
-        return;
-    }
-
-    *ptr = value;
-}
-
-const PropertyInfo prop_info_size32 = {
-    .name  = "size",
-    .get = field_prop_get_size32,
-    .set = set_size32,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-/* --- support for array properties --- */
-
-static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
-{
-    /* Setter for the property which defines the length of a
-     * variable-sized property array. As well as actually setting the
-     * array-length field in the device struct, we have to create the
-     * array itself and dynamically add the corresponding properties.
-     */
-    Property *prop = opaque;
-    ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
-    uint32_t *alenptr = object_field_prop_ptr(obj, prop);
-    void **arrayptr = (void *)obj + prop->arrayoffset;
-    void *eltptr;
-    const char *arrayname;
-    int i;
-
-    if (*alenptr) {
-        error_setg(errp, "array size property %s may not be set more than once",
-                   name);
-        return;
-    }
-    if (!visit_type_uint32(v, name, alenptr, errp)) {
-        return;
-    }
-    if (!*alenptr) {
-        return;
-    }
-
-    /* DEFINE_PROP_ARRAY guarantees that name should start with this prefix;
-     * strip it off so we can get the name of the array itself.
-     */
-    assert(strncmp(name, PROP_ARRAY_LEN_PREFIX,
-                   strlen(PROP_ARRAY_LEN_PREFIX)) == 0);
-    arrayname = name + strlen(PROP_ARRAY_LEN_PREFIX);
-
-    /* Note that it is the responsibility of the individual device's deinit
-     * to free the array proper.
-     */
-    *arrayptr = eltptr = g_malloc0(*alenptr * prop->arrayfieldsize);
-    for (i = 0; i < *alenptr; i++, eltptr += prop->arrayfieldsize) {
-        g_autofree char *propname = g_strdup_printf("%s[%d]", arrayname, i);
-        Property arrayprop = { };
-        arrayprop.info = prop->arrayinfo;
-        /* This ugly piece of pointer arithmetic sets up the offset so
-         * that when the underlying get/set hooks call qdev_get_prop_ptr
-         * they get the right answer despite the array element not actually
-         * being inside the device struct.
-         */
-        arrayprop.offset = eltptr - (void *)obj;
-        assert(object_field_prop_ptr(obj, &arrayprop) == eltptr);
-        object_property_add_field(obj, propname, &arrayprop,
-                                  op->allow_set);
-    }
-}
-
-const PropertyInfo prop_info_arraylen = {
-    .name = "uint32",
-    .get = get_uint32,
-    .set = set_prop_arraylen,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
 /* --- public helpers --- */
 
 static Property *qdev_prop_walk(Property *props, const char *name)
@@ -713,53 +222,6 @@ void qdev_prop_set_globals(DeviceState *dev)
                               dev->hotplugged ? NULL : &error_fatal);
 }
 
-/* --- 64bit unsigned int 'size' type --- */
-
-static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
-{
-    Property *prop = opaque;
-    uint64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_size(v, name, ptr, errp);
-}
-
-static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
-{
-    Property *prop = opaque;
-    uint64_t *ptr = object_field_prop_ptr(obj, prop);
-
-    visit_type_size(v, name, ptr, errp);
-}
-
-const PropertyInfo prop_info_size = {
-    .name  = "size",
-    .get = get_size,
-    .set = set_size,
-    .set_default_value = field_prop_set_default_value_uint,
-};
-
-/* --- object link property --- */
-
-static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
-                                            Property *prop)
-{
-    /*
-     * NOTE: object_property_allow_set_link is unconditional, but
-     *       ObjectProperty.allow_set may be set for the property too.
-     */
-    return object_class_property_add_link(oc, name, prop->link_type,
-                                          prop->offset,
-                                          object_property_allow_set_link,
-                                          OBJ_PROP_LINK_STRONG);
-}
-
-const PropertyInfo prop_info_link = {
-    .name = "link",
-    .create = create_link_property,
-};
-
 void qdev_property_add_static(DeviceState *dev, Property *prop)
 {
     object_property_add_field(OBJECT(dev), prop->name_template, prop,
diff --git a/qom/property-types.c b/qom/property-types.c
new file mode 100644
index 0000000000..4b3fe15b6a
--- /dev/null
+++ b/qom/property-types.c
@@ -0,0 +1,546 @@
+#include "qemu/osdep.h"
+#include "qom/field-property.h"
+#include "qom/property-types.h"
+#include "qom/field-property-internal.h"
+#include "qapi/qapi-types-common.h"
+#include "qapi/visitor.h"
+#include "qapi/error.h"
+#include "qemu/uuid.h"
+
+void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    int *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
+}
+
+void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    int *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
+}
+
+void field_prop_set_default_value_enum(ObjectProperty *op,
+                                       const Property *prop)
+{
+    object_property_set_default_str(op,
+        qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
+}
+
+const PropertyInfo prop_info_enum = {
+    .name  = "enum",
+    .get   = field_prop_get_enum,
+    .set   = field_prop_set_enum,
+    .set_default_value = field_prop_set_default_value_enum,
+};
+
+/* Bit */
+
+static uint32_t qdev_get_prop_mask(Property *prop)
+{
+    assert(prop->info == &prop_info_bit);
+    return 0x1 << prop->bitnr;
+}
+
+static void bit_prop_set(Object *obj, Property *props, bool val)
+{
+    uint32_t *p = object_field_prop_ptr(obj, props);
+    uint32_t mask = qdev_get_prop_mask(props);
+    if (val) {
+        *p |= mask;
+    } else {
+        *p &= ~mask;
+    }
+}
+
+static void prop_get_bit(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *p = object_field_prop_ptr(obj, prop);
+    bool value = (*p & qdev_get_prop_mask(prop)) != 0;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void prop_set_bit(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+    bit_prop_set(obj, prop, value);
+}
+
+static void set_default_value_bool(ObjectProperty *op, const Property *prop)
+{
+    object_property_set_default_bool(op, prop->defval.u);
+}
+
+const PropertyInfo prop_info_bit = {
+    .name  = "bool",
+    .description = "on/off",
+    .get   = prop_get_bit,
+    .set   = prop_set_bit,
+    .set_default_value = set_default_value_bool,
+};
+
+/* Bit64 */
+
+static uint64_t qdev_get_prop_mask64(Property *prop)
+{
+    assert(prop->info == &prop_info_bit64);
+    return 0x1ull << prop->bitnr;
+}
+
+static void bit64_prop_set(Object *obj, Property *props, bool val)
+{
+    uint64_t *p = object_field_prop_ptr(obj, props);
+    uint64_t mask = qdev_get_prop_mask64(props);
+    if (val) {
+        *p |= mask;
+    } else {
+        *p &= ~mask;
+    }
+}
+
+static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *p = object_field_prop_ptr(obj, prop);
+    bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+    bit64_prop_set(obj, prop, value);
+}
+
+const PropertyInfo prop_info_bit64 = {
+    .name  = "bool",
+    .description = "on/off",
+    .get   = prop_get_bit64,
+    .set   = prop_set_bit64,
+    .set_default_value = set_default_value_bool,
+};
+
+/* --- bool --- */
+
+static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    Property *prop = opaque;
+    bool *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_bool(v, name, ptr, errp);
+}
+
+static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    Property *prop = opaque;
+    bool *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_bool(v, name, ptr, errp);
+}
+
+const PropertyInfo prop_info_bool = {
+    .name  = "bool",
+    .get   = get_bool,
+    .set   = set_bool,
+    .set_default_value = set_default_value_bool,
+};
+
+/* --- 8bit integer --- */
+
+static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
+                      Error **errp)
+{
+    Property *prop = opaque;
+    uint8_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint8(v, name, ptr, errp);
+}
+
+static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
+                      Error **errp)
+{
+    Property *prop = opaque;
+    uint8_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint8(v, name, ptr, errp);
+}
+
+void field_prop_set_default_value_int(ObjectProperty *op,
+                                      const Property *prop)
+{
+    object_property_set_default_int(op, prop->defval.i);
+}
+
+void field_prop_set_default_value_uint(ObjectProperty *op,
+                                       const Property *prop)
+{
+    object_property_set_default_uint(op, prop->defval.u);
+}
+
+const PropertyInfo prop_info_uint8 = {
+    .name  = "uint8",
+    .get   = get_uint8,
+    .set   = set_uint8,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+/* --- 16bit integer --- */
+
+static void get_uint16(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint16_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint16(v, name, ptr, errp);
+}
+
+static void set_uint16(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint16_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint16(v, name, ptr, errp);
+}
+
+const PropertyInfo prop_info_uint16 = {
+    .name  = "uint16",
+    .get   = get_uint16,
+    .set   = set_uint16,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+/* --- 32bit integer --- */
+
+static void get_uint32(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint32(v, name, ptr, errp);
+}
+
+static void set_uint32(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint32(v, name, ptr, errp);
+}
+
+void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    int32_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_int32(v, name, ptr, errp);
+}
+
+static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
+                      Error **errp)
+{
+    Property *prop = opaque;
+    int32_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_int32(v, name, ptr, errp);
+}
+
+const PropertyInfo prop_info_uint32 = {
+    .name  = "uint32",
+    .get   = get_uint32,
+    .set   = set_uint32,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+const PropertyInfo prop_info_int32 = {
+    .name  = "int32",
+    .get   = field_prop_get_int32,
+    .set   = set_int32,
+    .set_default_value = field_prop_set_default_value_int,
+};
+
+/* --- 64bit integer --- */
+
+static void get_uint64(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint64(v, name, ptr, errp);
+}
+
+static void set_uint64(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_uint64(v, name, ptr, errp);
+}
+
+static void get_int64(Object *obj, Visitor *v, const char *name,
+                      void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    int64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_int64(v, name, ptr, errp);
+}
+
+static void set_int64(Object *obj, Visitor *v, const char *name,
+                      void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    int64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_int64(v, name, ptr, errp);
+}
+
+const PropertyInfo prop_info_uint64 = {
+    .name  = "uint64",
+    .get   = get_uint64,
+    .set   = set_uint64,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+const PropertyInfo prop_info_int64 = {
+    .name  = "int64",
+    .get   = get_int64,
+    .set   = set_int64,
+    .set_default_value = field_prop_set_default_value_int,
+};
+
+/* --- string --- */
+
+static void release_string(Object *obj, const char *name, void *opaque)
+{
+    Property *prop = opaque;
+    g_free(*(char **)object_field_prop_ptr(obj, prop));
+}
+
+static void get_string(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    char **ptr = object_field_prop_ptr(obj, prop);
+
+    if (!*ptr) {
+        char *str = (char *)"";
+        visit_type_str(v, name, &str, errp);
+    } else {
+        visit_type_str(v, name, ptr, errp);
+    }
+}
+
+static void set_string(Object *obj, Visitor *v, const char *name,
+                       void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    char **ptr = object_field_prop_ptr(obj, prop);
+    char *str;
+
+    if (!visit_type_str(v, name, &str, errp)) {
+        return;
+    }
+    g_free(*ptr);
+    *ptr = str;
+}
+
+const PropertyInfo prop_info_string = {
+    .name  = "str",
+    .release = release_string,
+    .get   = get_string,
+    .set   = set_string,
+};
+
+/* --- on/off/auto --- */
+
+const PropertyInfo prop_info_on_off_auto = {
+    .name = "OnOffAuto",
+    .description = "on/off/auto",
+    .enum_table = &OnOffAuto_lookup,
+    .get = field_prop_get_enum,
+    .set = field_prop_set_enum,
+    .set_default_value = field_prop_set_default_value_enum,
+};
+
+/* --- 32bit unsigned int 'size' type --- */
+
+void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
+    uint64_t value = *ptr;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
+                       Error **errp)
+{
+    Property *prop = opaque;
+    uint32_t *ptr = object_field_prop_ptr(obj, prop);
+    uint64_t value;
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value > UINT32_MAX) {
+        error_setg(errp,
+                   "Property %s.%s doesn't take value %" PRIu64
+                   " (maximum: %u)",
+                   object_get_typename(obj), name, value, UINT32_MAX);
+        return;
+    }
+
+    *ptr = value;
+}
+
+const PropertyInfo prop_info_size32 = {
+    .name  = "size",
+    .get = field_prop_get_size32,
+    .set = set_size32,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+/* --- support for array properties --- */
+
+static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    /* Setter for the property which defines the length of a
+     * variable-sized property array. As well as actually setting the
+     * array-length field in the device struct, we have to create the
+     * array itself and dynamically add the corresponding properties.
+     */
+    Property *prop = opaque;
+    ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
+    uint32_t *alenptr = object_field_prop_ptr(obj, prop);
+    void **arrayptr = (void *)obj + prop->arrayoffset;
+    void *eltptr;
+    const char *arrayname;
+    int i;
+
+    if (*alenptr) {
+        error_setg(errp, "array size property %s may not be set more than once",
+                   name);
+        return;
+    }
+    if (!visit_type_uint32(v, name, alenptr, errp)) {
+        return;
+    }
+    if (!*alenptr) {
+        return;
+    }
+
+    /* DEFINE_PROP_ARRAY guarantees that name should start with this prefix;
+     * strip it off so we can get the name of the array itself.
+     */
+    assert(strncmp(name, PROP_ARRAY_LEN_PREFIX,
+                   strlen(PROP_ARRAY_LEN_PREFIX)) == 0);
+    arrayname = name + strlen(PROP_ARRAY_LEN_PREFIX);
+
+    /* Note that it is the responsibility of the individual device's deinit
+     * to free the array proper.
+     */
+    *arrayptr = eltptr = g_malloc0(*alenptr * prop->arrayfieldsize);
+    for (i = 0; i < *alenptr; i++, eltptr += prop->arrayfieldsize) {
+        g_autofree char *propname = g_strdup_printf("%s[%d]", arrayname, i);
+        Property arrayprop = { };
+        arrayprop.info = prop->arrayinfo;
+        /* This ugly piece of pointer arithmetic sets up the offset so
+         * that when the underlying get/set hooks call qdev_get_prop_ptr
+         * they get the right answer despite the array element not actually
+         * being inside the device struct.
+         */
+        arrayprop.offset = eltptr - (void *)obj;
+        assert(object_field_prop_ptr(obj, &arrayprop) == eltptr);
+        object_property_add_field(obj, propname, &arrayprop,
+                                  op->allow_set);
+    }
+}
+
+const PropertyInfo prop_info_arraylen = {
+    .name = "uint32",
+    .get = get_uint32,
+    .set = set_prop_arraylen,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+/* --- 64bit unsigned int 'size' type --- */
+
+static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_size(v, name, ptr, errp);
+}
+
+static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    Property *prop = opaque;
+    uint64_t *ptr = object_field_prop_ptr(obj, prop);
+
+    visit_type_size(v, name, ptr, errp);
+}
+
+const PropertyInfo prop_info_size = {
+    .name  = "size",
+    .get = get_size,
+    .set = set_size,
+    .set_default_value = field_prop_set_default_value_uint,
+};
+
+/* --- object link property --- */
+
+static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
+                                            Property *prop)
+{
+    /*
+     * NOTE: object_property_allow_set_link is unconditional, but
+     *       ObjectProperty.allow_set may be set for the property too.
+     */
+    return object_class_property_add_link(oc, name, prop->link_type,
+                                          prop->offset,
+                                          object_property_allow_set_link,
+                                          OBJ_PROP_LINK_STRONG);
+}
+
+const PropertyInfo prop_info_link = {
+    .name = "link",
+    .create = create_link_property,
+};
diff --git a/qom/meson.build b/qom/meson.build
index e83794454d..7fdfd6fe7b 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -5,6 +5,7 @@ qom_ss.add(files(
   'object_interfaces.c',
   'qom-qobject.c',
   'field-property.c',
+  'property-types.c',
 ))
 
 qmp_ss.add(files('qom-qmp-cmds.c'))
-- 
2.28.0


