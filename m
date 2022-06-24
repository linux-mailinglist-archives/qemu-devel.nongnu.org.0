Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D1559B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:13:29 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k3s-0002hE-Dl
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jap-0002CG-NU; Fri, 24 Jun 2022 09:43:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jao-0005IC-7N; Fri, 24 Jun 2022 09:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/X9Dr4htGi4L5rm6MsDj2GRiW1/0QY1igL7ix8ThnGw=; b=ztmSlKO4Y/EBrH0kWFcm8Bm3iC
 /yKZ+IYEElWa/1gzyQiB9bNhcpTQzpx29zr5Ncz0TpDW4KkUdugy0qCrmNDfiF/GedcRFrBzlrr8J
 45TjaFYY0saxPyg5CI2K/LrXDKj7MUSAdfEZWQ+qRcZLJvDdGTigv8+a13lCgE5rx7VBY7UrUn3kI
 Nc7AZp2kXyh+kc7SqpmB8BUcLnLBLa4cH0MVIm+VEGhzcxJ6Qp+qU26+o8Lkfyx8X8NqjsLjvNuyR
 OwCYDHCp2bG29VVptlGikbmJsuQyaORa/aTNcYRvIgOfPbTowV3FBUTh9m7TPCiUt/uFv70RDDhdJ
 fA6CXNeq9/YAuqy4yEDfVW2QEH4VfXaDLhs+QahOCcUez7qOx81Uez7dS6mjtbFeuO/1s1XLEthe3
 U1J7QEVNJcBzbtJ0PQdhqFWH+qDFXbE1+fzyI0UD6VsNiEoYVbtdjqfgtRAWb6aAxVy+C9j05Ml1r
 liPr0ds1MqQgL1A//URuYmMgYEEewvbr5dKFJYmGE/1mTOI2fMW/BChOsIIgUR5kKHTiy6gPbW3KM
 zwwZXmliL3hQe04+AvWok0/ebsS5NDVLkm+VQi43xwHvLGbLat5cfFf8VHdyv9DdgRyEf5Zs2sFj0
 td+iLX0KyfmJR6WaycUoyjqCHXeC1qMnUcF46uEMY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZB-00037t-Ed; Fri, 24 Jun 2022 14:41:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:43 +0100
Message-Id: <20220624134109.881989-29-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 28/54] pckbd: move mapping of I8042_MMIO registers to MIPS
 magnum machine
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that the register memory region is exposed as a SysBus memory region, move
the mapping of the I8042_MMIO registers from i8042_mm_init() to the MIPS magnum
machine (which is its only user).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         |  5 +----
 hw/mips/jazz.c           | 11 +++++++----
 include/hw/input/i8042.h |  3 +--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 702dab056c..8708595eed 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -709,8 +709,7 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
 }
 
 MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            MemoryRegion *region, ram_addr_t size,
-                            hwaddr mask)
+                            ram_addr_t size, hwaddr mask)
 {
     DeviceState *dev;
     KBDState *s;
@@ -726,8 +725,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     vmstate_register(NULL, 0, &vmstate_kbd, s);
 
-    region = &I8042_MMIO(dev)->region;
-
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 96dc6ab32d..1eb8bd5018 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -136,11 +136,11 @@ static void mips_jazz_init(MachineState *machine,
     MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
     MemoryRegion *isa_io = g_new(MemoryRegion, 1);
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
-    MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
     MemoryRegion *dp8393x_prom = g_new(MemoryRegion, 1);
     NICInfo *nd;
     DeviceState *dev, *rc4030;
+    MMIOKBDState *i8042;
     SysBusDevice *sysbus;
     ISABus *isa_bus;
     ISADevice *pit;
@@ -361,9 +361,12 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80004000, rtc);
 
     /* Keyboard (i8042) */
-    i8042_mm_init(qdev_get_gpio_in(rc4030, 6), qdev_get_gpio_in(rc4030, 7),
-                  i8042, 0x1000, 0x1);
-    memory_region_add_subregion(address_space, 0x80005000, i8042);
+    i8042 = i8042_mm_init(qdev_get_gpio_in(rc4030, 6),
+                          qdev_get_gpio_in(rc4030, 7),
+                          0x1000, 0x1);
+    memory_region_add_subregion(address_space, 0x80005000,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(i8042),
+                                                       0));
 
     /* Serial ports */
     serial_mm_init(address_space, 0x80006000, 0,
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index d05cd33e3c..9d1f8af964 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -65,8 +65,7 @@ struct MMIOKBDState {
 
 
 MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                            MemoryRegion *region, ram_addr_t size,
-                            hwaddr mask);
+                            ram_addr_t size, hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.30.2


