Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7CD370D71
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:48:32 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDOZ-0004Tn-Q0
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKi-0001NF-RB
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKf-0005CN-9u
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:32 -0400
Received: by mail-pf1-x436.google.com with SMTP id b15so2404614pfl.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LxA893QCcSE5NR8FvdeWPmP4th9kBJwNhUIEaAJdaM=;
 b=UvdEBnlJ4GrbtgVtRvqDJnKoZO9RuxbBBlj/E6LB6lCAiZ/n7yH5B9XdKjUZS8JNfA
 5M4HpnsYi3KI/Bdtf7jHZjCW0wYDTRq5jLW4lVk5Iuw/eCT/iMCYOE7t8cpExJq+z9mC
 Dkm5/YVw93c+xQYO2wDbaUGJxPbaDE/vllSwatRGdcubxx11GN308CR0/AUkphBKgR++
 0n/MmQDpyhPSQqHn+wMhj3XJBO87jKitBeSzZJYTCsUUOgCbA0Sl6lB99IIb/3aP3Kdz
 1+9lYWZFXecRYLmuj5oM+OpMFt6oj8wP5nM8q35arjZTWv+N9eM78iAyOZ2MpdwiBsWL
 Bimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LxA893QCcSE5NR8FvdeWPmP4th9kBJwNhUIEaAJdaM=;
 b=KcN0ncaqiis5Se5Z7HdBYMGU9No/isNNHy9YNsU5JUuGSQjwat39DEDaxDa9qRn7Yy
 dd7uUH3dxfx6ieMD4GbnRk77zEv5VzO7rLJHD4cZ9R9U6EeXaulbfgQW45PjEfTzQMZ5
 RtXlf3kVlFisCdWjXUpmTwnPOh12OM3C44WMAOn5E7Dd6rqmWf3XeBuWiYwZT+1INwiQ
 dTojM/yxsmLwaT5IQvhYGCqX0r7M8XGEIIVfnQ3TvGFc5PJoJbBYvAzW2p6EIvCWhCvI
 sy2s2FRhvJ6bs/TaO71piO2+hrOTxAByviTkP3jFmdwInzKSLfRAMOqIQhNBlnqnj7U0
 YVrQ==
X-Gm-Message-State: AOAM531GUDzsJAFxFR4iHMkkJjWkY7hRgTEsI3r5w7yPtC5MSJMtaIFn
 SuYlh6qvYbHetcs/mZ1ASPtyIVXzUXNBHA==
X-Google-Smtp-Source: ABdhPJzPKGeEkUOSSqQkVVNL/Bd6IUeXxYpX5QU6umqj0CaPAJjUT3rlx0i0hHbAkbxDfdclM4tzEA==
X-Received: by 2002:a65:5088:: with SMTP id r8mr13527326pgp.12.1619966667242; 
 Sun, 02 May 2021 07:44:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/31] Hexagon (target/hexagon) properly generate TB end for
 DISAS_NORETURN
Date: Sun,  2 May 2021 07:43:58 -0700
Message-Id: <20210502144419.1659844-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

When exiting a TB, generate all the code before returning from
hexagon_tr_translate_packet so that nothing needs to be done in
hexagon_tr_tb_stop.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-6-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.h |  3 --
 target/hexagon/translate.c | 62 ++++++++++++++++++++------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 938f7fbb9f..12506c8caf 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -86,8 +86,5 @@ extern TCGv hex_llsc_addr;
 extern TCGv hex_llsc_val;
 extern TCGv_i64 hex_llsc_val_i64;
 
-void gen_exception(int excp);
-void gen_exception_debug(void);
-
 void process_store(DisasContext *ctx, Packet *pkt, int slot_num);
 #endif
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index e235fdb315..9f2a531969 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -54,16 +54,40 @@ static const char * const hexagon_prednames[] = {
   "p0", "p1", "p2", "p3"
 };
 
-void gen_exception(int excp)
+static void gen_exception_raw(int excp)
 {
     TCGv_i32 helper_tmp = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, helper_tmp);
     tcg_temp_free_i32(helper_tmp);
 }
 
-void gen_exception_debug(void)
+static void gen_exec_counters(DisasContext *ctx)
 {
-    gen_exception(EXCP_DEBUG);
+    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_PKT_CNT],
+                    hex_gpr[HEX_REG_QEMU_PKT_CNT], ctx->num_packets);
+    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_INSN_CNT],
+                    hex_gpr[HEX_REG_QEMU_INSN_CNT], ctx->num_insns);
+}
+
+static void gen_end_tb(DisasContext *ctx)
+{
+    gen_exec_counters(ctx);
+    tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
+    if (ctx->base.singlestep_enabled) {
+        gen_exception_raw(EXCP_DEBUG);
+    } else {
+        tcg_gen_exit_tb(NULL, 0);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+static void gen_exception_end_tb(DisasContext *ctx, int excp)
+{
+    gen_exec_counters(ctx);
+    tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
+    gen_exception_raw(excp);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
 }
 
 #if HEX_DEBUG
@@ -225,8 +249,7 @@ static void gen_insn(CPUHexagonState *env, DisasContext *ctx,
         mark_implicit_writes(ctx, insn);
         insn->generate(env, ctx, insn, pkt);
     } else {
-        gen_exception(HEX_EXCP_INVALID_OPCODE);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_OPCODE);
     }
 }
 
@@ -447,14 +470,6 @@ static void update_exec_counters(DisasContext *ctx, Packet *pkt)
     ctx->num_insns += num_real_insns;
 }
 
-static void gen_exec_counters(DisasContext *ctx)
-{
-    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_PKT_CNT],
-                    hex_gpr[HEX_REG_QEMU_PKT_CNT], ctx->num_packets);
-    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_INSN_CNT],
-                    hex_gpr[HEX_REG_QEMU_INSN_CNT], ctx->num_insns);
-}
-
 static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
 {
     gen_reg_writes(ctx);
@@ -478,7 +493,7 @@ static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
 #endif
 
     if (pkt->pkt_has_cof) {
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_end_tb(ctx);
     }
 }
 
@@ -491,8 +506,7 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
 
     nwords = read_packet_words(env, ctx, words);
     if (!nwords) {
-        gen_exception(HEX_EXCP_INVALID_PACKET);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
         return;
     }
 
@@ -505,8 +519,7 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
         gen_commit_packet(ctx, &pkt);
         ctx->base.pc_next += pkt.encod_pkt_size_in_bytes;
     } else {
-        gen_exception(HEX_EXCP_INVALID_PACKET);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
     }
 }
 
@@ -536,9 +549,7 @@ static bool hexagon_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    gen_exception_debug();
+    gen_exception_end_tb(ctx, EXCP_DEBUG);
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be
@@ -601,19 +612,12 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_exec_counters(ctx);
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
         if (ctx->base.singlestep_enabled) {
-            gen_exception_debug();
+            gen_exception_raw(EXCP_DEBUG);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
         break;
     case DISAS_NORETURN:
-        gen_exec_counters(ctx);
-        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
-        if (ctx->base.singlestep_enabled) {
-            gen_exception_debug();
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


