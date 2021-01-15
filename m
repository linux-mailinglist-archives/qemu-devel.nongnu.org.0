Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6C2F8669
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:14:57 +0100 (CET)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VUm-0007XU-9u
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSE-0005qU-0M
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSB-0008HQ-6E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id 91so10504117wrj.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Suq/BC3lJRGxMrIhmW6rsnvYq6sMOoUD1GTT6fv2wYE=;
 b=H69f754sKl4k+sDjN0PPFo9dvZ3ThIVtyYbOKT6gzXHOtkF6BEK3Er8KHW0pJVqDVZ
 9RDpKJGa3lJ+9/S5FMwAKxsmMNhT3GoN3LCvkFPz84fCkXIRFOVOdlVHn6z3KAEPXytX
 lW2IJFEbki70i90X/a0PHLdUHPlqadHpauG/4OhU18wF0HpqYXNGcKiUGDLNVMDI3cxA
 kom+xnrsAOo6onIM8/OpppnIyiHKw2iXK3t7l9hmFMNEw2UxCvM1Vw3m6H8AbGhj+JaQ
 nKRk71S3xGnkdXv8TsxJ3ODQRtKKetnhD2jLLSoV5WPOTOwgF0tUPgKYOCuS+YU+QuA+
 dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Suq/BC3lJRGxMrIhmW6rsnvYq6sMOoUD1GTT6fv2wYE=;
 b=TKr5/BPj8IZ1L/ZQUFlbMdPRu/Wn09xzcjfrlJfeo0ogRJyRWKtP14z/zzWB3nrElQ
 CNqIwjzPLfxkLIY36op7XUxyJtlxoRoInMrj1wxpdA74DnNrNROhxINH26eaWYVLTooC
 F7p8oRu8miZ52oK5PMc8reEJF7fxnX8fXOb7BV2A5aDx/YbfV+PkRB7KVXucye1rKWFJ
 RwEyfyOUXla2IVKOPOMJPNczVEE0lJ3NrEcTkNkrmdSfxy3GsgmmFN+U2MASlvtgoRqw
 drw1Bi1fX8ENu42+vupdroTyxyKWon4IAbMw1hAjndne1H2sImHmXPFhMPJ2DBq8/+GZ
 jYTA==
X-Gm-Message-State: AOAM532FSxgAUSNelqrIddnBenYVhGc/rqNPy1FjG8qZVJ9aBy8Py5Qv
 vRCBviM6NK/ryKX+Pgnq1gl3DA7CMt8z1g==
X-Google-Smtp-Source: ABdhPJxkjj+9mFZ/9jgZ3odNDp1kJgeXMMPBpS8ejQQ87uU4HQ0PrPL3VNY98LeTrkTeO49OcjN8Iw==
X-Received: by 2002:adf:d201:: with SMTP id j1mr14920440wrh.212.1610741533528; 
 Fri, 15 Jan 2021 12:12:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] hw/m68k/next-cube: Move scr_ops into NeXTPC device
Date: Fri, 15 Jan 2021 20:11:59 +0000
Message-Id: <20210115201206.17347-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the registers handled by the scr_ops struct into the NeXTPC
device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 50 ++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index ff121143e92..f5575cb43b8 100644
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
@@ -97,9 +95,12 @@ struct NeXTPC {
     NeXTState *ns;
 
     MemoryRegion mmiomem;
+    MemoryRegion scrmem;
 
     uint32_t scr1;
     uint32_t scr2;
+    uint8_t scsi_csr_1;
+    uint8_t scsi_csr_2;
 };
 
 /* Thanks to NeXT forums for this */
@@ -402,7 +403,7 @@ static const MemoryRegionOps mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static uint32_t scr_readb(NeXTState *s, hwaddr addr)
+static uint32_t scr_readb(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0x14108:
@@ -436,13 +437,13 @@ static uint32_t scr_readb(NeXTState *s, hwaddr addr)
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
@@ -455,7 +456,7 @@ static uint32_t scr_readl(NeXTState *s, hwaddr addr)
 #define SCSICSR_CPUDMA  0x10  /* if set, dma enabled */
 #define SCSICSR_INTMASK 0x20  /* if set, interrupt enabled */
 
-static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
+static void scr_writeb(NeXTPC *s, hwaddr addr, uint32_t value)
 {
     switch (addr) {
     case 0x14108:
@@ -501,9 +502,9 @@ static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
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
@@ -533,27 +534,27 @@ static void scr_writeb(NeXTState *s, hwaddr addr, uint32_t value)
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
@@ -562,17 +563,17 @@ static uint64_t scr_readfn(void *opaque, hwaddr addr, unsigned size)
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
@@ -886,8 +887,10 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
                           "next.mmio", 0xD0000);
-
+    memory_region_init_io(&s->scrmem, OBJECT(s), &scr_ops, s,
+                          "next.scr", 0x20000);
     sysbus_init_mmio(sbd, &s->mmiomem);
+    sysbus_init_mmio(sbd, &s->scrmem);
 }
 
 static void next_pc_class_init(ObjectClass *klass, void *data)
@@ -912,7 +915,6 @@ static void next_cube_init(MachineState *machine)
     M68kCPU *cpu;
     CPUM68KState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
-    MemoryRegion *scrmem = g_new(MemoryRegion, 1);
     MemoryRegion *dmamem = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
@@ -956,6 +958,9 @@ static void next_cube_init(MachineState *machine)
     /* MMIO */
     sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 0, 0x02000000);
 
+    /* BMAP IO - acts as a catch-all for now */
+    sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 1, 0x02100000);
+
     /* BMAP memory */
     memory_region_init_ram_shared_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
                                             true, &error_fatal);
@@ -964,11 +969,6 @@ static void next_cube_init(MachineState *machine)
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
2.20.1


