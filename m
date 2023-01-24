Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BC6797D2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:22:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIJl-0003Mn-2n; Tue, 24 Jan 2023 07:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHf-00024e-Ru
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHN-0006SS-IG
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xl9VN2Bo+2zgO49Q5/jRjujXcnTAuyQLJU7ExAQvLp8=;
 b=ZWeEM1+JrEqD/fZpKOP/HF8G2qtymS7ETX6akP0SjcWNiqCoyqB1oF/9w3+7w0MWpEuB6V
 qEguXC5M92aa0TBTI1Lb3urDAbO6U0SHycZwzG/6Lo6/AhMHcS/Cj8303VQ8aMwS+Tya3e
 iNklt97rXKpAcbq3cwyJulWfIjldI/o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-0a5Re_BZOfKTgA0mIxxYVw-1; Tue, 24 Jan 2023 07:19:50 -0500
X-MC-Unique: 0a5Re_BZOfKTgA0mIxxYVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 926D438123A0;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F5A2166B26;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C47921E6900; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 09/32] machine: Move QMP commands from monitor/ to hw/core/
Date: Tue, 24 Jan 2023 13:19:23 +0100
Message-Id: <20230124121946.1139465-10-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This moves these commands from MAINTAINERS section "QMP" to "Machine
core".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 144 +++++++++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c         | 140 ------------------------------------
 2 files changed, 144 insertions(+), 140 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 80d5e59651..44b5da8880 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -9,6 +9,9 @@
 
 #include "qemu/osdep.h"
 #include "hw/boards.h"
+#include "hw/intc/intc.h"
+#include "hw/mem/memory-device.h"
+#include "hw/rdma/rdma.h"
 #include "qapi/error.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-machine.h"
@@ -17,11 +20,13 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
 #include "qemu/main-loop.h"
+#include "qemu/uuid.h"
 #include "qom/qom-qobject.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
 
 static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
 {
@@ -239,3 +244,142 @@ HumanReadableText *qmp_x_query_numa(Error **errp)
  done:
     return human_readable_text_from_str(buf);
 }
+
+KvmInfo *qmp_query_kvm(Error **errp)
+{
+    KvmInfo *info = g_malloc0(sizeof(*info));
+
+    info->enabled = kvm_enabled();
+    info->present = accel_find("kvm");
+
+    return info;
+}
+
+UuidInfo *qmp_query_uuid(Error **errp)
+{
+    UuidInfo *info = g_malloc0(sizeof(*info));
+
+    info->UUID = qemu_uuid_unparse_strdup(&qemu_uuid);
+    return info;
+}
+
+void qmp_system_reset(Error **errp)
+{
+    qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET);
+}
+
+void qmp_system_powerdown(Error **errp)
+{
+    qemu_system_powerdown_request();
+}
+
+void qmp_system_wakeup(Error **errp)
+{
+    if (!qemu_wakeup_suspend_enabled()) {
+        error_setg(errp,
+                   "wake-up from suspend is not supported by this guest");
+        return;
+    }
+
+    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
+}
+
+MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
+{
+    return qmp_memory_device_list();
+}
+
+MemoryInfo *qmp_query_memory_size_summary(Error **errp)
+{
+    MemoryInfo *mem_info = g_new0(MemoryInfo, 1);
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    mem_info->base_memory = ms->ram_size;
+
+    mem_info->plugged_memory = get_plugged_memory_size();
+    mem_info->has_plugged_memory =
+        mem_info->plugged_memory != (uint64_t)-1;
+
+    return mem_info;
+}
+
+static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
+{
+    RdmaProvider *rdma;
+    RdmaProviderClass *k;
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, INTERFACE_RDMA_PROVIDER)) {
+        rdma = RDMA_PROVIDER(obj);
+        k = RDMA_PROVIDER_GET_CLASS(obj);
+        if (k->format_statistics) {
+            k->format_statistics(rdma, buf);
+        } else {
+            g_string_append_printf(buf,
+                                   "RDMA statistics not available for %s.\n",
+                                   object_get_typename(obj));
+        }
+    }
+
+    return 0;
+}
+
+HumanReadableText *qmp_x_query_rdma(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_rdma_foreach, buf);
+
+    return human_readable_text_from_str(buf);
+}
+
+HumanReadableText *qmp_x_query_ramblock(Error **errp)
+{
+    g_autoptr(GString) buf = ram_block_format();
+
+    return human_readable_text_from_str(buf);
+}
+
+static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
+{
+    InterruptStatsProvider *intc;
+    InterruptStatsProviderClass *k;
+    GString *buf = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
+        intc = INTERRUPT_STATS_PROVIDER(obj);
+        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
+        uint64_t *irq_counts;
+        unsigned int nb_irqs, i;
+        if (k->get_statistics &&
+            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
+            if (nb_irqs > 0) {
+                g_string_append_printf(buf, "IRQ statistics for %s:\n",
+                                       object_get_typename(obj));
+                for (i = 0; i < nb_irqs; i++) {
+                    if (irq_counts[i] > 0) {
+                        g_string_append_printf(buf, "%2d: %" PRId64 "\n", i,
+                                               irq_counts[i]);
+                    }
+                }
+            }
+        } else {
+            g_string_append_printf(buf,
+                                   "IRQ statistics not available for %s.\n",
+                                   object_get_typename(obj));
+        }
+    }
+
+    return 0;
+}
+
+HumanReadableText *qmp_x_query_irq(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qmp_x_query_irq_foreach, buf);
+
+    return human_readable_text_from_str(buf);
+}
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index e5ab77f6c6..4a8d1e9a15 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -24,7 +24,6 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-acpi.h"
 #include "qapi/qapi-commands-control.h"
-#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/type-helpers.h"
@@ -42,24 +41,6 @@ NameInfo *qmp_query_name(Error **errp)
     return info;
 }
 
-KvmInfo *qmp_query_kvm(Error **errp)
-{
-    KvmInfo *info = g_malloc0(sizeof(*info));
-
-    info->enabled = kvm_enabled();
-    info->present = accel_find("kvm");
-
-    return info;
-}
-
-UuidInfo *qmp_query_uuid(Error **errp)
-{
-    UuidInfo *info = g_malloc0(sizeof(*info));
-
-    info->UUID = qemu_uuid_unparse_strdup(&qemu_uuid);
-    return info;
-}
-
 void qmp_quit(Error **errp)
 {
     shutdown_action = SHUTDOWN_ACTION_POWEROFF;
@@ -82,16 +63,6 @@ void qmp_stop(Error **errp)
     }
 }
 
-void qmp_system_reset(Error **errp)
-{
-    qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET);
-}
-
-void qmp_system_powerdown(Error **errp)
-{
-    qemu_system_powerdown_request();
-}
-
 void qmp_cont(Error **errp)
 {
     BlockBackend *blk;
@@ -145,17 +116,6 @@ void qmp_cont(Error **errp)
     }
 }
 
-void qmp_system_wakeup(Error **errp)
-{
-    if (!qemu_wakeup_suspend_enabled()) {
-        error_setg(errp,
-                   "wake-up from suspend is not supported by this guest");
-        return;
-    }
-
-    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
-}
-
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
                     Error **errp)
@@ -196,11 +156,6 @@ void qmp_add_client(const char *protocol, const char *fdname,
     }
 }
 
-MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
-{
-    return qmp_memory_device_list();
-}
-
 ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
 {
     bool ambig;
@@ -220,101 +175,6 @@ ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
     return head;
 }
 
-MemoryInfo *qmp_query_memory_size_summary(Error **errp)
-{
-    MemoryInfo *mem_info = g_new0(MemoryInfo, 1);
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    mem_info->base_memory = ms->ram_size;
-
-    mem_info->plugged_memory = get_plugged_memory_size();
-    mem_info->has_plugged_memory =
-        mem_info->plugged_memory != (uint64_t)-1;
-
-    return mem_info;
-}
-
-static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
-{
-    RdmaProvider *rdma;
-    RdmaProviderClass *k;
-    GString *buf = opaque;
-
-    if (object_dynamic_cast(obj, INTERFACE_RDMA_PROVIDER)) {
-        rdma = RDMA_PROVIDER(obj);
-        k = RDMA_PROVIDER_GET_CLASS(obj);
-        if (k->format_statistics) {
-            k->format_statistics(rdma, buf);
-        } else {
-            g_string_append_printf(buf,
-                                   "RDMA statistics not available for %s.\n",
-                                   object_get_typename(obj));
-        }
-    }
-
-    return 0;
-}
-
-HumanReadableText *qmp_x_query_rdma(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-
-    object_child_foreach_recursive(object_get_root(),
-                                   qmp_x_query_rdma_foreach, buf);
-
-    return human_readable_text_from_str(buf);
-}
-
-HumanReadableText *qmp_x_query_ramblock(Error **errp)
-{
-    g_autoptr(GString) buf = ram_block_format();
-
-    return human_readable_text_from_str(buf);
-}
-
-static int qmp_x_query_irq_foreach(Object *obj, void *opaque)
-{
-    InterruptStatsProvider *intc;
-    InterruptStatsProviderClass *k;
-    GString *buf = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_INTERRUPT_STATS_PROVIDER)) {
-        intc = INTERRUPT_STATS_PROVIDER(obj);
-        k = INTERRUPT_STATS_PROVIDER_GET_CLASS(obj);
-        uint64_t *irq_counts;
-        unsigned int nb_irqs, i;
-        if (k->get_statistics &&
-            k->get_statistics(intc, &irq_counts, &nb_irqs)) {
-            if (nb_irqs > 0) {
-                g_string_append_printf(buf, "IRQ statistics for %s:\n",
-                                       object_get_typename(obj));
-                for (i = 0; i < nb_irqs; i++) {
-                    if (irq_counts[i] > 0) {
-                        g_string_append_printf(buf, "%2d: %" PRId64 "\n", i,
-                                               irq_counts[i]);
-                    }
-                }
-            }
-        } else {
-            g_string_append_printf(buf,
-                                   "IRQ statistics not available for %s.\n",
-                                   object_get_typename(obj));
-        }
-    }
-
-    return 0;
-}
-
-HumanReadableText *qmp_x_query_irq(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-
-    object_child_foreach_recursive(object_get_root(),
-                                   qmp_x_query_irq_foreach, buf);
-
-    return human_readable_text_from_str(buf);
-}
-
 typedef struct StatsCallbacks {
     StatsProvider provider;
     StatRetrieveFunc *stats_cb;
-- 
2.39.0


