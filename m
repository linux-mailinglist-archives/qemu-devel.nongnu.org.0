Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30E3B0995
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:53:37 +0200 (CEST)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviiW-0005CN-JT
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidg-0005Eo-FF
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:36 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidc-0005Ma-3s
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:36 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so2008642pjb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNYcTdY0tgpC6WMieF5n4+EqywMO5iR2r/bf+GYbaDw=;
 b=JrKRtVYIZG9TqyN4uQtORZFRThDGU+HgmBRn2GG763go/l2xlh5IVNj1dExRad3956
 T5FNNGQ/MG3LX/2QYVFJMsiBpgXYBxRt4ZnipHCrTAqfuydIhY/UIAoWs4M/E0WZMdHd
 gQKcD7IwpBSSiEA1tXFkHtCis55JzNGTTvNBUuF7HD/npLpTwL/5bo4oPKFKiMxXvRSA
 Tnc+y5+LKTbfjskRjjWPnWSJODLdELjmpthcNvhOFQT/oBes/F2cdiNDE+crtXEH1DSK
 5mdj9E1SZSiD/1vw+Umws68R6hER3GOvcttO/7bJY5I9oaXaf17pY4dpgC9IcjJYEBa5
 Vqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNYcTdY0tgpC6WMieF5n4+EqywMO5iR2r/bf+GYbaDw=;
 b=DtQd507jCqoBTkwS1fCA10sKTKCDmsobNZ9sxk6YS13V508pAkUS0hDmxe1iRFuTEx
 eofhClkJhdLZ2+7Ok4Pgu7n2A76Hr4bmUE+gh1IYiIkdSJZGH1PcPeCgEHih4qiD42A1
 T9qrp/VlhsXhsSCFWOdJ6dDd/o8guROp3jZOoAHcbOFYYeaWOyF2bpTS71JVjQoH2gyw
 66tmqTSYlOQyVvFDV8eA+BQXlElfA/VpXAnFD9Jfsmr5FvuccVDplnWGBpz18iHg12Bw
 zuBhtfb+fKQMm9EYfOBV5uvJnQXfVkJnrFpAhkQVdJ8k/IOuw5J0mXrPdbZGDHgeWow1
 QJaQ==
X-Gm-Message-State: AOAM533+jJdNQWYTX2TR3mZn2ip4dXVu1WOqZt8ctQDQ0Kzr8p4Dvlh8
 QzGSxPkZiO83oWXzr6+8nBpM/V3L224Vhg==
X-Google-Smtp-Source: ABdhPJyg11VRHAGOUc6us7prMgjWk+CfhD9uDgDJ+RFEhMtAXA0Myu4TB2im85DHdojkgFyyjC3oAA==
X-Received: by 2002:a17:90a:7401:: with SMTP id
 a1mr4670611pjg.57.1624376910757; 
 Tue, 22 Jun 2021 08:48:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] target/cris: Remove dc->flagx_known
Date: Tue, 22 Jun 2021 08:48:19 -0700
Message-Id: <20210622154820.1978982-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since 2a44f7f17364, flagx_known is always true.
Fold away all of the tests against the flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 99 ++++++++-------------------------
 target/cris/translate_v10.c.inc |  6 +-
 2 files changed, 24 insertions(+), 81 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 05be0a41bd..45548ffb5e 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -120,8 +120,6 @@ typedef struct DisasContext {
 
     int cc_x_uptodate;  /* 1 - ccs, 2 - known | X_FLAG. 0 not up-to-date.  */
     int flags_uptodate; /* Whether or not $ccs is up-to-date.  */
-    int flagx_known; /* Whether or not flags_x has the x flag known at
-                translation time.  */
     int flags_x;
 
     int clear_x; /* Clear x after this insn?  */
@@ -377,66 +375,26 @@ static inline void t_gen_add_flag(TCGv d, int flag)
 
 static inline void t_gen_addx_carry(DisasContext *dc, TCGv d)
 {
-    if (dc->flagx_known) {
-        if (dc->flags_x) {
-            TCGv c;
-            
-            c = tcg_temp_new();
-            t_gen_mov_TN_preg(c, PR_CCS);
-            /* C flag is already at bit 0.  */
-            tcg_gen_andi_tl(c, c, C_FLAG);
-            tcg_gen_add_tl(d, d, c);
-            tcg_temp_free(c);
-        }
-    } else {
-        TCGv x, c;
+    if (dc->flags_x) {
+        TCGv c = tcg_temp_new();
 
-        x = tcg_temp_new();
-        c = tcg_temp_new();
-        t_gen_mov_TN_preg(x, PR_CCS);
-        tcg_gen_mov_tl(c, x);
-
-        /* Propagate carry into d if X is set. Branch free.  */
+        t_gen_mov_TN_preg(c, PR_CCS);
+        /* C flag is already at bit 0.  */
         tcg_gen_andi_tl(c, c, C_FLAG);
-        tcg_gen_andi_tl(x, x, X_FLAG);
-        tcg_gen_shri_tl(x, x, 4);
-
-        tcg_gen_and_tl(x, x, c);
-        tcg_gen_add_tl(d, d, x);
-        tcg_temp_free(x);
+        tcg_gen_add_tl(d, d, c);
         tcg_temp_free(c);
     }
 }
 
 static inline void t_gen_subx_carry(DisasContext *dc, TCGv d)
 {
-    if (dc->flagx_known) {
-        if (dc->flags_x) {
-            TCGv c;
-            
-            c = tcg_temp_new();
-            t_gen_mov_TN_preg(c, PR_CCS);
-            /* C flag is already at bit 0.  */
-            tcg_gen_andi_tl(c, c, C_FLAG);
-            tcg_gen_sub_tl(d, d, c);
-            tcg_temp_free(c);
-        }
-    } else {
-        TCGv x, c;
+    if (dc->flags_x) {
+        TCGv c = tcg_temp_new();
 
-        x = tcg_temp_new();
-        c = tcg_temp_new();
-        t_gen_mov_TN_preg(x, PR_CCS);
-        tcg_gen_mov_tl(c, x);
-
-        /* Propagate carry into d if X is set. Branch free.  */
+        t_gen_mov_TN_preg(c, PR_CCS);
+        /* C flag is already at bit 0.  */
         tcg_gen_andi_tl(c, c, C_FLAG);
-        tcg_gen_andi_tl(x, x, X_FLAG);
-        tcg_gen_shri_tl(x, x, 4);
-
-        tcg_gen_and_tl(x, x, c);
-        tcg_gen_sub_tl(d, d, x);
-        tcg_temp_free(x);
+        tcg_gen_sub_tl(d, d, c);
         tcg_temp_free(c);
     }
 }
@@ -541,11 +499,9 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 
 static inline void cris_clear_x_flag(DisasContext *dc)
 {
-    if (dc->flagx_known && dc->flags_x) {
+    if (dc->flags_x) {
         dc->flags_uptodate = 0;
     }
-
-    dc->flagx_known = 1;
     dc->flags_x = 0;
 }
 
@@ -630,12 +586,10 @@ static void cris_evaluate_flags(DisasContext *dc)
         break;
     }
 
-    if (dc->flagx_known) {
-        if (dc->flags_x) {
-            tcg_gen_ori_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], X_FLAG);
-        } else if (dc->cc_op == CC_OP_FLAGS) {
-            tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~X_FLAG);
-        }
+    if (dc->flags_x) {
+        tcg_gen_ori_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], X_FLAG);
+    } else if (dc->cc_op == CC_OP_FLAGS) {
+        tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~X_FLAG);
     }
     dc->flags_uptodate = 1;
 }
@@ -670,16 +624,11 @@ static void cris_update_cc_op(DisasContext *dc, int op, int size)
 static inline void cris_update_cc_x(DisasContext *dc)
 {
     /* Save the x flag state at the time of the cc snapshot.  */
-    if (dc->flagx_known) {
-        if (dc->cc_x_uptodate == (2 | dc->flags_x)) {
-            return;
-        }
-        tcg_gen_movi_tl(cc_x, dc->flags_x);
-        dc->cc_x_uptodate = 2 | dc->flags_x;
-    } else {
-        tcg_gen_andi_tl(cc_x, cpu_PR[PR_CCS], X_FLAG);
-        dc->cc_x_uptodate = 1;
+    if (dc->cc_x_uptodate == (2 | dc->flags_x)) {
+        return;
     }
+    tcg_gen_movi_tl(cc_x, dc->flags_x);
+    dc->cc_x_uptodate = 2 | dc->flags_x;
 }
 
 /* Update cc prior to executing ALU op. Needs source operands untouched.  */
@@ -1131,7 +1080,7 @@ static void gen_store (DisasContext *dc, TCGv addr, TCGv val,
 
     /* Conditional writes. We only support the kind were X and P are known
        at translation time.  */
-    if (dc->flagx_known && dc->flags_x && (dc->tb_flags & P_FLAG)) {
+    if (dc->flags_x && (dc->tb_flags & P_FLAG)) {
         dc->postinc = 0;
         cris_evaluate_flags(dc);
         tcg_gen_ori_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], C_FLAG);
@@ -1140,7 +1089,7 @@ static void gen_store (DisasContext *dc, TCGv addr, TCGv val,
 
     tcg_gen_qemu_st_tl(val, addr, mem_index, MO_TE + ctz32(size));
 
-    if (dc->flagx_known && dc->flags_x) {
+    if (dc->flags_x) {
         cris_evaluate_flags(dc);
         tcg_gen_andi_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], ~C_FLAG);
     }
@@ -1727,8 +1676,8 @@ static int dec_addc_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("addc $r%u, $r%u\n",
             dc->op1, dc->op2);
     cris_evaluate_flags(dc);
+
     /* Set for this insn.  */
-    dc->flagx_known = 1;
     dc->flags_x = X_FLAG;
 
     cris_cc_mask(dc, CC_MASK_NZVC);
@@ -2015,7 +1964,6 @@ static int dec_setclrf(CPUCRISState *env, DisasContext *dc)
     }
 
     if (flags & X_FLAG) {
-        dc->flagx_known = 1;
         if (set) {
             dc->flags_x = X_FLAG;
         } else {
@@ -2479,7 +2427,6 @@ static int dec_addc_mr(CPUCRISState *env, DisasContext *dc)
     cris_evaluate_flags(dc);
 
     /* Set for this insn.  */
-    dc->flagx_known = 1;
     dc->flags_x = X_FLAG;
 
     cris_alu_m_alloc_temps(t);
@@ -3139,7 +3086,6 @@ static void cris_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->ppc = pc_start;
     dc->pc = pc_start;
     dc->flags_uptodate = 1;
-    dc->flagx_known = 1;
     dc->flags_x = tb_flags & X_FLAG;
     dc->cc_x_uptodate = 0;
     dc->cc_mask = 0;
@@ -3215,7 +3161,6 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     }
 
     /* Fold unhandled changes to X_FLAG into cpustate_changed. */
-    dc->cpustate_changed |= !dc->flagx_known;
     dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
 
     /*
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 4ab43dc404..f500e93447 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -106,9 +106,8 @@ static void gen_store_v10(DisasContext *dc, TCGv addr, TCGv val,
         cris_store_direct_jmp(dc);
     }
 
-    /* Conditional writes. We only support the kind were X is known
-       at translation time.  */
-    if (dc->flagx_known && dc->flags_x) {
+    /* Conditional writes. */
+    if (dc->flags_x) {
         gen_store_v10_conditional(dc, addr, val, size, mem_index);
         return;
     }
@@ -376,7 +375,6 @@ static unsigned int dec10_setclrf(DisasContext *dc)
 
 
     if (flags & X_FLAG) {
-        dc->flagx_known = 1;
         if (set)
             dc->flags_x = X_FLAG;
         else
-- 
2.25.1


