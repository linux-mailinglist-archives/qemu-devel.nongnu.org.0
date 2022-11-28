Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94A63A274
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:04:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5t-0005Mp-Ki; Mon, 28 Nov 2022 03:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5r-0005Lg-6g
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5p-0008L1-3m
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drEcGDJTiF0kzfalrxuMoQe8W7Rl5drRQBHs57xXr/g=;
 b=G7MlZNLtVpMl8URPto/y0BX7BNWQ14rRtCegz8zLXfmcW1MWPXH7vpVRMktd2Y9RynQUTO
 YhZU8kZyhIFenbrvckgvaFNjmxw0VP88N8grcKmCWvSHw44iT86+tldbcbCAVfs72NQLad
 8h2ik/tKngFuZdgWutBVsRq541guVMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-wkUna6_7Pe2-WmXshHJBQw-1; Mon, 28 Nov 2022 03:02:15 -0500
X-MC-Unique: wkUna6_7Pe2-WmXshHJBQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF903101A528;
 Mon, 28 Nov 2022 08:02:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 521EA4B4011;
 Mon, 28 Nov 2022 08:02:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D61E21E65C9; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 09/12] pci: Move HMP command from hw/pci/pcie_aer.c to
 pci-hmp-cmds.c
Date: Mon, 28 Nov 2022 09:01:59 +0100
Message-Id: <20221128080202.2570543-10-armbru@redhat.com>
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/pci/pci-internal.h   |   4 ++
 include/monitor/hmp.h   |   1 +
 include/sysemu/sysemu.h |   3 --
 hw/pci/pci-hmp-cmds.c   | 105 ++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c       |   1 -
 hw/pci/pcie_aer.c       | 115 ++--------------------------------------
 6 files changed, 114 insertions(+), 115 deletions(-)

diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
index 3199615e50..2ea356bdf5 100644
--- a/hw/pci/pci-internal.h
+++ b/hw/pci/pci-internal.h
@@ -18,4 +18,8 @@ const pci_class_desc *get_class_desc(int class);
 PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
 void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 
+int pcie_aer_parse_error_string(const char *error_name,
+                                uint32_t *status, bool *correctable);
+int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
+
 #endif
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index dfbc0c9a2f..27f86399f7 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -143,5 +143,6 @@ void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
 void hmp_human_readable_text_helper(Monitor *mon,
                                     HumanReadableText *(*qmp_handler)(Error **));
 void hmp_info_stats(Monitor *mon, const QDict *qdict);
+void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6a7a31e64d..25be2a692e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -61,9 +61,6 @@ extern int nb_option_roms;
 extern const char *prom_envs[MAX_PROM_ENVS];
 extern unsigned int nb_prom_envs;
 
-/* pcie aer error injection */
-void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
-
 /* serial ports */
 
 /* Return the Chardev for serial port i, or NULL if none */
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index 417f1ca607..393ab4214a 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -19,7 +19,9 @@
 #include "monitor/monitor.h"
 #include "pci-internal.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qapi-commands-pci.h"
+#include "qemu/cutils.h"
 
 static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
 {
@@ -156,3 +158,106 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
                        r->addr, r->addr + r->size - 1);
     }
 }
+
+typedef struct PCIEErrorDetails {
+    const char *id;
+    const char *root_bus;
+    int bus;
+    int devfn;
+} PCIEErrorDetails;
+
+/*
+ * Inject an error described by @qdict.
+ * On success, set @details to show where error was sent.
+ * Return negative errno if injection failed and a message was emitted.
+ */
+static int do_pcie_aer_inject_error(Monitor *mon,
+                                    const QDict *qdict,
+                                    PCIEErrorDetails *details)
+{
+    const char *id = qdict_get_str(qdict, "id");
+    const char *error_name;
+    uint32_t error_status;
+    unsigned long num;
+    bool correctable;
+    PCIDevice *dev;
+    PCIEAERErr err;
+    int ret;
+
+    ret = pci_qdev_find_device(id, &dev);
+    if (ret < 0) {
+        monitor_printf(mon,
+                       "id or pci device path is invalid or device not "
+                       "found. %s\n", id);
+        return ret;
+    }
+    if (!pci_is_express(dev)) {
+        monitor_printf(mon, "the device doesn't support pci express. %s\n",
+                       id);
+        return -ENOSYS;
+    }
+
+    error_name = qdict_get_str(qdict, "error_status");
+    if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
+        if (qemu_strtoul(error_name, NULL, 0, &num) < 0
+            || num > UINT32_MAX) {
+            monitor_printf(mon, "invalid error status value. \"%s\"",
+                           error_name);
+            return -EINVAL;
+        }
+        error_status = num;
+        correctable = qdict_get_try_bool(qdict, "correctable", false);
+    }
+    err.status = error_status;
+    err.source_id = pci_requester_id(dev);
+
+    err.flags = 0;
+    if (correctable) {
+        err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
+    }
+    if (qdict_get_try_bool(qdict, "advisory_non_fatal", false)) {
+        err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
+    }
+    if (qdict_haskey(qdict, "header0")) {
+        err.flags |= PCIE_AER_ERR_HEADER_VALID;
+    }
+    if (qdict_haskey(qdict, "prefix0")) {
+        err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
+    }
+
+    err.header[0] = qdict_get_try_int(qdict, "header0", 0);
+    err.header[1] = qdict_get_try_int(qdict, "header1", 0);
+    err.header[2] = qdict_get_try_int(qdict, "header2", 0);
+    err.header[3] = qdict_get_try_int(qdict, "header3", 0);
+
+    err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
+    err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
+    err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
+    err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
+
+    ret = pcie_aer_inject_error(dev, &err);
+    if (ret < 0) {
+        monitor_printf(mon, "failed to inject error: %s\n",
+                       strerror(-ret));
+        return ret;
+    }
+    details->id = id;
+    details->root_bus = pci_root_bus_path(dev);
+    details->bus = pci_dev_bus_num(dev);
+    details->devfn = dev->devfn;
+
+    return 0;
+}
+
+void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
+{
+    PCIEErrorDetails data;
+
+    if (do_pcie_aer_inject_error(mon, qdict, &data) < 0) {
+        return;
+    }
+
+    monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
+                   data.id, data.root_bus, data.bus,
+                   PCI_SLOT(data.devfn), PCI_FUNC(data.devfn));
+}
diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index 01d20a2f67..f0508682d2 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
 #include "qapi/qapi-commands-pci.h"
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index ccca5a81cc..9a19be44ae 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -19,18 +19,14 @@
  */
 
 #include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
-#include "qapi/qmp/qdict.h"
 #include "migration/vmstate.h"
-#include "monitor/monitor.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie.h"
 #include "hw/pci/msix.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pcie_regs.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
+#include "pci-internal.h"
 
 //#define DEBUG_PCIE
 #ifdef DEBUG_PCIE
@@ -45,13 +41,6 @@
 #define PCI_ERR_SRC_COR_OFFS    0
 #define PCI_ERR_SRC_UNCOR_OFFS  2
 
-typedef struct PCIEErrorDetails {
-    const char *id;
-    const char *root_bus;
-    int bus;
-    int devfn;
-} PCIEErrorDetails;
-
 /* From 6.2.7 Error Listing and Rules. Table 6-2, 6-3 and 6-4 */
 static uint32_t pcie_aer_uncor_default_severity(uint32_t status)
 {
@@ -632,7 +621,7 @@ static bool pcie_aer_inject_uncor_error(PCIEAERInject *inj, bool is_fatal)
  * Figure 6-2: Flowchart Showing Sequence of Device Error Signaling and Logging
  *             Operations
  */
-static int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err)
+int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err)
 {
     uint8_t *aer_cap = NULL;
     uint16_t devctl = 0;
@@ -934,8 +923,8 @@ static const struct PCIEAERErrorName pcie_aer_error_list[] = {
     },
 };
 
-static int pcie_aer_parse_error_string(const char *error_name,
-                                       uint32_t *status, bool *correctable)
+int pcie_aer_parse_error_string(const char *error_name,
+                                uint32_t *status, bool *correctable)
 {
     int i;
 
@@ -951,99 +940,3 @@ static int pcie_aer_parse_error_string(const char *error_name,
     }
     return -EINVAL;
 }
-
-/*
- * Inject an error described by @qdict.
- * On success, set @details to show where error was sent.
- * Return negative errno if injection failed and a message was emitted.
- */
-static int do_pcie_aer_inject_error(Monitor *mon,
-                                    const QDict *qdict,
-                                    PCIEErrorDetails *details)
-{
-    const char *id = qdict_get_str(qdict, "id");
-    const char *error_name;
-    uint32_t error_status;
-    unsigned long num;
-    bool correctable;
-    PCIDevice *dev;
-    PCIEAERErr err;
-    int ret;
-
-    ret = pci_qdev_find_device(id, &dev);
-    if (ret < 0) {
-        monitor_printf(mon,
-                       "id or pci device path is invalid or device not "
-                       "found. %s\n", id);
-        return ret;
-    }
-    if (!pci_is_express(dev)) {
-        monitor_printf(mon, "the device doesn't support pci express. %s\n",
-                       id);
-        return -ENOSYS;
-    }
-
-    error_name = qdict_get_str(qdict, "error_status");
-    if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
-        if (qemu_strtoul(error_name, NULL, 0, &num) < 0
-            || num > UINT32_MAX) {
-            monitor_printf(mon, "invalid error status value. \"%s\"",
-                           error_name);
-            return -EINVAL;
-        }
-        error_status = num;
-        correctable = qdict_get_try_bool(qdict, "correctable", false);
-    }
-    err.status = error_status;
-    err.source_id = pci_requester_id(dev);
-
-    err.flags = 0;
-    if (correctable) {
-        err.flags |= PCIE_AER_ERR_IS_CORRECTABLE;
-    }
-    if (qdict_get_try_bool(qdict, "advisory_non_fatal", false)) {
-        err.flags |= PCIE_AER_ERR_MAYBE_ADVISORY;
-    }
-    if (qdict_haskey(qdict, "header0")) {
-        err.flags |= PCIE_AER_ERR_HEADER_VALID;
-    }
-    if (qdict_haskey(qdict, "prefix0")) {
-        err.flags |= PCIE_AER_ERR_TLP_PREFIX_PRESENT;
-    }
-
-    err.header[0] = qdict_get_try_int(qdict, "header0", 0);
-    err.header[1] = qdict_get_try_int(qdict, "header1", 0);
-    err.header[2] = qdict_get_try_int(qdict, "header2", 0);
-    err.header[3] = qdict_get_try_int(qdict, "header3", 0);
-
-    err.prefix[0] = qdict_get_try_int(qdict, "prefix0", 0);
-    err.prefix[1] = qdict_get_try_int(qdict, "prefix1", 0);
-    err.prefix[2] = qdict_get_try_int(qdict, "prefix2", 0);
-    err.prefix[3] = qdict_get_try_int(qdict, "prefix3", 0);
-
-    ret = pcie_aer_inject_error(dev, &err);
-    if (ret < 0) {
-        monitor_printf(mon, "failed to inject error: %s\n",
-                       strerror(-ret));
-        return ret;
-    }
-    details->id = id;
-    details->root_bus = pci_root_bus_path(dev);
-    details->bus = pci_dev_bus_num(dev);
-    details->devfn = dev->devfn;
-
-    return 0;
-}
-
-void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict)
-{
-    PCIEErrorDetails data;
-
-    if (do_pcie_aer_inject_error(mon, qdict, &data) < 0) {
-        return;
-    }
-
-    monitor_printf(mon, "OK id: %s root bus: %s, bus: %x devfn: %x.%x\n",
-                   data.id, data.root_bus, data.bus,
-                   PCI_SLOT(data.devfn), PCI_FUNC(data.devfn));
-}
-- 
2.37.3


