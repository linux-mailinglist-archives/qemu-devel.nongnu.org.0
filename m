Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F1399CA7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:35:51 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loipS-0004E9-KI
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid4-0006VJ-Di; Thu, 03 Jun 2021 04:23:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54353 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid1-00005T-R5; Thu, 03 Jun 2021 04:23:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m0TJCz9sf8; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=XYE7HdXROp2WSL2iwdaGtCM0pNqGmTxhgZhgnpbX7gI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k/OqaD+VJrFgTbeYB6auiq9WvOsCbHWAJWCYjDbO6U5ONShD/1HKRtxjKyIpDbMV5
 gfjK9zxdxPT4U7AMY33Bb1G7yLD3wSvwDQmNrzCImBgrPJLxpfvTPgZxAm+NiZzOiN
 th+Zm3MVANqiAbR8WEOZw61OtiDQNUNZyBDyieKU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/42] target/ppc: added ifdefs around TCG-only code
Date: Thu,  3 Jun 2021 18:22:02 +1000
Message-Id: <20210603082231.601214-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

excp_helper.c, mmu-hash64.c and mmu_helper.c have some function
declarations that are TCG-only, and couldn't be easily moved to a
TCG only file, so ifdefs were added around them.

We also needed ifdefs around some header files because helper-proto.h
includes trace/generated-helpers.h, which is never created when building
without TCG, and cpu_ldst.h includes tcg/tcg.h, whose containing folder
is not included as a -iquote. As future cleanup, we could change the
part of the configuration script to add those.

cpu_init.c also had a callback definition that is TCG only and could be
removed as part of a future cleanup (all the dump_statistics part is
almost never used and will become obsolete as we transition to using
decodetree).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210525115355.8254-3-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c    |  2 ++
 target/ppc/excp_helper.c | 21 ++++++++++++++++++---
 target/ppc/mmu-hash64.c  | 11 ++++++++++-
 target/ppc/mmu_helper.c  | 16 ++++++++++++++--
 4 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a32893fde8..067feeaec0 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9307,7 +9307,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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
index f4f15279eb..04418054f5 100644
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
@@ -1208,6 +1211,7 @@ void raise_exception_ra(CPUPPCState *env, uint32_t exception,
     raise_exception_err_ra(env, exception, 0, raddr);
 }
 
+#ifdef CONFIG_TCG
 void helper_raise_exception_err(CPUPPCState *env, uint32_t exception,
                                 uint32_t error_code)
 {
@@ -1218,8 +1222,10 @@ void helper_raise_exception(CPUPPCState *env, uint32_t exception)
 {
     raise_exception_err_ra(env, exception, 0, 0);
 }
+#endif
 
 #if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_TCG
 void helper_store_msr(CPUPPCState *env, target_ulong val)
 {
     uint32_t excp = hreg_store_msr(env, val, 0);
@@ -1259,6 +1265,7 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
         (env->spr[SPR_PSSCR] & PSSCR_EC);
 }
 #endif /* defined(TARGET_PPC64) */
+#endif /* CONFIG_TCG */
 
 static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
 {
@@ -1293,6 +1300,7 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
     check_tlb_flush(env, false);
 }
 
+#ifdef CONFIG_TCG
 void helper_rfi(CPUPPCState *env)
 {
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
@@ -1345,8 +1353,10 @@ void helper_rfmci(CPUPPCState *env)
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
@@ -1374,11 +1384,13 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
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
@@ -1523,8 +1535,10 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_ulong rb)
     book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
 }
 #endif
+#endif /* CONFIG_TCG */
 #endif
 
+#ifdef CONFIG_TCG
 void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
@@ -1540,3 +1554,4 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     env->error_code = insn & 0x03FF0000;
     cpu_loop_exit(cs);
 }
+#endif
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index f48b625f48..708dffc31b 100644
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
@@ -1139,12 +1146,14 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
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
index 475d9f81b4..1ecb36e85a 100644
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
 
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
@@ -1752,6 +1760,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
     return ret;
 }
 
+#ifdef CONFIG_TCG
 /*****************************************************************************/
 /* BATs management */
 #if !defined(FLUSH_ALL_TLBS)
@@ -1941,6 +1950,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 #endif
     }
 }
+#endif
 
 /*****************************************************************************/
 /* TLB management */
@@ -1986,6 +1996,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
     }
 }
 
+#ifdef CONFIG_TCG
 void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 {
 #if !defined(FLUSH_ALL_TLBS)
@@ -2927,6 +2938,7 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 {
     check_tlb_flush(env, true);
 }
+#endif /* CONFIG_TCG */
 
 /*****************************************************************************/
 
-- 
2.31.1


