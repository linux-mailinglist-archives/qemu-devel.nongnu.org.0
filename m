Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A01D45A0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 08:12:19 +0200 (CEST)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZTZy-00064K-E8
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 02:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTSU-00034V-2U
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:04:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56982
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jZTSS-0004Qv-7h
 for qemu-devel@nongnu.org; Fri, 15 May 2020 02:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589522671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37Zp7qL37JaC+FZoBsIzyxCoMjerBgsflfKh6FLmyGU=;
 b=eRjYjMEXH5yyBxzXzOtRdAldB0fkrESc2RKk985jQMfJ5IrG1PO8DEyRoOLQHiYhW9IP71
 LQwwRflHX2LhXNoeIwjISJ4/WTAzOwuzYNsnM0eRvekIK8So3n6IYay8cj2067FmtpjZKB
 LuTm6OygJ47UiI8qGK6QoJZ3Ps93qQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-JCkpFXqCOi6j-shp8MjOcQ-1; Fri, 15 May 2020 02:04:29 -0400
X-MC-Unique: JCkpFXqCOi6j-shp8MjOcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 270348015CF
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 06:04:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C47AD1001B07;
 Fri, 15 May 2020 06:04:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B6B811358CF; Fri, 15 May 2020 08:04:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] qom: Drop @errp parameter of object_property_del()
Date: Fri, 15 May 2020 08:04:21 +0200
Message-Id: <20200515060424.18993-19-armbru@redhat.com>
In-Reply-To: <20200515060424.18993-1-armbru@redhat.com>
References: <20200515060424.18993-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same story as for object_property_add(): the only way
object_property_del() can fail is when the property with this name
does not exist.  Since our property names are all hardcoded, failure
is a programming error, and the appropriate way to handle it is
passing &error_abort.  Most callers do that, the commit before
previous fixed one that didn't (and got the error handling wrong), and
the two remaining exceptions ignore errors.

Drop the @errp parameter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200505152926.18877-19-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h       | 2 +-
 hw/core/qdev.c             | 2 +-
 hw/i386/pc_sysfw.c         | 2 +-
 hw/ppc/spapr_drc.c         | 4 ++--
 qom/object.c               | 7 +------
 qom/object_interfaces.c    | 3 +--
 tests/check-qom-proplist.c | 2 +-
 7 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 990e28e408..fd453dc8d6 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1047,7 +1047,7 @@ ObjectProperty *object_property_add(Object *obj, const char *name,
                                     ObjectPropertyRelease *release,
                                     void *opaque);
 
-void object_property_del(Object *obj, const char *name, Error **errp);
+void object_property_del(Object *obj, const char *name);
 
 ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           const char *type,
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b9c7a2f904..9e5538aeae 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -65,7 +65,7 @@ static void bus_remove_child(BusState *bus, DeviceState *child)
             bus->num_children--;
 
             /* This gives back ownership of kid->child back to us.  */
-            object_property_del(OBJECT(bus), name, NULL);
+            object_property_del(OBJECT(bus), name);
             object_unref(OBJECT(kid->child));
             g_free(kid);
             return;
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 002133a2d8..2abab3a27c 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -120,7 +120,7 @@ static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
         dev_obj = OBJECT(pcms->flash[i]);
         if (!object_property_get_bool(dev_obj, "realized", &error_abort)) {
             prop_name = g_strdup_printf("pflash%d", i);
-            object_property_del(OBJECT(pcms), prop_name, &error_abort);
+            object_property_del(OBJECT(pcms), prop_name);
             g_free(prop_name);
             object_unparent(dev_obj);
             pcms->flash[i] = NULL;
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8b2171f698..b958f8acb5 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -405,7 +405,7 @@ static void spapr_drc_release(SpaprDrc *drc)
     g_free(drc->fdt);
     drc->fdt = NULL;
     drc->fdt_start_offset = 0;
-    object_property_del(OBJECT(drc), "device", &error_abort);
+    object_property_del(OBJECT(drc), "device");
     drc->dev = NULL;
 }
 
@@ -551,7 +551,7 @@ static void unrealize(DeviceState *d)
     vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
     name = g_strdup_printf("%x", spapr_drc_index(drc));
-    object_property_del(root_container, name, &error_abort);
+    object_property_del(root_container, name);
     g_free(name);
 }
 
diff --git a/qom/object.c b/qom/object.c
index 23f481ca46..e89ffbe3d1 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1280,15 +1280,10 @@ ObjectProperty *object_class_property_find(ObjectClass *klass, const char *name,
     return prop;
 }
 
-void object_property_del(Object *obj, const char *name, Error **errp)
+void object_property_del(Object *obj, const char *name)
 {
     ObjectProperty *prop = g_hash_table_lookup(obj->properties, name);
 
-    if (!prop) {
-        error_setg(errp, "Property '.%s' not found", name);
-        return;
-    }
-
     if (prop->release) {
         prop->release(obj, name, prop->opaque);
     }
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 054e75043d..7e26f86fa6 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -89,8 +89,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
     user_creatable_complete(USER_CREATABLE(obj), &local_err);
     if (local_err) {
         if (id != NULL) {
-            object_property_del(object_get_objects_root(),
-                                id, &error_abort);
+            object_property_del(object_get_objects_root(), id);
         }
         goto out;
     }
diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 84f48fe592..13a824cfae 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -280,7 +280,7 @@ static void dummy_bus_init(Object *obj)
 static void dummy_bus_unparent(Object *obj)
 {
     DummyBus *bus = DUMMY_BUS(obj);
-    object_property_del(obj->parent, "backend", NULL);
+    object_property_del(obj->parent, "backend");
     object_unparent(OBJECT(bus->backend));
 }
 
-- 
2.21.1


