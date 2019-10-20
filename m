Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2DDE089
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 22:49:27 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMI8k-0004oL-AF
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 16:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iMI6t-0003X3-PL
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 16:47:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iMI6s-0001AY-3n
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 16:47:31 -0400
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170]:39354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iMI6r-00019Z-FZ
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 16:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=aAq4FuTmvBelAk2kPh45CxDDF49kiV7lK9LL7N0GzU0=; b=tejG6Wcb+uRP4fFu/I+aCaxZFs
 cchj/jy0iF8HPPeHJc0iI8eP0Oo0VxfqhlgiwppR/SJwPSOZudXqd6btohYj5vx2gTTOsAVJa9Pnr
 kkdb1Cpk7btwztbU7C0UBC2RSszQqwCww8pGj00DRnZTHus9JJZffpqtPLFlsK2jBqDI=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1iMI6o-0002cH-PH; Sun, 20 Oct 2019 22:47:26 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/7] hw/hppa/dino.c: Improve emulation of Dino PCI chip
Date: Sun, 20 Oct 2019 22:47:18 +0200
Message-Id: <20191020204724.31537-2-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020204724.31537-1-svens@stackframe.org>
References: <20191020204724.31537-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The tests of the dino chip with the Online-diagnostics CD
("ODE DINOTEST") now succeeds.
Additionally add some qemu trace events.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 MAINTAINERS          |  2 +-
 hw/hppa/dino.c       | 82 +++++++++++++++++++++++++++++++++++++-------
 hw/hppa/trace-events |  5 +++
 3 files changed, 76 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250ce8e7a1..f9541c3305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -874,7 +874,7 @@ F: hw/*/etraxfs_*.c
 
 HP-PARISC Machines
 ------------------
-Dino
+HP B160L
 M: Richard Henderson <rth@twiddle.net>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index ab6969b45f..63f6f80203 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -1,7 +1,7 @@
 /*
- * HP-PARISC Dino PCI chipset emulation.
+ * HP-PARISC Dino PCI chipset emulation, as in B160L and similiar machines
  *
- * (C) 2017 by Helge Deller <deller@gmx.de>
+ * (C) 2017-2019 by Helge Deller <deller@gmx.de>
  *
  * This work is licensed under the GNU GPL license version 2 or later.
  *
@@ -21,6 +21,7 @@
 #include "migration/vmstate.h"
 #include "hppa_sys.h"
 #include "exec/address-spaces.h"
+#include "trace.h"
 
 
 #define TYPE_DINO_PCI_HOST_BRIDGE "dino-pcihost"
@@ -82,11 +83,16 @@
 #define DINO_PCI_HOST_BRIDGE(obj) \
     OBJECT_CHECK(DinoState, (obj), TYPE_DINO_PCI_HOST_BRIDGE)
 
+#define DINO800_REGS ((DINO_TLTIM - DINO_GMASK) / 4)
+static uint8_t reg800_keep_bits[DINO800_REGS]
+        = { 1, 7, 7, 8, 7, 9, 32, 8, 30, 25, 22, 9 };
+
 typedef struct DinoState {
     PCIHostState parent_obj;
 
     /* PCI_CONFIG_ADDR is parent_obj.config_reg, via pci_host_conf_be_ops,
        so that we can map PCI_CONFIG_DATA to pci_host_data_be_ops.  */
+    uint32_t config_reg_dino; /* keep original copy, including 2 lowest bits */
 
     uint32_t iar0;
     uint32_t iar1;
@@ -94,8 +100,12 @@ typedef struct DinoState {
     uint32_t ipr;
     uint32_t icr;
     uint32_t ilr;
+    uint32_t io_fbb_en;
     uint32_t io_addr_en;
     uint32_t io_control;
+    uint32_t toc_addr;
+
+    uint32_t reg800[DINO800_REGS];
 
     MemoryRegion this_mem;
     MemoryRegion pci_mem;
@@ -106,8 +116,6 @@ typedef struct DinoState {
     MemoryRegion bm_ram_alias;
     MemoryRegion bm_pci_alias;
     MemoryRegion bm_cpu_alias;
-
-    MemoryRegion cpu0_eir_mem;
 } DinoState;
 
 /*
@@ -122,6 +130,8 @@ static void gsc_to_pci_forwarding(DinoState *s)
     tmp = extract32(s->io_control, 7, 2);
     enabled = (tmp == 0x01);
     io_addr_en = s->io_addr_en;
+    /* Mask out first (=firmware) and last (=Dino) areas. */
+    io_addr_en &= 0x7ffffffe;
 
     memory_region_transaction_begin();
     for (i = 1; i < 31; i++) {
@@ -142,6 +152,8 @@ static bool dino_chip_mem_valid(void *opaque, hwaddr addr,
                                 unsigned size, bool is_write,
                                 MemTxAttrs attrs)
 {
+    bool ret = false;
+
     switch (addr) {
     case DINO_IAR0:
     case DINO_IAR1:
@@ -152,16 +164,22 @@ static bool dino_chip_mem_valid(void *opaque, hwaddr addr,
     case DINO_ICR:
     case DINO_ILR:
     case DINO_IO_CONTROL:
+    case DINO_IO_FBB_EN:
     case DINO_IO_ADDR_EN:
     case DINO_PCI_IO_DATA:
-        return true;
+    case DINO_TOC_ADDR:
+    case DINO_GMASK ... DINO_TLTIM:
+        ret = true;
+        break;
     case DINO_PCI_IO_DATA + 2:
-        return size <= 2;
+        ret = (size <= 2);
+        break;
     case DINO_PCI_IO_DATA + 1:
     case DINO_PCI_IO_DATA + 3:
-        return size == 1;
+        ret = (size == 1);
     }
-    return false;
+    trace_dino_chip_mem_valid(addr, ret);
+    return ret;
 }
 
 static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
@@ -194,6 +212,9 @@ static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
         }
         break;
 
+    case DINO_IO_FBB_EN:
+        val = s->io_fbb_en;
+        break;
     case DINO_IO_ADDR_EN:
         val = s->io_addr_en;
         break;
@@ -227,12 +248,28 @@ static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
     case DINO_IRR1:
         val = s->ilr & s->imr & s->icr;
         break;
+    case DINO_TOC_ADDR:
+        val = s->toc_addr;
+        break;
+    case DINO_GMASK ... DINO_TLTIM:
+        val = s->reg800[(addr - DINO_GMASK) / 4];
+        if (addr == DINO_PAMR) {
+            val &= ~0x01;  /* LSB is hardwired to 0 */
+        }
+        if (addr == DINO_MLTIM) {
+            val &= ~0x07;  /* 3 LSB are hardwired to 0 */
+        }
+        if (addr == DINO_BRDG_FEAT) {
+            val &= ~(0x10710E0ul | 8); /* bits 5-7, 24 & 15 reserved */
+        }
+        break;
 
     default:
         /* Controlled by dino_chip_mem_valid above.  */
         g_assert_not_reached();
     }
 
+    trace_dino_chip_read(addr, val);
     *data = val;
     return ret;
 }
@@ -245,6 +282,9 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
     AddressSpace *io;
     MemTxResult ret;
     uint16_t ioaddr;
+    int i;
+
+    trace_dino_chip_write(addr, val);
 
     switch (addr) {
     case DINO_IO_DATA ... DINO_PCI_IO_DATA + 3:
@@ -266,9 +306,11 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
         }
         return ret;
 
+    case DINO_IO_FBB_EN:
+        s->io_fbb_en = val & 0x03;
+        break;
     case DINO_IO_ADDR_EN:
-        /* Never allow first (=firmware) and last (=Dino) areas.  */
-        s->io_addr_en = val & 0x7ffffffe;
+        s->io_addr_en = val;
         gsc_to_pci_forwarding(s);
         break;
     case DINO_IO_CONTROL:
@@ -292,6 +334,10 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
         /* Any write to IPR clears the register.  */
         s->ipr = 0;
         break;
+    case DINO_TOC_ADDR:
+        /* IO_COMMAND of CPU with client_id bits */
+        s->toc_addr = 0xFFFA0030 | (val & 0x1e000);
+        break;
 
     case DINO_ILR:
     case DINO_IRR0:
@@ -299,6 +345,12 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
         /* These registers are read-only.  */
         break;
 
+    case DINO_GMASK ... DINO_TLTIM:
+        i = (addr - DINO_GMASK) / 4;
+        val &= (1ul << (1 + reg800_keep_bits[i])) - 1;
+        s->reg800[i] = val;
+        break;
+
     default:
         /* Controlled by dino_chip_mem_valid above.  */
         g_assert_not_reached();
@@ -332,8 +384,10 @@ static const VMStateDescription vmstate_dino = {
         VMSTATE_UINT32(ipr, DinoState),
         VMSTATE_UINT32(icr, DinoState),
         VMSTATE_UINT32(ilr, DinoState),
+        VMSTATE_UINT32(io_fbb_en, DinoState),
         VMSTATE_UINT32(io_addr_en, DinoState),
         VMSTATE_UINT32(io_control, DinoState),
+        VMSTATE_UINT32(toc_addr, DinoState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -362,14 +416,16 @@ static const MemoryRegionOps dino_config_data_ops = {
 
 static uint64_t dino_config_addr_read(void *opaque, hwaddr addr, unsigned len)
 {
-    PCIHostState *s = opaque;
-    return s->config_reg;
+    DinoState *s = opaque;
+    return s->config_reg_dino;
 }
 
 static void dino_config_addr_write(void *opaque, hwaddr addr,
                                    uint64_t val, unsigned len)
 {
     PCIHostState *s = opaque;
+    DinoState *ds = opaque;
+    ds->config_reg_dino = val; /* keep a copy of original value */
     s->config_reg = val & ~3U;
 }
 
@@ -453,6 +509,8 @@ PCIBus *dino_init(MemoryRegion *addr_space,
 
     dev = qdev_create(NULL, TYPE_DINO_PCI_HOST_BRIDGE);
     s = DINO_PCI_HOST_BRIDGE(dev);
+    s->iar0 = s->iar1 = CPU_HPA + 3;
+    s->toc_addr = 0xFFFA0030; /* IO_COMMAND of CPU */
 
     /* Dino PCI access from main memory.  */
     memory_region_init_io(&s->this_mem, OBJECT(s), &dino_chip_ops,
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 4e2acb6176..f943b16c4e 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -2,3 +2,8 @@
 
 # pci.c
 hppa_pci_iack_write(void) ""
+
+# dino.c
+dino_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
+dino_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+dino_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
-- 
2.23.0


