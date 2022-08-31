Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E905A8699
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:18:03 +0200 (CEST)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTDu-0005RY-3R
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnw-0002GO-QR; Wed, 31 Aug 2022 14:51:12 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnu-0007yY-NL; Wed, 31 Aug 2022 14:51:12 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso19832814fac.1; 
 Wed, 31 Aug 2022 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=s34dAJgJQlTZYXXXG1VAC1DG4e52ZvBe1WrDqTJ/fzg=;
 b=kmzkdhM4IJsxqCs8WeAJwC2EQUkOjlG5hGadujyLOX07VZf/P9HerrC8br947yxEAF
 QlGJ2BAwfnTJu4yuiQEFcVFrfLsWdMSjoB2Nu67ZPiKHmaDAb0M3c9ltTpmWM1gxqelq
 /x8T2QDf9itqhYexEX1c9fvLd/SOIJt9LQirgtbSpNWNsE5x6Dd+647v5UfwPkF1Haey
 TXqoVMFwwl8RUMahjQ+l9nEf2c5/YXj4t56ZDDHEYozhF2yvqLgNbkT7eo2TI33xFeR4
 JxD+acUy8UOLzIiT3WqExqeKMAHhzbDMY9wJwnq0X4U+EQrWO/0614yW+VpjQXEOGsAZ
 JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s34dAJgJQlTZYXXXG1VAC1DG4e52ZvBe1WrDqTJ/fzg=;
 b=ZrH3brsNxYqeOq+xWsw1ovXp68Ke6xi5IJC+sEHMNDvfy1UB5eL+PB3DK7kmQkhADn
 pj8USkd5jYBPQL4+PbqxBC/q21NLbtoH6BbKv44WUD6TPCozIl/QwvWI6egQJftXPxC3
 nuPA9F15KxUTtV3CDQUd5tJtw9kHrKGLpqjdLP9kpgctzKl0TSKcgJIwOQ6xsXUTwHVq
 87u03MQSs4MnGgWkvJD6a21DmunYlw2opklvFyJCxFIVu/O1yTxzMTBSaVaRxQDWBzlj
 Po4qD31jKMU2C/RYpuZgEzkzUJSXWD6/MPSNGl88z7Te73koN7YrvwTQjDgx1kMvoApN
 56eg==
X-Gm-Message-State: ACgBeo3DDrod6vUlUe/eVSo5KlZgodfvb453P41MS0IpXq8QrrdxAPv8
 m4aEu7zcsYHgi0RXkLfwYf4zK8SbvQ0=
X-Google-Smtp-Source: AA6agR7iT0ew1g3iBFYXe5w56puKQ4TcMPYJ6KeyHEDvxXEoA6CV3hlueOmQi9daK7VuAAoNvHmi3g==
X-Received: by 2002:a05:6808:209:b0:342:ed43:2f97 with SMTP id
 l9-20020a056808020900b00342ed432f97mr1711208oie.255.1661971869341; 
 Wed, 31 Aug 2022 11:51:09 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 08/60] ppc/pnv: turn PnvPHB3 into a PnvPHB backend
Date: Wed, 31 Aug 2022 15:49:42 -0300
Message-Id: <20220831185034.23240-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-4-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c         | 27 +++++----------------------
 hw/ppc/pnv.c                   | 21 +++++++++++++++------
 include/hw/pci-host/pnv_phb3.h |  5 ++++-
 include/hw/ppc/pnv.h           |  3 ++-
 4 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 058cbab555..ad9e983fe9 100644
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
@@ -1011,7 +1012,6 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
 static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB3 *phb = PNV_PHB3(dev);
-    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
     int i;
 
@@ -1056,11 +1056,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     /* Controller Registers */
     memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
                           "phb3-regs", 0x1000);
-
-    pnv_phb3_bus_init(dev, phb);
-
-    pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
-                             phb->phb_id, phb->chip_id);
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
@@ -1085,38 +1080,26 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
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
+    DEFINE_PROP_LINK("phb-base", PnvPHB3, phb_base, TYPE_PNV_PHB, PnvPHB *),
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
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(PnvPHB3),
     .class_init    = pnv_phb3_class_init,
     .instance_init = pnv_phb3_instance_init,
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0c3aad430b..5b60735c7a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -43,6 +43,7 @@
 #include "hw/ipmi/ipmi.h"
 #include "target/ppc/mmu-hash64.h"
 #include "hw/pci/msi.h"
+#include "hw/pci-host/pnv_phb.h"
 
 #include "hw/ppc/xics.h"
 #include "hw/qdev-properties.h"
@@ -660,7 +661,8 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb3 = &chip8->phbs[i];
+        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
         ics_pic_print_info(&phb3->lsis, mon);
@@ -1149,7 +1151,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
+        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
     }
 
 }
@@ -1287,9 +1289,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
                                 &chip8->homer.regs);
 
-    /* PHB3 controllers */
+    /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB3 *phb = &chip8->phbs[i];
+        PnvPHB *phb = &chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1982,7 +1984,8 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB3 *phb3 = &chip8->phbs[j];
+            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             if (ics_valid_irq(&phb3->lsis, irq)) {
                 return &phb3->lsis;
@@ -2020,7 +2023,8 @@ static void pnv_ics_resend(XICSFabric *xi)
         ics_resend(&chip8->psi.ics);
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB3 *phb3 = &chip8->phbs[j];
+            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             ics_resend(&phb3->lsis);
             ics_resend(ICS(&phb3->msis));
@@ -2120,8 +2124,13 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
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
index 37c303bf36..21fa90aaff 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -33,6 +33,7 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/pci-host/pnv_phb3.h"
 #include "hw/pci-host/pnv_phb4.h"
+#include "hw/pci-host/pnv_phb.h"
 #include "qom/object.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
@@ -81,7 +82,7 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.37.2


