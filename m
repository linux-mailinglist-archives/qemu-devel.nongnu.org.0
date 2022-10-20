Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC63606309
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:28:38 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWXD-0003vC-LL
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:28:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWOu-0003wk-9E
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZJ-0001at-Pi
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYy-000153-9n
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a3so34065620wrt.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DpjZp4dl1hVG0u87x4A0eXgFA6wzpoWehKiSigLd7fQ=;
 b=QTBQwzJKqmTbodEeS/3MHhSnxgYvgh+6DJyyO3xkuS963lkxi71FWDCp+YGzwWeWom
 rGDAyyfcI6zoFHM5IuXgU/5+VraOHa5oHTjuSqp7+1XyZpHDd7hn+HOKiIxFotps8xEB
 x7etAtnJ4EMRzwxC2E5VJQ4rJP2H9jgVwSgKBdj4yUvZ/bgoaGbDcUb5za/L3AXaS9K9
 1yPAQN3U100EEEJpNSkBMFdOQmMlJw/5JyWw7KKoKjw7QQd4zCul0QDe5dG2Ts7U9dqF
 8QL+qpIXFPA4J+5P7U4i51NIJFk5iZPLwIl0nAkKWrXDeGT5cHsfML9NjQQsZSvNKZ1o
 CfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpjZp4dl1hVG0u87x4A0eXgFA6wzpoWehKiSigLd7fQ=;
 b=vHJy5Yz9CDK52woCcba/5tW81AbXT3z2GTh0VX9ZHUdJsRACdIOfBCAASLkY2+4luR
 KkM2N1Ss+E+lhp8ojGYkOnTIPv5aIgg/OHT6Ks2K1+LG+GKxBbXiAFMJqFrZnM4eYWrD
 FZXlzdbTxksMm5QSCi5/AGqioBAQXpSgPg0GvKUv7sxlQYrXch/9NORVwxMBpKei82yq
 6NCGiOSTy3CURmW+B0qMxKG7YAwKVfDlX0CZ3bQ2zPOvY4q0oWbsPB0Ls2Ezo8cOk4NQ
 yrzYj1m7rN/bolTYbQEUhVO3HFKDoAK+6qxPJ0H9izqyw697SHaBvywj4dtOqJ4ux/Zz
 6rSA==
X-Gm-Message-State: ACrzQf3ZVeloG0DsuG5QoXhu0yeoevCBEgBuPXMoXD8isAx3mMcALcvN
 Tdtx5fhyN35NcSkerpXmGRrM0oMoT4zYLQ==
X-Google-Smtp-Source: AMsMyM617TXsDYDub6MiUAH+7cY+FdrqtjS9FuAGwQInx6ColMTvZPosfO0B0hG8Yl7rIQd7PLqI+A==
X-Received: by 2002:a5d:47c5:0:b0:22e:6941:81eb with SMTP id
 o5-20020a5d47c5000000b0022e694181ebmr8320150wrc.408.1666268529688; 
 Thu, 20 Oct 2022 05:22:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] target/arm: Change gen_goto_tb to work on displacements
Date: Thu, 20 Oct 2022 13:21:38 +0100
Message-Id: <20221020122146.3177980-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 60ff753d817..928445a7cb9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -370,8 +370,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
     return translator_use_goto_tb(&s->base, dest);
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+static void gen_goto_tb(DisasContext *s, int n, int64_t diff)
 {
+    uint64_t dest = s->pc_curr + diff;
+
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
@@ -1354,7 +1356,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int64_t diff = sextract32(insn, 0, 26) * 4;
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
@@ -1363,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     /* B Branch / BL Branch with link */
     reset_btype(s);
-    gen_goto_tb(s, 0, addr);
+    gen_goto_tb(s, 0, diff);
 }
 
 /* Compare and branch (immediate)
@@ -1375,14 +1377,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int sf, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     sf = extract32(insn, 31, 1);
     op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
     rt = extract32(insn, 0, 5);
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
 
     tcg_cmp = read_cpu_reg(s, rt, sf);
     label_match = gen_new_label();
@@ -1391,9 +1393,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
     tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
                         tcg_cmp, 0, label_match);
 
-    gen_goto_tb(s, 0, s->base.pc_next);
+    gen_goto_tb(s, 0, 4);
     gen_set_label(label_match);
-    gen_goto_tb(s, 1, addr);
+    gen_goto_tb(s, 1, diff);
 }
 
 /* Test and branch (immediate)
@@ -1405,13 +1407,13 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
 static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int bit_pos, op, rt;
-    uint64_t addr;
+    int64_t diff;
     TCGLabel *label_match;
     TCGv_i64 tcg_cmp;
 
     bit_pos = (extract32(insn, 31, 1) << 5) | extract32(insn, 19, 5);
     op = extract32(insn, 24, 1); /* 0: TBZ; 1: TBNZ */
-    addr = s->pc_curr + sextract32(insn, 5, 14) * 4;
+    diff = sextract32(insn, 5, 14) * 4;
     rt = extract32(insn, 0, 5);
 
     tcg_cmp = tcg_temp_new_i64();
@@ -1422,9 +1424,9 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
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
@@ -1436,13 +1438,13 @@ static void disas_test_b_imm(DisasContext *s, uint32_t insn)
 static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
 {
     unsigned int cond;
-    uint64_t addr;
+    int64_t diff;
 
     if ((insn & (1 << 4)) || (insn & (1 << 24))) {
         unallocated_encoding(s);
         return;
     }
-    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
+    diff = sextract32(insn, 5, 19) * 4;
     cond = extract32(insn, 0, 4);
 
     reset_btype(s);
@@ -1450,12 +1452,12 @@ static void disas_cond_b_imm(DisasContext *s, uint32_t insn)
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
 
@@ -1629,7 +1631,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         reset_btype(s);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     case 7: /* SB */
@@ -1641,7 +1643,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * MB and end the TB instead.
          */
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-        gen_goto_tb(s, 0, s->base.pc_next);
+        gen_goto_tb(s, 0, 4);
         return;
 
     default:
@@ -14946,7 +14948,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5752b7af5cb..ae30c26ca4b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2590,8 +2590,10 @@ static void gen_goto_ptr(void)
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
@@ -2625,7 +2627,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9793,7 +9795,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9845,7 +9847,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_set_pc_im(dc, dc->base.pc_next);
             gen_singlestep_exception(dc);
         } else {
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
         }
     }
 }
-- 
2.25.1


