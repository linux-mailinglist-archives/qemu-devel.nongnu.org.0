Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD52B111B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:11:49 +0100 (CET)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKom-0003uC-Lh
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQQ-0007k5-RZ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQO-0003eO-IZ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEDG9Rp82MKd8keWELsCUMQrOmi76cKVVr3EnZnuOn4=;
 b=ewI1bnrkhZjIG0LqfN3NJKkuEXbUoD5WxWIGpr7rVCh67GxVH+B0JACwAhP0iL/9nMJwoT
 mCsOPzEeAbpPmYr46516k57y0+oXhV8S2ZUJdtS+I61lEY8vWoSIkkyrj7VQPx4y0xUeWe
 +TgQobmDOm0m0b/MCA50iv5kCN0SzKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-W0ZsSr8DMA6Q4ZLgb-DV8A-1; Thu, 12 Nov 2020 16:46:32 -0500
X-MC-Unique: W0ZsSr8DMA6Q4ZLgb-DV8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A568049D5;
 Thu, 12 Nov 2020 21:46:31 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA865D9CA;
 Thu, 12 Nov 2020 21:46:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/53] qdev: Make qdev_prop_allow_set() a
 ObjectProperty.allow_set callback
Date: Thu, 12 Nov 2020 16:43:31 -0500
Message-Id: <20201112214350.872250-35-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new allow_set parameter to object*_property_add_field(),
and pass qdev_prop_allow_set as argument in the qdev registration
code.

This removes the last remaining line of code inside the core
field property code that's specific to TYPE_DEVICE, and will
allow us to make field properties a core QOM feature.

The array property also needs to set PropertyInfo.allow_set
manually, but this will be cleaned up later (that code will be
changed to use object_class_property_add_field() too).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Moved earlier in the series, before array property cleanup
  (I did this to allow us to move the code to QOM earlier)
* Redone after object_class_add_field_properties()
  was reintroduced

Changes v1 -> v2:
* Redone patch on top of changes in previous patches in the
  series
* Forbid allow_set==NULL to avoid confusion with link property
  semantics (where NULL makes the property read only)
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-prop-internal.h | 16 ++++++++---
 hw/core/qdev-properties.c    | 51 ++++++++++++++++++++++--------------
 2 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 740a5e530b..47bab46810 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -30,34 +30,43 @@ void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
  * @obj: object instance
  * @name: property name
  * @prop: property definition
+ * @allow_set: check function called when property is set
  *
  * This function should not be used in new code.  Please add class properties
  * instead, using object_class_add_field().
  */
 ObjectProperty *
 object_property_add_field(Object *obj, const char *name,
-                          Property *prop);
+                          Property *prop,
+                          ObjectPropertyAllowSet allow_set);
 
 /**
  * object_class_property_add_field_static: Add a field property to object class
  * @oc: object class
  * @name: property name
  * @prop: property definition
+ * @allow_set: check function called when property is set
  *
  * Add a field property to an object class.  A field property is
  * a property that will change a field at a specific offset of the
  * object instance struct.
  *
  * *@prop must have static life time.
+ *
+ * @allow_set should not be NULL.  If the property can always be
+ * set, `prop_allow_set_always` can be used.  If the property can
+ * never be set, `prop_allow_set_never` can be used.
  */
 ObjectProperty *
 object_class_property_add_field_static(ObjectClass *oc, const char *name,
-                                       Property *prop);
+                                       Property *prop,
+                                       ObjectPropertyAllowSet allow_set);
 
 /**
  * object_class_add_field_properties: Add field properties from array to a class
  * @oc: object class
  * @props: array of property definitions
+ * @allow_set: check function called when property is set
  *
  * Register an array of field properties to a class, using
  * object_class_property_add_field_static() for each array element.
@@ -65,6 +74,7 @@ object_class_property_add_field_static(ObjectClass *oc, const char *name,
  * The array at @props must end with DEFINE_PROP_END_OF_LIST(), and
  * must have static life time.
  */
-void object_class_add_field_properties(ObjectClass *oc, Property *props);
+void object_class_add_field_properties(ObjectClass *oc, Property *props,
+                                       ObjectPropertyAllowSet allow_set);
 
 #endif
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 9d25b49fc1..638daf1ebf 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -25,13 +25,13 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
 }
 
 /* returns: true if property is allowed to be set, false otherwise */
-static bool qdev_prop_allow_set(Object *obj, const char *name,
+static bool qdev_prop_allow_set(Object *obj, ObjectProperty *op,
                                 Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
 
     if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
+        qdev_prop_set_after_realize(dev, op->name, errp);
         return false;
     }
     return true;
@@ -79,10 +79,6 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
 {
     Property *prop = opaque;
 
-    if (!qdev_prop_allow_set(obj, name, errp)) {
-        return;
-    }
-
     return prop->info->set(obj, v, name, opaque, errp);
 }
 
@@ -560,6 +556,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      * array itself and dynamically add the corresponding properties.
      */
     Property *prop = opaque;
+    ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
     uint32_t *alenptr = object_field_prop_ptr(obj, prop);
     void **arrayptr = (void *)obj + prop->arrayoffset;
     void *eltptr;
@@ -592,6 +589,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
     for (i = 0; i < *alenptr; i++, eltptr += prop->arrayfieldsize) {
         char *propname = g_strdup_printf("%s[%d]", arrayname, i);
         ArrayElementProperty *arrayprop = g_new0(ArrayElementProperty, 1);
+        ObjectProperty *elmop;
         arrayprop->release = prop->arrayinfo->release;
         arrayprop->propname = propname;
         arrayprop->prop.info = prop->arrayinfo;
@@ -603,12 +601,13 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          */
         arrayprop->prop.offset = eltptr - (void *)obj;
         assert(object_field_prop_ptr(obj, &arrayprop->prop) == eltptr);
-        object_property_add(obj, propname,
-                            arrayprop->prop.info->name,
-                            field_prop_getter(arrayprop->prop.info),
-                            field_prop_setter(arrayprop->prop.info),
-                            array_element_release,
-                            arrayprop);
+        elmop = object_property_add(obj, propname,
+                                    arrayprop->prop.info->name,
+                                    field_prop_getter(arrayprop->prop.info),
+                                    field_prop_setter(arrayprop->prop.info),
+                                    array_element_release,
+                                    arrayprop);
+        elmop->allow_set = op->allow_set;
     }
 }
 
@@ -823,9 +822,13 @@ const PropertyInfo prop_info_size = {
 static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
                                             Property *prop)
 {
+    /*
+     * NOTE: object_property_allow_set_link is unconditional, but
+     *       ObjectProperty.allow_set may be set for the property too.
+     */
     return object_class_property_add_link(oc, name, prop->link_type,
                                           prop->offset,
-                                          qdev_prop_allow_set_link_before_realize,
+                                          object_property_allow_set_link,
                                           OBJ_PROP_LINK_STRONG);
 }
 
@@ -836,10 +839,12 @@ const PropertyInfo prop_info_link = {
 
 ObjectProperty *
 object_property_add_field(Object *obj, const char *name,
-                          Property *prop)
+                          Property *prop,
+                          ObjectPropertyAllowSet allow_set)
 {
     ObjectProperty *op;
 
+    assert(allow_set);
     assert(!prop->info->create);
 
     op = object_property_add(obj, name, prop->info->name,
@@ -858,15 +863,19 @@ object_property_add_field(Object *obj, const char *name,
         }
     }
 
+    op->allow_set = allow_set;
     return op;
 }
 
 ObjectProperty *
 object_class_property_add_field_static(ObjectClass *oc, const char *name,
-                                       Property *prop)
+                                       Property *prop,
+                                       ObjectPropertyAllowSet allow_set)
 {
     ObjectProperty *op;
 
+    assert(allow_set);
+
     if (prop->info->create) {
         op = prop->info->create(oc, name, prop);
     } else {
@@ -884,22 +893,26 @@ object_class_property_add_field_static(ObjectClass *oc, const char *name,
         object_class_property_set_description(oc, name,
                                               prop->info->description);
     }
+
+    op->allow_set = allow_set;
     return op;
 }
 
-void object_class_add_field_properties(ObjectClass *oc, Property *props)
+void object_class_add_field_properties(ObjectClass *oc, Property *props,
+                                       ObjectPropertyAllowSet allow_set)
 {
     Property *prop;
 
     for (prop = props; prop && prop->name; prop++) {
-        object_class_property_add_field_static(oc, prop->name, prop);
+        object_class_property_add_field_static(oc, prop->name, prop, allow_set);
     }
 }
 
 
 void qdev_property_add_static(DeviceState *dev, Property *prop)
 {
-    object_property_add_field(OBJECT(dev), prop->name, prop);
+    object_property_add_field(OBJECT(dev), prop->name, prop,
+                              qdev_prop_allow_set);
 }
 
 /**
@@ -958,7 +971,7 @@ void device_class_set_props(DeviceClass *dc, Property *props)
         qdev_class_add_legacy_property(dc, prop);
     }
 
-    object_class_add_field_properties(oc, props);
+    object_class_add_field_properties(oc, props, qdev_prop_allow_set);
 }
 
 void qdev_alias_all_properties(DeviceState *target, Object *source)
-- 
2.28.0


