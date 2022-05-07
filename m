Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D519251E96E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:24:20 +0200 (CEST)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnQ2O-0002uU-0f
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPln-00063R-32; Sat, 07 May 2022 15:07:11 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPll-0001at-J7; Sat, 07 May 2022 15:07:10 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so10526703fac.12; 
 Sat, 07 May 2022 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofHjr863M55zAJYZjc/8WB8QUpdLBzZ169xhUdZ2QEs=;
 b=DFssnT6AToJcuOlTaGw17gO4UyGXTqgkPKSpjMmQnNOxnpYPLWOLqMN+piOrVXzPg2
 QMYVUtjzr3KEZBK0+17IawRnH3YHQG+b3R4xRzO0E1of+u8EPmrbEs9NE3Cs/bGqUoYR
 oKk61pmQaoz90Vo4FYqijK5O3DTWZdK7ouY41s0DOql9NV2pV++q6aZ9SNgxPQDAqoaY
 EE0pkrvzJ9NTCrfl8m7ijbh3HkLJZ85J4MoxL8xfM/xodwwikCBMrOaRfiJJWHOLAZv3
 aMRs2MBgcSvCDpxzGEKJ2Hhq+LxukGX4CF6wZEjFdoo1aE+71Rc8ry9ckocr4aHMxB7T
 w/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofHjr863M55zAJYZjc/8WB8QUpdLBzZ169xhUdZ2QEs=;
 b=Qm9QmVKEEYQkS/y4kSwIlbLPcJIH4wtMW5jMZGa4N7MdHv8ZSsgBmUHWOZwkPBrlta
 4ISJeEfnfIBXsQwxNEtWi3ukTbVI0e7XdJhb+zeDda6rt3Wqob+JLLyOm07PUpOr0Iay
 R2cppwLb2jvVjWzNYszv5p4pisY3c9pBt8hLelhI42M5ctokt5AFam7BEGJBztLQh/41
 xNJpiaRMjZGX4V8m5Mtuphu/Ou61rhq9YpvBFJaAqdg8N8nxjNeDwhJUJnPBmQkR2763
 fTiWugwVHoU4G008XnskZBsgRWUG8ScA+kw3Rag+8mTV9+Ny0K6cxQmPSG6z019OvMNi
 mwzg==
X-Gm-Message-State: AOAM530pRzqn35mbPHJMsNxvaLS5QxfMbB4iTNIsxm0s7IfQ6q2lKCZW
 N1ByrrYplcUxiPMeQ97IVmXKAPS6VMw=
X-Google-Smtp-Source: ABdhPJzV5lQwlcl1NQ2VGHLWVXPBMVG9sjRAg1uYdeemzaCZjnk0tzf6BGqiwU3TrZiQrR5c1qaH0Q==
X-Received: by 2002:a05:6870:7093:b0:e6:210a:d98d with SMTP id
 v19-20020a056870709300b000e6210ad98dmr3805661oae.68.1651950428204; 
 Sat, 07 May 2022 12:07:08 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 15/17] ppc/pnv: remove pnv-phb3-root-port
Date: Sat,  7 May 2022 16:06:22 -0300
Message-Id: <20220507190624.507419-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
 hw/pci-host/pnv_phb3.c         | 59 +---------------------------------
 include/hw/pci-host/pnv_phb3.h |  7 ----
 2 files changed, 1 insertion(+), 65 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a6d6a10c52..1c52df4c3f 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1078,7 +1078,7 @@ void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     if (defaults_enabled()) {
         pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
-                                 TYPE_PNV_PHB3_ROOT_PORT);
+                                 TYPE_PNV_PHB_ROOT_PORT);
     }
 }
 
@@ -1125,66 +1125,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
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
-                                          TYPE_PNV_PHB);
-
-    if (!phb) {
-        error_setg(errp,
-"pnv_phb3_root_port devices must be connected to pnv-phb buses");
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
     type_register_static(&pnv_phb3_iommu_memory_region_info);
 }
 
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 1c4af98fee..417b0f99a7 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -43,13 +43,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPBCQState, PNV_PBCQ)
  */
 #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
 
-#define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
-
-typedef struct PnvPHB3RootPort {
-    PCIESlot parent_obj;
-} PnvPHB3RootPort;
-
-
 #define PNV_PHB3_NUM_M64      16
 #define PNV_PHB3_NUM_REGS     (0x1000 >> 3)
 #define PNV_PHB3_NUM_LSI      8
-- 
2.32.0


