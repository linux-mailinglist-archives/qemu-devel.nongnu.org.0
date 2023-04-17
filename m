Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F16E4923
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:02:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOTX-00025Z-6D; Mon, 17 Apr 2023 09:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOTS-00024y-Kj
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOTP-0005Ln-5h
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681736444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2mzfL4sbQi6oPkSqKMVnFO+H+wTU4TACJMux88Q7NA=;
 b=iUAzir+UnhsBbozvqpyja0f0vewFKHvEIWzKcmrzo79puuPiYDw6FUMreSIYGd303SfvKP
 PQzStSD/di8ORmlgyXlglqHsoFKjVQp3za33mr0b1kfV+XnJzxlHk8nK6ZOqe6xyUA9QXz
 MIxasomwKUSEmoY2BzGhzWSA/2Dbj2o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-ge9_wj5fN_iBdngIFJW3hg-1; Mon, 17 Apr 2023 09:00:43 -0400
X-MC-Unique: ge9_wj5fN_iBdngIFJW3hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70D932807D75;
 Mon, 17 Apr 2023 13:00:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A9B62166B29;
 Mon, 17 Apr 2023 13:00:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Fan Ni <fan.ni@samsung.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] Revert "hw/pxb-cxl: Support passthrough HDM Decoders
 unless overridden"
Date: Mon, 17 Apr 2023 15:00:36 +0200
Message-Id: <20230417130037.236747-2-thuth@redhat.com>
In-Reply-To: <20230417130037.236747-1-thuth@redhat.com>
References: <20230417130037.236747-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This reverts commit 154070eaf6597c47f64c3ea917bcba62427ae61f.

The pxb_cxl_dev_reset() function tries to cast the device via
PXB_DEV(), however the function belongs to TYPE_PXB_CXL_DEVICE
which is not derived from TYPE_PXB_DEVICE. So this causes QEMU
to abort in case the QOM checks have been enabled with the
"--enable-qom-cast-debug" configure option. Thus revert this
faulty patch so we can enable the qom cast debug switch by de-
fault again - and the pxb-cxl code should be redone in a proper
way later.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/cxl/cxl.h                |  1 -
 include/hw/cxl/cxl_component.h      |  1 -
 include/hw/pci/pci_bridge.h         |  1 -
 hw/cxl/cxl-host.c                   | 31 ++++++++------------
 hw/pci-bridge/pci_expander_bridge.c | 44 ++++-------------------------
 5 files changed, 17 insertions(+), 61 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index b2cffbb364..b161be59b7 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -49,7 +49,6 @@ struct CXLHost {
     PCIHostState parent_obj;
 
     CXLComponentState cxl_cstate;
-    bool passthrough;
 };
 
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 42c7e581a7..ec4203b83f 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -247,7 +247,6 @@ static inline hwaddr cxl_decode_ig(int ig)
 }
 
 CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
-bool cxl_get_hb_passthrough(PCIHostState *hb);
 
 void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
 void cxl_doe_cdat_release(CXLComponentState *cxl_cstate);
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 1677176b2a..68b88ec5e4 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -92,7 +92,6 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
-    bool hdm_for_passthrough;
     struct cxl_dev {
         CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
     } cxl;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 6e923ceeaf..3c1ec8732a 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -146,28 +146,21 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
         return NULL;
     }
 
-    if (cxl_get_hb_passthrough(hb)) {
-        rp = pcie_find_port_first(hb->bus);
-        if (!rp) {
-            return NULL;
-        }
-    } else {
-        hb_cstate = cxl_get_hb_cstate(hb);
-        if (!hb_cstate) {
-            return NULL;
-        }
+    hb_cstate = cxl_get_hb_cstate(hb);
+    if (!hb_cstate) {
+        return NULL;
+    }
 
-        cache_mem = hb_cstate->crb.cache_mem_registers;
+    cache_mem = hb_cstate->crb.cache_mem_registers;
 
-        target_found = cxl_hdm_find_target(cache_mem, addr, &target);
-        if (!target_found) {
-            return NULL;
-        }
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
 
-        rp = pcie_find_port_by_pn(hb->bus, target);
-        if (!rp) {
-            return NULL;
-        }
+    rp = pcie_find_port_by_pn(hb->bus, target);
+    if (!rp) {
+        return NULL;
     }
 
     d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index ead33f0c05..e752a21292 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
-#include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci-bridge/pci_expander_bridge.h"
@@ -80,13 +79,6 @@ CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb)
     return &host->cxl_cstate;
 }
 
-bool cxl_get_hb_passthrough(PCIHostState *hb)
-{
-    CXLHost *host = PXB_CXL_HOST(hb);
-
-    return host->passthrough;
-}
-
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
@@ -297,32 +289,15 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
     return pin - PCI_SLOT(pxb->devfn);
 }
 
-static void pxb_cxl_dev_reset(DeviceState *dev)
+static void pxb_dev_reset(DeviceState *dev)
 {
     CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
-    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
     uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
     uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
-    int dsp_count = 0;
 
     cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
-    /*
-     * The CXL specification allows for host bridges with no HDM decoders
-     * if they only have a single root port.
-     */
-    if (!PXB_DEV(dev)->hdm_for_passthrough) {
-        dsp_count = pcie_count_ds_ports(hb->bus);
-    }
-    /* Initial reset will have 0 dsp so wait until > 0 */
-    if (dsp_count == 1) {
-        cxl->passthrough = true;
-        /* Set Capability ID in header to NONE */
-        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
-    } else {
-        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
-                         8);
-    }
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
 }
 
 static gint pxb_compare(gconstpointer a, gconstpointer b)
@@ -506,18 +481,9 @@ static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
     }
 
     pxb_dev_realize_common(dev, CXL, errp);
-    pxb_cxl_dev_reset(DEVICE(dev));
+    pxb_dev_reset(DEVICE(dev));
 }
 
-static Property pxb_cxl_dev_properties[] = {
-    /* Note: 0 is not a legal PXB bus number. */
-    DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
-    DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
-    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
-    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBDev, hdm_for_passthrough, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc   = DEVICE_CLASS(klass);
@@ -531,12 +497,12 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
      */
 
     dc->desc = "CXL Host Bridge";
-    device_class_set_props(dc, pxb_cxl_dev_properties);
+    device_class_set_props(dc, pxb_dev_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 
     /* Host bridges aren't hotpluggable. FIXME: spec reference */
     dc->hotpluggable = false;
-    dc->reset = pxb_cxl_dev_reset;
+    dc->reset = pxb_dev_reset;
 }
 
 static const TypeInfo pxb_cxl_dev_info = {
-- 
2.31.1


