Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A924F6E97D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:01:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVl8-0003E1-5J; Thu, 20 Apr 2023 10:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVl5-0003Cm-FU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:59:39 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppVl2-0003kF-Tw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:59:39 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2LKh6pWSz67gJd;
 Thu, 20 Apr 2023 22:54:48 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 15:59:33 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>
Subject: [PATCH] hw/pci-bridge: Fix release ordering by embedding
 PCIBridgeWindows within PCIBridge
Date: Thu, 20 Apr 2023 15:59:37 +0100
Message-ID: <20230420145937.17152-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The lifetime of the PCIBridgeWindows instance accessed via the windows pointer
in struct PCIBridge is managed separately from the PCIBridge itself.

Triggered by ./qemu-system-x86_64 -M x-remote -display none -monitor stdio
QEMU monitor: device_add cxl-downstream

In some error handling paths (such as the above due to attaching a cxl-downstream
port anything other than a cxl-upstream port) the g_free() of the PCIBridge
windows in pci_bridge_region_cleanup() is called before the final call of
flatview_uref() in address_space_set_flatview() ultimately from
drain_call_rcu()

At one stage this resulted in a crash, currently can still be observed using
valgrind which records a use after free.

When present, only one instance is allocated. pci_bridge_update_mappings()
can operate directly on an instance rather than creating a new one and
swapping it in.  Thus there appears to be no reason to not directly
couple the lifetimes of the two structures by embedding the PCIBridgeWindows
within the PCIBridge removing the need for the problematic separate free.

Patch is same as was posted deep in the discussion.
https://lore.kernel.org/qemu-devel/20230403171232.000020bb@huawei.com/

Posted as an RFC as only lightly tested and I'm not sure what the reasoning
behind the separation of lifetimes originally was. As such perhaps this is
not the best route to fixing the issue.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/pci/pci_bridge.c         | 20 ++++++++------------
 include/hw/pci/pci_bridge.h |  3 ++-
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index dd5af508f9..698fd01ae6 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -184,11 +184,11 @@ static void pci_bridge_init_vga_aliases(PCIBridge *br, PCIBus *parent,
     }
 }
 
-static PCIBridgeWindows *pci_bridge_region_init(PCIBridge *br)
+static void pci_bridge_region_init(PCIBridge *br)
 {
     PCIDevice *pd = PCI_DEVICE(br);
     PCIBus *parent = pci_get_bus(pd);
-    PCIBridgeWindows *w = g_new(PCIBridgeWindows, 1);
+    PCIBridgeWindows *w = &br->windows;
     uint16_t cmd = pci_get_word(pd->config + PCI_COMMAND);
 
     pci_bridge_init_alias(br, &w->alias_pref_mem,
@@ -211,8 +211,6 @@ static PCIBridgeWindows *pci_bridge_region_init(PCIBridge *br)
                           cmd & PCI_COMMAND_IO);
 
     pci_bridge_init_vga_aliases(br, parent, w->alias_vga);
-
-    return w;
 }
 
 static void pci_bridge_region_del(PCIBridge *br, PCIBridgeWindows *w)
@@ -234,19 +232,17 @@ static void pci_bridge_region_cleanup(PCIBridge *br, PCIBridgeWindows *w)
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_LO]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_HI]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_MEM]));
-    g_free(w);
 }
 
 void pci_bridge_update_mappings(PCIBridge *br)
 {
-    PCIBridgeWindows *w = br->windows;
-
+    PCIBridgeWindows *w = &br->windows;
     /* Make updates atomic to: handle the case of one VCPU updating the bridge
      * while another accesses an unaffected region. */
     memory_region_transaction_begin();
-    pci_bridge_region_del(br, br->windows);
+    pci_bridge_region_del(br, w);
     pci_bridge_region_cleanup(br, w);
-    br->windows = pci_bridge_region_init(br);
+    pci_bridge_region_init(br);
     memory_region_transaction_commit();
 }
 
@@ -385,7 +381,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     sec_bus->address_space_io = &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
                        4 * GiB);
-    br->windows = pci_bridge_region_init(br);
+    pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
 }
@@ -396,8 +392,8 @@ void pci_bridge_exitfn(PCIDevice *pci_dev)
     PCIBridge *s = PCI_BRIDGE(pci_dev);
     assert(QLIST_EMPTY(&s->sec_bus.child));
     QLIST_REMOVE(&s->sec_bus, sibling);
-    pci_bridge_region_del(s, s->windows);
-    pci_bridge_region_cleanup(s, s->windows);
+    pci_bridge_region_del(s, &s->windows);
+    pci_bridge_region_cleanup(s, &s->windows);
     /* object_unparent() is called automatically during device deletion */
 }
 
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 01670e9e65..ac75ec0c1b 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/cxl/cxl.h"
 #include "qom/object.h"
+#include "qemu/rcu.h"
 
 typedef struct PCIBridgeWindows PCIBridgeWindows;
 
@@ -73,7 +74,7 @@ struct PCIBridge {
     MemoryRegion address_space_mem;
     MemoryRegion address_space_io;
 
-    PCIBridgeWindows *windows;
+    PCIBridgeWindows windows;
 
     pci_map_irq_fn map_irq;
     const char *bus_name;
-- 
2.37.2


