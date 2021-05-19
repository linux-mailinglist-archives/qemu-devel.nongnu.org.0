Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3E388F09
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:26:23 +0200 (CEST)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMDO-0000yQ-Qo
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhj-0002G3-Qk; Wed, 19 May 2021 08:53:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43857 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhg-0001Wu-Ns; Wed, 19 May 2021 08:53:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnn1fSCz9t5m; Wed, 19 May 2021 22:52:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428733;
 bh=jilhsORAop6g7BL+ey4S6C7MdUfCRRO3/4h7TeQoVKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQekalPSwRjPrDqB1fgEk6W56poTRsvRqlR6s/XO9c3JOJ1uPixhWSvPF/oOFLB6i
 zp1eqjlkUNrwnWnIGMATace2IYPyt6RpCAIKr3Z4PHtHPPMq/yyXHDl99obazxhJEr
 pLr29/Kzs3OVuJxy8FDaR8CxFQluyeVaTItgwIKw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 37/48] target/ppc: Use MMUAccessType in mmu-hash32.c
Date: Wed, 19 May 2021 22:51:37 +1000
Message-Id: <20210519125148.27720-38-david@gibson.dropbear.id.au>
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

We must leave the 'int rwx' parameter to ppc_hash32_handle_mmu_fault
for now, but will clean that up later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-5-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-hash32.c | 53 ++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 233a66658e..744a763f44 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -153,16 +153,17 @@ static int hash32_bat_601_prot(PowerPCCPU *cpu,
     return ppc_hash32_pp_prot(key, pp, 0);
 }
 
-static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea, int rwx,
-                                    int *prot)
+static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
+                                    MMUAccessType access_type, int *prot)
 {
     CPUPPCState *env = &cpu->env;
     target_ulong *BATlt, *BATut;
+    bool ifetch = access_type == MMU_INST_FETCH;
     int i;
 
     LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
-             rwx == 2 ? 'I' : 'D', ea);
-    if (rwx == 2) {
+             ifetch ? 'I' : 'D', ea);
+    if (ifetch) {
         BATlt = env->IBAT[1];
         BATut = env->IBAT[0];
     } else {
@@ -181,7 +182,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea, int rwx,
         }
         LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                  " BATl " TARGET_FMT_lx "\n", __func__,
-                 type == ACCESS_CODE ? 'I' : 'D', i, ea, batu, batl);
+                 ifetch ? 'I' : 'D', i, ea, batu, batl);
 
         if (mask && ((ea & mask) == (batu & BATU32_BEPI))) {
             hwaddr raddr = (batl & mask) | (ea & ~mask);
@@ -209,7 +210,7 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea, int rwx,
             LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                      " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
                      TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                     __func__, type == ACCESS_CODE ? 'I' : 'D', i, ea,
+                     __func__, ifetch ? 'I' : 'D', i, ea,
                      *BATu, *BATl, BEPIu, BEPIl, bl);
         }
     }
@@ -219,7 +220,8 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea, int rwx,
 }
 
 static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
-                                   target_ulong eaddr, int rwx,
+                                   target_ulong eaddr,
+                                   MMUAccessType access_type,
                                    hwaddr *raddr, int *prot)
 {
     CPUState *cs = CPU(cpu);
@@ -240,7 +242,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         return 0;
     }
 
-    if (rwx == 2) {
+    if (access_type == MMU_INST_FETCH) {
         /* No code fetch is allowed in direct-store areas */
         cs->exception_index = POWERPC_EXCP_ISI;
         env->error_code = 0x10000000;
@@ -261,7 +263,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         /* lwarx, ldarx or srwcx. */
         env->error_code = 0;
         env->spr[SPR_DAR] = eaddr;
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             env->spr[SPR_DSISR] = 0x06000000;
         } else {
             env->spr[SPR_DSISR] = 0x04000000;
@@ -281,7 +283,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         cs->exception_index = POWERPC_EXCP_DSI;
         env->error_code = 0;
         env->spr[SPR_DAR] = eaddr;
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             env->spr[SPR_DSISR] = 0x06100000;
         } else {
             env->spr[SPR_DSISR] = 0x04100000;
@@ -291,14 +293,15 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         cpu_abort(cs, "ERROR: instruction should not need "
                  "address translation\n");
     }
-    if ((rwx == 1 || key != 1) && (rwx == 0 || key != 0)) {
+    if ((access_type == MMU_DATA_STORE || key != 1) &&
+        (access_type == MMU_DATA_LOAD || key != 0)) {
         *raddr = eaddr;
         return 0;
     } else {
         cs->exception_index = POWERPC_EXCP_DSI;
         env->error_code = 0;
         env->spr[SPR_DAR] = eaddr;
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             env->spr[SPR_DSISR] = 0x0a000000;
         } else {
             env->spr[SPR_DSISR] = 0x08000000;
@@ -423,13 +426,15 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     ppc_hash_pte32_t pte;
     int prot;
     int need_prot;
+    MMUAccessType access_type;
     hwaddr raddr;
 
     assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    need_prot = prot_for_access_type(rwx);
+    access_type = rwx;
+    need_prot = prot_for_access_type(access_type);
 
     /* 1. Handle real mode accesses */
-    if (((rwx == 2) && (msr_ir == 0)) || ((rwx != 2) && (msr_dr == 0))) {
+    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /* Translation is off */
         raddr = eaddr;
         tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
@@ -440,17 +445,17 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
 
     /* 2. Check Block Address Translation entries (BATs) */
     if (env->nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, rwx, &prot);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, &prot);
         if (raddr != -1) {
             if (need_prot & ~prot) {
-                if (rwx == 2) {
+                if (access_type == MMU_INST_FETCH) {
                     cs->exception_index = POWERPC_EXCP_ISI;
                     env->error_code = 0x08000000;
                 } else {
                     cs->exception_index = POWERPC_EXCP_DSI;
                     env->error_code = 0;
                     env->spr[SPR_DAR] = eaddr;
-                    if (rwx == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x0a000000;
                     } else {
                         env->spr[SPR_DSISR] = 0x08000000;
@@ -471,7 +476,7 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
 
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
-        if (ppc_hash32_direct_store(cpu, sr, eaddr, rwx,
+        if (ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
                                     &raddr, &prot) == 0) {
             tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
                          raddr & TARGET_PAGE_MASK, prot, mmu_idx,
@@ -483,7 +488,7 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     }
 
     /* 5. Check for segment level no-execute violation */
-    if ((rwx == 2) && (sr & SR32_NX)) {
+    if (access_type == MMU_INST_FETCH && (sr & SR32_NX)) {
         cs->exception_index = POWERPC_EXCP_ISI;
         env->error_code = 0x10000000;
         return 1;
@@ -492,14 +497,14 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     /* 6. Locate the PTE in the hash table */
     pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
     if (pte_offset == -1) {
-        if (rwx == 2) {
+        if (access_type == MMU_INST_FETCH) {
             cs->exception_index = POWERPC_EXCP_ISI;
             env->error_code = 0x40000000;
         } else {
             cs->exception_index = POWERPC_EXCP_DSI;
             env->error_code = 0;
             env->spr[SPR_DAR] = eaddr;
-            if (rwx == 1) {
+            if (access_type == MMU_DATA_STORE) {
                 env->spr[SPR_DSISR] = 0x42000000;
             } else {
                 env->spr[SPR_DSISR] = 0x40000000;
@@ -518,14 +523,14 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (rwx == 2) {
+        if (access_type == MMU_INST_FETCH) {
             cs->exception_index = POWERPC_EXCP_ISI;
             env->error_code = 0x08000000;
         } else {
             cs->exception_index = POWERPC_EXCP_DSI;
             env->error_code = 0;
             env->spr[SPR_DAR] = eaddr;
-            if (rwx == 1) {
+            if (access_type == MMU_DATA_STORE) {
                 env->spr[SPR_DSISR] = 0x0a000000;
             } else {
                 env->spr[SPR_DSISR] = 0x08000000;
@@ -542,7 +547,7 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
         ppc_hash32_set_r(cpu, pte_offset, pte.pte1);
     }
     if (!(pte.pte1 & HPTE32_R_C)) {
-        if (rwx == 1) {
+        if (access_type == MMU_DATA_STORE) {
             ppc_hash32_set_c(cpu, pte_offset, pte.pte1);
         } else {
             /*
-- 
2.31.1


