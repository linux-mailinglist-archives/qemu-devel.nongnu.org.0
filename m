Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB89A6630F3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRj-0002zK-87; Mon, 09 Jan 2023 15:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRf-0002vj-Pc
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:36 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRc-0007OC-BG
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:35 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso10941269pjd.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+5Eh/DdcatVyopp39LTL5JN35D5TSKPLpjfcSQeFls=;
 b=RJclhlNiQqVvGUsqcJqG6TXE0bWOTVpmz4y89v44lJRoOnNhG2c0aDe7sWGMGTV9GN
 cS/VvGXZoMHIDV5Nm+8uuWrDHzp1TxoPJZfB7E5KbZNY1/2fdabnc5jG/W0NFtbFOpIK
 j1CU9u/V0u8iWwl5uZxGXK8hS+UzzLhzrRv7N5+CAS/PvLmC7l3yqf4j/IMuKOjmpuGB
 MfJQIECMq3ZQqaBQmbWaoJjftsxbvFPsn5Bo2Wu14vIpaIKi+U2+PlouJi3dz5t56QKS
 WcjYpIefGFI1kht7rlVNfLc6Kh60Mh5z4GUfLXgiKtu2zAun3d5m4rop1n4vy6FmJLoQ
 BAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+5Eh/DdcatVyopp39LTL5JN35D5TSKPLpjfcSQeFls=;
 b=vKFUW4kjrKyyp3cSbQ8TLcJ9myaOxBB/2CV3TglWKpGONVOSWhryy2dOgfKfD80PK0
 5rCEEfBPKXG8vmRChpojgMFUFUTCbPAJCFvE/kakjsQov4QRlgh+HQ48mBQrjpFErr6g
 gjBn9Cab4X6VAsQMe/5s5uUl2RH80ypXT+NHJBhXWeOAdJV30BcJKyUSNWACBxsbmyDW
 22/RqnlmmR+nT7gaTB3cHXVDk7TL5FnVHELsl5t3e1um6UL0VB1D+KnoyvxY2mQ81XFy
 25u8wWKhbm0qCHMDfYXUYBEeQMV5t46OOsuKi9h8+ztX8oMU3L+myHUOZpKhK3RSi/oT
 LjdQ==
X-Gm-Message-State: AFqh2krwVGAZQAqqnqfBKH/8bqSyv8U/uY3TwZcdktDw1l3eeTeLcM0H
 +jytc1L/OUy9O+lbWYdckcCL9RuoFQfN6FSD
X-Google-Smtp-Source: AMrXdXtmsYM9asiRksS8MrKjYVqb+DrHo7hb81dZji91XVmOqjEmO+vbivjJMVKXizvZDvx8wlDWcA==
X-Received: by 2002:a17:90b:100e:b0:227:1e67:d58f with SMTP id
 gm14-20020a17090b100e00b002271e67d58fmr3203474pjb.12.1673294911050; 
 Mon, 09 Jan 2023 12:08:31 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 08/27] target/s390x: Introduce gen_psw_addr_disp
Date: Mon,  9 Jan 2023 12:08:00 -0800
Message-Id: <20230109200819.3916395-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index f13ea43ce9..b41f5af988 100644
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
 
@@ -5829,7 +5848,8 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    o->in2 = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, o->in2, (int64_t)get_field(s, i2) * 2);
 }
 #define SPEC_in2_ri2 0
 
@@ -6314,8 +6334,11 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
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
 
@@ -6436,7 +6459,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            tcg_gen_movi_i64(psw_addr, s->pc_tmp);
+            gen_psw_addr_disp(s, psw_addr, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
-- 
2.34.1


