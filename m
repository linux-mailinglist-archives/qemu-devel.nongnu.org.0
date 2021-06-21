Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2C3AE97F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:58:02 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJV3-0003yb-94
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQ8-0007gG-VW; Mon, 21 Jun 2021 08:52:56 -0400
Received: from [201.28.113.2] (port=47857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQ7-0004nA-3A; Mon, 21 Jun 2021 08:52:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 97D9980005E;
 Mon, 21 Jun 2021 09:51:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] target/ppc: Push real-mode handling into
 ppc_radix64_xlate
Date: Mon, 21 Jun 2021 09:51:08 -0300
Message-Id: <20210621125115.67717-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 Jun 2021 12:51:39.0742 (UTC)
 FILETIME=[2DA4B7E0:01D7669C]
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

This removes some incomplete duplication between
ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
The former was correct wrt SPR_HRMOR and the latter was not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-radix64.c | 77 ++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 1c707d387d..dd5ae69052 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -465,7 +465,6 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  */
 static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                              MMUAccessType access_type,
-                             bool relocation,
                              hwaddr *raddr, int *psizep, int *protp,
                              bool guest_visible)
 {
@@ -474,6 +473,37 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     ppc_v3_pate_t pate;
     int psize, prot;
     hwaddr g_raddr;
+    bool relocation;
+
+    assert(!(msr_hv && cpu->vhyp));
+
+    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
+
+    /* HV or virtual hypervisor Real Mode Access */
+    if (!relocation && (msr_hv || cpu->vhyp)) {
+        /* In real mode top 4 effective addr bits (mostly) ignored */
+        *raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
+
+        /* In HV mode, add HRMOR if top EA bit is clear */
+        if (msr_hv || !env->has_hv_mode) {
+            if (!(eaddr >> 63)) {
+                *raddr |= env->spr[SPR_HRMOR];
+           }
+        }
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return 0;
+    }
+
+    /*
+     * Check UPRT (we avoid the check in real mode to deal with
+     * transitional states during kexec.
+     */
+    if (guest_visible && !ppc64_use_proc_tbl(cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "LPCR:UPRT not set in radix mode ! LPCR="
+                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
+    }
 
     /* Virtual Mode Access - get the fully qualified address */
     if (!ppc_radix64_get_fully_qualified_addr(&cpu->env, eaddr, &lpid, &pid)) {
@@ -559,43 +589,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                                  MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
-    CPUPPCState *env = &cpu->env;
     int page_size, prot;
-    bool relocation;
     hwaddr raddr;
 
-    assert(!(msr_hv && cpu->vhyp));
-
-    relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
-    /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (msr_hv || cpu->vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        raddr = eaddr & 0x0FFFFFFFFFFFFFFFULL;
-
-        /* In HV mode, add HRMOR if top EA bit is clear */
-        if (msr_hv || !env->has_hv_mode) {
-            if (!(eaddr >> 63)) {
-                raddr |= env->spr[SPR_HRMOR];
-           }
-        }
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
-    }
-
-    /*
-     * Check UPRT (we avoid the check in real mode to deal with
-     * transitional states during kexec.
-     */
-    if (!ppc64_use_proc_tbl(cpu)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "LPCR:UPRT not set in radix mode ! LPCR="
-                      TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
-    }
-
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, relocation, &raddr,
+    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
                           &page_size, &prot, true)) {
         return 1;
     }
@@ -607,18 +605,11 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &cpu->env;
     int psize, prot;
     hwaddr raddr;
 
-    /* Handle Real Mode */
-    if ((msr_dr == 0) && (msr_hv || cpu->vhyp)) {
-        /* In real mode top 4 effective addr bits (mostly) ignored */
-        return eaddr & 0x0FFFFFFFFFFFFFFFULL;
-    }
-
-    if (ppc_radix64_xlate(cpu, eaddr, 0, msr_dr, &raddr, &psize,
-                          &prot, false)) {
+    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                          &psize, &prot, false)) {
         return -1;
     }
 
-- 
2.17.1


