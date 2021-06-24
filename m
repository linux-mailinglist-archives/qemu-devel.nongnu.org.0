Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B53B37C2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:25:53 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVv6-0003VX-Ew
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lwVr8-0001Ej-JH; Thu, 24 Jun 2021 16:21:46 -0400
Received: from [201.28.113.2] (port=25523 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lwVr7-0007T7-03; Thu, 24 Jun 2021 16:21:46 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 24 Jun 2021 17:21:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id BA3EB80107F;
 Thu, 24 Jun 2021 17:21:33 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
Date: Thu, 24 Jun 2021 17:21:29 -0300
Message-Id: <20210624202131.108255-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624202131.108255-1-bruno.larsen@eldorado.org.br>
References: <20210624202131.108255-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 24 Jun 2021 20:21:33.0893 (UTC)
 FILETIME=[86A68750:01D76936]
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
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changed hash32 address translation to use the supplied mmu_idx, instead
of using what was stored in the msr, for parity purposes (radix64
already uses that).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/mmu-hash32.c | 18 +++++++++---------
 target/ppc/mmu-hash32.h |  2 +-
 target/ppc/mmu_helper.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 6a07c345e4..9a477a181f 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -25,6 +25,7 @@
 #include "kvm_ppc.h"
 #include "internal.h"
 #include "mmu-hash32.h"
+#include "mmu-book3s-v3.h"
 #include "exec/log.h"
 
 /* #define DEBUG_BAT */
@@ -86,13 +87,12 @@ static int ppc_hash32_pp_prot(int key, int pp, int nx)
     return prot;
 }
 
-static int ppc_hash32_pte_prot(PowerPCCPU *cpu,
+static int ppc_hash32_pte_prot(PowerPCCPU *cpu, int mmu_idx,
                                target_ulong sr, ppc_hash_pte32_t pte)
 {
-    CPUPPCState *env = &cpu->env;
     unsigned pp, key;
 
-    key = !!(msr_pr ? (sr & SR32_KP) : (sr & SR32_KS));
+    key = !!(mmuidx_pr(mmu_idx) ? (sr & SR32_KP) : (sr & SR32_KS));
     pp = pte.pte1 & HPTE32_R_PP;
 
     return ppc_hash32_pp_prot(key, pp, !!(sr & SR32_NX));
@@ -221,12 +221,12 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
 static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
                                     target_ulong eaddr,
                                     MMUAccessType access_type,
-                                    hwaddr *raddr, int *prot,
+                                    hwaddr *raddr, int *prot, int mmu_idx,
                                     bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    int key = !!(msr_pr ? (sr & SR32_KP) : (sr & SR32_KS));
+    int key = !!(mmuidx_pr(mmu_idx) ? (sr & SR32_KP) : (sr & SR32_KS));
 
     qemu_log_mask(CPU_LOG_MMU, "direct store...\n");
 
@@ -425,7 +425,7 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
 }
 
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
@@ -441,7 +441,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
-    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
+    if (mmuidx_real(mmu_idx)) {
         /* Translation is off */
         *raddrp = eaddr;
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -483,7 +483,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
         return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                       raddrp, protp, guest_visible);
+                                       raddrp, protp, mmu_idx, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
@@ -520,7 +520,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
 
     /* 7. Check access permissions */
 
-    prot = ppc_hash32_pte_prot(cpu, sr, pte);
+    prot = ppc_hash32_pte_prot(cpu, mmu_idx, sr, pte);
 
     if (need_prot & ~prot) {
         /* Access right violation */
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 8694eccabd..807d9bc6e8 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -5,7 +5,7 @@
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible);
 
 /*
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9dcdf88597..a3381e1aa0 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2922,7 +2922,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_32B:
     case POWERPC_MMU_601:
         return ppc_hash32_xlate(cpu, eaddr, access_type,
-                                raddrp, psizep, protp, guest_visible);
+                                raddrp, psizep, protp, mmu_idx, guest_visible);
 
     default:
         return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,
-- 
2.17.1


