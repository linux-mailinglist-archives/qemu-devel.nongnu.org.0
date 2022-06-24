Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFC55957A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:32:52 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ekE-0002H3-0P
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o4eY6-0005hs-NH
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:18 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:53074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o4eY4-0004J0-D5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:20:18 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LTqmq13tKz9sRZ;
 Fri, 24 Jun 2022 10:20:11 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 1/2] hw/pci-host/pam.c: Fully support RE^WE semantics of
 i440FX PAM
Date: Fri, 24 Jun 2022 08:19:39 +0000
Message-Id: <20220624081940.161848-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::204;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-204.mailbox.org
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
RAM and writes to the bus or vice versa, respectively.  This chipset
functionality is often used by x86 firmware for shadowing ROM.

The prior behavior for the RE case was to setup a RAM alias and mark
it read-only, but writes were not forwarded to the bus and read-only
aliases of RAM do not prevent writes.  Programs running on operating
systems without memory protection could potentially overwrite shadowed
ROMS.  Now, pam.c creates a ROMD region (backed by its own allocated
memory) coupled with a memory operation that forwards writes to the
bus.

For the WE case, a RAM alias was created, but reads were not forwarded
to the bus.  This prevents the classic BIOS shadowing mechanism, which
is executing from flash ROM while copying the contents to RAM.  pam.c
now creates a MMIO region that writes directly to the chipset's RAM
address space (bypassing the PAM region) and forwards reads to the
bus.

Additional changes:
- Change parameter names from mem to pam.
- Change the pam_update parameter idx to type uint8_t, eliminating an
  assert check.
- pam_update: Return quickly if the PAM attributes are unchanged.
- Remove the fourth PAM alias, for normal RAM-based reads and writes
  of PAM regions, saving memory and clutter in mtree output.

Tested with SeaBIOS and AMIBIOS.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
(v3) Relocate ownership of the RAM address space into the respective
     PAM chipsets.  Eliminates the mtree duplicates.
     Avoid changing the PAM region if possible.
     Flush ROM after writing.
(v2) Write to an AddressSpace mapped over ram_memory instead of using
     a pointer, as it suprisingly may not be backed by RAM on, e.g.,
     NUMA configurations.

 hw/pci-host/i440fx.c         |  13 ++--
 hw/pci-host/pam.c            | 143 +++++++++++++++++++++++++++++------
 hw/pci-host/q35.c            |  14 ++--
 include/hw/pci-host/i440fx.h |   1 +
 include/hw/pci-host/pam.h    |  14 +++-
 include/hw/pci-host/q35.h    |   1 +
 6 files changed, 148 insertions(+), 38 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b..d288e916bb 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -266,6 +266,8 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     d = pci_create_simple(b, 0, pci_type);
     *pi440fx_state = I440FX_PCI_DEVICE(d);
     f = *pi440fx_state;
+    address_space_init(&f->memory_address_space, ram_memory,
+                       "i440FX-RAM");
     f->system_memory = address_space_mem;
     f->pci_address_space = pci_address_space;
     f->ram_memory = ram_memory;
@@ -295,12 +297,13 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     object_property_add_const_link(qdev_get_machine(), "smram",
                                    OBJECT(&f->smram));
 
-    init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
-             &f->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
+    init_pam(dev, &f->memory_address_space, f->system_memory,
+             f->pci_address_space, &f->pam_regions[0], PAM_BIOS_BASE,
+             PAM_BIOS_SIZE);
     for (i = 0; i < ARRAY_SIZE(f->pam_regions) - 1; ++i) {
-        init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
-                 &f->pam_regions[i+1], PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE,
-                 PAM_EXPAN_SIZE);
+        init_pam(dev, &f->memory_address_space, f->system_memory,
+                 f->pci_address_space, &f->pam_regions[i + 1],
+                 PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
     }
 
     ram_size = ram_size / 8 / 1024 / 1024;
diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index 454dd120db..b8eabe56a8 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -28,43 +28,138 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/pci-host/pam.h"
 
-void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
-              MemoryRegion *system_memory, MemoryRegion *pci_address_space,
-              PAMMemoryRegion *mem, uint32_t start, uint32_t size)
+static void
+pam_rmem_write(void *opaque, hwaddr addr, uint64_t val, unsigned int size)
 {
+    PAMMemoryRegion * const pam = (PAMMemoryRegion *)opaque;
+
+    (void)memory_region_dispatch_write(pam->pci_mr, pam->offset + addr,
+        val, size_memop(size), MEMTXATTRS_UNSPECIFIED);
+}
+
+static uint64_t
+pam_wmem_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    PAMMemoryRegion * const pam = (PAMMemoryRegion *)opaque;
+    uint64_t val = (uint64_t)~0;
+
+    (void)memory_region_dispatch_read(pam->pci_mr, pam->offset + addr,
+        &val, size_memop(size), MEMTXATTRS_UNSPECIFIED);
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
+        stb_phys(pam->ram_as, pam->offset + addr, val);
+        break;
+    case 2:
+        stw_le_phys(pam->ram_as, pam->offset + addr, val);
+        break;
+    case 4:
+        stl_le_phys(pam->ram_as, pam->offset + addr, val);
+        break;
+    case 8:
+        stq_le_phys(pam->ram_as, pam->offset + addr, val);
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
+void init_pam(DeviceState *dev, AddressSpace *ram,
+              MemoryRegion *system, MemoryRegion *pci,
+              PAMMemoryRegion *pam, uint32_t start, uint32_t size)
+{
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
 
-    /* XXX: should distinguish read/write cases */
-    memory_region_init_alias(&mem->alias[0], OBJECT(dev), "pam-pci", pci_address_space,
-                             start, size);
-    memory_region_init_alias(&mem->alias[2], OBJECT(dev), "pam-pci", ram_memory,
-                             start, size);
+    /* Forward all memory accesses to the bus.  */
+    memory_region_init_alias(&pam->alias[0], OBJECT(dev), "pam-pci",
+                             pci, start, size);
 
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
+
+    pam->current = 0;
     memory_region_transaction_begin();
-    for (i = 0; i < 4; ++i) {
-        memory_region_set_enabled(&mem->alias[i], false);
-        memory_region_add_subregion_overlap(system_memory, start,
-                                            &mem->alias[i], 1);
+    for (i = 0; i < ARRAY_SIZE(pam->alias); ++i) {
+        memory_region_set_enabled(&pam->alias[i], i == pam->current);
+        memory_region_add_subregion_overlap(system, start,
+                                            &pam->alias[i], 1);
     }
     memory_region_transaction_commit();
-    mem->current = 0;
+
+    pam->ram_as = ram;
+    pam->pci_mr = pci;
+    pam->offset = start;
 }
 
-void pam_update(PAMMemoryRegion *pam, int idx, uint8_t val)
+void pam_update(PAMMemoryRegion *pam, uint8_t idx, uint8_t val)
 {
-    assert(0 <= idx && idx < PAM_REGIONS_COUNT);
+    uint8_t ai;
+    assert(idx < PAM_REGIONS_COUNT);
 
+    ai = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
+
+    if (ai == pam->current) {
+        return;
+    }
+
+    /* The caller is responsible for setting up a transaction.  */
     memory_region_set_enabled(&pam->alias[pam->current], false);
-    pam->current = (val >> ((!(idx & 1)) * 4)) & PAM_ATTR_MASK;
-    memory_region_set_enabled(&pam->alias[pam->current], true);
+    switch (ai) {
+    case 1: {
+        const hwaddr pamsize = memory_region_size(&pam->alias[ai]);
+
+        (void)address_space_read(pam->ram_as, pam->offset,
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 memory_region_get_ram_ptr(&pam->alias[ai]),
+                                 pamsize);
+        memory_region_flush_rom_device(&pam->alias[ai], 0, pamsize);
+    }
+    /* FALLTHROUGH */
+    case 0:
+    case 2:
+        memory_region_set_enabled(&pam->alias[ai], true);
+        pam->current = ai;
+    }
 }
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 20da121374..52713b1211 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -644,12 +644,16 @@ static void mch_realize(PCIDevice *d, Error **errp)
     object_property_add_const_link(qdev_get_machine(), "smram",
                                    OBJECT(&mch->smram));
 
-    init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
-             mch->pci_address_space, &mch->pam_regions[0],
-             PAM_BIOS_BASE, PAM_BIOS_SIZE);
+    address_space_init(&mch->memory_address_space, mch->ram_memory,
+                       "ich9-ram");
+
+    init_pam(DEVICE(mch), &mch->memory_address_space,
+             mch->system_memory, mch->pci_address_space,
+             &mch->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
     for (i = 0; i < ARRAY_SIZE(mch->pam_regions) - 1; ++i) {
-        init_pam(DEVICE(mch), mch->ram_memory, mch->system_memory,
-                 mch->pci_address_space, &mch->pam_regions[i+1],
+        init_pam(DEVICE(mch), &mch->memory_address_space,
+                 mch->system_memory, mch->pci_address_space,
+                 &mch->pam_regions[i + 1],
                  PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE, PAM_EXPAN_SIZE);
     }
 }
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index f068aaba8f..7b9e5f0461 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -25,6 +25,7 @@ struct PCII440FXState {
     PCIDevice parent_obj;
     /*< public >*/
 
+    AddressSpace memory_address_space;
     MemoryRegion *system_memory;
     MemoryRegion *pci_address_space;
     MemoryRegion *ram_memory;
diff --git a/include/hw/pci-host/pam.h b/include/hw/pci-host/pam.h
index c1fd06ba2a..b4b7610548 100644
--- a/include/hw/pci-host/pam.h
+++ b/include/hw/pci-host/pam.h
@@ -83,12 +83,18 @@
 #define PAM_REGIONS_COUNT       13
 
 typedef struct PAMMemoryRegion {
-    MemoryRegion alias[4];  /* index = PAM value */
+    MemoryRegion alias[3];  /* index = PAM value */
     unsigned current;
+    ram_addr_t offset;
+    AddressSpace *ram_as;
+    MemoryRegion *pci_mr;
 } PAMMemoryRegion;
 
-void init_pam(DeviceState *dev, MemoryRegion *ram, MemoryRegion *system,
-              MemoryRegion *pci, PAMMemoryRegion *mem, uint32_t start, uint32_t size);
-void pam_update(PAMMemoryRegion *mem, int idx, uint8_t val);
+void init_pam(DeviceState *dev, AddressSpace *ram_as,
+              MemoryRegion *system, MemoryRegion *pci,
+              PAMMemoryRegion *pam, uint32_t start, uint32_t size);
+
+/* The caller is responsible for setting up a memory transaction.  */
+void pam_update(PAMMemoryRegion *pam, uint8_t idx, uint8_t val);
 
 #endif /* QEMU_PAM_H */
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index ab989698ef..561b603440 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -40,6 +40,7 @@ struct MCHPCIState {
     PCIDevice parent_obj;
     /*< public >*/
 
+    AddressSpace memory_address_space;
     MemoryRegion *ram_memory;
     MemoryRegion *pci_address_space;
     MemoryRegion *system_memory;
-- 
2.34.1


