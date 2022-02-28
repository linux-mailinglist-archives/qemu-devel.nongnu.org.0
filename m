Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084AF4C6F0B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:11:46 +0100 (CET)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgkb-0006TQ-2x
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn4-0001Ya-Oj; Mon, 28 Feb 2022 01:45:52 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IN-E9; Mon, 28 Feb 2022 01:45:50 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E6A5711EF24;
 Mon, 28 Feb 2022 06:45:45 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:07:49 +0800
Subject: [PATCH qemu 2/7] hvf: simplify data structures and codes of memory
 related functions
Message-ID: <164603074537.20094.1732342403585879912-2@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan-Jie Wang <ubzeme@gmail.com>

* Remove mac_slot and use hvf_slot only. The function of the two structures
  are similar.

* Refactor function hvf_set_phys_mem():
 - Remove unnecessary checks because any modified memory sections
   will be removed first (region_del called first) before being added.
   Therefore, new sections do not overlap with existing sections.
 - Try to align memory sections first before giving up sections that are not
   aligned to host page size.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-accel-ops.c |   1 -
 accel/hvf/hvf-mem.c       | 197 +++++++++++++++++++-------------------
 include/sysemu/hvf_int.h  |   8 +-
 3 files changed, 100 insertions(+), 106 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 50a563bfe0..c77f142f2b 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -49,7 +49,6 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "exec/address-spaces.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 3712731ed9..c60303c84e 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -28,12 +28,16 @@
=20
 /* Memory slots */
=20
+#define HVF_NUM_SLOTS 32
+
+static hvf_slot memslots[HVF_NUM_SLOTS];
+
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 {
     hvf_slot *slot;
     int x;
-    for (x =3D 0; x < hvf_state->num_slots; ++x) {
-        slot =3D &hvf_state->slots[x];
+    for (x =3D 0; x < HVF_NUM_SLOTS; ++x) {
+        slot =3D &memslots[x];
         if (slot->size && start < (slot->start + slot->size) &&
             (start + size) > slot->start) {
             return slot;
@@ -42,128 +46,130 @@ hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_=
t size)
     return NULL;
 }
=20
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
+static hvf_slot *hvf_find_free_slot(void)
+{
+    hvf_slot *slot;
+    int x;
+    for (x =3D 0; x < HVF_NUM_SLOTS; x++) {
+        slot =3D &memslots[x];
+        if (!slot->size) {
+            return slot;
+        }
+    }
=20
-struct mac_slot mac_slots[32];
+    return slot;
+}
=20
-static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
+/*
+ * Hypervisor.framework requires that the host virtual address,
+ * the guest physical address and the size of memory regions are aligned
+ * to the host page size.
+ *
+ * The function here tries to align the guest physical address and the size.
+ *
+ * The return value is the aligned size.
+ * The aligned guest physical address will be written to `start'.
+ * The delta between the aligned address and the original address will be
+ * written to `delta'.
+ */
+static hwaddr hvf_align_section(MemoryRegionSection *section,
+                              hwaddr *start, hwaddr *delta)
 {
-    struct mac_slot *macslot;
-    hv_return_t ret;
-
-    macslot =3D &mac_slots[slot->slot_id];
+    hwaddr unaligned, _start, size, _delta;
=20
-    if (macslot->present) {
-        if (macslot->size !=3D slot->size) {
-            macslot->present =3D 0;
-            ret =3D hv_vm_unmap(macslot->gpa_start, macslot->size);
-            assert_hvf_ok(ret);
-        }
-    }
+    unaligned =3D section->offset_within_address_space;
+    size =3D int128_get64(section->size);
+    _start =3D ROUND_UP(unaligned, qemu_real_host_page_size);
+    _delta =3D _start - unaligned;
+    size =3D (size - _delta) & qemu_real_host_page_mask;
=20
-    if (!slot->size) {
-        return 0;
-    }
+    *start =3D _start;
+    *delta =3D _delta;
=20
-    macslot->present =3D 1;
-    macslot->gpa_start =3D slot->start;
-    macslot->size =3D slot->size;
-    ret =3D hv_vm_map(slot->mem, slot->start, slot->size, flags);
-    assert_hvf_ok(ret);
-    return 0;
+    return size;
 }
=20
 static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
-    hvf_slot *mem;
+    hvf_slot *slot;
+    hwaddr start, size, offset, delta;
+    uint8_t *host_addr;
     MemoryRegion *area =3D section->mr;
-    bool writeable =3D !area->readonly && !area->rom_device;
+    bool readonly, dirty_tracking;
     hv_memory_flags_t flags;
-    uint64_t page_size =3D qemu_real_host_page_size;
+    hv_return_t ret;
=20
-    if (!memory_region_is_ram(area)) {
-        if (writeable) {
-            return;
-        } else if (!memory_region_is_romd(area)) {
-            /*
-             * If the memory device is not in romd_mode, then we actually wa=
nt
-             * to remove the hvf memory slot so all accesses will trap.
-             */
-             add =3D false;
-        }
+    if (add && !memory_region_is_ram(area) && !memory_region_is_romd(area)) {
+        /*
+         * If the memory region is not RAM and is in ROMD mode,
+         * do not map it to the guest.
+         */
+        return;
     }
=20
-    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
-        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
-        /* Not page aligned, so we can not map as RAM */
-        add =3D false;
+    size =3D hvf_align_section(section, &start, &delta);
+
+    if (!size) {
+        /* The size is 0 after aligned. Do not map the region */
+        return;
     }
=20
-    mem =3D hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
+    if (add) {
+        /* add memory region */
+        offset =3D section->offset_within_region + delta;
+        host_addr =3D memory_region_get_ram_ptr(area) + offset;
=20
-    if (mem && add) {
-        if (mem->size =3D=3D int128_get64(section->size) &&
-            mem->start =3D=3D section->offset_within_address_space &&
-            mem->mem =3D=3D (memory_region_get_ram_ptr(area) +
-            section->offset_within_region)) {
-            return; /* Same region was attempted to register, go away. */
+        if (!QEMU_PTR_IS_ALIGNED(host_addr, qemu_real_host_page_size)) {
+            /* The host virtual address is not aligned. It cannot be mapped =
*/
+            return;
         }
-    }
=20
-    /* Region needs to be reset. set the size to 0 and remap it. */
-    if (mem) {
-        mem->size =3D 0;
-        if (do_hvf_set_memory(mem, 0)) {
-            error_report("Failed to reset overlapping slot");
+        dirty_tracking =3D !!memory_region_get_dirty_log_mask(area);
+        readonly =3D memory_region_is_rom(area) || memory_region_is_romd(are=
a);
+
+        /* setup a slot */
+        slot =3D hvf_find_free_slot();
+        if (!slot) {
+            error_report("No free slots");
             abort();
         }
-    }
=20
-    if (!add) {
-        return;
-    }
+        slot->start =3D start;
+        slot->size =3D size;
+        slot->offset =3D offset;
+        slot->flags =3D 0;
+        slot->region =3D area;
=20
-    if (area->readonly ||
-        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
-        flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
-    } else {
-        flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
-    }
+        if (readonly) {
+            slot->flags |=3D HVF_SLOT_READONLY;
+        }
=20
-    /* Now make a new slot. */
-    int x;
+        if (dirty_tracking) {
+            slot->flags |=3D HVF_SLOT_LOG;
+        }
=20
-    for (x =3D 0; x < hvf_state->num_slots; ++x) {
-        mem =3D &hvf_state->slots[x];
-        if (!mem->size) {
-            break;
+        /* set Hypervisor.framework memory mapping flags */
+        if (readonly || dirty_tracking) {
+            flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
+        } else {
+            flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
         }
-    }
=20
-    if (x =3D=3D hvf_state->num_slots) {
-        error_report("No free slots");
-        abort();
-    }
+        ret =3D hv_vm_map(host_addr, start, size, flags);
+        assert_hvf_ok(ret);
+    } else {
+        /* remove memory region */
+        slot =3D hvf_find_overlap_slot(start, size);
=20
-    mem->size =3D int128_get64(section->size);
-    mem->mem =3D memory_region_get_ram_ptr(area) + section->offset_within_re=
gion;
-    mem->start =3D section->offset_within_address_space;
-    mem->region =3D area;
+        if (slot) {
+            ret =3D hv_vm_unmap(start, size);
+            assert_hvf_ok(ret);
=20
-    if (do_hvf_set_memory(mem, flags)) {
-        error_report("Error registering new memory slot");
-        abort();
+            slot->size =3D 0;
+        }
     }
 }
=20
-
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     hvf_slot *slot;
@@ -239,14 +245,5 @@ static MemoryListener hvf_memory_listener =3D {
=20
 void hvf_init_memslots(void)
 {
-    int x;
-    HVFState *s =3D hvf_state;
-
-    s->num_slots =3D ARRAY_SIZE(s->slots);
-    for (x =3D 0; x < s->num_slots; ++x) {
-        s->slots[x].size =3D 0;
-        s->slots[x].slot_id =3D x;
-    }
-
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index cef20d750d..8ee31a16ac 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -19,12 +19,12 @@
=20
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
+#define HVF_SLOT_READONLY (1 << 1)
=20
 typedef struct hvf_slot {
     uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
+    uint64_t size;  /* 0 if the slot is free */
+    uint64_t offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
 } hvf_slot;
@@ -40,8 +40,6 @@ typedef struct hvf_vcpu_caps {
=20
 struct HVFState {
     AccelState parent;
-    hvf_slot slots[32];
-    int num_slots;
=20
     hvf_vcpu_caps *hvf_caps;
     uint64_t vtimer_offset;
--=20
2.34.1


