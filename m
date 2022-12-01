Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF063F0BB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:42:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iQ2-0004Ju-Gc; Thu, 01 Dec 2022 07:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPt-0004GD-7u
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPp-0008FE-1O
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOPSFKv4asr2lcldz5C2hFJmsrW0ZXIyej6ff92ohNs=;
 b=cmWA3B0Nhk+18Z5RTmC2Qy3S8WwivTCTZCso/M7Buho09HhsfQILczCSlzNLMEW7bG2uC2
 3UkRm0p4rYBmDpuIDvVrYicHwTlV4kMExu5q8ZQCSZuO8N3JwDEAmR/rgNCdPFp0oBtGme
 +R0VjDvyO98sk3F3c4LOkEGK/xXguQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-1Gq2wMlQP0SJnENIXTTi9Q-1; Thu, 01 Dec 2022 07:11:41 -0500
X-MC-Unique: 1Gq2wMlQP0SJnENIXTTi9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBB681C05ECB;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7012166B49;
 Thu,  1 Dec 2022 12:11:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED13C21E65C7; Thu,  1 Dec 2022 13:11:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 07/13] pci: Move pcibus_dev_print() to pci-hmp-cmds.c
Date: Thu,  1 Dec 2022 13:11:27 +0100
Message-Id: <20221201121133.3813857-8-armbru@redhat.com>
In-Reply-To: <20221201121133.3813857-1-armbru@redhat.com>
References: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This method is for HMP command "info qtree".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index e915fb9fe7..417f1ca607 100644
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
index 6711a75098..d654045fe9 100644
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


