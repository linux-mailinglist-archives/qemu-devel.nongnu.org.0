Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A1388F0B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:26:36 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMDb-0001VP-KG
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhf-0002EK-UY; Wed, 19 May 2021 08:53:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36347 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhc-0001UD-Q4; Wed, 19 May 2021 08:53:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnm2dghz9t5H; Wed, 19 May 2021 22:52:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428732;
 bh=2WfaI/nHHhODmul+aYqPpLdoPiebuDbaRAnku3lKfC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YgfGhhWOxtlRfrj190kP81Ny0nZHpuRNEnqnKCDj44hWO1PHvAupkxy48EMRmL6n2
 QSePwxCZrDv7eWxvxR5JTT4X1A3RrXs6Q/qjXrIAZMAkAjX9/VupagzSX8EF3g5Y47
 c2qZX5aEOhn4vHPWW+mdRgYb2UkVGeNR4nlQRPEA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 35/48] target/ppc: Use MMUAccessType in mmu-radix64.c
Date: Wed, 19 May 2021 22:51:35 +1000
Message-Id: <20210519125148.27720-36-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We must leave the 'int rwx' parameter to ppc_radix64_handle_mmu_fault
for now, but will clean that up later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-3-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-radix64.c | 119 ++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 45 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 646b9afb7b..7972153f23 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -75,71 +75,94 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
     return true;
 }
 
-static void ppc_radix64_raise_segi(PowerPCCPU *cpu, int rwx, vaddr eaddr)
+static void ppc_radix64_raise_segi(PowerPCCPU *cpu, MMUAccessType access_type,
+                                   vaddr eaddr)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* Instruction Segment Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* Instruction Segment Interrupt */
         cs->exception_index = POWERPC_EXCP_ISEG;
-    } else { /* Data Segment Interrupt */
+        break;
+    case MMU_DATA_STORE:
+    case MMU_DATA_LOAD:
+        /* Data Segment Interrupt */
         cs->exception_index = POWERPC_EXCP_DSEG;
         env->spr[SPR_DAR] = eaddr;
+        break;
+    default:
+        g_assert_not_reached();
     }
     env->error_code = 0;
 }
 
-static void ppc_radix64_raise_si(PowerPCCPU *cpu, int rwx, vaddr eaddr,
-                                uint32_t cause)
+static void ppc_radix64_raise_si(PowerPCCPU *cpu, MMUAccessType access_type,
+                                 vaddr eaddr, uint32_t cause)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* Instruction Storage Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* Instruction Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_ISI;
         env->error_code = cause;
-    } else { /* Data Storage Interrupt */
+        break;
+    case MMU_DATA_STORE:
+        cause |= DSISR_ISSTORE;
+        /* fall through */
+    case MMU_DATA_LOAD:
+        /* Data Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_DSI;
-        if (rwx == 1) { /* Write -> Store */
-            cause |= DSISR_ISSTORE;
-        }
         env->spr[SPR_DSISR] = cause;
         env->spr[SPR_DAR] = eaddr;
         env->error_code = 0;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, int rwx, vaddr eaddr,
-                                  hwaddr g_raddr, uint32_t cause)
+static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
+                                  vaddr eaddr, hwaddr g_raddr, uint32_t cause)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
-    if (rwx == 2) { /* H Instruction Storage Interrupt */
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        /* H Instruction Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_HISI;
         env->spr[SPR_ASDR] = g_raddr;
         env->error_code = cause;
-    } else { /* H Data Storage Interrupt */
+        break;
+    case MMU_DATA_STORE:
+        cause |= DSISR_ISSTORE;
+        /* fall through */
+    case MMU_DATA_LOAD:
+        /* H Data Storage Interrupt */
         cs->exception_index = POWERPC_EXCP_HDSI;
-        if (rwx == 1) { /* Write -> Store */
-            cause |= DSISR_ISSTORE;
-        }
         env->spr[SPR_HDSISR] = cause;
         env->spr[SPR_HDAR] = eaddr;
         env->spr[SPR_ASDR] = g_raddr;
         env->error_code = 0;
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
-                                   int *fault_cause, int *prot,
+static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
+                                   uint64_t pte, int *fault_cause, int *prot,
                                    bool partition_scoped)
 {
     CPUPPCState *env = &cpu->env;
     int need_prot;
 
     /* Check Page Attributes (pte58:59) */
-    if (((pte & R_PTE_ATT) == R_PTE_ATT_NI_IO) && (rwx == 2)) {
+    if ((pte & R_PTE_ATT) == R_PTE_ATT_NI_IO && access_type == MMU_INST_FETCH) {
         /*
          * Radix PTE entries with the non-idempotent I/O attribute are treated
          * as guarded storage
@@ -159,7 +182,7 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
     }
 
     /* Check if requested access type is allowed */
-    need_prot = prot_for_access_type(rwx);
+    need_prot = prot_for_access_type(access_type);
     if (need_prot & ~*prot) { /* Page Protected for that Access */
         *fault_cause |= DSISR_PROTFAULT;
         return true;
@@ -168,15 +191,15 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, int rwx, uint64_t pte,
     return false;
 }
 
-static void ppc_radix64_set_rc(PowerPCCPU *cpu, int rwx, uint64_t pte,
-                               hwaddr pte_addr, int *prot)
+static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
+                               uint64_t pte, hwaddr pte_addr, int *prot)
 {
     CPUState *cs = CPU(cpu);
     uint64_t npte;
 
     npte = pte | R_PTE_R; /* Always set reference bit */
 
-    if (rwx == 1) { /* Store/Write */
+    if (access_type == MMU_DATA_STORE) { /* Store/Write */
         npte |= R_PTE_C; /* Set change bit */
     } else {
         /*
@@ -271,7 +294,8 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     return true;
 }
 
-static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu, int rwx,
+static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
+                                              MMUAccessType access_type,
                                               vaddr eaddr, hwaddr g_raddr,
                                               ppc_v3_pate_t pate,
                                               hwaddr *h_raddr, int *h_prot,
@@ -287,24 +311,25 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu, int rwx,
     if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
                               pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
                               &pte, &fault_cause, &pte_addr) ||
-        ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, h_prot, true)) {
+        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_prot, true)) {
         if (pde_addr) { /* address being translated was that of a guest pde */
             fault_cause |= DSISR_PRTABLE_FAULT;
         }
         if (guest_visible) {
-            ppc_radix64_raise_hsi(cpu, rwx, eaddr, g_raddr, fault_cause);
+            ppc_radix64_raise_hsi(cpu, access_type, eaddr, g_raddr, fault_cause);
         }
         return 1;
     }
 
     if (guest_visible) {
-        ppc_radix64_set_rc(cpu, rwx, pte, pte_addr, h_prot);
+        ppc_radix64_set_rc(cpu, access_type, pte, pte_addr, h_prot);
     }
 
     return 0;
 }
 
-static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
+static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
+                                            MMUAccessType access_type,
                                             vaddr eaddr, uint64_t pid,
                                             ppc_v3_pate_t pate, hwaddr *g_raddr,
                                             int *g_prot, int *g_page_size,
@@ -323,7 +348,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
     if (offset >= size) {
         /* offset exceeds size of the process table */
         if (guest_visible) {
-            ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_NOPTE);
+            ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
         }
         return 1;
     }
@@ -364,7 +389,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
         if (ret) {
             /* No valid PTE */
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
             }
             return ret;
         }
@@ -393,7 +418,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
             if (ret) {
                 /* No valid pte */
                 if (guest_visible) {
-                    ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+                    ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
                 }
                 return ret;
             }
@@ -407,16 +432,16 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
         *g_raddr = (rpn & ~mask) | (eaddr & mask);
     }
 
-    if (ppc_radix64_check_prot(cpu, rwx, pte, &fault_cause, g_prot, false)) {
+    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_prot, false)) {
         /* Access denied due to protection */
         if (guest_visible) {
-            ppc_radix64_raise_si(cpu, rwx, eaddr, fault_cause);
+            ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
         }
         return 1;
     }
 
     if (guest_visible) {
-        ppc_radix64_set_rc(cpu, rwx, pte, pte_addr, g_prot);
+        ppc_radix64_set_rc(cpu, access_type, pte, pte_addr, g_prot);
     }
 
     return 0;
@@ -439,7 +464,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
+static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
                              bool relocation,
                              hwaddr *raddr, int *psizep, int *protp,
                              bool guest_visible)
@@ -453,7 +479,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     /* Virtual Mode Access - get the fully qualified address */
     if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &pid)) {
         if (guest_visible) {
-            ppc_radix64_raise_segi(cpu, rwx, eaddr);
+            ppc_radix64_raise_segi(cpu, access_type, eaddr);
         }
         return 1;
     }
@@ -466,13 +492,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_NOPTE);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
             }
             return 1;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, rwx, eaddr, DSISR_R_BADCONFIG);
+                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
             }
             return 1;
         }
@@ -490,7 +516,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
      * - Translates an effective address to a guest real address.
      */
     if (relocation) {
-        int ret = ppc_radix64_process_scoped_xlate(cpu, rwx, eaddr, pid,
+        int ret = ppc_radix64_process_scoped_xlate(cpu, access_type, eaddr, pid,
                                                    pate, &g_raddr, &prot,
                                                    &psize, guest_visible);
         if (ret) {
@@ -513,9 +539,10 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
         if (lpid || !msr_hv) {
             int ret;
 
-            ret = ppc_radix64_partition_scoped_xlate(cpu, rwx, eaddr, g_raddr,
-                                                     pate, raddr, &prot, &psize,
-                                                     false, guest_visible);
+            ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
+                                                     g_raddr, pate, raddr,
+                                                     &prot, &psize, false,
+                                                     guest_visible);
             if (ret) {
                 return ret;
             }
@@ -536,12 +563,14 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     CPUPPCState *env = &cpu->env;
     int page_size, prot;
     bool relocation;
+    MMUAccessType access_type;
     hwaddr raddr;
 
     assert(!(msr_hv && cpu->vhyp));
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
+    access_type = rwx;
 
-    relocation = ((rwx == 2) && (msr_ir == 1)) || ((rwx != 2) && (msr_dr == 1));
+    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
     /* HV or virtual hypervisor Real Mode Access */
     if (!relocation && (msr_hv || cpu->vhyp)) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
@@ -570,7 +599,7 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     }
 
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, rwx, relocation, &raddr,
+    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
                           &page_size, &prot, true)) {
         return 1;
     }
-- 
2.31.1


