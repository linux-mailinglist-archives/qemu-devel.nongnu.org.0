Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA52B10D1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:02:06 +0100 (CET)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKfN-00018Z-UM
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQW-0007pp-RF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQU-0003eg-Lx
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o06R55ognNI3XqY7AQAxRz9X3TJ+kD+GHt0FxNbg4Qw=;
 b=OFCJWIh8MnYTYYI6SnQ+zsvQMqtW+buqkDq/tgG41IWdEbPnU1QtHcE0STOETW9+3DjMmG
 7sFo8zYksA0voWOTDLzFjRDyJ/F5nnscL+yWuHtMw44f6Gj4pgpG3Kko8WDX29HyTMeVQt
 sL88sFisGfSrT9YK4kaLKWsjN7bhvnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-1Zd28WJXN9K8GafW45fp5A-1; Thu, 12 Nov 2020 16:46:36 -0500
X-MC-Unique: 1Zd28WJXN9K8GafW45fp5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 873A51074643;
 Thu, 12 Nov 2020 21:46:35 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 181941002382;
 Thu, 12 Nov 2020 21:46:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/53] qdev: Rename Property.name to Property.name_template
Date: Thu, 12 Nov 2020 16:43:32 -0500
Message-Id: <20201112214350.872250-36-ehabkost@redhat.com>
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

The Property.name field won't always be set, but it is very
easy to miss this detail when we see code using prop->name.

Rename the field to "name_template", to indicate it is just a
template used when creating new properties in some cases, but is
not always set.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Change name from .qdev_prop_name to .name_template.
  The property won't be qdev-specific, but it won't
  be always set.

This is a patch added in v2 of the series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h | 11 +++++++++--
 hw/core/qdev-properties.c    | 23 ++++++++++++-----------
 softmmu/qdev-monitor.c       |  8 ++++----
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 97bb9494ae..1208e12b9b 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -13,7 +13,14 @@
  *     is true.
  */
 struct Property {
-    const char   *name;
+    /**
+     * @name_template: Property name template
+     *
+     * This is a string containing the template to be used when
+     * creating the property.  It can be NULL, and code shouldn't
+     * assume it will contain the actual property name.
+     */
+    const char   *name_template;
     const PropertyInfo *info;
     ptrdiff_t    offset;
     uint8_t      bitnr;
@@ -62,7 +69,7 @@ extern const PropertyInfo prop_info_arraylen;
 extern const PropertyInfo prop_info_link;
 
 #define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
-        .name      = (_name),                                    \
+        .name_template = (_name),                           \
         .info      = &(_prop),                                   \
         .offset    = offsetof(_state, _field)                    \
             + type_check(_type, typeof_field(_state, _field)),   \
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 638daf1ebf..03cfad1e74 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -593,7 +593,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
         arrayprop->release = prop->arrayinfo->release;
         arrayprop->propname = propname;
         arrayprop->prop.info = prop->arrayinfo;
-        arrayprop->prop.name = propname;
+        arrayprop->prop.name_template = propname;
         /* This ugly piece of pointer arithmetic sets up the offset so
          * that when the underlying get/set hooks call qdev_get_prop_ptr
          * they get the right answer despite the array element not actually
@@ -625,8 +625,8 @@ static Property *qdev_prop_walk(Property *props, const char *name)
     if (!props) {
         return NULL;
     }
-    while (props->name) {
-        if (strcmp(props->name, name) == 0) {
+    while (props->name_template) {
+        if (strcmp(props->name_template, name) == 0) {
             return props;
         }
         props++;
@@ -903,15 +903,16 @@ void object_class_add_field_properties(ObjectClass *oc, Property *props,
 {
     Property *prop;
 
-    for (prop = props; prop && prop->name; prop++) {
-        object_class_property_add_field_static(oc, prop->name, prop, allow_set);
+    for (prop = props; prop && prop->name_template; prop++) {
+        object_class_property_add_field_static(oc, prop->name_template, prop,
+                                               allow_set);
     }
 }
 
 
 void qdev_property_add_static(DeviceState *dev, Property *prop)
 {
-    object_property_add_field(OBJECT(dev), prop->name, prop,
+    object_property_add_field(OBJECT(dev), prop->name_template, prop,
                               qdev_prop_allow_set);
 }
 
@@ -955,7 +956,7 @@ static void qdev_class_add_legacy_property(DeviceClass *dc, Property *prop)
         return;
     }
 
-    name = g_strdup_printf("legacy-%s", prop->name);
+    name = g_strdup_printf("legacy-%s", prop->name_template);
     object_class_property_add(OBJECT_CLASS(dc), name, "str",
         prop->info->print ? qdev_get_legacy_property : prop->info->get,
         NULL, NULL, prop);
@@ -967,7 +968,7 @@ void device_class_set_props(DeviceClass *dc, Property *props)
     Property *prop;
 
     dc->props_ = props;
-    for (prop = props; prop && prop->name; prop++) {
+    for (prop = props; prop && prop->name_template; prop++) {
         qdev_class_add_legacy_property(dc, prop);
     }
 
@@ -983,9 +984,9 @@ void qdev_alias_all_properties(DeviceState *target, Object *source)
     do {
         DeviceClass *dc = DEVICE_CLASS(class);
 
-        for (prop = dc->props_; prop && prop->name; prop++) {
-            object_property_add_alias(source, prop->name,
-                                      OBJECT(target), prop->name);
+        for (prop = dc->props_; prop && prop->name_template; prop++) {
+            object_property_add_alias(source, prop->name_template,
+                                      OBJECT(target), prop->name_template);
         }
         class = object_class_get_parent(class);
     } while (class != object_class_by_name(TYPE_DEVICE));
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 79164e4a3f..0d196a169a 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -697,14 +697,14 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
 {
     if (!props)
         return;
-    for (; props->name; props++) {
+    for (; props->name_template; props++) {
         char *value;
-        char *legacy_name = g_strdup_printf("legacy-%s", props->name);
+        char *legacy_name = g_strdup_printf("legacy-%s", props->name_template);
 
         if (object_property_get_type(OBJECT(dev), legacy_name, NULL)) {
             value = object_property_get_str(OBJECT(dev), legacy_name, NULL);
         } else {
-            value = object_property_print(OBJECT(dev), props->name, true,
+            value = object_property_print(OBJECT(dev), props->name_template, true,
                                           NULL);
         }
         g_free(legacy_name);
@@ -712,7 +712,7 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
         if (!value) {
             continue;
         }
-        qdev_printf("%s = %s\n", props->name,
+        qdev_printf("%s = %s\n", props->name_template,
                     *value ? value : "<null>");
         g_free(value);
     }
-- 
2.28.0


