Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC1E51E961
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:16:24 +0200 (CEST)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPuh-00051K-7j
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlp-000694-NT; Sat, 07 May 2022 15:07:14 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlo-0001b9-0G; Sat, 07 May 2022 15:07:13 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so7217417otq.12; 
 Sat, 07 May 2022 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVv3d83OfpC/OHOL5tZ0g4PPPAUib/MUu/nDDkfekWc=;
 b=DtiP4vtu6KffPoz9eONhsoog62eggQXQgAwkcp6AGAt6D8haRbNxAWgKMiAro1TfdO
 bYO0+H7bWJ7xmsVnDy/y9Akxsdyj1rlNLoAuvCS7TUtCinpXUFzW2g85mGmzD5iWaqLc
 nkPZIAWUHzZ8aSnR58puBNErUaVCLi9YudBMKpxYvbWdam02NyZcbIRFppCO45C6MH+h
 rKnvbtqwqlI6DyKHT6HB5+4KNhc7a7vsODDNFxvF4Q2nR0yENleIQYPFVQ4CL2N9wCha
 NnsYe7TTwju2uhjdzKMWPXGFGFppuDJmVqvj73yHxujWgSOAIqOnBEe5w9vvBvsUx+GM
 zBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVv3d83OfpC/OHOL5tZ0g4PPPAUib/MUu/nDDkfekWc=;
 b=eYDm8XBfOiTOgG2ArCzRgD8m9p5azuHyD+NzLqiYn1lXJL7cgdMumo8kVtbhYZbxI5
 nRAkSoc5yxU5dCcZCQQIC8wPAZm1ewr32scPzlJuVu5z96r41XF4IROrdb1SBTxQJOr9
 rT9H/i96IXze+npwJfT04hQOdc2YR6fhqS47GRHmcHFUH/gR3ndz6GNbSH5CMSpkr3gf
 Yu/ZzBCpzwd9KOCgyJySZDSah3WubgcvT5fV52p0lwZzA2Q09XhOSEGrBioGrg+LbGKg
 YpZF25IlDURVpNAJnRq0IH8lD0pL3ImvDOiouwYxbDbtWzB6s0GwXBT6kTkY+y8Pf4Cy
 1fYw==
X-Gm-Message-State: AOAM532LMLRmVbRpS25yaMMuTzDiMDhgRClZFsSWlXtxXfd6c+uWl6VY
 lvKzaJjbiOT1OjCAAy+Ca0FKEazjcJM=
X-Google-Smtp-Source: ABdhPJy5G5gOdF6K6jmNqBVmvEpYcO7yAUJ1ZYd6QC2rqup7rvDpQ82APnlX9Q7L+/bnbHY3Su/fHQ==
X-Received: by 2002:a05:6830:60c:b0:606:3e1:322c with SMTP id
 w12-20020a056830060c00b0060603e1322cmr3192286oti.53.1651950430550; 
 Sat, 07 May 2022 12:07:10 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 16/17] ppc/pnv: remove pnv-phb4-root-port
Date: Sat,  7 May 2022 16:06:23 -0300
Message-Id: <20220507190624.507419-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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

The unified pnv-phb-root-port can be used instead. THe
pnv-phb4-root-port device isn't exposed to the user in any official QEMU
release so there's no ABI breakage in removing it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 100 ---------------------------------
 hw/pci-host/pnv_phb4_pec.c     |   4 +-
 include/hw/pci-host/pnv_phb4.h |   9 ---
 3 files changed, 2 insertions(+), 111 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fb3222d458..2dce10830d 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1776,109 +1776,9 @@ static const TypeInfo pnv_phb4_root_bus_info = {
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
-        error_setg(errp, "%s must be connected to pnv-phb buses", dev->id);
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
     type_register_static(&pnv_phb5_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
 }
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 243a079ea7..51821276e9 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -266,7 +266,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -319,7 +319,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB5_VERSION;
     pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
-    pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_phb5_pec_type_info = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 65a16f2067..8c57d836d1 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -44,16 +44,7 @@ typedef struct PnvPhb4DMASpace {
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
 
 struct PnvPHB4DeviceClass {
     DeviceClass parent_class;
-- 
2.32.0


