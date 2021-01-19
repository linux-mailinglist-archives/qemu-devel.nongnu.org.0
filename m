Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFF2FB45F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:41:38 +0100 (CET)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ma1-00058o-3p
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVX-0008I5-7S
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:59 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVU-0003S0-D2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:58 -0500
Received: by mail-wm1-f42.google.com with SMTP id u14so11698884wmq.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZjaybeQucdS72xYzX/rOD4vrUc5IR1ekV46Zvg1Aco=;
 b=pq+mBNe/nQvyIVw4vraXnZs+CQODzWtF09HokWwXD0vbkgETbgt1lJ0sMkdHTHY+MD
 s00cUHD1aLPCVmuplEY2bWxZtLe5K65+ky9Uxrt94A/lsj1O7yogdmV4RvQpZdydeGUT
 ZF9WGUe4aiZvCbS4GxNGS5vZjsqV1NJKOlAVAlB3qYit/TjPszfPjgTlH5ZoDaVmPLOC
 h3m3aVAFrJqWMOP39qYR8nBU4np7+LAXLXi0v2kjp2jLuQS4b1jyJES5n7MDYucP4Vci
 QAe2tnhGEvdOL9khhJWgVtHyF3HXucbsltIh6QWGw0MsXxhN6WabEpvCVISJMf1ceRNZ
 Zm9g==
X-Gm-Message-State: AOAM532ToYIx0TshkfkqBxi+NkqVsCxU9FG664QkQ00aZVVdM5Eda8yo
 QO8wsaqGGrHXQrZR0dTx3DOykJC94Gc=
X-Google-Smtp-Source: ABdhPJyqKQB8eIDrq1rf9pvt3bq0oUFhItUdgTBMw/3OGCAUIz+ZZvlBqFb619aZXbE2kIyrskufKQ==
X-Received: by 2002:a1c:7d8e:: with SMTP id y136mr3031403wmc.94.1611045414973; 
 Tue, 19 Jan 2021 00:36:54 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:54 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/11] hw/m68k/next-cube: Move mmio_ops into NeXTPC device
Date: Tue, 19 Jan 2021 09:36:09 +0100
Message-Id: <20210119083617.6337-4-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.42; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f42.google.com
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

Move the registers handled by the mmio_ops struct into the NeXTPC
device.  This allows us to also move the scr1 and scr2 data fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-4-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 80 +++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 36 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 262ff4ead0..17a020e2a0 100644
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
 
@@ -99,6 +96,11 @@ struct NeXTPC {
 
     /* Temporary until all functionality has been moved into this device */
     NeXTState *ns;
+
+    MemoryRegion mmiomem;
+
+    uint32_t scr1;
+    uint32_t scr2;
 };
 
 /* Thanks to NeXT forums for this */
@@ -121,13 +123,13 @@ static const uint8_t rtc_ram2[32] = {
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
@@ -239,7 +241,7 @@ static void nextscr2_write(NeXTState *s, uint32_t val, int size)
                     /* clear FTU */
                     if (rtc->value & 0x04) {
                         rtc->status = rtc->status & (~0x18);
-                        s->int_status = s->int_status & (~0x04);
+                        s->ns->int_status = s->ns->int_status & (~0x04);
                     }
                 }
             }
@@ -255,7 +257,7 @@ static void nextscr2_write(NeXTState *s, uint32_t val, int size)
     old_scr2 = scr2_2;
 }
 
-static uint32_t mmio_readb(NeXTState *s, hwaddr addr)
+static uint32_t mmio_readb(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     case 0xc000:
@@ -285,7 +287,7 @@ static uint32_t mmio_readb(NeXTState *s, hwaddr addr)
     }
 }
 
-static uint32_t mmio_readw(NeXTState *s, hwaddr addr)
+static uint32_t mmio_readw(NeXTPC *s, hwaddr addr)
 {
     switch (addr) {
     default:
@@ -294,16 +296,16 @@ static uint32_t mmio_readw(NeXTState *s, hwaddr addr)
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
@@ -317,7 +319,7 @@ static uint32_t mmio_readl(NeXTState *s, hwaddr addr)
     }
 }
 
-static void mmio_writeb(NeXTState *s, hwaddr addr, uint32_t val)
+static void mmio_writeb(NeXTPC *s, hwaddr addr, uint32_t val)
 {
     switch (addr) {
     case 0xd003:
@@ -329,21 +331,21 @@ static void mmio_writeb(NeXTState *s, hwaddr addr, uint32_t val)
 
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
@@ -359,15 +361,15 @@ static void mmio_writel(NeXTState *s, hwaddr addr, uint32_t val)
 
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
@@ -376,17 +378,17 @@ static uint64_t mmio_readfn(void *opaque, hwaddr addr, unsigned size)
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
@@ -870,10 +872,23 @@ static void next_escc_init(M68kCPU *cpu)
 
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
@@ -898,7 +913,6 @@ static void next_cube_init(MachineState *machine)
     M68kCPU *cpu;
     CPUM68KState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
-    MemoryRegion *mmiomem = g_new(MemoryRegion, 1);
     MemoryRegion *scrmem = g_new(MemoryRegion, 1);
     MemoryRegion *dmamem = g_new(MemoryRegion, 1);
     MemoryRegion *bmapm1 = g_new(MemoryRegion, 1);
@@ -927,10 +941,6 @@ static void next_cube_init(MachineState *machine)
     /* Temporary while we refactor this code */
     NEXT_PC(pcdev)->ns = ns;
 
-    /* Set internal registers to initial values */
-    /*     0x0000XX00 << vital bits */
-    ns->scr1 = 0x00011102;
-    ns->scr2 = 0x00ff0c80;
     ns->rtc.status = 0x90;
 
     /* Load RTC RAM - TODO: provide possibility to load contents from file */
@@ -945,9 +955,7 @@ static void next_cube_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x0B000000);
 
     /* MMIO */
-    memory_region_init_io(mmiomem, NULL, &mmio_ops, machine, "next.mmio",
-                          0xD0000);
-    memory_region_add_subregion(sysmem, 0x02000000, mmiomem);
+    sysbus_mmio_map(SYS_BUS_DEVICE(pcdev), 0, 0x02000000);
 
     /* BMAP memory */
     memory_region_init_ram_shared_nomigrate(bmapm1, NULL, "next.bmapmem", 64,
-- 
2.29.2


