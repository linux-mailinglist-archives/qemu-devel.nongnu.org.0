Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2EC388134
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:17:18 +0200 (CEST)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj69V-0002Ny-6h
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64L-0000Cf-CI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:57 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64I-00065u-Oh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:57 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so9747547otp.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YNFsFphXVzLhExC+2yxVmbdVN0mwFY9+hq9TnweqrT0=;
 b=DCcAJ6+uRb9vxbEjg5+Vpc9PcPKCkgA/iBDGYUbvb4azTeb4cJqM8p9EWU6DRmODt0
 FtkzXK5TmX0EigDM9OPAsF5++4AXEnxoY5SbRhuWKbTzf1wbM+GxWH9kjs8Z5YaC8e+E
 PuGJhX/OQDIhSxX6JSutsTR6IpfEBLxOUjY9L5IlLHa88fcLIC3S9DgtHKpm3LnCsDyT
 xuTKrL264+adhAWERglG2Nus1wmjNF9T//HdZ81UAZYx9KnqEDdjwMmMctpVrWNqSceZ
 Tkgdj4PyplXa9M2i1xS42tLm+9UxzpgJdVEaUL16vhm5VcGLfV5OO81S+kyk3iDs4OCC
 chdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNFsFphXVzLhExC+2yxVmbdVN0mwFY9+hq9TnweqrT0=;
 b=l3DSL6p1Rj2Gq2PU9rdAV8JJmoNdr7soBAeiRlN+I8TWYZ09GAJ30e/8YrZRyXsZn2
 KPNhr1FeIaol0AKoW5ZIitAv9nc12LRABPPL21BnerqrHCsMv69odvWvdnmkgZkK5IQd
 8MfqiyvxBnSUCpiRoiU4rT19IL30dAV2+fx0XLrSgir+0JlRPw1NuxcU8jHPMdrU5G4J
 v9soRPENRiXFIiPE8ojbZmeRStT10yyr7Lw91H8meBDTQKV7A5gSp5oa8+c6juHL6TPw
 dgnL44x5x4Y24p6N8vUam6Yyhj5rdgfQW+61oer0QuMtyLfbaaM9+QUjngwQqajcJ80s
 Ua2g==
X-Gm-Message-State: AOAM530HlsJdJeJYMe0a7Rxx/1Tf1GCzJzTlAyo0Dk+W+j63bTqyIcXp
 4lBiUN3E0PXpuTTIY/zjkBUSgApFf2Xbvl5J
X-Google-Smtp-Source: ABdhPJy2a3tOIwwLMcQkaOLxs+4e9g6ORvkSjhgWRtjYow2k0oBuJzNTk0KHXxsMx+/YMFpty2GndA==
X-Received: by 2002:a9d:69da:: with SMTP id v26mr5787260oto.338.1621368713647; 
 Tue, 18 May 2021 13:11:53 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/24] target/ppc: Rename access_type to type in mmu_helper.c
Date: Tue, 18 May 2021 15:11:27 -0500
Message-Id: <20210518201146.794854-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variable that holds ACCESS_INT, ACCESS_FLOAT, etc is
variously called 'int type' or 'int access_type' within
this file.  Standardize on 'int type' throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


