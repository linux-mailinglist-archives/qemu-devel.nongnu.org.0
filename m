Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8A2B10C9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:59:31 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKcs-0006EI-DB
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPZ-0006ck-DF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPX-0003Wj-Jl
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYld01Z63IvWlKMUi8NoC+O1zrbx+yCYFq9I1YV7iWs=;
 b=Ut5etrSQrAEDS+bREPoY9g5CyAERY4mSKPslbKk4ob5E2ku1TqCQO0kZsuaLUzdBPiqtSs
 mEQW2F8LDW61JOII+PzFN6IflZ0wd4MqQ8mhJMW5PkblGrZyqUd5dbD066iQ/LUtTjo1EU
 YTupqEcoUsWEupW63eCgfD13/rrRTiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-_jPE_hIUP9S2dpINJHiOcg-1; Thu, 12 Nov 2020 16:45:39 -0500
X-MC-Unique: _jPE_hIUP9S2dpINJHiOcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912F6803F4A;
 Thu, 12 Nov 2020 21:45:38 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F19E5C1C2;
 Thu, 12 Nov 2020 21:45:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/53] qdev: Wrap getters and setters in separate helpers
Date: Thu, 12 Nov 2020 16:43:19 -0500
Message-Id: <20201112214350.872250-23-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

We'll add extra code to the qdev property getters and setters, so
add wrapper functions where additional actions can be performed.

The new functions have a "field_prop_" prefix instead of "qdev_"
because the code will eventually be moved outside
qdev-properties.c, to common QOM code.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Redone after changes in previous patches in the series
* Renamed functions from static_prop_* to field_prop_*
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 44 +++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index c68a20695d..b924f13d58 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -44,6 +44,40 @@ void *qdev_get_prop_ptr(Object *obj, Property *prop)
     return ptr;
 }
 
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
 void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -630,8 +664,8 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
         assert(qdev_get_prop_ptr(obj, &arrayprop->prop) == eltptr);
         object_property_add(obj, propname,
                             arrayprop->prop.info->name,
-                            arrayprop->prop.info->get,
-                            arrayprop->prop.info->set,
+                            field_prop_getter(arrayprop->prop.info),
+                            field_prop_setter(arrayprop->prop.info),
                             array_element_release,
                             arrayprop);
     }
@@ -873,7 +907,8 @@ void qdev_property_add_static(DeviceState *dev, Property *prop)
     assert(!prop->info->create);
 
     op = object_property_add(obj, prop->name, prop->info->name,
-                             prop->info->get, prop->info->set,
+                             field_prop_getter(prop->info),
+                             field_prop_setter(prop->info),
                              prop->info->release,
                              prop);
 
@@ -900,7 +935,8 @@ static void qdev_class_add_property(DeviceClass *klass, const char *name,
 
         op = object_class_property_add(oc,
                                        name, prop->info->name,
-                                       prop->info->get, prop->info->set,
+                                       field_prop_getter(prop->info),
+                                       field_prop_setter(prop->info),
                                        prop->info->release,
                                        prop);
         if (prop->set_default) {
-- 
2.28.0


