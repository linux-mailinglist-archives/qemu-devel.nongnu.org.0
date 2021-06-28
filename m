Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB73B5F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:39:47 +0200 (CEST)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrUI-0007M7-3A
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRO-00049n-Uk; Mon, 28 Jun 2021 09:36:46 -0400
Received: from [201.28.113.2] (port=33408 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxrRM-0003mD-Gx; Mon, 28 Jun 2021 09:36:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 28 Jun 2021 10:36:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 50FE5800976;
 Mon, 28 Jun 2021 10:36:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
Date: Mon, 28 Jun 2021 10:36:09 -0300
Message-Id: <20210628133610.1143-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 28 Jun 2021 13:36:32.0468 (UTC)
 FILETIME=[9B865940:01D76C22]
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

Changed hash32 address translation to use the supplied mmu_idx, instead
of using what was stored in the msr, for parity purposes (radix64
already uses that).

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/mmu-hash32.c | 40 +++++++++++++++++++---------------------
 target/ppc/mmu-hash32.h |  2 +-
 target/ppc/mmu_helper.c |  2 +-
 3 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 6a07c345e4..0691d553a3 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -25,6 +25,7 @@
 #include "kvm_ppc.h"
 #include "internal.h"
 #include "mmu-hash32.h"
+#include "mmu-book3s-v3.h"
 #include "exec/log.h"
 
 /* #define DEBUG_BAT */
@@ -86,25 +87,22 @@ static int ppc_hash32_pp_prot(int key, int pp, int nx)
     return prot;
 }
 
-static int ppc_hash32_pte_prot(PowerPCCPU *cpu,
+static int ppc_hash32_pte_prot(int mmu_idx,
                                target_ulong sr, ppc_hash_pte32_t pte)
 {
-    CPUPPCState *env = &cpu->env;
     unsigned pp, key;
 
-    key = !!(msr_pr ? (sr & SR32_KP) : (sr & SR32_KS));
+    key = !!(mmuidx_pr(mmu_idx) ? (sr & SR32_KP) : (sr & SR32_KS));
     pp = pte.pte1 & HPTE32_R_PP;
 
     return ppc_hash32_pp_prot(key, pp, !!(sr & SR32_NX));
 }
 
-static target_ulong hash32_bat_size(PowerPCCPU *cpu,
+static target_ulong hash32_bat_size(int mmu_idx,
                                     target_ulong batu, target_ulong batl)
 {
-    CPUPPCState *env = &cpu->env;
-
-    if ((msr_pr && !(batu & BATU32_VP))
-        || (!msr_pr && !(batu & BATU32_VS))) {
+    if ((mmuidx_pr(mmu_idx) && !(batu & BATU32_VP))
+        || (!mmuidx_pr(mmu_idx) && !(batu & BATU32_VS))) {
         return 0;
     }
 
@@ -137,14 +135,13 @@ static target_ulong hash32_bat_601_size(PowerPCCPU *cpu,
     return BATU32_BEPI & ~((batl & BATL32_601_BL) << 17);
 }
 
-static int hash32_bat_601_prot(PowerPCCPU *cpu,
+static int hash32_bat_601_prot(int mmu_idx,
                                target_ulong batu, target_ulong batl)
 {
-    CPUPPCState *env = &cpu->env;
     int key, pp;
 
     pp = batu & BATU32_601_PP;
-    if (msr_pr == 0) {
+    if (mmuidx_pr(mmu_idx) == 0) {
         key = !!(batu & BATU32_601_KS);
     } else {
         key = !!(batu & BATU32_601_KP);
@@ -153,7 +150,8 @@ static int hash32_bat_601_prot(PowerPCCPU *cpu,
 }
 
 static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
-                                    MMUAccessType access_type, int *prot)
+                                    MMUAccessType access_type, int *prot,
+                                    int mmu_idx)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong *BATlt, *BATut;
@@ -177,7 +175,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
         if (unlikely(env->mmu_model == POWERPC_MMU_601)) {
             mask = hash32_bat_601_size(cpu, batu, batl);
         } else {
-            mask = hash32_bat_size(cpu, batu, batl);
+            mask = hash32_bat_size(mmu_idx, batu, batl);
         }
         LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                  " BATl " TARGET_FMT_lx "\n", __func__,
@@ -187,7 +185,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
             hwaddr raddr = (batl & mask) | (ea & ~mask);
 
             if (unlikely(env->mmu_model == POWERPC_MMU_601)) {
-                *prot = hash32_bat_601_prot(cpu, batu, batl);
+                *prot = hash32_bat_601_prot(mmu_idx, batu, batl);
             } else {
                 *prot = hash32_bat_prot(cpu, batu, batl);
             }
@@ -221,12 +219,12 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
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
 
@@ -425,7 +423,7 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
 }
 
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
@@ -441,7 +439,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
-    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
+    if (mmuidx_real(mmu_idx)) {
         /* Translation is off */
         *raddrp = eaddr;
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -452,7 +450,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
 
     /* 2. Check Block Address Translation entries (BATs) */
     if (env->nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp, mmu_idx);
         if (raddr != -1) {
             if (need_prot & ~*protp) {
                 if (guest_visible) {
@@ -483,7 +481,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
         return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                       raddrp, protp, guest_visible);
+                                       raddrp, protp, mmu_idx, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
@@ -520,7 +518,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
 
     /* 7. Check access permissions */
 
-    prot = ppc_hash32_pte_prot(cpu, sr, pte);
+    prot = ppc_hash32_pte_prot(mmu_idx, sr, pte);
 
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


