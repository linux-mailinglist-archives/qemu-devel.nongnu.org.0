Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603B5F375E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 22:55:54 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSTh-0003FU-0N
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 16:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRol-00055s-1j; Mon, 03 Oct 2022 16:13:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00010J-RH; Mon, 03 Oct 2022 16:13:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9330A75A165;
 Mon,  3 Oct 2022 22:13:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 66BDB75A160; Mon,  3 Oct 2022 22:13:24 +0200 (CEST)
Message-Id: <e626e83dadc82fba08c98e797d150bd8d4f8e22d.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 10/13] hw/ppc/mac.h: Move grackle-pcihost type declaration
 out to a header
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:24 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 MAINTAINERS                   |  1 +
 hw/pci-host/grackle.c         | 14 +----------
 hw/ppc/mac.h                  |  3 ---
 hw/ppc/mac_oldworld.c         |  1 +
 include/hw/pci-host/grackle.h | 44 +++++++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/pci-host/grackle.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 789172b2a8..6e6819afcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1345,6 +1345,7 @@ F: hw/intc/heathrow_pic.c
 F: hw/input/adb*
 F: include/hw/intc/heathrow_pic.h
 F: include/hw/input/adb*
+F: include/hw/pci-host/grackle.h
 F: pc-bios/qemu_vga.ndrv
 
 PReP
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index b05facf463..e4c7303859 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci_host.h"
 #include "hw/ppc/mac.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
@@ -33,18 +32,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "qom/object.h"
-
-OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
-
-struct GrackleState {
-    PCIHostState parent_obj;
-
-    uint32_t ofw_addr;
-    qemu_irq irqs[4];
-    MemoryRegion pci_mmio;
-    MemoryRegion pci_hole;
-    MemoryRegion pci_io;
-};
+#include "hw/pci-host/grackle.h"
 
 /* Don't know if this matches real hardware, but it agrees with OHW.  */
 static int pci_grackle_map_irq(PCIDevice *pci_dev, int irq_num)
diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 55cb02c990..fe77a6c6db 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -35,9 +35,6 @@
 #define KERNEL_LOAD_ADDR 0x01000000
 #define KERNEL_GAP       0x00100000
 
-/* Grackle PCI */
-#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
-
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index a10c884503..e1a22f8eba 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -38,6 +38,7 @@
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci-host/grackle.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/char/escc.h"
 #include "hw/misc/macio/macio.h"
diff --git a/include/hw/pci-host/grackle.h b/include/hw/pci-host/grackle.h
new file mode 100644
index 0000000000..7ad3a779f0
--- /dev/null
+++ b/include/hw/pci-host/grackle.h
@@ -0,0 +1,44 @@
+/*
+ * QEMU Grackle PCI host (heathrow OldWorld PowerMac)
+ *
+ * Copyright (c) 2006-2007 Fabrice Bellard
+ * Copyright (c) 2007 Jocelyn Mayer
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef GRACKLE_H
+#define GRACKLE_H
+
+#include "hw/pci/pci_host.h"
+
+#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
+
+struct GrackleState {
+    PCIHostState parent_obj;
+
+    uint32_t ofw_addr;
+    qemu_irq irqs[4];
+    MemoryRegion pci_mmio;
+    MemoryRegion pci_hole;
+    MemoryRegion pci_io;
+};
+
+#endif
-- 
2.30.4


