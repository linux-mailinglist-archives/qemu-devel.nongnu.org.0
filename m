Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E351E96B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:23:01 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnQ16-0001Pg-R7
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlk-0005yv-Tg; Sat, 07 May 2022 15:07:09 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlj-0001ah-C8; Sat, 07 May 2022 15:07:08 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so7226389ote.8; 
 Sat, 07 May 2022 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxLQmzrsOhVyYC1L9dTwslzLk5NoF2PfkyKaMt8UvxE=;
 b=gsAdwrUZ4NlV2WK6vFClWV+FUs9WD7YhM2SlUn6/ak3oU5wX89aSpT9S5/iGQsmLWT
 C2NCnOMz8pJMc9mFQe4iBYldD54dcqMsE3aT39gSUsCGtdXSEfR9xnC5uSIwuu62AxDi
 GhQIU+RR9AXyRzLu4mJsiuMA2SGG7kqWYecrqqDHfjAm83NwSLaQYs1zlPUI4Dps/OJm
 408+Fusajacur/A1d+SKjOXPcBouu1RjP7MmhUwFyTxDRd0yxK+2zMDfQ73nEfGyJ3h/
 kV0m9RNE/DRAAKg+va99UizEJZFFaoQsyKsKKMsuTxiYkWD7AGRuK6HYS8lIexkvCQ6u
 XO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxLQmzrsOhVyYC1L9dTwslzLk5NoF2PfkyKaMt8UvxE=;
 b=KHl3nPhz5b16Ki4lmbMLSjhODOTnpbWhbJpnTSR01nW9TwSEsu0l+yqx+x6E+oN3S8
 YRmg7EgPVZbf8OdjiqXlEN22Ca1Ack2fyoKoC5+CeUQMCPdYL21YF3VipmYVhQCmqIiH
 oeEiWaZ998xZAjgPXm8mmmzxR+jsCy00aBr4EzC2zx95b4Vbt/MQigltTDvMVWhV/Inf
 l/jNs++TKGiLPMorDqz3J++40uxx1jHlE2FT10QdjQWzQnGYSLQRtGnaqrd/ZZtV75DD
 yn3JGBrna8OYNun+uYlaZ63bvKaAPWRHQGhrgul21PwEWC1EQew60nK9ahKzgC+bGSq9
 FAww==
X-Gm-Message-State: AOAM530U2YcufQ8iWOWLSOEThjrjev8y4931lnKiF97WPUH5mqrLTnhF
 mcNjAFQcYKfas3xPHsZIGmxHIfw4RSI=
X-Google-Smtp-Source: ABdhPJyieuAD3TBtcapVb3ad/eVqi8RiGF36HcUmY/PVS+jEOhJ2tHRsqTMMELvBuGlt2lktci9Gbg==
X-Received: by 2002:a05:6830:2307:b0:606:1573:172a with SMTP id
 u7-20020a056830230700b006061573172amr3250433ote.334.1651950425853; 
 Sat, 07 May 2022 12:07:05 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 14/17] ppc/pnv: add pnv-phb-root-port device
Date: Sat,  7 May 2022 16:06:21 -0300
Message-Id: <20220507190624.507419-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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

We have two very similar root-port devices, pnv-phb3-root-port and
pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
that, until now, has no additional attributes.

The main difference between the PHB3 and PHB4 root ports is that
pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
other differences can be merged in a single device without too much
trouble.

This patch introduces the unified pnv-phb-root-port that, in time, will
be used as the default root port for the pnv-phb device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c         | 93 +++++++++++++++++++++++++++++++++++
 include/hw/pci-host/pnv_phb.h | 11 +++++
 2 files changed, 104 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index e03062a494..369dc21931 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -157,9 +157,102 @@ static const TypeInfo pnv_phb_type_info = {
     },
 };
 
+static void pnv_phb_root_port_reset(DeviceState *dev)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PCIDevice *d = PCI_DEVICE(dev);
+    uint8_t *conf = d->config;
+    int pnv_current_machine = pnv_phb_get_current_machine();
+
+    rpc->parent_reset(dev);
+
+    if (pnv_current_machine == PNV_MACHINE_POWER8) {
+        return;
+    }
+
+    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
+                               PCI_IO_RANGE_MASK & 0xff);
+    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
+                                 PCI_IO_RANGE_MASK & 0xff);
+    pci_set_word(conf + PCI_MEMORY_BASE, 0);
+    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
+    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
+    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
+    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
+    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
+    pci_config_set_interrupt_pin(conf, 0);
+}
+
+static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PCIDevice *pci = PCI_DEVICE(dev);
+    PCIBus *bus = pci_get_bus(pci);
+    PnvPHB *phb = NULL;
+    Error *local_err = NULL;
+
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                          TYPE_PNV_PHB);
+
+    if (!phb) {
+        error_setg(errp,
+"pnv_phb_root_port devices must be connected to pnv-phb buses");
+        return;
+    }
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+
+    rpc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    pci_config_set_interrupt_pin(pci->config, 0);
+}
+
+static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
+
+    dc->desc     = "IBM PHB PCIE Root Port";
+
+    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
+                                    &rpc->parent_realize);
+
+    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
+                                  &rpc->parent_reset);
+    dc->reset = &pnv_phb_root_port_reset;
+
+    dc->user_creatable = true;
+
+    k->vendor_id = PCI_VENDOR_ID_IBM;
+    /*
+     * k->device_id is defaulted to PNV_PHB3_DEVICE_ID. We'll fix
+     * it during instance_init() when we are aware of what machine
+     * we're running.
+     */
+    k->device_id = 0x03dc;
+    k->revision  = 0;
+
+    rpc->exp_offset = 0x48;
+    rpc->aer_offset = 0x100;
+}
+
+static const TypeInfo pnv_phb_root_port_info = {
+    .name          = TYPE_PNV_PHB_ROOT_PORT,
+    .parent        = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(PnvPHBRootPort),
+    .class_init    = pnv_phb_root_port_class_init,
+};
+
 static void pnv_phb_register_types(void)
 {
     type_register_static(&pnv_phb_type_info);
+    type_register_static(&pnv_phb_root_port_info);
 }
 
 type_init(pnv_phb_register_types)
diff --git a/include/hw/pci-host/pnv_phb.h b/include/hw/pci-host/pnv_phb.h
index cceb37d03c..ff90a9c200 100644
--- a/include/hw/pci-host/pnv_phb.h
+++ b/include/hw/pci-host/pnv_phb.h
@@ -210,4 +210,15 @@ struct PnvPHB {
     QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
 };
 
+/*
+ * PHB PCIe Root port
+ */
+typedef struct PnvPHBRootPort {
+    PCIESlot parent_obj;
+} PnvPHBRootPort;
+
+#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
+#define PNV_PHB_ROOT_PORT(obj) \
+    OBJECT_CHECK(PnvPHBRootPort, obj, TYPE_PNV_PHB_ROOT_PORT)
+
 #endif /* PCI_HOST_PNV_PHB_H */
-- 
2.32.0


