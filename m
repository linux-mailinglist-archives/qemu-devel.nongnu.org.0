Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B416B38CF0C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 22:26:48 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkBjL-00082G-Nk
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 16:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBcd-0007Si-If; Fri, 21 May 2021 16:19:51 -0400
Received: from [201.28.113.2] (port=30260 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBcb-0001dV-87; Fri, 21 May 2021 16:19:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 17:18:19 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id A85BA8013E6;
 Fri, 21 May 2021 17:18:19 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] target/ppc: Added options to disable many TCG-only
 functions
Date: Fri, 21 May 2021 17:17:57 -0300
Message-Id: <20210521201759.85475-8-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 May 2021 20:18:19.0807 (UTC)
 FILETIME=[70EBDAF0:01D74E7E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrapped some function calls in cpu_init.c, gdbstub.c, mmu-hash64.c,
mmu_helper.c and excp_helper.c that were TCG only with ifdef
CONFIG_TCG,
to support building without TCG.

for excp_helper we also moved the function do_rfi higher in the file to
reduce the ifdef count.

For cpu_init.c, we will also create stubs for ppc_*_opcodes, to make the
ifdef hell a little smaller, and have hid part of the spr_registration
logic into the macro that can make the TCG part disappear.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu_init.c    | 11 +++---
 target/ppc/excp_helper.c | 85 +++++++++++++++++++++++-----------------
 target/ppc/mmu-hash64.c  | 11 +++++-
 target/ppc/mmu_helper.c  | 16 +++++++-
 4 files changed, 78 insertions(+), 45 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b696469d1a..f5ae2f150d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1205,15 +1205,12 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i = 0; i < 8; i++) {
-        void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
-            &spr_write_generic32;
-        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
-            uea_write = &spr_write_generic;
-        }
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, uea_write,
+                         &spr_read_generic,
+                         (i == 2 && (env->insns_flags & PPC_64B))
+                         ? &spr_write_generic : &spr_write_generic32,
                          0x00000000);
         }
     }
@@ -9253,7 +9250,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
+#ifdef CONFIG_TCG
     cc->dump_statistics = ppc_cpu_dump_statistics;
+#endif
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 80bb6e70e9..e20f38ebe2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,12 +19,15 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "internal.h"
 #include "helper_regs.h"
 
+#ifdef CONFIG_TCG
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#endif
+
 /* #define DEBUG_OP */
 /* #define DEBUG_SOFTWARE_TLB */
 /* #define DEBUG_EXCEPTIONS */
@@ -1191,6 +1194,7 @@ void raise_exception_ra(CPUPPCState *env, uint32_t exception,
     raise_exception_err_ra(env, exception, 0, raddr);
 }
 
+#ifdef CONFIG_TCG
 void helper_raise_exception_err(CPUPPCState *env, uint32_t exception,
                                 uint32_t error_code)
 {
@@ -1201,8 +1205,43 @@ void helper_raise_exception(CPUPPCState *env, uint32_t exception)
 {
     raise_exception_err_ra(env, exception, 0, 0);
 }
+#endif
 
 #if !defined(CONFIG_USER_ONLY)
+static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
+{
+    CPUState *cs = env_cpu(env);
+
+    /* MSR:POW cannot be set by any form of rfi */
+    msr &= ~(1ULL << MSR_POW);
+
+#if defined(TARGET_PPC64)
+    /* Switching to 32-bit ? Crop the nip */
+    if (!msr_is_64bit(env, msr)) {
+        nip = (uint32_t)nip;
+    }
+#else
+    nip = (uint32_t)nip;
+#endif
+    /* XXX: beware: this is false if VLE is supported */
+    env->nip = nip & ~((target_ulong)0x00000003);
+    hreg_store_msr(env, msr, 1);
+#if defined(DEBUG_OP)
+    cpu_dump_rfi(env->nip, env->msr);
+#endif
+    /*
+     * No need to raise an exception here, as rfi is always the last
+     * insn of a TB
+     */
+    cpu_interrupt_exittb(cs);
+    /* Reset the reservation */
+    env->reserve_addr = -1;
+
+    /* Context synchronizing: check if TCG TLB needs flush */
+    check_tlb_flush(env, false);
+}
+
+#ifdef CONFIG_TCG
 void helper_store_msr(CPUPPCState *env, target_ulong val)
 {
     uint32_t excp = hreg_store_msr(env, val, 0);
@@ -1243,39 +1282,6 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
 }
 #endif /* defined(TARGET_PPC64) */
 
-static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
-{
-    CPUState *cs = env_cpu(env);
-
-    /* MSR:POW cannot be set by any form of rfi */
-    msr &= ~(1ULL << MSR_POW);
-
-#if defined(TARGET_PPC64)
-    /* Switching to 32-bit ? Crop the nip */
-    if (!msr_is_64bit(env, msr)) {
-        nip = (uint32_t)nip;
-    }
-#else
-    nip = (uint32_t)nip;
-#endif
-    /* XXX: beware: this is false if VLE is supported */
-    env->nip = nip & ~((target_ulong)0x00000003);
-    hreg_store_msr(env, msr, 1);
-#if defined(DEBUG_OP)
-    cpu_dump_rfi(env->nip, env->msr);
-#endif
-    /*
-     * No need to raise an exception here, as rfi is always the last
-     * insn of a TB
-     */
-    cpu_interrupt_exittb(cs);
-    /* Reset the reservation */
-    env->reserve_addr = -1;
-
-    /* Context synchronizing: check if TCG TLB needs flush */
-    check_tlb_flush(env, false);
-}
-
 void helper_rfi(CPUPPCState *env)
 {
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
@@ -1328,8 +1334,10 @@ void helper_rfmci(CPUPPCState *env)
     /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
     do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]);
 }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !defined(CONFIG_USER_ONLY) */
 
+#ifdef CONFIG_TCG
 void helper_tw(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
                uint32_t flags)
 {
@@ -1357,11 +1365,13 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
     }
 }
 #endif
+#endif
 
 #if !defined(CONFIG_USER_ONLY)
 /*****************************************************************************/
 /* PowerPC 601 specific instructions (POWER bridge) */
 
+#ifdef CONFIG_TCG
 void helper_rfsvc(CPUPPCState *env)
 {
     do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
@@ -1506,8 +1516,10 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
     book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
 }
 #endif
+#endif /* CONFIG_TCG */
 #endif
 
+#ifdef CONFIG_TCG
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
@@ -1523,3 +1535,4 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = insn & 0x03FF0000;
     cpu_loop_exit(cs);
 }
+#endif
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index ce0068590f..c1b98a97e9 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -21,7 +21,6 @@
 #include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/hw_accel.h"
@@ -33,6 +32,10 @@
 #include "mmu-book3s-v3.h"
 #include "helper_regs.h"
 
+#ifdef CONFIG_TCG
+#include "exec/helper-proto.h"
+#endif
+
 /* #define DEBUG_SLB */
 
 #ifdef DEBUG_SLB
@@ -97,6 +100,7 @@ void dump_slb(PowerPCCPU *cpu)
     }
 }
 
+#ifdef CONFIG_TCG
 void helper_slbia(CPUPPCState *env, uint32_t ih)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -202,6 +206,7 @@ void helper_slbieg(CPUPPCState *env, target_ulong addr)
 {
     __helper_slbie(env, addr, true);
 }
+#endif
 
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid)
@@ -255,6 +260,7 @@ int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
     return 0;
 }
 
+#ifdef CONFIG_TCG
 static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
                              target_ulong *rt)
 {
@@ -348,6 +354,7 @@ target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
     }
     return rt;
 }
+#endif
 
 /* Check No-Execute or Guarded Storage */
 static inline int ppc_hash64_pte_noexec_guard(PowerPCCPU *cpu,
@@ -1097,12 +1104,14 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
     cpu->env.tlb_need_flush = TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_FLUSH;
 }
 
+#ifdef CONFIG_TCG
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
 
     ppc_store_lpcr(cpu, val);
 }
+#endif
 
 void ppc_hash64_init(PowerPCCPU *cpu)
 {
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 5395e5ee5a..9339b3aa59 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -20,13 +20,11 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
-#include "exec/helper-proto.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "mmu-hash64.h"
 #include "mmu-hash32.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
@@ -36,6 +34,10 @@
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
 
+#ifdef CONFIG_TCG
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#endif
 /* #define DEBUG_MMU */
 /* #define DEBUG_BATS */
 /* #define DEBUG_SOFTWARE_TLB */
@@ -268,6 +270,7 @@ static inline void ppc6xx_tlb_invalidate_virt(CPUPPCState *env,
     ppc6xx_tlb_invalidate_virt2(env, eaddr, is_code, 0);
 }
 
+#ifdef CONFIG_TCG
 static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
                              int is_code, target_ulong pte0, target_ulong pte1)
 {
@@ -286,6 +289,7 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
     /* Store last way for LRU mechanism */
     env->last_way = way;
 }
+#endif
 
 static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                             target_ulong eaddr, MMUAccessType access_type)
@@ -626,6 +630,7 @@ static int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
     return 0;
 }
 
+#ifdef CONFIG_TCG
 /* Generic TLB search function for PowerPC embedded implementations */
 static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
                              uint32_t pid)
@@ -646,6 +651,7 @@ static int ppcemb_tlb_search(CPUPPCState *env, target_ulong address,
 
     return ret;
 }
+#endif
 
 /* Helpers specific to PowerPC 40x implementations */
 static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
@@ -1420,12 +1426,14 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
+#ifdef CONFIG_TCG
 static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                 target_ulong eaddr, MMUAccessType access_type,
                                 int type)
 {
     return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
 }
+#endif
 
 static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
                                          MMUAccessType access_type, int mmu_idx)
@@ -1709,6 +1717,7 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return false;
 }
 
+#ifdef CONFIG_TCG
 /*****************************************************************************/
 /* BATs management */
 #if !defined(FLUSH_ALL_TLBS)
@@ -1898,6 +1907,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 #endif
     }
 }
+#endif
 
 /*****************************************************************************/
 /* TLB management */
@@ -1943,6 +1953,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
     }
 }
 
+#ifdef CONFIG_TCG
 void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 {
 #if !defined(FLUSH_ALL_TLBS)
@@ -2912,6 +2923,7 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 {
     check_tlb_flush(env, true);
 }
+#endif /* CONFIG_TCG */
 
 /*****************************************************************************/
 
-- 
2.17.1


