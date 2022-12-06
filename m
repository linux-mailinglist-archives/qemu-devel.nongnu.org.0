Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7F6446D5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 15:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ZK4-0006rO-Ec; Tue, 06 Dec 2022 09:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1p2VIY-00060Z-9o
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:35:43 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1p2VIO-0003lm-3w
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:35:30 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id BD09011F1F5;
 Tue,  6 Dec 2022 10:35:04 +0000 (UTC)
From: ~tianren <tianren@git.sr.ht>
Date: Mon, 05 Dec 2022 22:49:22 -0500
Subject: [PATCH qemu] migration/ram: support resize of option rom
Message-ID: <167032290445.18650.10573717780597012599-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Dec 2022 09:53:25 -0500
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
Reply-To: ~tianren <tianren@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tianren Zhang <tianren@smartx.com>

The pci option rom is a RAMBlock mapped from a rom file,
but in some cases of migration, the src and dest machine
may have rom files with different size, which causes the
migration to fail due to mismatch of RAMBlock size.

In those cases, we could make the migration more compatible
by initializing the RAMBlock of the option rom as resizeable.
When a guest with a smaller option rom size(e.g. 72k) is
migrated to the dest started with larger rom size(e.g. 256k),
the resize is totally feasible on the dest qemu because 72K
of incoming RAMBlock < local 256K RAMBlock for the option rom.

Signed-off-by: Tianren Zhang <tianren@smartx.com>
---
 hw/pci/pci.c          | 26 ++++++++++++++++++++++++-
 include/exec/memory.h | 25 ++++++++++++++++++++++++
 softmmu/memory.c      | 45 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..4a662e1d9a 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2407,6 +2407,30 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *pt=
r, uint32_t size)
     }
 }
=20
+/*
+ * This is a hook function which is called when the RAMBlock of a option rom
+ * is resized by QEMU in a live migration. For option rom, since the PCI bar
+ * is registered based on the size of ROM MemoryRegion, after a resize is do=
ne
+ * on this ROM MemoryRegion, we should re-register its PCI bar based on the =
new
+ * size.
+ */
+static void pci_option_rom_resized(const char* id, uint64_t length, void *ho=
st) {
+    MemoryRegion *mr =3D memory_region_from_ramblock_id(id);
+    if (mr =3D=3D NULL) {
+        // The failure to react the resize may cause the later check for
+        // PCI config to fail in the migration, so the migration may fail,
+        // but will not affect the src VM.
+        error_report("failed to find the block %s\n", id);
+        return;
+    }
+
+    PCIDevice *pdev =3D (PCIDevice *)DEVICE(mr->owner);
+    fprintf(stdout, "block id: %s resized to 0x" RAM_ADDR_FMT \
+            ", re-register pci bar for device: %s\n", id, length, pdev->name=
);
+
+    pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
+}
+
 /* Add an option rom for the device */
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                                Error **errp)
@@ -2486,7 +2510,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is=
_default_rom,
         snprintf(name, sizeof(name), "%s.rom", object_get_typename(OBJECT(pd=
ev)));
     }
     pdev->has_rom =3D true;
-    memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize, &e=
rror_fatal);
+    memory_region_init_resizeable_rom(&pdev->rom, OBJECT(pdev), name, pdev->=
romsize, pdev->romsize, pci_option_rom_resized, &error_fatal);
     ptr =3D memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..531d3bb6ef 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1276,6 +1276,29 @@ void memory_region_init_resizeable_ram(MemoryRegion *m=
r,
                                                        uint64_t length,
                                                        void *host),
                                        Error **errp);
+
+/*
+ * memory_region_init_resizeable_rom:  Initialize memory region with resizea=
ble
+ *                                     ROM.
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @name: Region name, becomes part of RAMBlock name used in migration stream
+ *        must be unique within any device
+ * @size: used size of the region.
+ * @max_size: max size of the region.
+ * @resized: callback to notify owner about used size change.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_resizeable_rom(MemoryRegion *mr,
+                                       struct Object *owner,
+                                       const char *name,
+                                       uint64_t size,
+                                       uint64_t max_size,
+                                       void (*resized)(const char*,
+                                                       uint64_t length,
+                                                       void *host),
+                                       Error **errp);
+
 #ifdef CONFIG_POSIX
=20
 /**
@@ -2820,6 +2843,8 @@ MemTxResult address_space_write_cached_slow(MemoryRegio=
nCache *cache,
 int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
 bool prepare_mmio_access(MemoryRegion *mr);
=20
+MemoryRegion *memory_region_from_ramblock_id(const char *id);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..0f69ed320b 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2399,6 +2399,18 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr)
     return ptr;
 }
=20
+MemoryRegion *memory_region_from_ramblock_id(const char *id)
+{
+    RAMBlock *block =3D qemu_ram_block_by_name(id);
+
+    if (!block) {
+        return NULL;
+    }
+
+    return block->mr;
+}
+
+
 MemoryRegion *memory_region_from_host(void *ptr, ram_addr_t *offset)
 {
     RAMBlock *block;
@@ -3550,6 +3562,39 @@ void memory_region_init_ram(MemoryRegion *mr,
     vmstate_register_ram(mr, owner_dev);
 }
=20
+void memory_region_init_resizeable_rom(MemoryRegion *mr,
+                                       struct Object *owner,
+                                       const char *name,
+                                       uint64_t size,
+                                       uint64_t max_size,
+                                       void (*resized)(const char*,
+                                                       uint64_t length,
+                                                       void *host),
+                                       Error **errp)
+{
+    DeviceState *owner_dev;
+    Error *err =3D NULL;
+
+    memory_region_init(mr, owner, name, size);
+    mr->ram =3D true;
+    mr->terminates =3D true;
+    mr->destructor =3D memory_region_destructor_ram;
+    mr->ram_block =3D qemu_ram_alloc_resizeable(size, max_size, resized,
+                                              mr, &err);
+    mr->readonly =3D true;
+
+    if (err) {
+        mr->size =3D int128_zero();
+        object_unparent(OBJECT(mr));
+        error_propagate(errp, err);
+        return;
+    }
+
+    owner_dev =3D DEVICE(owner);
+    vmstate_register_ram(mr, owner_dev);
+}
+
+
 void memory_region_init_rom(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
--=20
2.34.5

