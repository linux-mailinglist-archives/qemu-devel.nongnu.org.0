Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778675A8652
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:01:35 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTSxy-0008Hd-Hi
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSo2-0002Zw-RK; Wed, 31 Aug 2022 14:51:18 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSo0-000819-RJ; Wed, 31 Aug 2022 14:51:18 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11e9a7135easo23771390fac.6; 
 Wed, 31 Aug 2022 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=troVGogu7X8ZTdPqZCY391R+T1+U/pSyoui1bciQQW4=;
 b=We+PvQtTxq1kSsBdaX8jTG6BmNWSRI5/AspS+BsMj5MWCKnqGy1xsRB7eCtfOmy8vU
 qt1EAxG95RzkXTNxjKfpxQ2YOaWEgQna+SF55HWjTmCreMooQowt9i2RZd4fUkOky3PD
 E+dmbqRHe+4yeYumtK0mRETa0TSzz45pleDLuiKKZeipr+wCxrUFYAPs4bZ5oHWZIH3W
 UHvp5YsFVnjZMIOL8UHImoJZU+csNTRvOZlZNJQLi5ebw2yP8kW2DTX4Pzo2RnHyQ36B
 zYxYXQYeIVazWo7k7tUo/CVJ4H/7RD7HhNrVUctywttE2iycNmGY+V4mYUdaAjgfjo0C
 sF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=troVGogu7X8ZTdPqZCY391R+T1+U/pSyoui1bciQQW4=;
 b=IMkqQaYhL2MopR4eS9Np8zq5H/WrOLIg25b91f5Bkmqo/fyc321AnDd8Nfls/1ZvUt
 bylJdlSmIIsPRu6s9ZapKjvHm65GqkrMIk23K1mqEiZX7mPzBXf0hvYxq03vvSNkgTeq
 PeHbT8E+GhGXchBXoMIreIxM0pNOTIyoBOjf4oAqX3evepbg5A7sDK8te0fQsj6lksOb
 w+RVROzPQL2l7C/UhR6jwQmDtAG0HR0kpbZ/0neDsicmjrheHDh3D6Lh9VMhjb+ThrEG
 f9p0TjpCn6mvwX6qpnjnpPwvLHbChXj4nVk5ntz5imu1+Am9zZvftytd6XTaqoXsYRsj
 pWYw==
X-Gm-Message-State: ACgBeo1bIElmOThwy//sLzshuvvnHu1Yk2zMYOkHMwOiHgrUdETvKRXf
 Ds2yJ8CbMzrcIwniXijvy5I1hg3CT4Q=
X-Google-Smtp-Source: AA6agR6iEBCHSn18/7FF1zQz3gWITguiRp3Oq8Wk1aSdTzrCeP/Wov4jwpg5hse42Zv6ozhO6hkxyA==
X-Received: by 2002:a05:6808:10d5:b0:342:fde4:3766 with SMTP id
 s21-20020a05680810d500b00342fde43766mr1780784ois.123.1661971874582; 
 Wed, 31 Aug 2022 11:51:14 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 10/60] ppc/pnv: turn PnvPHB4 into a PnvPHB backend
Date: Wed, 31 Aug 2022 15:49:44 -0300
Message-Id: <20220831185034.23240-11-danielhb413@gmail.com>
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-6-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 30 +++++-------------------------
 hw/pci-host/pnv_phb4_pec.c     |  3 +--
 hw/ppc/pnv.c                   | 20 +++++++++++++++++---
 include/hw/pci-host/pnv_phb4.h |  5 ++++-
 4 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a7425927fb..144c437025 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -33,7 +33,7 @@
 
 static PCIDevice *pnv_phb4_find_cfg_dev(PnvPHB4 *phb)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
     uint8_t bus, devfn;
 
@@ -129,7 +129,7 @@ static uint64_t pnv_phb4_config_read(PnvPHB4 *phb, unsigned off,
 static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
                                      unsigned size, uint64_t val)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
 
     if (size != 4) {
@@ -150,7 +150,7 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
 static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
                                         unsigned size)
 {
-    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
+    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
     PCIDevice *pdev;
     uint64_t val;
 
@@ -1558,8 +1558,6 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
-    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
     char name[32];
@@ -1573,12 +1571,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb4_reg_ops, phb,
                           name, 0x2000);
 
-    pnv_phb4_bus_init(dev, phb);
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(pci, pecc->rp_model,
-                             phb->phb_id, phb->chip_id);
-
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs = PNV_PHB4_MAX_INTs;
@@ -1598,16 +1590,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
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
@@ -1692,19 +1674,17 @@ static Property pnv_phb4_properties[] = {
     DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
     DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                      PnvPhb4PecState *),
+    DEFINE_PROP_LINK("phb-base", PnvPHB4, phb_base, TYPE_PNV_PHB, PnvPHB *),
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
@@ -1712,7 +1692,7 @@ static void pnv_phb4_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo pnv_phb4_type_info = {
     .name          = TYPE_PNV_PHB4,
-    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .parent        = TYPE_DEVICE,
     .instance_init = pnv_phb4_instance_init,
     .instance_size = sizeof(PnvPHB4),
     .class_init    = pnv_phb4_class_init,
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index c9aaf1c28e..4a0a9fbe8b 100644
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
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5b60735c7a..ae6cd14a8a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -672,11 +672,14 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
 {
     Monitor *mon = opaque;
-    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
+    PnvPHB *phb =  (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
 
-    if (phb4) {
-        pnv_phb4_pic_print_info(phb4, mon);
+    if (!phb) {
+        return 0;
     }
+
+    pnv_phb4_pic_print_info(PNV_PHB4(phb->backend), mon);
+
     return 0;
 }
 
@@ -2147,8 +2150,14 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
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
@@ -2165,8 +2174,13 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
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
2.37.2


