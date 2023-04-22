Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1A6EB9E3
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:10:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq4-0001tx-3y; Sat, 22 Apr 2023 11:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq1-0001rR-S0; Sat, 22 Apr 2023 11:07:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq0-00059f-04; Sat, 22 Apr 2023 11:07:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so20427397a12.0; 
 Sat, 22 Apr 2023 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176061; x=1684768061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcaNV7I4IAQWFd1JhvCsXEwizJor3Bk4TG7Mwe0NIvk=;
 b=GvamUy6eMJtQhuf2MJGKLfpmBWr8SgaC6wFfY3kOSizpSWo58Bf9rdpy2mTS6SIR9W
 Nq7lY4caEWEj5WpUDuey+Twy7vznPvH8OpRQyUENlws35qTB9g18fRmfhh+GBda8P4K7
 mUYDPwSNnMtNkHXWyYQf9+LJ7jggK37nGImnzaCSl30XACc/1u6IllwmhA9243qO2wiU
 DKTpbaqbv28uHCj9H1O/qJp32m/ild4pTAA2Cd5Xb00zkTl0kTiV497AjKvnSnfrQ9tP
 odgVFtIWZjZnG04LYZJyVUDnqQPDMQbcwoWKlgcy5bau2YaCX08IyaOjw9ws+Ah0QFXP
 pmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176061; x=1684768061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LcaNV7I4IAQWFd1JhvCsXEwizJor3Bk4TG7Mwe0NIvk=;
 b=ZUnuMav5i8bj4/5vTd8VxHh/fbipv5+gTdzeRy5s9HAgbkyUdgT1OHzdx2dUz4qg1D
 laREDDdur3U7dwPGc+r9cq0OX3k5NlIAUzc/E0g1sSZGTc+zttHm12D6YTbuJbVeUJLU
 Han9TYU7/4h6dUJo5YVdCmC+U9/+JqiHaGFVS34cApu7boIgQGqOEOtoZj7kVnjmMejn
 J+m1KuHX5BI0xQ+4nfDXNuzQVX7P35gydXMTrUnNL9yn3UvvGNKyo5WI21COJJdHT9ZB
 KhTJl0fWH/ZxZt8X2i2gWIBn6mekW1K3k/JAUFzPWoWxwBGlw637JEXq3xP4Jq15FI4S
 Bwmg==
X-Gm-Message-State: AAQBX9eVtzWGAta7WjkuiQY74UqVByZgoZM7QlV3OatbbgsUE5csCbjI
 ti/zx26m+D0qUIKWKJHONu9QW/iID/c=
X-Google-Smtp-Source: AKy350ZtBq5hCS3/defTydVTigdUXcrQeR3wMUFnowear3xsEWJ3nEJf2Duj50pTlB61/1x5Vlw5qQ==
X-Received: by 2002:a17:906:7313:b0:94e:e0b7:96d6 with SMTP id
 di19-20020a170906731300b0094ee0b796d6mr7287335ejc.14.1682176061239; 
 Sat, 22 Apr 2023 08:07:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 05/13] hw/ide: Extract pci_ide_class_init()
Date: Sat, 22 Apr 2023 17:07:20 +0200
Message-Id: <20230422150728.176512-6-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Resolves redundant code in every PCI IDE device model.
---
 include/hw/ide/pci.h |  1 -
 hw/ide/cmd646.c      | 15 ---------------
 hw/ide/pci.c         | 25 ++++++++++++++++++++++++-
 hw/ide/piix.c        | 19 -------------------
 hw/ide/sii3112.c     |  3 ++-
 hw/ide/via.c         | 15 ---------------
 6 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 74c127e32f..7bc4e53d02 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -61,7 +61,6 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev);
 
-extern const VMStateDescription vmstate_ide_pci;
 extern const MemoryRegionOps pci_ide_cmd_le_ops;
 extern const MemoryRegionOps pci_ide_data_le_ops;
 #endif
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index a094a6e12a..9aabf80e52 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -301,17 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-static void pci_cmd646_ide_exitfn(PCIDevice *dev)
-{
-    PCIIDEState *d = PCI_IDE(dev);
-    unsigned i;
-
-    for (i = 0; i < 2; ++i) {
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
-    }
-}
-
 static Property cmd646_ide_properties[] = {
     DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
     DEFINE_PROP_END_OF_LIST(),
@@ -323,17 +312,13 @@ static void cmd646_ide_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     dc->reset = cmd646_reset;
-    dc->vmsd = &vmstate_ide_pci;
     k->realize = pci_cmd646_ide_realize;
-    k->exit = pci_cmd646_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_CMD;
     k->device_id = PCI_DEVICE_ID_CMD_646;
     k->revision = 0x07;
-    k->class_id = PCI_CLASS_STORAGE_IDE;
     k->config_read = cmd646_pci_config_read;
     k->config_write = cmd646_pci_config_write;
     device_class_set_props(dc, cmd646_ide_properties);
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo cmd646_ide_info = {
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 67e0998ff0..8bea92e394 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -467,7 +467,7 @@ static int ide_pci_post_load(void *opaque, int version_id)
     return 0;
 }
 
-const VMStateDescription vmstate_ide_pci = {
+static const VMStateDescription vmstate_ide_pci = {
     .name = "ide",
     .version_id = 3,
     .minimum_version_id = 0,
@@ -530,11 +530,34 @@ static void pci_ide_init(Object *obj)
     qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
 }
 
+static void pci_ide_exitfn(PCIDevice *dev)
+{
+    PCIIDEState *d = PCI_IDE(dev);
+    unsigned i;
+
+    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
+        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
+        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
+    }
+}
+
+static void pci_ide_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_ide_pci;
+    k->exit = pci_ide_exitfn;
+    k->class_id = PCI_CLASS_STORAGE_IDE;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+}
+
 static const TypeInfo pci_ide_type_info = {
     .name = TYPE_PCI_IDE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIIDEState),
     .instance_init = pci_ide_init,
+    .class_init = pci_ide_class_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index a32f7ccece..4e6ca99123 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -159,8 +159,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
 
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
-
     for (unsigned i = 0; i < 2; i++) {
         if (!pci_piix_init_bus(d, i, errp)) {
             return;
@@ -168,17 +166,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-static void pci_piix_ide_exitfn(PCIDevice *dev)
-{
-    PCIIDEState *d = PCI_IDE(dev);
-    unsigned i;
-
-    for (i = 0; i < 2; ++i) {
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
-    }
-}
-
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -187,11 +174,8 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
 
     dc->reset = piix_ide_reset;
     k->realize = pci_piix_ide_realize;
-    k->exit = pci_piix_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
-    k->class_id = PCI_CLASS_STORAGE_IDE;
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
 
@@ -209,11 +193,8 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
 
     dc->reset = piix_ide_reset;
     k->realize = pci_piix_ide_realize;
-    k->exit = pci_piix_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
-    k->class_id = PCI_CLASS_STORAGE_IDE;
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
 }
 
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 5dd3d03c29..0af897a9ef 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -301,9 +301,10 @@ static void sii3112_pci_class_init(ObjectClass *klass, void *data)
     pd->class_id = PCI_CLASS_STORAGE_RAID;
     pd->revision = 1;
     pd->realize = sii3112_pci_realize;
+    pd->exit = NULL;
     dc->reset = sii3112_reset;
+    dc->vmsd = NULL;
     dc->desc = "SiI3112A SATA controller";
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo sii3112_pci_info = {
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 91253fa4ef..287143a005 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -200,34 +200,19 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
-static void via_ide_exitfn(PCIDevice *dev)
-{
-    PCIIDEState *d = PCI_IDE(dev);
-    unsigned i;
-
-    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
-        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
-    }
-}
-
 static void via_ide_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     dc->reset = via_ide_reset;
-    dc->vmsd = &vmstate_ide_pci;
     /* Reason: only works as function of VIA southbridge */
     dc->user_creatable = false;
 
     k->realize = via_ide_realize;
-    k->exit = via_ide_exitfn;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_IDE;
     k->revision = 0x06;
-    k->class_id = PCI_CLASS_STORAGE_IDE;
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo via_ide_info = {
-- 
2.40.0


