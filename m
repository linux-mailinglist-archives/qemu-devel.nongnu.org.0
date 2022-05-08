Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99051F0F5
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:06:34 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnAn-0002bO-5v
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2R-0006NF-S1
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2P-0006zH-QJ
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:55 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1Q-0000yR-Nn; Sun, 08 May 2022 20:56:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:08 +0100
Message-Id: <20220508195650.28590-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 11/53] dino: split declarations from dino.c into dino.h
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

This is to allow access to DinoState from outside dino.c. With the changes to
the headers it is now possible to remove the duplicate definition for
TYPE_DINO_PCI_HOST_BRIDGE from hppa_sys.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c     | 111 +--------------------------------------
 hw/hppa/dino.h     | 127 +++++++++++++++++++++++++++++++++++++++++++++
 hw/hppa/hppa_sys.h |   2 -
 3 files changed, 128 insertions(+), 112 deletions(-)
 create mode 100644 hw/hppa/dino.h

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index d89b48493f..01546ff6fc 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -18,122 +18,13 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
+#include "dino.h"
 #include "migration/vmstate.h"
 #include "hppa_sys.h"
 #include "trace.h"
 #include "qom/object.h"
 
 
-#define TYPE_DINO_PCI_HOST_BRIDGE "dino-pcihost"
-
-#define DINO_IAR0               0x004
-#define DINO_IODC               0x008
-#define DINO_IRR0               0x00C  /* RO */
-#define DINO_IAR1               0x010
-#define DINO_IRR1               0x014  /* RO */
-#define DINO_IMR                0x018
-#define DINO_IPR                0x01C
-#define DINO_TOC_ADDR           0x020
-#define DINO_ICR                0x024
-#define DINO_ILR                0x028  /* RO */
-#define DINO_IO_COMMAND         0x030  /* WO */
-#define DINO_IO_STATUS          0x034  /* RO */
-#define DINO_IO_CONTROL         0x038
-#define DINO_IO_GSC_ERR_RESP    0x040  /* RO */
-#define DINO_IO_ERR_INFO        0x044  /* RO */
-#define DINO_IO_PCI_ERR_RESP    0x048  /* RO */
-#define DINO_IO_FBB_EN          0x05c
-#define DINO_IO_ADDR_EN         0x060
-#define DINO_PCI_CONFIG_ADDR    0x064
-#define DINO_PCI_CONFIG_DATA    0x068
-#define DINO_PCI_IO_DATA        0x06c
-#define DINO_PCI_MEM_DATA       0x070  /* Dino 3.x only */
-#define DINO_GSC2X_CONFIG       0x7b4  /* RO */
-#define DINO_GMASK              0x800
-#define DINO_PAMR               0x804
-#define DINO_PAPR               0x808
-#define DINO_DAMODE             0x80c
-#define DINO_PCICMD             0x810
-#define DINO_PCISTS             0x814  /* R/WC */
-#define DINO_MLTIM              0x81c
-#define DINO_BRDG_FEAT          0x820
-#define DINO_PCIROR             0x824
-#define DINO_PCIWOR             0x828
-#define DINO_TLTIM              0x830
-
-#define DINO_IRQS         11      /* bits 0-10 are architected */
-#define DINO_IRR_MASK     0x5ff   /* only 10 bits are implemented */
-#define DINO_LOCAL_IRQS   (DINO_IRQS + 1)
-#define DINO_MASK_IRQ(x)  (1 << (x))
-
-#define PCIINTA   0x001
-#define PCIINTB   0x002
-#define PCIINTC   0x004
-#define PCIINTD   0x008
-#define PCIINTE   0x010
-#define PCIINTF   0x020
-#define GSCEXTINT 0x040
-/* #define xxx       0x080 - bit 7 is "default" */
-/* #define xxx    0x100 - bit 8 not used */
-/* #define xxx    0x200 - bit 9 not used */
-#define RS232INT  0x400
-
-#define DINO_MEM_CHUNK_SIZE (8 * MiB)
-
-OBJECT_DECLARE_SIMPLE_TYPE(DinoState, DINO_PCI_HOST_BRIDGE)
-
-#define DINO800_REGS (1 + (DINO_TLTIM - DINO_GMASK) / 4)
-static const uint32_t reg800_keep_bits[DINO800_REGS] = {
-    MAKE_64BIT_MASK(0, 1),  /* GMASK */
-    MAKE_64BIT_MASK(0, 7),  /* PAMR */
-    MAKE_64BIT_MASK(0, 7),  /* PAPR */
-    MAKE_64BIT_MASK(0, 8),  /* DAMODE */
-    MAKE_64BIT_MASK(0, 7),  /* PCICMD */
-    MAKE_64BIT_MASK(0, 9),  /* PCISTS */
-    MAKE_64BIT_MASK(0, 32), /* Undefined */
-    MAKE_64BIT_MASK(0, 8),  /* MLTIM */
-    MAKE_64BIT_MASK(0, 30), /* BRDG_FEAT */
-    MAKE_64BIT_MASK(0, 24), /* PCIROR */
-    MAKE_64BIT_MASK(0, 22), /* PCIWOR */
-    MAKE_64BIT_MASK(0, 32), /* Undocumented */
-    MAKE_64BIT_MASK(0, 9),  /* TLTIM */
-};
-
-struct DinoState {
-    PCIHostState parent_obj;
-
-    /*
-     * PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
-     * so that we can map PCI_CONFIG_DATA to pci_host_data_be_ops.
-     */
-    uint32_t config_reg_dino; /* keep original copy, including 2 lowest bits */
-
-    uint32_t iar0;
-    uint32_t iar1;
-    uint32_t imr;
-    uint32_t ipr;
-    uint32_t icr;
-    uint32_t ilr;
-    uint32_t io_fbb_en;
-    uint32_t io_addr_en;
-    uint32_t io_control;
-    uint32_t toc_addr;
-
-    uint32_t reg800[DINO800_REGS];
-
-    MemoryRegion this_mem;
-    MemoryRegion pci_mem;
-    MemoryRegion pci_mem_alias[32];
-
-    MemoryRegion *memory_as;
-
-    AddressSpace bm_as;
-    MemoryRegion bm;
-    MemoryRegion bm_ram_alias;
-    MemoryRegion bm_pci_alias;
-    MemoryRegion bm_cpu_alias;
-};
-
 /*
  * Dino can forward memory accesses from the CPU in the range between
  * 0xf0800000 and 0xff000000 to the PCI bus.
diff --git a/hw/hppa/dino.h b/hw/hppa/dino.h
new file mode 100644
index 0000000000..1a26667377
--- /dev/null
+++ b/hw/hppa/dino.h
@@ -0,0 +1,127 @@
+/*
+ * HP-PARISC Dino PCI chipset emulation, as in B160L and similiar machines
+ *
+ * (C) 2017-2019 by Helge Deller <deller@gmx.de>
+ *
+ * This work is licensed under the GNU GPL license version 2 or later.
+ *
+ * Documentation available at:
+ * https://parisc.wiki.kernel.org/images-parisc/9/91/Dino_ers.pdf
+ * https://parisc.wiki.kernel.org/images-parisc/7/70/Dino_3_1_Errata.pdf
+ */
+
+#ifndef DINO_H
+#define DINO_H
+
+#include "hw/pci/pci_host.h"
+
+#define TYPE_DINO_PCI_HOST_BRIDGE "dino-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(DinoState, DINO_PCI_HOST_BRIDGE)
+
+#define DINO_IAR0               0x004
+#define DINO_IODC               0x008
+#define DINO_IRR0               0x00C  /* RO */
+#define DINO_IAR1               0x010
+#define DINO_IRR1               0x014  /* RO */
+#define DINO_IMR                0x018
+#define DINO_IPR                0x01C
+#define DINO_TOC_ADDR           0x020
+#define DINO_ICR                0x024
+#define DINO_ILR                0x028  /* RO */
+#define DINO_IO_COMMAND         0x030  /* WO */
+#define DINO_IO_STATUS          0x034  /* RO */
+#define DINO_IO_CONTROL         0x038
+#define DINO_IO_GSC_ERR_RESP    0x040  /* RO */
+#define DINO_IO_ERR_INFO        0x044  /* RO */
+#define DINO_IO_PCI_ERR_RESP    0x048  /* RO */
+#define DINO_IO_FBB_EN          0x05c
+#define DINO_IO_ADDR_EN         0x060
+#define DINO_PCI_CONFIG_ADDR    0x064
+#define DINO_PCI_CONFIG_DATA    0x068
+#define DINO_PCI_IO_DATA        0x06c
+#define DINO_PCI_MEM_DATA       0x070  /* Dino 3.x only */
+#define DINO_GSC2X_CONFIG       0x7b4  /* RO */
+#define DINO_GMASK              0x800
+#define DINO_PAMR               0x804
+#define DINO_PAPR               0x808
+#define DINO_DAMODE             0x80c
+#define DINO_PCICMD             0x810
+#define DINO_PCISTS             0x814  /* R/WC */
+#define DINO_MLTIM              0x81c
+#define DINO_BRDG_FEAT          0x820
+#define DINO_PCIROR             0x824
+#define DINO_PCIWOR             0x828
+#define DINO_TLTIM              0x830
+
+#define DINO_IRQS         11      /* bits 0-10 are architected */
+#define DINO_IRR_MASK     0x5ff   /* only 10 bits are implemented */
+#define DINO_LOCAL_IRQS   (DINO_IRQS + 1)
+#define DINO_MASK_IRQ(x)  (1 << (x))
+
+#define PCIINTA   0x001
+#define PCIINTB   0x002
+#define PCIINTC   0x004
+#define PCIINTD   0x008
+#define PCIINTE   0x010
+#define PCIINTF   0x020
+#define GSCEXTINT 0x040
+/* #define xxx       0x080 - bit 7 is "default" */
+/* #define xxx    0x100 - bit 8 not used */
+/* #define xxx    0x200 - bit 9 not used */
+#define RS232INT  0x400
+
+#define DINO_MEM_CHUNK_SIZE (8 * MiB)
+
+#define DINO800_REGS (1 + (DINO_TLTIM - DINO_GMASK) / 4)
+static const uint32_t reg800_keep_bits[DINO800_REGS] = {
+    MAKE_64BIT_MASK(0, 1),  /* GMASK */
+    MAKE_64BIT_MASK(0, 7),  /* PAMR */
+    MAKE_64BIT_MASK(0, 7),  /* PAPR */
+    MAKE_64BIT_MASK(0, 8),  /* DAMODE */
+    MAKE_64BIT_MASK(0, 7),  /* PCICMD */
+    MAKE_64BIT_MASK(0, 9),  /* PCISTS */
+    MAKE_64BIT_MASK(0, 32), /* Undefined */
+    MAKE_64BIT_MASK(0, 8),  /* MLTIM */
+    MAKE_64BIT_MASK(0, 30), /* BRDG_FEAT */
+    MAKE_64BIT_MASK(0, 24), /* PCIROR */
+    MAKE_64BIT_MASK(0, 22), /* PCIWOR */
+    MAKE_64BIT_MASK(0, 32), /* Undocumented */
+    MAKE_64BIT_MASK(0, 9),  /* TLTIM */
+};
+
+struct DinoState {
+    PCIHostState parent_obj;
+
+    /*
+     * PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
+     * so that we can map PCI_CONFIG_DATA to pci_host_data_be_ops.
+     */
+    uint32_t config_reg_dino; /* keep original copy, including 2 lowest bits */
+
+    uint32_t iar0;
+    uint32_t iar1;
+    uint32_t imr;
+    uint32_t ipr;
+    uint32_t icr;
+    uint32_t ilr;
+    uint32_t io_fbb_en;
+    uint32_t io_addr_en;
+    uint32_t io_control;
+    uint32_t toc_addr;
+
+    uint32_t reg800[DINO800_REGS];
+
+    MemoryRegion this_mem;
+    MemoryRegion pci_mem;
+    MemoryRegion pci_mem_alias[32];
+
+    MemoryRegion *memory_as;
+
+    AddressSpace bm_as;
+    MemoryRegion bm;
+    MemoryRegion bm_ram_alias;
+    MemoryRegion bm_pci_alias;
+    MemoryRegion bm_cpu_alias;
+};
+
+#endif
diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 0b18271cc9..9d8b28ec01 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -14,8 +14,6 @@ PCIBus *dino_init(MemoryRegion *, qemu_irq *, qemu_irq *);
 DeviceState *lasi_init(MemoryRegion *);
 #define enable_lasi_lan()       0
 
-#define TYPE_DINO_PCI_HOST_BRIDGE "dino-pcihost"
-
 /* hppa_pci.c.  */
 extern const MemoryRegionOps hppa_pci_ignore_ops;
 extern const MemoryRegionOps hppa_pci_conf1_ops;
-- 
2.20.1


