Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7059CC40
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:34:34 +0200 (CEST)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGwD-0006T5-A3
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlx-0005ht-Vz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGls-0005dI-7S
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id v23so6009265plo.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8mcpoGyicxvO86RBsxLMjT2beQqB3D9uTqe6maslzKo=;
 b=OJU+Ggx0BJawEPHqLVlm/fs4h6nJypZdAIlSfgKR3OCi0AzQ93LhVDaRfwHtMO6sWN
 fy1sXLZu+wV2QbqDzkA43BD1TzNUy2p0xwbOqkgdFam3NZXqUlDOuPaodgn4xshpH2Dt
 UReEl6dLFffYcL++T07UkdKpsn7M+7GAm/6rI0K7MOw/MB55jJU0BkcIU1U86BUa+RQM
 94JEg9qSRbmSo9p5++lnICwokoF+iG5dkszy7W59Wi5MTV5+dDBOguWFKVRo4JB/TrqP
 ozZNnIX8wwpZJi68WLtkzZrMhJ8ZBvM7uNUpMjOJ/h36KOWnooG2j3SZS0RB5VBZhosn
 MPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8mcpoGyicxvO86RBsxLMjT2beQqB3D9uTqe6maslzKo=;
 b=BmO78VhuSJZ6pKP9kxiizKQs5LpeQW8DqIUD1YpK/0PvMV+1NeAihEMfQ0kxynnnFk
 7XnIOiJJ0EZFoZ5nRCDeuXq2tmuzaSn0EAZqHhQYJngilyjEAvDahNUMk9Ex3pQP8jpF
 9+4o3Hn7+BtFplSmy40cWEkb8vV7GwIjHfXsH07E6Q1cdTLFRHU9lr9uipXcOMmffPc3
 OaUL9f4Yqa3HLaN/p656GkDqySzctE1733yiApcuHXrxSVmqCTRa6mgRV3DJsI5Iwf/R
 nZh93DlRA2Rl6VZlaNBFdirSpdfwfHfRO/Gl08/C8MUIriuijbqOtSl477YpCHWcekHa
 R5TQ==
X-Gm-Message-State: ACgBeo266Rj6TAh94J4mnOLoZyo861BEsssc4HWsmFR1l1VvQIDuc3Z0
 2SvecUF39tAL7zeAkXisX0wwAJx9vwuceA==
X-Google-Smtp-Source: AA6agR5U8vUSAmYLhiBkgTCAFlD3zQBhoxKtbI8rrcCEjCxadqkQ/JCI0XYq0Wg8tKwXp7yyQ351+A==
X-Received: by 2002:a17:902:ed92:b0:172:a334:acbb with SMTP id
 e18-20020a170902ed9200b00172a334acbbmr22171627plj.58.1661210630747; 
 Mon, 22 Aug 2022 16:23:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 10/17] target/arm: Change gen_goto_tb to work on
 displacements
Date: Mon, 22 Aug 2022 16:23:31 -0700
Message-Id: <20220822232338.1727934-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 163df8c615..695ccd0723 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -378,8 +378,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
     return translator_use_goto_tb(&s->base, dest);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
+    uint64_t dest = s->pc_curr + diff;
+
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
@@ -1362,7 +1364,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int diff = sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1371,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, addr);
+    gen_goto_tb(s, 0, diff);
 }
 
 /* Compare and branch (immediate)
@@ -1383,14 +1385,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int sf, op, rt;
-    uint64_t addr;
+    int diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     sf = extract32(insn, 31, 1);
     op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
     rt = extract32(insn, 0, 5);
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
     label_match = gen_new_label();
@@ -1399,9 +1401,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
 
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Test and branch (immediate)
@@ -1413,13 +1415,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int bit_pos, op, rt;
-    uint64_t addr;
+    int diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
     op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    addr = s->pc_curr + sextract32(insn, 5, 14) * 4;
+    diff = sextract32(insn, 5, 14) * 4;
     rt = extract32(insn, 0, 5);
 
     tcg_cmp = tcg_temp_new_i64();
@@ -1430,9 +1432,9 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
     tcg_temp_free_i64(tcg_cmp);
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Conditional branch (immediate)
@@ -1444,13 +1446,13 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int cond;
-    uint64_t addr;
+    int diff;
 
     if ((insn & (1 << 4)) || (insn & (1 << 24))) {
         unallocated_encoding(s);
         return;
     }
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
     cond = extract32(insn, 0, 4);
 
     reset_btype(s);
@@ -1458,12 +1460,12 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
         /* genuinely conditional branches */
         TCGLabel *label_match = gen_new_label();
         arm_gen_test_cc(cond, label_match);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         gen_set_label(label_match);
-        gen_goto_tb(s, 1, addr);
+        gen_goto_tb(s, 1, diff);
     } else {
         /* 0xe and 0xf are both "always" conditions */
-        gen_goto_tb(s, 0, addr);
+        gen_goto_tb(s, 0, diff);
     }
 }
 
@@ -1637,7 +1639,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         reset_btype(s);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     case 7: /* SB */
@@ -1649,7 +1651,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * MB and end the TB instead.
          */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     default:
@@ -14965,7 +14967,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 638a051281..2b9a58b442 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2597,8 +2597,10 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+static void gen_goto_tb(DisasContext *s, int n, int diff)
 {
+    target_ulong dest = s->pc_curr + diff;
+
     if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
@@ -2632,7 +2634,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9806,7 +9808,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9858,7 +9860,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
 }
-- 
2.34.1


