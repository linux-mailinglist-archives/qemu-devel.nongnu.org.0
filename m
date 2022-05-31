Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6453992E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:00:05 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9uG-0007ui-B2
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kS-0001ZQ-DO; Tue, 31 May 2022 17:49:56 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kQ-0003MH-Il; Tue, 31 May 2022 17:49:56 -0400
Received: by mail-oi1-x231.google.com with SMTP id r206so174978oib.8;
 Tue, 31 May 2022 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xHThTlVQRxDCWZ0rxMcqazvC0wxOx9NlP2zJs7vmJj4=;
 b=ooKHi2l9fePSwV18imwdza3Eyf41ed6LodhLCBXagSOK7j0qqmyyT7lxlaN/yYL9Ra
 O8yMTgsbuVeNlw+PPlVx5Tt9P0B0qmoi7DtONRB5rSrdVRd2Kku3yAC2piTe/KTdYH9K
 wN52SXyq0OzXuJYDQUTTff47Hpfd3xutIste/D2ebNZcXUgehD/ZBz3DnwvGzzuQ2Tbr
 8mZ9Xqwg8nQLXEtPV295RGqaY9j40IXvytRVfFZtl8K2BXN13mpWjUCpimRCVgKOnw6D
 JeZRT9dCc0gOSwn5igK/efVtMcs79ZiBxRfTbqBFNu0Tb4e3uX4hV29uJvwm7xERUl6W
 zL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHThTlVQRxDCWZ0rxMcqazvC0wxOx9NlP2zJs7vmJj4=;
 b=abZZp2KNOG6X+nZc6VOohsMEPOrI2e8dzGhDqgKf/We1BX16yR+6hysQAr6nEahpwK
 A81iZ++fTb60rNA2C+XAPXm+mBk5BFlUlGNyMBy3ibtshI1KYVZ7LlVSyPMfrXPaPSJd
 BXz/ZHxHx9oDsZJVpEa23j6QXHKecaCB8An3oVLCzy4giUBb+d8anRHOvRS00xW0ceDm
 FXm/gGG8WqqTENBcDHj2Hf4nSAHPTJRX0Mx2GW3/JYHvL4Fnq7dhLLmby0occWhRzgRh
 60oBAmnTQfoTBeWB4BKOUrqq/qpi+dUKxK7pS7DQZjuNFB1ktR5KH/3diPR+t9QQJxhj
 P0Lw==
X-Gm-Message-State: AOAM530KxP1XkUi5AcBYLP3VfTekIaoHz5CRYGEFCEw3Qo4ntWBBb1Ly
 zvwaCXL7SGhtQsJA74UF/p95dA0MPv1bRA==
X-Google-Smtp-Source: ABdhPJzOVLYEEWEb5er6ISJvz/LrypL7BNT1RwuEmX7iNzYAP48pH/UZsEEP1AR4AUZz3LRow/27mA==
X-Received: by 2002:a05:6808:1a22:b0:32b:60c2:e2bd with SMTP id
 bk34-20020a0568081a2200b0032b60c2e2bdmr13226415oib.189.1654033793438; 
 Tue, 31 May 2022 14:49:53 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 12/16] ppc/pnv: remove pnv-phb3-root-port
Date: Tue, 31 May 2022 18:49:13 -0300
Message-Id: <20220531214917.31668-13-danielhb413@gmail.com>
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

The unified pnv-phb-root-port can be used in its place. There is no ABI
breakage in doing so because no official QEMU release introduced user
creatable pnv-phb3-root-port devices.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c          | 10 ++++--
 hw/pci-host/pnv_phb3.c         | 57 ----------------------------------
 hw/ppc/pnv.c                   |  1 +
 include/hw/pci-host/pnv_phb3.h |  6 ----
 4 files changed, 8 insertions(+), 66 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 5047e90d3a..d1e8d28e97 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -35,7 +35,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
@@ -170,6 +170,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
     pci_config_set_interrupt_pin(pci->config, 0);
 }
 
+static Property pnv_phb_root_port_properties[] = {
+    DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -180,11 +185,10 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
 
     device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
                                     &rpc->parent_realize);
-
     device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
                                   &rpc->parent_reset);
     dc->reset = &pnv_phb_root_port_reset;
-
+    device_class_set_props(dc, pnv_phb_root_port_properties);
     dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 839c2dad00..dc1068443a 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1152,66 +1152,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     },
 };
 
-static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
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
-        error_setg(errp,
-"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
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
-    pci_config_set_interrupt_pin(pci->config, 0);
-}
-
-static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
-
-    dc->desc     = "IBM PHB3 PCIE Root Port";
-
-    device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
-                                    &rpc->parent_realize);
-    dc->user_creatable = true;
-
-    k->vendor_id = PCI_VENDOR_ID_IBM;
-    k->device_id = 0x03dc;
-    k->revision  = 0;
-
-    rpc->exp_offset = 0x48;
-    rpc->aer_offset = 0x100;
-}
-
-static const TypeInfo pnv_phb3_root_port_info = {
-    .name          = TYPE_PNV_PHB3_ROOT_PORT,
-    .parent        = TYPE_PCIE_ROOT_PORT,
-    .instance_size = sizeof(PnvPHB3RootPort),
-    .class_init    = pnv_phb3_root_port_class_init,
-};
-
 static void pnv_phb3_register_types(void)
 {
     type_register_static(&pnv_phb3_root_bus_info);
-    type_register_static(&pnv_phb3_root_port_info);
     type_register_static(&pnv_phb3_type_info);
     type_register_static(&pnv_phb3_iommu_memory_region_info);
 }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 4d2ea405db..5da5067b67 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2148,6 +2148,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     static GlobalProperty phb_compat[] = {
         { TYPE_PNV_PHB, "version", "3" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },
     };
 
     mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 3b9ff1096a..bff69201d9 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -108,12 +108,6 @@ struct PnvPBCQState {
  */
 #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
 
-#define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
-
-typedef struct PnvPHB3RootPort {
-    PCIESlot parent_obj;
-} PnvPHB3RootPort;
-
 /*
  * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
  */
-- 
2.36.1


