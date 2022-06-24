Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F555963C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:15:24 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fPP-000845-F8
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0b-0002Eg-0I; Fri, 24 Jun 2022 04:49:45 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0Z-0000Cb-3O; Fri, 24 Jun 2022 04:49:44 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 x9-20020a4ac589000000b004257fd9380cso264519oop.2; 
 Fri, 24 Jun 2022 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O6cWUpr5CepgBCuLvMvsjnQD1j2EYbtbNxQnuWEn1Wg=;
 b=MRHXl+56+D9y6R0IsQFl3B3uTcNLirSgp27tTMvvR0rpk1usyIuz0lseisq+fGzf3m
 eepnK5KEYhbwZ7KFR3AhrqTba8BXZUl5pud/AhitudelSFXne7sOBMM9cr+rAa0cfWLw
 pLDh5Kgta9dVRvdU/6/eBVrzU6HgdyznVWhF8f1KYrhNXVg09l+2+uJ/SEghjQrVnINv
 Jhp2hsTzDHuSbqannQGT1bsaEMhEbSL1/bVD+6cjp8O/H5Y0rN67L0/QNTF7TRgdlRGw
 zHKT6gdm+7p6EzKX0TkKP9NXnBQVu8LKpdv5T86y+JxvDXTmwF1xuCAGGj/CmbuG0Vgt
 Nv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O6cWUpr5CepgBCuLvMvsjnQD1j2EYbtbNxQnuWEn1Wg=;
 b=3GAlHHhQRlwKSn0U1vG9ANdbUB5iq5R7l2ILIQGbiAR+flDeF2Ethvo32Q+HjQWcIr
 K9GUypcLofZtYoYpEvoWsh7+oTtZ2JXYa58geew31WEQ6a7MWNI48OIspsDmWanXdA97
 z2G/F4Oc61oCRtN6Sc9kOg8y7h8kX/nzLbngh9VFhwqkVZyA7z/IVOnuBCVVWegJOuKc
 r8DMvOyh/7CAjw179AwIgzVcgt9aLfiJzNW85kJN8uIe/kAhnOOvaoOOGqblugeYO5v5
 ujpjzZDcdQYAqUlWb3MSLAYmijUs5NsxLs9rbSjg7GDxA6SsVnfBLE0tBvRKHMTVyGE2
 ZG/g==
X-Gm-Message-State: AJIora/htqZFsyKxRmy9SH4aXsuyjTuMekKd0VshW40PpTlioJMmTPFh
 694jysiqRLBkJ0q8DKTul4fMXmwxS4Y=
X-Google-Smtp-Source: AGRyM1tldymH1unzpxKEYfqmKksYT5CGPT4EyB+/MNNwysOxy8Iff84Zw/w4cyPBpo51JEtOOelHbA==
X-Received: by 2002:a4a:4fd0:0:b0:425:6ade:97c1 with SMTP id
 c199-20020a4a4fd0000000b004256ade97c1mr4182568oob.79.1656060581617; 
 Fri, 24 Jun 2022 01:49:41 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 07/12] ppc/pnv: remove pnv-phb3-root-port
Date: Fri, 24 Jun 2022 05:49:16 -0300
Message-Id: <20220624084921.399219-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
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
 hw/pci-host/pnv_phb.c          |  2 +-
 hw/pci-host/pnv_phb3.c         | 42 ----------------------------------
 hw/ppc/pnv.c                   |  1 +
 include/hw/pci-host/pnv_phb3.h |  6 -----
 4 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 5e61f85614..cdddc6a389 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -34,7 +34,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
+        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index ad5d67a8e8..2966374008 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1122,51 +1122,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
     .class_init = pnv_phb3_root_bus_class_init,
 };
 
-static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
-{
-    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
-    Error *local_err = NULL;
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
-    dc->user_creatable = false;
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
index b7273f386e..d82c66ca6f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2108,6 +2108,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
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


