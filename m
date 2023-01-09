Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561A663145
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRt-0003JU-Ou; Mon, 09 Jan 2023 15:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRr-0003GC-Rz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRp-0007Z6-UO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d15so10764841pls.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5QVDR5p8K9NnSXHNw0nEbXh8IznLvlZ3YQDGipeghY=;
 b=wZSBkM82RsEeHCKB8IQdckG6GETiJcROTMDra/qu3c7VsXLw5mWfutyzMXVqtkeWUb
 iq3DkCMZxupmWXRXJ7OvBVX0lPwc3EV+ywFnSa/FKwfQdxtEyvULbF1FjVUwmYQR598+
 mzCIWB4aW5AKTfPMnhlNdZl8MOCZ1q865EQdaU/Ox/MLLgoRD1r0WRR+AmfJHMt79rlH
 b3a6QtCn6AHcviE6Xc9d6wD+LCJ6EYH+gFedTbjdTpNADM2OccYsY8D8g4vXYlQUPxwa
 jOlVulIlO7LewSy1fxWi+L9L2fGrZwlmQQyGLrEAGEb5DRsCfLiylMlNGyXt8Z2lSGW7
 Xl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5QVDR5p8K9NnSXHNw0nEbXh8IznLvlZ3YQDGipeghY=;
 b=heevSonFzRydahohdqGeD0DgeXvc50SVrDDDUeSRnKbCWVyCGvJ6/bQxhHaUnTInvF
 oAKSswfMzVEVESuxIzhIN80kqW36jU/dOYcgzrAy+ryYlMxz2epEhipE9fMxbV94Q8Zv
 etxEgJ8tKQsLsr1WOnShkf7Q8UEltTCrsOHxUe+w9duw148uNA46lO20BD2vMGU/9yq8
 BiMzQ/rEyxOzUfPam7kH9WW49r0IOP9KFGGRqVlUwHI1/1Vdz6FdQ9voJ6Vk1upF0VQ8
 2dhcFxFG0JfZW09gDctG3xiWN46DufIjiSOxbZ9wY8+hxI9O5XMXYQOZgjDEg906UqgW
 XFCQ==
X-Gm-Message-State: AFqh2kq7Uzfs1D9D+tuhV+usnnS54rbtXplrdFG0EKonUEGeiEw0Uy/z
 kYmGEzdHk/wpIC+EJINOPQ5C4yGQZjgTUso1
X-Google-Smtp-Source: AMrXdXv/RzG7hUSK1aLncxjHMH44QoIA7Y5K0KpymS2qDq0Bzn2LB+uq1baL0e/D2FBMuLTOU+pm7g==
X-Received: by 2002:a05:6a20:3d17:b0:a4:efdd:a9b9 with SMTP id
 y23-20020a056a203d1700b000a4efdda9b9mr95105914pzi.44.1673294925006; 
 Mon, 09 Jan 2023 12:08:45 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 21/27] target/s390x: Simplify help_branch
Date: Mon,  9 Jan 2023 12:08:13 -0800
Message-Id: <20230109200819.3916395-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Always use a tcg branch, instead of movcond.  The movcond
was not a bad idea before PER was added, but since then
we have either 2 or 3 actions to perform on each leg of
the branch, and multiple movcond is inefficient.

Reorder the taken branch to be fallthrough of the tcg branch.
This will be helpful later with TARGET_TB_PCREL.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 154 ++++++++++-------------------------
 1 file changed, 44 insertions(+), 110 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e3855f6e09..aca2d214bb 100644
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


