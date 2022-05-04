Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224DD519C78
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:59:22 +0200 (CEST)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBmz-00045N-8d
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHf-0007r6-6F
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHd-00041R-9w
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:58 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGZ-0002VG-FC; Wed, 04 May 2022 10:25:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:23 +0100
Message-Id: <20220504092600.10048-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 13/50] dino: change dino_init() to return the DINO device
 instead of PCIBus
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

This is in preparation for using more qdev APIs during the configuration of the
HPPA generic machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/dino.c     | 8 +++-----
 hw/hppa/hppa_sys.h | 3 ++-
 hw/hppa/machine.c  | 6 ++++--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 01546ff6fc..6c488c908e 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -409,12 +409,11 @@ static void dino_set_serial_irq(void *opaque, int irq, int level)
     dino_set_irq(opaque, 10, level);
 }
 
-PCIBus *dino_init(MemoryRegion *addr_space,
-                  qemu_irq *p_rtc_irq, qemu_irq *p_ser_irq)
+DinoState *dino_init(MemoryRegion *addr_space,
+                     qemu_irq *p_rtc_irq, qemu_irq *p_ser_irq)
 {
     DeviceState *dev;
     DinoState *s;
-    PCIBus *pci_bus;
 
     dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
     object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
@@ -428,8 +427,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     *p_rtc_irq = qemu_allocate_irq(dino_set_timer_irq, s, 0);
     *p_ser_irq = qemu_allocate_irq(dino_set_serial_irq, s, 0);
 
-    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
-    return pci_bus;
+    return s;
 }
 
 static void dino_pcihost_reset(DeviceState *dev)
diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 9d8b28ec01..88773d2c35 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -9,8 +9,9 @@
 #include "hw/intc/i8259.h"
 
 #include "hppa_hardware.h"
+#include "dino.h"
 
-PCIBus *dino_init(MemoryRegion *, qemu_irq *, qemu_irq *);
+DinoState *dino_init(MemoryRegion *, qemu_irq *, qemu_irq *);
 DeviceState *lasi_init(MemoryRegion *);
 #define enable_lasi_lan()       0
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 971d7ffcfe..94bc1b202a 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,6 +17,7 @@
 #include "hw/char/serial.h"
 #include "hw/net/lasi_82596.h"
 #include "hw/nmi.h"
+#include "dino.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -126,7 +127,7 @@ static void machine_hppa_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    DeviceState *dev;
+    DeviceState *dev, *dino_dev;
     PCIBus *pci_bus;
     ISABus *isa_bus;
     qemu_irq rtc_irq, serial_irq;
@@ -166,7 +167,8 @@ static void machine_hppa_init(MachineState *machine)
     lasi_init(addr_space);
 
     /* Init Dino (PCI host bus chip).  */
-    pci_bus = dino_init(addr_space, &rtc_irq, &serial_irq);
+    dino_dev = DEVICE(dino_init(addr_space, &rtc_irq, &serial_irq));
+    pci_bus = PCI_BUS(qdev_get_child_bus(dino_dev, "pci"));
     assert(pci_bus);
 
     /* Create ISA bus. */
-- 
2.20.1


