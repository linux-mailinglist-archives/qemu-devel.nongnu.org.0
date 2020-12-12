Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF132D836F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:33:06 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsqO-0004aZ-MM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsaB-0002sz-Hu
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:20 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZl-0005fj-3u
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:19 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so10102847wmb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vrnHXTMsZjfdHKV6SCdqqT25waiXTd0JncR/beyVqQ=;
 b=DXy24s1cghUMFxggCgFCIpvb53WshR5YIqXV6IiQkFETIDpBepJtbOhDyjeYhViHQI
 GqPuxd2OU0C8KSZnA1hWU06GpogoKev9mIdrBYqgb05kLRjchYfNZj5bLJylLJDRuKYN
 +JYqX/B0CMLY46o084Ee4pAhAglSsBcPlR/fiz8xiF9GhlFkcr8znmU/ZwXLwTcBFSib
 +i+tBExLk2nhrpmK73QZX5v3QtVx8tKPo24wCXHeRL8CM0pawXcox3mtG/73pkLjJ7SO
 nxAw0Vqg3Ky9kTyCYT7UwXAkxsP+5qUQ8CF7/s1y68H+cOcSJ64X4bXM5M3Ya5u3juXU
 PSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vrnHXTMsZjfdHKV6SCdqqT25waiXTd0JncR/beyVqQ=;
 b=cJUu3Ad+NGqAyPYj+WqwKAvI1QdGH+4oRY5sY4im76TL/BFY8+gJc/QnSIywRL5Qx6
 D0s9KkiyyBA5HO2TaF/4pWmQKG+Jg/C3ePpBIHB2Xu3qfiYVhpUcnMlWLe5u45TJOhFT
 VBxuSh4v5jGU3BIBrJxbN7Rty2PZ7m4P1hIjs42hC/qBYLGhaUxbZKjWH5T2+Vk9NObM
 PfNZycKGWpnu5M6A06yD6bL1GpPW5izs/SgUa+D12LSxSL7+f2HdDHy6R5Oumm6VKkdI
 +0+3ytSfSDqr5IOAu74xq5REh0C8mqGo0AN7vpOqZIen1eVHXRj1xLTSrOCRIW0EsfcI
 alSA==
X-Gm-Message-State: AOAM531ih+NvpEQ3BaVSJcPi/Nm8yDwh9IsNuvi9awm/1u1TaMil4HuW
 O9vuF8D1r6jFnroN6jHlAvj5pkWtST1LUA==
X-Google-Smtp-Source: ABdhPJyh73FpIUs9YDYcLhzVfovaYPaK0CH9Y/b1WLF6LtvJsZvIqdTM14IjFDysq0vEvmdyFnJykg==
X-Received: by 2002:a1c:c305:: with SMTP id t5mr16263646wmf.63.1607732148639; 
 Fri, 11 Dec 2020 16:15:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] hw/ppc/ppc405_uc: Drop use of ppcuic_init()
Date: Sat, 12 Dec 2020 00:15:36 +0000
Message-Id: <20201212001537.24520-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Switch the ppc405_uc boards to directly creating and configuring the
UIC, rather than doing it via the old ppcuic_init() helper function.

We retain the API feature of ppc405ep_init() where it passes back
something allowing the callers to wire up devices to the UIC if
they need to, even though neither of the callsites currently makes
use of this ability -- instead of passing back the qemu_irq array
we pass back the UIC DeviceState.

This fixes a trivial Coverity-detected memory leak where
we were leaking the array of IRQs returned by ppcuic_init().

Fixes: Coverity CID 1421922
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/ppc405.h        |  2 +-
 hw/ppc/ppc405_boards.c |  8 ++---
 hw/ppc/ppc405_uc.c     | 70 +++++++++++++++++++++++++-----------------
 3 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index e6c702f7e0d..c58f739886a 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -66,7 +66,7 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
-                        uint32_t sysclk, qemu_irq **picp,
+                        uint32_t sysclk, DeviceState **uicdev,
                         int do_init);
 
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index b7249f21cf2..8f77887fb18 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -151,7 +151,6 @@ static void ref405ep_init(MachineState *machine)
     CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
-    qemu_irq *pic;
     MemoryRegion *bios;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     ram_addr_t bdloc;
@@ -167,6 +166,7 @@ static void ref405ep_init(MachineState *machine)
     int len;
     DriveInfo *dinfo;
     MemoryRegion *sysmem = get_system_memory();
+    DeviceState *uicdev;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -184,7 +184,7 @@ static void ref405ep_init(MachineState *machine)
     ram_bases[1] = 0x00000000;
     ram_sizes[1] = 0x00000000;
     env = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
-                        33333333, &pic, kernel_filename == NULL ? 0 : 1);
+                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
     /* allocate SRAM */
     sram_size = 512 * KiB;
     memory_region_init_ram(sram, NULL, "ef405ep.sram", sram_size,
@@ -429,7 +429,6 @@ static void taihu_405ep_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
-    qemu_irq *pic;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *bios;
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
@@ -440,6 +439,7 @@ static void taihu_405ep_init(MachineState *machine)
     int linux_boot;
     int fl_idx;
     DriveInfo *dinfo;
+    DeviceState *uicdev;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -459,7 +459,7 @@ static void taihu_405ep_init(MachineState *machine)
                              "taihu_405ep.ram-1", machine->ram, ram_bases[1],
                              ram_sizes[1]);
     ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
-                  33333333, &pic, kernel_filename == NULL ? 0 : 1);
+                  33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
     /* allocate and load BIOS */
     fl_idx = 0;
 #if defined(USE_FLASH_BIOS)
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 3e191ae4af5..fe047074a17 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -36,6 +36,9 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/intc/ppc-uic.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
 
 //#define DEBUG_OPBA
 //#define DEBUG_SDRAM
@@ -1446,14 +1449,15 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
                         MemoryRegion ram_memories[2],
                         hwaddr ram_bases[2],
                         hwaddr ram_sizes[2],
-                        uint32_t sysclk, qemu_irq **picp,
+                        uint32_t sysclk, DeviceState **uicdevp,
                         int do_init)
 {
     clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     PowerPCCPU *cpu;
     CPUPPCState *env;
-    qemu_irq *pic, *irqs;
+    DeviceState *uicdev;
+    SysBusDevice *uicsbd;
 
     memset(clk_setup, 0, sizeof(clk_setup));
     /* init CPUs */
@@ -1474,59 +1478,69 @@ CPUPPCState *ppc405ep_init(MemoryRegion *address_space_mem,
     /* Initialize timers */
     ppc_booke_timers_init(cpu, sysclk, 0);
     /* Universal interrupt controller */
-    irqs = g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
-    irqs[PPCUIC_OUTPUT_INT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT];
-    irqs[PPCUIC_OUTPUT_CINT] =
-        ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT];
-    pic = ppcuic_init(env, irqs, 0x0C0, 0, 1);
-    *picp = pic;
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
+
+    *uicdevp = uicdev;
+
     /* SDRAM controller */
         /* XXX 405EP has no ECC interrupt */
-    ppc4xx_sdram_init(env, pic[17], 2, ram_memories,
+    ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 17), 2, ram_memories,
                       ram_bases, ram_sizes, do_init);
     /* External bus controller */
     ppc405_ebc_init(env);
     /* DMA controller */
-    dma_irqs[0] = pic[5];
-    dma_irqs[1] = pic[6];
-    dma_irqs[2] = pic[7];
-    dma_irqs[3] = pic[8];
+    dma_irqs[0] = qdev_get_gpio_in(uicdev, 5);
+    dma_irqs[1] = qdev_get_gpio_in(uicdev, 6);
+    dma_irqs[2] = qdev_get_gpio_in(uicdev, 7);
+    dma_irqs[3] = qdev_get_gpio_in(uicdev, 8);
     ppc405_dma_init(env, dma_irqs);
     /* IIC controller */
-    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500, pic[2]);
+    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
+                         qdev_get_gpio_in(uicdev, 2));
     /* GPIO */
     ppc405_gpio_init(0xef600700);
     /* Serial ports */
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
     /* OCM */
     ppc405_ocm_init(env);
     /* GPT */
-    gpt_irqs[0] = pic[19];
-    gpt_irqs[1] = pic[20];
-    gpt_irqs[2] = pic[21];
-    gpt_irqs[3] = pic[22];
-    gpt_irqs[4] = pic[23];
+    gpt_irqs[0] = qdev_get_gpio_in(uicdev, 19);
+    gpt_irqs[1] = qdev_get_gpio_in(uicdev, 20);
+    gpt_irqs[2] = qdev_get_gpio_in(uicdev, 21);
+    gpt_irqs[3] = qdev_get_gpio_in(uicdev, 22);
+    gpt_irqs[4] = qdev_get_gpio_in(uicdev, 23);
     ppc4xx_gpt_init(0xef600000, gpt_irqs);
     /* PCI */
-    /* Uses pic[3], pic[16], pic[18] */
+    /* Uses UIC IRQs 3, 16, 18 */
     /* MAL */
-    mal_irqs[0] = pic[11];
-    mal_irqs[1] = pic[12];
-    mal_irqs[2] = pic[13];
-    mal_irqs[3] = pic[14];
+    mal_irqs[0] = qdev_get_gpio_in(uicdev, 11);
+    mal_irqs[1] = qdev_get_gpio_in(uicdev, 12);
+    mal_irqs[2] = qdev_get_gpio_in(uicdev, 13);
+    mal_irqs[3] = qdev_get_gpio_in(uicdev, 14);
     ppc4xx_mal_init(env, 4, 2, mal_irqs);
     /* Ethernet */
-    /* Uses pic[9], pic[15], pic[17] */
+    /* Uses UIC IRQs 9, 15, 17 */
     /* CPU control */
     ppc405ep_cpc_init(env, clk_setup, sysclk);
 
-- 
2.20.1


