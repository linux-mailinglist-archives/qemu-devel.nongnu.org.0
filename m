Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B3370890
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:57:19 +0200 (CEST)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcunm-0003oH-A0
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaY-0008Ea-Ni
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaT-0008V8-66
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:38 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i13so1346828pfu.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LxA893QCcSE5NR8FvdeWPmP4th9kBJwNhUIEaAJdaM=;
 b=iU4TjVXdD8+XQbDhc2xH4kXxlKjDNnb+k2ZQPEOozkkgApVkyRXNhsC3YLN/ghH3FC
 efwCjI/2iulyCktabJ9Db9anzOsab5jVA5kqWZorBQ1lVxBo8dxy7eK3VUz61p2RJRfW
 hRvMuuNqhCP0dW/6eczrQWolVb3N1WJ7DS08CRT0nEVnEDi8Ox6/v2nmZrcB9cn2a2R0
 aCotAz6bnXvgdxIe+QX9n8WS4WMjVMkfUaPvadRHlxLx9THHGtN6Kh+66y2v8Xz0F9dX
 6yGy/bQwbK9XHgDO0Njx83vSF08dTi7/vziQaPhgM4VjxH0NIlH8wRlHyhkLsVA8W5z0
 6KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2LxA893QCcSE5NR8FvdeWPmP4th9kBJwNhUIEaAJdaM=;
 b=GFN9/ttmvVHKDhrPwx8aVd4z7Q/Ou0q1Q9488vB2Y+PVtuTCZUDMDd/nuvLZkbUhaP
 Q8B6UzVJb2g7QmShssskBbYT3AY14WMTWraD38l7Wdp8D9m6dv3CBZevpCGiNfLRSHIr
 j+3CsAC0Vp0Odk+nO7vpKJs/p8VyGiJ6GBNQmjMuU8orhL4y6fxy68UgoV8mabM2wzjJ
 ABs7AmEJuPpUYrSf9EyMaKti7p9EBO3NLZZtlFqUDl/cpoVO1B1+95yFYO00xgx/dd47
 eEQdwiRpatsCwT27YN0BCSYqUoXLTIRsI/W46xXUBtT1HXNKZ21yHuk0QzFssqarIsKH
 +Exg==
X-Gm-Message-State: AOAM532uVuE2A7gzj69eb234qGOOa7Q8r3uZWYFvVbLXSq0pnzCGEsZM
 co9Lj948LcfLbCCUQ+zpWvHq2GB8m4EMSQ==
X-Google-Smtp-Source: ABdhPJwqcWydEi4HWoJbqHqHKV8X6V7LZ8itPy9pDpfwSJXlnJLS9hyuezIx/9r7mN7+6t5ITe2jAw==
X-Received: by 2002:a65:4486:: with SMTP id l6mr10536924pgq.347.1619894611885; 
 Sat, 01 May 2021 11:43:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] Hexagon (target/hexagon) properly generate TB end for
 DISAS_NORETURN
Date: Sat,  1 May 2021 11:43:03 -0700
Message-Id: <20210501184324.1338186-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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


