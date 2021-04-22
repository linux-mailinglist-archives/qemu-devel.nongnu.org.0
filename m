Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00043687A2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:04:32 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZfYt-0000Dl-DA
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfLA-0006A3-UI; Thu, 22 Apr 2021 15:50:22 -0400
Received: from [201.28.113.2] (port=23502 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lZfL8-0002SN-Py; Thu, 22 Apr 2021 15:50:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 22 Apr 2021 16:31:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 6F9DC800BEE;
 Thu, 22 Apr 2021 16:31:39 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/4] target/ppc: transfered functions to non-tcg-only files
Date: Thu, 22 Apr 2021 16:31:31 -0300
Message-Id: <20210422193131.22560-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
References: <20210422193131.22560-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 22 Apr 2021 19:31:39.0602 (UTC)
 FILETIME=[1DE3BB20:01D737AE]
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
Cc: bruno.larsen@eldorado.org.br, lucas.araujo@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

moved the functions ppc_store_lpcr and ppc_hash64_filter_pagesizes to
common-misc.c so they can be used in a disable-tcg build and added the
necessary includes to files that call them. Created
ppc_(store|load)_vscr to be used by both tcg and kvm.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 hw/ppc/spapr.c                |  1 +
 hw/ppc/spapr_caps.c           |  1 +
 hw/ppc/spapr_cpu_core.c       |  1 +
 hw/ppc/spapr_hcall.c          |  1 +
 hw/ppc/spapr_hcall_tcg_stub.c |  1 +
 hw/ppc/spapr_rtas.c           |  1 +
 target/ppc/common-misc.c      | 86 +++++++++++++++++++++++++++++++++++
 target/ppc/common-misc.h      | 13 ++++++
 target/ppc/int_helper.c       | 10 ++--
 target/ppc/meson.build        |  1 +
 target/ppc/mmu-hash64.c       | 67 +--------------------------
 target/ppc/mmu-hash64.h       |  4 --
 12 files changed, 110 insertions(+), 77 deletions(-)
 create mode 100644 target/ppc/common-misc.c
 create mode 100644 target/ppc/common-misc.h

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e4be00b732..f41accd5ec 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -52,6 +52,7 @@
 #include "mmu-hash64.h"
 #include "mmu-book3s-v3.h"
 #include "cpu-models.h"
+#include "common-misc.h"
 #include "hw/core/cpu.h"
 
 #include "hw/boards.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9ea7ddd1e9..1bf55459b0 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -34,6 +34,7 @@
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
 #include "sysemu/tcg.h"
+#include "common-misc.h"
 
 #include "hw/ppc/spapr.h"
 
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 4f316a6f9d..62f19700f5 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -24,6 +24,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hw_accel.h"
 #include "qemu/error-report.h"
+#include "common-misc.h"
 
 static void spapr_reset_vcpu(PowerPCCPU *cpu)
 {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..e8a9bfbcbb 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -20,6 +20,7 @@
 #include "hw/ppc/spapr_ovec.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
+#include "common-misc.h"
 
 static bool has_spr(PowerPCCPU *cpu, int spr)
 {
diff --git a/hw/ppc/spapr_hcall_tcg_stub.c b/hw/ppc/spapr_hcall_tcg_stub.c
index 6682279b6e..7dca9ff2a9 100644
--- a/hw/ppc/spapr_hcall_tcg_stub.c
+++ b/hw/ppc/spapr_hcall_tcg_stub.c
@@ -20,6 +20,7 @@
 #include "hw/ppc/spapr_ovec.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
+#include "common-misc.h"
 
 static bool has_spr(PowerPCCPU *cpu, int spr)
 {
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 8a79f9c628..8c8c50e498 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -35,6 +35,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "kvm_ppc.h"
+#include "common-misc.h"
 
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
diff --git a/target/ppc/common-misc.c b/target/ppc/common-misc.c
new file mode 100644
index 0000000000..5e860d6245
--- /dev/null
+++ b/target/ppc/common-misc.c
@@ -0,0 +1,86 @@
+#include "qemu/osdep.h"
+#include "common-misc.h"
+#include "mmu-hash64.h"
+#include "fpu/softfloat-helpers.h"
+
+void ppc_store_vscr(CPUPPCState *env, uint64_t vscr)
+{
+    env->vscr = vscr & ~(1u << VSCR_SAT);
+    /* Which bit we set is completely arbitrary, but clear the rest.  */
+    env->vscr_sat.u64[0] = vscr & (1u << VSCR_SAT);
+    env->vscr_sat.u64[1] = 0;
+    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
+}
+
+uint32_t ppc_load_vscr(CPUPPCState *env)
+{
+    uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
+    return env->vscr | (sat << VSCR_SAT);
+}
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
diff --git a/target/ppc/common-misc.h b/target/ppc/common-misc.h
new file mode 100644
index 0000000000..a12488476d
--- /dev/null
+++ b/target/ppc/common-misc.h
@@ -0,0 +1,13 @@
+#ifndef COMMON_MISC_H
+#define COMMON_MISC_H
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+void ppc_store_vscr(CPUPPCState *env, uint64_t vscr);
+uint32_t ppc_load_vscr(CPUPPCState *env);
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
+void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
+                                 bool (*cb)(void *, uint32_t, uint32_t),
+                                 void *opaque);
+
+#endif
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 429de28494..892c7e2a63 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -27,6 +27,7 @@
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "common-misc.h"
 
 #include "helper_regs.h"
 /*****************************************************************************/
@@ -461,17 +462,12 @@ SATCVT(sd, uw, int64_t, uint32_t, 0, UINT32_MAX)
 
 void helper_mtvscr(CPUPPCState *env, uint32_t vscr)
 {
-    env->vscr = vscr & ~(1u << VSCR_SAT);
-    /* Which bit we set is completely arbitrary, but clear the rest.  */
-    env->vscr_sat.u64[0] = vscr & (1u << VSCR_SAT);
-    env->vscr_sat.u64[1] = 0;
-    set_flush_to_zero((vscr >> VSCR_NJ) & 1, &env->vec_status);
+    ppc_store_vscr(env, vscr);
 }
 
 uint32_t helper_mfvscr(CPUPPCState *env)
 {
-    uint32_t sat = (env->vscr_sat.u64[0] | env->vscr_sat.u64[1]) != 0;
-    return env->vscr | (sat << VSCR_SAT);
+    return ppc_load_vscr(env);
 }
 
 static inline void set_vscr_sat(CPUPPCState *env)
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index b369a6bcd0..b5a89df296 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -3,6 +3,7 @@ ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
   'gdbstub.c',
+  'common-misc.c',
 ))
 
 ppc_ss.add(libdecnumber)
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 0fabc10302..22b9a99608 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 #include "hw/hw.h"
 #include "mmu-book3s-v3.h"
+#include "common-misc.h"
 
 /* #define DEBUG_SLB */
 
@@ -1119,14 +1120,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
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
@@ -1197,61 +1190,3 @@ const PPCHash64Options ppc_hash64_opts_POWER7 = {
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
index 87729d48b3..4b8b8e7950 100644
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
-- 
2.17.1


