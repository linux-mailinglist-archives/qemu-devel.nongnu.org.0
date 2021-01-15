Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2686A2F8673
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:17:04 +0100 (CET)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VWp-00028w-77
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSC-0005nI-Bc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:16 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSA-0008GZ-8R
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id h17so8292898wmq.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNbBc4SXLU0U2IV+7GjuHGXmjGUHTU+KZlWo4uGsEzI=;
 b=OLudL/tlmMApfO5Tlul46Lnd26SCd+pL8MzgElAHmvAR/kUb3n6s51HIYCE26uEriG
 Uf5PSqmKHqUfnNH4G1TLW5cBAwRcPsz+di3AehA9zQiG5V2sbVU9DPXqqjnlMFnG+Fiv
 Jc2HXRk9LQzbF9yzQdl+Y+q3xtKjoo82oDp+e5Ny7hDndjlGED4nDOvIIx1tbyDv3a6X
 tzfEWJUra1S3UNrZx3o1lQuWCJcAQ1JLeRfGgk2SdqRJKEQ1cXHRGEhw8l3q3vk/ZOia
 NGrKl3XXTJLxFjL2CBBZQQ3MBTRSHqXy78AFut8hwEf4IevxtXH7u9KeJm7DpGewRJap
 K6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNbBc4SXLU0U2IV+7GjuHGXmjGUHTU+KZlWo4uGsEzI=;
 b=CBcddv1N1xgSxVen/w/vVinaeH0vqKHsCVXnD1Ucdw2BXFi4zZl2aLYxjR/HPZbvsB
 AKnXVENDqKdjfFkaF5jb9krv853YNZYbvsZhAc5+lm4Z8GGXiOnbnZ/ii/Pl+THZsDoL
 SYbgrjWplAaklRbyy9u4+OV+WH/NG0ATMQYdpZohigrPOaQnz82b9C+es6Cgaq7bqQio
 Iroo4ePmoOKmAnMH/hdmdFobWVScz4UstpHeliuttgN+QKd3s1Mbefe6bc+O6o6qfM3M
 oXHuHfsnFPGjQzSYezfJkC2beSM7olqdfu8wqce2fvDKHmoFCSqzoOm9KE7uatZGEktV
 RuUQ==
X-Gm-Message-State: AOAM530zwZiXo8xEDDBae+UlDkK5suxSDcQIETMGvWrJDfczvA160aKL
 6IsPO4t+C75ZMHWfQRw7a6OF3rIdcozEUA==
X-Google-Smtp-Source: ABdhPJxEQ9E5G+19Fg4gGkp0ZyjnJGaeaDoqbTbaIzg3+CDl1Gm/IwpZq0Oeu2Iva8M84eDdVIhMQw==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr10700959wmi.115.1610741532163; 
 Fri, 15 Jan 2021 12:12:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] hw/m68k/next-cube: Move mmio_ops into NeXTPC device
Date: Fri, 15 Jan 2021 20:11:58 +0000
Message-Id: <20210115201206.17347-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Move the registers handled by the mmio_ops struct into the NeXTPC
device.  This allows us to also move the scr1 and scr2 data fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 80 +++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index dccf3eb4313..ff121143e92 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -84,9 +84,6 @@ struct NeXTState {
     qemu_irq scsi_reset;
     qemu_irq *fd_irq;
 
-    uint32_t scr1;
-    uint32_t scr2;
-
     NextRtc rtc;
 };
 
@@ -98,6 +95,11 @@ struct NeXTPC {
 
     /* Temporary until all functionality has been moved into this device */
     NeXTState *ns;
+
+    MemoryRegion mmiomem;
+
+    uint32_t scr1;
+    uint32_t scr2;
 };
 
 /* Thanks to NeXT forums for this */
@@ -120,13 +122,13 @@ static const uint8_t rtc_ram2[32] = {
 #define SCR2_RTDATA 0x4
 #define SCR2_TOBCD(x) (((x / 10) << 4) + (x % 10))
 
-static void nextscr2_write(NeXTState *s, uint32_t val, int size)
+static void nextscr2_write(NeXTPC *s, uint32_t val, int size)
 {
     static int led;
     static int phase;
     static uint8_t old_scr2;
     uint8_t scr2_2;
-    NextRtc *rtc = &s->rtc;
+    NextRtc *rtc = &s->ns->rtc;
 
     if (size == 4) {
         scr2_2 = (val >> 8) & 0xFF;
@@ -238,7 +240,7 @@ static void nextscr2_write(NeXTState *s, uint32_t val, int size)
                     /* clear FTU */
                     if (rtc->value & 0x04) {
                         rtc->status = rtc->status & (~0x18);
-                        s->int_status = s->int_status & (~0x04);
+                        s->ns->int_status = s->ns->int_status & (~0x04);
                     }
                 }
             }
@@ -254,7 +256,7 @@ static void nextscr2_write(NeXTState *s, uint32_t val, int size)
     old_scr2 = scr2_2;
 }
 
-static uint32_t mmio_readb(NeXTState *s, hwaddr addr)
+static uint32_t mmio_readb(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0xc000:
@@ -284,7 +286,7 @@ static uint32_t mmio_readb(NeXTState *s, hwaddr addr)
     }
 }
 
-static uint32_t mmio_readw(NeXTState *s, hwaddr addr)
+static uint32_t mmio_readw(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     default:
@@ -293,16 +295,16 @@ static uint32_t mmio_readw(NeXTState *s, hwaddr addr)
     }
 }
 
-static uint32_t mmio_readl(NeXTState *s, hwaddr addr)
+static uint32_t mmio_readl(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0x7000:
-        /* DPRINTF("Read INT status: %x\n", s->int_status); */
-        return s->int_status;
+        /* DPRINTF("Read INT status: %x\n", s->ns->int_status); */
+        return s->ns->int_status;
 
     case 0x7800:
-        DPRINTF("MMIO Read INT mask: %x\n", s->int_mask);
-        return s->int_mask;
+        DPRINTF("MMIO Read INT mask: %x\n", s->ns->int_mask);
+        return s->ns->int_mask;
 
     case 0xc000:
         return s->scr1;
@@ -316,7 +318,7 @@ static uint32_t mmio_readl(NeXTState *s, hwaddr addr)
     }
 }
 
-static void mmio_writeb(NeXTState *s, hwaddr addr, uint32_t val)
+static void mmio_writeb(NeXTPC *s, hwaddr addr, uint32_t val)
 {
     switch (addr) {
     case 0xd003:
@@ -328,21 +330,21 @@ static void mmio_writeb(NeXTState *s, hwaddr addr, uint32_t val)
 
 }
 
-static void mmio_writew(NeXTState *s, hwaddr addr, uint32_t val)
+static void mmio_writew(NeXTPC *s, hwaddr addr, uint32_t val)
 {
     DPRINTF("MMIO Write W\n");
 }
 
-static void mmio_writel(NeXTState *s, hwaddr addr, uint32_t val)
+static void mmio_writel(NeXTPC *s, hwaddr addr, uint32_t val)
 {
     switch (addr) {
     case 0x7000:
-        DPRINTF("INT Status old: %x new: %x\n", s->int_status, val);
-        s->int_status = val;
+        DPRINTF("INT Status old: %x new: %x\n", s->ns->int_status, val);
+        s->ns->int_status = val;
         break;
     case 0x7800:
-        DPRINTF("INT Mask old: %x new: %x\n", s->int_mask, val);
-        s->int_mask  = val;
+        DPRINTF("INT Mask old: %x new: %x\n", s->ns->int_mask, val);
+        s->ns->int_mask  = val;
         break;
     case 0xc000:
         DPRINTF("SCR1 Write: %x\n", val);
@@ -358,15 +360,15 @@ static void mmio_writel(NeXTState *s, hwaddr addr, uint32_t val)
 
 static uint64_t mmio_readfn(void *opaque, hwaddr addr, unsigned size)
 {
-    NeXTState *ns = NEXT_MACHINE(opaque);
+    NeXTPC *s = NEXT_PC(opaque);
 
     switch (size) {
     case 1:
-        return mmio_readb(ns, addr);
+        return mmio_readb(s, addr);
     case 2:
-        return mmio_readw(ns, addr);
+        return mmio_readw(s, addr);
     case 4:
-        return mmio_readl(ns, addr);
+        return mmio_readl(s, addr);
     default:
         g_assert_not_reached();
     }
@@ -375,17 +377,17 @@ static uint64_t mmio_readfn(void *opaque, hwaddr addr, unsigned size)
 static void mmio_writefn(void *opaque, hwaddr addr, uint64_t value,
                          unsigned size)
 {
-    NeXTState *ns = NEXT_MACHINE(opaque);
+    NeXTPC *s = NEXT_PC(opaque);
 
     switch (size) {
     case 1:
-        mmio_writeb(ns, addr, value);
+        mmio_writeb(s, addr, value);
         break;
     case 2:
-        mmio_writew(ns, addr, value);
+        mmio_writew(s, addr, value);
         break;
     case 4:
-        mmio_writel(ns, addr, value);
+        mmio_writel(s, addr, value);
         break;
     default:
         g_assert_not_reached();
@@ -869,10 +871,23 @@ static void next_escc_init(M68kCPU *cpu)
 
 static void next_pc_reset(DeviceState *dev)
 {
+    NeXTPC *s = NEXT_PC(dev);
+
+    /* Set internal registers to initial values */
+    /*     0x0000XX00 << vital bits */
+    s->scr1 = 0x00011102;
+    s->scr2 = 0x00ff0c80;
 }
 
 static void next_pc_realize(DeviceState *dev, Error **errp)
 {
+    NeXTPC *s = NEXT_PC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->mmiomem, OBJECT(s), &mmio_ops, s,
+                          "next.mmio", 0xD0000);
+
+    sysbus_init_mmio(sbd, &s->mmiomem);
 }
 
 static void next_pc_class_init(ObjectClass *klass, void *data)
@@ -897,7 +912,6 @@ static void next_cube_init(MachineState *machine)
     M68kCPU *cpu;
     CPUM68KState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
-    MemoryRegion *mmiomem = g_new(MemoryRegion, 1);
     MemoryRegion *scrmem = g_new(MemoryRegion, 1);
     MemoryRegion *dmamem = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
@@ -926,10 +940,6 @@ static void next_cube_init(MachineState *machine)
     /* Temporary while we refactor this code */
     NEXT_PC(pcdev)->ns = ns;
 
-    /* Set internal registers to initial values */
-    /*     0x0000XX00 << vital bits */
-    ns->scr1 = 0x00011102;
-    ns->scr2 = 0x00ff0c80;
     ns->rtc.status = 0x90;
 
     /* Load RTC RAM - TODO: provide possibility to load contents from file */
@@ -944,9 +954,7 @@ static void next_cube_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x0B000000);
 
     /* MMIO */
-    memory_region_init_io(mmiomem, NULL, &mmio_ops, machine, "next.mmio",
-                          0xD0000);
-    memory_region_add_subregion(sysmem, 0x02000000, mmiomem);
+    sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 0, 0x02000000);
 
     /* BMAP memory */
     memory_region_init_ram_shared_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
-- 
2.20.1


