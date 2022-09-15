Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE845BA218
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:58:50 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvwf-0007pZ-69
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhx-00025l-Ov
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhn-0000JS-Hn
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TIQr4wGTLUj/gvzRXbDPOc7k72ptHR46xaJrdpoSMo=;
 b=T9g67S0voHxg/v2KmbwHNZy2MUJOgDJZG3NaFzuMyQ7DpYNgm+FTwPf9hMYsOSaUecJto2
 g8iUPhMoWYhhq58ycSlhpt0it9NecuxEwwEYdao5/qKNk/AmtSV1a3O9GGOIMS3V3rQ5FI
 s4i6i0HawfdFVrFEew0Cy0dy1o1Zbxs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-_FETtaVcONm268V0Idn7KA-1; Thu, 15 Sep 2022 16:43:23 -0400
X-MC-Unique: _FETtaVcONm268V0Idn7KA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB6F4386FC6C;
 Thu, 15 Sep 2022 20:43:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A85E117595;
 Thu, 15 Sep 2022 20:43:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D59721E66F5; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 18/27] qapi qdev qom: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:43:08 +0200
Message-Id: <20220915204317.3766007-19-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 tests/qtest/fuzz/qos_fuzz.c | 3 +--
 scripts/qapi/schema.py      | 2 --
 7 files changed, 6 insertions(+), 15 deletions(-)

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
index fb790b61e4..b5f638a090 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3725,7 +3725,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
 
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
index b2a568e12d..d92fd3b4d6 100644
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
2.37.2


