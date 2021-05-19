Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848D3897D9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:25:37 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSl6-0007Sf-BN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSil-000457-QL; Wed, 19 May 2021 16:23:11 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48128 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSic-0003DK-NX; Wed, 19 May 2021 16:23:11 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id EC98B6080618;
 Wed, 19 May 2021 22:22:56 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 03/19] hvf: Move cpu functions into common directory
Date: Wed, 19 May 2021 22:22:37 +0200
Message-Id: <20210519202253.76782-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves CPU and memory operations over. While at it, make sure
the code is consumable on non-i386 systems.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c  | 308 ++++++++++++++++++++++++++++++++++++-
 include/sysemu/hvf_int.h   |   4 +
 target/i386/hvf/hvf-i386.h |   2 -
 target/i386/hvf/hvf.c      | 302 ------------------------------------
 target/i386/hvf/x86hvf.h   |   2 -
 5 files changed, 311 insertions(+), 307 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index cbaad238e0..c2136dfbb8 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -50,13 +50,319 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "exec/address-spaces.h"
+#include "exec/exec-all.h"
+#include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "sysemu/runstate.h"
-#include "target/i386/cpu.h"
 #include "qemu/guest-random.h"
 
 #include "hvf-accel-ops.h"
 
+HVFState *hvf_state;
+
+/* Memory slots */
+
+hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
+{
+    hvf_slot *slot;
+    int x;
+    for (x = 0; x < hvf_state->num_slots; ++x) {
+        slot = &hvf_state->slots[x];
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
+    macslot = &mac_slots[slot->slot_id];
+
+    if (macslot->present) {
+        if (macslot->size != slot->size) {
+            macslot->present = 0;
+            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
+            assert_hvf_ok(ret);
+        }
+    }
+
+    if (!slot->size) {
+        return 0;
+    }
+
+    macslot->present = 1;
+    macslot->gpa_start = slot->start;
+    macslot->size = slot->size;
+    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
+    assert_hvf_ok(ret);
+    return 0;
+}
+
+void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
+{
+    hvf_slot *mem;
+    MemoryRegion *area = section->mr;
+    bool writeable = !area->readonly && !area->rom_device;
+    hv_memory_flags_t flags;
+
+    if (!memory_region_is_ram(area)) {
+        if (writeable) {
+            return;
+        } else if (!memory_region_is_romd(area)) {
+            /*
+             * If the memory device is not in romd_mode, then we actually want
+             * to remove the hvf memory slot so all accesses will trap.
+             */
+             add = false;
+        }
+    }
+
+    mem = hvf_find_overlap_slot(
+            section->offset_within_address_space,
+            int128_get64(section->size));
+
+    if (mem && add) {
+        if (mem->size == int128_get64(section->size) &&
+            mem->start == section->offset_within_address_space &&
+            mem->mem == (memory_region_get_ram_ptr(area) +
+            section->offset_within_region)) {
+            return; /* Same region was attempted to register, go away. */
+        }
+    }
+
+    /* Region needs to be reset. set the size to 0 and remap it. */
+    if (mem) {
+        mem->size = 0;
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
+        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
+    } else {
+        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
+    }
+
+    /* Now make a new slot. */
+    int x;
+
+    for (x = 0; x < hvf_state->num_slots; ++x) {
+        mem = &hvf_state->slots[x];
+        if (!mem->size) {
+            break;
+        }
+    }
+
+    if (x == hvf_state->num_slots) {
+        error_report("No free slots");
+        abort();
+    }
+
+    mem->size = int128_get64(section->size);
+    mem->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
+    mem->start = section->offset_within_address_space;
+    mem->region = area;
+
+    if (do_hvf_set_memory(mem, flags)) {
+        error_report("Error registering new memory slot");
+        abort();
+    }
+}
+
+static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
+{
+    if (!cpu->vcpu_dirty) {
+        hvf_get_registers(cpu);
+        cpu->vcpu_dirty = true;
+    }
+}
+
+void hvf_cpu_synchronize_state(CPUState *cpu)
+{
+    if (!cpu->vcpu_dirty) {
+        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
+    }
+}
+
+static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
+                                              run_on_cpu_data arg)
+{
+    hvf_put_registers(cpu);
+    cpu->vcpu_dirty = false;
+}
+
+void hvf_cpu_synchronize_post_reset(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
+}
+
+static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
+                                             run_on_cpu_data arg)
+{
+    hvf_put_registers(cpu);
+    cpu->vcpu_dirty = false;
+}
+
+void hvf_cpu_synchronize_post_init(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
+}
+
+static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
+                                              run_on_cpu_data arg)
+{
+    cpu->vcpu_dirty = true;
+}
+
+void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
+}
+
+static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
+{
+    hvf_slot *slot;
+
+    slot = hvf_find_overlap_slot(
+            section->offset_within_address_space,
+            int128_get64(section->size));
+
+    /* protect region against writes; begin tracking it */
+    if (on) {
+        slot->flags |= HVF_SLOT_LOG;
+        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+                      HV_MEMORY_READ);
+    /* stop tracking region*/
+    } else {
+        slot->flags &= ~HVF_SLOT_LOG;
+        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
+                      HV_MEMORY_READ | HV_MEMORY_WRITE);
+    }
+}
+
+static void hvf_log_start(MemoryListener *listener,
+                          MemoryRegionSection *section, int old, int new)
+{
+    if (old != 0) {
+        return;
+    }
+
+    hvf_set_dirty_tracking(section, 1);
+}
+
+static void hvf_log_stop(MemoryListener *listener,
+                         MemoryRegionSection *section, int old, int new)
+{
+    if (new != 0) {
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
+static MemoryListener hvf_memory_listener = {
+    .priority = 10,
+    .region_add = hvf_region_add,
+    .region_del = hvf_region_del,
+    .log_start = hvf_log_start,
+    .log_stop = hvf_log_stop,
+    .log_sync = hvf_log_sync,
+};
+
+static void dummy_signal(int sig)
+{
+}
+
+bool hvf_allowed;
+
+static int hvf_accel_init(MachineState *ms)
+{
+    int x;
+    hv_return_t ret;
+    HVFState *s;
+
+    ret = hv_vm_create(HV_VM_DEFAULT);
+    assert_hvf_ok(ret);
+
+    s = g_new0(HVFState, 1);
+
+    s->num_slots = 32;
+    for (x = 0; x < s->num_slots; ++x) {
+        s->slots[x].size = 0;
+        s->slots[x].slot_id = x;
+    }
+
+    hvf_state = s;
+    memory_listener_register(&hvf_memory_listener, &address_space_memory);
+    return 0;
+}
+
+static void hvf_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelClass *ac = ACCEL_CLASS(oc);
+    ac->name = "HVF";
+    ac->init_machine = hvf_accel_init;
+    ac->allowed = &hvf_allowed;
+}
+
+static const TypeInfo hvf_accel_type = {
+    .name = TYPE_HVF_ACCEL,
+    .parent = TYPE_ACCEL,
+    .class_init = hvf_accel_class_init,
+};
+
+static void hvf_type_init(void)
+{
+    type_register_static(&hvf_accel_type);
+}
+
+type_init(hvf_type_init);
+
 /*
  * The HVF-specific vCPU thread function. This one should only run when the host
  * CPU supports the VMX "unrestricted guest" feature.
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 3deb4cfacc..4c657b054c 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -13,6 +13,10 @@
 
 #include <Hypervisor/hv.h>
 
+void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
+hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
+int hvf_put_registers(CPUState *);
+int hvf_get_registers(CPUState *);
 
 #endif
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 59cfca8875..94e5c788c4 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -51,9 +51,7 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
-void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
-hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 
 #ifdef NEED_CPU_H
 /* Functions exported to host specific mode */
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 32f42f1592..100ede2a4d 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -75,137 +75,6 @@
 
 #include "hvf-accel-ops.h"
 
-HVFState *hvf_state;
-
-/* Memory slots */
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
-{
-    hvf_slot *slot;
-    int x;
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        slot = &hvf_state->slots[x];
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
-    macslot = &mac_slots[slot->slot_id];
-
-    if (macslot->present) {
-        if (macslot->size != slot->size) {
-            macslot->present = 0;
-            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
-            assert_hvf_ok(ret);
-        }
-    }
-
-    if (!slot->size) {
-        return 0;
-    }
-
-    macslot->present = 1;
-    macslot->gpa_start = slot->start;
-    macslot->size = slot->size;
-    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
-    assert_hvf_ok(ret);
-    return 0;
-}
-
-void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
-{
-    hvf_slot *mem;
-    MemoryRegion *area = section->mr;
-    bool writeable = !area->readonly && !area->rom_device;
-    hv_memory_flags_t flags;
-
-    if (!memory_region_is_ram(area)) {
-        if (writeable) {
-            return;
-        } else if (!memory_region_is_romd(area)) {
-            /*
-             * If the memory device is not in romd_mode, then we actually want
-             * to remove the hvf memory slot so all accesses will trap.
-             */
-             add = false;
-        }
-    }
-
-    mem = hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    if (mem && add) {
-        if (mem->size == int128_get64(section->size) &&
-            mem->start == section->offset_within_address_space &&
-            mem->mem == (memory_region_get_ram_ptr(area) +
-            section->offset_within_region)) {
-            return; /* Same region was attempted to register, go away. */
-        }
-    }
-
-    /* Region needs to be reset. set the size to 0 and remap it. */
-    if (mem) {
-        mem->size = 0;
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
-        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
-    } else {
-        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
-    }
-
-    /* Now make a new slot. */
-    int x;
-
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        mem = &hvf_state->slots[x];
-        if (!mem->size) {
-            break;
-        }
-    }
-
-    if (x == hvf_state->num_slots) {
-        error_report("No free slots");
-        abort();
-    }
-
-    mem->size = int128_get64(section->size);
-    mem->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
-    mem->start = section->offset_within_address_space;
-    mem->region = area;
-
-    if (do_hvf_set_memory(mem, flags)) {
-        error_report("Error registering new memory slot");
-        abort();
-    }
-}
-
 void vmx_update_tpr(CPUState *cpu)
 {
     /* TODO: need integrate APIC handling */
@@ -245,56 +114,6 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
     }
 }
 
-static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
-{
-    if (!cpu->vcpu_dirty) {
-        hvf_get_registers(cpu);
-        cpu->vcpu_dirty = true;
-    }
-}
-
-void hvf_cpu_synchronize_state(CPUState *cpu)
-{
-    if (!cpu->vcpu_dirty) {
-        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
-    }
-}
-
-static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
-}
-
-void hvf_cpu_synchronize_post_reset(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
-                                             run_on_cpu_data arg)
-{
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
-}
-
-void hvf_cpu_synchronize_post_init(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    cpu->vcpu_dirty = true;
-}
-
-void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
-}
-
 static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
 {
     int read, write;
@@ -339,78 +158,6 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
     return false;
 }
 
-static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
-{
-    hvf_slot *slot;
-
-    slot = hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    /* protect region against writes; begin tracking it */
-    if (on) {
-        slot->flags |= HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ);
-    /* stop tracking region*/
-    } else {
-        slot->flags &= ~HVF_SLOT_LOG;
-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE);
-    }
-}
-
-static void hvf_log_start(MemoryListener *listener,
-                          MemoryRegionSection *section, int old, int new)
-{
-    if (old != 0) {
-        return;
-    }
-
-    hvf_set_dirty_tracking(section, 1);
-}
-
-static void hvf_log_stop(MemoryListener *listener,
-                         MemoryRegionSection *section, int old, int new)
-{
-    if (new != 0) {
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
-static MemoryListener hvf_memory_listener = {
-    .priority = 10,
-    .region_add = hvf_region_add,
-    .region_del = hvf_region_del,
-    .log_start = hvf_log_start,
-    .log_stop = hvf_log_stop,
-    .log_sync = hvf_log_sync,
-};
-
 void hvf_vcpu_destroy(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -421,10 +168,6 @@ void hvf_vcpu_destroy(CPUState *cpu)
     assert_hvf_ok(ret);
 }
 
-static void dummy_signal(int sig)
-{
-}
-
 static void init_tsc_freq(CPUX86State *env)
 {
     size_t length;
@@ -931,48 +674,3 @@ int hvf_vcpu_exec(CPUState *cpu)
 
     return ret;
 }
-
-bool hvf_allowed;
-
-static int hvf_accel_init(MachineState *ms)
-{
-    int x;
-    hv_return_t ret;
-    HVFState *s;
-
-    ret = hv_vm_create(HV_VM_DEFAULT);
-    assert_hvf_ok(ret);
-
-    s = g_new0(HVFState, 1);
- 
-    s->num_slots = 32;
-    for (x = 0; x < s->num_slots; ++x) {
-        s->slots[x].size = 0;
-        s->slots[x].slot_id = x;
-    }
-  
-    hvf_state = s;
-    memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    return 0;
-}
-
-static void hvf_accel_class_init(ObjectClass *oc, void *data)
-{
-    AccelClass *ac = ACCEL_CLASS(oc);
-    ac->name = "HVF";
-    ac->init_machine = hvf_accel_init;
-    ac->allowed = &hvf_allowed;
-}
-
-static const TypeInfo hvf_accel_type = {
-    .name = TYPE_HVF_ACCEL,
-    .parent = TYPE_ACCEL,
-    .class_init = hvf_accel_class_init,
-};
-
-static void hvf_type_init(void)
-{
-    type_register_static(&hvf_accel_type);
-}
-
-type_init(hvf_type_init);
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 635ab0f34e..99ed8d608d 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -21,8 +21,6 @@
 #include "x86_descr.h"
 
 int hvf_process_events(CPUState *);
-int hvf_put_registers(CPUState *);
-int hvf_get_registers(CPUState *);
 bool hvf_inject_interrupts(CPUState *);
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
-- 
2.30.1 (Apple Git-130)


