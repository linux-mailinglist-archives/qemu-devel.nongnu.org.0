Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4398336283E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:06:12 +0200 (CEST)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTn9-0000iB-B0
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThP-0003Py-9z
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:17 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThG-0004FS-Iy
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id d10so19803684pgf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDMvl+749g2gHgGetA4XPQIS7uWfkEL7qLXDdrTbRa4=;
 b=Wed6EZOsZy1yKcS98o9YTbBK75ky/cFMBa6fnpUIWByC1KzcRluLfH2+0zbGiEKFnn
 xI52qEaP5vLOx4qTsDegmKwYJ9BCy+h4z3lT98lIVQ2jWa4TZrBvNIS6QRJiuYRWumQD
 X/WYF/NZe/KcjF4BVsPAkPgPXLmfKnMcI0bxfrING/y9MCDruTrcFSBGaptM7RxSgnmv
 DW9F1pRcBl1dVHClSiTV+0NFzoIhEl28AEEWrjriRKvbcYjIIDAGHRhedPvqzrNyjqSI
 wta2uOt2v6pz7aTz5+nmh3Q9eEwIkRWMr6/7W802qTYNQzDlxxkA7BRL5AZg/cWVyO2L
 I7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDMvl+749g2gHgGetA4XPQIS7uWfkEL7qLXDdrTbRa4=;
 b=jse/D4Spp1htuxrnPXe/UUbvtVO8iAJwz81hCRNrOJB6b6mfC00WJvLq93ahUfrzzV
 XuohOrUiQTxYUKTMlkBFqRTAd7LzZvolvKn68Vk76TciHEcoiU7tBTV62nKU9nfam73R
 gZNUgdDUZ85AAJ8WpTFC7n6PN4Jh1AMCsES3IGYgjRfUtGp6HN6AQGwYwnfGB73J3TdL
 CHWmDoplTRoIqmAcF9+ZbcC9r/mLkinIvpN7s/5NWVyUcgiUHysqnwHi4Z5MCUODRQk6
 TlGYfi98k57ccawwUj9cyNqR+UaaVdNyCc7eMJCagnn+Z1JuFwaVLZXFSKH+sPGfk8+l
 M6gw==
X-Gm-Message-State: AOAM531DV+QTeoRba9GcXvAHzUu843CCJ3WvO0Rk/Y7YbbTeW5JH2p0o
 sf4ZA2sPQHxJightcLB2PpWEcV0rVN3Y7g==
X-Google-Smtp-Source: ABdhPJwFR5UMlMwANNZA/5es/GgrpIZnYVAc4G1Htk89ve6n8IRveHFD4eS9OoOA74BUJ5SJzyE06g==
X-Received: by 2002:a05:6a00:212b:b029:259:73ac:7217 with SMTP id
 n11-20020a056a00212bb029025973ac7217mr5750045pfj.20.1618599605313; 
 Fri, 16 Apr 2021 12:00:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/30] target/arm: Introduce CPUARMTBFlags
Date: Fri, 16 Apr 2021 11:59:34 -0700
Message-Id: <20210416185959.1520974-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-arm@nongnu.org
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
index b798ff8115..79af9a7c62 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -225,6 +225,10 @@ typedef struct ARMPACKey {
 } ARMPACKey;
 #endif
 
+/* See the commentary above the TBFLAG field definitions.  */
+typedef struct CPUARMTBFlags {
+    uint32_t flags;
+} CPUARMTBFlags;
 
 typedef struct CPUARMState {
     /* Regs for current mode.  */
@@ -253,7 +257,7 @@ typedef struct CPUARMState {
     uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
-    uint32_t hflags;
+    CPUARMTBFlags hflags;
 
     /* Frequently accessed CPSR bits are stored separately for efficiency.
        This contains all the other bits.  Use cpsr_{read,write} to access
@@ -3466,21 +3470,21 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
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
index 2769e6fd35..9070b773a9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12984,8 +12984,9 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
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
@@ -12996,8 +12997,9 @@ static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
-static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
-                                         ARMMMUIdx mmu_idx, uint32_t flags)
+static CPUARMTBFlags
+rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                         ARMMMUIdx mmu_idx, CPUARMTBFlags flags)
 {
     bool sctlr_b = arm_sctlr_b(env);
 
@@ -13012,10 +13014,10 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
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
@@ -13035,18 +13037,19 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
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
@@ -13060,10 +13063,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
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
@@ -13179,7 +13182,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
-static uint32_t rebuild_hflags_internal(CPUARMState *env)
+static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
@@ -13208,6 +13211,7 @@ void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
     ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
     env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
 }
 
@@ -13228,6 +13232,7 @@ void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
     int el = arm_current_el(env);
     int fp_el = fp_exception_el(env, el);
     ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
@@ -13250,12 +13255,12 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
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
@@ -13264,10 +13269,11 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-    uint32_t flags = env->hflags;
+    CPUARMTBFlags flags;
 
     *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
+    flags = env->hflags;
 
     if (EX_TBFLAG_ANY(flags, AARCH64_STATE)) {
         *pc = env->pc;
@@ -13333,7 +13339,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         DP_TBFLAG_ANY(flags, PSTATE__SS, 1);
     }
 
-    *pflags = flags;
+    *pflags = flags.flags;
 }
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 05d83a5f7a..b32ff56666 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
     ARMCPU *arm_cpu = env_archcpu(env);
-    uint32_t tb_flags = dc->base.tb->flags;
+    CPUARMTBFlags tb_flags = arm_tbflags_from_tb(dc->base.tb);
     int bound, core_mmu_idx;
 
     dc->isar = &arm_cpu->isar;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6774d17e8f..5cec3966d6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8836,7 +8836,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cs->env_ptr;
     ARMCPU *cpu = env_archcpu(env);
-    uint32_t tb_flags = dc->base.tb->flags;
+    CPUARMTBFlags tb_flags = arm_tbflags_from_tb(dc->base.tb);
     uint32_t condexec, core_mmu_idx;
 
     dc->isar = &cpu->isar;
@@ -9348,12 +9348,13 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns)
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


