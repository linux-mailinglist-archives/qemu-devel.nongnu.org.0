Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4B5F5FE1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:03:07 +0200 (CEST)
Received: from localhost ([::1]:32860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI6E-0001vR-AK
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoI-00049z-Je
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoF-0003sS-9u
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w2so971979pfb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TLniamy6RaDceg5E0CUD7LIlTHkR5S1SB06UOtygodc=;
 b=w9vt/YLyF/hVtuR7f6b++MUu3+MKL5sG9x5mtWr77fo75ZBy3ckF7OEJsnxGOkcq8b
 8PMY/+o9Y91J7hvRIovj4WE6wdSuzF7dX/KiD0G683frczTtS77BaH/RWc2OK+LBnqky
 DKjb9IaCB4wa6ZA7iBqk0/MfAHxUwAfRggkrIRhN60ZAOgmEgq30I/25RElOHxFxaIlm
 jdE0OF4IOfM6iH2Y2Yfvz/UB4tHhKjU9k7Oe72VDP9dKu2WZ+JIbIV8TImWMnCI9d1gs
 d2kHitOZBa0471RqKwi9hJJw1YJiwNW00aUoMUq/uG7kCSjx89tsOJQf53hZORVy3btc
 4WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TLniamy6RaDceg5E0CUD7LIlTHkR5S1SB06UOtygodc=;
 b=kzIBN2bYXMhIgVsTmAIQiNVXdxps2urlCYxoXEq/HyPIljQkF9xaltU/95SLE+uVmo
 5ppqxbqXOX1r4cNL1aIh42rfGfyBazmYeNaE2h2GnJ2gw85XFRaNcJYj2xYu0rRNoA/L
 +kURBWE6ubfqHz0Ag6SRIvV1HG8y6VdWGclqKn4nSaiJI4+tzLjjb9Y2AFMFghImF7OA
 ZkM/4UgmiZZ1Bw194I0ldZgY0w/7jD12q6zSxDVDWKfn/qXGBJDBv+CfBOkBzfNTUX6z
 YXFiAeecAFSdA4JVMQMukdv5wqHMJes6hGGpEbNNw+lV4GriOefkzwe8rwk8MAyY6aDg
 UJ0A==
X-Gm-Message-State: ACrzQf3863qiLO6yTPOjbfWJ4Qw1QxCXBeDEW3vZBW9WK34ie/cF0oIW
 vQbgm6a2Ybw+MLi1g+4ftMcZgKWNv4JCOw==
X-Google-Smtp-Source: AMsMyM5lCICQSIKeupUWpq3oDQq2KxLrv0Hoqrtgmv2mQKrC6GYr+f3A/WytAlPVFWuX6VMCK+g3Bg==
X-Received: by 2002:a63:4042:0:b0:43b:ddc8:235 with SMTP id
 n63-20020a634042000000b0043bddc80235mr2733161pga.498.1665027868882; 
 Wed, 05 Oct 2022 20:44:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 06/26] target/s390x: Introduce gen_psw_addr_disp
Date: Wed,  5 Oct 2022 20:44:01 -0700
Message-Id: <20221006034421.1179141-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/s390x/tcg/translate.c | 69 ++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b6e4005670..47a9d87416 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -169,6 +169,11 @@ static uint64_t inline_branch_hit[CC_OP_MAX];
 static uint64_t inline_branch_miss[CC_OP_MAX];
 #endif
 
+static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
+{
+    tcg_gen_movi_i64(dest, s->base.pc_next + disp);
+}
+
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
 {
     if (s->base.tb->flags & FLAG_MASK_32) {
@@ -334,18 +339,24 @@ static void return_low128(TCGv_i64 dest)
 
 static void update_psw_addr(DisasContext *s)
 {
-    /* psw.addr */
-    tcg_gen_movi_i64(psw_addr, s->base.pc_next);
+    gen_psw_addr_disp(s, psw_addr, 0);
 }
 
 static void per_branch(DisasContext *s, bool to_next)
 {
 #ifndef CONFIG_USER_ONLY
-    tcg_gen_movi_i64(gbea, s->base.pc_next);
+    gen_psw_addr_disp(s, gbea, 0);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 next_pc = to_next ? tcg_constant_i64(s->pc_tmp) : psw_addr;
-        gen_helper_per_branch(cpu_env, gbea, next_pc);
+        if (to_next) {
+            TCGv_i64 next_pc = tcg_temp_new_i64();
+
+            gen_psw_addr_disp(s, next_pc, s->ilen);
+            gen_helper_per_branch(cpu_env, gbea, next_pc);
+            tcg_temp_free_i64(next_pc);
+        } else {
+            gen_helper_per_branch(cpu_env, gbea, psw_addr);
+        }
     }
 #endif
 }
@@ -358,20 +369,23 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
         TCGLabel *lab = gen_new_label();
         tcg_gen_brcond_i64(tcg_invert_cond(cond), arg1, arg2, lab);
 
-        tcg_gen_movi_i64(gbea, s->base.pc_next);
+        gen_psw_addr_disp(s, gbea, 0);
         gen_helper_per_branch(cpu_env, gbea, psw_addr);
 
         gen_set_label(lab);
     } else {
-        TCGv_i64 pc = tcg_constant_i64(s->base.pc_next);
+        TCGv_i64 pc = tcg_temp_new_i64();
+
+        gen_psw_addr_disp(s, pc, 0);
         tcg_gen_movcond_i64(cond, gbea, arg1, arg2, gbea, pc);
+        tcg_temp_free_i64(pc);
     }
 #endif
 }
 
 static void per_breaking_event(DisasContext *s)
 {
-    tcg_gen_movi_i64(gbea, s->base.pc_next);
+    gen_psw_addr_disp(s, gbea, 0);
 }
 
 static void update_cc_op(DisasContext *s)
@@ -1147,21 +1161,19 @@ struct DisasInsn {
 
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
-    uint64_t dest = s->base.pc_next + disp;
-
-    if (dest == s->pc_tmp) {
+    if (disp == s->ilen) {
         per_branch(s, true);
         return DISAS_NEXT;
     }
-    if (use_goto_tb(s, dest)) {
+    if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
         per_breaking_event(s);
         tcg_gen_goto_tb(0);
-        tcg_gen_movi_i64(psw_addr, dest);
+        gen_psw_addr_disp(s, psw_addr, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
         return DISAS_NORETURN;
     } else {
-        tcg_gen_movi_i64(psw_addr, dest);
+        gen_psw_addr_disp(s, psw_addr, disp);
         per_branch(s, false);
         return DISAS_PC_UPDATED;
     }
@@ -1219,14 +1231,14 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
 
             /* Branch not taken.  */
             tcg_gen_goto_tb(0);
-            tcg_gen_movi_i64(psw_addr, s->pc_tmp);
+            gen_psw_addr_disp(s, psw_addr, s->ilen);
             tcg_gen_exit_tb(s->base.tb, 0);
 
             /* Branch taken.  */
             gen_set_label(lab);
             per_breaking_event(s);
             tcg_gen_goto_tb(1);
-            tcg_gen_movi_i64(psw_addr, dest);
+            gen_psw_addr_disp(s, psw_addr, disp);
             tcg_gen_exit_tb(s->base.tb, 1);
 
             ret = DISAS_NORETURN;
@@ -1249,12 +1261,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             /* Branch not taken.  */
             update_cc_op(s);
             tcg_gen_goto_tb(0);
-            tcg_gen_movi_i64(psw_addr, s->pc_tmp);
+            gen_psw_addr_disp(s, psw_addr, s->ilen);
             tcg_gen_exit_tb(s->base.tb, 0);
 
             gen_set_label(lab);
             if (is_imm) {
-                tcg_gen_movi_i64(psw_addr, dest);
+                gen_psw_addr_disp(s, psw_addr, disp);
             }
             per_breaking_event(s);
             ret = DISAS_PC_UPDATED;
@@ -1264,9 +1276,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
            Most commonly we're single-stepping or some other condition that
            disables all use of goto_tb.  Just update the PC and exit.  */
 
-        TCGv_i64 next = tcg_constant_i64(s->pc_tmp);
+        TCGv_i64 next = tcg_temp_new_i64();
+
+        gen_psw_addr_disp(s, next, s->ilen);
         if (is_imm) {
-            cdest = tcg_constant_i64(dest);
+            cdest = tcg_temp_new_i64();
+            gen_psw_addr_disp(s, cdest, disp);
         }
 
         if (c->is_64) {
@@ -1285,6 +1300,10 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             tcg_temp_free_i64(t1);
         }
 
+        tcg_temp_free_i64(next);
+        if (is_imm) {
+            tcg_temp_free_i64(cdest);
+        }
         ret = DISAS_PC_UPDATED;
     }
 
@@ -5827,7 +5846,8 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    o->in2 = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, o->in2, (int64_t)get_field(s, i2) * 2);
 }
 #define SPEC_in2_ri2 0
 
@@ -6306,8 +6326,11 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
 #ifndef CONFIG_USER_ONLY
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        TCGv_i64 addr = tcg_constant_i64(s->base.pc_next);
+        TCGv_i64 addr = tcg_temp_new_i64();
+
+        gen_psw_addr_disp(s, addr, 0);
         gen_helper_per_ifetch(cpu_env, addr);
+        tcg_temp_free_i64(addr);
     }
 #endif
 
@@ -6428,7 +6451,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            tcg_gen_movi_i64(psw_addr, s->pc_tmp);
+            gen_psw_addr_disp(s, psw_addr, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
-- 
2.34.1


