Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2D619CA5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzF6-0000xG-2H; Fri, 04 Nov 2022 12:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEN-0008Fm-I1
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzE9-0007eE-2v
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1IggsZyH4Ol2eRJHUFw9yXIg9h1Vj0mCfmiyokG1Pw=;
 b=Gl4ghEY7AXeflNR8TaW23Mdz9aT8cUgpf2XjXeO2mWUb94KFlKsbcD9zu9kvDJHvVCowKY
 a6EmOZwCUtcxLoCR1/pbmmVW/MfTjgeffQvKz60geezYAo/1+P9fdWaGNMadhxZlBgjh9G
 4T68+TJr5xMoj91rBgbrYQJkks7ij5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-7Vf9gdEuNF2dak0aa9UuyQ-1; Fri, 04 Nov 2022 12:07:16 -0400
X-MC-Unique: 7Vf9gdEuNF2dak0aa9UuyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47ED4101A5BB;
 Fri,  4 Nov 2022 16:07:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1CB3400EA84;
 Fri,  4 Nov 2022 16:07:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 645F721E61B4; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 20/30] qapi qdev qom: Elide redundant has_FOO in generated C
Date: Fri,  4 Nov 2022 17:07:02 +0100
Message-Id: <20221104160712.3005652-21-armbru@redhat.com>
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/qdev.json and
qapi/qom.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/acpi/memory_hotplug.c    | 2 +-
 hw/core/qdev.c              | 2 +-
 hw/ppc/spapr.c              | 2 +-
 hw/ppc/spapr_drc.c          | 3 +--
 qom/qom-qmp-cmds.c          | 7 +------
 stubs/qdev.c                | 6 ++----
 tests/qtest/fuzz/qos_fuzz.c | 3 +--
 scripts/qapi/schema.py      | 2 --
 8 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index a7476330a8..d926f4f77d 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -185,7 +185,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
                  */
                 qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
-                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+                qapi_event_send_device_unplug_guest_error(dev->id,
                                                           dev->canonical_path);
                 error_free(local_err);
                 break;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0806d8fcaa..459266aceb 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -744,7 +744,7 @@ static void device_finalize(Object *obj)
     if (dev->pending_deleted_event) {
         g_assert(dev->canonical_path);
 
-        qapi_event_send_device_deleted(!!dev->id, dev->id, dev->canonical_path);
+        qapi_event_send_device_deleted(dev->id, dev->canonical_path);
         g_free(dev->canonical_path);
         dev->canonical_path = NULL;
     }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 66b414d2e9..dc850032ae 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3728,7 +3728,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
 
     qapi_event_send_mem_unplug_error(dev->id ? : "", qapi_error);
 
-    qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+    qapi_event_send_device_unplug_guest_error(dev->id,
                                               dev->canonical_path);
 }
 
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 76bc5d42a0..4923435a8b 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -175,8 +175,7 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
                              "for device %s", drc->dev->id);
             }
 
-            qapi_event_send_device_unplug_guest_error(!!drc->dev->id,
-                                                      drc->dev->id,
+            qapi_event_send_device_unplug_guest_error(drc->dev->id,
                                                       drc->dev->canonical_path);
         }
 
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 2e63a4c184..7c087299de 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -99,15 +99,13 @@ static void qom_list_types_tramp(ObjectClass *klass, void *data)
     info->name = g_strdup(object_class_get_name(klass));
     info->has_abstract = info->abstract = object_class_is_abstract(klass);
     if (parent) {
-        info->has_parent = true;
         info->parent = g_strdup(object_class_get_name(parent));
     }
 
     QAPI_LIST_PREPEND(*pret, info);
 }
 
-ObjectTypeInfoList *qmp_qom_list_types(bool has_implements,
-                                       const char *implements,
+ObjectTypeInfoList *qmp_qom_list_types(const char *implements,
                                        bool has_abstract,
                                        bool abstract,
                                        Error **errp)
@@ -168,10 +166,8 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
         info = g_new0(ObjectPropertyInfo, 1);
         info->name = g_strdup(prop->name);
         info->type = g_strdup(prop->type);
-        info->has_description = !!prop->description;
         info->description = g_strdup(prop->description);
         info->default_value = qobject_ref(prop->defval);
-        info->has_default_value = !!info->default_value;
 
         QAPI_LIST_PREPEND(prop_list, info);
     }
@@ -215,7 +211,6 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         info = g_malloc0(sizeof(*info));
         info->name = g_strdup(prop->name);
         info->type = g_strdup(prop->type);
-        info->has_description = !!prop->description;
         info->description = g_strdup(prop->description);
 
         QAPI_LIST_PREPEND(prop_list, info);
diff --git a/stubs/qdev.c b/stubs/qdev.c
index 187659f707..6869f6f90a 100644
--- a/stubs/qdev.c
+++ b/stubs/qdev.c
@@ -15,15 +15,13 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-events-qdev.h"
 
-void qapi_event_send_device_deleted(bool has_device,
-                                    const char *device,
+void qapi_event_send_device_deleted(const char *device,
                                     const char *path)
 {
     /* Nothing to do. */
 }
 
-void qapi_event_send_device_unplug_guest_error(bool has_device,
-                                               const char *device,
+void qapi_event_send_device_unplug_guest_error(const char *device,
                                                const char *path)
 {
     /* Nothing to do. */
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 3a3d9c16dd..e403d373a0 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -50,8 +50,7 @@ static void qos_set_machines_devices_available(void)
     machines_apply_to_node(mach_info);
     qapi_free_MachineInfoList(mach_info);
 
-    type_info = qmp_qom_list_types(true, "device", true, true,
-                                   &error_abort);
+    type_info = qmp_qom_list_types("device", true, true, &error_abort);
     types_apply_to_node(type_info);
     qapi_free_ObjectTypeInfoList(type_info);
 }
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 388b90812b..c74c26bda3 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,8 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/qdev.json',
-            'qapi/qom.json',
             'qapi/replay.json',
             'qapi/rocker.json',
             'qapi/run-state.json',
-- 
2.37.3


