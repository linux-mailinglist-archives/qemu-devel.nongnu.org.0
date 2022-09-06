Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEDD5AE697
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:29:25 +0200 (CEST)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWlg-00017P-JC
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVer-0003On-Se
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVek-0005Gu-Lv
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso9301034wmc.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BdEUNGwh82f979hGOsFFOfn9g+TbBS52GY9ZiM+BpZc=;
 b=NNEMK6MgnPt0/Vyk40U1zWkBZ3+HhLgeZRedvMOBqFPsCe0GlnIsDGMvnSWpnZ9+s+
 5OdBwu/mjb/EnKpyAm2v5lijswn7zO+q2cbOSBiDnMpzG/tmXa8cAssuQjB0aT7DPDaw
 n8ph7kx01V6m6jw4F/YlfTZh1XH3hqU06+BYCD9G92Ev+MLVQc1V1lriC2lDbDXK+j4U
 q+7S3S3UCeL3LNA4hO1/Ku5VNeC5RasrB2rbmIh8IsfQjyXUPa3v5KfRVM3v0iVI56sr
 DxEID+Ay3/YQndJcWWZ303wd9jOPJcPdFkX/I3x+48ywlK8rxCyyceJfpmdlLsJLTH/Q
 rmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BdEUNGwh82f979hGOsFFOfn9g+TbBS52GY9ZiM+BpZc=;
 b=7OoajyS1k6oRrtRHkqKrHeFOAknNGdGh1fEJ1OJ7RRxcvTtc+2tcdqXBTmEgVEsxXr
 p6TTUx1/tHnWBOjy7RCIOu2tKL5qZr/GsiXLnIUjW3XWe/bRMIwm7A7/nIO5QhEh+AvU
 qRIy2whYJB6AyN48jEQxgurcJVhI37mSQx6sUMKzNU3e2VilQbggC2f9vPZEvlSpJ35j
 Cn400suAbWDKNfAzWJfYQwZfYAZZLLRUmCbycSkjixyWgSFd1CHQdmlWNL6XGRSgfcow
 uauNnytgCpzE1u0NBuKANhhjxzXUterNSiGEigolP4lCL5DShl24RjnPtsrDsi1R0Jv8
 AKnA==
X-Gm-Message-State: ACgBeo0Tq8N3hBftAYEg5WZSaO5nFNRIFRSdMNd8kvX9TzrA50L5RoJk
 FfHcCqMP1n1aIltU2A1hOeFtN1saIS9uhng+
X-Google-Smtp-Source: AA6agR58wIwMAKWLxnLAIWiC7fdO6A+QpJeWKe0c6gVNnqDgWu1MmuXbFILcwhL3jw9OQrHxUZVdZw==
X-Received: by 2002:a1c:7707:0:b0:3a5:d953:838f with SMTP id
 t7-20020a1c7707000000b003a5d953838fmr13490745wmi.139.1662459489046; 
 Tue, 06 Sep 2022 03:18:09 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 19/26] target/s390x: Simplify help_branch
Date: Tue,  6 Sep 2022 11:17:40 +0100
Message-Id: <20220906101747.344559-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


