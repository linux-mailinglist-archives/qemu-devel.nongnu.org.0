Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF66B7C01
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:32:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8m-0007Pi-MO; Mon, 13 Mar 2023 11:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8k-0007PF-HH
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:31:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8i-0003gU-Lp
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:31:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f11so11701196wrv.8
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQrcGeV/xZ9RdP9KKpvBH9iCKoDjlVmr9lyufmrjsak=;
 b=pBSDOlQpw5rgo5BsLRYw5MVCqbh2UgPLgKLsMMJP4nyOiIrioxa9GH7ac2HNK1L1ZJ
 LE71yt2zIH3rxNJr/ZlaKYNOj9rHAhpSF+dU89Haca7XvQeCWH2mRxnVsBg+Gnt3UiZl
 VuN+og/sZDWWXjDRT6VoZtEm0Xrg5h4Azrisf38O8llZFEOmNgsCIxPL7iFMpUQgWb9m
 pCNFcfC5IGl2cxxnW1SzlOcF/yLPEtAm2SF+9wOs1lzrpMWWEEDK+how9BGMvzu3ugxX
 mbtWgvZhUfbo15fawq7PDNX3FaAV8ct1XSUnt3Hl6jCGQVKwb7v4A5dflhWIoDSizxdG
 JgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQrcGeV/xZ9RdP9KKpvBH9iCKoDjlVmr9lyufmrjsak=;
 b=HqOcOQkQj4kVTLxe0Pw0qUgVhDkrBpeXz2WgUy+nvLdZgbleCy9UTz8k5l1EH7+3zV
 0FcyUI0udu+5PCdwp0989I6gv812BnuAeOBC0do0AR4aZyGhr8uVopPWGK3tn3eTb/nC
 IFcOUAW1INzX2RdhBnkfsFjM1yGL+DL01WUAxxc+bAmE2MxNCCUojzW5+Mq3tMfEgUCi
 cwKLFnyyz0c5GCfHoOOc+oBLTlL28nAvR1xWfYR2MxsN2rZIAMk54eK6UKPL4jff6VIA
 vhHkOpyvH6GjBn/idkyyefBvg5zhVRZgQsnOo2zYEiYYrRpAh38aSKrPpOrEAilUBAHH
 bu7w==
X-Gm-Message-State: AO0yUKV9PCtfqkA6k8Y67sUUtrOm0MN4PbXc+KpFFkfEDkxH/UA5LWxs
 SI2qIjqAYBtfkME/JT4+Ts1gAQ==
X-Google-Smtp-Source: AK7set8bFL21+/ibqoSFPZSwoSHKYu4wTkSW/oSJ5AHyZohon5E4SjjYWBdflj0tpBouoWBaEApXQQ==
X-Received: by 2002:a5d:66ce:0:b0:2bf:f735:1310 with SMTP id
 k14-20020a5d66ce000000b002bff7351310mr23968652wrw.2.1678721467139; 
 Mon, 13 Mar 2023 08:31:07 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a5d58f6000000b002cfe687fc7asm1217414wrd.67.2023.03.13.08.31.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:31:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/6] hw/i386/amd_iommu: Factor amdvi_pci_realize out of
 amdvi_sysbus_realize
Date: Mon, 13 Mar 2023 16:30:31 +0100
Message-Id: <20230313153031.86107-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
References: <20230313153031.86107-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Aside the Frankenstein model of a SysBusDevice realizing a PCIDevice,
QOM parents shouldn't access children internals. In this particular
case, amdvi_sysbus_realize() is just open-coding TYPE_AMD_IOMMU_PCI's
DeviceRealize() handler. Factor it out.

Declare QOM-cast macros with OBJECT_DECLARE_SIMPLE_TYPE() so we can
cast the AMDVIPCIState in amdvi_pci_realize().

Note this commit removes the single use in the repository of
pci_add_capability() and msi_init() on a *realized* QDev instance.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c | 62 ++++++++++++++++++++++++++-------------------
 hw/i386/amd_iommu.h |  5 ++--
 2 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 8e4ce63f8e..9c77304438 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1509,20 +1509,48 @@ static void amdvi_init(AMDVIState *s)
     amdvi_set_quad(s, AMDVI_MMIO_EXT_FEATURES, AMDVI_EXT_FEATURES,
             0xffffffffffffffef, 0);
     amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
+}
+
+static void amdvi_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    AMDVIPCIState *s = AMD_IOMMU_PCI(pdev);
+    int ret;
+
+    ret = pci_add_capability(pdev, AMDVI_CAPAB_ID_SEC, 0,
+                             AMDVI_CAPAB_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+    s->capab_offset = ret;
+
+    ret = pci_add_capability(pdev, PCI_CAP_ID_MSI, 0,
+                             AMDVI_CAPAB_REG_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+    ret = pci_add_capability(pdev, PCI_CAP_ID_HT, 0,
+                             AMDVI_CAPAB_REG_SIZE, errp);
+    if (ret < 0) {
+        return;
+    }
+
+    if (msi_init(pdev, 0, 1, true, false, errp) < 0) {
+        return;
+    }
 
     /* reset device ident */
-    pci_config_set_prog_interface(s->pci.dev.config, 00);
+    pci_config_set_prog_interface(pdev->config, 0);
 
     /* reset AMDVI specific capabilities, all r/o */
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_LOW,
+    pci_set_long(pdev->config + s->capab_offset, AMDVI_CAPAB_FEATURES);
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
                  AMDVI_BASE_ADDR & ~(0xffff0000));
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_HIGH,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
                 (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_RANGE,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC, 0);
-    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC,
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
+    pci_set_long(pdev->config + s->capab_offset + AMDVI_CAPAB_MISC,
             AMDVI_MAX_PH_ADDR | AMDVI_MAX_GVA_ADDR | AMDVI_MAX_VA_ADDR);
 }
 
@@ -1536,7 +1564,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
 
 static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
-    int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
@@ -1550,23 +1577,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    s->pci.capab_offset = ret;
-
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
@@ -1578,7 +1588,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
     pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
-    msi_init(&s->pci.dev, 0, 1, true, false, errp);
     amdvi_init(s);
 }
 
@@ -1625,6 +1634,7 @@ static void amdvi_pci_class_init(ObjectClass *klass, void *data)
 
     k->vendor_id = PCI_VENDOR_ID_AMD;
     k->class_id = 0x0806;
+    k->realize = amdvi_pci_realize;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 1c0cb54bd4..6da893ee57 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -300,16 +300,17 @@ struct irte_ga {
 OBJECT_DECLARE_SIMPLE_TYPE(AMDVIState, AMD_IOMMU_DEVICE)
 
 #define TYPE_AMD_IOMMU_PCI "AMDVI-PCI"
+OBJECT_DECLARE_SIMPLE_TYPE(AMDVIPCIState, AMD_IOMMU_PCI)
 
 #define TYPE_AMD_IOMMU_MEMORY_REGION "amd-iommu-iommu-memory-region"
 
 typedef struct AMDVIAddressSpace AMDVIAddressSpace;
 
 /* functions to steal PCI config space */
-typedef struct AMDVIPCIState {
+struct AMDVIPCIState {
     PCIDevice dev;               /* The PCI device itself        */
     uint32_t capab_offset;       /* capability offset pointer    */
-} AMDVIPCIState;
+};
 
 struct AMDVIState {
     X86IOMMUState iommu;        /* IOMMU bus device             */
-- 
2.38.1


