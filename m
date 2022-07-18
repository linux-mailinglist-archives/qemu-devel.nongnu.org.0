Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448695788B2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:45:20 +0200 (CEST)
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUo3-0006G7-B2
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSb-00086c-16; Mon, 18 Jul 2022 13:23:09 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSN-0001qp-BR; Mon, 18 Jul 2022 13:22:58 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 g20-20020a9d6a14000000b0061c84e679f5so7041964otn.2; 
 Mon, 18 Jul 2022 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzKSYAoKo0VHtLhkrqz1v8EnVad0CX3bD2N87xVdY3o=;
 b=hPHN3jUUmiryySIdtgOVM/mpPYSfnXt+yicn2R7Cmf+thWKCVbqavLTC8kfNTp3/1t
 aJQKQGzIXf7iZQsSR2zb2ghkwfH8rOemaXkyt8APz53fpBbCEvkVVTrKfGUDEK8q4jNp
 M08bmnF60fwaggDpyUoaHweiGrE7ERbafbcKBGGlVaxQG+Ih6hjYSu+npRbVCQBKME3H
 eOLcPGWmcGhmNKGEFlQnYBZBvSOAbWVGAKQjWAn5Wp2KyZJKWlUfpD73atJH8xGlaEbZ
 NbbEt4w7ngwu8/aEBqMu7R6f7dXNC13eOArv3V5I54/wIvTz3ay/1cdZ7ELWtIxUqOqo
 tCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzKSYAoKo0VHtLhkrqz1v8EnVad0CX3bD2N87xVdY3o=;
 b=VJJn2yStUImJ1OlXrnJMDwgqMQc4JBvw3gTcqnZ0+obuw1dx13BFQJ1E4B6QwVMIMk
 iYlGCOtXs8wO0/cxyWLr8lWRzxuJxnUwnmn47r53mzBcMYjI2NhCohA7Khjbn4jDw1yM
 G37dfa+tAnlWbwRwwCZtB8k6enjKLoo3/q8ifZBAyJWkATEPX/mWnFs1AQVcy6RxXj7Y
 5GFCtE+A15fBnAjKDd7ZXz2SFvGdq4cFyenLfb+qPmITDo0fD6LRD+I9cZfjtMRIlB2Z
 o4X05067uK5FKfj1lh55PZ92LPyYvlszFf4YYfcnKgufQwDWaTTQnTxzwd7H7hlosrTy
 BDTQ==
X-Gm-Message-State: AJIora8XulST/oF5oAbQWQirrDHIAFYq+ktQF49cnAtmZiMTvcWVT8VP
 MKvGLJ85lLyqqNsqxI8xr9GQlrQ+pDM=
X-Google-Smtp-Source: AGRyM1tgkpsl+3zqW+QphwdJ7w4egTJQtvNRiiJm1+i3e6wSKl0ydCciO6Rks47V7zVf2i7xhWuqbw==
X-Received: by 2002:a05:6830:6388:b0:61c:80a9:d5b6 with SMTP id
 ch8-20020a056830638800b0061c80a9d5b6mr7861408otb.124.1658164970131; 
 Mon, 18 Jul 2022 10:22:50 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 15/30] target/ppc: Implement ISA 3.00 tlbie[l]
Date: Mon, 18 Jul 2022 14:21:53 -0300
Message-Id: <20220718172208.1247624-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

This initial version supports the invalidation of one or all
TLB entries. Flush by PID/LPID, or based in process/partition
scope is not supported, because it would make using the
generic QEMU TLB implementation hard. In these cases, all
entries are flushed.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220712193741.59134-3-leandro.lupori@eldorado.org.br>
[danielhb: moved 'set' declaration to TLBIE_RIC_PWC block]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |   2 +
 target/ppc/mmu-book3s-v3.h                   |  15 ++
 target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
 target/ppc/translate/storage-ctrl-impl.c.inc |  17 ++
 4 files changed, 188 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 2f112b7de0..294ef1396b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -674,6 +674,8 @@ DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
 #if defined(TARGET_PPC64)
+DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
+        env, tl, tl, i32)
 DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
index d6d5ed8f8e..674377a19e 100644
--- a/target/ppc/mmu-book3s-v3.h
+++ b/target/ppc/mmu-book3s-v3.h
@@ -50,6 +50,21 @@ struct prtb_entry {
 
 #ifdef TARGET_PPC64
 
+/*
+ * tlbie[l] helper flags
+ *
+ * RIC, PRS, R and local are passed as flags in the last argument.
+ */
+#define TLBIE_F_RIC_SHIFT       0
+#define TLBIE_F_PRS_SHIFT       2
+#define TLBIE_F_R_SHIFT         3
+#define TLBIE_F_LOCAL_SHIFT     4
+
+#define TLBIE_F_RIC_MASK        (3 << TLBIE_F_RIC_SHIFT)
+#define TLBIE_F_PRS             (1 << TLBIE_F_PRS_SHIFT)
+#define TLBIE_F_R               (1 << TLBIE_F_R_SHIFT)
+#define TLBIE_F_LOCAL           (1 << TLBIE_F_LOCAL_SHIFT)
+
 static inline bool ppc64_use_proc_tbl(PowerPCCPU *cpu)
 {
     return !!(cpu->env.spr[SPR_LPCR] & LPCR_UPRT);
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 15239dc95b..2a91f3f46a 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -429,6 +429,160 @@ void helper_tlbie(CPUPPCState *env, target_ulong addr)
     ppc_tlb_invalidate_one(env, addr);
 }
 
+#if defined(TARGET_PPC64)
+
+/* Invalidation Selector */
+#define TLBIE_IS_VA         0
+#define TLBIE_IS_PID        1
+#define TLBIE_IS_LPID       2
+#define TLBIE_IS_ALL        3
+
+/* Radix Invalidation Control */
+#define TLBIE_RIC_TLB       0
+#define TLBIE_RIC_PWC       1
+#define TLBIE_RIC_ALL       2
+#define TLBIE_RIC_GRP       3
+
+/* Radix Actual Page sizes */
+#define TLBIE_R_AP_4K       0
+#define TLBIE_R_AP_64K      5
+#define TLBIE_R_AP_2M       1
+#define TLBIE_R_AP_1G       2
+
+/* RB field masks */
+#define TLBIE_RB_EPN_MASK   PPC_BITMASK(0, 51)
+#define TLBIE_RB_IS_MASK    PPC_BITMASK(52, 53)
+#define TLBIE_RB_AP_MASK    PPC_BITMASK(56, 58)
+
+void helper_tlbie_isa300(CPUPPCState *env, target_ulong rb, target_ulong rs,
+                         uint32_t flags)
+{
+    unsigned ric = (flags & TLBIE_F_RIC_MASK) >> TLBIE_F_RIC_SHIFT;
+    /*
+     * With the exception of the checks for invalid instruction forms,
+     * PRS is currently ignored, because we don't know if a given TLB entry
+     * is process or partition scoped.
+     */
+    bool prs = flags & TLBIE_F_PRS;
+    bool r = flags & TLBIE_F_R;
+    bool local = flags & TLBIE_F_LOCAL;
+    bool effR;
+    unsigned is = extract64(rb, PPC_BIT_NR(53), 2);
+    unsigned ap;        /* actual page size */
+    target_ulong addr, pgoffs_mask;
+
+    qemu_log_mask(CPU_LOG_MMU,
+        "%s: local=%d addr=" TARGET_FMT_lx " ric=%u prs=%d r=%d is=%u\n",
+        __func__, local, rb & TARGET_PAGE_MASK, ric, prs, r, is);
+
+    effR = FIELD_EX64(env->msr, MSR, HV) ? r : env->spr[SPR_LPCR] & LPCR_HR;
+
+    /* Partial TLB invalidation is supported for Radix only for now. */
+    if (!effR) {
+        goto inval_all;
+    }
+
+    /* Check for invalid instruction forms (effR=1). */
+    if (unlikely(ric == TLBIE_RIC_GRP ||
+                 ((ric == TLBIE_RIC_PWC || ric == TLBIE_RIC_ALL) &&
+                                           is == TLBIE_IS_VA) ||
+                 (!prs && is == TLBIE_IS_PID))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid instruction form: ric=%u prs=%d r=%d is=%u\n",
+            __func__, ric, prs, r, is);
+        goto invalid;
+    }
+
+    /* We don't cache Page Walks. */
+    if (ric == TLBIE_RIC_PWC) {
+        if (local) {
+            unsigned set = extract64(rb, PPC_BIT_NR(51), 12);
+            if (set != 0) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid set: %d\n",
+                              __func__, set);
+                goto invalid;
+            }
+        }
+        return;
+    }
+
+    /*
+     * Invalidation by LPID or PID is not supported, so fallback
+     * to full TLB flush in these cases.
+     */
+    if (is != TLBIE_IS_VA) {
+        goto inval_all;
+    }
+
+    /*
+     * The results of an attempt to invalidate a translation outside of
+     * quadrant 0 for Radix Tree translation (effR=1, RIC=0, PRS=1, IS=0,
+     * and EA 0:1 != 0b00) are boundedly undefined.
+     */
+    if (unlikely(ric == TLBIE_RIC_TLB && prs && is == TLBIE_IS_VA &&
+                 (rb & R_EADDR_QUADRANT) != R_EADDR_QUADRANT0)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: attempt to invalidate a translation outside of quadrant 0\n",
+            __func__);
+        goto inval_all;
+    }
+
+    assert(is == TLBIE_IS_VA);
+    assert(ric == TLBIE_RIC_TLB || ric == TLBIE_RIC_ALL);
+
+    ap = extract64(rb, PPC_BIT_NR(58), 3);
+    switch (ap) {
+    case TLBIE_R_AP_4K:
+        pgoffs_mask = 0xfffull;
+        break;
+
+    case TLBIE_R_AP_64K:
+        pgoffs_mask = 0xffffull;
+        break;
+
+    case TLBIE_R_AP_2M:
+        pgoffs_mask = 0x1fffffull;
+        break;
+
+    case TLBIE_R_AP_1G:
+        pgoffs_mask = 0x3fffffffull;
+        break;
+
+    default:
+        /*
+         * If the value specified in RS 0:31, RS 32:63, RB 54:55, RB 56:58,
+         * RB 44:51, or RB 56:63, when it is needed to perform the specified
+         * operation, is not supported by the implementation, the instruction
+         * is treated as if the instruction form were invalid.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid AP: %d\n", __func__, ap);
+        goto invalid;
+    }
+
+    addr = rb & TLBIE_RB_EPN_MASK & ~pgoffs_mask;
+
+    if (local) {
+        tlb_flush_page(env_cpu(env), addr);
+    } else {
+        tlb_flush_page_all_cpus(env_cpu(env), addr);
+    }
+    return;
+
+inval_all:
+    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
+    if (!local) {
+        env->tlb_need_flush |= TLB_NEED_GLOBAL_FLUSH;
+    }
+    return;
+
+invalid:
+    raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                           POWERPC_EXCP_INVAL |
+                           POWERPC_EXCP_INVAL_INVAL, GETPC());
+}
+
+#endif
+
 void helper_tlbiva(CPUPPCState *env, target_ulong addr)
 {
     /* tlbiva instruction only exists on BookE */
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 7793297dd4..467c390888 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -21,6 +21,8 @@
  * Store Control Instructions
  */
 
+#include "mmu-book3s-v3.h"
+
 static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 {
 #if defined(CONFIG_USER_ONLY)
@@ -65,6 +67,21 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
         tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
         gen_helper_tlbie(cpu_env, t0);
         tcg_temp_free(t0);
+
+#if defined(TARGET_PPC64)
+    /*
+     * ISA 3.1B says that MSR SF must be 1 when this instruction is executed;
+     * otherwise the results are undefined.
+     */
+    } else if (a->r) {
+        gen_helper_tlbie_isa300(cpu_env, cpu_gpr[rb], cpu_gpr[a->rs],
+                tcg_constant_i32(a->ric << TLBIE_F_RIC_SHIFT |
+                                 a->prs << TLBIE_F_PRS_SHIFT |
+                                 a->r << TLBIE_F_R_SHIFT |
+                                 local << TLBIE_F_LOCAL_SHIFT));
+        return true;
+#endif
+
     } else {
         gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
     }
-- 
2.36.1


