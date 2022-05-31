Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D0539920
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:55:49 +0200 (CEST)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9q8-0000tS-Lu
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k8-0000XA-6D; Tue, 31 May 2022 17:49:36 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9k6-0003LF-4K; Tue, 31 May 2022 17:49:35 -0400
Received: by mail-oi1-x22f.google.com with SMTP id s188so198506oie.4;
 Tue, 31 May 2022 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFFblAiaKG7VJmshF6eZpcZ+0cGDJ3xmDg40+wlQ7H8=;
 b=qPDOPAmFU9PXzKe8bepY2XbbaEx/F1wxnsHXwHeoof0rdfFQp8/C85YNIuj6F2CYop
 EDVQSpe0V3E72bxvIdo+AM3ckuX+5XKWEecaNG5Q0sL+AabiYUIuOsCtCpM3c0e9tp8L
 t+mXvTHqqY6KKAkd0mZyF3ezn8GgRJOwX8O/sfY0CH6TczLr6kEtg6MlkOd2wseyqp6T
 thhilG2O8qgKEb8oYsXyWMNj7omHJiU6EKcVoT4xYMx7LQHqq785PEFz7l9rqC50eNsx
 IubQ/1bYKp9R52yghr999C4nK36GkHtWnL6A8ZTAUyZHRA0GTtcwOV8RK+pXXPF5x/9z
 5Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFFblAiaKG7VJmshF6eZpcZ+0cGDJ3xmDg40+wlQ7H8=;
 b=sghUHEDe0O4vWgw/Bc3ldH82Q9YHEjEmwY2FDSFjfH3fHDebD5pRgG5f5NuV9d+VSO
 mTfMgXzbHEDion8C5SVrPYja/raZOst337HsS6sPaarv6y6MRl7QTsX2sB2MZjngwiXn
 JQ2lavENbP3lPzhGNGJj4pjtHTXOe5EVDrlpzFnFmecVyjP+3CBtKjX6eqMtD21fHutu
 Ne/OOtnjgdnokAvinh4ahDrkwX3fnevFgJvJVs6EXjBIxs7cmojh+ea1aEQftEu+t4uy
 qb6VVAKgYnYEifCG82ITZGb33jOXW0l/iaaISocJguTou37LaAWfsUweYm99ZdhzYcxE
 tacQ==
X-Gm-Message-State: AOAM530Gv8JkkT8fE4bk2cvPPQonavBCfMNd9iH7FH/me2o3nVaCd1zi
 kavzg8z3a4P1k+25ckkzY4FaE+rYKDuDyw==
X-Google-Smtp-Source: ABdhPJzT9kbUmiy7XWwfc0e4RRnDxdFVO4J70IzPjJzAbqDtf/4+KODF55WlPtqG9oTt/MjXt/qmGg==
X-Received: by 2002:a54:4383:0:b0:32c:80a:2f4d with SMTP id
 u3-20020a544383000000b0032c080a2f4dmr7552731oiv.272.1654033772615; 
 Tue, 31 May 2022 14:49:32 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 04/16] ppc/pnv: change PnvPHB3 to be a PnvPHB backend
Date: Tue, 31 May 2022 18:49:05 -0300
Message-Id: <20220531214917.31668-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need a handful of changes that needs to be done in a single swoop to
turn PnvPHB3 into a PnvPHB backend.

In the PnvPHB3, since the PnvPHB device implements PCIExpressHost and
will hold the PCI bus, change PnvPHB3 parent to TYPE_DEVICE. There are a
couple of instances in pnv_phb3.c that needs to access the PCI bus, so a
phb_base pointer is added to allow access to the parent PnvPHB. The
PnvPHB3 root port will now be connected to a PnvPHB object.

In pnv.c, the powernv8 machine chip8 will now hold an array of PnvPHB
objects.  pnv_get_phb3_child() needs to be adapted to return the PnvPHB3
backend from the PnvPHB child. A global property is added in
pnv_machine_power8_class_init() to ensure that all PnvPHBs are created
with phb->version = 3.

After all these changes we're still able to boot a powernv8 machine with
default settings. The real gain will come with user created PnvPHB
devices, coming up next.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 29 ++++++++---------------------
 hw/ppc/pnv.c                   | 21 +++++++++++++++++----
 include/hw/pci-host/pnv_phb3.h |  5 ++++-
 include/hw/ppc/pnv.h           |  3 ++-
 4 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 60584e2aae..a39aa0e8c4 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -11,6 +11,7 @@
 #include "qapi/visitor.h"
 #include "qapi/error.h"
 #include "hw/pci-host/pnv_phb3_regs.h"
+#include "hw/pci-host/pnv_phb.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pcie_port.h"
@@ -26,7 +27,7 @@
 
 static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
     uint8_t bus, devfn;
 
@@ -590,7 +591,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
 uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
 {
     PnvPHB3 *phb = opaque;
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     uint64_t val;
 
     if ((off & 0xfffc) == PHB_CONFIG_DATA) {
@@ -1057,8 +1058,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
                           "phb3-regs", 0x1000);
 
     pnv_phb3_bus_init(dev, phb);
-
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1083,38 +1082,26 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
     pnv_phb3_check_all_m64s(phb);
 }
 
-static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
-                                          PCIBus *rootbus)
-{
-    PnvPHB3 *phb = PNV_PHB3(host_bridge);
-
-    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
-             phb->chip_id, phb->phb_id);
-    return phb->bus_path;
-}
-
 static Property pnv_phb3_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
         DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
+        DEFINE_PROP_LINK("phb-base", PnvPHB3, phb_base, TYPE_PNV_PHB, PnvPHB *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb3_class_init(ObjectClass *klass, void *data)
 {
-    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    hc->root_bus_path = pnv_phb3_root_bus_path;
     dc->realize = pnv_phb3_realize;
     device_class_set_props(dc, pnv_phb3_properties);
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->user_creatable = false;
 }
 
 static const TypeInfo pnv_phb3_type_info = {
     .name          = TYPE_PNV_PHB3,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .parent = TYPE_DEVICE,
     .instance_size = sizeof(PnvPHB3),
     .class_init    = pnv_phb3_class_init,
     .instance_init = pnv_phb3_instance_init,
@@ -1146,11 +1133,11 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
     PCIBus *bus = pci_get_bus(pci);
-    PnvPHB3 *phb = NULL;
+    PnvPHB *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB3);
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                         TYPE_PNV_PHB);
 
     if (!phb) {
         error_setg(errp,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index aaf4d241c3..6cd0af9adf 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -43,6 +43,7 @@
 #include "hw/ipmi/ipmi.h"
 #include "target/ppc/mmu-hash64.h"
 #include "hw/pci/msi.h"
+#include "hw/pci-host/pnv_phb.h"
 
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
@@ -654,7 +655,13 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
 
 static PnvPHB3 *pnv_get_phb3_child(Object *child)
 {
-    return (PnvPHB3 *)object_dynamic_cast(child, TYPE_PNV_PHB3);
+    PnvPHB *phb = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
+
+    if (!phb) {
+        return NULL;
+    }
+
+    return (PnvPHB3 *)phb->backend;
 }
 
 static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
@@ -1160,7 +1167,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
+        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
     }
 
 }
@@ -1282,9 +1289,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
                                 &chip8->homer.regs);
 
-    /* PHB3 controllers */
+    /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb = &chip8->phbs[i];
+        PnvPHB *phb = &chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1957,6 +1964,7 @@ static int pnv_ics_get_child(Object *child, void *opaque)
             args->ics = ICS(&phb3->msis);
         }
     }
+
     return args->ics ? 1 : 0;
 }
 
@@ -2112,8 +2120,13 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
     PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
     static const char compat[] = "qemu,powernv8\0qemu,powernv\0ibm,powernv";
 
+    static GlobalProperty phb_compat[] = {
+        { TYPE_PNV_PHB, "version", "3" },
+    };
+
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
+    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
 
     xic->icp_get = pnv_icp_get;
     xic->ics_get = pnv_ics_get;
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 1375f18fc1..3b9ff1096a 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -14,6 +14,7 @@
 #include "hw/pci/pcie_port.h"
 #include "hw/ppc/xics.h"
 #include "qom/object.h"
+#include "hw/pci-host/pnv_phb.h"
 
 typedef struct PnvPHB3 PnvPHB3;
 typedef struct PnvChip PnvChip;
@@ -127,7 +128,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
 #define PCI_MMIO_TOTAL_SIZE   (0x1ull << 60)
 
 struct PnvPHB3 {
-    PCIExpressHost parent_obj;
+    DeviceState parent;
+
+    PnvPHB *phb_base;
 
     uint32_t chip_id;
     uint32_t phb_id;
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 86cb7d7f97..4595db418e 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -32,6 +32,7 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/pci-host/pnv_phb4.h"
+#include "hw/pci-host/pnv_phb.h"
 #include "qom/object.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
@@ -80,7 +81,7 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.36.1


