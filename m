Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABC4D4709
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:33:57 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHzQ-0002N9-Le
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:33:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0n-0002Vw-A2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:17 -0500
Received: from [2607:f8b0:4864:20::52a] (port=46778
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0l-0008Sv-Dt
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:16 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o23so4464899pgk.13
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItyhHSiGdc58HAGraU/SXIWa8zv4816zOwkBCWpNHUs=;
 b=uXnYCF/cLCJx51+LWAIwgtC7Pt9tyU+PxtALMfCYqGei4QUx48rKku9+IwUQAEQhWV
 gcdi4APUpaiJArwEbJkMcHVS/VyUZs53ss87AMISA/BJTwyP7abHroFjc9Xzmt+3snYS
 oc14U3psHKdasi/7MaJDNSSKdlsLvCEaL2vyKeiCFiP+eqaTWQUe/GGlg+96GKgycx9X
 k23/5XJxUZAKeeRRb4po1ZAp2fwjfErNr+sjc0P31VUpwGreEOqYhDh0dKXo03FNgcmr
 qjNl5XY9BnGNvansItTF++5t2SHGTfV1oia0KzrjBOtafsQttQaM4C0aUQg+OMUpkuBz
 OnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItyhHSiGdc58HAGraU/SXIWa8zv4816zOwkBCWpNHUs=;
 b=3xvlBi4dXET6wYu91CUSra/t5zrrpof94ZhXkEmVFQbmE0WCqKh3PtaEvunA785cLe
 vZCPCaIAjlxwuMsZFzBS9Zr+So46NngYhJVW4LAi7cQpxCi3bl+6CaOzRw59yBKLSD3F
 cCF5L6A0JcvXzW88NW76T6VmisZXvBmDG0pNBRgtiNzAVBUTqQUkVR3a/0UnjXrlp0zB
 j4ztkpZl0QXBMjIjEt91QgioKTAXimkwqBa4MDg4H9ZpXUIblPFyxnd0dRsdr8J3ZjAA
 qjTydQP4hD6N+6HMjk8/Pfj/vv/Na9usxnoty5Ac072p9RPQ3J+gv1MM840NEHqmWn2a
 UfmQ==
X-Gm-Message-State: AOAM5315aEagMo3TN9G/wN3jc6GPzo1xz6QdD2hLXjjxpE7hTbgjBMhg
 hMZONEQWAm93aKJB2fr3ZyECg1I3aZl45Q==
X-Google-Smtp-Source: ABdhPJwlixa4izaPel3ESRG2jNdvcBietvXgJtqFyYJy3liTp5ktXHLk57B5fRpybcRuIfIEEjGNew==
X-Received: by 2002:a62:402:0:b0:4f7:81a3:7c47 with SMTP id
 2-20020a620402000000b004f781a37c47mr617181pfe.9.1646911873933; 
 Thu, 10 Mar 2022 03:31:13 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 41/48] target/nios2: Introduce shadow register sets
Date: Thu, 10 Mar 2022 03:27:18 -0800
Message-Id: <20220310112725.570053-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not actually enable them so far, but add all of the
plumbing to address them.  Do not enable them for user-only.

Add an env->regs pointer that handles the indirection to
the current register set.  The naming of the pointer hides
the difference between old and new, user-only and sysemu.

From the notes on wrprs, which states that r0 must be initialized
before use in shadow register sets, infer that R_ZERO is *not*
hardwired to zero in shadow register sets.  Adjust load_gpr and
dest_gpr to reflect this.  At the same time we might as well
special case crs == 0 to avoid the indirection through env->regs
during translation as well.  Given that this is intended to be
the most common case for non-interrupt handlers.

Init env->regs at reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       | 24 +++++++++++++++++
 target/nios2/cpu.c       |  1 +
 target/nios2/translate.c | 58 +++++++++++++++++++++++++++++++---------
 3 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d5255e9e76..e32bebe9b7 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -60,6 +60,11 @@ struct Nios2CPUClass {
 #define NUM_GP_REGS 32
 #define NUM_CR_REGS 32
 
+#ifndef CONFIG_USER_ONLY
+/* 63 shadow register sets; index 0 is the primary register set. */
+#define NUM_REG_SETS 64
+#endif
+
 /* General purpose register aliases */
 enum {
     R_ZERO   = 0,
@@ -178,7 +183,13 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUD     17
 
 struct CPUArchState {
+#ifdef CONFIG_USER_ONLY
     uint32_t regs[NUM_GP_REGS];
+#else
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];
+    /* Pointer into shadow_regs for the current register set. */
+    uint32_t *regs;
+#endif
     uint32_t ctrl[NUM_CR_REGS];
     uint32_t pc;
 
@@ -229,6 +240,14 @@ static inline bool nios2_cr_reserved(const ControlRegState *s)
     return (s->writable | s->readonly) == 0;
 }
 
+static inline void nios2_update_crs(CPUNios2State *env)
+{
+#ifndef CONFIG_USER_ONLY
+    unsigned crs = FIELD_EX32(env->ctrl[CR_STATUS], CR_STATUS, CRS);
+    env->regs = env->shadow_regs[crs];
+#endif
+}
+
 void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
@@ -271,12 +290,17 @@ typedef Nios2CPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
+FIELD(TBFLAGS, CRS0, 0, 1)  /* Set if CRS == 0. */
+FIELD(TBFLAGS, U, 1, 1)     /* Overlaps CR_STATUS_U */
+
 static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
     *pc = env->pc;
     *cs_base = 0;
     *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
+    *flags |= (env->ctrl[CR_STATUS] & R_CR_STATUS_CRS_MASK
+               ? 0 : R_TBFLAGS_CRS0_MASK);
 }
 
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index b8410d8447..efd6a21a8e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -59,6 +59,7 @@ static void nios2_cpu_reset(DeviceState *dev)
     env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
     env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
+    nios2_update_crs(env);
 #endif
 
     env->regs[R_ZERO] = 0;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 1e784c8a37..525df7b023 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -100,12 +100,16 @@ typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
     int               mem_idx;
+    bool              crs0;
     TCGv              sink;
     const ControlRegState *cr_state;
 } DisasContext;
 
 static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
+#ifndef CONFIG_USER_ONLY
+static TCGv cpu_crs_R[NUM_GP_REGS];
+#endif
 
 typedef struct Nios2Instruction {
     void     (*handler)(DisasContext *dc, uint32_t code, uint32_t flags);
@@ -127,22 +131,36 @@ static uint8_t get_opxcode(uint32_t code)
 static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
-    if (unlikely(reg == R_ZERO)) {
-        return tcg_constant_tl(0);
+    if (dc->crs0) {
+        if (unlikely(reg == R_ZERO)) {
+            return tcg_constant_tl(0);
+        }
+        return cpu_R[reg];
     }
-    return cpu_R[reg];
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static TCGv dest_gpr(DisasContext *dc, unsigned reg)
 {
     assert(reg < NUM_GP_REGS);
-    if (unlikely(reg == R_ZERO)) {
-        if (dc->sink == NULL) {
-            dc->sink = tcg_temp_new();
+    if (dc->crs0) {
+        if (unlikely(reg == R_ZERO)) {
+            if (dc->sink == NULL) {
+                dc->sink = tcg_temp_new();
+            }
+            return dc->sink;
         }
-        return dc->sink;
+        return cpu_R[reg];
     }
-    return cpu_R[reg];
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    return cpu_crs_R[reg];
+#endif
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
@@ -198,7 +216,7 @@ static void gen_excp(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static bool gen_check_supervisor(DisasContext *dc)
 {
-    if (dc->base.tb->flags & CR_STATUS_U) {
+    if (dc->base.tb->flags & R_TBFLAGS_U_MASK) {
         /* CPU in user mode, privileged instruction called, stop. */
         t_gen_helper_raise_exception(dc, EXCP_SUPERI);
         return false;
@@ -794,6 +812,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->mem_idx = cpu_mmu_index(env, false);
     dc->cr_state = cpu->cr_state;
+    dc->crs0 = FIELD_EX32(dc->base.tb->flags, TBFLAGS, CRS0);
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -927,13 +946,26 @@ void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 void nios2_tcg_init(void)
 {
-    int i;
+#ifndef CONFIG_USER_ONLY
+    TCGv_ptr crs = tcg_global_mem_new_ptr(cpu_env,
+                                          offsetof(CPUNios2State, regs), "crs");
 
-    for (i = 0; i < NUM_GP_REGS; i++) {
-        cpu_R[i] = tcg_global_mem_new(cpu_env,
-                                      offsetof(CPUNios2State, regs[i]),
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_crs_R[i] = tcg_global_mem_new(crs, 4 * i, gr_regnames[i]);
+    }
+
+#define offsetof_regs0(N)  offsetof(CPUNios2State, shadow_regs[0][N])
+#else
+#define offsetof_regs0(N)  offsetof(CPUNios2State, regs[N])
+#endif
+
+    for (int i = 0; i < NUM_GP_REGS; i++) {
+        cpu_R[i] = tcg_global_mem_new(cpu_env, offsetof_regs0(i),
                                       gr_regnames[i]);
     }
+
+#undef offsetof_regs0
+
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
 }
-- 
2.25.1


