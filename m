Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E44C6F27
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:18:23 +0100 (CET)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgr0-0000jJ-8q
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:18:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn7-0001Z0-7J; Mon, 28 Feb 2022 01:45:53 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IM-Gj; Mon, 28 Feb 2022 01:45:52 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C8D6A11EEFE;
 Mon, 28 Feb 2022 06:45:45 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 08:41:28 +0800
Subject: [PATCH qemu 1/7] hvf: move memory related functions from
 hvf-accel-ops.c to hvf-mem.c
Message-ID: <164603074537.20094.1732342403585879912-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
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

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-accel-ops.c | 220 +--------------------------------
 accel/hvf/hvf-mem.c       | 252 ++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build     |   1 +
 include/sysemu/hvf_int.h  |   2 +
 4 files changed, 256 insertions(+), 219 deletions(-)
 create mode 100644 accel/hvf/hvf-mem.c

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2..50a563bfe0 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -48,7 +48,6 @@
  */
=20
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
@@ -64,143 +63,6 @@ HVFState *hvf_state;
 #define HV_VM_DEFAULT NULL
 #endif
=20
-/* Memory slots */
-
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
-{
-    hvf_slot *slot;
-    int x;
-    for (x =3D 0; x < hvf_state->num_slots; ++x) {
-        slot =3D &hvf_state->slots[x];
-        if (slot->size && start < (slot->start + slot->size) &&
-            (start + size) > slot->start) {
-            return slot;
-        }
-    }
-    return NULL;
-}
-
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
-
-struct mac_slot mac_slots[32];
-
-static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
-{
-    struct mac_slot *macslot;
-    hv_return_t ret;
-
-    macslot =3D &mac_slots[slot->slot_id];
-
-    if (macslot->present) {
-        if (macslot->size !=3D slot->size) {
-            macslot->present =3D 0;
-            ret =3D hv_vm_unmap(macslot->gpa_start, macslot->size);
-            assert_hvf_ok(ret);
-        }
-    }
-
-    if (!slot->size) {
-        return 0;
-    }
-
-    macslot->present =3D 1;
-    macslot->gpa_start =3D slot->start;
-    macslot->size =3D slot->size;
-    ret =3D hv_vm_map(slot->mem, slot->start, slot->size, flags);
-    assert_hvf_ok(ret);
-    return 0;
-}
-
-static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
-{
-    hvf_slot *mem;
-    MemoryRegion *area =3D section->mr;
-    bool writeable =3D !area->readonly && !area->rom_device;
-    hv_memory_flags_t flags;
-    uint64_t page_size =3D qemu_real_host_page_size;
-
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
-    }
-
-    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
-        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
-        /* Not page aligned, so we can not map as RAM */
-        add =3D false;
-    }
-
-    mem =3D hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    if (mem && add) {
-        if (mem->size =3D=3D int128_get64(section->size) &&
-            mem->start =3D=3D section->offset_within_address_space &&
-            mem->mem =3D=3D (memory_region_get_ram_ptr(area) +
-            section->offset_within_region)) {
-            return; /* Same region was attempted to register, go away. */
-        }
-    }
-
-    /* Region needs to be reset. set the size to 0 and remap it. */
-    if (mem) {
-        mem->size =3D 0;
-        if (do_hvf_set_memory(mem, 0)) {
-            error_report("Failed to reset overlapping slot");
-            abort();
-        }
-    }
-
-    if (!add) {
-        return;
-    }
-
-    if (area->readonly ||
-        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
-        flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
-    } else {
-        flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
-    }
-
-    /* Now make a new slot. */
-    int x;
-
-    for (x =3D 0; x < hvf_state->num_slots; ++x) {
-        mem =3D &hvf_state->slots[x];
-        if (!mem->size) {
-            break;
-        }
-    }
-
-    if (x =3D=3D hvf_state->num_slots) {
-        error_report("No free slots");
-        abort();
-    }
-
-    mem->size =3D int128_get64(section->size);
-    mem->mem =3D memory_region_get_ram_ptr(area) + section->offset_within_re=
gion;
-    mem->start =3D section->offset_within_address_space;
-    mem->region =3D area;
-
-    if (do_hvf_set_memory(mem, flags)) {
-        error_report("Error registering new memory slot");
-        abort();
-    }
-}
-
 static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     if (!cpu->vcpu_dirty) {
@@ -238,79 +100,6 @@ static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
     run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
=20
-static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
-{
-    hvf_slot *slot;
-
-    slot =3D hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    /* protect region against writes; begin tracking it */
-    if (on) {
-        slot->flags |=3D HVF_SLOT_LOG;
-        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_EXEC);
-    /* stop tracking region*/
-    } else {
-        slot->flags &=3D ~HVF_SLOT_LOG;
-        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
-    }
-}
-
-static void hvf_log_start(MemoryListener *listener,
-                          MemoryRegionSection *section, int old, int new)
-{
-    if (old !=3D 0) {
-        return;
-    }
-
-    hvf_set_dirty_tracking(section, 1);
-}
-
-static void hvf_log_stop(MemoryListener *listener,
-                         MemoryRegionSection *section, int old, int new)
-{
-    if (new !=3D 0) {
-        return;
-    }
-
-    hvf_set_dirty_tracking(section, 0);
-}
-
-static void hvf_log_sync(MemoryListener *listener,
-                         MemoryRegionSection *section)
-{
-    /*
-     * sync of dirty pages is handled elsewhere; just make sure we keep
-     * tracking the region.
-     */
-    hvf_set_dirty_tracking(section, 1);
-}
-
-static void hvf_region_add(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    hvf_set_phys_mem(section, true);
-}
-
-static void hvf_region_del(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    hvf_set_phys_mem(section, false);
-}
-
-static MemoryListener hvf_memory_listener =3D {
-    .name =3D "hvf",
-    .priority =3D 10,
-    .region_add =3D hvf_region_add,
-    .region_del =3D hvf_region_del,
-    .log_start =3D hvf_log_start,
-    .log_stop =3D hvf_log_stop,
-    .log_sync =3D hvf_log_sync,
-};
-
 static void dummy_signal(int sig)
 {
 }
@@ -319,7 +108,6 @@ bool hvf_allowed;
=20
 static int hvf_accel_init(MachineState *ms)
 {
-    int x;
     hv_return_t ret;
     HVFState *s;
=20
@@ -328,14 +116,8 @@ static int hvf_accel_init(MachineState *ms)
=20
     s =3D g_new0(HVFState, 1);
=20
-    s->num_slots =3D ARRAY_SIZE(s->slots);
-    for (x =3D 0; x < s->num_slots; ++x) {
-        s->slots[x].size =3D 0;
-        s->slots[x].slot_id =3D x;
-    }
-
     hvf_state =3D s;
-    memory_listener_register(&hvf_memory_listener, &address_space_memory);
+    hvf_init_memslots();
=20
     return hvf_arch_init();
 }
diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
new file mode 100644
index 0000000000..3712731ed9
--- /dev/null
+++ b/accel/hvf/hvf-mem.c
@@ -0,0 +1,252 @@
+/*
+ * Copyright 2008 IBM Corporation
+ *           2008 Red Hat, Inc.
+ * Copyright 2011 Intel Corporation
+ * Copyright 2016 Veertu, Inc.
+ * Copyright 2017 The Android Open Source Project
+ *
+ * QEMU Hypervisor.framework support
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of version 2 of the GNU General Public
+ * License as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
+
+/* Memory slots */
+
+hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
+{
+    hvf_slot *slot;
+    int x;
+    for (x =3D 0; x < hvf_state->num_slots; ++x) {
+        slot =3D &hvf_state->slots[x];
+        if (slot->size && start < (slot->start + slot->size) &&
+            (start + size) > slot->start) {
+            return slot;
+        }
+    }
+    return NULL;
+}
+
+struct mac_slot {
+    int present;
+    uint64_t size;
+    uint64_t gpa_start;
+    uint64_t gva;
+};
+
+struct mac_slot mac_slots[32];
+
+static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
+{
+    struct mac_slot *macslot;
+    hv_return_t ret;
+
+    macslot =3D &mac_slots[slot->slot_id];
+
+    if (macslot->present) {
+        if (macslot->size !=3D slot->size) {
+            macslot->present =3D 0;
+            ret =3D hv_vm_unmap(macslot->gpa_start, macslot->size);
+            assert_hvf_ok(ret);
+        }
+    }
+
+    if (!slot->size) {
+        return 0;
+    }
+
+    macslot->present =3D 1;
+    macslot->gpa_start =3D slot->start;
+    macslot->size =3D slot->size;
+    ret =3D hv_vm_map(slot->mem, slot->start, slot->size, flags);
+    assert_hvf_ok(ret);
+    return 0;
+}
+
+static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
+{
+    hvf_slot *mem;
+    MemoryRegion *area =3D section->mr;
+    bool writeable =3D !area->readonly && !area->rom_device;
+    hv_memory_flags_t flags;
+    uint64_t page_size =3D qemu_real_host_page_size;
+
+    if (!memory_region_is_ram(area)) {
+        if (writeable) {
+            return;
+        } else if (!memory_region_is_romd(area)) {
+            /*
+             * If the memory device is not in romd_mode, then we actually wa=
nt
+             * to remove the hvf memory slot so all accesses will trap.
+             */
+             add =3D false;
+        }
+    }
+
+    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
+        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
+        /* Not page aligned, so we can not map as RAM */
+        add =3D false;
+    }
+
+    mem =3D hvf_find_overlap_slot(
+            section->offset_within_address_space,
+            int128_get64(section->size));
+
+    if (mem && add) {
+        if (mem->size =3D=3D int128_get64(section->size) &&
+            mem->start =3D=3D section->offset_within_address_space &&
+            mem->mem =3D=3D (memory_region_get_ram_ptr(area) +
+            section->offset_within_region)) {
+            return; /* Same region was attempted to register, go away. */
+        }
+    }
+
+    /* Region needs to be reset. set the size to 0 and remap it. */
+    if (mem) {
+        mem->size =3D 0;
+        if (do_hvf_set_memory(mem, 0)) {
+            error_report("Failed to reset overlapping slot");
+            abort();
+        }
+    }
+
+    if (!add) {
+        return;
+    }
+
+    if (area->readonly ||
+        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
+        flags =3D HV_MEMORY_READ | HV_MEMORY_EXEC;
+    } else {
+        flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
+    }
+
+    /* Now make a new slot. */
+    int x;
+
+    for (x =3D 0; x < hvf_state->num_slots; ++x) {
+        mem =3D &hvf_state->slots[x];
+        if (!mem->size) {
+            break;
+        }
+    }
+
+    if (x =3D=3D hvf_state->num_slots) {
+        error_report("No free slots");
+        abort();
+    }
+
+    mem->size =3D int128_get64(section->size);
+    mem->mem =3D memory_region_get_ram_ptr(area) + section->offset_within_re=
gion;
+    mem->start =3D section->offset_within_address_space;
+    mem->region =3D area;
+
+    if (do_hvf_set_memory(mem, flags)) {
+        error_report("Error registering new memory slot");
+        abort();
+    }
+}
+
+
+static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
+{
+    hvf_slot *slot;
+
+    slot =3D hvf_find_overlap_slot(
+            section->offset_within_address_space,
+            int128_get64(section->size));
+
+    /* protect region against writes; begin tracking it */
+    if (on) {
+        slot->flags |=3D HVF_SLOT_LOG;
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
+                      HV_MEMORY_READ | HV_MEMORY_EXEC);
+    /* stop tracking region*/
+    } else {
+        slot->flags &=3D ~HVF_SLOT_LOG;
+        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
+                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+    }
+}
+
+static void hvf_log_start(MemoryListener *listener,
+                          MemoryRegionSection *section, int old, int new)
+{
+    if (old !=3D 0) {
+        return;
+    }
+
+    hvf_set_dirty_tracking(section, 1);
+}
+
+static void hvf_log_stop(MemoryListener *listener,
+                         MemoryRegionSection *section, int old, int new)
+{
+    if (new !=3D 0) {
+        return;
+    }
+
+    hvf_set_dirty_tracking(section, 0);
+}
+
+static void hvf_log_sync(MemoryListener *listener,
+                         MemoryRegionSection *section)
+{
+    /*
+     * sync of dirty pages is handled elsewhere; just make sure we keep
+     * tracking the region.
+     */
+    hvf_set_dirty_tracking(section, 1);
+}
+
+static void hvf_region_add(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    hvf_set_phys_mem(section, true);
+}
+
+static void hvf_region_del(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    hvf_set_phys_mem(section, false);
+}
+
+static MemoryListener hvf_memory_listener =3D {
+    .name =3D "hvf",
+    .priority =3D 10,
+    .region_add =3D hvf_region_add,
+    .region_del =3D hvf_region_del,
+    .log_start =3D hvf_log_start,
+    .log_stop =3D hvf_log_stop,
+    .log_sync =3D hvf_log_sync,
+};
+
+void hvf_init_memslots(void)
+{
+    int x;
+    HVFState *s =3D hvf_state;
+
+    s->num_slots =3D ARRAY_SIZE(s->slots);
+    for (x =3D 0; x < s->num_slots; ++x) {
+        s->slots[x].size =3D 0;
+        s->slots[x].slot_id =3D x;
+    }
+
+    memory_listener_register(&hvf_memory_listener, &address_space_memory);
+}
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index fc52cb7843..7e7a2034f1 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -2,6 +2,7 @@ hvf_ss =3D ss.source_set()
 hvf_ss.add(files(
   'hvf-all.c',
   'hvf-accel-ops.c',
+  'hvf-mem.c',
 ))
=20
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6545f7cd61..cef20d750d 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -65,4 +65,6 @@ int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
=20
+void hvf_init_memslots(void);
+
 #endif
--=20
2.34.1


