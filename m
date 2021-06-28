Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873B13B5F38
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:39:19 +0200 (CEST)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrTq-0006r0-Gk
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRL-00048w-E3; Mon, 28 Jun 2021 09:36:43 -0400
Received: from [201.28.113.2] (port=33408 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRI-0003mD-QK; Mon, 28 Jun 2021 09:36:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 28 Jun 2021 10:36:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 1A930800976;
 Mon, 28 Jun 2021 10:36:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] target/ppc: fix address translation bug for radix mmus
Date: Mon, 28 Jun 2021 10:36:08 -0300
Message-Id: <20210628133610.1143-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Jun 2021 13:36:32.0249 (UTC)
 FILETIME=[9B64EE90:01D76C22]
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
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit attempts to fix a technical hiccup first mentioned by Richard
Henderson in
https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html

To sumarize the hiccup here, when radix-style mmus are translating an
address, they might need to call a second level of translation, with
hypervisor privileges. However, the way it was being done up until
this point meant that the second level translation had the same
privileges as the first level. It could lead to a bug in address
translation when running KVM inside a TCG guest, but this bug was never
experienced by users, so this isn't as much a bug fix as it is a
correctness cleanup.

This patch attempts that cleanup by making radix64_*_xlate functions
receive the mmu_idx, and passing one with the correct permission for the
second level translation.

The mmuidx macros added by this patch are only correct for non-bookE
mmus, because BookE style set the IS and DS bits inverted and there
might be other subtle differences. However, there doesn't seem to be
BookE cpus that have radix-style mmus, so we left a comment there to
document the issue, in case a machine does have that and was missed.

As part of this cleanup, we now need to send the correct mmmu_idx
when calling get_phys_page_debug, otherwise we might not be able to see the
memory that the CPU could

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-book3s-v3.h | 13 +++++++++++++
 target/ppc/mmu-radix64.c   | 37 +++++++++++++++++++++----------------
 target/ppc/mmu-radix64.h   |  2 +-
 target/ppc/mmu_helper.c    |  8 +++++---
 4 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
index a1326df969..c89d0bccfd 100644
--- a/target/ppc/mmu-book3s-v3.h
+++ b/target/ppc/mmu-book3s-v3.h
@@ -47,6 +47,19 @@ struct prtb_entry {
     uint64_t prtbe0, prtbe1;
 };
 
+/*
+ * These correspond to the mmu_idx values computed in
+ * hreg_compute_hflags_value. See the tables therein
+ *
+ * They are here because some bits are inverted for BookE MMUs
+ * not necessarily because they only work for BookS. However,
+ * we only needed to change BookS MMUs, we left the functions
+ * here to avoid other possible bugs for untested MMUs
+ */
+static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
+static inline bool mmuidx_real(int idx) { return idx & 2; }
+static inline bool mmuidx_hv(int idx) { return idx & 4; }
+
 #ifdef TARGET_PPC64
 
 static inline bool ppc64_use_proc_tbl(PowerPCCPU *cpu)
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index cbd404bfa4..5b0e62e676 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -155,7 +155,7 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MMUAccessType access_type,
 
 static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
                                    uint64_t pte, int *fault_cause, int *prot,
-                                   bool partition_scoped)
+                                   int mmu_idx, bool partition_scoped)
 {
     CPUPPCState *env = &cpu->env;
     int need_prot;
@@ -173,7 +173,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access_type,
     /* Determine permissions allowed by Encoded Access Authority */
     if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
         *prot = 0;
-    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) {
+    } else if (mmuidx_pr(mmu_idx) || (pte & R_PTE_EAA_PRIV) ||
+               partition_scoped) {
         *prot = ppc_radix64_get_prot_eaa(pte);
     } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped */
         *prot = ppc_radix64_get_prot_eaa(pte);
@@ -299,7 +300,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
                                               ppc_v3_pate_t pate,
                                               hwaddr *h_raddr, int *h_prot,
                                               int *h_page_size, bool pde_addr,
-                                              bool guest_visible)
+                                              int mmu_idx, bool guest_visible)
 {
     int fault_cause = 0;
     hwaddr pte_addr;
@@ -310,7 +311,8 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
     if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_RPDB,
                               pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_size,
                               &pte, &fault_cause, &pte_addr) ||
-        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_prot, true)) {
+        ppc_radix64_check_prot(cpu, access_type, pte,
+                               &fault_cause, h_prot, mmu_idx, true)) {
         if (pde_addr) { /* address being translated was that of a guest pde */
             fault_cause |= DSISR_PRTABLE_FAULT;
         }
@@ -332,7 +334,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                                             vaddr eaddr, uint64_t pid,
                                             ppc_v3_pate_t pate, hwaddr *g_raddr,
                                             int *g_prot, int *g_page_size,
-                                            bool guest_visible)
+                                            int mmu_idx, bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -367,7 +369,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
                                                  pate, &h_raddr, &h_prot,
                                                  &h_page_size, true,
-                                                 guest_visible);
+            /* mmu_idx is 5 because we're translating from hypervisor scope */
+                                                 5, guest_visible);
         if (ret) {
             return ret;
         }
@@ -407,7 +410,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
             ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pte_addr,
                                                      pate, &h_raddr, &h_prot,
                                                      &h_page_size, true,
-                                                     guest_visible);
+            /* mmu_idx is 5 because we're translating from hypervisor scope */
+                                                     5, guest_visible);
             if (ret) {
                 return ret;
             }
@@ -431,7 +435,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         *g_raddr = (rpn & ~mask) | (eaddr & mask);
     }
 
-    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_prot, false)) {
+    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause,
+                               g_prot, mmu_idx, false)) {
         /* Access denied due to protection */
         if (guest_visible) {
             ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
@@ -464,7 +469,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              +-------------+----------------+---------------+
  */
 bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                       hwaddr *raddr, int *psizep, int *protp,
+                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
                        bool guest_visible)
 {
     CPUPPCState *env = &cpu->env;
@@ -474,17 +479,17 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     hwaddr g_raddr;
     bool relocation;
 
-    assert(!(msr_hv && cpu->vhyp));
+    assert(!(mmuidx_hv(mmu_idx) && cpu->vhyp));
 
-    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
+    relocation = !mmuidx_real(mmu_idx);
 
     /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (msr_hv || cpu->vhyp)) {
+    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
         *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
 
         /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env->has_hv_mode) {
+        if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
             if (!(eaddr >> 63)) {
                 *raddr |= env->spr[SPR_HRMOR];
            }
@@ -546,7 +551,7 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     if (relocation) {
         int ret = ppc_radix64_process_scoped_xlate(cpu, access_type, eaddr, pid,
                                                    pate, &g_raddr, &prot,
-                                                   &psize, guest_visible);
+                                                   &psize, mmu_idx, guest_visible);
         if (ret) {
             return false;
         }
@@ -564,13 +569,13 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
          * quadrants 1 or 2. Translates a guest real address to a host
          * real address.
          */
-        if (lpid || !msr_hv) {
+        if (lpid || !mmuidx_hv(mmu_idx)) {
             int ret;
 
             ret = ppc_radix64_partition_scoped_xlate(cpu, access_type, eaddr,
                                                      g_raddr, pate, raddr,
                                                      &prot, &psize, false,
-                                                     guest_visible);
+                                                     mmu_idx, guest_visible);
             if (ret) {
                 return false;
             }
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 6b13b89b64..b70357cf34 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -45,7 +45,7 @@
 #ifdef TARGET_PPC64
 
 bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                       hwaddr *raddr, int *psizep, int *protp,
+                       hwaddr *raddr, int *psizep, int *protp, int mmu_idx,
                        bool guest_visible);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ba1952c77d..9dcdf88597 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_3_00:
         if (ppc64_v3_radix(cpu)) {
             return ppc_radix64_xlate(cpu, eaddr, access_type,
-                                     raddrp, psizep, protp, guest_visible);
+                                     raddrp, psizep, protp, mmu_idx, guest_visible);
         }
         /* fall through */
     case POWERPC_MMU_64B:
@@ -2941,8 +2941,10 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
      * try an MMU_DATA_LOAD, we may not be able to read instructions
      * mapped by code TLBs, so we also try a MMU_INST_FETCH.
      */
-    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
-        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p,
+                  cpu_mmu_index(&cpu->env, false), false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
+                  cpu_mmu_index(&cpu->env, true), false)) {
         return raddr & TARGET_PAGE_MASK;
     }
     return -1;
-- 
2.17.1


