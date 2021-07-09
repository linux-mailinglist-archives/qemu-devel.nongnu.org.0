Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CA3C1EDD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:25:52 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j1M-0005SH-0d
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itd-0000z4-R7; Fri, 09 Jul 2021 01:17:53 -0400
Received: from ozlabs.org ([203.11.71.1]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itb-0001vb-4D; Fri, 09 Jul 2021 01:17:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd2Hplz9sXV; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=Iku9vdl3Hq8CB6046m3NqY9iWp2JnMKsY7XF89V88Xw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cEoDTa1+WMC4ekWSs7Iznj7tssMBzgzUTPydCSUX+bXPFHowEvZ+HpClYuka4/8x1
 55R9fwiUljeTQQI3bJGIflkLR5IYjuzeyWSJzOjUkVr3dQ2EMXmBZ7MhvRYyp629/8
 7dgYc6dvKQWBGpnKJOvVZrtjqoB3Aw7F2k543CUY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/33] target/ppc: Push real-mode handling into
 ppc_radix64_xlate
Date: Fri,  9 Jul 2021 15:17:01 +1000
Message-Id: <20210709051728.170203-7-david@gibson.dropbear.id.au>
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

This removes some incomplete duplication between
ppc_radix64_handle_mmu_fault and ppc_radix64_get_phys_page_debug.
The former was correct wrt SPR_HRMOR and the latter was not.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-4-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


