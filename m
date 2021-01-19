Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335332FB44D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:39:15 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mXi-0001Zx-8w
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVX-0008I1-4f
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:59 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:36049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVV-0003SX-20
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:58 -0500
Received: by mail-wm1-f53.google.com with SMTP id v184so11678577wma.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bcRnfVy7lP2i4f76m7mIxUR7K5WFGMUIp6qMDA3g1pw=;
 b=PhtWh7GkLcOSv96hZj4jqSZKMkbWwXEySiquja2ahL1ZWTpmZ2aFhkqSdQTGMls9jr
 IxNM5ahRBEQvLx0Br1gIHOBK+Xz8243DvcCRrwgP0v07Uj2lLmoLdl7x0EFmbXG4d3sy
 mAgNO+DGUgTRKJnmSTNGP7CG58Wiw31e4rmEvo3+mxE9EBrhY2pmBB1nawPHWXsYPWWR
 GSN2HHQ4ZYRy3E8QId6lWO2EaKNAOSMKVslx2qpmWzxyMVK4ltw4HcR06AjFiC3pHY5K
 PoRm8CF/ptROGYAHdJW+tT3bMe8LpWkhOUbpGgn1dfRd+A5XDmuxHnmfxRMT7oiapJS6
 ejcA==
X-Gm-Message-State: AOAM530uS3IqU16MlFdFpbkSoU4rMC7u2Xk4WyMCm73z9nXBla2s4p+2
 yhVH8CWDnkWHIRd5epz73IJFIF1o0wQ=
X-Google-Smtp-Source: ABdhPJyhchbbX92dReUA2X6aIv4o+Q8xaZhP0jnSwMNHqYohGt/+i5qRqP/nLTxINmGpQ47A9qEcqg==
X-Received: by 2002:a1c:b7d6:: with SMTP id h205mr2973882wmf.182.1611045415522; 
 Tue, 19 Jan 2021 00:36:55 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:55 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/11] hw/m68k/next-cube: Move scr_ops into NeXTPC device
Date: Tue, 19 Jan 2021 09:36:10 +0100
Message-Id: <20210119083617.6337-5-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.53; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Move the registers handled by the scr_ops struct into the NeXTPC
device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-5-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 50 ++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 17a020e2a0..7d44bcf783 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -76,8 +76,6 @@ struct NeXTState {
     uint32_t int_mask;
     uint32_t int_status;
 
-    uint8_t scsi_csr_1;
-    uint8_t scsi_csr_2;
     next_dma dma[10];
     qemu_irq *scsi_irq;
     qemu_irq scsi_dma;
@@ -98,9 +96,12 @@ struct NeXTPC {
     NeXTState *ns;
 
     MemoryRegion mmiomem;
+    MemoryRegion scrmem;
 
     uint32_t scr1;
     uint32_t scr2;
+    uint8_t scsi_csr_1;
+    uint8_t scsi_csr_2;
 };
 
 /* Thanks to NeXT forums for this */
@@ -403,7 +404,7 @@ static const MemoryRegionOps mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static uint32_t scr_readb(NeXTState *s, hwaddr addr)
+static uint32_t scr_readb(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0x14108:
@@ -437,13 +438,13 @@ static uint32_t scr_readb(NeXTState *s, hwaddr addr)
     }
 }
 
-static uint32_t scr_readw(NeXTState *s, hwaddr addr)
+static uint32_t scr_readw(NeXTPC *s, hwaddr addr)
 {
     DPRINTF("BMAP Read W @ %x\n", (unsigned int)addr);
     return 0;
 }
 
-static uint32_t scr_readl(NeXTState *s, hwaddr addr)
+static uint32_t scr_readl(NeXTPC *s, hwaddr addr)
 {
     DPRINTF("BMAP Read L @ %x\n", (unsigned int)addr);
     return 0;
@@ -456,7 +457,7 @@ static uint32_t scr_readl(NeXTState *s, hwaddr addr)
 #define SCSICSR_CPUDMA  0x10  /* if set, dma enabled */
 #define SCSICSR_INTMASK 0x20  /* if set, interrupt enabled */
 
-static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
+static void scr_writeb(NeXTPC *s, hwaddr addr, uint32_t value)
 {
     switch (addr) {
     case 0x14108:
@@ -502,9 +503,9 @@ static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
             DPRINTF("SCSICSR CPUDMA\n");
             /* qemu_irq_raise(s->scsi_dma); */
 
-            s->int_status |= 0x4000000;
+            s->ns->int_status |= 0x4000000;
         } else {
-            s->int_status &= ~(0x4000000);
+            s->ns->int_status &= ~(0x4000000);
         }
         if (value & SCSICSR_INTMASK) {
             DPRINTF("SCSICSR INTMASK\n");
@@ -534,27 +535,27 @@ static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
     }
 }
 
-static void scr_writew(NeXTState *s, hwaddr addr, uint32_t value)
+static void scr_writew(NeXTPC *s, hwaddr addr, uint32_t value)
 {
     DPRINTF("BMAP Write W @ %x with %x\n", (unsigned int)addr, value);
 }
 
-static void scr_writel(NeXTState *s, hwaddr addr, uint32_t value)
+static void scr_writel(NeXTPC *s, hwaddr addr, uint32_t value)
 {
     DPRINTF("BMAP Write L @ %x with %x\n", (unsigned int)addr, value);
 }
 
 static uint64_t scr_readfn(void *opaque, hwaddr addr, unsigned size)
 {
-    NeXTState *ns = NEXT_MACHINE(opaque);
+    NeXTPC *s = NEXT_PC(opaque);
 
     switch (size) {
     case 1:
-        return scr_readb(ns, addr);
+        return scr_readb(s, addr);
     case 2:
-        return scr_readw(ns, addr);
+        return scr_readw(s, addr);
     case 4:
-        return scr_readl(ns, addr);
+        return scr_readl(s, addr);
     default:
         g_assert_not_reached();
     }
@@ -563,17 +564,17 @@ static uint64_t scr_readfn(void *opaque, hwaddr addr, unsigned size)
 static void scr_writefn(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    NeXTState *ns = NEXT_MACHINE(opaque);
+    NeXTPC *s = NEXT_PC(opaque);
 
     switch (size) {
     case 1:
-        scr_writeb(ns, addr, value);
+        scr_writeb(s, addr, value);
         break;
     case 2:
-        scr_writew(ns, addr, value);
+        scr_writew(s, addr, value);
         break;
     case 4:
-        scr_writel(ns, addr, value);
+        scr_writel(s, addr, value);
         break;
     default:
         g_assert_not_reached();
@@ -887,8 +888,10 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
                           "next.mmio", 0xD0000);
-
+    memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,
+                          "next.scr", 0x20000);
     sysbus_init_mmio(sbd, &s->mmiomem);
+    sysbus_init_mmio(sbd, &s->scrmem);
 }
 
 static void next_pc_class_init(ObjectClass *klass, void *data)
@@ -913,7 +916,6 @@ static void next_cube_init(MachineState *machine)
     M68kCPU *cpu;
     CPUM68KState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
-    MemoryRegion *scrmem = g_new(MemoryRegion, 1);
     MemoryRegion *dmamem = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
@@ -957,6 +959,9 @@ static void next_cube_init(MachineState *machine)
     /* MMIO */
     sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 0, 0x02000000);
 
+    /* BMAP IO - acts as a catch-all for now */
+    sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 1, 0x02100000);
+
     /* BMAP memory */
     memory_region_init_ram_shared_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
                                             true, &error_fatal);
@@ -965,11 +970,6 @@ static void next_cube_init(MachineState *machine)
     memory_region_init_alias(bmapm2, NULL, "next.bmapmem2", bmapm1, 0x0, 64);
     memory_region_add_subregion(sysmem, 0x820c0000, bmapm2);
 
-    /* BMAP IO - acts as a catch-all for now */
-    memory_region_init_io(scrmem, NULL, &scr_ops, machine, "next.scr",
-                          0x20000);
-    memory_region_add_subregion(sysmem, 0x02100000, scrmem);
-
     /* KBD */
     dev = qdev_new(TYPE_NEXTKBD);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.29.2


