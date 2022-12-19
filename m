Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2327A650F56
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQa-0002sr-BS; Mon, 19 Dec 2022 10:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQN-0002de-C4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQK-0000aR-Qk
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QWj8Yw6xYq9Io6CIfPqaaYjRq3+5lIh2D2ERmlx5n0=;
 b=K0ecm/AnHrysScD6WC/jZeHy7HKllte0QuGZp8hSVLQQtAk8acFfBIZZSAGBWzWhfiJvtu
 04J45wH7oeglEZlA1pXz79Ex9/+x8i41+bxlGimD/CCVMEf4oQmApLuJeBQKbt7wkQdrbJ
 wk71PutTcdFXoDeMo328UoYi6FIFPRI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Fqz2F9X1NWu65BN54pRpEQ-1; Mon, 19 Dec 2022 10:51:25 -0500
X-MC-Unique: Fqz2F9X1NWu65BN54pRpEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D669F3813F4F;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B211121315;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A8FE21E6808; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 03/13] pci: Move HMP commands from monitor/ to new
 hw/pci/pci-hmp-cmds.c
Date: Mon, 19 Dec 2022 16:51:10 +0100
Message-Id: <20221219155120.2273041-4-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20221201121133.3813857-4-armbru@redhat.com>
---
 hw/pci/pci-hmp-cmds.c | 126 ++++++++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c    | 107 -----------------------------------
 hw/pci/meson.build    |   1 +
 3 files changed, 127 insertions(+), 107 deletions(-)
 create mode 100644 hw/pci/pci-hmp-cmds.c

diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
new file mode 100644
index 0000000000..e5e07ea72c
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
+    if (dev->class_info->desc) {
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
+    if (dev->pci_bridge) {
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
+    if (dev->pci_bridge) {
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
index b847b26041..ed78a87ddd 100644
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
@@ -698,89 +697,6 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
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
-    if (dev->class_info->desc) {
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
-    if (dev->pci_bridge) {
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
-    if (dev->pci_bridge) {
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
@@ -807,29 +723,6 @@ void hmp_info_pic(Monitor *mon, const QDict *qdict)
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


