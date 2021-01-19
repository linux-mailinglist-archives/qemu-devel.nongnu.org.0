Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB342FB45D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:41:35 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mZy-00051O-3L
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVX-0008IO-EC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:59 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:42104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVV-0003T6-QL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:59 -0500
Received: by mail-wr1-f50.google.com with SMTP id m4so18815512wrx.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xTkFz7/GSvc/noBB/aNkyxHiQFLLyYH2++7ga90kzbA=;
 b=N7kiPbmMJDYZCFgv7HqPMf+BV3eIZV0K4hRZ9h/tvVNSZPHxaipJVa9uBr8WD/K347
 HStYVyi/KIcx8qxRl4Hbh3LaFuVMLAEYnK+R2p9FawEeyLsLEVSeYI/Ydj1ah4NSadqc
 EpcRxDHzpgu4wUWfPunX0VJ4jAjVaWrfHjg/k6CIPYOkuNrXS+AsUIwyCFVGV/MaIuR2
 V3nKT6smauvB7jQJJWeH3yqTfFS9O1PDk7zzOJdX27EvGOvGmLvM49lgQA7zi3fr3vaM
 Uy7LitWDArAfq4hOG79zFLazYfs4GBluTRov1B+HaErAMAZMqwEx9F51mVSDflXSEwfx
 EiCg==
X-Gm-Message-State: AOAM532fyR8lsAVN4mqgiw5rdUSrQ+mPCdGGL3vk2bvwWlfGooUWg41a
 WRyy/QSRmKo3L74vhFfKkdLMWpWwbRw=
X-Google-Smtp-Source: ABdhPJwUB/XoJey95xEC30BujZFGYhwWH/WmdBTZIZoshdePEMOKDxF6maqsbanFXh3IQ2vTNMH0Pg==
X-Received: by 2002:adf:8290:: with SMTP id 16mr3104352wrc.27.1611045416189;
 Tue, 19 Jan 2021 00:36:56 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:55 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/11] hw/m68k/next-cube: Make next_irq take NeXTPC* as its
 opaque
Date: Tue, 19 Jan 2021 09:36:11 +0100
Message-Id: <20210119083617.6337-6-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.50; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f50.google.com
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

Make the next_irq function take a NeXTPC* as its opaque rather than
the M68kCPU*.  This will make it simpler to turn the next_irq
function into a gpio input line of the NeXTPC device in the next
commit.

For this to work we have to pass the CPU to the NeXTPC device via a
link property, in the same way we do in q800.c (and for the same
reason).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-6-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 7d44bcf783..83e219a79a 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -95,6 +95,8 @@ struct NeXTPC {
     /* Temporary until all functionality has been moved into this device */
     NeXTState *ns;
 
+    M68kCPU *cpu;
+
     MemoryRegion mmiomem;
     MemoryRegion scrmem;
 
@@ -740,9 +742,9 @@ static const MemoryRegionOps dma_ops = {
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
@@ -797,14 +799,14 @@ static void next_irq(void *opaque, int number, int level)
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
@@ -833,7 +835,7 @@ static void next_irq(void *opaque, int number, int level)
             break;
         }
     } else {
-        ns->int_status &= ~(1 << shift);
+        s->ns->int_status &= ~(1 << shift);
         cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_HARD);
     }
 }
@@ -848,9 +850,9 @@ static void next_serial_irq(void *opaque, int n, int level)
     }
 }
 
-static void next_escc_init(M68kCPU *cpu)
+static void next_escc_init(DeviceState *pcdev)
 {
-    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, cpu, 2);
+    qemu_irq *ser_irq = qemu_allocate_irqs(next_serial_irq, pcdev, 2);
     DeviceState *dev;
     SysBusDevice *s;
 
@@ -894,6 +896,17 @@ static void next_pc_realize(DeviceState *dev, Error **errp)
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
@@ -901,6 +914,7 @@ static void next_pc_class_init(ObjectClass *klass, void *data)
     dc->desc = "NeXT Peripheral Controller";
     dc->realize = next_pc_realize;
     dc->reset = next_pc_reset;
+    device_class_set_props(dc, next_pc_properties);
     /* We will add the VMState in a later commit */
 }
 
@@ -939,6 +953,7 @@ static void next_cube_init(MachineState *machine)
 
     /* Peripheral Controller */
     pcdev = qdev_new(TYPE_NEXT_PC);
+    object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev), &error_fatal);
     /* Temporary while we refactor this code */
     NEXT_PC(pcdev)->ns = ns;
@@ -997,7 +1012,7 @@ static void next_cube_init(MachineState *machine)
     }
 
     /* Serial */
-    next_escc_init(cpu);
+    next_escc_init(pcdev);
 
     /* TODO: */
     /* Network */
-- 
2.29.2


