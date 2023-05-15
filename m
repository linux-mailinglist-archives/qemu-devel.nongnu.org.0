Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7BF702E30
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:34:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsJ-0006fU-A2; Mon, 15 May 2023 09:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqn-0004TN-D1
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqj-00010f-88
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7/Zq85QIWoyCl9KubUldUkGWJQIOCZHsDffGfE2I4Q=;
 b=ZAtSyaZ2g7rwyC2j4Jll4YO9CRTaUepuKcg2GJQo+HSS4cyCIUurkrvjnFBgTx2Lb5mGx7
 XmGvWA14Q501WS9cTWV4oLoOBaca6XdW38nzcRXSlawFIwS5XPQTIIDy1QhfKgrRzsY5b+
 r5UTgS2bR7JvRd66CXX8LGTKFidV3tA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-etlLvfcSM8-DqNw_2cBJkw-1; Mon, 15 May 2023 09:02:44 -0400
X-MC-Unique: etlLvfcSM8-DqNw_2cBJkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D64151825061;
 Mon, 15 May 2023 13:02:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7A440C6EC4;
 Mon, 15 May 2023 13:02:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PULL 05/21] hw/pci-bridge: Fix release ordering by embedding
 PCIBridgeWindows within PCIBridge
Date: Mon, 15 May 2023 15:02:17 +0200
Message-Id: <20230515130233.418183-6-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230421122550.28234-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/pci/pci_bridge.h |  2 +-
 hw/pci/pci_bridge.c         | 19 ++++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 01670e9e65..ea54a81a15 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -73,7 +73,7 @@ struct PCIBridge {
     MemoryRegion address_space_mem;
     MemoryRegion address_space_io;
 
-    PCIBridgeWindows *windows;
+    PCIBridgeWindows windows;
 
     pci_map_irq_fn map_irq;
     const char *bus_name;
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index dd5af508f9..e7b9345615 100644
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
@@ -234,19 +232,18 @@ static void pci_bridge_region_cleanup(PCIBridge *br, PCIBridgeWindows *w)
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_LO]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_HI]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_MEM]));
-    g_free(w);
 }
 
 void pci_bridge_update_mappings(PCIBridge *br)
 {
-    PCIBridgeWindows *w = br->windows;
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
 
@@ -385,7 +382,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     sec_bus->address_space_io = &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
                        4 * GiB);
-    br->windows = pci_bridge_region_init(br);
+    pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
 }
@@ -396,8 +393,8 @@ void pci_bridge_exitfn(PCIDevice *pci_dev)
     PCIBridge *s = PCI_BRIDGE(pci_dev);
     assert(QLIST_EMPTY(&s->sec_bus.child));
     QLIST_REMOVE(&s->sec_bus, sibling);
-    pci_bridge_region_del(s, s->windows);
-    pci_bridge_region_cleanup(s, s->windows);
+    pci_bridge_region_del(s, &s->windows);
+    pci_bridge_region_cleanup(s, &s->windows);
     /* object_unparent() is called automatically during device deletion */
 }
 
-- 
2.31.1


