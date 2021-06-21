Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821463AE990
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:00:49 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJXk-0008KE-Ev
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQE-0007x1-J1; Mon, 21 Jun 2021 08:53:02 -0400
Received: from [201.28.113.2] (port=47857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQC-0004nA-Oe; Mon, 21 Jun 2021 08:53:02 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:40 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id E94A580005E;
 Mon, 21 Jun 2021 09:51:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] target/ppc: Split out ppc_hash64_xlate
Date: Mon, 21 Jun 2021 09:51:10 -0300
Message-Id: <20210621125115.67717-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 Jun 2021 12:51:40.0211 (UTC)
 FILETIME=[2DEC4830:01D7669C]
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Mirror the interface of ppc_radix64_xlate, putting all of
the logic for hash64 translation into a single function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash64.c | 125 +++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 66 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 2febd369b1..c6b167b4dc 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -873,8 +873,10 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     return -1;
 }
 
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -918,9 +920,11 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             slb = &vrma_slbe;
             if (build_vrma_slbe(cpu, slb) != 0) {
                 /* Invalid VRMA setup, machine check */
-                cs->exception_index = POWERPC_EXCP_MCHECK;
-                env->error_code = 0;
-                return 1;
+                if (guest_visible) {
+                    cs->exception_index = POWERPC_EXCP_MCHECK;
+                    env->error_code = 0;
+                }
+                return false;
             }
 
             goto skip_slb_search;
@@ -929,6 +933,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
             /* Emulated old-style RMO mode, bounds check against RMLS */
             if (raddr >= limit) {
+                if (!guest_visible) {
+                    return false;
+                }
                 switch (access_type) {
                 case MMU_INST_FETCH:
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
@@ -943,15 +950,16 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                 default:
                     g_assert_not_reached();
                 }
-                return 1;
+                return false;
             }
 
             raddr |= env->spr[SPR_RMOR];
         }
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+
+        *raddrp = raddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return true;
     }
 
     /* 2. Translation is on, so look up the SLB */
@@ -964,6 +972,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             exit(1);
         }
         /* Segment still not found, generate the appropriate interrupt */
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             cs->exception_index = POWERPC_EXCP_ISEG;
@@ -978,20 +989,25 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
 
-skip_slb_search:
+ skip_slb_search:
 
     /* 3. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
-        ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
-        return 1;
+        if (guest_visible) {
+            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
+        }
+        return false;
     }
 
     /* 4. Locate the PTE in the hash table */
     ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
     if (ptex == -1) {
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             ppc_hash64_set_isi(cs, SRR1_NOPTE);
@@ -1005,7 +1021,7 @@ skip_slb_search:
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                   "found PTE at index %08" HWADDR_PRIx "\n", ptex);
@@ -1021,6 +1037,9 @@ skip_slb_search:
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
+        if (!guest_visible) {
+            return false;
+        }
         if (access_type == MMU_INST_FETCH) {
             int srr1 = 0;
             if (PAGE_EXEC & ~exec_prot) {
@@ -1045,7 +1064,7 @@ skip_slb_search:
             }
             ppc_hash64_set_dsi(cs, eaddr, dsisr);
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -1069,66 +1088,40 @@ skip_slb_search:
 
     /* 7. Determine the real address from the PTE */
 
-    raddr = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1ULL << apshift);
-
-    return 0;
+    *raddrp = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
+    *protp = prot;
+    *psizep = apshift;
+    return true;
 }
 
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr)
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
 {
-    CPUPPCState *env = &cpu->env;
-    ppc_slb_t vrma_slbe;
-    ppc_slb_t *slb;
-    hwaddr ptex, raddr;
-    ppc_hash_pte64_t pte;
-    unsigned apshift;
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
 
-    /* Handle real mode */
-    if (msr_dr == 0) {
-        /* In real mode the top 4 effective address bits are ignored */
-        raddr = addr & 0x0FFFFFFFFFFFFFFFULL;
+    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
+                          &page_size, &prot, true)) {
+        return 1;
+    }
 
-        if (cpu->vhyp) {
-            /*
-             * In virtual hypervisor mode, there's nothing to do:
-             *   EA == GPA == qemu guest address
-             */
-            return raddr;
-        } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
-            /* In HV mode, add HRMOR if top EA bit is clear */
-            return raddr | env->spr[SPR_HRMOR];
-        } else if (ppc_hash64_use_vrma(env)) {
-            /* Emulated VRMA mode */
-            slb = &vrma_slbe;
-            if (build_vrma_slbe(cpu, slb) != 0) {
-                return -1;
-            }
-        } else {
-            target_ulong limit = rmls_limit(cpu);
+    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
+                 prot, mmu_idx, 1UL << page_size);
+    return 0;
+}
 
-            /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr >= limit) {
-                return -1;
-            }
-            return raddr | env->spr[SPR_RMOR];
-        }
-    } else {
-        slb = slb_lookup(cpu, addr);
-        if (!slb) {
-            return -1;
-        }
-    }
+hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
+{
+    int psize, prot;
+    hwaddr raddr;
 
-    ptex = ppc_hash64_htab_lookup(cpu, slb, addr, &pte, &apshift);
-    if (ptex == -1) {
+    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                          &psize, &prot, false)) {
         return -1;
     }
 
-    return deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, addr)
-        & TARGET_PAGE_MASK;
+    return raddr & TARGET_PAGE_MASK;
 }
 
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
-- 
2.17.1


