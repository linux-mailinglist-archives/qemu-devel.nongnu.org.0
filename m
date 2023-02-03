Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B97689295
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrj0-0001Ev-9W; Fri, 03 Feb 2023 03:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrht-0008Mt-1p
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007Uc-TP
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbZGXR4mYtpMCS59XpHpitYQEHadMU7jYo8NPQdiYaI=;
 b=UcdlP5klyTXDjGNJsPGsfqXI2WZVoEfOXkd89QU70/Dv7mV4rV7GJrsgy2mytwy3aXGWei
 /8dmPKx4l/19ygH+jfuucBtl0m+/5vFoGOnVOTXsF0bxf3fiIpAlVq41L+STFuwkgHsMZZ
 44iENtP3fp9PR3qRnE+pkKNgcX4RRYw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-JoR6I88qOdmJNOjq79t_qw-1; Fri, 03 Feb 2023 03:45:53 -0500
X-MC-Unique: JoR6I88qOdmJNOjq79t_qw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B142F29AA2E3;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B3740CF8EA;
 Fri,  3 Feb 2023 08:45:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CDE3221E6914; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 13/35] machine: Move HMP commands from monitor/ to hw/core/
Date: Fri,  3 Feb 2023 09:45:27 +0100
Message-Id: <20230203084549.2622302-14-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to "Machine core".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-11-armbru@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 208 ++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c         | 209 -------------------------------------
 2 files changed, 208 insertions(+), 209 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index a1a51e9778..c3e55ef9e9 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -134,3 +134,211 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
     qapi_free_MemdevList(memdev_list);
     hmp_handle_error(mon, err);
 }
+
+void hmp_info_kvm(Monitor *mon, const QDict *qdict)
+{
+    KvmInfo *info;
+
+    info = qmp_query_kvm(NULL);
+    monitor_printf(mon, "kvm support: ");
+    if (info->present) {
+        monitor_printf(mon, "%s\n", info->enabled ? "enabled" : "disabled");
+    } else {
+        monitor_printf(mon, "not compiled\n");
+    }
+
+    qapi_free_KvmInfo(info);
+}
+
+void hmp_info_uuid(Monitor *mon, const QDict *qdict)
+{
+    UuidInfo *info;
+
+    info = qmp_query_uuid(NULL);
+    monitor_printf(mon, "%s\n", info->UUID);
+    qapi_free_UuidInfo(info);
+}
+
+void hmp_info_balloon(Monitor *mon, const QDict *qdict)
+{
+    BalloonInfo *info;
+    Error *err = NULL;
+
+    info = qmp_query_balloon(&err);
+    if (hmp_handle_error(mon, err)) {
+        return;
+    }
+
+    monitor_printf(mon, "balloon: actual=%" PRId64 "\n", info->actual >> 20);
+
+    qapi_free_BalloonInfo(info);
+}
+
+void hmp_system_reset(Monitor *mon, const QDict *qdict)
+{
+    qmp_system_reset(NULL);
+}
+
+void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
+{
+    qmp_system_powerdown(NULL);
+}
+
+void hmp_memsave(Monitor *mon, const QDict *qdict)
+{
+    uint32_t size = qdict_get_int(qdict, "size");
+    const char *filename = qdict_get_str(qdict, "filename");
+    uint64_t addr = qdict_get_int(qdict, "val");
+    Error *err = NULL;
+    int cpu_index = monitor_get_cpu_index(mon);
+
+    if (cpu_index < 0) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+
+    qmp_memsave(addr, size, filename, true, cpu_index, &err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_pmemsave(Monitor *mon, const QDict *qdict)
+{
+    uint32_t size = qdict_get_int(qdict, "size");
+    const char *filename = qdict_get_str(qdict, "filename");
+    uint64_t addr = qdict_get_int(qdict, "val");
+    Error *err = NULL;
+
+    qmp_pmemsave(addr, size, filename, &err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_system_wakeup(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_system_wakeup(&err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_nmi(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_inject_nmi(&err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_balloon(Monitor *mon, const QDict *qdict)
+{
+    int64_t value = qdict_get_int(qdict, "value");
+    Error *err = NULL;
+
+    qmp_balloon(value, &err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    MemoryDeviceInfoList *info_list = qmp_query_memory_devices(&err);
+    MemoryDeviceInfoList *info;
+    VirtioPMEMDeviceInfo *vpi;
+    VirtioMEMDeviceInfo *vmi;
+    MemoryDeviceInfo *value;
+    PCDIMMDeviceInfo *di;
+    SgxEPCDeviceInfo *se;
+
+    for (info = info_list; info; info = info->next) {
+        value = info->value;
+
+        if (value) {
+            switch (value->type) {
+            case MEMORY_DEVICE_INFO_KIND_DIMM:
+            case MEMORY_DEVICE_INFO_KIND_NVDIMM:
+                di = value->type == MEMORY_DEVICE_INFO_KIND_DIMM ?
+                     value->u.dimm.data : value->u.nvdimm.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               di->id ? di->id : "");
+                monitor_printf(mon, "  addr: 0x%" PRIx64 "\n", di->addr);
+                monitor_printf(mon, "  slot: %" PRId64 "\n", di->slot);
+                monitor_printf(mon, "  node: %" PRId64 "\n", di->node);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", di->size);
+                monitor_printf(mon, "  memdev: %s\n", di->memdev);
+                monitor_printf(mon, "  hotplugged: %s\n",
+                               di->hotplugged ? "true" : "false");
+                monitor_printf(mon, "  hotpluggable: %s\n",
+                               di->hotpluggable ? "true" : "false");
+                break;
+            case MEMORY_DEVICE_INFO_KIND_VIRTIO_PMEM:
+                vpi = value->u.virtio_pmem.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               vpi->id ? vpi->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vpi->memaddr);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", vpi->size);
+                monitor_printf(mon, "  memdev: %s\n", vpi->memdev);
+                break;
+            case MEMORY_DEVICE_INFO_KIND_VIRTIO_MEM:
+                vmi = value->u.virtio_mem.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               vmi->id ? vmi->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vmi->memaddr);
+                monitor_printf(mon, "  node: %" PRId64 "\n", vmi->node);
+                monitor_printf(mon, "  requested-size: %" PRIu64 "\n",
+                               vmi->requested_size);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", vmi->size);
+                monitor_printf(mon, "  max-size: %" PRIu64 "\n", vmi->max_size);
+                monitor_printf(mon, "  block-size: %" PRIu64 "\n",
+                               vmi->block_size);
+                monitor_printf(mon, "  memdev: %s\n", vmi->memdev);
+                break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               se->id ? se->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
+                monitor_printf(mon, "  node: %" PRId64 "\n", se->node);
+                monitor_printf(mon, "  memdev: %s\n", se->memdev);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        }
+    }
+
+    qapi_free_MemoryDeviceInfoList(info_list);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    GuidInfo *info = qmp_query_vm_generation_id(&err);
+    if (info) {
+        monitor_printf(mon, "%s\n", info->guid);
+    }
+    hmp_handle_error(mon, err);
+    qapi_free_GuidInfo(info);
+}
+
+void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    MemoryInfo *info = qmp_query_memory_size_summary(&err);
+    if (info) {
+        monitor_printf(mon, "base memory: %" PRIu64 "\n",
+                       info->base_memory);
+
+        if (info->has_plugged_memory) {
+            monitor_printf(mon, "plugged memory: %" PRIu64 "\n",
+                           info->plugged_memory);
+        }
+
+        qapi_free_MemoryInfo(info);
+    }
+    hmp_handle_error(mon, err);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c8ed59c281..1e41381e77 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -26,7 +26,6 @@
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-control.h"
-#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-net.h"
@@ -108,21 +107,6 @@ void hmp_info_version(Monitor *mon, const QDict *qdict)
     qapi_free_VersionInfo(info);
 }
 
-void hmp_info_kvm(Monitor *mon, const QDict *qdict)
-{
-    KvmInfo *info;
-
-    info = qmp_query_kvm(NULL);
-    monitor_printf(mon, "kvm support: ");
-    if (info->present) {
-        monitor_printf(mon, "%s\n", info->enabled ? "enabled" : "disabled");
-    } else {
-        monitor_printf(mon, "not compiled\n");
-    }
-
-    qapi_free_KvmInfo(info);
-}
-
 void hmp_info_status(Monitor *mon, const QDict *qdict)
 {
     StatusInfo *info;
@@ -142,15 +126,6 @@ void hmp_info_status(Monitor *mon, const QDict *qdict)
     qapi_free_StatusInfo(info);
 }
 
-void hmp_info_uuid(Monitor *mon, const QDict *qdict)
-{
-    UuidInfo *info;
-
-    info = qmp_query_uuid(NULL);
-    monitor_printf(mon, "%s\n", info->UUID);
-    qapi_free_UuidInfo(info);
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -469,21 +444,6 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
     qapi_free_MigrationParameters(params);
 }
 
-void hmp_info_balloon(Monitor *mon, const QDict *qdict)
-{
-    BalloonInfo *info;
-    Error *err = NULL;
-
-    info = qmp_query_balloon(&err);
-    if (hmp_handle_error(mon, err)) {
-        return;
-    }
-
-    monitor_printf(mon, "balloon: actual=%" PRId64 "\n", info->actual >> 20);
-
-    qapi_free_BalloonInfo(info);
-}
-
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
 {
     InterruptStatsProvider *intc;
@@ -598,16 +558,6 @@ void hmp_sync_profile(Monitor *mon, const QDict *qdict)
     }
 }
 
-void hmp_system_reset(Monitor *mon, const QDict *qdict)
-{
-    qmp_system_reset(NULL);
-}
-
-void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
-{
-    qmp_system_powerdown(NULL);
-}
-
 void hmp_exit_preconfig(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
@@ -628,34 +578,6 @@ void hmp_cpu(Monitor *mon, const QDict *qdict)
     }
 }
 
-void hmp_memsave(Monitor *mon, const QDict *qdict)
-{
-    uint32_t size = qdict_get_int(qdict, "size");
-    const char *filename = qdict_get_str(qdict, "filename");
-    uint64_t addr = qdict_get_int(qdict, "val");
-    Error *err = NULL;
-    int cpu_index = monitor_get_cpu_index(mon);
-
-    if (cpu_index < 0) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-
-    qmp_memsave(addr, size, filename, true, cpu_index, &err);
-    hmp_handle_error(mon, err);
-}
-
-void hmp_pmemsave(Monitor *mon, const QDict *qdict)
-{
-    uint32_t size = qdict_get_int(qdict, "size");
-    const char *filename = qdict_get_str(qdict, "filename");
-    uint64_t addr = qdict_get_int(qdict, "val");
-    Error *err = NULL;
-
-    qmp_pmemsave(addr, size, filename, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_cont(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
@@ -664,22 +586,6 @@ void hmp_cont(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_system_wakeup(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    qmp_system_wakeup(&err);
-    hmp_handle_error(mon, err);
-}
-
-void hmp_nmi(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    qmp_inject_nmi(&err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_set_link(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_str(qdict, "name");
@@ -690,15 +596,6 @@ void hmp_set_link(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_balloon(Monitor *mon, const QDict *qdict)
-{
-    int64_t value = qdict_get_int(qdict, "value");
-    Error *err = NULL;
-
-    qmp_balloon(value, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_loadvm(Monitor *mon, const QDict *qdict)
 {
     int saved_vm_running  = runstate_is_running();
@@ -1193,83 +1090,6 @@ void hmp_object_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    MemoryDeviceInfoList *info_list = qmp_query_memory_devices(&err);
-    MemoryDeviceInfoList *info;
-    VirtioPMEMDeviceInfo *vpi;
-    VirtioMEMDeviceInfo *vmi;
-    MemoryDeviceInfo *value;
-    PCDIMMDeviceInfo *di;
-    SgxEPCDeviceInfo *se;
-
-    for (info = info_list; info; info = info->next) {
-        value = info->value;
-
-        if (value) {
-            switch (value->type) {
-            case MEMORY_DEVICE_INFO_KIND_DIMM:
-            case MEMORY_DEVICE_INFO_KIND_NVDIMM:
-                di = value->type == MEMORY_DEVICE_INFO_KIND_DIMM ?
-                     value->u.dimm.data : value->u.nvdimm.data;
-                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
-                               MemoryDeviceInfoKind_str(value->type),
-                               di->id ? di->id : "");
-                monitor_printf(mon, "  addr: 0x%" PRIx64 "\n", di->addr);
-                monitor_printf(mon, "  slot: %" PRId64 "\n", di->slot);
-                monitor_printf(mon, "  node: %" PRId64 "\n", di->node);
-                monitor_printf(mon, "  size: %" PRIu64 "\n", di->size);
-                monitor_printf(mon, "  memdev: %s\n", di->memdev);
-                monitor_printf(mon, "  hotplugged: %s\n",
-                               di->hotplugged ? "true" : "false");
-                monitor_printf(mon, "  hotpluggable: %s\n",
-                               di->hotpluggable ? "true" : "false");
-                break;
-            case MEMORY_DEVICE_INFO_KIND_VIRTIO_PMEM:
-                vpi = value->u.virtio_pmem.data;
-                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
-                               MemoryDeviceInfoKind_str(value->type),
-                               vpi->id ? vpi->id : "");
-                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vpi->memaddr);
-                monitor_printf(mon, "  size: %" PRIu64 "\n", vpi->size);
-                monitor_printf(mon, "  memdev: %s\n", vpi->memdev);
-                break;
-            case MEMORY_DEVICE_INFO_KIND_VIRTIO_MEM:
-                vmi = value->u.virtio_mem.data;
-                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
-                               MemoryDeviceInfoKind_str(value->type),
-                               vmi->id ? vmi->id : "");
-                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vmi->memaddr);
-                monitor_printf(mon, "  node: %" PRId64 "\n", vmi->node);
-                monitor_printf(mon, "  requested-size: %" PRIu64 "\n",
-                               vmi->requested_size);
-                monitor_printf(mon, "  size: %" PRIu64 "\n", vmi->size);
-                monitor_printf(mon, "  max-size: %" PRIu64 "\n", vmi->max_size);
-                monitor_printf(mon, "  block-size: %" PRIu64 "\n",
-                               vmi->block_size);
-                monitor_printf(mon, "  memdev: %s\n", vmi->memdev);
-                break;
-            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
-                se = value->u.sgx_epc.data;
-                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
-                               MemoryDeviceInfoKind_str(value->type),
-                               se->id ? se->id : "");
-                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
-                monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
-                monitor_printf(mon, "  node: %" PRId64 "\n", se->node);
-                monitor_printf(mon, "  memdev: %s\n", se->memdev);
-                break;
-            default:
-                g_assert_not_reached();
-            }
-        }
-    }
-
-    qapi_free_MemoryDeviceInfoList(info_list);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict)
 {
     IOThreadInfoList *info_list = qmp_query_iothreads(NULL);
@@ -1585,35 +1405,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
     qapi_free_RockerOfDpaGroupList(list);
 }
 
-void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    GuidInfo *info = qmp_query_vm_generation_id(&err);
-    if (info) {
-        monitor_printf(mon, "%s\n", info->guid);
-    }
-    hmp_handle_error(mon, err);
-    qapi_free_GuidInfo(info);
-}
-
-void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    MemoryInfo *info = qmp_query_memory_size_summary(&err);
-    if (info) {
-        monitor_printf(mon, "base memory: %" PRIu64 "\n",
-                       info->base_memory);
-
-        if (info->has_plugged_memory) {
-            monitor_printf(mon, "plugged memory: %" PRIu64 "\n",
-                           info->plugged_memory);
-        }
-
-        qapi_free_MemoryInfo(info);
-    }
-    hmp_handle_error(mon, err);
-}
-
 static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
 {
     const char *unit = NULL;
-- 
2.39.0


