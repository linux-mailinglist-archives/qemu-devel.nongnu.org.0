Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31F50A954
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:37:54 +0200 (CEST)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhccj-0003y5-RQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWv-0007Dn-2q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWt-0005dW-31
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:52 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVt-000Caf-5V; Thu, 21 Apr 2022 20:30:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:24 +0100
Message-Id: <20220421193100.5098-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 14/50] machine.c: map DINO device during board configuration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c    | 3 ---
 hw/hppa/machine.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 6c488c908e..82f301653b 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -421,9 +421,6 @@ DinoState *dino_init(MemoryRegion *addr_space,
     s = DINO_PCI_HOST_BRIDGE(dev);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-    memory_region_add_subregion(addr_space, DINO_HPA,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
-
     *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
     *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f23ebd9548..e16305d195 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -168,6 +168,9 @@ static void machine_hppa_init(MachineState *machine)
 
     /* Init Dino (PCI host bus chip).  */
     dino_dev = DEVICE(dino_init(addr_space, &rtc_irq, &serial_irq));
+    memory_region_add_subregion(addr_space, DINO_HPA,
+                                sysbus_mmio_get_region(
+                                    SYS_BUS_DEVICE(dino_dev), 0));
     pci_bus = PCI_BUS(qdev_get_child_bus(dino_dev, "pci"));
     assert(pci_bus);
 
-- 
2.20.1


