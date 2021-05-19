Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38781388F10
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:27:24 +0200 (CEST)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMEN-0003kd-AD
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhj-0002G5-R3; Wed, 19 May 2021 08:53:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36849 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhg-0001XG-S5; Wed, 19 May 2021 08:53:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnn3ZrDz9t6g; Wed, 19 May 2021 22:52:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428733;
 bh=8Cx0Xcv30VnMMMimRCOJL616awefrL2Emr7OvC8wVng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtQm5oYdvulYPgLT5shaM55ymslxYUZZQh8ByVOTg3GizjOXHIAuhkjN48f0wbhJW
 2kj2ltVqXf+R9LZV1NoQxvycouOgNg4WS2bgjeOmyulJ0XQf5ABA5ndV1fZhBnHXsp
 IbVuZKfo7EsS9J58Fo79B2mZo2BxwH+EFl9Xn7bk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 38/48] target/ppc: Rename access_type to type in mmu_helper.c
Date: Wed, 19 May 2021 22:51:38 +1000
Message-Id: <20210519125148.27720-39-david@gibson.dropbear.id.au>
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

The variable that holds ACCESS_INT, ACCESS_FLOAT, etc is
variously called 'int type' or 'int access_type' within
this file.  Standardize on 'int type' throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-6-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 64 ++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 06e1ebdcbc..dd2f1e2a90 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -126,11 +126,11 @@ static int pp_check(int key, int pp, int nx)
     return access;
 }
 
-static int check_prot(int prot, int rw, int access_type)
+static int check_prot(int prot, int rw, int type)
 {
     int ret;
 
-    if (access_type == ACCESS_CODE) {
+    if (type == ACCESS_CODE) {
         if (prot & PAGE_EXEC) {
             ret = 0;
         } else {
@@ -309,7 +309,7 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
 }
 
 static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
-                                   target_ulong eaddr, int rw, int access_type)
+                                   target_ulong eaddr, int rw, int type)
 {
     ppc6xx_tlb_t *tlb;
     int nr, best, way;
@@ -319,7 +319,7 @@ static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
     ret = -1; /* No TLB found */
     for (way = 0; way < env->nb_ways; way++) {
         nr = ppc6xx_tlb_getnum(env, eaddr, way,
-                               access_type == ACCESS_CODE ? 1 : 0);
+                               type == ACCESS_CODE ? 1 : 0);
         tlb = &env->tlb.tlb6[nr];
         /* This test "emulates" the PTE index match for hardware TLBs */
         if ((eaddr & TARGET_PAGE_MASK) != tlb->EPN) {
@@ -333,9 +333,9 @@ static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                   TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
                   pte_is_valid(tlb->pte0) ? "valid" : "inval",
                   tlb->EPN, eaddr, tlb->pte1,
-                  rw ? 'S' : 'L', access_type == ACCESS_CODE ? 'I' : 'D');
+                  rw ? 'S' : 'L', type == ACCESS_CODE ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
-                                     0, rw, access_type)) {
+                                     0, rw, type)) {
         case -3:
             /* TLB inconsistency */
             return -1;
@@ -683,7 +683,7 @@ static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
 
 static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                        target_ulong address, int rw,
-                                       int access_type)
+                                       int type)
 {
     ppcemb_tlb_t *tlb;
     hwaddr raddr;
@@ -727,7 +727,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         check_perms:
             /* Check from TLB entry */
             ctx->prot = tlb->prot;
-            ret = check_prot(ctx->prot, rw, access_type);
+            ret = check_prot(ctx->prot, rw, type);
             if (ret == -2) {
                 env->spr[SPR_40x_ESR] = 0;
             }
@@ -760,7 +760,7 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
 static inline int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
                                      hwaddr *raddr, int *prot,
                                      target_ulong address, int rw,
-                                     int access_type, int i)
+                                     int type, int i)
 {
     int ret, prot2;
 
@@ -794,7 +794,7 @@ found_tlb:
     }
 
     /* Check the address space */
-    if (access_type == ACCESS_CODE) {
+    if (type == ACCESS_CODE) {
         if (msr_ir != (tlb->attr & 1)) {
             LOG_SWTLB("%s: AS doesn't match\n", __func__);
             return -1;
@@ -829,7 +829,7 @@ found_tlb:
 
 static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                          target_ulong address, int rw,
-                                         int access_type)
+                                         int type)
 {
     ppcemb_tlb_t *tlb;
     hwaddr raddr;
@@ -840,7 +840,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     for (i = 0; i < env->nb_tlb; i++) {
         tlb = &env->tlb.tlbe[i];
         ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address, rw,
-                                 access_type, i);
+                                 type, i);
         if (ret != -1) {
             break;
         }
@@ -984,7 +984,7 @@ static bool mmubooke206_get_as(CPUPPCState *env,
 static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
                                  hwaddr *raddr, int *prot,
                                  target_ulong address, int rw,
-                                 int access_type, int mmu_idx)
+                                 int type, int mmu_idx)
 {
     int ret;
     int prot2 = 0;
@@ -1043,7 +1043,7 @@ found_tlb:
     }
 
     /* Check the address space and permissions */
-    if (access_type == ACCESS_CODE) {
+    if (type == ACCESS_CODE) {
         /* There is no way to fetch code using epid load */
         assert(!use_epid);
         if (msr_ir != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
@@ -1080,7 +1080,7 @@ found_tlb:
 
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                             target_ulong address, int rw,
-                                            int access_type, int mmu_idx)
+                                            int type, int mmu_idx)
 {
     ppcmas_tlb_t *tlb;
     hwaddr raddr;
@@ -1098,7 +1098,7 @@ static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                 continue;
             }
             ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                        rw, access_type, mmu_idx);
+                                        rw, type, mmu_idx);
             if (ret != -1) {
                 goto found_tlb;
             }
@@ -1415,12 +1415,12 @@ static inline int check_physical(CPUPPCState *env, mmu_ctx_t *ctx,
 
 static int get_physical_address_wtlb(
     CPUPPCState *env, mmu_ctx_t *ctx,
-    target_ulong eaddr, int rw, int access_type,
+    target_ulong eaddr, int rw, int type,
     int mmu_idx)
 {
     int ret = -1;
-    bool real_mode = (access_type == ACCESS_CODE && msr_ir == 0)
-        || (access_type != ACCESS_CODE && msr_dr == 0);
+    bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
+        || (type != ACCESS_CODE && msr_dr == 0);
 
     switch (env->mmu_model) {
     case POWERPC_MMU_SOFT_6xx:
@@ -1430,11 +1430,11 @@ static int get_physical_address_wtlb(
         } else {
             /* Try to find a BAT */
             if (env->nb_BATs != 0) {
-                ret = get_bat_6xx_tlb(env, ctx, eaddr, rw, access_type);
+                ret = get_bat_6xx_tlb(env, ctx, eaddr, rw, type);
             }
             if (ret < 0) {
                 /* We didn't match any BAT entry or don't have BATs */
-                ret = get_segment_6xx_tlb(env, ctx, eaddr, rw, access_type);
+                ret = get_segment_6xx_tlb(env, ctx, eaddr, rw, type);
             }
         }
         break;
@@ -1445,16 +1445,16 @@ static int get_physical_address_wtlb(
             ret = check_physical(env, ctx, eaddr, rw);
         } else {
             ret = mmu40x_get_physical_address(env, ctx, eaddr,
-                                              rw, access_type);
+                                              rw, type);
         }
         break;
     case POWERPC_MMU_BOOKE:
         ret = mmubooke_get_physical_address(env, ctx, eaddr,
-                                            rw, access_type);
+                                            rw, type);
         break;
     case POWERPC_MMU_BOOKE206:
         ret = mmubooke206_get_physical_address(env, ctx, eaddr, rw,
-                                               access_type, mmu_idx);
+                                               type, mmu_idx);
         break;
     case POWERPC_MMU_MPC8xx:
         /* XXX: TODO */
@@ -1478,9 +1478,9 @@ static int get_physical_address_wtlb(
 
 static int get_physical_address(
     CPUPPCState *env, mmu_ctx_t *ctx,
-    target_ulong eaddr, int rw, int access_type)
+    target_ulong eaddr, int rw, int type)
 {
-    return get_physical_address_wtlb(env, ctx, eaddr, rw, access_type, 0);
+    return get_physical_address_wtlb(env, ctx, eaddr, rw, type, 0);
 }
 
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -1584,19 +1584,19 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
     CPUState *cs = env_cpu(env);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     mmu_ctx_t ctx;
-    int access_type;
+    int type;
     int ret = 0;
 
     if (rw == 2) {
         /* code access */
         rw = 0;
-        access_type = ACCESS_CODE;
+        type = ACCESS_CODE;
     } else {
         /* data access */
-        access_type = env->access_type;
+        type = env->access_type;
     }
     ret = get_physical_address_wtlb(env, &ctx, address, rw,
-                                    access_type, mmu_idx);
+                                    type, mmu_idx);
     if (ret == 0) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
                      ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
@@ -1604,7 +1604,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
         ret = 0;
     } else if (ret < 0) {
         LOG_MMU_STATE(cs);
-        if (access_type == ACCESS_CODE) {
+        if (type == ACCESS_CODE) {
             switch (ret) {
             case -1:
                 /* No matches in page tables or TLB */
@@ -1761,7 +1761,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 break;
             case -4:
                 /* Direct store exception */
-                switch (access_type) {
+                switch (type) {
                 case ACCESS_FLOAT:
                     /* Floating point load/store */
                     cs->exception_index = POWERPC_EXCP_ALIGN;
-- 
2.31.1


