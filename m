Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C83B7882
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:21:17 +0200 (CEST)
Received: from localhost ([::1]:45874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJIK-00049n-BH
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItN-0008PP-VU
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000u8-58
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so2580586pjs.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XkD3zAg3BgpWG1/1/ejQcAjqq103aTDKBL3ooamcmZ0=;
 b=SstRJdemeQoBQn3790dxEz8N3mcPA2gAnVzv+nwMfNU3cul3ne3TWQdiXgvkcVuRzP
 mcXQ79ni7VbNRSS7odVnEN+Evi/nF7XkDd0hMUI5+uUDwQBGOYZgXQQdcpnenW2hCCQy
 +xfNVpqTMB3bmk+DUlDrH+yHzb+Ag8iQTqnPszgc0DD+JSTyUei0qBZguTblUI1uPMMF
 FAuF6CJFIQ9XsyQN1FhaK9FNqG22SiWqynWB8jgub3KHpLImQZYJJ/BXKNTy+ixmPnRL
 WLuxCnf6OaChcbinkhDlb2cgeIjCnrr0O/rFHHp6CM5xPIfhMUms3l4MBokCQF7+/Sc0
 SrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkD3zAg3BgpWG1/1/ejQcAjqq103aTDKBL3ooamcmZ0=;
 b=Xxp3iPP+YnXsvNQ2Ay19QlLB/PbQ5BjsxUSuxCenKUNnZj7yeHWYeP2PlcEJk2MFf+
 pHCZh+eLxYn+iANKovs37LU8DF0ERH1I7rVLR9xW0qGluNI4khUI5OTzy3RPxTb8B7vN
 aNNXHupowuc4peAiiTeG50ObjxSjKf5sAapt3DlFSCdkA/THQ4T2k0Ff7+4KnFXhsqzG
 JMV0wLxAdolWPS1gd1V9FdkYGvmELinW/DC6cA9Puhxqz6hNJ2Xy0kCmJcLXzTkbo6R0
 cll6bBBOvk4eSS9Bd/IXmHtWRupbGjCwgYMgECqYAQy7iu01/ARCvPOo9kATnqTu4ob7
 BDpg==
X-Gm-Message-State: AOAM530tMHAPYpAGF8Y6cqrd3T5gG3AzxnG07d8YMTP4scu3phFEBsZL
 vjkXZOE97XeFFhDwfS1zBM7qCCQoNiZt5g==
X-Google-Smtp-Source: ABdhPJwKaJuIfifvi46cSPJhOqgruadHbxYYTE0RPDbcrT5slbGMd9Ea+9St7qPCIHOLHJcfIR0wPg==
X-Received: by 2002:a17:902:8305:b029:120:1d69:6bd8 with SMTP id
 bd5-20020a1709028305b02901201d696bd8mr29333514plb.2.1624992911690; 
 Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/63] target/cris: Remove dc->flagx_known
Date: Tue, 29 Jun 2021 11:54:19 -0700
Message-Id: <20210629185455.3131172-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since 2a44f7f17364, flagx_known is always true.
Fold away all of the tests against the flag.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         | 99 ++++++++-------------------------
 target/cris/translate_v10.c.inc |  6 +-
 2 files changed, 24 insertions(+), 81 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 1d4c78eab2..0be10390e9 100644
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
@@ -3141,7 +3088,6 @@ static void cris_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->ppc = pc_start;
     dc->pc = pc_start;
     dc->flags_uptodate = 1;
-    dc->flagx_known = 1;
     dc->flags_x = tb_flags & X_FLAG;
     dc->cc_x_uptodate = 0;
     dc->cc_mask = 0;
@@ -3217,7 +3163,6 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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


