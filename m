Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6B348740
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:00:58 +0100 (CET)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGEz-0006Ua-HA
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4g-00035w-MB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:18 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:1696)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4e-0002bm-5p
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640616; x=1648176616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jNrOdmQxJl0c2xX4pFV8sqmZ+8vTUVM89UXf22q8qs=;
 b=ro9lZZrvIYKVnUppnXXjUmss4ds1dDJGkbL+9EDrhGanfclGHCUIMO1l
 FzSeq4lLFs4UU/chjphr5gxrppvop+75pOBXdLkb6Kq0AoxsNwhmhespt
 NIr4NPio2p1G2AkWPpfFdlM3PbLZGwbruMYWCdgvHNoTllQE9Arvjigms E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D9D6EF3E; Wed, 24 Mar 2021 21:50:11 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/15] Hexagon (target/hexagon) properly generate TB end for
 DISAS_NORETURN
Date: Wed, 24 Mar 2021 21:49:58 -0500
Message-Id: <1616640610-17319-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
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

Address feedback from Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/translate.c | 62 +++++++++++++++++++++++++---------------------
 target/hexagon/translate.h |  3 ---
 2 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 5d92ab0..19b9bc7 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -54,16 +54,41 @@ static const char * const hexagon_prednames[] = {
   "p0", "p1", "p2", "p3"
 };
 
-void gen_exception(int excp)
+static void gen_exception(int excp)
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
+        gen_exception(EXCP_DEBUG);
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
+    gen_exception(excp);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
 }
 
 #if HEX_DEBUG
@@ -225,8 +250,7 @@ static void gen_insn(CPUHexagonState *env, DisasContext *ctx,
         mark_implicit_writes(ctx, insn);
         insn->generate(env, ctx, insn, pkt);
     } else {
-        gen_exception(HEX_EXCP_INVALID_OPCODE);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_OPCODE);
     }
 }
 
@@ -447,14 +471,6 @@ static void update_exec_counters(DisasContext *ctx, Packet *pkt)
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
@@ -478,7 +494,7 @@ static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
 #endif
 
     if (pkt->pkt_has_cof) {
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_end_tb(ctx);
     }
 }
 
@@ -491,8 +507,7 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
 
     nwords = read_packet_words(env, ctx, words);
     if (!nwords) {
-        gen_exception(HEX_EXCP_INVALID_PACKET);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
         return;
     }
 
@@ -505,8 +520,7 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
         gen_commit_packet(ctx, &pkt);
         ctx->base.pc_next += pkt.encod_pkt_size_in_bytes;
     } else {
-        gen_exception(HEX_EXCP_INVALID_PACKET);
-        ctx->base.is_jmp = DISAS_NORETURN;
+        gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
     }
 }
 
@@ -537,8 +551,7 @@ static bool hexagon_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    gen_exception_debug();
+    gen_exception_end_tb(ctx, EXCP_DEBUG);
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be
@@ -601,19 +614,12 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_exec_counters(ctx);
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
         if (ctx->base.singlestep_enabled) {
-            gen_exception_debug();
+            gen_exception(EXCP_DEBUG);
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


