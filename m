Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A773700C4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:50:49 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYDw-0002l3-2j
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4i-0006D5-Hg; Fri, 30 Apr 2021 14:41:16 -0400
Received: from [201.28.113.2] (port=4684 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lcY4f-0002GC-TA; Fri, 30 Apr 2021 14:41:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 15:41:08 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D0A3A8013C2;
 Fri, 30 Apr 2021 15:41:08 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 1/2] target/ppc: Moved functions out of mmu-hash64
Date: Fri, 30 Apr 2021 15:40:46 -0300
Message-Id: <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 30 Apr 2021 18:41:09.0006 (UTC)
 FILETIME=[62D17AE0:01D73DF0]
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

The functions ppc_store_lpcr, ppc_hash64_filter_pagesizes and
ppc_hash64_unmap_hptes have been moved to mmu-misc.h since they are
not needed in a !TCG context and mmu-hash64 should not be compiled
in such situation.

ppc_store_lpcr and ppc_hash64_filter_pagesizes are used by multiple
functions, while ppc_hash64_unmap_hptes is used by rehash_hpt (in
spapr_hcall.c).

Also I've put the functions in mmu-misc as I am unsure in which file
this functions should go, so I just created a new one for now, any
suggestion which file to put them (considering it's a file that must be
compiled in a !TCG situation)?

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 hw/ppc/spapr.c          |  1 +
 hw/ppc/spapr_caps.c     |  1 +
 hw/ppc/spapr_cpu_core.c |  1 +
 hw/ppc/spapr_hcall.c    |  1 +
 hw/ppc/spapr_rtas.c     |  1 +
 target/ppc/meson.build  |  1 +
 target/ppc/mmu-hash64.c | 81 +-------------------------------------
 target/ppc/mmu-hash64.h |  6 ---
 target/ppc/mmu-misc.c   | 86 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu-misc.h   | 22 +++++++++++
 10 files changed, 115 insertions(+), 86 deletions(-)
 create mode 100644 target/ppc/mmu-misc.c
 create mode 100644 target/ppc/mmu-misc.h

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e4be00b732..61f8f150c2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -53,6 +53,7 @@
 #include "mmu-book3s-v3.h"
 #include "cpu-models.h"
 #include "hw/core/cpu.h"
+#include "mmu-misc.h"
 
 #include "hw/boards.h"
 #include "hw/ppc/ppc.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9ea7ddd1e9..22352ff018 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -34,6 +34,7 @@
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
 #include "sysemu/tcg.h"
+#include "mmu-misc.h"
 
 #include "hw/ppc/spapr.h"
 
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 4f316a6f9d..f4d93999e5 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -24,6 +24,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/error-report.h"
+#include "mmu-misc.h"
 
 static void spapr_reset_vcpu(PowerPCCPU *cpu)
 {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..4b0ba69841 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -13,6 +13,7 @@
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "mmu-hash64.h"
+#include "mmu-misc.h"
 #include "cpu-models.h"
 #include "trace.h"
 #include "kvm_ppc.h"
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c628..8935b75d1c 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -35,6 +35,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "kvm_ppc.h"
+#include "mmu-misc.h"
 
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..7a97648803 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -31,6 +31,7 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
+  'mmu-misc.c',
 ))
 
 target_arch += {'ppc': ppc_ss}
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 0fabc10302..919a3e9f51 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 #include "hw/hw.h"
 #include "mmu-book3s-v3.h"
+#include "mmu-misc.h"
 
 /* #define DEBUG_SLB */
 
@@ -499,20 +500,6 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
     return hptes;
 }
 
-void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
-                            hwaddr ptex, int n)
-{
-    if (cpu->vhyp) {
-        PPCVirtualHypervisorClass *vhc =
-            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-        vhc->unmap_hptes(cpu->vhyp, hptes, ptex, n);
-        return;
-    }
-
-    address_space_unmap(CPU(cpu)->as, (void *)hptes, n * HASH_PTE_SIZE_64,
-                        false, n * HASH_PTE_SIZE_64);
-}
-
 static unsigned hpte_page_shift(const PPCHash64SegmentPageSizes *sps,
                                 uint64_t pte0, uint64_t pte1)
 {
@@ -1119,14 +1106,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
     cpu->env.tlb_need_flush = TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_FLUSH;
 }
 
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
-}
-
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -1197,61 +1176,3 @@ const PPCHash64Options ppc_hash64_opts_POWER7 = {
     }
 };
 
-void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
-                                 bool (*cb)(void *, uint32_t, uint32_t),
-                                 void *opaque)
-{
-    PPCHash64Options *opts = cpu->hash64_opts;
-    int i;
-    int n = 0;
-    bool ci_largepage = false;
-
-    assert(opts);
-
-    n = 0;
-    for (i = 0; i < ARRAY_SIZE(opts->sps); i++) {
-        PPCHash64SegmentPageSizes *sps = &opts->sps[i];
-        int j;
-        int m = 0;
-
-        assert(n <= i);
-
-        if (!sps->page_shift) {
-            break;
-        }
-
-        for (j = 0; j < ARRAY_SIZE(sps->enc); j++) {
-            PPCHash64PageSize *ps = &sps->enc[j];
-
-            assert(m <= j);
-            if (!ps->page_shift) {
-                break;
-            }
-
-            if (cb(opaque, sps->page_shift, ps->page_shift)) {
-                if (ps->page_shift >= 16) {
-                    ci_largepage = true;
-                }
-                sps->enc[m++] = *ps;
-            }
-        }
-
-        /* Clear rest of the row */
-        for (j = m; j < ARRAY_SIZE(sps->enc); j++) {
-            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
-        }
-
-        if (m) {
-            n++;
-        }
-    }
-
-    /* Clear the rest of the table */
-    for (i = n; i < ARRAY_SIZE(opts->sps); i++) {
-        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
-    }
-
-    if (!ci_largepage) {
-        opts->flags &= ~PPC_HASH64_CI_LARGEPAGE;
-    }
-}
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 87729d48b3..562602b466 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -15,12 +15,8 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte0, target_ulong pte1);
 unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
                                           uint64_t pte0, uint64_t pte1);
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 void ppc_hash64_init(PowerPCCPU *cpu);
 void ppc_hash64_finalize(PowerPCCPU *cpu);
-void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
-                                 bool (*cb)(void *, uint32_t, uint32_t),
-                                 void *opaque);
 #endif
 
 /*
@@ -112,8 +108,6 @@ struct ppc_hash_pte64 {
 
 const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
                                              hwaddr ptex, int n);
-void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
-                            hwaddr ptex, int n);
 
 static inline uint64_t ppc_hash64_hpte0(PowerPCCPU *cpu,
                                         const ppc_hash_pte64_t *hptes, int i)
diff --git a/target/ppc/mmu-misc.c b/target/ppc/mmu-misc.c
new file mode 100644
index 0000000000..8abda66547
--- /dev/null
+++ b/target/ppc/mmu-misc.c
@@ -0,0 +1,86 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "mmu-hash64.h"
+#include "fpu/softfloat-helpers.h"
+#include "mmu-misc.h"
+
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+}
+
+void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
+                                 bool (*cb)(void *, uint32_t, uint32_t),
+                                 void *opaque)
+{
+    PPCHash64Options *opts = cpu->hash64_opts;
+    int i;
+    int n = 0;
+    bool ci_largepage = false;
+
+    assert(opts);
+
+    n = 0;
+    for (i = 0; i < ARRAY_SIZE(opts->sps); i++) {
+        PPCHash64SegmentPageSizes *sps = &opts->sps[i];
+        int j;
+        int m = 0;
+
+        assert(n <= i);
+
+        if (!sps->page_shift) {
+            break;
+        }
+
+        for (j = 0; j < ARRAY_SIZE(sps->enc); j++) {
+            PPCHash64PageSize *ps = &sps->enc[j];
+
+            assert(m <= j);
+            if (!ps->page_shift) {
+                break;
+            }
+
+            if (cb(opaque, sps->page_shift, ps->page_shift)) {
+                if (ps->page_shift >= 16) {
+                    ci_largepage = true;
+                }
+                sps->enc[m++] = *ps;
+            }
+        }
+
+        /* Clear rest of the row */
+        for (j = m; j < ARRAY_SIZE(sps->enc); j++) {
+            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
+        }
+
+        if (m) {
+            n++;
+        }
+    }
+
+    /* Clear the rest of the table */
+    for (i = n; i < ARRAY_SIZE(opts->sps); i++) {
+        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
+    }
+
+    if (!ci_largepage) {
+        opts->flags &= ~PPC_HASH64_CI_LARGEPAGE;
+    }
+}
+
+void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
+                            hwaddr ptex, int n)
+{
+    if (cpu->vhyp) {
+        PPCVirtualHypervisorClass *vhc =
+            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
+        vhc->unmap_hptes(cpu->vhyp, hptes, ptex, n);
+        return;
+    }
+
+    address_space_unmap(CPU(cpu)->as, (void *)hptes, n * HASH_PTE_SIZE_64,
+                        false, n * HASH_PTE_SIZE_64);
+}
diff --git a/target/ppc/mmu-misc.h b/target/ppc/mmu-misc.h
new file mode 100644
index 0000000000..7be6bf7b44
--- /dev/null
+++ b/target/ppc/mmu-misc.h
@@ -0,0 +1,22 @@
+#ifndef MMU_MISC_H
+#define MMU_MISC_H
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+#ifndef CONFIG_USER_ONLY
+
+#ifdef TARGET_PPC64
+
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
+void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
+                                 bool (*cb)(void *, uint32_t, uint32_t),
+                                 void *opaque);
+
+#endif
+
+void ppc_hash64_unmap_hptes(PowerPCCPU *cpu, const ppc_hash_pte64_t *hptes,
+                            hwaddr ptex, int n);
+
+#endif
+
+#endif
-- 
2.17.1


