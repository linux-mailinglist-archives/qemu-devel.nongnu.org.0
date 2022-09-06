Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8534D5AE654
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:16:36 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWZH-0007wB-HA
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeZ-0003K8-2n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeV-00059u-CC
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id c11so10463469wrp.11
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TLniamy6RaDceg5E0CUD7LIlTHkR5S1SB06UOtygodc=;
 b=jSRkCwwTz/kAq8ihDZPm0RfD6rf+2RWhrRX97CuCeJVuaKVEx2pwqg0yKvscc1D1ar
 IRVZBkLEv3paFcjbYaizmLgTaj5mjN+h1ssri+kemFya5BBzkHe1/nXqktlLSS3NnNfR
 YwaB63QJ2RuxKu/Da1p7YcDGRUpZk6MJHx5EeqUYaWrDY/ywprTO69YUNHDqRmjZUNzr
 fe6YzYAwbrkyM2A48OBkTJJQkOEE1Brb68mWAyuOC+1rVZjQYi9CE/NXO6s5wryt8X1J
 rPJOMuH5sac914rBBHEtVfzHj612Gl1/4iw1d+LZaS40LLx+3jGgOwqXn36jpfQKi/XX
 pVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TLniamy6RaDceg5E0CUD7LIlTHkR5S1SB06UOtygodc=;
 b=6MRCaGO9M+Kgf7tUFkBywixyqShI4x+WZZMdB6t/KEwbb6jgr+MBq/t3FIOJSHWyBg
 KjE0l2nq6F8yH/aoxeUT15CzawmBC//CfsWuu/63cn/LOvhtA/9S3xJKproMs1QzjvGA
 xs7alPskW75flsrLOYCAkcPnGGF59lR0uV3T6ljQHTbuQeeXbwGA675OaC1jukNywmHj
 r5wD8r3DixZzn77V+FAiMdgwKYlipVfxSwK2jeIPJZvYIzL/DFjUzMb/Bq+ltO+iIk8X
 K+N5bMShDjAh6dxBpYRWw+gErQgKNzNoQ5TvaajsSmsIY+cliIGCaGHrU5WTSyzTIgXh
 F18g==
X-Gm-Message-State: ACgBeo02EaTMKpgWX45gyTB1i8u5Lv0/u6OG+FyhZW/GBl8jXLdcGGB3
 cxIm6ncIt7u2eMdIZwQJVujDZpSGDp2aPpC5
X-Google-Smtp-Source: AA6agR44XB4dpp9Z6AWhVZyIi6dR/Sm5O8QkuUi7Y7fDYsXJLEvYrzXMmvcrLh/FBTEWSeXot6CoHQ==
X-Received: by 2002:a5d:595c:0:b0:225:7264:9e74 with SMTP id
 e28-20020a5d595c000000b0022572649e74mr27634412wri.670.1662459474554; 
 Tue, 06 Sep 2022 03:17:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 06/26] target/s390x: Introduce gen_psw_addr_disp
Date: Tue,  6 Sep 2022 11:17:27 +0100
Message-Id: <20220906101747.344559-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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


