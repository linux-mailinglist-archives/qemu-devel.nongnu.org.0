Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F0D2E2917
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:50:22 +0100 (CET)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZR7-0007Ci-3M
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMN-0001u1-DI
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:27 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZML-0008Jw-Ju
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:27 -0500
Received: by mail-pg1-x535.google.com with SMTP id i5so2286436pgo.1
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hlUyyb+iuSTwDeQLaZh4hJz10IpDMn5XBpPh3/4SFGQ=;
 b=SHBae6DfyY2SiapAOqzBnITMDcHoEJlxn3lfOnyZegqZQjop/Q4mEC4YM9gm3FYBlm
 HYDWCIbMRF1YyeYpilT4xI17XythRNxeFnq0w3P1CloSF0yUgmulkPQNrjBWi6ttSL8K
 GPn8+i83Ub1D9HNMQVIlTqo8Lnxgbp35E23EUwqGslb8BaFflxwGoQWlbHEOa6rL9bl7
 ypw2sSS598GIfP0iEYDRZGPWogMbarlZg9GDmsOqCZ9qmDA6ASEPo29gf2bM1NKfu1HZ
 BOwwJ/LxlCspeWsCFnNAbBe8uTvHTxVJnxE68DOVTfIHXpI5FNbX2jt7jZQdmU7KNHWr
 k9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlUyyb+iuSTwDeQLaZh4hJz10IpDMn5XBpPh3/4SFGQ=;
 b=jWSR0RR3zmAZMX2k86EDH//5+Z7WXpZ9RWpaitQQN+Wnms9Kue/DQTwPtgh75lV4Vt
 dLgzeeODp1Pn0ia6682DQBuk3e4IrQN0kBf5lQAmMvLU/Vju82KA2lXDT1aucSBHdGEt
 LE7buf5kFxUoXNLOiV/hZdjVPhAvWgw5ZSSAwwv+0zNZ/6B04w7cxTZxHZ853lVuFSKJ
 fJ8BR1s3scqPlRVa9XM6k0g1nf46YTEHNnfgA7PR9XgnKuX2IntVgU3xYK42zqnFsvqf
 yAKMF1soYgSJ6EyU/vNhkfG6h1+uRCERV3mPuknF0TxYZOOysZpr1mc9jNtZ6SbaLHrN
 CDpQ==
X-Gm-Message-State: AOAM531TVm4k2J/GQccDPaQx4txSqQ1tDo7Evf6ljI6vJqis5B0U7R9J
 2KBRqAhZqGJ4uznV9+kTmaoZYwItuuacgA==
X-Google-Smtp-Source: ABdhPJyFkbXEGMswQtPk81fLG7F0PV3rwEetnhLPEbubvKatWFJ0D5kTYwjKBh5F9+k6e9t+LqKAqQ==
X-Received: by 2002:a63:2242:: with SMTP id t2mr30032712pgm.428.1608849923832; 
 Thu, 24 Dec 2020 14:45:23 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] tcg/arm: Implement andc, orc, abs, neg,
 not vector operations
Date: Thu, 24 Dec 2020 14:45:06 -0800
Message-Id: <20201224224514.626561-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 tcg/arm/tcg-target-conset.h |  1 +
 tcg/arm/tcg-target.h        | 10 +++++-----
 tcg/arm/tcg-target.c.inc    | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/tcg/arm/tcg-target-conset.h b/tcg/arm/tcg-target-conset.h
index ffcac7c6aa..f32bf44f8b 100644
--- a/tcg/arm/tcg-target-conset.h
+++ b/tcg/arm/tcg-target-conset.h
@@ -15,6 +15,7 @@ C_O0_I4(s, s, s, s)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
+C_O1_I1(w, w)
 C_O1_I1(w, wr)
 C_O1_I2(r, 0, rZ)
 C_O1_I2(r, l, l)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index d87493364f..bb9302c616 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -154,11 +154,11 @@ extern bool use_neon_instructions;
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
index 91243b641c..88814c6836 100644
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
@@ -2346,14 +2350,20 @@ static int tcg_target_op_def(TCGOpcode op)
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
@@ -2698,6 +2708,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2708,6 +2727,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2721,6 +2747,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2783,10 +2816,15 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


