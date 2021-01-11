Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8232F1E87
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:05:55 +0100 (CET)
Received: from localhost ([::1]:53422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2Vm-0000Js-AS
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RV-0005oo-2x
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:29 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RS-0006OK-NT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:28 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q4so333085plr.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3gPsRgSV9emvsK63Aw7U+QzPwKlYGtgQ7T1VzVraGc=;
 b=tsvogfq8bMSN8rPfJF/PwGWlTD/SgDMoQ36jhWYakN53EEajAbco025MdjTqVPY7+2
 wujiCdqqbQcrwmnMvQkKKJ8woILa6Ysc/X5erETzpoeK8W3sLlqe2HbGJyJ0tk0KKWMr
 eynd8sVT24zn0yItzQ7Hc0Emv51+Rkpfa6vt3UvfbPcz/zIulgvGOT013D7R2rUVxP2X
 umm2Bcd5NELT9xVgFOPHRGuxmMT8dCPX5IJFkV//dDDmhBkmWTOhpXBZlZa6NKgZpOZE
 It4fBO2QoUp4TOR16a451D/bdpzd9HA50JZ+tuxPvv5eTsbMlJaiDZOBFUfSGJmSbuCA
 iDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3gPsRgSV9emvsK63Aw7U+QzPwKlYGtgQ7T1VzVraGc=;
 b=Gl/jT/MLCZJMSfhFBGrPpEy70faua9tOxBBHSwUlPnYAKo4vIb/bwCGFk8iKPfhEpE
 6xrQTLR4AK+ekk8Ar7QeZWYAi+55MAOnl5PukfmlKq+GGhywx4BW7aoC+fJS4NGWBh2w
 I3YAylNtTXgQKSzrqoAVgaXyZew5tXiSYrRDR4+nnY+12VFGIpo8UaWArZe7KPDPeaHu
 su7vukyApQZ8o4ULkEolZ4541s37bkyWi5qha7Xo1/FKkHH7qQXClhXC1TrbhaWrJhpy
 m0fm+B8mGiPJU3YAnZ5xmDcaKoxUIlrUKqcbtXkpgE9Iuj2jjE6QSQu7AIYjORSxGVx6
 ztMw==
X-Gm-Message-State: AOAM53318uOxkL7dGB8KTFSRLm6CaisgcebHR2lNvCvbHeXwjiUQuoD5
 ccg/57Z5deUQsRQ5y9s7js4vORgjfjOJVg==
X-Google-Smtp-Source: ABdhPJzWfjzfYh6nVsorxA6m0aHVwuRGwLyUnxSpmw7rqO78uceHrd5bYJqU5zk14G/yyZUOAZ8dBw==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr276172pjb.5.1610391685019; 
 Mon, 11 Jan 2021 11:01:25 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/30] target/arm: Introduce CPUARMTBFlags
Date: Mon, 11 Jan 2021 09:00:48 -1000
Message-Id: <20210111190113.303726-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for splitting tb->flags across multiple
fields, introduce a structure to hold the value(s).
So far this only migrates the one uint32_t and fixes
all of the places that require adjustment to match.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 26 +++++++++++---------
 target/arm/translate.h     | 11 +++++++++
 target/arm/helper.c        | 50 +++++++++++++++++++++-----------------
 target/arm/translate-a64.c |  2 +-
 target/arm/translate.c     |  7 +++---
 5 files changed, 59 insertions(+), 37 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 894266ef02..c7700c9c85 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -218,6 +218,10 @@ typedef struct ARMPACKey {
 } ARMPACKey;
 #endif
 
+/* See the commentary above the TBFLAG field definitions.  */
+typedef struct CPUARMTBFlags {
+    uint32_t flags;
+} CPUARMTBFlags;
 
 typedef struct CPUARMState {
     /* Regs for current mode.  */
@@ -246,7 +250,7 @@ typedef struct CPUARMState {
     uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
-    uint32_t hflags;
+    CPUARMTBFlags hflags;
 
     /* Frequently accessed CPSR bits are stored separately for efficiency.
        This contains all the other bits.  Use cpsr_{read,write} to access
@@ -3336,21 +3340,21 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
  * Helpers for using the above.
  */
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
-    (DST = FIELD_DP32(DST, TBFLAG_ANY, WHICH, VAL))
+    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
-    (DST = FIELD_DP32(DST, TBFLAG_A64, WHICH, VAL))
+    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
-    (DST = FIELD_DP32(DST, TBFLAG_A32, WHICH, VAL))
+    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A32, WHICH, VAL))
 #define DP_TBFLAG_M32(DST, WHICH, VAL) \
-    (DST = FIELD_DP32(DST, TBFLAG_M32, WHICH, VAL))
+    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_M32, WHICH, VAL))
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
-    (DST = FIELD_DP32(DST, TBFLAG_AM32, WHICH, VAL))
+    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_AM32, WHICH, VAL))
 
-#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN, TBFLAG_ANY, WHICH)
-#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A64, WHICH)
-#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_A32, WHICH)
-#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN, TBFLAG_M32, WHICH)
-#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN, TBFLAG_AM32, WHICH)
+#define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_ANY, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags, TBFLAG_AM32, WHICH)
 
 /**
  * cpu_mmu_index:
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df..f30287e554 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -394,6 +394,17 @@ typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
 
+/**
+ * arm_tbflags_from_tb:
+ * @tb: the TranslationBlock
+ *
+ * Extract the flag values from @tb.
+ */
+static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
+{
+    return (CPUARMTBFlags){ tb->flags };
+}
+
 /*
  * Enum for argument to fpstatus_ptr().
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 76bb306f26..cc73acc927 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12743,8 +12743,9 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 }
 #endif
 
-static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
-                                      ARMMMUIdx mmu_idx, uint32_t flags)
+static CPUARMTBFlags
+rebuild_hflags_common(CPUARMState *env, int fp_el,
+                      ARMMMUIdx mmu_idx, CPUARMTBFlags flags)
 {
     DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
     DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
@@ -12755,8 +12756,9 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
-static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
-                                         ARMMMUIdx mmu_idx, uint32_t flags)
+static CPUARMTBFlags
+rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                         ARMMMUIdx mmu_idx, CPUARMTBFlags flags)
 {
     bool sctlr_b = arm_sctlr_b(env);
 
@@ -12771,10 +12773,10 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
-                                   ARMMMUIdx mmu_idx)
+static CPUARMTBFlags
+rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
 {
-    uint32_t flags = 0;
+    CPUARMTBFlags flags = {};
 
     if (arm_v7m_is_handler_mode(env)) {
         DP_TBFLAG_M32(flags, HANDLER, 1);
@@ -12794,18 +12796,19 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
+static CPUARMTBFlags
+rebuild_hflags_aprofile(CPUARMState *env)
 {
-    int flags = 0;
+    CPUARMTBFlags flags = {};
 
     DP_TBFLAG_ANY(flags, DEBUG_TARGET_EL, arm_debug_target_el(env));
     return flags;
 }
 
-static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
-                                   ARMMMUIdx mmu_idx)
+static CPUARMTBFlags
+rebuild_hflags_a32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
 {
-    uint32_t flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
 
     if (arm_el_is_aa64(env, 1)) {
         DP_TBFLAG_A32(flags, VFPEN, 1);
@@ -12819,10 +12822,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
-                                   ARMMMUIdx mmu_idx)
+static CPUARMTBFlags
+rebuild_hflags_a64(CPUARMState *env, int el, int fp_el, ARMMMUIdx mmu_idx)
 {
-    uint32_t flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
@@ -12937,7 +12940,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_internal(CPUARMState *env)
+static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
@@ -12966,6 +12969,7 @@ void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
     ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
     env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
 }
 
@@ -12986,6 +12990,7 @@ void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
     ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
@@ -13008,12 +13013,12 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 {
 #ifdef CONFIG_DEBUG_TCG
-    uint32_t env_flags_current = env->hflags;
-    uint32_t env_flags_rebuilt = rebuild_hflags_internal(env);
+    CPUARMTBFlags c = env->hflags;
+    CPUARMTBFlags r = rebuild_hflags_internal(env);
 
-    if (unlikely(env_flags_current != env_flags_rebuilt)) {
+    if (unlikely(c.flags != r.flags)) {
         fprintf(stderr, "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
-                env_flags_current, env_flags_rebuilt);
+                c.flags, r.flags);
         abort();
     }
 #endif
@@ -13022,11 +13027,12 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    uint32_t flags = env->hflags;
+    CPUARMTBFlags flags;
     uint32_t pstate_for_ss;
 
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
+    flags = env->hflags;
 
     if (EX_TBFLAG_ANY(flags, AARCH64_STATE)) {
         *pc = env->pc;
@@ -13094,7 +13100,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         DP_TBFLAG_ANY(flags, PSTATE__SS, 1);
     }
 
-    *pflags = flags;
+    *pflags = flags.flags;
 }
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c260fc573d..010e81e0b4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14685,7 +14685,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
     ARMCPU *arm_cpu = env_archcpu(env);
-    uint32_t tb_flags = dc->base.tb->flags;
+    CPUARMTBFlags tb_flags = arm_tbflags_from_tb(dc->base.tb);
     int bound, core_mmu_idx;
 
     dc->isar = &arm_cpu->isar;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87ba22d1b6..189b2ee3cb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8799,7 +8799,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cs->env_ptr;
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t tb_flags = dc->base.tb->flags;
+    CPUARMTBFlags tb_flags = arm_tbflags_from_tb(dc->base.tb);
     uint32_t condexec, core_mmu_idx;
 
     dc->isar = &cpu->isar;
@@ -9311,12 +9311,13 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
     DisasContext dc = { };
     const TranslatorOps *ops = &arm_translator_ops;
+    CPUARMTBFlags tb_flags = arm_tbflags_from_tb(tb);
 
-    if (EX_TBFLAG_AM32(tb->flags, THUMB)) {
+    if (EX_TBFLAG_AM32(tb_flags, THUMB)) {
         ops = &thumb_translator_ops;
     }
 #ifdef TARGET_AARCH64
-    if (EX_TBFLAG_ANY(tb->flags, AARCH64_STATE)) {
+    if (EX_TBFLAG_ANY(tb_flags, AARCH64_STATE)) {
         ops = &aarch64_translator_ops;
     }
 #endif
-- 
2.25.1


