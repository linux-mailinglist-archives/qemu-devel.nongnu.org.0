Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0ED559B5D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:21:01 +0200 (CEST)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kB9-0007hO-G1
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbr-0004SZ-0D; Fri, 24 Jun 2022 09:44:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbb-0005P4-H1; Fri, 24 Jun 2022 09:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bvp6XXGU++FDy/tKBWDnrR5MOKQeX9OJrQgvuTcNXMQ=; b=i1yGt658Ez592Dvw8EXEIjPtHa
 hdwtEjGak769S7XW27IjCNeKfuIfKMHJWtrFfmCAgSRk3NiJRgqww6iadEyOTw/jhtLMFKBo9KrUt
 RolgttBihrFcIWlLsEgVoo+0P+2DXnHFsW5VDeH44ZQ0dF5YPbMUEIDiYGkDBXuzN3+tjZnUoYGuj
 5Bpqh7MBMGrxD3ijsM9d8Bei8lQYAPP3N+byHhmvx9Nivg51/1zrjzq+FqN/JUB1BgtnpIz/SNlLd
 e8i2Qpwai753YZfSyu300RFh1S0LEIlXwhbLbfIJcaBaHxIS5ebAbq7XY48QAFRhprTXYcCBc3Psl
 uyYRX1jp6MYsQ6bASpNakOMkiO7e7N9inj7inPQuYxp2kz+cRNfpZJVNEgJ1nVjiCRjbzAoD3uO2u
 Da5R5ofjKDUdrvquGTFZcpEaF6Aqe6v9h6kwEyYaGpvDkfwFaJ5H0whG9bxsHXV4m7UUmC315Lp90
 2IGvtKjbba2uiXVadHETcuFUIf5X3JXC8AJPXrczRXlcyso9ydvDCGj5NQjHwoFy4a+ll16inWUcd
 1SBiEfzSnKPrNynD3ns5e6MgvPf2cdEzl3DMLcRHuQdeE88AaoaG11smzZefAPW3hgvd+34StMJ+W
 3msfCIpV2NRHK8sUIdq9Z148ZP/BigkAXckbbBkZQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZz-00037t-1n; Fri, 24 Jun 2022 14:42:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:57 +0100
Message-Id: <20220624134109.881989-43-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 42/54] lasips2: move mapping of LASIPS2 registers to HPPA
 machine
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

Now that the register memory regions are exposed as SysBus memory regions, move
the mapping of the LASIPS2 registers from lasips2_initfn() to the HPPA machine
(which is its only user).

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/hppa/machine.c          | 11 +++++++++--
 hw/input/lasips2.c         |  7 +------
 include/hw/input/lasips2.h |  3 +--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 72677aeb2a..44ecd446c3 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -280,8 +280,15 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    lasips2_initfn(addr_space, LASI_PS2KBD_HPA,
-                   qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
+    dev = DEVICE(lasips2_initfn(LASI_PS2KBD_HPA,
+                                qdev_get_gpio_in(lasi_dev,
+                                                 LASI_IRQ_PS2KBD_HPA)));
+    memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       0));
+    memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA + 0x100,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
+                                                       1));
 
     /* register power switch emulation */
     qemu_register_powerdown_notifier(&hppa_system_powerdown_notifier);
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 8d3a2d88e8..84e7a1feee 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,8 +245,7 @@ static void lasips2_port_set_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
-                             hwaddr base, qemu_irq irq)
+LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
     DeviceState *dev;
@@ -265,10 +264,6 @@ LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
-    memory_region_add_subregion(address_space, base, &s->kbd.reg);
-
-    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
-
     return s;
 }
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 5a35c22f73..b9723073e1 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -33,7 +33,6 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-LASIPS2State *lasips2_initfn(MemoryRegion *address_space, hwaddr base,
-                             qemu_irq irq);
+LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.30.2


