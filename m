Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A3A6EDD2D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOY-0002t6-Dz; Tue, 25 Apr 2023 03:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNw-0001vE-UD
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNt-0006vV-No
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/kHw1Czuudqd7AtavZ32mV+qPmla6m9ig97FaNqQrg=;
 b=Yd30ZWZ0vatGdeg7ZWY7N70EgKjeqAmcDQFnIdf1EuSE2ajoIqSXL3HSbtZ/DEYpoa8Iun
 S91olpL9rzmW/pp7mw1GdDdzGwCEwoHifLvNVHOl3S/ewZjbPDijcDB0UdCccPWwucW0Ua
 39WNoESXmXMwNWOzVEmfVcbMCaVg46Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-g-WlJl0FN-CJgvuYvxskfw-1; Tue, 25 Apr 2023 03:46:43 -0400
X-MC-Unique: g-WlJl0FN-CJgvuYvxskfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f175a24fd1so29730325e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408802; x=1685000802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/kHw1Czuudqd7AtavZ32mV+qPmla6m9ig97FaNqQrg=;
 b=fyrthlyUpNxOxlc49oxlVcN9dTTx/Tqwu4xyAHz8/kqtLtq8JxDrMTu+ebqwIka+WR
 K9Pu7prycouIl+TTu7MTQDHyl7MCv4TENAGfrUY+e3LwwklBFuLbFz+ZKgcJKxBfqS9u
 jGDsDDK9w0FvMW/VqETdHtg8wN5Fv6vhbbCCecFAjWmMJkCQ2LYSbm9JAtlAIeKsE9vO
 P/BDksCWet3YSjTZr63mv7bzdmDWfqKNZYz50heCiHvk8dzrzjJqOAWwB0PE0BQYtEJD
 +csY+MyBbQgQqibFP+BNafzMishzpgKS3ZCsmQZ0XEnrNLRimPTDQozEH/4oKjaIPSXj
 jwCg==
X-Gm-Message-State: AAQBX9ctVEoRklcpHH+wVmy7P22hSR5d91z9lAaXLv7JinYUOjUaRMM3
 36MFg3KBJUaPn8sZd0iy74n/zWkO/bk3cdSX2fRXobVnTht8ZM+kbdbr0aGtWZMjkipvL5BSWH5
 x3R9eU8t9ZFragVFLrF2nxEmsLtaGEV4EFZXDJ1VfXfXOIelGXM7ewdnbh/I2zB7QT3yn
X-Received: by 2002:a7b:c045:0:b0:3f1:662a:93c4 with SMTP id
 u5-20020a7bc045000000b003f1662a93c4mr10023190wmc.36.1682408802264; 
 Tue, 25 Apr 2023 00:46:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkLGZpX1jQd7EVFiamYn7kQX4eG/R1ArGCYmp+D37yhYE5NE/QkRBKjwqeTZdx6GsmmRraLQ==
X-Received: by 2002:a7b:c045:0:b0:3f1:662a:93c4 with SMTP id
 u5-20020a7bc045000000b003f1662a93c4mr10023159wmc.36.1682408801826; 
 Tue, 25 Apr 2023 00:46:41 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003eeb1d6a470sm14135645wmq.13.2023.04.25.00.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:41 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 31/31] hw/pci-bridge: Make PCIe and CXL PXB Devices inherit
 from TYPE_PXB_DEV
Message-ID: <c28db9e0002df2abf88283b41dce0be17e8b0888.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Previously, PXB_CXL_DEVICE, PXB_PCIE_DEVICE and PXB_DEVICE all
have PCI_DEVICE as their direct parent but share a common state
struct PXBDev. convert_to_pxb() is used to get the PXBDev
instance from which ever of these types it is called on.

This patch switches to an explicit hierarchy based on shared
functionality.  To allow use of OBJECT_DECLARE_SIMPLE_TYPE()
whilst minimizing code changes, all types are renamed to have
the postfix _DEV rather than _DEVICE.  The new heirarchy
has PXB_CXL_DEV with parent PXB_PCIE_DEV which in turn
has parent PXB_DEV which continues to have parent PCI_DEVICE.

This allows simple use of PXB_DEV() etc rather than a custom function
+ removal of duplicated properties and moving the CXL specific
elements out of struct PXBDev.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230420142750.6950-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h                |  4 +-
 include/hw/pci/pci_bridge.h         | 30 ++++++++++-----
 hw/acpi/cxl.c                       | 11 +++---
 hw/cxl/cxl-host.c                   |  4 +-
 hw/pci-bridge/pci_expander_bridge.c | 59 ++++++++++-------------------
 5 files changed, 50 insertions(+), 58 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index b2cffbb364..c453983e83 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -23,12 +23,12 @@
 
 #define CXL_WINDOW_MAX 10
 
-typedef struct PXBDev PXBDev;
+typedef struct PXBCXLDev PXBCXLDev;
 
 typedef struct CXLFixedWindow {
     uint64_t size;
     char **targets;
-    PXBDev *target_hbs[8];
+    PXBCXLDev *target_hbs[8];
     uint8_t num_targets;
     uint8_t enc_int_ways;
     uint8_t enc_int_gran;
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 1677176b2a..01670e9e65 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -84,7 +84,7 @@ struct PCIBridge {
 #define PCI_BRIDGE_DEV_PROP_SHPC       "shpc"
 typedef struct CXLHost CXLHost;
 
-struct PXBDev {
+typedef struct PXBDev {
     /*< private >*/
     PCIDevice parent_obj;
     /*< public >*/
@@ -92,15 +92,27 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
-    bool hdm_for_passthrough;
-    struct cxl_dev {
-        CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
-    } cxl;
-};
+} PXBDev;
 
-#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
-                         TYPE_PXB_CXL_DEVICE)
+typedef struct PXBPCIEDev {
+    /*< private >*/
+    PXBDev parent_obj;
+} PXBPCIEDev;
+
+#define TYPE_PXB_DEV "pxb"
+OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)
+
+typedef struct PXBCXLDev {
+    /*< private >*/
+    PXBPCIEDev parent_obj;
+    /*< public >*/
+
+    bool hdm_for_passthrough;
+    CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
+} PXBCXLDev;
+
+#define TYPE_PXB_CXL_DEV "pxb-cxl"
+OBJECT_DECLARE_SIMPLE_TYPE(PXBCXLDev, PXB_CXL_DEV)
 
 int pci_bridge_ssvid_init(PCIDevice *dev, uint8_t offset,
                           uint16_t svid, uint16_t ssid,
diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 2bf8c07993..92b46bc932 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -30,9 +30,10 @@
 #include "qapi/error.h"
 #include "qemu/uuid.h"
 
-static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
+static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
 {
-    SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
+    PXBDev *pxb = PXB_DEV(cxl);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl_host_bridge);
     struct MemoryRegion *mr = sbd->mmio[0].memory;
 
     /* Type */
@@ -45,7 +46,7 @@ static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
     build_append_int_noprefix(table_data, 32, 2);
 
     /* UID - currently equal to bus number */
-    build_append_int_noprefix(table_data, cxl->bus_nr, 4);
+    build_append_int_noprefix(table_data, pxb->bus_nr, 4);
 
     /* Version */
     build_append_int_noprefix(table_data, 1, 4);
@@ -112,7 +113,7 @@ static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
         /* Host Bridge List (list of UIDs - currently bus_nr) */
         for (i = 0; i < fw->num_targets; i++) {
             g_assert(fw->target_hbs[i]);
-            build_append_int_noprefix(table_data, fw->target_hbs[i]->bus_nr, 4);
+            build_append_int_noprefix(table_data, PXB_DEV(fw->target_hbs[i])->bus_nr, 4);
         }
     }
 }
@@ -121,7 +122,7 @@ static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
 {
     Aml *cedt = opaque;
 
-    if (object_dynamic_cast(obj, TYPE_PXB_CXL_DEVICE)) {
+    if (object_dynamic_cast(obj, TYPE_PXB_CXL_DEV)) {
         cedt_build_chbs(cedt->buf, PXB_CXL_DEV(obj));
     }
 
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 6e923ceeaf..034c7805b3 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -84,7 +84,7 @@ void cxl_fmws_link_targets(CXLState *cxl_state, Error **errp)
                 bool ambig;
 
                 o = object_resolve_path_type(fw->targets[i],
-                                             TYPE_PXB_CXL_DEVICE,
+                                             TYPE_PXB_CXL_DEV,
                                              &ambig);
                 if (!o) {
                     error_setg(errp, "Could not resolve CXLFM target %s",
@@ -141,7 +141,7 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
     addr += fw->base;
 
     rb_index = (addr / cxl_decode_ig(fw->enc_int_gran)) % fw->num_targets;
-    hb = PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl.cxl_host_bridge);
+    hb = PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl_host_bridge);
     if (!hb || !hb->bus || !pci_bus_is_cxl(hb->bus)) {
         return NULL;
     }
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index a78327b5f2..613857b601 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -50,24 +50,8 @@ struct PXBBus {
     char bus_path[8];
 };
 
-#define TYPE_PXB_DEVICE "pxb"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
-                         TYPE_PXB_DEVICE)
-
-#define TYPE_PXB_PCIE_DEVICE "pxb-pcie"
-DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
-                         TYPE_PXB_PCIE_DEVICE)
-
-static PXBDev *convert_to_pxb(PCIDevice *dev)
-{
-    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
-    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
-        return PXB_CXL_DEV(dev);
-    }
-
-    return pci_bus_is_express(pci_get_bus(dev))
-        ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
-}
+#define TYPE_PXB_PCIE_DEV "pxb-pcie"
+OBJECT_DECLARE_SIMPLE_TYPE(PXBPCIEDev, PXB_PCIE_DEV)
 
 static GList *pxb_dev_list;
 
@@ -89,14 +73,14 @@ bool cxl_get_hb_passthrough(PCIHostState *hb)
 
 static int pxb_bus_num(PCIBus *bus)
 {
-    PXBDev *pxb = convert_to_pxb(bus->parent_dev);
+    PXBDev *pxb = PXB_DEV(bus->parent_dev);
 
     return pxb->bus_nr;
 }
 
 static uint16_t pxb_bus_numa_node(PCIBus *bus)
 {
-    PXBDev *pxb = convert_to_pxb(bus->parent_dev);
+    PXBDev *pxb = PXB_DEV(bus->parent_dev);
 
     return pxb->numa_node;
 }
@@ -154,7 +138,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
 
     pxb_host = PCI_HOST_BRIDGE(dev);
     pxb_bus = pxb_host->bus;
-    pxb_dev = convert_to_pxb(pxb_bus->parent_dev);
+    pxb_dev = PXB_DEV(pxb_bus->parent_dev);
     position = g_list_index(pxb_dev_list, pxb_dev);
     assert(position >= 0);
 
@@ -212,8 +196,8 @@ static void pxb_cxl_realize(DeviceState *dev, Error **errp)
  */
 void pxb_cxl_hook_up_registers(CXLState *cxl_state, PCIBus *bus, Error **errp)
 {
-    PXBDev *pxb =  PXB_CXL_DEV(pci_bridge_get_device(bus));
-    CXLHost *cxl = pxb->cxl.cxl_host_bridge;
+    PXBCXLDev *pxb =  PXB_CXL_DEV(pci_bridge_get_device(bus));
+    CXLHost *cxl = pxb->cxl_host_bridge;
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
     struct MemoryRegion *mr = &cxl_cstate->crb.component_registers;
     hwaddr offset;
@@ -299,7 +283,7 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
 
 static void pxb_cxl_dev_reset(DeviceState *dev)
 {
-    CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
+    CXLHost *cxl = PXB_CXL_DEV(dev)->cxl_host_bridge;
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
     PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
     uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
@@ -337,7 +321,7 @@ static gint pxb_compare(gconstpointer a, gconstpointer b)
 static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
                                    Error **errp)
 {
-    PXBDev *pxb = convert_to_pxb(dev);
+    PXBDev *pxb = PXB_DEV(dev);
     DeviceState *ds, *bds = NULL;
     PCIBus *bus;
     const char *dev_name = NULL;
@@ -365,7 +349,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
         bus->flags |= PCI_BUS_CXL;
-        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge = PXB_CXL_HOST(ds);
+        PXB_CXL_DEV(dev)->cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
         bds = qdev_new("pci-bridge");
@@ -418,7 +402,7 @@ static void pxb_dev_realize(PCIDevice *dev, Error **errp)
 
 static void pxb_dev_exitfn(PCIDevice *pci_dev)
 {
-    PXBDev *pxb = convert_to_pxb(pci_dev);
+    PXBDev *pxb = PXB_DEV(pci_dev);
 
     pxb_dev_list = g_list_remove(pxb_dev_list, pxb);
 }
@@ -449,7 +433,7 @@ static void pxb_dev_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo pxb_dev_info = {
-    .name          = TYPE_PXB_DEVICE,
+    .name          = TYPE_PXB_DEV,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PXBDev),
     .class_init    = pxb_dev_class_init,
@@ -481,15 +465,14 @@ static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_BRIDGE_HOST;
 
     dc->desc = "PCI Express Expander Bridge";
-    device_class_set_props(dc, pxb_dev_properties);
     dc->hotpluggable = false;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pxb_pcie_dev_info = {
-    .name          = TYPE_PXB_PCIE_DEVICE,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PXBDev),
+    .name          = TYPE_PXB_PCIE_DEV,
+    .parent        = TYPE_PXB_DEV,
+    .instance_size = sizeof(PXBPCIEDev),
     .class_init    = pxb_pcie_dev_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -510,11 +493,7 @@ static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
 }
 
 static Property pxb_cxl_dev_properties[] = {
-    /* Note: 0 is not a legal PXB bus number. */
-    DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
-    DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
-    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
-    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBDev, hdm_for_passthrough, false),
+    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBCXLDev, hdm_for_passthrough, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -540,9 +519,9 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo pxb_cxl_dev_info = {
-    .name          = TYPE_PXB_CXL_DEVICE,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PXBDev),
+    .name          = TYPE_PXB_CXL_DEV,
+    .parent        = TYPE_PXB_PCIE_DEV,
+    .instance_size = sizeof(PXBCXLDev),
     .class_init    = pxb_cxl_dev_class_init,
     .interfaces =
         (InterfaceInfo[]){
-- 
MST


