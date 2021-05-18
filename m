Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A289A387C4C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:19:11 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1V0-0000Dp-2r
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1KT-0007QZ-6G; Tue, 18 May 2021 11:08:17 -0400
Received: from [201.28.113.2] (port=29878 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1KR-0000fc-1m; Tue, 18 May 2021 11:08:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 12:05:41 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id DB6A9801362;
 Tue, 18 May 2021 12:05:40 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] target/ppc: wrapped some TCG only logic with ifdefs
Date: Tue, 18 May 2021 12:05:15 -0300
Message-Id: <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 18 May 2021 15:05:41.0070 (UTC)
 FILETIME=[449A7EE0:01D74BF7]
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
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrapped some function calls in cpu_init.c, gdbstub.c, mmu-hash64.c and
excp_helper.c that were TCG only with ifdef CONFIG_TCG, to support
building without TCG.

for excp_helper we also moved the function do_rfi higher in the file to
reduce the ifdef count.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu_init.c    | 16 +++++---
 target/ppc/excp_helper.c | 82 +++++++++++++++++++++++-----------------
 target/ppc/mmu-hash64.c  |  8 ++++
 3 files changed, 66 insertions(+), 40 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 88a8344eea..5ab4d4ef2b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1203,15 +1203,13 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
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
+                         (i == 2 && (mas_mask & (1 << i)) &&
+                         (env->insns_flags & PPC_64B))
+                         ? &spr_write_generic : &spr_write_generic32,
                          0x00000000);
         }
     }
@@ -8605,11 +8603,13 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     create_ppc_opcodes(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         goto unrealize;
     }
+#endif
     init_ppc_proc(cpu);
 
     ppc_gdb_init(cs, pcc);
@@ -8798,7 +8798,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 
     cpu_remove_sync(CPU(cpu));
 
+#ifdef CONFIG_TCG
     destroy_ppc_opcodes(cpu);
+#endif
 }
 
 static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
@@ -9296,7 +9298,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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
index 80bb6e70e9..a14b529722 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -19,9 +19,13 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
+#endif
 #include "exec/exec-all.h"
+#ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
+#endif
 #include "internal.h"
 #include "helper_regs.h"
 
@@ -1191,6 +1195,7 @@ void raise_exception_ra(CPUPPCState *env, uint32_t exception,
     raise_exception_err_ra(env, exception, 0, raddr);
 }
 
+#ifdef CONFIG_TCG
 void helper_raise_exception_err(CPUPPCState *env, uint32_t exception,
                                 uint32_t error_code)
 {
@@ -1201,8 +1206,43 @@ void helper_raise_exception(CPUPPCState *env, uint32_t exception)
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
@@ -1243,39 +1283,6 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
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
@@ -1328,8 +1335,10 @@ void helper_rfmci(CPUPPCState *env)
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
@@ -1357,11 +1366,13 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
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
@@ -1506,8 +1517,10 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
     book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
 }
 #endif
+#endif /* CONFIG_TCG */
 #endif
 
+#ifdef CONFIG_TCG
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
@@ -1523,3 +1536,4 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = insn & 0x03FF0000;
     cpu_loop_exit(cs);
 }
+#endif
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index c4a4bc7cd2..5f589c9690 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -21,7 +21,9 @@
 #include "qemu/units.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
+#endif
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/hw_accel.h"
@@ -96,6 +98,7 @@ void dump_slb(PowerPCCPU *cpu)
     }
 }
 
+#ifdef CONFIG_TCG
 void helper_slbia(CPUPPCState *env, uint32_t ih)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -201,6 +204,7 @@ void helper_slbieg(CPUPPCState *env, target_ulong addr)
 {
     __helper_slbie(env, addr, true);
 }
+#endif
 
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid)
@@ -254,6 +258,7 @@ int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
     return 0;
 }
 
+#ifdef CONFIG_TCG
 static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
                              target_ulong *rt)
 {
@@ -347,6 +352,7 @@ target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
     }
     return rt;
 }
+#endif
 
 /* Check No-Execute or Guarded Storage */
 static inline int ppc_hash64_pte_noexec_guard(PowerPCCPU *cpu,
@@ -1120,12 +1126,14 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
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
-- 
2.17.1


