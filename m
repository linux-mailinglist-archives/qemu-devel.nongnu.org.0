Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4416539950
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:04:08 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9yB-0005DC-PH
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kV-0001hR-A8; Tue, 31 May 2022 17:49:59 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kT-0003Px-EN; Tue, 31 May 2022 17:49:58 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 n2-20020a9d6f02000000b0060b22af84d4so10498732otq.1; 
 Tue, 31 May 2022 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8eC7pOJCLgIGuHVwnLUXo4GEPJ+IRaL+Sgm+kMumbc=;
 b=d449zoYqqyi5wcldsYbeZdogXGmDrL2hMqU0Au5B3lqpqzhZoh7RKTIRJkYqCLGfYm
 uczd+UcrlDYfAyAaRb3g1McAy4+bZyJBZGKD4RKNqyuJV1mnfDYbBmkZLlUVZXl6gVjj
 WrUs/PVlyWPyyksN/1Tip/qwEbXB9mCwaEoQOPgU4Xh9AnVlnFdd3tnLKu+uyDpo5NmW
 C12ylsQOlcpVb9+gBOl8UJDfdIYE3k+iC91CToY6SLgFC0BBRq0YFxbzCdiP32Gl9HVA
 8LFw4VjZhpfDuWpsHV/XdR1ndtjQenL5V1N6OxIeTlk/5nlufniC9PdSasDRavVRrDIe
 GOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8eC7pOJCLgIGuHVwnLUXo4GEPJ+IRaL+Sgm+kMumbc=;
 b=q0w7Y5AonLTQxigyNJ5RlsyvyU+MJ6T5EN36tkpzVE4QrM0F96m0DI/hMiTk1MJ798
 K/VnvrIxvAxg/gvbO4h4DJ4CmhwA9KBKREKwUO25YiDJknJ59xDU51wzmZvhY/EcZhb0
 R+q8FUjPmQhcIviy9gN13i9tTK6ETQZPaz09TZExV3YYbDrRFEw+VZ8DmAM1Kfd4NRu/
 JBVyRpf4rDzSBIJQwFxZq2xsn+yxX0Eg4kOsFfUKq/V9Ww/eljLi80PcVJZK1evXuFoM
 4YiqBy2tqNr48yuxb1K4az0+1xnZ4Vo8Hq5Ivud2CIjocObqn9wNSCFo7geWdwqKaf5d
 EIOQ==
X-Gm-Message-State: AOAM533OzEh7JqLqGbJM42ror95Taq9Np50DQ/FseYltlCtsNImAgqpu
 1bJLduh1JfHd06hBpGduKtqW+T5Bv4hZ1A==
X-Google-Smtp-Source: ABdhPJyMLdGD2fXkTfCze9m/BtmgX41klaMtp7t1Pkfy//7h9R/+oTvT9Z7rZT9k+sZrKkYAfHEQ5Q==
X-Received: by 2002:a05:6830:4494:b0:60b:3fbd:5022 with SMTP id
 r20-20020a056830449400b0060b3fbd5022mr10175152otv.198.1654033795925; 
 Tue, 31 May 2022 14:49:55 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 13/16] ppc/pnv: remove pnv-phb4-root-port
Date: Tue, 31 May 2022 18:49:14 -0300
Message-Id: <20220531214917.31668-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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

The unified pnv-phb-root-port can be used instead. The phb4-root-port
device isn't exposed to the user in any official QEMU release so there's
no ABI breakage in removing it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          |   4 +-
 hw/pci-host/pnv_phb4.c         | 100 ---------------------------------
 hw/pci-host/pnv_phb4_pec.c     |   4 +-
 include/hw/pci-host/pnv_phb4.h |   9 ---
 4 files changed, 4 insertions(+), 113 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index d1e8d28e97..f1c106edf1 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -39,11 +39,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB4_ROOT_PORT);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 5:
         phb_typename = g_strdup(TYPE_PNV_PHB5);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB5_ROOT_PORT);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     default:
         g_assert_not_reached();
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 8a907a77a7..ba553ae25e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1817,109 +1817,9 @@ static const TypeInfo pnv_phb4_root_bus_info = {
     },
 };
 
-static void pnv_phb4_root_port_reset(DeviceState *dev)
-{
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *d = PCI_DEVICE(dev);
-    uint8_t *conf = d->config;
-
-    rpc->parent_reset(dev);
-
-    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
-                               PCI_IO_RANGE_MASK & 0xff);
-    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
-                                 PCI_IO_RANGE_MASK & 0xff);
-    pci_set_word(conf + PCI_MEMORY_BASE, 0);
-    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
-    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
-    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
-    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
-    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
-    pci_config_set_interrupt_pin(conf, 0);
-}
-
-static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
-{
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
-    PnvPHB *phb = NULL;
-    Error *local_err = NULL;
-
-    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                         TYPE_PNV_PHB);
-
-    if (!phb) {
-        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
-        return;
-    }
-
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
-
-    rpc->parent_realize(dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-}
-
-static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
-
-    dc->desc     = "IBM PHB4 PCIE Root Port";
-    dc->user_creatable = true;
-
-    device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
-                                    &rpc->parent_realize);
-    device_class_set_parent_reset(dc, pnv_phb4_root_port_reset,
-                                  &rpc->parent_reset);
-
-    k->vendor_id = PCI_VENDOR_ID_IBM;
-    k->device_id = PNV_PHB4_DEVICE_ID;
-    k->revision  = 0;
-
-    rpc->exp_offset = 0x48;
-    rpc->aer_offset = 0x100;
-
-    dc->reset = &pnv_phb4_root_port_reset;
-}
-
-static const TypeInfo pnv_phb4_root_port_info = {
-    .name          = TYPE_PNV_PHB4_ROOT_PORT,
-    .parent        = TYPE_PCIE_ROOT_PORT,
-    .instance_size = sizeof(PnvPHB4RootPort),
-    .class_init    = pnv_phb4_root_port_class_init,
-};
-
-static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    dc->desc     = "IBM PHB5 PCIE Root Port";
-    dc->user_creatable = true;
-
-    k->vendor_id = PCI_VENDOR_ID_IBM;
-    k->device_id = PNV_PHB5_DEVICE_ID;
-}
-
-static const TypeInfo pnv_phb5_root_port_info = {
-    .name          = TYPE_PNV_PHB5_ROOT_PORT,
-    .parent        = TYPE_PNV_PHB4_ROOT_PORT,
-    .instance_size = sizeof(PnvPHB4RootPort),
-    .class_init    = pnv_phb5_root_port_class_init,
-};
-
 static void pnv_phb4_register_types(void)
 {
     type_register_static(&pnv_phb4_root_bus_info);
-    type_register_static(&pnv_phb5_root_port_info);
-    type_register_static(&pnv_phb4_root_port_info);
     type_register_static(&pnv_phb4_type_info);
     type_register_static(&pnv_phb5_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 0e67f3a338..785b778396 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -262,7 +262,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB4;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -315,7 +315,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB5_VERSION;
     pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
-    pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_phb5_pec_type_info = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index f22253358f..29c49ac79c 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -45,16 +45,7 @@ typedef struct PnvPhb4DMASpace {
     QLIST_ENTRY(PnvPhb4DMASpace) list;
 } PnvPhb4DMASpace;
 
-/*
- * PHB4 PCIe Root port
- */
 #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
-#define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
-#define TYPE_PNV_PHB5_ROOT_PORT "pnv-phb5-root-port"
-
-typedef struct PnvPHB4RootPort {
-    PCIESlot parent_obj;
-} PnvPHB4RootPort;
 
 /*
  * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)
-- 
2.36.1


