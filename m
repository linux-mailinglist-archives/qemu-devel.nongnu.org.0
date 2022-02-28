Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E174C6F38
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:20:58 +0100 (CET)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgtU-0005Rb-VB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn8-0001ZY-8r; Mon, 28 Feb 2022 01:45:54 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn5-0003JL-9c; Mon, 28 Feb 2022 01:45:53 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5478211EF52;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:28:00 +0800
Subject: [PATCH qemu 5/7] hvf: fix memory dirty-tracking
Message-ID: <164603074537.20094.1732342403585879912-5@git.sr.ht>
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

Dirty-tracking in HVF is not properly implemented.

On Intel Macs, Ubuntu ISO boot menu does not show properly.

On Apple Silicon, using bochs-display may cause the guest crashes because
the guest may uses load/store instructions on framebuffer which causes
vmexits and the exception register does not contain enough information
(ESR_EL2.ISV =3D 0) for QEMU to emulate the memory operation.

The strategy to log the dirty pages is to write-protect the memory regions
that are being dirty-tracked.

When the guest is trapped to the host because of memory write, check whether
the address being written is being dirty-tracked.

If it is being dirty-tracked, restore the write permission of the page and
mark the accessed page dirty, and resume the guest without increasing
program counter, and then the same instruction will be execute again.

This patch fixes the problem and make the dirty-tracking work properly.

Buglink: https://bugs.launchpad.net/qemu/+bug/1827005
Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 62 ++++++++++++++++++++++++++++++++++++----
 include/sysemu/hvf_int.h | 14 +--------
 target/arm/hvf/hvf.c     |  5 ++++
 target/i386/hvf/hvf.c    | 25 ++++------------
 4 files changed, 68 insertions(+), 38 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 36ae1abc06..b8d8bf6799 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -30,9 +30,21 @@
=20
 #define HVF_NUM_SLOTS 32
=20
+/* HVFSlot flags */
+#define HVF_SLOT_LOG (1 << 0)
+#define HVF_SLOT_READONLY (1 << 1)
+
+typedef struct HVFSlot {
+    hwaddr start;
+    hwaddr size;  /* 0 if the slot is free */
+    hwaddr offset;  /* offset within memory region */
+    uint32_t flags;
+    MemoryRegion *region;
+} HVFSlot;
+
 static HVFSlot memslots[HVF_NUM_SLOTS];
=20
-HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
+static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
     HVFSlot *slot;
     int x;
@@ -194,7 +206,7 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *s=
ection, bool on)
 static void hvf_log_start(MemoryListener *listener,
                           MemoryRegionSection *section, int old, int new)
 {
-    if (old !=3D 0) {
+    if (old =3D=3D new) {
         return;
     }
=20
@@ -211,12 +223,12 @@ static void hvf_log_stop(MemoryListener *listener,
     hvf_set_dirty_tracking(section, 0);
 }
=20
-static void hvf_log_sync(MemoryListener *listener,
+static void hvf_log_clear(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
     /*
-     * sync of dirty pages is handled elsewhere; just make sure we keep
-     * tracking the region.
+     * The dirty bits are being cleared.
+     * Make the section write-protected again.
      */
     hvf_set_dirty_tracking(section, 1);
 }
@@ -240,9 +252,47 @@ static MemoryListener hvf_memory_listener =3D {
     .region_del =3D hvf_region_del,
     .log_start =3D hvf_log_start,
     .log_stop =3D hvf_log_stop,
-    .log_sync =3D hvf_log_sync,
+    .log_clear =3D hvf_log_clear,
 };
=20
+
+/*
+ * The function is called when the guest is accessing memory causing vmexit.
+ * Check whether the guest can access the memory directly and
+ * also mark the accessed page being written dirty
+ * if the page is being dirty-tracked.
+ *
+ * Return true if the access is within the mapped region,
+ * otherwise return false.
+ */
+bool hvf_access_memory(hwaddr address, bool write)
+{
+    HVFSlot *slot;
+    hv_return_t ret;
+    hwaddr start, size;
+
+    slot =3D hvf_find_overlap_slot(address, 1);
+
+    if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
+        /* MMIO or unmapped area, return false */
+        return false;
+    }
+
+    if (write && (slot->flags & HVF_SLOT_LOG)) {
+        /* The slot is being dirty-tracked. Mark the accessed page dirty. */
+        start =3D address & qemu_real_host_page_mask;
+        size =3D qemu_real_host_page_size;
+
+        memory_region_set_dirty(slot->region,
+                                start - slot->start + slot->offset, size);
+        ret =3D hv_vm_protect(start, size,
+                    HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+        assert_hvf_ok(ret);
+    }
+
+    return true;
+}
+
 void hvf_init_memslots(void)
 {
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 0aafbc9357..16e5faf0ff 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -17,18 +17,6 @@
 #include <Hypervisor/hv.h>
 #endif
=20
-/* HVFSlot flags */
-#define HVF_SLOT_LOG (1 << 0)
-#define HVF_SLOT_READONLY (1 << 1)
-
-typedef struct HVFSlot {
-    hwaddr start;
-    hwaddr size;  /* 0 if the slot is free */
-    hwaddr offset;  /* offset within memory region */
-    uint32_t flags;
-    MemoryRegion *region;
-} HVFSlot;
-
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
     uint64_t vmx_cap_procbased;
@@ -58,11 +46,11 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-HVFSlot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
=20
+bool hvf_access_memory(hwaddr address, bool write);
 void hvf_init_memslots(void);
=20
 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0dc96560d3..e40efbc33e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1163,6 +1163,11 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
=20
+        if (iswrite &&
+            hvf_access_memory(hvf_exit->exception.physical_address, 1)) {
+            break;
+        }
+
         assert(isv);
=20
         if (iswrite) {
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2ddb4fc825..c4c544dc54 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -113,7 +113,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void=
 *buffer,
     }
 }
=20
-static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qu=
al)
+static bool ept_emulation_fault(uint64_t gpa, uint64_t ept_qual)
 {
     int read, write;
=20
@@ -129,14 +129,6 @@ static bool ept_emulation_fault(HVFSlot *slot, uint64_t =
gpa, uint64_t ept_qual)
         return false;
     }
=20
-    if (write && slot) {
-        if (slot->flags & HVF_SLOT_LOG) {
-            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
-                          HV_MEMORY_READ | HV_MEMORY_WRITE);
-        }
-    }
-
     /*
      * The EPT violation must have been caused by accessing a
      * guest-physical address that is a translation of a guest-linear
@@ -147,14 +139,11 @@ static bool ept_emulation_fault(HVFSlot *slot, uint64_t=
 gpa, uint64_t ept_qual)
         return false;
     }
=20
-    if (!slot) {
-        return true;
-    }
-    if (!memory_region_is_ram(slot->region) &&
-        !(read && memory_region_is_romd(slot->region))) {
-        return true;
+    if (hvf_access_memory(gpa, write)) {
+        return false;
     }
-    return false;
+
+    return true;
 }
=20
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -469,7 +458,6 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
-            HVFSlot *slot;
             uint64_t gpa =3D rvmcs(cpu->hvf->fd, VMCS_GUEST_PHYSICAL_ADDRESS=
);
=20
             if (((idtvec_info & VMCS_IDT_VEC_VALID) =3D=3D 0) &&
@@ -477,9 +465,8 @@ int hvf_vcpu_exec(CPUState *cpu)
                 vmx_set_nmi_blocking(cpu);
             }
=20
-            slot =3D hvf_find_overlap_slot(gpa, 1);
             /* mmio */
-            if (ept_emulation_fault(slot, gpa, exit_qual)) {
+            if (ept_emulation_fault(gpa, exit_qual)) {
                 struct x86_decode decode;
=20
                 load_regs(cpu);
--=20
2.34.1


