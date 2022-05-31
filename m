Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039A539924
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:56:41 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9qy-0002Gz-FI
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kG-00010e-JQ; Tue, 31 May 2022 17:49:44 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kE-0003MH-0k; Tue, 31 May 2022 17:49:44 -0400
Received: by mail-oi1-x231.google.com with SMTP id r206so174978oib.8;
 Tue, 31 May 2022 14:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/nbSg1wNwZy94XSJbCOaEw3i/ElMD1AMFjgdqMAtI5E=;
 b=dDLqZkqJ9FTCbqd1QcW1tsoAyCv3WIlAHEIkEYWrJ64BXXFQgT223HQpPOurtpOVBH
 m0HdNFlkJR6PjHE1x4bTnIeXnT0RoV91ObWkcf30mNUnhgQkHagKAH19MSlVvMQX9L5Z
 tHq1zeU1HsAc7rrlObUWAVFvfEVSooPDcxleVeSq2JxDmWMXQ/sq82TpBP49nPR/JluW
 pmNYY93JeExYOnSH8e2iHai/usBLcGxO2hOzW2uoJ2HdwhuIpmnSLc6KmIc0VH+TQHEs
 iX0siIKIfXxhyThH8vYqEOFsS1Cu+mGQwhhwpsDr/R2Aid2FdU884yNPthOH0SXoHegp
 eNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/nbSg1wNwZy94XSJbCOaEw3i/ElMD1AMFjgdqMAtI5E=;
 b=bmjfs8VtEJ7dvieFudzXofdr8TB1R91ZMblwNLsJjuna595Pl4D6WzsaEWqV+pyrph
 AhCro4jIaW5DkY4cNyex87ScetmbwCAfe2cQDvhEnPYeGtpSRfB7vesFzCW6IbGXhwCN
 ePA0uUQSdTs3sibm+skm1nja+Zppsg8I+rI1sZLIvDPxXE6cRvbfecVv+UH52z/dvnmL
 s1GpOlRBj2gfPj/sfnGJJNsdBVEKKRV1s+TW5VHCDW0XrH0F6ujeaiyWTTxSOgHAzrU7
 gre5OjHS+KWFAHJ2flCm2HB0sHxT0dsgLaKYIlPHqYhGdmnxY71lM2OZiLxvfzYuC0HB
 mZ9A==
X-Gm-Message-State: AOAM530nvYhU5DFaFptQI1uRDQ4mVoAfqwetuQ/bY2kiaC0aw3rfItdU
 DnDq39+CuccjQzt+Hau7VEcMC6gMuE2THg==
X-Google-Smtp-Source: ABdhPJxfcfY7ajWkEeG6RfZXBE0aucNZBFHAuqI+MBR0saic2ORmUZLVZjQUYRdVmNuP9ZBIh1hetA==
X-Received: by 2002:a05:6808:300f:b0:2fa:6fd5:9723 with SMTP id
 ay15-20020a056808300f00b002fa6fd59723mr13248416oib.202.1654033780443; 
 Tue, 31 May 2022 14:49:40 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 07/16] ppc/pnv: change PnvPHB4 to be a PnvPHB backend
Date: Tue, 31 May 2022 18:49:08 -0300
Message-Id: <20220531214917.31668-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
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

Change the parent type of the PnvPHB4 device to TYPE_PARENT since the
PCI bus is going to be initialized by the PnvPHB parent. Functions that
needs to access the bus via a PnvPHB4 object can do so via the
phb4->phb_base pointer.

pnv_phb4_pec now creates a PnvPHB object.

The powernv9 machine class will create PnvPHB devices with version '4'.
powernv10 will create using version '5'. Both are using global machine
properties in their class_init() to do that.

These changes will benefit us when adding PnvPHB user creatable devices
for powernv9 and powernv10.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 29 +++++++++--------------------
 hw/pci-host/pnv_phb4_pec.c     |  6 +-----
 hw/ppc/pnv.c                   | 20 +++++++++++++++++++-
 include/hw/pci-host/pnv_phb4.h |  5 ++++-
 4 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ae5494fe72..22cf1c2a5e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -49,7 +49,7 @@ static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
 
 static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
     uint8_t bus, devfn;
 
@@ -145,7 +145,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
 static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
                                      unsigned size, uint64_t val)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
 
     if (size != 4) {
@@ -166,7 +166,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
 static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
                                         unsigned size)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
     uint64_t val;
 
@@ -1608,16 +1608,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pnv_phb4_xscom_realize(phb);
 }
 
-static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
-                                          PCIBus *rootbus)
-{
-    PnvPHB4 *phb = PNV_PHB4(host_bridge);
-
-    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
-             phb->chip_id, phb->phb_id);
-    return phb->bus_path;
-}
-
 /*
  * Address base trigger mode (POWER10)
  *
@@ -1702,19 +1692,18 @@ static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
+        DEFINE_PROP_LINK("phb-base", PnvPHB4, phb_base,
+                         TYPE_PNV_PHB, PnvPHB *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb4_class_init(ObjectClass *klass, void *data)
 {
-    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
     XiveNotifierClass *xfc = XIVE_NOTIFIER_CLASS(klass);
 
-    hc->root_bus_path   = pnv_phb4_root_bus_path;
     dc->realize         = pnv_phb4_realize;
     device_class_set_props(dc, pnv_phb4_properties);
-    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->user_creatable  = false;
 
     xfc->notify         = pnv_phb4_xive_notify;
@@ -1722,7 +1711,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo pnv_phb4_type_info = {
     .name          = TYPE_PNV_PHB4,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .parent        = TYPE_DEVICE,
     .instance_init = pnv_phb4_instance_init,
     .instance_size = sizeof(PnvPHB4),
     .class_init    = pnv_phb4_class_init,
@@ -1785,11 +1774,11 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
     PCIBus *bus = pci_get_bus(pci);
-    PnvPHB4 *phb = NULL;
+    PnvPHB *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB4);
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                         TYPE_PNV_PHB);
 
     if (!phb) {
         error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 61bc0b503e..888ecbe8f3 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -115,8 +115,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
                                         int stack_no,
                                         Error **errp)
 {
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvPHB4 *phb = PNV_PHB4(qdev_new(pecc->phb_type));
+    PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
 
     object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
@@ -130,9 +129,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 081b6839cc..3b0b230e49 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -688,7 +688,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
+    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
+    PnvPHB4 *phb4;
+
+    if (!phb) {
+        return 0;
+    }
+
+    phb4 = (PnvPHB4 *)phb->backend;
 
     if (phb4) {
         pnv_phb4_pic_print_info(phb4, mon);
@@ -2164,8 +2171,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
     static const char compat[] = "qemu,powernv9\0ibm,powernv";
 
+    static GlobalProperty phb_compat[] = {
+        { TYPE_PNV_PHB, "version", "4" },
+    };
+
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
+    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
+
     xfc->match_nvt = pnv_match_nvt;
 
     mc->alias = "powernv";
@@ -2182,8 +2195,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
     static const char compat[] = "qemu,powernv10\0ibm,powernv";
 
+    static GlobalProperty phb_compat[] = {
+        { TYPE_PNV_PHB, "version", "5" },
+    };
+
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");
+    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 90843ac3a9..f22253358f 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -18,6 +18,7 @@
 typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
+typedef struct PnvPHB PnvPHB;
 typedef struct PnvChip PnvChip;
 
 /*
@@ -78,7 +79,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 #define PCI_MMIO_TOTAL_SIZE        (0x1ull << 60)
 
 struct PnvPHB4 {
-    PCIExpressHost parent_obj;
+    DeviceState parent;
+
+    PnvPHB *phb_base;
 
     uint32_t chip_id;
     uint32_t phb_id;
-- 
2.36.1


