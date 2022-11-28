Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1D263A280
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5p-0005JU-Sd; Mon, 28 Nov 2022 03:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5i-0005H6-0l
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5f-0008Hu-BK
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AjgnZa0Q0JCVnnI/oAWbca+tv4RtT19S4mYiQWCdFo=;
 b=bUrjJpFXgCk13OckEkfflfxgECGZgHbR2AS1Y4zI+qTyEkPo3tf8tywJryc+tFB4d28cOk
 pvoA6AFXlk8uaE1MgMd1VKT7qUNiXNHJZC8hF2Vuopum2y5dmg+pKV1xMiqLlLXUjoDzHd
 DHY8MHO+Z09x9IFXs4k6rAFhbsCQyjs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-QdJ0H0LNOr616FhxAE5ZkQ-1; Mon, 28 Nov 2022 03:02:06 -0500
X-MC-Unique: QdJ0H0LNOr616FhxAE5ZkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 356F23811F28;
 Mon, 28 Nov 2022 08:02:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1B472166B2E;
 Mon, 28 Nov 2022 08:02:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F8AD21E688F; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 03/12] pci: Move HMP commands from monitor/ to new
 hw/pci/pci-hmp-cmds.c
Date: Mon, 28 Nov 2022 09:01:53 +0100
Message-Id: <20221128080202.2570543-4-armbru@redhat.com>
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
References: <20221128080202.2570543-1-armbru@redhat.com>
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
Monitor (HMP)" to "PCI".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 126 ++++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c    | 107 -----------------------------------
 hw/pci/meson.build    |   1 +
 3 files changed, 127 insertions(+), 107 deletions(-)
 create mode 100644 hw/pci/pci-hmp-cmds.c

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
new file mode 100644
index 0000000000..5adfe4f57f
--- /dev/null
+++ b/hw/pci/pci-hmp-cmds.c
@@ -0,0 +1,126 @@
+/*
+ * HMP commands related to PCI
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-pci.h"
+
+static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
+{
+    PciMemoryRegionList *region;
+
+    monitor_printf(mon, "  Bus %2" PRId64 ", ", dev->bus);
+    monitor_printf(mon, "device %3" PRId64 ", function %" PRId64 ":\n",
+                   dev->slot, dev->function);
+    monitor_printf(mon, "    ");
+
+    if (dev->class_info->has_desc) {
+        monitor_puts(mon, dev->class_info->desc);
+    } else {
+        monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
+    }
+
+    monitor_printf(mon, ": PCI device %04" PRIx64 ":%04" PRIx64 "\n",
+                   dev->id->vendor, dev->id->device);
+    if (dev->id->has_subsystem_vendor && dev->id->has_subsystem) {
+        monitor_printf(mon, "      PCI subsystem %04" PRIx64 ":%04" PRIx64 "\n",
+                       dev->id->subsystem_vendor, dev->id->subsystem);
+    }
+
+    if (dev->has_irq) {
+        monitor_printf(mon, "      IRQ %" PRId64 ", pin %c\n",
+                       dev->irq, (char)('A' + dev->irq_pin - 1));
+    }
+
+    if (dev->has_pci_bridge) {
+        monitor_printf(mon, "      BUS %" PRId64 ".\n",
+                       dev->pci_bridge->bus->number);
+        monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
+                       dev->pci_bridge->bus->secondary);
+        monitor_printf(mon, "      subordinate bus %" PRId64 ".\n",
+                       dev->pci_bridge->bus->subordinate);
+
+        monitor_printf(mon, "      IO range [0x%04"PRIx64", 0x%04"PRIx64"]\n",
+                       dev->pci_bridge->bus->io_range->base,
+                       dev->pci_bridge->bus->io_range->limit);
+
+        monitor_printf(mon,
+                       "      memory range [0x%08"PRIx64", 0x%08"PRIx64"]\n",
+                       dev->pci_bridge->bus->memory_range->base,
+                       dev->pci_bridge->bus->memory_range->limit);
+
+        monitor_printf(mon, "      prefetchable memory range "
+                       "[0x%08"PRIx64", 0x%08"PRIx64"]\n",
+                       dev->pci_bridge->bus->prefetchable_range->base,
+                       dev->pci_bridge->bus->prefetchable_range->limit);
+    }
+
+    for (region = dev->regions; region; region = region->next) {
+        uint64_t addr, size;
+
+        addr = region->value->address;
+        size = region->value->size;
+
+        monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
+
+        if (!strcmp(region->value->type, "io")) {
+            monitor_printf(mon, "I/O at 0x%04" PRIx64
+                                " [0x%04" PRIx64 "].\n",
+                           addr, addr + size - 1);
+        } else {
+            monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
+                               " [0x%08" PRIx64 "].\n",
+                           region->value->mem_type_64 ? 64 : 32,
+                           region->value->prefetch ? " prefetchable" : "",
+                           addr, addr + size - 1);
+        }
+    }
+
+    monitor_printf(mon, "      id \"%s\"\n", dev->qdev_id);
+
+    if (dev->has_pci_bridge) {
+        if (dev->pci_bridge->has_devices) {
+            PciDeviceInfoList *cdev;
+            for (cdev = dev->pci_bridge->devices; cdev; cdev = cdev->next) {
+                hmp_info_pci_device(mon, cdev->value);
+            }
+        }
+    }
+}
+
+void hmp_info_pci(Monitor *mon, const QDict *qdict)
+{
+    PciInfoList *info_list, *info;
+    Error *err = NULL;
+
+    info_list = qmp_query_pci(&err);
+    if (err) {
+        monitor_printf(mon, "PCI devices not supported\n");
+        error_free(err);
+        return;
+    }
+
+    for (info = info_list; info; info = info->next) {
+        PciDeviceInfoList *dev;
+
+        for (dev = info->value->devices; dev; dev = dev->next) {
+            hmp_info_pci_device(mon, dev->value);
+        }
+    }
+
+    qapi_free_PciInfoList(info_list);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 01b789a79e..03eae10663 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -37,7 +37,6 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-net.h"
-#include "qapi/qapi-commands-pci.h"
 #include "qapi/qapi-commands-rocker.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
@@ -701,89 +700,6 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
     qapi_free_BalloonInfo(info);
 }
 
-static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
-{
-    PciMemoryRegionList *region;
-
-    monitor_printf(mon, "  Bus %2" PRId64 ", ", dev->bus);
-    monitor_printf(mon, "device %3" PRId64 ", function %" PRId64 ":\n",
-                   dev->slot, dev->function);
-    monitor_printf(mon, "    ");
-
-    if (dev->class_info->has_desc) {
-        monitor_puts(mon, dev->class_info->desc);
-    } else {
-        monitor_printf(mon, "Class %04" PRId64, dev->class_info->q_class);
-    }
-
-    monitor_printf(mon, ": PCI device %04" PRIx64 ":%04" PRIx64 "\n",
-                   dev->id->vendor, dev->id->device);
-    if (dev->id->has_subsystem_vendor && dev->id->has_subsystem) {
-        monitor_printf(mon, "      PCI subsystem %04" PRIx64 ":%04" PRIx64 "\n",
-                       dev->id->subsystem_vendor, dev->id->subsystem);
-    }
-
-    if (dev->has_irq) {
-        monitor_printf(mon, "      IRQ %" PRId64 ", pin %c\n",
-                       dev->irq, (char)('A' + dev->irq_pin - 1));
-    }
-
-    if (dev->has_pci_bridge) {
-        monitor_printf(mon, "      BUS %" PRId64 ".\n",
-                       dev->pci_bridge->bus->number);
-        monitor_printf(mon, "      secondary bus %" PRId64 ".\n",
-                       dev->pci_bridge->bus->secondary);
-        monitor_printf(mon, "      subordinate bus %" PRId64 ".\n",
-                       dev->pci_bridge->bus->subordinate);
-
-        monitor_printf(mon, "      IO range [0x%04"PRIx64", 0x%04"PRIx64"]\n",
-                       dev->pci_bridge->bus->io_range->base,
-                       dev->pci_bridge->bus->io_range->limit);
-
-        monitor_printf(mon,
-                       "      memory range [0x%08"PRIx64", 0x%08"PRIx64"]\n",
-                       dev->pci_bridge->bus->memory_range->base,
-                       dev->pci_bridge->bus->memory_range->limit);
-
-        monitor_printf(mon, "      prefetchable memory range "
-                       "[0x%08"PRIx64", 0x%08"PRIx64"]\n",
-                       dev->pci_bridge->bus->prefetchable_range->base,
-                       dev->pci_bridge->bus->prefetchable_range->limit);
-    }
-
-    for (region = dev->regions; region; region = region->next) {
-        uint64_t addr, size;
-
-        addr = region->value->address;
-        size = region->value->size;
-
-        monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
-
-        if (!strcmp(region->value->type, "io")) {
-            monitor_printf(mon, "I/O at 0x%04" PRIx64
-                                " [0x%04" PRIx64 "].\n",
-                           addr, addr + size - 1);
-        } else {
-            monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
-                               " [0x%08" PRIx64 "].\n",
-                           region->value->mem_type_64 ? 64 : 32,
-                           region->value->prefetch ? " prefetchable" : "",
-                           addr, addr + size - 1);
-        }
-    }
-
-    monitor_printf(mon, "      id \"%s\"\n", dev->qdev_id);
-
-    if (dev->has_pci_bridge) {
-        if (dev->pci_bridge->has_devices) {
-            PciDeviceInfoList *cdev;
-            for (cdev = dev->pci_bridge->devices; cdev; cdev = cdev->next) {
-                hmp_info_pci_device(mon, cdev->value);
-            }
-        }
-    }
-}
-
 static int hmp_info_pic_foreach(Object *obj, void *opaque)
 {
     InterruptStatsProvider *intc;
@@ -810,29 +726,6 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
                                    hmp_info_pic_foreach, mon);
 }
 
-void hmp_info_pci(Monitor *mon, const QDict *qdict)
-{
-    PciInfoList *info_list, *info;
-    Error *err = NULL;
-
-    info_list = qmp_query_pci(&err);
-    if (err) {
-        monitor_printf(mon, "PCI devices not supported\n");
-        error_free(err);
-        return;
-    }
-
-    for (info = info_list; info; info = info->next) {
-        PciDeviceInfoList *dev;
-
-        for (dev = info->value->devices; dev; dev = dev->next) {
-            hmp_info_pci_device(mon, dev->value);
-        }
-    }
-
-    qapi_free_PciInfoList(info_list);
-}
-
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
 #ifdef CONFIG_TPM
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 40721f1514..e42a133f3a 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -20,3 +20,4 @@ softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
 softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
+softmmu_ss.add(files('pci-hmp-cmds.c'))
-- 
2.37.3


