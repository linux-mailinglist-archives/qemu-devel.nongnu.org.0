Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3750A977
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:46:30 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcl3-0008GD-DN
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWc-0006GP-8a
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWa-0005c1-Gf
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:33 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVg-000Caf-NF; Thu, 21 Apr 2022 20:30:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:20 +0100
Message-Id: <20220421193100.5098-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/50] dino: return PCIBus from dino_init() using
 qdev_get_child_bus()
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

This allows access to the PCI bus without having to reference parent_obj directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 77b8089664..d89b48493f 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -523,14 +523,12 @@ PCIBus *dino_init(MemoryRegion *addr_space,
 {
     DeviceState *dev;
     DinoState *s;
-    PCIBus *b;
+    PCIBus *pci_bus;
 
     dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
     object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
                              &error_fatal);
     s = DINO_PCI_HOST_BRIDGE(dev);
-
-    b = s->parent_obj.bus;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     memory_region_add_subregion(addr_space, DINO_HPA,
@@ -539,7 +537,8 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
     *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
 
-    return b;
+    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
+    return pci_bus;
 }
 
 static void dino_pcihost_reset(DeviceState *dev)
-- 
2.20.1


