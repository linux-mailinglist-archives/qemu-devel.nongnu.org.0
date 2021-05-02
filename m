Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1A370D8A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:03:09 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDci-0001v9-Vg
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKo-0001cu-Jq
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKl-0005Gx-Ib
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m11so2368452pfc.11
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ah5G1WYf1ENyHl+qVq+4a4OFQF4iQyUKFh9kb0jd6Y=;
 b=Qx9/hULYA3QR3+3xnJgBmXg9J+vGzdKX+YBOB7TRshr9ojknt/L3BOG4JEm9xGa7/U
 kS9uVJVXqIIeeuzvczzmVUBWF8Bbx8teWIQkxYVoqB5SNtQIxEjVTLWmvoNxAOTf6MXJ
 e0YgKRHx2w9L5DQwHmPDx92qgSl/aApPcl/eB3+5PFp5OUgpkQeWNqggxAYcZVEb+f+4
 A39OuMivaeNbqpXLNJj1Iz/MudLmU9a/H+sjz7R1dQswNE9lJCFgP4ETQzxgI0rbqEQn
 Oos+OMM2NC2d/2N42wQz3au32D86fZe0vhCpvtlqcRKsuBxDZ+99Sv4Vn5c3V6qZj07x
 TTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ah5G1WYf1ENyHl+qVq+4a4OFQF4iQyUKFh9kb0jd6Y=;
 b=n7frh7sIGXDBGoaJCuQIvgB4L0LkGH/g/uzqoGrRna+y1al/hJLZpOzfgFfC/VAFIU
 Ytsd/5kilHukHBKoJhUOvsF/fO601yOg0lbKDvGn3e33xsGRa5RZGEEjFzG4NqC0+xcp
 n5GwkHrtoJFMmiuMICJsheLobiUzawCGQviQaSZidMFVSS0/bRvFQLFfl3oAb6mekGji
 BUV//TZr9+Pr31whFbDnjWo4Ud0iMU8YfSYh59ZaesjgsK04LURIkFZHvYYaSJRFxvHP
 9JpCvcuVL1aVLgpUlQmOjAXoVhWCFflgD0H1h+HHR+mR3nB39/Q6oc55+Pw5n92f6j7c
 +YsA==
X-Gm-Message-State: AOAM530XlWm3SWEU/fJsAfFbHacc7a5wIecpWYfdS4EUDBqC0BUJE29K
 qLn4Np5Rhk1/lD9mlRBKBabCk3ECmxKLEw==
X-Google-Smtp-Source: ABdhPJwNMa3AVA2kyYZW7Ya7aNSlJISzVYHwnrHaJRqxMHfEIDJQV9zVi5PXQ8dnRpMiHvDHSeZijQ==
X-Received: by 2002:aa7:8503:0:b029:27d:497f:1da6 with SMTP id
 v3-20020aa785030000b029027d497f1da6mr14718349pfn.28.1619966674240; 
 Sun, 02 May 2021 07:44:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/31] Hexagon (target/hexagon) compile all debug code
Date: Sun,  2 May 2021 07:44:09 -0700
Message-Id: <20210502144419.1659844-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Change #if HEX_DEBUG to if (HEX_DEBUG) so the debug code doesn't bit rot

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-17-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/helper.h    |  2 --
 target/hexagon/internal.h  | 11 +++---
 target/hexagon/translate.h |  2 --
 target/hexagon/genptr.c    | 72 ++++++++++++++++++-------------------
 target/hexagon/op_helper.c | 14 +++-----
 target/hexagon/translate.c | 74 ++++++++++++++++++--------------------
 6 files changed, 81 insertions(+), 94 deletions(-)

diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
index 715c24662f..efe6069118 100644
--- a/target/hexagon/helper.h
+++ b/target/hexagon/helper.h
@@ -19,11 +19,9 @@
 #include "helper_protos_generated.h.inc"
 
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_RETURN, noreturn, env, i32)
-#if HEX_DEBUG
 DEF_HELPER_1(debug_start_packet, void, env)
 DEF_HELPER_FLAGS_3(debug_check_store_width, TCG_CALL_NO_WG, void, env, int, int)
 DEF_HELPER_FLAGS_3(debug_commit_end, TCG_CALL_NO_WG, void, env, int, int)
-#endif
 DEF_HELPER_2(commit_store, void, env, int)
 DEF_HELPER_FLAGS_4(fcircadd, TCG_CALL_NO_RWG_SE, s32, s32, s32, s32, s32)
 
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 2da85c8606..6b20affdfa 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -22,11 +22,12 @@
  * Change HEX_DEBUG to 1 to turn on debugging output
  */
 #define HEX_DEBUG 0
-#if HEX_DEBUG
-#define HEX_DEBUG_LOG(...) qemu_log(__VA_ARGS__)
-#else
-#define HEX_DEBUG_LOG(...) do { } while (0)
-#endif
+#define HEX_DEBUG_LOG(...) \
+    do { \
+        if (HEX_DEBUG) { \
+            qemu_log(__VA_ARGS__); \
+        } \
+    } while (0)
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 97b12a7d18..703fd1345f 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -41,11 +41,9 @@ typedef struct DisasContext {
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
 {
-#if HEX_DEBUG
     if (test_bit(rnum, ctx->regs_written)) {
         HEX_DEBUG_LOG("WARNING: Multiple writes to r%d\n", rnum);
     }
-#endif
     ctx->reg_log[ctx->reg_log_idx] = rnum;
     ctx->reg_log_idx++;
     set_bit(rnum, ctx->regs_written);
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index b87e264ccf..24d575853c 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -42,17 +42,17 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
     tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
                            val, hex_new_value[rnum]);
-#if HEX_DEBUG
-    /*
-     * Do this so HELPER(debug_commit_end) will know
-     *
-     * Note that slot_mask indicates the value is not written
-     * (i.e., slot was cancelled), so we create a true/false value before
-     * or'ing with hex_reg_written[rnum].
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
-    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
-#endif
+    if (HEX_DEBUG) {
+        /*
+         * Do this so HELPER(debug_commit_end) will know
+         *
+         * Note that slot_mask indicates the value is not written
+         * (i.e., slot was cancelled), so we create a true/false value before
+         * or'ing with hex_reg_written[rnum].
+         */
+        tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
+        tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
+    }
 
     tcg_temp_free(zero);
     tcg_temp_free(slot_mask);
@@ -61,10 +61,10 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
 static inline void gen_log_reg_write(int rnum, TCGv val)
 {
     tcg_gen_mov_tl(hex_new_value[rnum], val);
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movi_tl(hex_reg_written[rnum], 1);
-#endif
+    if (HEX_DEBUG) {
+        /* Do this so HELPER(debug_commit_end) will know */
+        tcg_gen_movi_tl(hex_reg_written[rnum], 1);
+    }
 }
 
 static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
@@ -84,19 +84,19 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
     tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum + 1],
                        slot_mask, zero,
                        val32, hex_new_value[rnum + 1]);
-#if HEX_DEBUG
-    /*
-     * Do this so HELPER(debug_commit_end) will know
-     *
-     * Note that slot_mask indicates the value is not written
-     * (i.e., slot was cancelled), so we create a true/false value before
-     * or'ing with hex_reg_written[rnum].
-     */
-    tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
-    tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
-    tcg_gen_or_tl(hex_reg_written[rnum + 1], hex_reg_written[rnum + 1],
-                  slot_mask);
-#endif
+    if (HEX_DEBUG) {
+        /*
+         * Do this so HELPER(debug_commit_end) will know
+         *
+         * Note that slot_mask indicates the value is not written
+         * (i.e., slot was cancelled), so we create a true/false value before
+         * or'ing with hex_reg_written[rnum].
+         */
+        tcg_gen_setcond_tl(TCG_COND_EQ, slot_mask, slot_mask, zero);
+        tcg_gen_or_tl(hex_reg_written[rnum], hex_reg_written[rnum], slot_mask);
+        tcg_gen_or_tl(hex_reg_written[rnum + 1], hex_reg_written[rnum + 1],
+                      slot_mask);
+    }
 
     tcg_temp_free(val32);
     tcg_temp_free(zero);
@@ -107,17 +107,17 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
 {
     /* Low word */
     tcg_gen_extrl_i64_i32(hex_new_value[rnum], val);
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movi_tl(hex_reg_written[rnum], 1);
-#endif
+    if (HEX_DEBUG) {
+        /* Do this so HELPER(debug_commit_end) will know */
+        tcg_gen_movi_tl(hex_reg_written[rnum], 1);
+    }
 
     /* High word */
     tcg_gen_extrh_i64_i32(hex_new_value[rnum + 1], val);
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
-#endif
+    if (HEX_DEBUG) {
+        /* Do this so HELPER(debug_commit_end) will know */
+        tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
+    }
 }
 
 static inline void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index b70c5d607a..33b67138ca 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -56,10 +56,10 @@ static void log_reg_write(CPUHexagonState *env, int rnum,
     HEX_DEBUG_LOG("\n");
 
     env->new_value[rnum] = val;
-#if HEX_DEBUG
-    /* Do this so HELPER(debug_commit_end) will know */
-    env->reg_written[rnum] = 1;
-#endif
+    if (HEX_DEBUG) {
+        /* Do this so HELPER(debug_commit_end) will know */
+        env->reg_written[rnum] = 1;
+    }
 }
 
 static void log_pred_write(CPUHexagonState *env, int pnum, target_ulong val)
@@ -117,7 +117,6 @@ static void write_new_pc(CPUHexagonState *env, target_ulong addr)
     }
 }
 
-#if HEX_DEBUG
 /* Handy place to set a breakpoint */
 void HELPER(debug_start_packet)(CPUHexagonState *env)
 {
@@ -128,14 +127,12 @@ void HELPER(debug_start_packet)(CPUHexagonState *env)
         env->reg_written[i] = 0;
     }
 }
-#endif
 
 static int32_t new_pred_value(CPUHexagonState *env, int pnum)
 {
     return env->new_pred_value[pnum];
 }
 
-#if HEX_DEBUG
 /* Checks for bookkeeping errors between disassembly context and runtime */
 void HELPER(debug_check_store_width)(CPUHexagonState *env, int slot, int check)
 {
@@ -145,7 +142,6 @@ void HELPER(debug_check_store_width)(CPUHexagonState *env, int slot, int check)
         g_assert_not_reached();
     }
 }
-#endif
 
 void HELPER(commit_store)(CPUHexagonState *env, int slot_num)
 {
@@ -171,7 +167,6 @@ void HELPER(commit_store)(CPUHexagonState *env, int slot_num)
     }
 }
 
-#if HEX_DEBUG
 static void print_store(CPUHexagonState *env, int slot)
 {
     if (!(env->slot_cancelled & (1 << slot))) {
@@ -255,7 +250,6 @@ void HELPER(debug_commit_end)(CPUHexagonState *env, int has_st0, int has_st1)
                   env->gpr[HEX_REG_QEMU_INSN_CNT]);
 
 }
-#endif
 
 static int32_t fcircadd_v4(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 {
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 04684221ca..9a37644182 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -35,9 +35,7 @@ TCGv hex_this_PC;
 TCGv hex_slot_cancelled;
 TCGv hex_branch_taken;
 TCGv hex_new_value[TOTAL_PER_THREAD_REGS];
-#if HEX_DEBUG
 TCGv hex_reg_written[TOTAL_PER_THREAD_REGS];
-#endif
 TCGv hex_new_pred_value[NUM_PREGS];
 TCGv hex_pred_written;
 TCGv hex_store_addr[STORES_MAX];
@@ -90,7 +88,6 @@ static void gen_exception_end_tb(DisasContext *ctx, int excp)
 
 }
 
-#if HEX_DEBUG
 #define PACKET_BUFFER_LEN              1028
 static void print_pkt(Packet *pkt)
 {
@@ -99,10 +96,12 @@ static void print_pkt(Packet *pkt)
     HEX_DEBUG_LOG("%s", buf->str);
     g_string_free(buf, true);
 }
-#define HEX_DEBUG_PRINT_PKT(pkt)  print_pkt(pkt)
-#else
-#define HEX_DEBUG_PRINT_PKT(pkt)  /* nothing */
-#endif
+#define HEX_DEBUG_PRINT_PKT(pkt) \
+    do { \
+        if (HEX_DEBUG) { \
+            print_pkt(pkt); \
+        } \
+    } while (0)
 
 static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
                              uint32_t words[])
@@ -179,11 +178,11 @@ static void gen_start_packet(DisasContext *ctx, Packet *pkt)
     tcg_gen_movi_tl(hex_pkt_has_store_s1, pkt->pkt_has_store_s1);
     ctx->s1_store_processed = false;
 
-#if HEX_DEBUG
-    /* Handy place to set a breakpoint before the packet executes */
-    gen_helper_debug_start_packet(cpu_env);
-    tcg_gen_movi_tl(hex_this_PC, ctx->base.pc_next);
-#endif
+    if (HEX_DEBUG) {
+        /* Handy place to set a breakpoint before the packet executes */
+        gen_helper_debug_start_packet(cpu_env);
+        tcg_gen_movi_tl(hex_this_PC, ctx->base.pc_next);
+    }
 
     /* Initialize the runtime state for packet semantics */
     if (need_pc(pkt)) {
@@ -308,10 +307,11 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
         for (i = 0; i < ctx->preg_log_idx; i++) {
             int pred_num = ctx->preg_log[i];
             tcg_gen_mov_tl(hex_pred[pred_num], hex_new_pred_value[pred_num]);
-#if HEX_DEBUG
-            /* Do this so HELPER(debug_commit_end) will know */
-            tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << pred_num);
-#endif
+            if (HEX_DEBUG) {
+                /* Do this so HELPER(debug_commit_end) will know */
+                tcg_gen_ori_tl(hex_pred_written, hex_pred_written,
+                               1 << pred_num);
+            }
         }
     }
 
@@ -322,13 +322,13 @@ static void gen_pred_writes(DisasContext *ctx, Packet *pkt)
 
 static void gen_check_store_width(DisasContext *ctx, int slot_num)
 {
-#if HEX_DEBUG
-    TCGv slot = tcg_const_tl(slot_num);
-    TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
-    gen_helper_debug_check_store_width(cpu_env, slot, check);
-    tcg_temp_free(slot);
-    tcg_temp_free(check);
-#endif
+    if (HEX_DEBUG) {
+        TCGv slot = tcg_const_tl(slot_num);
+        TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
+        gen_helper_debug_check_store_width(cpu_env, slot, check);
+        tcg_temp_free(slot);
+        tcg_temp_free(check);
+    }
 }
 
 static bool slot_is_predicated(Packet *pkt, int slot_num)
@@ -482,8 +482,7 @@ static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
     process_store_log(ctx, pkt);
     process_dczeroa(ctx, pkt);
     update_exec_counters(ctx, pkt);
-#if HEX_DEBUG
-    {
+    if (HEX_DEBUG) {
         TCGv has_st0 =
             tcg_const_tl(pkt->pkt_has_store_s0 && !pkt->pkt_has_dczeroa);
         TCGv has_st1 =
@@ -495,7 +494,6 @@ static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
         tcg_temp_free(has_st0);
         tcg_temp_free(has_st1);
     }
-#endif
 
     if (pkt->pkt_has_cof) {
         gen_end_tb(ctx);
@@ -655,9 +653,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
 #define NAME_LEN               64
 static char new_value_names[TOTAL_PER_THREAD_REGS][NAME_LEN];
-#if HEX_DEBUG
 static char reg_written_names[TOTAL_PER_THREAD_REGS][NAME_LEN];
-#endif
 static char new_pred_value_names[NUM_PREGS][NAME_LEN];
 static char store_addr_names[STORES_MAX][NAME_LEN];
 static char store_width_names[STORES_MAX][NAME_LEN];
@@ -670,11 +666,11 @@ void hexagon_translate_init(void)
 
     opcode_init();
 
-#if HEX_DEBUG
-    if (!qemu_logfile) {
-        qemu_set_log(qemu_loglevel);
+    if (HEX_DEBUG) {
+        if (!qemu_logfile) {
+            qemu_set_log(qemu_loglevel);
+        }
     }
-#endif
 
     for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
         hex_gpr[i] = tcg_global_mem_new(cpu_env,
@@ -686,13 +682,13 @@ void hexagon_translate_init(void)
             offsetof(CPUHexagonState, new_value[i]),
             new_value_names[i]);
 
-#if HEX_DEBUG
-        snprintf(reg_written_names[i], NAME_LEN, "reg_written_%s",
-                 hexagon_regnames[i]);
-        hex_reg_written[i] = tcg_global_mem_new(cpu_env,
-            offsetof(CPUHexagonState, reg_written[i]),
-            reg_written_names[i]);
-#endif
+        if (HEX_DEBUG) {
+            snprintf(reg_written_names[i], NAME_LEN, "reg_written_%s",
+                     hexagon_regnames[i]);
+            hex_reg_written[i] = tcg_global_mem_new(cpu_env,
+                offsetof(CPUHexagonState, reg_written[i]),
+                reg_written_names[i]);
+        }
     }
     for (i = 0; i < NUM_PREGS; i++) {
         hex_pred[i] = tcg_global_mem_new(cpu_env,
-- 
2.25.1


