Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09152D8361
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:26:38 +0100 (CET)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsk8-00012V-UR
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZr-0002cY-CM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:04 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZe-0005eK-RG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:59 -0500
Received: by mail-wm1-x342.google.com with SMTP id w206so5588881wma.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pq8tAYkftQKbp7EDg1kA3sFd2xF8+eQ9f55vXuE8Qj8=;
 b=j9SU9nQKD/to5jCWhh7GmN1LxNnHmc5pp+4dGzuCJBU4UjSE1v/zneMsgPA5IbcZhb
 WTcZdjS/lNYKdl3szU14FDfZ5pAiqbsfxTQoC/2wTKJNiTYDJLifwNfWBL4Dh5hIwbnv
 mrAIkdkQMaOQPW1r2GNIgjLxMhRLw3Tlw8J79TdWPtBzMVuGRe+OFrI8XvQxzyVmxlnq
 V5YDpJvQbCKNo1G0yrnGp1DlxLvnCtoWEHH40iR1xb5PqcogjS3TWJfEUIYZIZiQQSvC
 HZ5oqstV4uXDeNhO68Ni+C2Guis0G3X4amCsTNvq3kT2yRsMru8+UZBULtaXMSgsmGIV
 rMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pq8tAYkftQKbp7EDg1kA3sFd2xF8+eQ9f55vXuE8Qj8=;
 b=Tq1/dqlocY5OZ1+2ehGt+I6G4Ywe9FV1xlfMQRVULHVWgtDn+16ACryuVxz9QC2lSe
 zQyC6tmWTAV/SiZ9nWbE71NhmnllP8oFZyTeohdr32c/hH7tEkCLS2CJuNLfvm/PVHIG
 bR5v9il55m9cHq/s09TO5ppZBmBrp7CPJsNgJEk0LWogRDI1kqqsiEKr0dRUUjQ7Uo+L
 10VMEOrRcsKhvOSgXGuC5PJXiTrprRC6wqbGUWBvauzAJd8s9qES/jEU3lwmLGO0Y2rV
 ouiy5cxKx8CG2ixyOhLKfG+bGmn/3nKx7Clz6eUbrsMJAzF36KWPp/47Ro+45nxO0U19
 FDuA==
X-Gm-Message-State: AOAM530ndKVUm55FuuNjttvyoKdhoRERT955wndlp1AHPpHHaM1SbCH9
 QwmpeJc5k+68HKSz+8aUBrOoRDEh3o0NlA==
X-Google-Smtp-Source: ABdhPJxk5/BDHPlRm5tEwpYNwyN8vYF4NY7lZiEvLnH+xGNXFORBHyFdtlSOzDrpD85YKVQzxMXl8Q==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr16072029wmh.51.1607732145134; 
 Fri, 11 Dec 2020 16:15:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
Date: Sat, 12 Dec 2020 00:15:33 +0000
Message-Id: <20201212001537.24520-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch the bamboo board to directly creating and configuring the UIC,
rather than doing it via the old ppcuic_init() helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/ppc440_bamboo.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 665bc1784e1..b156bcb9990 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -33,6 +33,9 @@
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
+#include "hw/intc/ppc-uic.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
 
 #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
 
@@ -168,13 +171,13 @@ static void bamboo_init(MachineState *machine)
     MemoryRegion *ram_memories = g_new(MemoryRegion, PPC440EP_SDRAM_NR_BANKS);
     hwaddr ram_bases[PPC440EP_SDRAM_NR_BANKS];
     hwaddr ram_sizes[PPC440EP_SDRAM_NR_BANKS];
-    qemu_irq *pic;
-    qemu_irq *irqs;
     PCIBus *pcibus;
     PowerPCCPU *cpu;
     CPUPPCState *env;
     target_long initrd_size = 0;
     DeviceState *dev;
+    DeviceState *uicdev;
+    SysBusDevice *uicsbd;
     int success;
     int i;
 
@@ -192,10 +195,17 @@ static void bamboo_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] = ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
+    uicdev = qdev_new(TYPE_PPC_UIC);
+    uicsbd = SYS_BUS_DEVICE(uicdev);
+
+    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
+                             &error_fatal);
+    sysbus_realize_and_unref(uicsbd, &error_fatal);
+
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
+                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
 
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
@@ -203,14 +213,18 @@ static void bamboo_init(MachineState *machine)
     ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories,
                        ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
-    ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
+    ppc4xx_sdram_init(env,
+                      qdev_get_gpio_in(uicdev, 14),
+                      PPC440EP_SDRAM_NR_BANKS, ram_memories,
                       ram_bases, ram_sizes, 1);
 
     /* PCI */
     dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
                                 PPC440EP_PCI_CONFIG,
-                                pic[pci_irq_nrs[0]], pic[pci_irq_nrs[1]],
-                                pic[pci_irq_nrs[2]], pic[pci_irq_nrs[3]],
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[0]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[1]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[2]),
+                                qdev_get_gpio_in(uicdev, pci_irq_nrs[3]),
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
@@ -223,12 +237,14 @@ static void bamboo_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC440EP_PCI_IO, isa);
 
     if (serial_hd(0) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600300, 0, pic[0],
+        serial_mm_init(address_space_mem, 0xef600300, 0,
+                       qdev_get_gpio_in(uicdev, 0),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(0),
                        DEVICE_BIG_ENDIAN);
     }
     if (serial_hd(1) != NULL) {
-        serial_mm_init(address_space_mem, 0xef600400, 0, pic[1],
+        serial_mm_init(address_space_mem, 0xef600400, 0,
+                       qdev_get_gpio_in(uicdev, 1),
                        PPC_SERIAL_MM_BAUDBASE, serial_hd(1),
                        DEVICE_BIG_ENDIAN);
     }
-- 
2.20.1


