Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EB2A6965
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:24:13 +0100 (CET)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaLa0-0000p5-0w
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFW-000386-He
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:03:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFO-0005fB-VC
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604505774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hHkNTmxU/SjxKqbd9bYOyZ5qhDLK04BJWGVaSXKhJ0=;
 b=dRuzp88WRhBDs6BSiUcQVWlDmT/x9scr9iBuR3NEbVshe48XLcDNErV3SmFHGxC776KLTb
 Ql/TJtQ+Lr+pIx2y2HNAPtNvVEgK03UH082S2JKyHMRTICx3oqB2XCHr3PdtEZ9Ushgtea
 O/wZ9Gh+JOZ9o+MRsnEaanhPBko6qFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-4vvB3C-COsyf5s6UU8RrlA-1; Wed, 04 Nov 2020 11:02:52 -0500
X-MC-Unique: 4vvB3C-COsyf5s6UU8RrlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C7D81A2E935;
 Wed,  4 Nov 2020 16:02:06 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0ABE6266E;
 Wed,  4 Nov 2020 16:02:05 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/44] qdev: Make qdev_prop_allow_set() a
 ObjectProperty.allow_set callback
Date: Wed,  4 Nov 2020 11:00:10 -0500
Message-Id: <20201104160021.2342108-34-ehabkost@redhat.com>
In-Reply-To: <20201104160021.2342108-1-ehabkost@redhat.com>
References: <20201104160021.2342108-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new allow_set parameter to object*_property_add_field(),
and pass qdev_prop_allow_set as argument in the qdev registration
code.

This removes the last remaining line of code inside the core
field property code that's specific to TYPE_DEVICE, and will
allow us to make field properties a core QOM feature.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
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
 hw/core/qdev-prop-internal.h |  4 +++-
 include/hw/qdev-properties.h |  8 +++++++-
 hw/core/qdev-properties.c    | 35 +++++++++++++++++++++++------------
 3 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index 0e16d28171..9fac681e38 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -32,12 +32,14 @@ void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
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
 
 #endif
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index b301fe64d7..7f8d5fc206 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -179,16 +179,22 @@ extern const PropertyInfo qdev_prop_link;
  * @oc: object class
  * @name: property name
  * @prop: property definition
+ * @allow_set: check function called when property is set
  *
  * Add a field property to an object class.  A field property is
  * a property that will change a field at a specific offset of the
  * object instance struct.
  *
  * *@prop must exist for the life time of @oc.
+ *
+ * @allow_set should not be NULL.  If the property can always be
+ * set, `prop_allow_set_always` can be used.  If the property can
+ * never be set, `prop_allow_set_never` can be used.
  */
 ObjectProperty *
 object_class_property_add_field(ObjectClass *oc, const char *name,
-                                Property *prop);
+                                Property *prop,
+                                ObjectPropertyAllowSet allow_set);
 
 /*
  * Set properties between creation and realization.
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 5faf974c4f..ec9e456d95 100644
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
 
@@ -534,6 +530,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      * array itself and dynamically add the corresponding properties.
      */
     Property *prop = opaque;
+    ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
     uint32_t *alenptr = qdev_get_prop_ptr(obj, prop);
     void **arrayptr = (void *)obj + prop->arrayoffset;
     void *eltptr;
@@ -574,7 +571,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          */
         arrayprop->offset = eltptr - (void *)obj;
         assert(qdev_get_prop_ptr(obj, arrayprop) == eltptr);
-        object_property_add_field(obj, propname, arrayprop);
+        object_property_add_field(obj, propname, arrayprop, op->allow_set);
     }
 }
 
@@ -789,9 +786,13 @@ const PropertyInfo qdev_prop_size = {
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
 
@@ -801,10 +802,12 @@ const PropertyInfo qdev_prop_link = {
 };
 
 ObjectProperty *
-object_property_add_field(Object *obj, const char *name, Property *prop)
+object_property_add_field(Object *obj, const char *name, Property *prop,
+                          ObjectPropertyAllowSet allow_set)
 {
     ObjectProperty *op;
 
+    assert(allow_set);
     assert(!prop->info->create);
 
     op = object_property_add(obj, name, prop->info->name,
@@ -823,15 +826,19 @@ object_property_add_field(Object *obj, const char *name, Property *prop)
         }
     }
 
+    op->allow_set = allow_set;
     return op;
 }
 
 ObjectProperty *
 object_class_property_add_field(ObjectClass *oc, const char *name,
-                                Property *prop)
+                                Property *prop,
+                                ObjectPropertyAllowSet allow_set)
 {
     ObjectProperty *op;
 
+    assert(allow_set);
+
     if (prop->info->create) {
         op = prop->info->create(oc, name, prop);
     } else {
@@ -849,12 +856,15 @@ object_class_property_add_field(ObjectClass *oc, const char *name,
         object_class_property_set_description(oc, name,
                                               prop->info->description);
     }
+
+    op->allow_set = allow_set;
     return op;
 }
 
 void qdev_property_add_static(DeviceState *dev, Property *prop)
 {
-    object_property_add_field(OBJECT(dev), prop->qdev_prop_name, prop);
+    object_property_add_field(OBJECT(dev), prop->qdev_prop_name, prop,
+                              qdev_prop_allow_set);
 }
 
 /**
@@ -911,7 +921,8 @@ void device_class_set_props(DeviceClass *dc, Property *props)
     dc->props_ = props;
     for (prop = props; prop && prop->qdev_prop_name; prop++) {
         qdev_class_add_legacy_property(dc, prop);
-        object_class_property_add_field(oc, prop->qdev_prop_name, prop);
+        object_class_property_add_field(oc, prop->qdev_prop_name, prop,
+                                        qdev_prop_allow_set);
     }
 }
 
-- 
2.28.0


