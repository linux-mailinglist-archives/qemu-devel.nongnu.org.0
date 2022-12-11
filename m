Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63AF6494D8
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:30:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG3-0006Vd-Bn; Sun, 11 Dec 2022 10:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFm-0006PH-1q
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:34 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007L5-Sb
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:33 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 p24-20020a0568301d5800b0066e6dc09be5so5836491oth.8
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkhpLPYibgi28bZ0AVemBX1UWP5NYhHvrup30BVm2VQ=;
 b=rU/4QznzMjpjL3X7CgcpyppWiM8/Uj574eQ9qs/dCpejy37i052Dk7VgET4LyGUW3F
 nYKoM/+bUDG2yKX2YQdVarUlfN+fxpnpJnIdrnK/9jJtMvaYBpWxrkG/rYePtR4ogUkA
 ailwhWqDHfsWa8jZUNHaNvnxVa4lAEEYi2XAbCE9Pg3jh1K/eHLB8+nRA4uszAyRUZFF
 Iaps4uZEvUggTkTzOWU2ikfzvwAbXl+snSHTSwwZfV26bOI2B9Wd0qrqEj1exN7IZ5Bj
 Pj9Rps/8xevnk9GwXgMVaQHbWMbIjx+GeOrmr6wQU7WvZm+R8N79RmCEwtOYvyYHV1+w
 8lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkhpLPYibgi28bZ0AVemBX1UWP5NYhHvrup30BVm2VQ=;
 b=TNdGTWmzwGFICkznbvFPl3VFMROg++GEO2sh0frL34/yq9+fGGqKeOSvvTOD/jXWQO
 WVMX3hDsFwGxW/O4YbEs9lGxJYBAOIBhR2c+Inj6Rm4MWgVnwfkd+IhXl2AcDPmw3P7A
 02kxrLiVFwUAldZbagHgd1zntiP+qC1i2+By/BEEkM3jGkI1enHtg4IKSlTqE+9+R/G2
 fxe/cBgrT3TFCSsAgkVRUQOy9NtXoTw6Y1o9Rn8bT9bNvooOZqeSY35M4pfEFu/6w9h9
 8DIgVRp80fO2DKOfkBP5fK8N3qnOSctpnVtdEMj5epfqa9AVOdPoCVeLAgAeNjHuowTu
 PU3w==
X-Gm-Message-State: ANoB5pmA4Mc3LXNqMZEpAfcgo76OjOEUb1plwflrAE1sZPGXDDzK/h98
 tg9A41uUCJOZDB+wjoZ62mNfiU+zBxyTlJW0IXg=
X-Google-Smtp-Source: AA0mqf68O0SPfv3871+DOzTnYaiTTuhDI70cGb9JiwSgQY0IJ5T2VgpZLyA0l72FPTmVQ/dIOVY6Bg==
X-Received: by 2002:a05:6830:6286:b0:661:dfeb:ee89 with SMTP id
 ce6-20020a056830628600b00661dfebee89mr8601432otb.3.1670772494213; 
 Sun, 11 Dec 2022 07:28:14 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 08/27] target/s390x: Introduce gen_psw_addr_disp
Date: Sun, 11 Dec 2022 09:27:43 -0600
Message-Id: <20221211152802.923900-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 69 ++++++++++++++++++++++++------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f755909aeb..a6a6dfd7fe 100644
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
 
@@ -6312,8 +6332,11 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
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
 
@@ -6434,7 +6457,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            tcg_gen_movi_i64(psw_addr, s->pc_tmp);
+            gen_psw_addr_disp(s, psw_addr, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
-- 
2.34.1


