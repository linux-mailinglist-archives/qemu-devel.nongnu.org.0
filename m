Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE792D8241
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:41:44 +0100 (CET)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knr6d-0001iD-1l
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqZu-00031u-Dk
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqZV-0006kz-TQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pRVeBJC73oB1ZWLMle2oyb31+GPywq6tYIYiTT22tXA=;
 b=H48o4IAPb0Et8FKL4PbTQ61RUJd2sYG0sRNsKZ3EPn3berwtlMcuL3wLEgdxgTz1PPO40U
 W2uvDpZE46Lms073560KvwCZ/XADZez9qIfcAXT7KRyUP+89CO9uQxAOUXI40XnWH3MgwF
 z5mzzEix4IMIZdDjpUdOiRQnCghrjVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-1SMZKi9sNR2EGNmTtTLeDA-1; Fri, 11 Dec 2020 17:07:27 -0500
X-MC-Unique: 1SMZKi9sNR2EGNmTtTLeDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71607800D62;
 Fri, 11 Dec 2020 22:07:25 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0215B19C78;
 Fri, 11 Dec 2020 22:07:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/32] qdev: Separate generic and device-specific property
 registration
Date: Fri, 11 Dec 2020 17:05:23 -0500
Message-Id: <20201211220529.2290218-27-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_class_add_property() and qdev_property_add_static() will
have code that's specific for device types.

object_class_property_add_field_static() and
object_property_add_field() will be generic and part of the QOM
field property API.  Note that the new functions have a `name`
parameter because the plan is to eventually get rid of the
Property.name field.

The declarations for the new functions are being added to
qdev-properties-internal.h, but they will be moved to a QOM
header later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Re-added array-based array registration function, named
  as object_class_add_field_properties()
* Renamed object_class_property_add_field() to
  object_class_property_add_field_static(), to indicate that
  the function expect the Property argument to have static life
  time.
* Keep all new functions as internal API by now,
  until we decide what's going to be the preferred API for
  registering class field properties.

Changes v1 -> v2:
* Patch redone after changes in previous patches in the series
* Rename new functions to object*_property_add_field()
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-prop-internal.h | 42 ++++++++++++++++++++++++++++++++++++
 hw/core/qdev-properties.c    | 37 ++++++++++++++++++++++++-------
 2 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
index d7b77844fe..6f17ddf271 100644
--- a/hw/core/qdev-prop-internal.h
+++ b/hw/core/qdev-prop-internal.h
@@ -25,4 +25,46 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp);
 
+/**
+ * object_property_add_field: Add a field property to an object instance
+ * @obj: object instance
+ * @name: property name
+ * @prop: property definition
+ *
+ * This function should not be used in new code.  Please add class properties
+ * instead, using object_class_add_field().
+ */
+ObjectProperty *
+object_property_add_field(Object *obj, const char *name,
+                          Property *prop);
+
+/**
+ * object_class_property_add_field_static: Add a field property to object class
+ * @oc: object class
+ * @name: property name
+ * @prop: property definition
+ *
+ * Add a field property to an object class.  A field property is
+ * a property that will change a field at a specific offset of the
+ * object instance struct.
+ *
+ * *@prop must have static life time.
+ */
+ObjectProperty *
+object_class_property_add_field_static(ObjectClass *oc, const char *name,
+                                       Property *prop);
+
+/**
+ * object_class_add_field_properties: Add field properties from array to a class
+ * @oc: object class
+ * @props: array of property definitions
+ *
+ * Register an array of field properties to a class, using
+ * object_class_property_add_field_static() for each array element.
+ *
+ * The array at @props must end with DEFINE_PROP_END_OF_LIST(), and
+ * must have static life time.
+ */
+void object_class_add_field_properties(ObjectClass *oc, Property *props);
+
 #endif
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index fcda0c8f4b..8436b60ec4 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -835,20 +835,21 @@ const PropertyInfo qdev_prop_link = {
     .create = create_link_property,
 };
 
-void qdev_property_add_static(DeviceState *dev, Property *prop)
+ObjectProperty *
+object_property_add_field(Object *obj, const char *name,
+                          Property *prop)
 {
-    Object *obj = OBJECT(dev);
     ObjectProperty *op;
 
     assert(!prop->info->create);
 
-    op = object_property_add(obj, prop->name, prop->info->name,
+    op = object_property_add(obj, name, prop->info->name,
                              field_prop_getter(prop->info),
                              field_prop_setter(prop->info),
                              prop->info->release,
                              prop);
 
-    object_property_set_description(obj, prop->name,
+    object_property_set_description(obj, name,
                                     prop->info->description);
 
     if (prop->set_default) {
@@ -857,12 +858,14 @@ void qdev_property_add_static(DeviceState *dev, Property *prop)
             op->init(obj, op);
         }
     }
+
+    return op;
 }
 
-static void qdev_class_add_property(DeviceClass *klass, const char *name,
-                                    Property *prop)
+ObjectProperty *
+object_class_property_add_field_static(ObjectClass *oc, const char *name,
+                                       Property *prop)
 {
-    ObjectClass *oc = OBJECT_CLASS(klass);
     ObjectProperty *op;
 
     if (prop->info->create) {
@@ -882,6 +885,22 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
         object_class_property_set_description(oc, name,
                                               prop->info->description);
     }
+    return op;
+}
+
+void object_class_add_field_properties(ObjectClass *oc, Property *props)
+{
+    Property *prop;
+
+    for (prop = props; prop && prop->name; prop++) {
+        object_class_property_add_field_static(oc, prop->name, prop);
+    }
+}
+
+
+void qdev_property_add_static(DeviceState *dev, Property *prop)
+{
+    object_property_add_field(OBJECT(dev), prop->name, prop);
 }
 
 /**
@@ -932,13 +951,15 @@ static void qdev_class_add_legacy_property(DeviceClass *dc, Property *prop)
 
 void device_class_set_props(DeviceClass *dc, Property *props)
 {
+    ObjectClass *oc = OBJECT_CLASS(dc);
     Property *prop;
 
     dc->props_ = props;
     for (prop = props; prop && prop->name; prop++) {
         qdev_class_add_legacy_property(dc, prop);
-        qdev_class_add_property(dc, prop->name, prop);
     }
+
+    object_class_add_field_properties(oc, props);
 }
 
 void qdev_alias_all_properties(DeviceState *target, Object *source)
-- 
2.28.0


