Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0784650F49
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQX-0002jG-QK; Mon, 19 Dec 2022 10:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQO-0002eK-US
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQM-0000b0-EL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KI+XelsAbW3wEvGOdgtSVHdOKWGkzGCaUEKs93PzZZ4=;
 b=fDYtOmdjrQBpULwl8SraTEqS9vjMurly8NS12IXJ1Ofgx0ANoHhPRK/8HeubWa4bcJxFIS
 kDWS6Obs7NHuvB/AO+C8d7b2bgLHEDtZtuZRJ1Hiw1P+OsvsYHsPycE8qRw+H8d/y3WWBr
 XlJYWfwkv4IlDI8+vP2Jh2eOj4H6r1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339--hXKKfYbPTyUhm1eGfKTHQ-1; Mon, 19 Dec 2022 10:51:24 -0500
X-MC-Unique: -hXKKfYbPTyUhm1eGfKTHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 511AC857A85;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0534E2026D76;
 Mon, 19 Dec 2022 15:51:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 63BFF21E6692; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/13] pci: Move pcibus_dev_print() to pci-hmp-cmds.c
Date: Mon, 19 Dec 2022 16:51:14 +0100
Message-Id: <20221219155120.2273041-8-armbru@redhat.com>
In-Reply-To: <20221219155120.2273041-1-armbru@redhat.com>
References: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This method is for HMP command "info qtree".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221201121133.3813857-8-armbru@redhat.com>
---
 hw/pci/pci-internal.h |  1 +
 hw/pci/pci-hmp-cmds.c | 38 ++++++++++++++++++++++++++++++++++++++
 hw/pci/pci.c          | 38 --------------------------------------
 3 files changed, 39 insertions(+), 38 deletions(-)

diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
index 4903a26cbf..3199615e50 100644
--- a/hw/pci/pci-internal.h
+++ b/hw/pci/pci-internal.h
@@ -16,5 +16,6 @@ extern PCIHostStateList pci_host_bridges;
 
 const pci_class_desc *get_class_desc(int class);
 PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
+void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 
 #endif
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index f8d67bbb09..adbc6021f6 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -14,8 +14,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/pci/pci.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
+#include "pci-internal.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-pci.h"
 
@@ -118,3 +120,39 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
 
     qapi_free_PciInfoList(info_list);
 }
+
+void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
+{
+    PCIDevice *d = (PCIDevice *)dev;
+    int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
+    const pci_class_desc *desc = get_class_desc(class);
+    char ctxt[64];
+    PCIIORegion *r;
+    int i;
+
+    if (desc->desc) {
+        snprintf(ctxt, sizeof(ctxt), "%s", desc->desc);
+    } else {
+        snprintf(ctxt, sizeof(ctxt), "Class %04x", class);
+    }
+
+    monitor_printf(mon, "%*sclass %s, addr %02x:%02x.%x, "
+                   "pci id %04x:%04x (sub %04x:%04x)\n",
+                   indent, "", ctxt, pci_dev_bus_num(d),
+                   PCI_SLOT(d->devfn), PCI_FUNC(d->devfn),
+                   pci_get_word(d->config + PCI_VENDOR_ID),
+                   pci_get_word(d->config + PCI_DEVICE_ID),
+                   pci_get_word(d->config + PCI_SUBSYSTEM_VENDOR_ID),
+                   pci_get_word(d->config + PCI_SUBSYSTEM_ID));
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        r = &d->io_regions[i];
+        if (!r->size) {
+            continue;
+        }
+        monitor_printf(mon, "%*sbar %d: %s at 0x%"FMT_PCIBUS
+                       " [0x%"FMT_PCIBUS"]\n",
+                       indent, "",
+                       i, r->type & PCI_BASE_ADDRESS_SPACE_IO ? "i/o" : "mem",
+                       r->addr, r->addr + r->size - 1);
+    }
+}
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 41718aaf60..9598b4b546 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -34,7 +34,6 @@
 #include "hw/qdev-properties-system.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
-#include "monitor/monitor.h"
 #include "net/net.h"
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
@@ -59,7 +58,6 @@
 
 bool pci_available = true;
 
-static void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *pcibus_get_dev_path(DeviceState *dev);
 static char *pcibus_get_fw_dev_path(DeviceState *dev);
 static void pcibus_reset(BusState *qbus);
@@ -2406,42 +2404,6 @@ uint8_t pci_find_capability(PCIDevice *pdev, uint8_t cap_id)
     return pci_find_capability_list(pdev, cap_id, NULL);
 }
 
-static void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent)
-{
-    PCIDevice *d = (PCIDevice *)dev;
-    int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
-    const pci_class_desc *desc = get_class_desc(class);
-    char ctxt[64];
-    PCIIORegion *r;
-    int i;
-
-    if (desc->desc) {
-        snprintf(ctxt, sizeof(ctxt), "%s", desc->desc);
-    } else {
-        snprintf(ctxt, sizeof(ctxt), "Class %04x", class);
-    }
-
-    monitor_printf(mon, "%*sclass %s, addr %02x:%02x.%x, "
-                   "pci id %04x:%04x (sub %04x:%04x)\n",
-                   indent, "", ctxt, pci_dev_bus_num(d),
-                   PCI_SLOT(d->devfn), PCI_FUNC(d->devfn),
-                   pci_get_word(d->config + PCI_VENDOR_ID),
-                   pci_get_word(d->config + PCI_DEVICE_ID),
-                   pci_get_word(d->config + PCI_SUBSYSTEM_VENDOR_ID),
-                   pci_get_word(d->config + PCI_SUBSYSTEM_ID));
-    for (i = 0; i < PCI_NUM_REGIONS; i++) {
-        r = &d->io_regions[i];
-        if (!r->size) {
-            continue;
-        }
-        monitor_printf(mon, "%*sbar %d: %s at 0x%"FMT_PCIBUS
-                       " [0x%"FMT_PCIBUS"]\n",
-                       indent, "",
-                       i, r->type & PCI_BASE_ADDRESS_SPACE_IO ? "i/o" : "mem",
-                       r->addr, r->addr + r->size - 1);
-    }
-}
-
 static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
 {
     PCIDevice *d = (PCIDevice *)dev;
-- 
2.37.3


