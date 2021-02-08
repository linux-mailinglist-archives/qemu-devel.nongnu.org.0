Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3319312991
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:55:00 +0100 (CET)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xdb-0003AV-W1
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:55:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZR-0003wK-8m
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:37 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZP-00006W-IZ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:37 -0500
Received: by mail-pf1-x431.google.com with SMTP id o20so8795584pfu.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6rVYVBn5WKWjGPZSc0x/bTtwmPwu+ICbCV3yAi6cRKw=;
 b=WqYVjtFZKPdk0fHAYzeYEdQOvGjcZCn8XpufHLnVB/Th9V+9t3hskk2sA7BMVl1bFq
 B/XTlIEIS8Oi8+xPp0qiwBixQGiM56t+W96egetlzLFePqIc8f0ax5j3Kp1VWmGFIv1f
 aJtpX0ldHiBgYymAM2ZY/oTjUDEBhdpYwqZj5ITsKGO4oAfA3Ni+/f3UFS8HchTFZukt
 h1oytjTJMu7nvI8RBhs+Q17fvfDXSxZPHDximDMRiYaK+kLR3lETUG1cgD8hotwOYkav
 asVVBG2/kXRoerRlAjVHELoDHc0HPcwY3LpMeO7f9z6qRBdlp4nIwI4XCJmmcVYrHzQE
 kOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rVYVBn5WKWjGPZSc0x/bTtwmPwu+ICbCV3yAi6cRKw=;
 b=nxVSJpMTnJluOAxSF4jBDbARX1WkRX22Id5Wp2XnW6feMyLHWdG4eR12Qs61zHBWSy
 V0ZlJRiRONuAD3SIi3W1nUJ/OCM42HCl6sr+8QjZ43bGr2f4TJAaxyE7LKppzUZHhaw2
 lFHN4V61G5fpJY8iQdC5r8iOhqQqxfhdiL6Q+4igSF2GsvSewUbE45oEMa+n/xbQ7q+V
 /vZ4PvVz3mFQ5orpJRBrhHh3WhUzj9NNyhzqODhe6jkhYsUW8FC5tvtaASUm9A2UN/uB
 u1PZU22a+9tVRqXx4sghbDHM6HZl4yo/Z6PcTJ4EwLNLvQIMIl+Y+Id+FJ7UA1rrCjJA
 N+jg==
X-Gm-Message-State: AOAM530tYVFTzsVaZddsPnSOaW8j2i67KV965XS0uud95KYIcJClZaUS
 1/T/4jrKD13bDxXoBqNPXjX+9iPkhAXDag==
X-Google-Smtp-Source: ABdhPJyom5XhGhpGDDH9z9FBsdN/5RNfdBMgMgFxIQIIBM/314HkFCbnwfyQAM8avNwA5nNfLCdccQ==
X-Received: by 2002:aa7:93ad:0:b029:1d5:d9c5:cc08 with SMTP id
 x13-20020aa793ad0000b02901d5d9c5cc08mr15515054pff.37.1612752394347; 
 Sun, 07 Feb 2021 18:46:34 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/15] tcg/arm: Implement andc, orc, abs, neg,
 not vector operations
Date: Sun,  7 Feb 2021 18:46:17 -0800
Message-Id: <20210208024625.271018-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These logical and arithmetic operations are optional, but are
trivial to accomplish with the existing infrastructure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |  1 +
 tcg/arm/tcg-target.h         | 10 +++++-----
 tcg/arm/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index f30b3900e0..cc006f99cd 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -20,6 +20,7 @@ C_O0_I4(s, s, s, s)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
+C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, l, l)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 48993636ea..6ac9fc6b9b 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -155,11 +155,11 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_v128             use_neon_instructions
 #define TCG_TARGET_HAS_v256             0
 
-#define TCG_TARGET_HAS_andc_vec         0
-#define TCG_TARGET_HAS_orc_vec          0
-#define TCG_TARGET_HAS_not_vec          0
-#define TCG_TARGET_HAS_neg_vec          0
-#define TCG_TARGET_HAS_abs_vec          0
+#define TCG_TARGET_HAS_andc_vec         1
+#define TCG_TARGET_HAS_orc_vec          1
+#define TCG_TARGET_HAS_not_vec          1
+#define TCG_TARGET_HAS_neg_vec          1
+#define TCG_TARGET_HAS_abs_vec          1
 #define TCG_TARGET_HAS_roti_vec         0
 #define TCG_TARGET_HAS_rots_vec         0
 #define TCG_TARGET_HAS_rotv_vec         0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index ae91b959f0..1b31f11f6c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -181,11 +181,15 @@ typedef enum {
 
     INSN_VADD      = 0xf2000800,
     INSN_VAND      = 0xf2000110,
+    INSN_VBIC      = 0xf2100110,
     INSN_VEOR      = 0xf3000110,
+    INSN_VORN      = 0xf2300110,
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
 
+    INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
+    INSN_VNEG      = 0xf3b10380,
 
     INSN_VCEQ0     = 0xf3b10100,
     INSN_VCGT0     = 0xf3b10000,
@@ -2373,14 +2377,20 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I1(w, r);
     case INDEX_op_dup_vec:
         return C_O1_I1(w, wr);
+    case INDEX_op_abs_vec:
+    case INDEX_op_neg_vec:
+    case INDEX_op_not_vec:
+        return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
+    case INDEX_op_andc_vec:
         return C_O1_I2(w, w, wO);
     case INDEX_op_and_vec:
+    case INDEX_op_orc_vec:
         return C_O1_I2(w, w, wV);
     case INDEX_op_cmp_vec:
         return C_O1_I2(w, w, wZ);
@@ -2725,6 +2735,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_dup2_vec:
         tcg_out_dup2_vec(s, a0, a1, a2);
         return;
+    case INDEX_op_abs_vec:
+        tcg_out_vreg2(s, INSN_VABS, q, vece, a0, a1);
+        return;
+    case INDEX_op_neg_vec:
+        tcg_out_vreg2(s, INSN_VNEG, q, vece, a0, a1);
+        return;
+    case INDEX_op_not_vec:
+        tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a1);
+        return;
     case INDEX_op_add_vec:
         tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
         return;
@@ -2735,6 +2754,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
 
+    case INDEX_op_andc_vec:
+        if (!const_args[2]) {
+            tcg_out_vreg3(s, INSN_VBIC, q, 0, a0, a1, a2);
+            return;
+        }
+        a2 = ~a2;
+        /* fall through */
     case INDEX_op_and_vec:
         if (const_args[2]) {
             is_shimm1632(~a2, &cmode, &imm8);
@@ -2748,6 +2774,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_vreg3(s, INSN_VAND, q, 0, a0, a1, a2);
         return;
 
+    case INDEX_op_orc_vec:
+        if (!const_args[2]) {
+            tcg_out_vreg3(s, INSN_VORN, q, 0, a0, a1, a2);
+            return;
+        }
+        a2 = ~a2;
+        /* fall through */
     case INDEX_op_or_vec:
         if (const_args[2]) {
             is_shimm1632(a2, &cmode, &imm8);
@@ -2810,10 +2843,15 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_and_vec:
+    case INDEX_op_andc_vec:
     case INDEX_op_or_vec:
+    case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
+    case INDEX_op_not_vec:
         return 1;
+    case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_neg_vec:
         return vece < MO_64;
     default:
         return 0;
-- 
2.25.1


