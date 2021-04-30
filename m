Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB13700B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:45:57 +0200 (CEST)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcY9E-0000D4-Po
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4m-0006Ih-ID; Fri, 30 Apr 2021 14:41:20 -0400
Received: from [201.28.113.2] (port=4684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4j-0002GC-L5; Fri, 30 Apr 2021 14:41:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 15:41:09 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D3B818013C2;
 Fri, 30 Apr 2021 15:41:09 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 2/2] hw/ppc: Moved TCG code to spapr_hcall_tcg
Date: Fri, 30 Apr 2021 15:40:47 -0300
Message-Id: <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 30 Apr 2021 18:41:10.0006 (UTC)
 FILETIME=[636A1160:01D73DF0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 farosas@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved h_enter, remove_hpte, h_remove, h_bulk_remove,h_protect and
h_read to spapr_hcall_tcg.c, added h_tcg_only to be used in a !TCG
environment in spapr_hcall.c and changed build options to only build
spapr_hcall_tcg.c when CONFIG_TCG is enabled.

Added the function h_tcg_only to be used for hypercalls that should be
called only in TCG environment but have been called in a TCG-less one.

Right now, a #ifndef is used to know if there is a need of a h_tcg_only
function to be implemented and used as hypercalls, I initially thought
of always having that option turned on and having spapr_hcall_tcg.c
overwrite those hypercalls when TCG is enabled, but
spapr_register_hypercalls checks if a hypercall already exists for that
opcode so that wouldn't work, so if anyone has any suggestions I'm
interested.

Also spapr_hcall_tcg.c only has 2 duplicated functions (valid_ptex and
is_ram_address), what is the advised way to deal with these
duplications?

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 hw/ppc/meson.build       |   3 +
 hw/ppc/spapr_hcall.c     | 300 ++--------------------------------
 hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+), 283 deletions(-)
 create mode 100644 hw/ppc/spapr_hcall_tcg.c

diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 218631c883..3c7f2f08b7 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -29,6 +29,9 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_numa.c',
   'pef.c',
 ))
+ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_TCG'], if_true: files(
+  'spapr_hcall_tcg.c'
+))
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
   'spapr_pci_vfio.c',
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 4b0ba69841..b37fbdc32e 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -22,6 +22,15 @@
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
 
+#ifndef CONFIG_TCG
+static target_ulong h_tcg_only(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                            target_ulong opcode, target_ulong *args)
+{
+    g_assert_not_reached();
+    return 0;
+}
+#endif /* !CONFIG_TCG */
+
 static bool has_spr(PowerPCCPU *cpu, int spr)
 {
     /* We can test whether the SPR is defined by checking for a valid name */
@@ -55,284 +64,6 @@ static bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
     return false;
 }
 
-static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                            target_ulong opcode, target_ulong *args)
-{
-    target_ulong flags = args[0];
-    target_ulong ptex = args[1];
-    target_ulong pteh = args[2];
-    target_ulong ptel = args[3];
-    unsigned apshift;
-    target_ulong raddr;
-    target_ulong slot;
-    const ppc_hash_pte64_t *hptes;
-
-    apshift = ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
-    if (!apshift) {
-        /* Bad page size encoding */
-        return H_PARAMETER;
-    }
-
-    raddr = (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
-
-    if (is_ram_address(spapr, raddr)) {
-        /* Regular RAM - should have WIMG=0010 */
-        if ((ptel & HPTE64_R_WIMG) != HPTE64_R_M) {
-            return H_PARAMETER;
-        }
-    } else {
-        target_ulong wimg_flags;
-        /* Looks like an IO address */
-        /* FIXME: What WIMG combinations could be sensible for IO?
-         * For now we allow WIMG=010x, but are there others? */
-        /* FIXME: Should we check against registered IO addresses? */
-        wimg_flags = (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
-
-        if (wimg_flags != HPTE64_R_I &&
-            wimg_flags != (HPTE64_R_I | HPTE64_R_M)) {
-            return H_PARAMETER;
-        }
-    }
-
-    pteh &= ~0x60ULL;
-
-    if (!valid_ptex(cpu, ptex)) {
-        return H_PARAMETER;
-    }
-
-    slot = ptex & 7ULL;
-    ptex = ptex & ~7ULL;
-
-    if (likely((flags & H_EXACT) == 0)) {
-        hptes = ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
-        for (slot = 0; slot < 8; slot++) {
-            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
-                break;
-            }
-        }
-        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
-        if (slot == 8) {
-            return H_PTEG_FULL;
-        }
-    } else {
-        hptes = ppc_hash64_map_hptes(cpu, ptex + slot, 1);
-        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
-            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
-            return H_PTEG_FULL;
-        }
-        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
-    }
-
-    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
-
-    args[0] = ptex + slot;
-    return H_SUCCESS;
-}
-
-typedef enum {
-    REMOVE_SUCCESS = 0,
-    REMOVE_NOT_FOUND = 1,
-    REMOVE_PARM = 2,
-    REMOVE_HW = 3,
-} RemoveResult;
-
-static RemoveResult remove_hpte(PowerPCCPU *cpu
-                                , target_ulong ptex,
-                                target_ulong avpn,
-                                target_ulong flags,
-                                target_ulong *vp, target_ulong *rp)
-{
-    const ppc_hash_pte64_t *hptes;
-    target_ulong v, r;
-
-    if (!valid_ptex(cpu, ptex)) {
-        return REMOVE_PARM;
-    }
-
-    hptes = ppc_hash64_map_hptes(cpu, ptex, 1);
-    v = ppc_hash64_hpte0(cpu, hptes, 0);
-    r = ppc_hash64_hpte1(cpu, hptes, 0);
-    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
-
-    if ((v & HPTE64_V_VALID) == 0 ||
-        ((flags & H_AVPN) && (v & ~0x7fULL) != avpn) ||
-        ((flags & H_ANDCOND) && (v & avpn) != 0)) {
-        return REMOVE_NOT_FOUND;
-    }
-    *vp = v;
-    *rp = r;
-    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
-    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
-    return REMOVE_SUCCESS;
-}
-
-static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                             target_ulong opcode, target_ulong *args)
-{
-    CPUPPCState *env = &cpu->env;
-    target_ulong flags = args[0];
-    target_ulong ptex = args[1];
-    target_ulong avpn = args[2];
-    RemoveResult ret;
-
-    ret = remove_hpte(cpu, ptex, avpn, flags,
-                      &args[0], &args[1]);
-
-    switch (ret) {
-    case REMOVE_SUCCESS:
-        check_tlb_flush(env, true);
-        return H_SUCCESS;
-
-    case REMOVE_NOT_FOUND:
-        return H_NOT_FOUND;
-
-    case REMOVE_PARM:
-        return H_PARAMETER;
-
-    case REMOVE_HW:
-        return H_HARDWARE;
-    }
-
-    g_assert_not_reached();
-}
-
-#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
-#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
-#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
-#define   H_BULK_REMOVE_END            0xc000000000000000ULL
-#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
-#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
-#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
-#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
-#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
-#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
-#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
-#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
-#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
-#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
-#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
-
-#define H_BULK_REMOVE_MAX_BATCH        4
-
-static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                                  target_ulong opcode, target_ulong *args)
-{
-    CPUPPCState *env = &cpu->env;
-    int i;
-    target_ulong rc = H_SUCCESS;
-
-    for (i = 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
-        target_ulong *tsh = &args[i*2];
-        target_ulong tsl = args[i*2 + 1];
-        target_ulong v, r, ret;
-
-        if ((*tsh & H_BULK_REMOVE_TYPE) == H_BULK_REMOVE_END) {
-            break;
-        } else if ((*tsh & H_BULK_REMOVE_TYPE) != H_BULK_REMOVE_REQUEST) {
-            return H_PARAMETER;
-        }
-
-        *tsh &= H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
-        *tsh |= H_BULK_REMOVE_RESPONSE;
-
-        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN)) {
-            *tsh |= H_BULK_REMOVE_PARM;
-            return H_PARAMETER;
-        }
-
-        ret = remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
-                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
-                          &v, &r);
-
-        *tsh |= ret << 60;
-
-        switch (ret) {
-        case REMOVE_SUCCESS:
-            *tsh |= (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
-            break;
-
-        case REMOVE_PARM:
-            rc = H_PARAMETER;
-            goto exit;
-
-        case REMOVE_HW:
-            rc = H_HARDWARE;
-            goto exit;
-        }
-    }
- exit:
-    check_tlb_flush(env, true);
-
-    return rc;
-}
-
-static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                              target_ulong opcode, target_ulong *args)
-{
-    CPUPPCState *env = &cpu->env;
-    target_ulong flags = args[0];
-    target_ulong ptex = args[1];
-    target_ulong avpn = args[2];
-    const ppc_hash_pte64_t *hptes;
-    target_ulong v, r;
-
-    if (!valid_ptex(cpu, ptex)) {
-        return H_PARAMETER;
-    }
-
-    hptes = ppc_hash64_map_hptes(cpu, ptex, 1);
-    v = ppc_hash64_hpte0(cpu, hptes, 0);
-    r = ppc_hash64_hpte1(cpu, hptes, 0);
-    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
-
-    if ((v & HPTE64_V_VALID) == 0 ||
-        ((flags & H_AVPN) && (v & ~0x7fULL) != avpn)) {
-        return H_NOT_FOUND;
-    }
-
-    r &= ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
-           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
-    r |= (flags << 55) & HPTE64_R_PP0;
-    r |= (flags << 48) & HPTE64_R_KEY_HI;
-    r |= flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
-    spapr_store_hpte(cpu, ptex,
-                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
-    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
-    /* Flush the tlb */
-    check_tlb_flush(env, true);
-    /* Don't need a memory barrier, due to qemu's global lock */
-    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
-    return H_SUCCESS;
-}
-
-static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                           target_ulong opcode, target_ulong *args)
-{
-    target_ulong flags = args[0];
-    target_ulong ptex = args[1];
-    int i, ridx, n_entries = 1;
-    const ppc_hash_pte64_t *hptes;
-
-    if (!valid_ptex(cpu, ptex)) {
-        return H_PARAMETER;
-    }
-
-    if (flags & H_READ_4) {
-        /* Clear the two low order bits */
-        ptex &= ~(3ULL);
-        n_entries = 4;
-    }
-
-    hptes = ppc_hash64_map_hptes(cpu, ptex, n_entries);
-    for (i = 0, ridx = 0; i < n_entries; i++) {
-        args[ridx++] = ppc_hash64_hpte0(cpu, hptes, i);
-        args[ridx++] = ppc_hash64_hpte1(cpu, hptes, i);
-    }
-    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
-
-    return H_SUCCESS;
-}
-
 struct SpaprPendingHpt {
     /* These fields are read-only after initialization */
     int shift;
@@ -2021,14 +1752,17 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
 
 static void hypercall_register_types(void)
 {
+
+#ifndef CONFIG_TCG
     /* hcall-pft */
-    spapr_register_hypercall(H_ENTER, h_enter);
-    spapr_register_hypercall(H_REMOVE, h_remove);
-    spapr_register_hypercall(H_PROTECT, h_protect);
-    spapr_register_hypercall(H_READ, h_read);
+    spapr_register_hypercall(H_ENTER, h_tcg_only);
+    spapr_register_hypercall(H_REMOVE, h_tcg_only);
+    spapr_register_hypercall(H_PROTECT, h_tcg_only);
+    spapr_register_hypercall(H_READ, h_tcg_only);
 
     /* hcall-bulk */
-    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
+    spapr_register_hypercall(H_BULK_REMOVE, h_tcg_only);
+#endif /* !CONFIG_TCG */
 
     /* hcall-hpt-resize */
     spapr_register_hypercall(H_RESIZE_HPT_PREPARE, h_resize_hpt_prepare);
diff --git a/hw/ppc/spapr_hcall_tcg.c b/hw/ppc/spapr_hcall_tcg.c
new file mode 100644
index 0000000000..92ff24c8dc
--- /dev/null
+++ b/hw/ppc/spapr_hcall_tcg.c
@@ -0,0 +1,343 @@
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "sysemu/hw_accel.h"
+#include "sysemu/runstate.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "helper_regs.h"
+#include "hw/ppc/spapr.h"
+#include "hw/ppc/spapr_cpu_core.h"
+#include "mmu-hash64.h"
+#include "mmu-misc.h"
+#include "cpu-models.h"
+#include "trace.h"
+#include "kvm_ppc.h"
+#include "hw/ppc/fdt.h"
+#include "hw/ppc/spapr_ovec.h"
+#include "mmu-book3s-v3.h"
+#include "hw/mem/memory-device.h"
+
+static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
+{
+    /*
+     * hash value/pteg group index is normalized by HPT mask
+     */
+    if (((ptex & ~7ULL) / HPTES_PER_GROUP) & ~ppc_hash64_hpt_mask(cpu)) {
+        return false;
+    }
+    return true;
+}
+
+static bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
+{
+    MachineState *machine = MACHINE(spapr);
+    DeviceMemoryState *dms = machine->device_memory;
+
+    if (addr < machine->ram_size) {
+        return true;
+    }
+    if ((addr >= dms->base)
+        && ((addr - dms->base) < memory_region_size(&dms->mr))) {
+        return true;
+    }
+
+    return false;
+}
+
+static target_ulong h_enter(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                            target_ulong opcode, target_ulong *args)
+{
+    target_ulong flags = args[0];
+    target_ulong ptex = args[1];
+    target_ulong pteh = args[2];
+    target_ulong ptel = args[3];
+    unsigned apshift;
+    target_ulong raddr;
+    target_ulong slot;
+    const ppc_hash_pte64_t *hptes;
+
+    apshift = ppc_hash64_hpte_page_shift_noslb(cpu, pteh, ptel);
+    if (!apshift) {
+        /* Bad page size encoding */
+        return H_PARAMETER;
+    }
+
+    raddr = (ptel & HPTE64_R_RPN) & ~((1ULL << apshift) - 1);
+
+    if (is_ram_address(spapr, raddr)) {
+        /* Regular RAM - should have WIMG=0010 */
+        if ((ptel & HPTE64_R_WIMG) != HPTE64_R_M) {
+            return H_PARAMETER;
+        }
+    } else {
+        target_ulong wimg_flags;
+        /* Looks like an IO address */
+        /* FIXME: What WIMG combinations could be sensible for IO?
+         * For now we allow WIMG=010x, but are there others? */
+        /* FIXME: Should we check against registered IO addresses? */
+        wimg_flags = (ptel & (HPTE64_R_W | HPTE64_R_I | HPTE64_R_M));
+
+        if (wimg_flags != HPTE64_R_I &&
+            wimg_flags != (HPTE64_R_I | HPTE64_R_M)) {
+            return H_PARAMETER;
+        }
+    }
+
+    pteh &= ~0x60ULL;
+
+    if (!valid_ptex(cpu, ptex)) {
+        return H_PARAMETER;
+    }
+
+    slot = ptex & 7ULL;
+    ptex = ptex & ~7ULL;
+
+    if (likely((flags & H_EXACT) == 0)) {
+        hptes = ppc_hash64_map_hptes(cpu, ptex, HPTES_PER_GROUP);
+        for (slot = 0; slot < 8; slot++) {
+            if (!(ppc_hash64_hpte0(cpu, hptes, slot) & HPTE64_V_VALID)) {
+                break;
+            }
+        }
+        ppc_hash64_unmap_hptes(cpu, hptes, ptex, HPTES_PER_GROUP);
+        if (slot == 8) {
+            return H_PTEG_FULL;
+        }
+    } else {
+        hptes = ppc_hash64_map_hptes(cpu, ptex + slot, 1);
+        if (ppc_hash64_hpte0(cpu, hptes, 0) & HPTE64_V_VALID) {
+            ppc_hash64_unmap_hptes(cpu, hptes, ptex + slot, 1);
+            return H_PTEG_FULL;
+        }
+        ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
+    }
+
+    spapr_store_hpte(cpu, ptex + slot, pteh | HPTE64_V_HPTE_DIRTY, ptel);
+
+    args[0] = ptex + slot;
+    return H_SUCCESS;
+}
+
+typedef enum {
+    REMOVE_SUCCESS = 0,
+    REMOVE_NOT_FOUND = 1,
+    REMOVE_PARM = 2,
+    REMOVE_HW = 3,
+} RemoveResult;
+
+static RemoveResult remove_hpte(PowerPCCPU *cpu
+                                , target_ulong ptex,
+                                target_ulong avpn,
+                                target_ulong flags,
+                                target_ulong *vp, target_ulong *rp)
+{
+    const ppc_hash_pte64_t *hptes;
+    target_ulong v, r;
+
+    if (!valid_ptex(cpu, ptex)) {
+        return REMOVE_PARM;
+    }
+
+    hptes = ppc_hash64_map_hptes(cpu, ptex, 1);
+    v = ppc_hash64_hpte0(cpu, hptes, 0);
+    r = ppc_hash64_hpte1(cpu, hptes, 0);
+    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
+
+    if ((v & HPTE64_V_VALID) == 0 ||
+        ((flags & H_AVPN) && (v & ~0x7fULL) != avpn) ||
+        ((flags & H_ANDCOND) && (v & avpn) != 0)) {
+        return REMOVE_NOT_FOUND;
+    }
+    *vp = v;
+    *rp = r;
+    spapr_store_hpte(cpu, ptex, HPTE64_V_HPTE_DIRTY, 0);
+    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
+    return REMOVE_SUCCESS;
+}
+
+static target_ulong h_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                             target_ulong opcode, target_ulong *args)
+{
+    CPUPPCState *env = &cpu->env;
+    target_ulong flags = args[0];
+    target_ulong ptex = args[1];
+    target_ulong avpn = args[2];
+    RemoveResult ret;
+
+    ret = remove_hpte(cpu, ptex, avpn, flags,
+                      &args[0], &args[1]);
+
+    switch (ret) {
+    case REMOVE_SUCCESS:
+        check_tlb_flush(env, true);
+        return H_SUCCESS;
+
+    case REMOVE_NOT_FOUND:
+        return H_NOT_FOUND;
+
+    case REMOVE_PARM:
+        return H_PARAMETER;
+
+    case REMOVE_HW:
+        return H_HARDWARE;
+    }
+
+    g_assert_not_reached();
+}
+
+#define H_BULK_REMOVE_TYPE             0xc000000000000000ULL
+#define   H_BULK_REMOVE_REQUEST        0x4000000000000000ULL
+#define   H_BULK_REMOVE_RESPONSE       0x8000000000000000ULL
+#define   H_BULK_REMOVE_END            0xc000000000000000ULL
+#define H_BULK_REMOVE_CODE             0x3000000000000000ULL
+#define   H_BULK_REMOVE_SUCCESS        0x0000000000000000ULL
+#define   H_BULK_REMOVE_NOT_FOUND      0x1000000000000000ULL
+#define   H_BULK_REMOVE_PARM           0x2000000000000000ULL
+#define   H_BULK_REMOVE_HW             0x3000000000000000ULL
+#define H_BULK_REMOVE_RC               0x0c00000000000000ULL
+#define H_BULK_REMOVE_FLAGS            0x0300000000000000ULL
+#define   H_BULK_REMOVE_ABSOLUTE       0x0000000000000000ULL
+#define   H_BULK_REMOVE_ANDCOND        0x0100000000000000ULL
+#define   H_BULK_REMOVE_AVPN           0x0200000000000000ULL
+#define H_BULK_REMOVE_PTEX             0x00ffffffffffffffULL
+
+#define H_BULK_REMOVE_MAX_BATCH        4
+
+static target_ulong h_bulk_remove(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                  target_ulong opcode, target_ulong *args)
+{
+    CPUPPCState *env = &cpu->env;
+    int i;
+    target_ulong rc = H_SUCCESS;
+
+    for (i = 0; i < H_BULK_REMOVE_MAX_BATCH; i++) {
+        target_ulong *tsh = &args[i*2];
+        target_ulong tsl = args[i*2 + 1];
+        target_ulong v, r, ret;
+
+        if ((*tsh & H_BULK_REMOVE_TYPE) == H_BULK_REMOVE_END) {
+            break;
+        } else if ((*tsh & H_BULK_REMOVE_TYPE) != H_BULK_REMOVE_REQUEST) {
+            return H_PARAMETER;
+        }
+
+        *tsh &= H_BULK_REMOVE_PTEX | H_BULK_REMOVE_FLAGS;
+        *tsh |= H_BULK_REMOVE_RESPONSE;
+
+        if ((*tsh & H_BULK_REMOVE_ANDCOND) && (*tsh & H_BULK_REMOVE_AVPN)) {
+            *tsh |= H_BULK_REMOVE_PARM;
+            return H_PARAMETER;
+        }
+
+        ret = remove_hpte(cpu, *tsh & H_BULK_REMOVE_PTEX, tsl,
+                          (*tsh & H_BULK_REMOVE_FLAGS) >> 26,
+                          &v, &r);
+
+        *tsh |= ret << 60;
+
+        switch (ret) {
+        case REMOVE_SUCCESS:
+            *tsh |= (r & (HPTE64_R_C | HPTE64_R_R)) << 43;
+            break;
+
+        case REMOVE_PARM:
+            rc = H_PARAMETER;
+            goto exit;
+
+        case REMOVE_HW:
+            rc = H_HARDWARE;
+            goto exit;
+        }
+    }
+ exit:
+    check_tlb_flush(env, true);
+
+    return rc;
+}
+
+static target_ulong h_protect(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                              target_ulong opcode, target_ulong *args)
+{
+    CPUPPCState *env = &cpu->env;
+    target_ulong flags = args[0];
+    target_ulong ptex = args[1];
+    target_ulong avpn = args[2];
+    const ppc_hash_pte64_t *hptes;
+    target_ulong v, r;
+
+    if (!valid_ptex(cpu, ptex)) {
+        return H_PARAMETER;
+    }
+
+    hptes = ppc_hash64_map_hptes(cpu, ptex, 1);
+    v = ppc_hash64_hpte0(cpu, hptes, 0);
+    r = ppc_hash64_hpte1(cpu, hptes, 0);
+    ppc_hash64_unmap_hptes(cpu, hptes, ptex, 1);
+
+    if ((v & HPTE64_V_VALID) == 0 ||
+        ((flags & H_AVPN) && (v & ~0x7fULL) != avpn)) {
+        return H_NOT_FOUND;
+    }
+
+    r &= ~(HPTE64_R_PP0 | HPTE64_R_PP | HPTE64_R_N |
+           HPTE64_R_KEY_HI | HPTE64_R_KEY_LO);
+    r |= (flags << 55) & HPTE64_R_PP0;
+    r |= (flags << 48) & HPTE64_R_KEY_HI;
+    r |= flags & (HPTE64_R_PP | HPTE64_R_N | HPTE64_R_KEY_LO);
+    spapr_store_hpte(cpu, ptex,
+                     (v & ~HPTE64_V_VALID) | HPTE64_V_HPTE_DIRTY, 0);
+    ppc_hash64_tlb_flush_hpte(cpu, ptex, v, r);
+    /* Flush the tlb */
+    check_tlb_flush(env, true);
+    /* Don't need a memory barrier, due to qemu's global lock */
+    spapr_store_hpte(cpu, ptex, v | HPTE64_V_HPTE_DIRTY, r);
+    return H_SUCCESS;
+}
+
+static target_ulong h_read(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                           target_ulong opcode, target_ulong *args)
+{
+    target_ulong flags = args[0];
+    target_ulong ptex = args[1];
+    int i, ridx, n_entries = 1;
+    const ppc_hash_pte64_t *hptes;
+
+    if (!valid_ptex(cpu, ptex)) {
+        return H_PARAMETER;
+    }
+
+    if (flags & H_READ_4) {
+        /* Clear the two low order bits */
+        ptex &= ~(3ULL);
+        n_entries = 4;
+    }
+
+    hptes = ppc_hash64_map_hptes(cpu, ptex, n_entries);
+    for (i = 0, ridx = 0; i < n_entries; i++) {
+        args[ridx++] = ppc_hash64_hpte0(cpu, hptes, i);
+        args[ridx++] = ppc_hash64_hpte1(cpu, hptes, i);
+    }
+    ppc_hash64_unmap_hptes(cpu, hptes, ptex, n_entries);
+
+    return H_SUCCESS;
+}
+
+
+static void hypercall_register_types(void)
+{
+    /* hcall-pft */
+    spapr_register_hypercall(H_ENTER, h_enter);
+    spapr_register_hypercall(H_REMOVE, h_remove);
+    spapr_register_hypercall(H_PROTECT, h_protect);
+    spapr_register_hypercall(H_READ, h_read);
+
+    /* hcall-bulk */
+    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
+}
+
+type_init(hypercall_register_types)
-- 
2.17.1


