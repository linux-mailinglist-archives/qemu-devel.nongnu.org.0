Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4EE5595F9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:04:25 +0200 (CEST)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fEm-0003es-BS
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0c-0002Ew-O3; Fri, 24 Jun 2022 04:49:47 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0b-0000Cv-0w; Fri, 24 Jun 2022 04:49:46 -0400
Received: by mail-oi1-x234.google.com with SMTP id h65so2743601oia.11;
 Fri, 24 Jun 2022 01:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMajlzeEqgx1K4Q+oAu8XZv3KPcyY5VG103eaS9kPIo=;
 b=HMCcEtiuk3aSWhsForaPZzAY86fd1CNwGBh5FHJgRm8zMQQ2jAOrNk2btP6oCcfBtc
 aHnCwiek4mHpcCNmiVlbHKcjuNpe0NDp4BnKKomMNlRNuJoTCUP5sPR+CKz84vsVI9DJ
 nBkqK9zN/mDSIcPDzkZnSflulQswt+pd/BgjuzOIocRW6yO1yuKm0uhcdB0hVvWhrvZM
 9Z9k/7Hb833wHClolqwj8YmAiPZZcIPA7VrxsmcryUjg/EAg8gCHunTrr61jAzs6+Koj
 qorTINIxrRDyuoQhvhGoHJNyEU7NzczHfJh70ZZc+Un/1uH9XbgAH23pzWZrWm8wqnbE
 RuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMajlzeEqgx1K4Q+oAu8XZv3KPcyY5VG103eaS9kPIo=;
 b=i0FCUHglKJw77jOUgipF4UnvICu2GO1iERsZHPq+1TSMOhaf6ehxm5pEscjds/Bi4G
 OZbL0Kcxyt15A0ASV5Zt1nNwSOTGa17GKV+Yaiy+mu4TSztBXIACv+o8oLfKFvBkoJyq
 Cys7t4n9UNiNMzGFjKp2APM4q5timT3YPo+lK/OGof/M6wvDM6RrKOXdbECYzJqRh4Wo
 ecBWVR4Pjkl93qDR2CWvvXQM/FuTjOXsJMfwJVnNP9SIsvMeBVP39/WLtMiVyvN1H3Jr
 5qSonGc5JZh0QRFLLUYxkCD8foPrIBu80FKPpTGS4gFizQpu3E5e92U7/cV4KdeZB/wX
 8uaA==
X-Gm-Message-State: AJIora/tgHsym0yhOSMnkAa4yoU6uM1XbX4iBmm5mX9f2jioVT07v+Dh
 hyjlvO96S+pWXUIXVYxxwFlmVj57jUI=
X-Google-Smtp-Source: AGRyM1s8au27541cb4qceGnWoaaKIClBxQpQSrwj8DsXnfP4OR/K37mFkL726VNdBo0iGG0P5dvrCA==
X-Received: by 2002:a05:6808:1648:b0:335:41f7:1e1 with SMTP id
 az8-20020a056808164800b0033541f701e1mr847552oib.216.1656060583599; 
 Fri, 24 Jun 2022 01:49:43 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 08/12] ppc/pnv: remove pnv-phb4-root-port
Date: Fri, 24 Jun 2022 05:49:17 -0300
Message-Id: <20220624084921.399219-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
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
 hw/pci-host/pnv_phb.c          |  4 +-
 hw/pci-host/pnv_phb4.c         | 85 ----------------------------------
 hw/pci-host/pnv_phb4_pec.c     |  4 +-
 hw/ppc/pnv.c                   |  2 +
 include/hw/pci-host/pnv_phb4.h |  9 ----
 5 files changed, 6 insertions(+), 98 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index cdddc6a389..da729e89e7 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -38,11 +38,11 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
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
index 74cf62dc1a..fefdd3ad89 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1741,94 +1741,9 @@ static const TypeInfo pnv_phb4_root_bus_info = {
     .class_init = pnv_phb4_root_bus_class_init,
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
-    Error *local_err = NULL;
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
-    dc->user_creatable = false;
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
-    dc->user_creatable = false;
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
index 4a0a9fbe8b..0ef66b9a9b 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -260,7 +260,7 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB4;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB4_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -313,7 +313,7 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB5_VERSION;
     pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
-    pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
+    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_phb5_pec_type_info = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d82c66ca6f..159899103e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2132,6 +2132,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
 
     static GlobalProperty phb_compat[] = {
         { TYPE_PNV_PHB, "version", "4" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "4" },
     };
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
@@ -2156,6 +2157,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
 
     static GlobalProperty phb_compat[] = {
         { TYPE_PNV_PHB, "version", "5" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "5" },
     };
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
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


