Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C313C1F0D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:44:51 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jJi-0006tZ-9q
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itl-0001GK-Vo; Fri, 09 Jul 2021 01:18:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47947 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iti-000210-UE; Fri, 09 Jul 2021 01:18:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf0Z2fz9t0Z; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=ezsD5meFiNROogxj/DEs8MK7R1EMrmcwNZLRqTlUPl4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AYfJOWcopSIHZ+YJyNY+Ot8ywNfQEd0YffAZViENG+ii+yxSjQQq1RbKyHF6bqAlZ
 A9qdqrYb6fgTlyRPpDO2fYauivZS3OIMXCj++/BaWfljweJP7jZb+yGd8bH7FbPAI1
 ZJr+7pcCwq/mcZIH3I2kmtEKegPQhQp9Okbjwnwc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/33] target/ppc: change ppc_hash32_xlate to use mmu_idx
Date: Fri,  9 Jul 2021 15:17:14 +1000
Message-Id: <20210709051728.170203-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Changed hash32 address translation to use the supplied mmu_idx, instead
of using what was stored in the msr, for parity purposes (radix64
already uses that) and for conceptual correctness, all the relevant
functions should always use the supplied mmu_idx, as there are no
guarantees that the mmu_idx stored in the CPU variable will not desync.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210706150316.21005-3-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash32.c | 40 +++++++++++++++++++---------------------
 target/ppc/mmu-hash32.h |  2 +-
 target/ppc/mmu_helper.c |  2 +-
 3 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 4edd5ffe14..3957aab2dc 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -25,6 +25,7 @@
 #include "kvm_ppc.h"
 #include "internal.h"
 #include "mmu-hash32.h"
+#include "mmu-books.h"
 #include "exec/log.h"
 
 /* #define DEBUG_BATS */
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
@@ -224,12 +222,12 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
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
 
@@ -428,7 +426,7 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
 }
 
 bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
-                      hwaddr *raddrp, int *psizep, int *protp,
+                      hwaddr *raddrp, int *psizep, int *protp, int mmu_idx,
                       bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
@@ -444,7 +442,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
-    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
+    if (mmuidx_real(mmu_idx)) {
         /* Translation is off */
         *raddrp = eaddr;
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -455,7 +453,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
 
     /* 2. Check Block Address Translation entries (BATs) */
     if (env->nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp, mmu_idx);
         if (raddr != -1) {
             if (need_prot & ~*protp) {
                 if (guest_visible) {
@@ -486,7 +484,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
         return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                       raddrp, protp, guest_visible);
+                                       raddrp, protp, mmu_idx, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
@@ -523,7 +521,7 @@ bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
 
     /* 7. Check access permissions */
 
-    prot = ppc_hash32_pte_prot(cpu, sr, pte);
+    prot = ppc_hash32_pte_prot(mmu_idx, sr, pte);
 
     if (need_prot & ~prot) {
         /* Access right violation */
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index c9f584b8ee..3892b693d6 100644
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
index 819ee27b62..47e9f9529e 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2914,7 +2914,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
     case POWERPC_MMU_32B:
     case POWERPC_MMU_601:
         return ppc_hash32_xlate(cpu, eaddr, access_type,
-                                raddrp, psizep, protp, guest_visible);
+                                raddrp, psizep, protp, mmu_idx, guest_visible);
 
     default:
         return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,
-- 
2.31.1


