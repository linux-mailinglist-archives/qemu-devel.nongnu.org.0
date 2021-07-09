Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7896A3C1EE5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:27:28 +0200 (CEST)
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j2t-0001bW-Hr
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itf-00011m-1Y; Fri, 09 Jul 2021 01:17:55 -0400
Received: from ozlabs.org ([203.11.71.1]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itb-0001wP-UG; Fri, 09 Jul 2021 01:17:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd4H4Bz9sjJ; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=cGFa/bncfPP5XoXpbY42QU0Tkk1WM8/Hmffo0dwmUM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Miqmqo21X8H/rz05Z3p3CbBIKSmnh/LKjzTWmAFNTCv8QhSZlkiW2sfv9JbznNEL7
 L+lsIbBlpQdxR9cUluFtJABSFRCOFkczMBgjzFx41ByuS9NkDfRHpnFOvcqLSdmqiE
 uf+M/WBAZzYcSgOZFkjU8mQDaOuVaxxvHwX1OKsM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/33] target/ppc: Split out ppc_hash32_xlate
Date: Fri,  9 Jul 2021 15:17:04 +1000
Message-Id: <20210709051728.170203-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: aik@ozlabs.ru, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Mirror the interface of ppc_radix64_xlate, putting all of
the logic for hash32 translation into a single entry point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-7-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash32.c | 224 ++++++++++++++++++++--------------------
 1 file changed, 113 insertions(+), 111 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 8f19b43e47..ad22372c07 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -218,10 +218,11 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
     return -1;
 }
 
-static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
-                                   target_ulong eaddr,
-                                   MMUAccessType access_type,
-                                   hwaddr *raddr, int *prot)
+static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
+                                    target_ulong eaddr,
+                                    MMUAccessType access_type,
+                                    hwaddr *raddr, int *prot,
+                                    bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -238,17 +239,23 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          */
         *raddr = ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return 0;
+        return true;
     }
 
     if (access_type == MMU_INST_FETCH) {
         /* No code fetch is allowed in direct-store areas */
-        cs->exception_index = POWERPC_EXCP_ISI;
-        env->error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs->exception_index = POWERPC_EXCP_ISI;
+            env->error_code = 0x10000000;
+        }
+        return false;
     }
 
-    switch (env->access_type) {
+    /*
+     * From ppc_cpu_get_phys_page_debug, env->access_type is not set.
+     * Assume ACCESS_INT for that case.
+     */
+    switch (guest_visible ? env->access_type : ACCESS_INT) {
     case ACCESS_INT:
         /* Integer load/store : only access allowed */
         break;
@@ -257,7 +264,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         cs->exception_index = POWERPC_EXCP_ALIGN;
         env->error_code = POWERPC_EXCP_ALIGN_FP;
         env->spr[SPR_DAR] = eaddr;
-        return 1;
+        return false;
     case ACCESS_RES:
         /* lwarx, ldarx or srwcx. */
         env->error_code = 0;
@@ -267,7 +274,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x04000000;
         }
-        return 1;
+        return false;
     case ACCESS_CACHE:
         /*
          * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
@@ -276,7 +283,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          * no-op, it's quite easy :-)
          */
         *raddr = eaddr;
-        return 0;
+        return true;
     case ACCESS_EXT:
         /* eciwx or ecowx */
         cs->exception_index = POWERPC_EXCP_DSI;
@@ -287,16 +294,18 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x04100000;
         }
-        return 1;
+        return false;
     default:
-        cpu_abort(cs, "ERROR: instruction should not need "
-                 "address translation\n");
+        cpu_abort(cs, "ERROR: insn should not need address translation\n");
     }
-    if ((access_type == MMU_DATA_STORE || key != 1) &&
-        (access_type == MMU_DATA_LOAD || key != 0)) {
+
+    *prot = key ? PAGE_READ | PAGE_WRITE : PAGE_READ;
+    if (*prot & prot_for_access_type(access_type)) {
         *raddr = eaddr;
-        return 0;
-    } else {
+        return true;
+    }
+
+    if (guest_visible) {
         cs->exception_index = POWERPC_EXCP_DSI;
         env->error_code = 0;
         env->spr[SPR_DAR] = eaddr;
@@ -305,8 +314,8 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x08000000;
         }
-        return 1;
     }
+    return false;
 }
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash)
@@ -415,8 +424,10 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn & ~mask) | (eaddr & mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -427,43 +438,43 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     int need_prot;
     hwaddr raddr;
 
-    need_prot = prot_for_access_type(access_type);
+    /* There are no hash32 large pages. */
+    *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
     if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /* Translation is off */
-        raddr = eaddr;
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+        *raddrp = eaddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return true;
     }
 
+    need_prot = prot_for_access_type(access_type);
+
     /* 2. Check Block Address Translation entries (BATs) */
     if (env->nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, &prot);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
         if (raddr != -1) {
-            if (need_prot & ~prot) {
-                if (access_type == MMU_INST_FETCH) {
-                    cs->exception_index = POWERPC_EXCP_ISI;
-                    env->error_code = 0x08000000;
-                } else {
-                    cs->exception_index = POWERPC_EXCP_DSI;
-                    env->error_code = 0;
-                    env->spr[SPR_DAR] = eaddr;
-                    if (access_type == MMU_DATA_STORE) {
-                        env->spr[SPR_DSISR] = 0x0a000000;
+            if (need_prot & ~*protp) {
+                if (guest_visible) {
+                    if (access_type == MMU_INST_FETCH) {
+                        cs->exception_index = POWERPC_EXCP_ISI;
+                        env->error_code = 0x08000000;
                     } else {
-                        env->spr[SPR_DSISR] = 0x08000000;
+                        cs->exception_index = POWERPC_EXCP_DSI;
+                        env->error_code = 0;
+                        env->spr[SPR_DAR] = eaddr;
+                        if (access_type == MMU_DATA_STORE) {
+                            env->spr[SPR_DSISR] = 0x0a000000;
+                        } else {
+                            env->spr[SPR_DSISR] = 0x08000000;
+                        }
                     }
                 }
-                return 1;
+                return false;
             }
-
-            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
-                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
+            *raddrp = raddr;
+            return true;
         }
     }
 
@@ -472,42 +483,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
-        if (ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                    &raddr, &prot) == 0) {
-            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
-                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
-        } else {
-            return 1;
-        }
+        return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
+                                       raddrp, protp, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH && (sr & SR32_NX)) {
-        cs->exception_index = POWERPC_EXCP_ISI;
-        env->error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs->exception_index = POWERPC_EXCP_ISI;
+            env->error_code = 0x10000000;
+        }
+        return false;
     }
 
     /* 6. Locate the PTE in the hash table */
     pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
     if (pte_offset == -1) {
-        if (access_type == MMU_INST_FETCH) {
-            cs->exception_index = POWERPC_EXCP_ISI;
-            env->error_code = 0x40000000;
-        } else {
-            cs->exception_index = POWERPC_EXCP_DSI;
-            env->error_code = 0;
-            env->spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env->spr[SPR_DSISR] = 0x42000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs->exception_index = POWERPC_EXCP_ISI;
+                env->error_code = 0x40000000;
             } else {
-                env->spr[SPR_DSISR] = 0x40000000;
+                cs->exception_index = POWERPC_EXCP_DSI;
+                env->error_code = 0;
+                env->spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env->spr[SPR_DSISR] = 0x42000000;
+                } else {
+                    env->spr[SPR_DSISR] = 0x40000000;
+                }
             }
         }
-
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                 "found PTE at offset %08" HWADDR_PRIx "\n", pte_offset);
@@ -519,20 +526,22 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (access_type == MMU_INST_FETCH) {
-            cs->exception_index = POWERPC_EXCP_ISI;
-            env->error_code = 0x08000000;
-        } else {
-            cs->exception_index = POWERPC_EXCP_DSI;
-            env->error_code = 0;
-            env->spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env->spr[SPR_DSISR] = 0x0a000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs->exception_index = POWERPC_EXCP_ISI;
+                env->error_code = 0x08000000;
             } else {
-                env->spr[SPR_DSISR] = 0x08000000;
+                cs->exception_index = POWERPC_EXCP_DSI;
+                env->error_code = 0;
+                env->spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env->spr[SPR_DSISR] = 0x0a000000;
+                } else {
+                    env->spr[SPR_DSISR] = 0x08000000;
+                }
             }
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -556,45 +565,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 9. Determine the real address from the PTE */
 
-    raddr = ppc_hash32_pte_raddr(sr, pte, eaddr);
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
-
-    return 0;
+    *raddrp = ppc_hash32_pte_raddr(sr, pte, eaddr);
+    *protp = prot;
+    return true;
 }
 
-hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
 {
-    CPUPPCState *env = &cpu->env;
-    target_ulong sr;
-    hwaddr pte_offset;
-    ppc_hash_pte32_t pte;
-    int prot;
-
-    if (msr_dr == 0) {
-        /* Translation is off */
-        return eaddr;
-    }
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
 
-    if (env->nb_BATs != 0) {
-        hwaddr raddr = ppc_hash32_bat_lookup(cpu, eaddr, 0, &prot);
-        if (raddr != -1) {
-            return raddr;
-        }
+    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
+    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &raddr,
+                           &page_size, &prot, true)) {
+        return 1;
     }
 
-    sr = env->sr[eaddr >> 28];
+    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
+                 prot, mmu_idx, 1UL << page_size);
+    return 0;
+}
 
-    if (sr & SR32_T) {
-        /* FIXME: Add suitable debug support for Direct Store segments */
-        return -1;
-    }
+hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
+{
+    int psize, prot;
+    hwaddr raddr;
 
-    pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
-    if (pte_offset == -1) {
+    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                           &psize, &prot, false)) {
         return -1;
     }
 
-    return ppc_hash32_pte_raddr(sr, pte, eaddr) & TARGET_PAGE_MASK;
+    return raddr & TARGET_PAGE_MASK;
 }
-- 
2.31.1


