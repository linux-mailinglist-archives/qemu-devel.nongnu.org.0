Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73768388174
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:35:12 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Qp-000465-GH
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64m-0001N2-LF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:24 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64Z-0006MK-JP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:24 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso9767703otn.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxfpRJ55P2u9EsKXLcMRIGneufI4Rcjd8SfZDbT199k=;
 b=r0uqFJBPSXYpICK4egsksgpxyePQf9z8R5ta+ogGE0FLgdhzwBqYFVDYiHhbUKWjWo
 FlucxHlZdoS60y3i7Pjy7CJYGB1HIF2cNpxawDuXSoxyQNBkPTbLfWJ0MBaxZek2i4rn
 nndEZcuCkdBZff7Yh2nAQR1pKMLuxUngSCvjukgkzmdFUDG3E+UyuflRQCYNkkgR8vTb
 LiFF8P7uaP9JUCWKQosDKCf9/zgdkm2AKeXoFOp1Ne+1pw382R72z7IaNFvd5jtCoIj6
 F6igOXNUHPOFDUjLdQN5KdwWmEcfBVnaFWut22pWSi1SPx4q4qNowFzw927SMDcfW/T9
 C3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxfpRJ55P2u9EsKXLcMRIGneufI4Rcjd8SfZDbT199k=;
 b=p/S053a3MOHx3zDj9NbaAUN+uXyVJxCRVj4YLocVfZW/JlPkLTUOCqnuHaQBonVKV+
 ArXYlfgdfzfGjP2zr0z8V0lE+jAQEOPrVpalpjP/WRDlqqbODtM0hz2mWTSFZrsxK/ow
 b0mNRDDgIXcePAF3XSs8UnZUR073s9F9/0l5hEt/QV0OD68ZeINAxHgRO1iDpu59y8GQ
 yez9l0AoLOxaSjMV3261eHM0LH5PJwpZLIkEWf7Q/XWaTr/uCXDE6Jc+96qmDM0T/ll9
 XSKer9b5guudduAgqhxWo2DvN0IHlpVtcmNs/CkOUE1UJn3KppAJdG3qYYy9uQOVHgCH
 FJQw==
X-Gm-Message-State: AOAM532q4Mhg+aS4vwORM3SHYSKfJtkYDKKdSMIdWBvks+0nBZSA2urG
 SdtwoPPSmsCmKKkXwdvHlG1vwKQummh7F86l
X-Google-Smtp-Source: ABdhPJwU2swdjmXOt8SJ+rgScRlgQduAXBGN7+XkjyVgX26gqokNzmeFB7lxci9GMCB6G8XdPuU11w==
X-Received: by 2002:a05:6830:1f15:: with SMTP id
 u21mr5659700otg.154.1621368730236; 
 Tue, 18 May 2021 13:12:10 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/24] target/ppc: Split out ppc_jumbo_xlate
Date: Tue, 18 May 2021 15:11:44 -0500
Message-Id: <20210518201146.794854-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Mirror the interface of ppc_radix64_xlate (mostly), putting all
of the logic for older mmu translation into a single entry point.
For booke, we need to add mmu_idx to the xlate-style interface.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 181 +++++++++++++++++++++-------------------
 1 file changed, 97 insertions(+), 84 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 863e556a22..68c2e59238 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1427,48 +1427,6 @@ static int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return get_physical_address_wtlb(env, ctx, eaddr, access_type, type, 0);
 }
 
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-    mmu_ctx_t ctx;
-
-    switch (env->mmu_model) {
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        return ppc_hash64_get_phys_page_debug(cpu, addr);
-    case POWERPC_MMU_3_00:
-        return ppc64_v3_get_phys_page_debug(cpu, addr);
-#endif
-
-    case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
-        return ppc_hash32_get_phys_page_debug(cpu, addr);
-
-    default:
-        ;
-    }
-
-    if (unlikely(get_physical_address(env, &ctx, addr, MMU_DATA_LOAD,
-                                      ACCESS_INT) != 0)) {
-
-        /*
-         * Some MMUs have separate TLBs for code and data. If we only
-         * try an ACCESS_INT, we may not be able to read instructions
-         * mapped by code TLBs, so we also try a ACCESS_CODE.
-         */
-        if (unlikely(get_physical_address(env, &ctx, addr, MMU_INST_FETCH,
-                                          ACCESS_CODE) != 0)) {
-            return -1;
-        }
-    }
-
-    return ctx.raddr & TARGET_PAGE_MASK;
-}
-
 static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
                                          MMUAccessType access_type, int mmu_idx)
 {
@@ -1524,30 +1482,38 @@ static void booke206_update_mas_tlb_miss(CPUPPCState *env, target_ulong address,
 }
 
 /* Perform address translation */
-static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
-                                    MMUAccessType access_type, int mmu_idx)
+/* TODO: Split this by mmu_model. */
+static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                            MMUAccessType access_type,
+                            hwaddr *raddrp, int *psizep, int *protp,
+                            int mmu_idx, bool guest_visible)
 {
-    CPUState *cs = env_cpu(env);
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
     mmu_ctx_t ctx;
     int type;
-    int ret = 0;
+    int ret;
 
     if (access_type == MMU_INST_FETCH) {
         /* code access */
         type = ACCESS_CODE;
-    } else {
+    } else if (guest_visible) {
         /* data access */
         type = env->access_type;
+    } else {
+        type = ACCESS_INT;
     }
-    ret = get_physical_address_wtlb(env, &ctx, address, access_type,
+
+    ret = get_physical_address_wtlb(env, &ctx, eaddr, access_type,
                                     type, mmu_idx);
     if (ret == 0) {
-        tlb_set_page(cs, address & TARGET_PAGE_MASK,
-                     ctx.raddr & TARGET_PAGE_MASK, ctx.prot,
-                     mmu_idx, TARGET_PAGE_SIZE);
-        ret = 0;
-    } else if (ret < 0) {
+        *raddrp = ctx.raddr;
+        *protp = ctx.prot;
+        *psizep = TARGET_PAGE_BITS;
+        return true;
+    }
+
+    if (guest_visible) {
         LOG_MMU_STATE(cs);
         if (type == ACCESS_CODE) {
             switch (ret) {
@@ -1557,7 +1523,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_6xx:
                     cs->exception_index = POWERPC_EXCP_IFTLB;
                     env->error_code = 1 << 18;
-                    env->spr[SPR_IMISS] = address;
+                    env->spr[SPR_IMISS] = eaddr;
                     env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
                     goto tlb_miss;
                 case POWERPC_MMU_SOFT_74xx:
@@ -1567,29 +1533,25 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index = POWERPC_EXCP_ITLB;
                     env->error_code = 0;
-                    env->spr[SPR_40x_DEAR] = address;
+                    env->spr[SPR_40x_DEAR] = eaddr;
                     env->spr[SPR_40x_ESR] = 0x00000000;
                     break;
                 case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, 2, mmu_idx);
+                    booke206_update_mas_tlb_miss(env, eaddr, 2, mmu_idx);
                     /* fall through */
                 case POWERPC_MMU_BOOKE:
                     cs->exception_index = POWERPC_EXCP_ITLB;
                     env->error_code = 0;
-                    env->spr[SPR_BOOKE_DEAR] = address;
+                    env->spr[SPR_BOOKE_DEAR] = eaddr;
                     env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, MMU_DATA_LOAD);
-                    return -1;
-                case POWERPC_MMU_MPC8xx:
-                    /* XXX: TODO */
-                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
                     break;
+                case POWERPC_MMU_MPC8xx:
+                    cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
                 case POWERPC_MMU_REAL:
                     cpu_abort(cs, "PowerPC in real mode should never raise "
                               "any MMU exceptions\n");
-                    return -1;
                 default:
                     cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
                 }
                 break;
             case -2:
@@ -1626,7 +1588,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                         cs->exception_index = POWERPC_EXCP_DLTLB;
                         env->error_code = 0;
                     }
-                    env->spr[SPR_DMISS] = address;
+                    env->spr[SPR_DMISS] = eaddr;
                     env->spr[SPR_DCMP] = 0x80000000 | ctx.ptem;
                 tlb_miss:
                     env->error_code |= ctx.key << 19;
@@ -1644,7 +1606,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 tlb_miss_74xx:
                     /* Implement LRU algorithm */
                     env->error_code = ctx.key << 19;
-                    env->spr[SPR_TLBMISS] = (address & ~((target_ulong)0x3)) |
+                    env->spr[SPR_TLBMISS] = (eaddr & ~((target_ulong)0x3)) |
                         ((env->last_way + 1) & (env->nb_ways - 1));
                     env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
                     break;
@@ -1652,7 +1614,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_SOFT_4xx_Z:
                     cs->exception_index = POWERPC_EXCP_DTLB;
                     env->error_code = 0;
-                    env->spr[SPR_40x_DEAR] = address;
+                    env->spr[SPR_40x_DEAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_40x_ESR] = 0x00800000;
                     } else {
@@ -1662,23 +1624,20 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 case POWERPC_MMU_MPC8xx:
                     /* XXX: TODO */
                     cpu_abort(cs, "MPC8xx MMU model is not implemented\n");
-                    break;
                 case POWERPC_MMU_BOOKE206:
-                    booke206_update_mas_tlb_miss(env, address, access_type, mmu_idx);
+                    booke206_update_mas_tlb_miss(env, eaddr, access_type, mmu_idx);
                     /* fall through */
                 case POWERPC_MMU_BOOKE:
                     cs->exception_index = POWERPC_EXCP_DTLB;
                     env->error_code = 0;
-                    env->spr[SPR_BOOKE_DEAR] = address;
+                    env->spr[SPR_BOOKE_DEAR] = eaddr;
                     env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
-                    return -1;
+                    break;
                 case POWERPC_MMU_REAL:
                     cpu_abort(cs, "PowerPC in real mode should never raise "
                               "any MMU exceptions\n");
-                    return -1;
                 default:
                     cpu_abort(cs, "Unknown or invalid MMU model\n");
-                    return -1;
                 }
                 break;
             case -2:
@@ -1687,16 +1646,16 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                 env->error_code = 0;
                 if (env->mmu_model == POWERPC_MMU_SOFT_4xx
                     || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
-                    env->spr[SPR_40x_DEAR] = address;
+                    env->spr[SPR_40x_DEAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_40x_ESR] |= 0x00800000;
                     }
                 } else if ((env->mmu_model == POWERPC_MMU_BOOKE) ||
                            (env->mmu_model == POWERPC_MMU_BOOKE206)) {
-                    env->spr[SPR_BOOKE_DEAR] = address;
+                    env->spr[SPR_BOOKE_DEAR] = eaddr;
                     env->spr[SPR_BOOKE_ESR] = mmubooke206_esr(mmu_idx, access_type);
                 } else {
-                    env->spr[SPR_DAR] = address;
+                    env->spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x0A000000;
                     } else {
@@ -1711,13 +1670,13 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     /* Floating point load/store */
                     cs->exception_index = POWERPC_EXCP_ALIGN;
                     env->error_code = POWERPC_EXCP_ALIGN_FP;
-                    env->spr[SPR_DAR] = address;
+                    env->spr[SPR_DAR] = eaddr;
                     break;
                 case ACCESS_RES:
                     /* lwarx, ldarx or stwcx. */
                     cs->exception_index = POWERPC_EXCP_DSI;
                     env->error_code = 0;
-                    env->spr[SPR_DAR] = address;
+                    env->spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x06000000;
                     } else {
@@ -1728,7 +1687,7 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     /* eciwx or ecowx */
                     cs->exception_index = POWERPC_EXCP_DSI;
                     env->error_code = 0;
-                    env->spr[SPR_DAR] = address;
+                    env->spr[SPR_DAR] = eaddr;
                     if (access_type == MMU_DATA_STORE) {
                         env->spr[SPR_DSISR] = 0x06100000;
                     } else {
@@ -1740,16 +1699,14 @@ static int cpu_ppc_handle_mmu_fault(CPUPPCState *env, target_ulong address,
                     cs->exception_index = POWERPC_EXCP_PROGRAM;
                     env->error_code =
                         POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL;
-                    env->spr[SPR_DAR] = address;
+                    env->spr[SPR_DAR] = eaddr;
                     break;
                 }
                 break;
             }
         }
-        ret = 1;
     }
-
-    return ret;
+    return false;
 }
 
 /*****************************************************************************/
@@ -2958,6 +2915,62 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 
 /*****************************************************************************/
 
+static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                    MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
+                         &page_size, &prot, mmu_idx, true)) {
+        return 1;
+    }
+
+    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
+                 prot, mmu_idx, 1UL << page_size);
+    return 0;
+}
+
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+    CPUPPCState *env = &cpu->env;
+    hwaddr raddr;
+    int s, p;
+
+    switch (env->mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        return ppc_hash64_get_phys_page_debug(cpu, addr);
+    case POWERPC_MMU_3_00:
+        return ppc64_v3_get_phys_page_debug(cpu, addr);
+#endif
+
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        return ppc_hash32_get_phys_page_debug(cpu, addr);
+
+    default:
+        ;
+    }
+
+    /*
+     * Some MMUs have separate TLBs for code and data. If we only
+     * try an MMU_DATA_LOAD, we may not be able to read instructions
+     * mapped by code TLBs, so we also try a MMU_INST_FETCH.
+     */
+    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
+        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
+        return raddr & TARGET_PAGE_MASK;
+    }
+    return -1;
+}
+
+
 bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
@@ -2985,7 +2998,7 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
 
     default:
-        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
+        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
         break;
     }
     if (unlikely(ret != 0)) {
-- 
2.25.1


