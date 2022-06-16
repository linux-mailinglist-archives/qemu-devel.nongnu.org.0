Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8F54DEAC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:09:14 +0200 (CEST)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mR7-0000qZ-NN
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1mNy-0006nP-Vv
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:06:01 -0400
Received: from mout-u-107.mailbox.org ([91.198.250.252]:59238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1mNx-0006R4-0W
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:05:58 -0400
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LNyVT1DFcz9sQv;
 Thu, 16 Jun 2022 12:05:53 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 1/2] hw/pci-host/pam.c: Fully support RE^WE semantics of
 i440FX PAM
Date: Thu, 16 Jun 2022 10:05:29 +0000
Message-Id: <20220616100530.716590-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LNyVT1DFcz9sQv
Received-SPF: pass client-ip=91.198.250.252;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Programmable Attribute Registers (PAM) of QEMU's emulated i440FX
chipset now fully support the exclusive Read Enable (RE) and Write
Enable (WE) modes by forwarding reads of the applicable PAM region to
RAM and writes to the bus or vice versa, respectively.

The prior behavior for the RE case was to setup a RAM alias and mark
it read-only, but no attempt was made to forward writes to the bus,
and read-only aliases of RAM do not prevent writes. Now, pam.c creates
a ROMD region (with read-only memory backing) coupled with a memory
operation that forwards writes to the bus.

For the WE case, a RAM alias was created, but with no attempt to
forward reads to the bus. Now, pam.c creates a MMIO region that writes
directly to RAM (bypassing the PAM region) and forwards reads to the
bus.

Additional changes:
- Change the type of pam_update parameter idx to type uint8_t,
  eliminating an assert check.
- Remove the fourth PAM alias, for normal RAM-based reads and writes
  of PAM regions, saving memory and clutter in mtree output.

Tested with SeaBIOS and AMIBIOS.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
(v2) Write to an AddressSpace mapped over ram_memory instead of using
     a pointer, as it suprisingly may not be backed by RAM on, e.g.,
     NUMA configurations.

 hw/pci-host/pam.c         | 136 +++++++++++++++++++++++++++++++-------
 include/hw/pci-host/pam.h |   7 +-
 2 files changed, 118 insertions(+), 25 deletions(-)

diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index 454dd120db..787428c7d8 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -28,43 +28,133 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/pci-host/pam.h"
 
+static void
+pam_rmem_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
+{
+    PAMMemoryRegion * const pam = (PAMMemoryRegion *)opaque;
+
+    (void)memory_region_dispatch_write(pam->pci_mr, pam->offset + addr, val,
+                                       size_memop(size), MEMTXATTRS_UNSPECIFIED);
+}
+
+static uint64_t
+pam_wmem_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    PAMMemoryRegion * const pam = (PAMMemoryRegion *)opaque;
+    uint64_t val = (uint64_t)~0;
+
+    (void)memory_region_dispatch_read(pam->pci_mr, pam->offset + addr, &val,
+                                      size_memop(size), MEMTXATTRS_UNSPECIFIED);
+
+    return val;
+}
+
+static void
+pam_wmem_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
+{
+    PAMMemoryRegion * const pam = (PAMMemoryRegion *)opaque;
+
+    switch (size) {
+    case 1:
+        stb_phys(&pam->ram_as, pam->offset + addr, val);
+        break;
+    case 2:
+        stw_le_phys(&pam->ram_as, pam->offset + addr, val);
+        break;
+    case 4:
+        stl_le_phys(&pam->ram_as, pam->offset + addr, val);
+        break;
+    case 8:
+        stq_le_phys(&pam->ram_as, pam->offset + addr, val);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static const MemoryRegionOps pam_rmem_ops = {
+    .write = pam_rmem_write,
+};
+
+static const MemoryRegionOps pam_wmem_ops = {
+    .read = pam_wmem_read,
+    .write = pam_wmem_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+};
+
 void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
-              MemoryRegion *system_memory, MemoryRegion *pci_address_space,
-              PAMMemoryRegion *mem, uint32_t start, uint32_t size)
+              MemoryRegion *system, MemoryRegion *pci,
+              PAMMemoryRegion *pam, uint32_t start, uint32_t size)
 {
+    char name[12] = "pam-splitr";
     int i;
 
-    /* RAM */
-    memory_region_init_alias(&mem->alias[3], OBJECT(dev), "pam-ram", ram_memory,
-                             start, size);
-    /* ROM (XXX: not quite correct) */
-    memory_region_init_alias(&mem->alias[1], OBJECT(dev), "pam-rom", ram_memory,
-                             start, size);
-    memory_region_set_readonly(&mem->alias[1], true);
+    name[10] = (start >> 14) + 17;
+    name[11] = '\0';
+
+    /* Forward all memory accesses to the bus.  */
+    memory_region_init_alias(&pam->alias[0], OBJECT(dev), "pam-pci",
+                             pci, start, size);
 
-    /* XXX: should distinguish read/write cases */
-    memory_region_init_alias(&mem->alias[0], OBJECT(dev), "pam-pci", pci_address_space,
-                             start, size);
-    memory_region_init_alias(&mem->alias[2], OBJECT(dev), "pam-pci", ram_memory,
-                             start, size);
+    /* Split modes */
+    /* Forward reads to RAM, writes to the bus.  */
+    memory_region_init_rom_device(&pam->alias[1], OBJECT(dev),
+                                  &pam_rmem_ops, pam, name, size,
+                                  &error_fatal);
+
+    /* Forward writes to RAM, reads to the bus.  */
+    name[9] = 'w';
+    memory_region_init_io(&pam->alias[2], OBJECT(dev), &pam_wmem_ops,
+                          pam, name, size);
 
     memory_region_transaction_begin();
-    for (i = 0; i < 4; ++i) {
-        memory_region_set_enabled(&mem->alias[i], false);
-        memory_region_add_subregion_overlap(system_memory, start,
-                                            &mem->alias[i], 1);
+    for (i = 0; i < 3; ++i) {
+        /* The caller is responsible for the initial state.  */
+        memory_region_set_enabled(&pam->alias[i], false);
+        memory_region_add_subregion_overlap(system, start,
+                                            &pam->alias[i], 1);
     }
     memory_region_transaction_commit();
-    mem->current = 0;
+    address_space_init(&pam->ram_as, ram_memory, "PAMRAM");
+    pam->current = 0;
+    pam->pci_mr = pci;
+    pam->offset = start;
 }
 
-void pam_update(PAMMemoryRegion *pam, int idx, uint8_t val)
+void pam_update(PAMMemoryRegion *pam, uint8_t idx, uint8_t val)
 {
-    assert(0 <= idx && idx < PAM_REGIONS_COUNT);
+    uint8_t ai;
+    assert(idx < PAM_REGIONS_COUNT);
+
+    ai = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
 
+    /* The caller is responsible for setting up a transaction.  */
     memory_region_set_enabled(&pam->alias[pam->current], false);
-    pam->current = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
-    memory_region_set_enabled(&pam->alias[pam->current], true);
+    switch (ai) {
+    case 1: {
+        const hwaddr pamsize = memory_region_size(&pam->alias[ai]);
+
+        address_space_read(&pam->ram_as, pam->offset,
+                           MEMTXATTRS_UNSPECIFIED,
+                           memory_region_get_ram_ptr(&pam->alias[ai]),
+                           pamsize);
+    }
+    /* FALLTHROUGH */
+    case 0:
+    case 2:
+        memory_region_set_enabled(&pam->alias[ai], true);
+        pam->current = ai;
+    }
 }
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index c1fd06ba2a..6f12210498 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -83,12 +83,15 @@
 #define PAM_REGIONS_COUNT       13
 
 typedef struct PAMMemoryRegion {
-    MemoryRegion alias[4];  /* index = PAM value */
+    AddressSpace ram_as;
+    MemoryRegion alias[3];  /* index = PAM value */
     unsigned current;
+    ram_addr_t offset;
+    MemoryRegion *pci_mr;
 } PAMMemoryRegion;
 
 void init_pam(DeviceState *dev, MemoryRegion *ram, MemoryRegion *system,
               MemoryRegion *pci, PAMMemoryRegion *mem, uint32_t start, uint32_t size);
-void pam_update(PAMMemoryRegion *mem, int idx, uint8_t val);
+void pam_update(PAMMemoryRegion *mem, uint8_t idx, uint8_t val);
 
 #endif /* QEMU_PAM_H */
-- 
2.34.1


