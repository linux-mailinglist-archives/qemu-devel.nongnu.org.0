Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5324438814D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:22:46 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6En-000596-BL
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64P-0000Ni-SK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:02 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64J-00067T-MW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:01 -0400
Received: by mail-oi1-x22a.google.com with SMTP id z3so10951069oib.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BhjLm0VRNqziUkwRvOTwH3j3TNREvHaemuX0YbWss88=;
 b=rupdRBNvYimJp6BTtMEIdXZ5xx/DYwP+WZ87VstpstmgsLRrvmSheaCGwZOIf9rBtx
 w9c+rliHBI+bNKOUiTyqfvevgQXPxha3Na/htNyu2yy/GrZX/icGz4cmXAbqCi+dTkup
 Ic7HLR+N4g8uI8TbrGZAV2RtIF4hpi2fqbTc09Tmt9jPk1KD84zDI+aYBxRhdoD6FXL7
 z8xtuAsYMpd6mvq8/COc0gv+VPQoCBqYlzwdOSDKSJ/eWFU0KHot0ad8mEu7+zTrsJza
 +51jVsThus5eOWSuZtwTrwVQZAGySNcKumWbTI84/4Ej7V2tLUBvpaT9fTrHxDw+lr/A
 HhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BhjLm0VRNqziUkwRvOTwH3j3TNREvHaemuX0YbWss88=;
 b=CLnVcbLqfVZ3dCV44yrIymxfNxWdSLuPm151+ghmaodlbQBHGgWxk7PLYDRZ4S8R+d
 tE2+E0+y6LgwNiJNs7qo/TMHFoq3607Z+0jj1Yi8sDtD1uR6NKU8SB2h1xYBnIjA3Qh/
 T5wa/PPLnYhD2fpVRS4wGHOcgF8r+XuDpu+bZGyUnMHWSbkU1niA8SNJyc5GCEXIIB7x
 Y2g0IqQ6wXcuqLoQ9j5xtX38yh8rQWa43lKCX0bSPJNB7Lo0wsJwQ+DKs4Q2yWvc1dE8
 G8l7Li9LX6phFkMNxMlPgrdwejSwXs1dT1ibAgtGZdfhD2+xkpcAfYEZ8ac88J+QfA/e
 GCnA==
X-Gm-Message-State: AOAM533JlIEPVZ897/e/vk5LEtr+PIFVv8hQCW0vZ+jUohQhYtScyPxd
 s6SV9flAX436QhVkhqcJJnRW9vmkTQBb4Iam
X-Google-Smtp-Source: ABdhPJxtZYYEafy2dKVkQDxz2B8JolT8yPUH5eyg+e3/HPXxBA3HhjPNUxb1OG0V10lm/+jtSfsjFA==
X-Received: by 2002:a05:6808:1142:: with SMTP id
 u2mr4692995oiu.101.1621368714651; 
 Tue, 18 May 2021 13:11:54 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/24] target/ppc: Use MMUAccessType in mmu_helper.c
Date: Tue, 18 May 2021 15:11:28 -0500
Message-Id: <20210518201146.794854-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

This replaces 'int rw' with 'MMUAccessType access_type'.
Comparisons vs zero become either MMU_DATA_LOAD or MMU_DATA_STORE,
since we had previously squashed rw to 0 for code access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 161 +++++++++++++++++++++-------------------
 1 file changed, 85 insertions(+), 76 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index dd2f1e2a90..2aa1b777de 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -126,7 +126,7 @@ static int pp_check(int key, int pp, int nx)
     return access;
 }
 
-static int check_prot(int prot, int rw, int type)
+static int check_prot(int prot, MMUAccessType access_type, int type)
 {
     int ret;
 
@@ -136,7 +136,7 @@ static int check_prot(int prot, int rw, int type)
         } else {
             ret = -2;
         }
-    } else if (rw) {
+    } else if (access_type == MMU_DATA_STORE) {
         if (prot & PAGE_WRITE) {
             ret = 0;
         } else {
@@ -153,9 +153,9 @@ static int check_prot(int prot, int rw, int type)
     return ret;
 }
 
-static inline int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
-                                       target_ulong pte1, int h,
-                                       int rw, int type)
+static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
+                                target_ulong pte1, int h,
+                                MMUAccessType access_type, int type)
 {
     target_ulong ptem, mmask;
     int access, ret, pteh, ptev, pp;
@@ -182,7 +182,7 @@ static inline int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
             /* Keep the matching PTE information */
             ctx->raddr = pte1;
             ctx->prot = access;
-            ret = check_prot(ctx->prot, rw, type);
+            ret = check_prot(ctx->prot, access_type, type);
             if (ret == 0) {
                 /* Access granted */
                 qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -197,7 +197,7 @@ static inline int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
 }
 
 static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
-                            int ret, int rw)
+                            int ret, MMUAccessType access_type)
 {
     int store = 0;
 
@@ -208,7 +208,7 @@ static int pte_update_flags(mmu_ctx_t *ctx, target_ulong *pte1p,
         store = 1;
     }
     if (!(*pte1p & 0x00000080)) {
-        if (rw == 1 && ret == 0) {
+        if (access_type == MMU_DATA_STORE && ret == 0) {
             /* Update changed flag */
             *pte1p |= 0x00000080;
             store = 1;
@@ -308,8 +308,9 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target_ulong EPN, int way,
     env->last_way = way;
 }
 
-static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
-                                   target_ulong eaddr, int rw, int type)
+static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
+                            target_ulong eaddr,
+                            MMUAccessType access_type, int type)
 {
     ppc6xx_tlb_t *tlb;
     int nr, best, way;
@@ -333,9 +334,10 @@ static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
                   TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
                   pte_is_valid(tlb->pte0) ? "valid" : "inval",
                   tlb->EPN, eaddr, tlb->pte1,
-                  rw ? 'S' : 'L', type == ACCESS_CODE ? 'I' : 'D');
+                  access_type == MMU_DATA_STORE ? 'S' : 'L',
+                  type == ACCESS_CODE ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
-                                     0, rw, type)) {
+                                     0, access_type, type)) {
         case -3:
             /* TLB inconsistency */
             return -1;
@@ -366,7 +368,7 @@ static inline int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx_t *ctx,
         LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=%01x ret=%d\n",
                   ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
         /* Update page flags */
-        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, rw);
+        pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_type);
     }
 
     return ret;
@@ -400,7 +402,8 @@ static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
 }
 
 static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                           target_ulong virtual, int rw, int type)
+                           target_ulong virtual, MMUAccessType access_type,
+                           int type)
 {
     target_ulong *BATlt, *BATut, *BATu, *BATl;
     target_ulong BEPIl, BEPIu, bl;
@@ -438,7 +441,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                     (virtual & 0x0001F000);
                 /* Compute access rights */
                 ctx->prot = prot;
-                ret = check_prot(ctx->prot, rw, type);
+                ret = check_prot(ctx->prot, access_type, type);
                 if (ret == 0) {
                     LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
                              i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' : '-',
@@ -472,8 +475,9 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
 }
 
 /* Perform segment based translation */
-static inline int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                                      target_ulong eaddr, int rw, int type)
+static int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                               target_ulong eaddr, MMUAccessType access_type,
+                               int type)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     hwaddr hash;
@@ -497,7 +501,7 @@ static inline int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
             " nip=" TARGET_FMT_lx " lr=" TARGET_FMT_lx
             " ir=%d dr=%d pr=%d %d t=%d\n",
             eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_ir,
-            (int)msr_dr, pr != 0 ? 1 : 0, rw, type);
+            (int)msr_dr, pr != 0 ? 1 : 0, access_type == MMU_DATA_STORE, type);
     pgidx = (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash = vsid ^ pgidx;
     ctx->ptem = (vsid << 7) | (pgidx >> 10);
@@ -520,7 +524,7 @@ static inline int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
             /* Initialize real address with an invalid value */
             ctx->raddr = (hwaddr)-1ULL;
             /* Software TLB search */
-            ret = ppc6xx_tlb_check(env, ctx, eaddr, rw, type);
+            ret = ppc6xx_tlb_check(env, ctx, eaddr, access_type, type);
 #if defined(DUMP_PAGE_TABLES)
             if (qemu_loglevel_mask(CPU_LOG_MMU)) {
                 CPUState *cs = env_cpu(env);
@@ -603,7 +607,8 @@ static inline int get_segment_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                           "address translation\n");
             return -4;
         }
-        if ((rw == 1 || ctx->key != 1) && (rw == 0 || ctx->key != 0)) {
+        if ((access_type == MMU_DATA_STORE || ctx->key != 1) &&
+            (access_type == MMU_DATA_LOAD || ctx->key != 0)) {
             ctx->raddr = eaddr;
             ret = 2;
         } else {
@@ -682,7 +687,8 @@ static inline void ppc4xx_tlb_invalidate_all(CPUPPCState *env)
 }
 
 static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                       target_ulong address, int rw,
+                                       target_ulong address,
+                                       MMUAccessType access_type,
                                        int type)
 {
     ppcemb_tlb_t *tlb;
@@ -700,8 +706,8 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         }
         zsel = (tlb->attr >> 4) & 0xF;
         zpr = (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
-        LOG_SWTLB("%s: TLB %d zsel %d zpr %d rw %d attr %08x\n",
-                    __func__, i, zsel, zpr, rw, tlb->attr);
+        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
+                    __func__, i, zsel, zpr, access_type, tlb->attr);
         /* Check execute enable bit */
         switch (zpr) {
         case 0x2:
@@ -727,7 +733,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         check_perms:
             /* Check from TLB entry */
             ctx->prot = tlb->prot;
-            ret = check_prot(ctx->prot, rw, type);
+            ret = check_prot(ctx->prot, access_type, type);
             if (ret == -2) {
                 env->spr[SPR_40x_ESR] = 0;
             }
@@ -757,10 +763,9 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
     env->spr[SPR_405_SLER] = val;
 }
 
-static inline int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
-                                     hwaddr *raddr, int *prot,
-                                     target_ulong address, int rw,
-                                     int type, int i)
+static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
+                              hwaddr *raddr, int *prot, target_ulong address,
+                              MMUAccessType access_type, int type, int i)
 {
     int ret, prot2;
 
@@ -815,7 +820,7 @@ found_tlb:
         }
 
         *prot = prot2;
-        if ((!rw && prot2 & PAGE_READ) || (rw && (prot2 & PAGE_WRITE))) {
+        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
             LOG_SWTLB("%s: found TLB!\n", __func__);
             return 0;
         }
@@ -828,7 +833,8 @@ found_tlb:
 }
 
 static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                         target_ulong address, int rw,
+                                         target_ulong address,
+                                         MMUAccessType access_type,
                                          int type)
 {
     ppcemb_tlb_t *tlb;
@@ -839,8 +845,8 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     raddr = (hwaddr)-1ULL;
     for (i = 0; i < env->nb_tlb; i++) {
         tlb = &env->tlb.tlbe[i];
-        ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address, rw,
-                                 type, i);
+        ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
+                                 access_type, type, i);
         if (ret != -1) {
             break;
         }
@@ -938,10 +944,10 @@ static bool is_epid_mmu(int mmu_idx)
     return mmu_idx == PPC_TLB_EPID_STORE || mmu_idx == PPC_TLB_EPID_LOAD;
 }
 
-static uint32_t mmubooke206_esr(int mmu_idx, bool rw)
+static uint32_t mmubooke206_esr(int mmu_idx, MMUAccessType access_type)
 {
     uint32_t esr = 0;
-    if (rw) {
+    if (access_type == MMU_DATA_STORE) {
         esr |= ESR_ST;
     }
     if (is_epid_mmu(mmu_idx)) {
@@ -983,7 +989,8 @@ static bool mmubooke206_get_as(CPUPPCState *env,
 /* Check if the tlb found by hashing really matches */
 static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
                                  hwaddr *raddr, int *prot,
-                                 target_ulong address, int rw,
+                                 target_ulong address,
+                                 MMUAccessType access_type,
                                  int type, int mmu_idx)
 {
     int ret;
@@ -1066,7 +1073,7 @@ found_tlb:
         }
 
         *prot = prot2;
-        if ((!rw && prot2 & PAGE_READ) || (rw && (prot2 & PAGE_WRITE))) {
+        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
             LOG_SWTLB("%s: found TLB!\n", __func__);
             return 0;
         }
@@ -1079,7 +1086,8 @@ found_tlb:
 }
 
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
-                                            target_ulong address, int rw,
+                                            target_ulong address,
+                                            MMUAccessType access_type,
                                             int type, int mmu_idx)
 {
     ppcmas_tlb_t *tlb;
@@ -1098,7 +1106,7 @@ static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                 continue;
             }
             ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                        rw, type, mmu_idx);
+                                        access_type, type, mmu_idx);
             if (ret != -1) {
                 goto found_tlb;
             }
@@ -1361,8 +1369,8 @@ void dump_mmu(CPUPPCState *env)
     }
 }
 
-static inline int check_physical(CPUPPCState *env, mmu_ctx_t *ctx,
-                                 target_ulong eaddr, int rw)
+static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
+                          MMUAccessType access_type)
 {
     int in_plb, ret;
 
@@ -1393,7 +1401,7 @@ static inline int check_physical(CPUPPCState *env, mmu_ctx_t *ctx,
                  eaddr >= env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
             if (in_plb ^ msr_px) {
                 /* Access in protected area */
-                if (rw == 1) {
+                if (access_type == MMU_DATA_STORE) {
                     /* Access is not allowed */
                     ret = -2;
                 }
@@ -1413,10 +1421,10 @@ static inline int check_physical(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
-static int get_physical_address_wtlb(
-    CPUPPCState *env, mmu_ctx_t *ctx,
-    target_ulong eaddr, int rw, int type,
-    int mmu_idx)
+static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
+                                     target_ulong eaddr,
+                                     MMUAccessType access_type, int type,
+                                     int mmu_idx)
 {
     int ret = -1;
     bool real_mode = (type == ACCESS_CODE && msr_ir == 0)
@@ -1426,15 +1434,15 @@ static int get_physical_address_wtlb(
     case POWERPC_MMU_SOFT_6xx:
     case POWERPC_MMU_SOFT_74xx:
         if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, rw);
+            ret = check_physical(env, ctx, eaddr, access_type);
         } else {
             /* Try to find a BAT */
             if (env->nb_BATs != 0) {
-                ret = get_bat_6xx_tlb(env, ctx, eaddr, rw, type);
+                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type, type);
             }
             if (ret < 0) {
                 /* We didn't match any BAT entry or don't have BATs */
-                ret = get_segment_6xx_tlb(env, ctx, eaddr, rw, type);
+                ret = get_segment_6xx_tlb(env, ctx, eaddr, access_type, type);
             }
         }
         break;
@@ -1442,18 +1450,18 @@ static int get_physical_address_wtlb(
     case POWERPC_MMU_SOFT_4xx:
     case POWERPC_MMU_SOFT_4xx_Z:
         if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, rw);
+            ret = check_physical(env, ctx, eaddr, access_type);
         } else {
             ret = mmu40x_get_physical_address(env, ctx, eaddr,
-                                              rw, type);
+                                              access_type, type);
         }
         break;
     case POWERPC_MMU_BOOKE:
         ret = mmubooke_get_physical_address(env, ctx, eaddr,
-                                            rw, type);
+                                            access_type, type);
         break;
     case POWERPC_MMU_BOOKE206:
-        ret = mmubooke206_get_physical_address(env, ctx, eaddr, rw,
+        ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
                                                type, mmu_idx);
         break;
     case POWERPC_MMU_MPC8xx:
@@ -1462,7 +1470,7 @@ static int get_physical_address_wtlb(
         break;
     case POWERPC_MMU_REAL:
         if (real_mode) {
-            ret = check_physical(env, ctx, eaddr, rw);
+            ret = check_physical(env, ctx, eaddr, access_type);
         } else {
             cpu_abort(env_cpu(env),
                       "PowerPC in real mode do not do any translation\n");
@@ -1476,11 +1484,11 @@ static int get_physical_address_wtlb(
     return ret;
 }
 
-static int get_physical_address(
-    CPUPPCState *env, mmu_ctx_t *ctx,
-    target_ulong eaddr, int rw, int type)
+static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
+                                target_ulong eaddr, MMUAccessType access_type,
+                                int type)
 {
-    return get_physical_address_wtlb(env, ctx, eaddr, rw, type, 0);
+    return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
 }
 
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -1508,14 +1516,15 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
         ;
     }
 
-    if (unlikely(get_physical_address(env, &ctx, addr, 0, ACCESS_INT) != 0)) {
+    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
+                                      ACCESS_INT) != 0)) {
 
         /*
          * Some MMUs have separate TLBs for code and data. If we only
          * try an ACCESS_INT, we may not be able to read instructions
          * mapped by code TLBs, so we also try a ACCESS_CODE.
          */
-        if (unlikely(get_physical_address(env, &ctx, addr, 0,
+        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETCH,
                                           ACCESS_CODE) != 0)) {
             return -1;
         }
@@ -1525,13 +1534,14 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 }
 
 static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
-                                     int rw, int mmu_idx)
+                                         MMUAccessType access_type, int mmu_idx)
 {
     uint32_t epid;
     bool as, pr;
     uint32_t missed_tid = 0;
     bool use_epid = mmubooke206_get_as(env, mmu_idx, &epid, &as, &pr);
-    if (rw == 2) {
+
+    if (access_type == MMU_INST_FETCH) {
         as = msr_ir;
     }
     env->spr[SPR_BOOKE_MAS0] = env->spr[SPR_BOOKE_MAS4] & MAS4_TLBSELD_MASK;
@@ -1579,7 +1589,7 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
 
 /* Perform address translation */
 static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
-                                    int rw, int mmu_idx)
+                                    MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -1587,15 +1597,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
     int type;
     int ret = 0;
 
-    if (rw == 2) {
+    if (access_type == MMU_INST_FETCH) {
         /* code access */
-        rw = 0;
         type = ACCESS_CODE;
     } else {
         /* data access */
         type = env->access_type;
     }
-    ret = get_physical_address_wtlb(env, &ctx, address, rw,
+    ret = get_physical_address_wtlb(env, &ctx, address, access_type,
                                     type, mmu_idx);
     if (ret == 0) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
@@ -1632,7 +1641,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs->exception_index = POWERPC_EXCP_ITLB;
                     env->error_code = 0;
                     env->spr[SPR_BOOKE_DEAR] = address;
-                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, 0);
+                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
                     return -1;
                 case POWERPC_MMU_MPC8xx:
                     /* XXX: TODO */
@@ -1674,7 +1683,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 /* No matches in page tables or TLB */
                 switch (env->mmu_model) {
                 case POWERPC_MMU_SOFT_6xx:
-                    if (rw == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         cs->exception_index = POWERPC_EXCP_DSTLB;
                         env->error_code = 1 << 16;
                     } else {
@@ -1691,7 +1700,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                         get_pteg_offset32(cpu, ctx.hash[1]);
                     break;
                 case POWERPC_MMU_SOFT_74xx:
-                    if (rw == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         cs->exception_index = POWERPC_EXCP_DSTLB;
                     } else {
                         cs->exception_index = POWERPC_EXCP_DLTLB;
@@ -1708,7 +1717,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs->exception_index = POWERPC_EXCP_DTLB;
                     env->error_code = 0;
                     env->spr[SPR_40x_DEAR] = address;
-                    if (rw) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_40x_ESR] = 0x00800000;
                     } else {
                         env->spr[SPR_40x_ESR] = 0x00000000;
@@ -1719,13 +1728,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
                     break;
                 case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, rw, mmu_idx);
+                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
                     /* fall through */
                 case POWERPC_MMU_BOOKE:
                     cs->exception_index = POWERPC_EXCP_DTLB;
                     env->error_code = 0;
                     env->spr[SPR_BOOKE_DEAR] = address;
-                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, rw);
+                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
                     return -1;
                 case POWERPC_MMU_REAL:
                     cpu_abort(cs, "PowerPC in real mode should never raise "
@@ -1743,16 +1752,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 if (env->mmu_model == POWERPC_MMU_SOFT_4xx
                     || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
                     env->spr[SPR_40x_DEAR] = address;
-                    if (rw) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_40x_ESR] |= 0x00800000;
                     }
                 } else if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
                            (env->mmu_model == POWERPC_MMU_BOOKE206)) {
                     env->spr[SPR_BOOKE_DEAR] = address;
-                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, rw);
+                    env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
                 } else {
                     env->spr[SPR_DAR] = address;
-                    if (rw == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x0A000000;
                     } else {
                         env->spr[SPR_DSISR] = 0x08000000;
@@ -1773,7 +1782,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs->exception_index = POWERPC_EXCP_DSI;
                     env->error_code = 0;
                     env->spr[SPR_DAR] = address;
-                    if (rw == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x06000000;
                     } else {
                         env->spr[SPR_DSISR] = 0x04000000;
@@ -1784,7 +1793,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs->exception_index = POWERPC_EXCP_DSI;
                     env->error_code = 0;
                     env->spr[SPR_DAR] = address;
-                    if (rw == 1) {
+                    if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x06100000;
                     } else {
                         env->spr[SPR_DSISR] = 0x04100000;
-- 
2.25.1


