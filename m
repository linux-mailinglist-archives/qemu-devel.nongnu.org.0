Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA735F6017
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:25:44 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIS7-0006Ra-KC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoX-0004Mf-7N
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoS-0003y6-JS
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:48 -0400
Received: by mail-pl1-x633.google.com with SMTP id u24so554818plq.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BdEUNGwh82f979hGOsFFOfn9g+TbBS52GY9ZiM+BpZc=;
 b=N59DgHX9isvhhPDgn3UuZdQg9dc7ctK4LF5x0FISLHZuqi2aB4uhzfd5Tx5EuV21ET
 E5pC4FZDKKAR4JDiRrkl9p7/DnBEYBK5T15sVgU0pQHFreG1C+1jZccLlU3W4JxzbyQc
 Nh5r4/AamtPJcKl7vHNm9IzT5p2HA79Fq67nwt9XYyfET2Yvo4xb9Jl2pFAk6cwt9689
 l0GoJ2IGT2swpSgjoi5V5xCzs/SYsRWnDG9HNDykz6tLbLUpL+Ys22iWWm1Yjhu5q9bW
 tmFWSlv8zRhPelGDIzoMna8OyJ6oA3DhmqlVEwuHMEk6379RsOKdcD8xh48UplZIq9hT
 P9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BdEUNGwh82f979hGOsFFOfn9g+TbBS52GY9ZiM+BpZc=;
 b=yW9/1u82E4Wil8RL4t1APppeMajPDiRQEVgR9XzLmEKdOtt027bgPgU09oBRUAnxVS
 k9jkPIQNXrd7OWnwt9MrnD/fR0AdHT9hKGj2503uvmze/Jdk8uM+nGI5LLEH6ur/Wj08
 PvenG7XlzziZt27524WtM+CDs8ceSEjdW/wtnwDZjdxhlP07B1L/tcEvxAOYec90znnX
 EZK7uJB+ZFq+691sXV3WyP0KcrmmcfxlFE+bpmn7NI1S7A/wpMBwrYuLJnqffq8qVzeq
 fsgbu2o/FHaRNcIPIekkVZbx9SuBL1APJEtqze7Bd0dvYiJrEEraOuCmwkHdLTXMAEHM
 PEDg==
X-Gm-Message-State: ACrzQf2a3JPZpapfkGbd6c2ZIfXM7vp62WS1ji9KUeAUZkRzOQ4WG5M8
 9s3PMB8/RV7+vHhXpMXxfPG1rmv6aXiFoQ==
X-Google-Smtp-Source: AMsMyM51virIyYyKbbxY7q4KYUZ8/sAg/IXeejDzcC2OqdL+C9yo37ez6PH5jhlhZBA+gedo6j+qjQ==
X-Received: by 2002:a17:90b:1e45:b0:202:fbc9:3df1 with SMTP id
 pi5-20020a17090b1e4500b00202fbc93df1mr8614868pjb.72.1665027881453; 
 Wed, 05 Oct 2022 20:44:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 19/26] target/s390x: Simplify help_branch
Date: Wed,  5 Oct 2022 20:44:14 -0700
Message-Id: <20221006034421.1179141-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Always use a tcg branch, instead of movcond.  The movcond
was not a bad idea before PER was added, but since then
we have either 2 or 3 actions to perform on each leg of
the branch, and multiple movcond is inefficient.

Reorder the taken branch to be fallthrough of the tcg branch.
This will be helpful later with TARGET_TB_PCREL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 154 ++++++++++-------------------------
 1 file changed, 44 insertions(+), 110 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index bd2ee1c96e..498dc2930d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -373,28 +373,6 @@ static void per_branch_disp(DisasContext *s, int64_t disp)
 #endif
 }
 
-static void per_branch_cond(DisasContext *s, TCGCond cond,
-                            TCGv_i64 arg1, TCGv_i64 arg2)
-{
-#ifndef CONFIG_USER_ONLY
-    if (per_enabled(s)) {
-        TCGLabel *lab = gen_new_label();
-        tcg_gen_brcond_i64(tcg_invert_cond(cond), arg1, arg2, lab);
-
-        gen_psw_addr_disp(s, gbea, 0);
-        gen_helper_per_branch(cpu_env, gbea, psw_addr);
-
-        gen_set_label(lab);
-    } else {
-        TCGv_i64 pc = tcg_temp_new_i64();
-
-        gen_psw_addr_disp(s, pc, 0);
-        tcg_gen_movcond_i64(cond, gbea, arg1, arg2, gbea, pc);
-        tcg_temp_free_i64(pc);
-    }
-#endif
-}
-
 static void per_breaking_event(DisasContext *s)
 {
 #ifndef CONFIG_USER_ONLY
@@ -1205,7 +1183,6 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
 {
     DisasJumpType ret;
     int64_t disp = (int64_t)imm * 2;
-    uint64_t dest = s->base.pc_next + disp;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1235,96 +1212,53 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         }
     }
 
-    if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
-        if (is_imm && use_goto_tb(s, dest)) {
-            /* Both exits can use goto_tb.  */
-            update_cc_op(s);
+    update_cc_op(s);
 
-            lab = gen_new_label();
-            if (c->is_64) {
-                tcg_gen_brcond_i64(c->cond, c->u.s64.a, c->u.s64.b, lab);
-            } else {
-                tcg_gen_brcond_i32(c->cond, c->u.s32.a, c->u.s32.b, lab);
-            }
-
-            /* Branch not taken.  */
-            tcg_gen_goto_tb(0);
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
-            tcg_gen_exit_tb(s->base.tb, 0);
-
-            /* Branch taken.  */
-            gen_set_label(lab);
-            per_breaking_event(s);
-            tcg_gen_goto_tb(1);
-            gen_psw_addr_disp(s, psw_addr, disp);
-            tcg_gen_exit_tb(s->base.tb, 1);
-
-            ret = DISAS_NORETURN;
-        } else {
-            /* Fallthru can use goto_tb, but taken branch cannot.  */
-            /* Store taken branch destination before the brcond.  This
-               avoids having to allocate a new local temp to hold it.
-               We'll overwrite this in the not taken case anyway.  */
-            if (!is_imm) {
-                tcg_gen_mov_i64(psw_addr, cdest);
-            }
-
-            lab = gen_new_label();
-            if (c->is_64) {
-                tcg_gen_brcond_i64(c->cond, c->u.s64.a, c->u.s64.b, lab);
-            } else {
-                tcg_gen_brcond_i32(c->cond, c->u.s32.a, c->u.s32.b, lab);
-            }
-
-            /* Branch not taken.  */
-            update_cc_op(s);
-            tcg_gen_goto_tb(0);
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
-            tcg_gen_exit_tb(s->base.tb, 0);
-
-            gen_set_label(lab);
-            if (is_imm) {
-                gen_psw_addr_disp(s, psw_addr, disp);
-            }
-            per_breaking_event(s);
-            ret = DISAS_PC_UPDATED;
-        }
-    } else {
-        /* Fallthru cannot use goto_tb.  This by itself is vanishingly rare.
-           Most commonly we're single-stepping or some other condition that
-           disables all use of goto_tb.  Just update the PC and exit.  */
-
-        TCGv_i64 next = tcg_temp_new_i64();
-
-        gen_psw_addr_disp(s, next, s->ilen);
-        if (is_imm) {
-            cdest = tcg_temp_new_i64();
-            gen_psw_addr_disp(s, cdest, disp);
-        }
-
-        if (c->is_64) {
-            tcg_gen_movcond_i64(c->cond, psw_addr, c->u.s64.a, c->u.s64.b,
-                                cdest, next);
-            per_branch_cond(s, c->cond, c->u.s64.a, c->u.s64.b);
-        } else {
-            TCGv_i32 t0 = tcg_temp_new_i32();
-            TCGv_i64 t1 = tcg_temp_new_i64();
-            TCGv_i64 z = tcg_constant_i64(0);
-            tcg_gen_setcond_i32(c->cond, t0, c->u.s32.a, c->u.s32.b);
-            tcg_gen_extu_i32_i64(t1, t0);
-            tcg_temp_free_i32(t0);
-            tcg_gen_movcond_i64(TCG_COND_NE, psw_addr, t1, z, cdest, next);
-            per_branch_cond(s, TCG_COND_NE, t1, z);
-            tcg_temp_free_i64(t1);
-        }
-
-        tcg_temp_free_i64(next);
-        if (is_imm) {
-            tcg_temp_free_i64(cdest);
-        }
-        ret = DISAS_PC_UPDATED;
+    /*
+     * Store taken branch destination before the brcond.  This
+     * avoids having to allocate a new local temp to hold it.
+     * We'll overwrite this in the not taken case anyway.
+     */
+    if (!is_imm) {
+        tcg_gen_mov_i64(psw_addr, cdest);
     }
 
+    lab = gen_new_label();
+    if (c->is_64) {
+        tcg_gen_brcond_i64(tcg_invert_cond(c->cond),
+                           c->u.s64.a, c->u.s64.b, lab);
+    } else {
+        tcg_gen_brcond_i32(tcg_invert_cond(c->cond),
+                           c->u.s32.a, c->u.s32.b, lab);
+    }
+
+    /* Branch taken.  */
+    if (is_imm) {
+        gen_psw_addr_disp(s, psw_addr, disp);
+    }
+    per_branch_dest(s, psw_addr);
+
+    if (is_imm && use_goto_tb(s, s->base.pc_next + disp)) {
+        tcg_gen_goto_tb(0);
+        tcg_gen_exit_tb(s->base.tb, 0);
+    } else {
+        tcg_gen_lookup_and_goto_ptr();
+    }
+
+    gen_set_label(lab);
+
+    /* Branch not taken.  */
+    if (use_goto_tb(s, s->base.pc_next + s->ilen)) {
+        tcg_gen_goto_tb(1);
+        gen_psw_addr_disp(s, psw_addr, s->ilen);
+        tcg_gen_exit_tb(s->base.tb, 1);
+    } else {
+        gen_psw_addr_disp(s, psw_addr, s->ilen);
+        tcg_gen_lookup_and_goto_ptr();
+    }
+
+    ret = DISAS_NORETURN;
+
  egress:
     free_compare(c);
     return ret;
-- 
2.34.1


