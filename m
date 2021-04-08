Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFC3579FA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 04:00:06 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUJxl-0001W8-FC
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 22:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvv-0008Cl-5F
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:11 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUJvr-00061d-Ig
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 21:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617847087; x=1649383087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxJFdPYquFe04QeSDt7EGv9e1Qf8maYZFLRk5nh3zTg=;
 b=wIb+K1z+7MQ/oyZnb5D2UZOg24g7CPPBc1KwajY7W0VwQSFAF6mEhdEQ
 PJwuCOuMcsik5FR/HPR615uFHF7jcmxj/GuGXwpj4U+vwka0agcXDTsET
 nVk2p2GYjroFJcCLxdYJriw29ZfJUSCZJMOANiuj9kgJv07qZ8FCu07TL I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2021 18:57:57 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 07 Apr 2021 18:57:56 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BAA1DFF0; Wed,  7 Apr 2021 20:57:54 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/26] Hexagon (target/hexagon) properly generate TB end
 for DISAS_NORETURN
Date: Wed,  7 Apr 2021 20:57:26 -0500
Message-Id: <1617847067-9867-6-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When exiting a TB, generate all the code before returning from
hexagon_tr_translate_packet so that nothing needs to be done in
hexagon_tr_tb_stop.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/translate.c | 62 ++++++++++++++++++++++++----------------------
 target/hexagon/translate.h |  3 ---
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index e235fdb..9f2a531 100644
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
+{
+    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_PKT_CNT],
+                    hex_gpr[HEX_REG_QEMU_PKT_CNT], ctx->num_packets);
+    tcg_gen_addi_tl(hex_gpr[HEX_REG_QEMU_INSN_CNT],
+                    hex_gpr[HEX_REG_QEMU_INSN_CNT], ctx->num_insns);
+}
+
+static void gen_end_tb(DisasContext *ctx)
 {
-    gen_exception(EXCP_DEBUG);
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
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 938f7fb..12506c8 100644
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
-- 
2.7.4


