Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E555C39939A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:35:26 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWeD-0006y5-MM
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1loWWL-00055i-NS; Wed, 02 Jun 2021 15:27:17 -0400
Received: from [201.28.113.2] (port=39068 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1loWWJ-0002aI-Eo; Wed, 02 Jun 2021 15:27:17 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 16:26:29 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id ABA1A80148C;
 Wed,  2 Jun 2021 16:26:29 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/4] target/ppc: Moved helpers to mmu_helper.c
Date: Wed,  2 Jun 2021 16:26:04 -0300
Message-Id: <20210602192604.90846-5-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 02 Jun 2021 19:26:29.0835 (UTC)
 FILETIME=[3030C9B0:01D757E5]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved helpers from target/ppc/mmu-hash64.c to target/ppc/mmu_helpers.c
and removed #ifdef CONFIG_TCG and #include exec/helper-proto.h from
mmu-hash64.c

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
I had to turn slb_lookup in a non static function as it had calls from
the code that was moved to mmu_helper.c and from the code that wasn't
moved.

Also perhaps it would be best to create a new file to move the mmu-hash
functions that are not compiled in !TCG, personally I thought that
moving the helpers in mmu-hash64 to mmu_helpers the better choice.
---
 target/ppc/mmu-hash64.c | 219 +---------------------------------------
 target/ppc/mmu-hash64.h |   1 +
 target/ppc/mmu_helper.c | 209 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 211 insertions(+), 218 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 708dffc31b..d2ded71107 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -32,10 +32,6 @@
 #include "mmu-book3s-v3.h"
 #include "helper_regs.h"
 
-#ifdef CONFIG_TCG
-#include "exec/helper-proto.h"
-#endif
-
 /* #define DEBUG_SLB */
 
 #ifdef DEBUG_SLB
@@ -48,7 +44,7 @@
  * SLB handling
  */
 
-static ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr)
+ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr)
 {
     CPUPPCState *env = &cpu->env;
     uint64_t esid_256M, esid_1T;
@@ -100,114 +96,6 @@ void dump_slb(PowerPCCPU *cpu)
     }
 }
 
-#ifdef CONFIG_TCG
-void helper_slbia(CPUPPCState *env, uint32_t ih)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    int starting_entry;
-    int n;
-
-    /*
-     * slbia must always flush all TLB (which is equivalent to ERAT in ppc
-     * architecture). Matching on SLB_ESID_V is not good enough, because slbmte
-     * can overwrite a valid SLB without flushing its lookaside information.
-     *
-     * It would be possible to keep the TLB in synch with the SLB by flushing
-     * when a valid entry is overwritten by slbmte, and therefore slbia would
-     * not have to flush unless it evicts a valid SLB entry. However it is
-     * expected that slbmte is more common than slbia, and slbia is usually
-     * going to evict valid SLB entries, so that tradeoff is unlikely to be a
-     * good one.
-     *
-     * ISA v2.05 introduced IH field with values 0,1,2,6. These all invalidate
-     * the same SLB entries (everything but entry 0), but differ in what
-     * "lookaside information" is invalidated. TCG can ignore this and flush
-     * everything.
-     *
-     * ISA v3.0 introduced additional values 3,4,7, which change what SLBs are
-     * invalidated.
-     */
-
-    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
-
-    starting_entry = 1; /* default for IH=0,1,2,6 */
-
-    if (env->mmu_model == POWERPC_MMU_3_00) {
-        switch (ih) {
-        case 0x7:
-            /* invalidate no SLBs, but all lookaside information */
-            return;
-
-        case 0x3:
-        case 0x4:
-            /* also considers SLB entry 0 */
-            starting_entry = 0;
-            break;
-
-        case 0x5:
-            /* treat undefined values as ih==0, and warn */
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "slbia undefined IH field %u.\n", ih);
-            break;
-
-        default:
-            /* 0,1,2,6 */
-            break;
-        }
-    }
-
-    for (n = starting_entry; n < cpu->hash64_opts->slb_size; n++) {
-        ppc_slb_t *slb = &env->slb[n];
-
-        if (!(slb->esid & SLB_ESID_V)) {
-            continue;
-        }
-        if (env->mmu_model == POWERPC_MMU_3_00) {
-            if (ih == 0x3 && (slb->vsid & SLB_VSID_C) == 0) {
-                /* preserves entries with a class value of 0 */
-                continue;
-            }
-        }
-
-        slb->esid &= ~SLB_ESID_V;
-    }
-}
-
-static void __helper_slbie(CPUPPCState *env, target_ulong addr,
-                           target_ulong global)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    ppc_slb_t *slb;
-
-    slb = slb_lookup(cpu, addr);
-    if (!slb) {
-        return;
-    }
-
-    if (slb->esid & SLB_ESID_V) {
-        slb->esid &= ~SLB_ESID_V;
-
-        /*
-         * XXX: given the fact that segment size is 256 MB or 1TB,
-         *      and we still don't have a tlb_flush_mask(env, n, mask)
-         *      in QEMU, we just invalidate all TLBs
-         */
-        env->tlb_need_flush |=
-            (global == false ? TLB_NEED_LOCAL_FLUSH : TLB_NEED_GLOBAL_FLUSH);
-    }
-}
-
-void helper_slbie(CPUPPCState *env, target_ulong addr)
-{
-    __helper_slbie(env, addr, false);
-}
-
-void helper_slbieg(CPUPPCState *env, target_ulong addr)
-{
-    __helper_slbie(env, addr, true);
-}
-#endif
-
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid)
 {
@@ -260,102 +148,6 @@ int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
     return 0;
 }
 
-#ifdef CONFIG_TCG
-static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
-                             target_ulong *rt)
-{
-    CPUPPCState *env = &cpu->env;
-    int slot = rb & 0xfff;
-    ppc_slb_t *slb = &env->slb[slot];
-
-    if (slot >= cpu->hash64_opts->slb_size) {
-        return -1;
-    }
-
-    *rt = slb->esid;
-    return 0;
-}
-
-static int ppc_load_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
-                             target_ulong *rt)
-{
-    CPUPPCState *env = &cpu->env;
-    int slot = rb & 0xfff;
-    ppc_slb_t *slb = &env->slb[slot];
-
-    if (slot >= cpu->hash64_opts->slb_size) {
-        return -1;
-    }
-
-    *rt = slb->vsid;
-    return 0;
-}
-
-static int ppc_find_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
-                             target_ulong *rt)
-{
-    CPUPPCState *env = &cpu->env;
-    ppc_slb_t *slb;
-
-    if (!msr_is_64bit(env, env->msr)) {
-        rb &= 0xffffffff;
-    }
-    slb = slb_lookup(cpu, rb);
-    if (slb == NULL) {
-        *rt = (target_ulong)-1ul;
-    } else {
-        *rt = slb->vsid;
-    }
-    return 0;
-}
-
-void helper_store_slb(CPUPPCState *env, target_ulong rb, target_ulong rs)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-
-    if (ppc_store_slb(cpu, rb & 0xfff, rb & ~0xfffULL, rs) < 0) {
-        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
-                               POWERPC_EXCP_INVAL, GETPC());
-    }
-}
-
-target_ulong helper_load_slb_esid(CPUPPCState *env, target_ulong rb)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    target_ulong rt = 0;
-
-    if (ppc_load_slb_esid(cpu, rb, &rt) < 0) {
-        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
-                               POWERPC_EXCP_INVAL, GETPC());
-    }
-    return rt;
-}
-
-target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    target_ulong rt = 0;
-
-    if (ppc_find_slb_vsid(cpu, rb, &rt) < 0) {
-        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
-                               POWERPC_EXCP_INVAL, GETPC());
-    }
-    return rt;
-}
-
-target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-    target_ulong rt = 0;
-
-    if (ppc_load_slb_vsid(cpu, rb, &rt) < 0) {
-        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
-                               POWERPC_EXCP_INVAL, GETPC());
-    }
-    return rt;
-}
-#endif
-
 /* Check No-Execute or Guarded Storage */
 static inline int ppc_hash64_pte_noexec_guard(PowerPCCPU *cpu,
                                               ppc_hash_pte64_t pte)
@@ -1146,15 +938,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
     cpu->env.tlb_need_flush = TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_FLUSH;
 }
 
-#ifdef CONFIG_TCG
-void helper_store_lpcr(CPUPPCState *env, target_ulong val)
-{
-    PowerPCCPU *cpu = env_archcpu(env);
-
-    ppc_store_lpcr(cpu, val);
-}
-#endif
-
 void ppc_hash64_init(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 4b8b8e7950..44fd7c9d35 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -7,6 +7,7 @@
 void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
+ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ulong eaddr);
 hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
                                 int mmu_idx);
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index dbf7b398cd..6db2678a89 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1361,3 +1361,211 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 
 /*****************************************************************************/
 
+#if defined(TARGET_PPC64)
+void helper_slbia(CPUPPCState *env, uint32_t ih)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    int starting_entry;
+    int n;
+
+    /*
+     * slbia must always flush all TLB (which is equivalent to ERAT in ppc
+     * architecture). Matching on SLB_ESID_V is not good enough, because slbmte
+     * can overwrite a valid SLB without flushing its lookaside information.
+     *
+     * It would be possible to keep the TLB in synch with the SLB by flushing
+     * when a valid entry is overwritten by slbmte, and therefore slbia would
+     * not have to flush unless it evicts a valid SLB entry. However it is
+     * expected that slbmte is more common than slbia, and slbia is usually
+     * going to evict valid SLB entries, so that tradeoff is unlikely to be a
+     * good one.
+     *
+     * ISA v2.05 introduced IH field with values 0,1,2,6. These all invalidate
+     * the same SLB entries (everything but entry 0), but differ in what
+     * "lookaside information" is invalidated. TCG can ignore this and flush
+     * everything.
+     *
+     * ISA v3.0 introduced additional values 3,4,7, which change what SLBs are
+     * invalidated.
+     */
+
+    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
+
+    starting_entry = 1; /* default for IH=0,1,2,6 */
+
+    if (env->mmu_model == POWERPC_MMU_3_00) {
+        switch (ih) {
+        case 0x7:
+            /* invalidate no SLBs, but all lookaside information */
+            return;
+
+        case 0x3:
+        case 0x4:
+            /* also considers SLB entry 0 */
+            starting_entry = 0;
+            break;
+
+        case 0x5:
+            /* treat undefined values as ih==0, and warn */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "slbia undefined IH field %u.\n", ih);
+            break;
+
+        default:
+            /* 0,1,2,6 */
+            break;
+        }
+    }
+
+    for (n = starting_entry; n < cpu->hash64_opts->slb_size; n++) {
+        ppc_slb_t *slb = &env->slb[n];
+
+        if (!(slb->esid & SLB_ESID_V)) {
+            continue;
+        }
+        if (env->mmu_model == POWERPC_MMU_3_00) {
+            if (ih == 0x3 && (slb->vsid & SLB_VSID_C) == 0) {
+                /* preserves entries with a class value of 0 */
+                continue;
+            }
+        }
+
+        slb->esid &= ~SLB_ESID_V;
+    }
+}
+
+static void __helper_slbie(CPUPPCState *env, target_ulong addr,
+                           target_ulong global)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    ppc_slb_t *slb;
+
+    slb = slb_lookup(cpu, addr);
+    if (!slb) {
+        return;
+    }
+
+    if (slb->esid & SLB_ESID_V) {
+        slb->esid &= ~SLB_ESID_V;
+
+        /*
+         * XXX: given the fact that segment size is 256 MB or 1TB,
+         *      and we still don't have a tlb_flush_mask(env, n, mask)
+         *      in QEMU, we just invalidate all TLBs
+         */
+        env->tlb_need_flush |=
+            (global == false ? TLB_NEED_LOCAL_FLUSH : TLB_NEED_GLOBAL_FLUSH);
+    }
+}
+
+void helper_slbie(CPUPPCState *env, target_ulong addr)
+{
+    __helper_slbie(env, addr, false);
+}
+
+void helper_slbieg(CPUPPCState *env, target_ulong addr)
+{
+    __helper_slbie(env, addr, true);
+}
+
+static int ppc_load_slb_esid(PowerPCCPU *cpu, target_ulong rb,
+                             target_ulong *rt)
+{
+    CPUPPCState *env = &cpu->env;
+    int slot = rb & 0xfff;
+    ppc_slb_t *slb = &env->slb[slot];
+
+    if (slot >= cpu->hash64_opts->slb_size) {
+        return -1;
+    }
+
+    *rt = slb->esid;
+    return 0;
+}
+
+static int ppc_load_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
+                             target_ulong *rt)
+{
+    CPUPPCState *env = &cpu->env;
+    int slot = rb & 0xfff;
+    ppc_slb_t *slb = &env->slb[slot];
+
+    if (slot >= cpu->hash64_opts->slb_size) {
+        return -1;
+    }
+
+    *rt = slb->vsid;
+    return 0;
+}
+
+static int ppc_find_slb_vsid(PowerPCCPU *cpu, target_ulong rb,
+                             target_ulong *rt)
+{
+    CPUPPCState *env = &cpu->env;
+    ppc_slb_t *slb;
+
+    if (!msr_is_64bit(env, env->msr)) {
+        rb &= 0xffffffff;
+    }
+    slb = slb_lookup(cpu, rb);
+    if (slb == NULL) {
+        *rt = (target_ulong)-1ul;
+    } else {
+        *rt = slb->vsid;
+    }
+    return 0;
+}
+
+void helper_store_slb(CPUPPCState *env, target_ulong rb, target_ulong rs)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    if (ppc_store_slb(cpu, rb & 0xfff, rb & ~0xfffULL, rs) < 0) {
+        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                               POWERPC_EXCP_INVAL, GETPC());
+    }
+}
+
+target_ulong helper_load_slb_esid(CPUPPCState *env, target_ulong rb)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    target_ulong rt = 0;
+
+    if (ppc_load_slb_esid(cpu, rb, &rt) < 0) {
+        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                               POWERPC_EXCP_INVAL, GETPC());
+    }
+    return rt;
+}
+
+target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    target_ulong rt = 0;
+
+    if (ppc_find_slb_vsid(cpu, rb, &rt) < 0) {
+        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                               POWERPC_EXCP_INVAL, GETPC());
+    }
+    return rt;
+}
+
+target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    target_ulong rt = 0;
+
+    if (ppc_load_slb_vsid(cpu, rb, &rt) < 0) {
+        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                               POWERPC_EXCP_INVAL, GETPC());
+    }
+    return rt;
+}
+
+void helper_store_lpcr(CPUPPCState *env, target_ulong val)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+
+    ppc_store_lpcr(cpu, val);
+}
+#endif
-- 
2.17.1


