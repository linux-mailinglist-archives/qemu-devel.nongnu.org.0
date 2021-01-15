Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3782F8679
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:19:41 +0100 (CET)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VZM-0004PU-3U
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSD-0005qB-Qi
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:17 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSC-0008Hd-2n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:17 -0500
Received: by mail-wr1-x431.google.com with SMTP id q18so10507692wrn.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xR1NK3G4cM5/r+VZn7S8gsomhJPIR4MqG1vQTRIRFSE=;
 b=k8k7GWO9gdySRAvMfbDETI9huEkSUaljrkNQja+5V6ctU+/lta1CIzk66Rf+AKDckG
 GiMCGea+ZDyZSXxzn4/WptTaVK6jHphyPdh2A+G4KxS+7Ya2hWR50VldCGuiaPOG9fRv
 nCcGhCe84KKXQ4igZYznpanrptkqZ0MjLlUywCrtQhnqUlZrrgSoc7PhimYCTh1WE+D2
 8d0sdY7bfywhRAu1rBwJn4JHO335yfKX7gV0j36mn/Qom6rpbJ6cQgdUyeDMeYJV1/OL
 41B+GXuTOxpB1MZl6o1wUtyNqcrcxU0cfpDvU+hN3PUn/LBxNHRc4ydc9lw7hi68JdLR
 +Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xR1NK3G4cM5/r+VZn7S8gsomhJPIR4MqG1vQTRIRFSE=;
 b=HpJly62CYIo9mVoeZZOKY/jSnPcych6J7bIObLudyaxuRV9Fk6/C4A0t1SUf+v1RkQ
 ovYH1yDYGqvFewhSzqDI0bQf80VFku5Y3mOTso6gFaBm8dwUUl1eNYVpYNjFVE+B69oi
 W1ABlUFDy58No5lYMRZjZ2iTmY44ex+Zi3qbcpA9RoBgX0oQtyLyid6x02PWK4U4UbAP
 Rnmt1a3yTqxGLtS+somlVfjrz0EctLbkqBxsaILyYYG5iNQWo9PcAOxzZO+8EitZRjz0
 Sxn+fCdwakeL0KzcxVZmYc/rWjfnKtejqmjOIlxbaT2RfidT1djNTY0RLhLcWgFmgu2A
 h2bw==
X-Gm-Message-State: AOAM530EwOyogiRw8hfTgDslNCOOzMYB9iSerUkfsNgRDunLFpHgFt08
 Wm6WOeTyhlKAUWlfq/LxzwuBMl0rWz1vSA==
X-Google-Smtp-Source: ABdhPJzgZ862bkc4g1/+SIexhykDz+T/9MPtPIbI12qOWciUVwgCyLj9rhFpToy1qh5WVtEWKJUCjA==
X-Received: by 2002:adf:8285:: with SMTP id 5mr14442624wrc.289.1610741534527; 
 Fri, 15 Jan 2021 12:12:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] hw/m68k/next-cube: Make next_irq take NeXTPC* as its
 opaque
Date: Fri, 15 Jan 2021 20:12:00 +0000
Message-Id: <20210115201206.17347-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Make the next_irq function take a NeXTPC* as its opaque rather than
the M68kCPU*.  This will make it simpler to turn the next_irq
function into a gpio input line of the NeXTPC device in the next
commit.

For this to work we have to pass the CPU to the NeXTPC device via a
link property, in the same way we do in q800.c (and for the same
reason).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index f5575cb43b8..a9e57304e04 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -94,6 +94,8 @@ struct NeXTPC {
     /* Temporary until all functionality has been moved into this device */
     NeXTState *ns;
 
+    M68kCPU *cpu;
+
     MemoryRegion mmiomem;
     MemoryRegion scrmem;
 
@@ -739,9 +741,9 @@ static const MemoryRegionOps dma_ops = {
  */
 static void next_irq(void *opaque, int number, int level)
 {
-    M68kCPU *cpu = opaque;
+    NeXTPC *s = NEXT_PC(opaque);
+    M68kCPU *cpu = s->cpu;
     int shift = 0;
-    NeXTState *ns = NEXT_MACHINE(qdev_get_machine());
 
     /* first switch sets interupt status */
     /* DPRINTF("IRQ %i\n",number); */
@@ -796,14 +798,14 @@ static void next_irq(void *opaque, int number, int level)
      * this HAS to be wrong, the interrupt handlers in mach and together
      * int_status and int_mask and return if there is a hit
      */
-    if (ns->int_mask & (1 << shift)) {
+    if (s->ns->int_mask & (1 << shift)) {
         DPRINTF("%x interrupt masked @ %x\n", 1 << shift, cpu->env.pc);
         /* return; */
     }
 
     /* second switch triggers the correct interrupt */
     if (level) {
-        ns->int_status |= 1 << shift;
+        s->ns->int_status |= 1 << shift;
 
         switch (number) {
         /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
@@ -832,7 +834,7 @@ static void next_irq(void *opaque, int number, int level)
             break;
         }
     } else {
-        ns->int_status &= ~(1 << shift);
+        s->ns->int_status &= ~(1 << shift);
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
 }
@@ -847,9 +849,9 @@ static void next_serial_irq(void *opaque, int n, int level)
     }
 }
 
-static void next_escc_init(M68kCPU *cpu)
+static void next_escc_init(DeviceState *pcdev)
 {
-    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, cpu, 2);
+    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, pcdev, 2);
     DeviceState *dev;
     SysBusDevice *s;
 
@@ -893,6 +895,17 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->scrmem);
 }
 
+/*
+ * If the m68k CPU implemented its inbound irq lines as GPIO lines
+ * rather than via the m68k_set_irq_level() function we would not need
+ * this cpu link property and could instead provide outbound IRQ lines
+ * that the board could wire up to the CPU.
+ */
+static Property next_pc_properties[] = {
+    DEFINE_PROP_LINK("cpu", NeXTPC, cpu, TYPE_M68K_CPU, M68kCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void next_pc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -900,6 +913,7 @@ static void next_pc_class_init(ObjectClass *klass, void *data)
     dc->desc = "NeXT Peripheral Controller";
     dc->realize = next_pc_realize;
     dc->reset = next_pc_reset;
+    device_class_set_props(dc, next_pc_properties);
     /* We will add the VMState in a later commit */
 }
 
@@ -938,6 +952,7 @@ static void next_cube_init(MachineState *machine)
 
     /* Peripheral Controller */
     pcdev = qdev_new(TYPE_NEXT_PC);
+    object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev), &error_fatal);
     /* Temporary while we refactor this code */
     NEXT_PC(pcdev)->ns = ns;
@@ -996,7 +1011,7 @@ static void next_cube_init(MachineState *machine)
     }
 
     /* Serial */
-    next_escc_init(cpu);
+    next_escc_init(pcdev);
 
     /* TODO: */
     /* Network */
-- 
2.20.1


