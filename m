Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70E5F15D0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 00:10:21 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeOD5-0003o2-Pv
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 18:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6P-0001fx-8X
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:27 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:33306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6M-0002YJ-1F
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 18:03:23 -0400
Received: by mail-qk1-x72b.google.com with SMTP id h28so3681525qka.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+B8rOtkjvONjZSA2MWgoQbv6N8UN3QaAqQ4YsJ87nAo=;
 b=DZ018cOhANM3iGgmBtCGePN2toJxeG6/s7RKRUZOhyFh7d9ADLk6lZVNrVzQPvwaCH
 5ClrJ2/QILcOmeyktRuEMLp3q4cvPG0smt6bZbE1Ly8Xip9KDZjHLK/C8NpF5aKiDXKQ
 ZdL2NsTlsaLBkRwsIz7KaS04FpSlfoz8L+1cQ4tD6Vwt51MUPKFo0QZfKy+kLtkrs7xN
 3jmyCRJqjxnF6uz187VzVxR9x+7sZXHyKVTal8LZpLgvI+N4kFbdAtm9J8sAtTwRKOKl
 4QOi+DEC8/pZM9YbixPRTb/SI7lV43JNzDVC6hiPxZXd2drRpstXhY5WBizcciX+fDww
 8l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+B8rOtkjvONjZSA2MWgoQbv6N8UN3QaAqQ4YsJ87nAo=;
 b=uOiMhSV+zGHw4fb86RkKsdbtldRlWX2XeARnM9r78SKcPjvnpqVmPSft7brBBC9krz
 Ctqn4dcdlE9QROjjcjYuVS1qpmuiZsiGaqECpRSUka9Av6wCCYBN3QXl/X+Kk6fUIp9/
 h/TcCISDAKQtjYLJD9sGeFXIRDtjHy2C776OdQ4PH6G2MEVQfmz+P1RJYVqNq69PC1wU
 fMSUz6cjEY7co/zt8lRJg5I82hQ/LgJ6xfVQ3+E/0t57ab33asMOGaI/SX+Gf9K+0d7N
 u/uHDDtjhD0pQs3EqM79Yi8NVxUB82k2B7Ql7h/gxsiAlsZH+hrgWIK3w/keIsYmsCaM
 wH7g==
X-Gm-Message-State: ACrzQf1NNslhgIdDX1kzJisbP5ABD0OpqcCQyL894jhW32JFPIRBuTcq
 aRweTn6XYuHLPSFVNwv+GgCVeRGyHRYGjg==
X-Google-Smtp-Source: AMsMyM77BysssAp68b4o2gWvKpF+bfKB2m3wgdWldmgJwNImP50cmGP1T33hKYVSDHInILoBUJvDDQ==
X-Received: by 2002:a05:620a:151b:b0:6ce:1584:49f2 with SMTP id
 i27-20020a05620a151b00b006ce158449f2mr7769142qkk.195.1664575400937; 
 Fri, 30 Sep 2022 15:03:20 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 2/9] target/arm: Change gen_goto_tb to work on displacements
Date: Fri, 30 Sep 2022 15:03:05 -0700
Message-Id: <20220930220312.135327-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
 target/arm/translate.c     | 10 ++++++----
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 78b2d91ed4..8f5c2675f7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -378,8 +378,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
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
@@ -1362,7 +1364,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
  */
 static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 {
-    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
+    int64_t diff = sextract32(insn, 0, 26) * 4;
 
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
+    int64_t diff;
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
+    int64_t diff;
 
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
@@ -14955,7 +14957,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, 4);
             break;
         default:
         case DISAS_UPDATE_EXIT:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 42e11102f7..6855128fb1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2594,8 +2594,10 @@ static void gen_goto_ptr(void)
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
@@ -2629,7 +2631,7 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
          *    gen_jmp();
          * on the second call to gen_jmp().
          */
-        gen_goto_tb(s, tbno, dest);
+        gen_goto_tb(s, tbno, dest - s->pc_curr);
         break;
     case DISAS_UPDATE_NOCHAIN:
     case DISAS_UPDATE_EXIT:
@@ -9798,7 +9800,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->base.pc_next);
+            gen_goto_tb(dc, 1, curr_insn_len(dc));
             break;
         case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
@@ -9850,7 +9852,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


