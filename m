Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F0331297B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:41:13 +0100 (CET)
Received: from localhost ([::1]:34132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xQG-0000da-Ox
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZY-00041h-C0
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:46 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZU-00008I-26
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:44 -0500
Received: by mail-pg1-x529.google.com with SMTP id c132so9269263pga.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EMZ7TabXdfCn73maN16PxI+M4OLz/pJ2bqfuMrXpBLc=;
 b=FcRNeNXlhHbuBRuhOAU9enL3+K809LEkyZoFFWxJrDudHlRLyy6Pk5p8tWfmkziDi0
 AcKO42tG5RQyxmSPd3G4cM6pmMGy11DGCyrK+KdVqYBJYwGGhKBQaWXV9GXUxAeLXSbj
 Taip3f8dKkZcJn3vBImeDUndM4TKevEsgS8/aKdQJyJxQEQsj7+6mJ11AjNKlpqyhIiq
 +UcueSaax+AoDd9mwelwrOfHl9h4j9wIe0o+hujyYCVn9cUi4YW2Iyu/LT785wwxGiyT
 4oeetqu/RDvrhLdReVEnhjEl6i/sNvpX94gpU3kZAyDSz3y13Jtkpnkv8aXBH3zu5uVc
 SQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMZ7TabXdfCn73maN16PxI+M4OLz/pJ2bqfuMrXpBLc=;
 b=OlBIuxhljWzXgGpt6XmFt297+pkGrnqvSjiTqeeWvmhfOGpwEcp/K4DwhlBtFmXySQ
 +fesIRo8kAnFMuyumih3xe39+dgaABxui9qiHY9CJ3LUOrWt3LrIdspGl1wZBXcom0o8
 IDE1geuwpogFjII6KwRAjdNFJnmr6ybYF0dekoXAXGdbfEA62RKR7F2+fpacCu0mqW2e
 tHezjgqh4oumx388cWPXeZ7AIsCVPXDHIM+8/nvId6JNNn58pdOAJ+HTlsl1GWEA5si/
 Zdr+9xLSUTrLBLbNkdYGeUmfst0POSYIRR2jsJa5pTNbZ2D9u6GEb1ZtyeQVI5IANOcc
 aX0Q==
X-Gm-Message-State: AOAM530iNZnDS9sqREkdxLVgKFiYVMvzFe8OFtkr91L+TX4+e/wo3EPJ
 4tA8N38UJDM6lWvawLyNePLHt09GQpKx3g==
X-Google-Smtp-Source: ABdhPJzGv3gYKg9JFUfNjRyis+F1zICVjdPY6fGE+ia/5doEF76A7fKDXKFpbmpGATkjutrW2dGwiA==
X-Received: by 2002:a65:520d:: with SMTP id o13mr15061464pgp.57.1612752398641; 
 Sun, 07 Feb 2021 18:46:38 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
Date: Sun,  7 Feb 2021 18:46:21 -0800
Message-Id: <20210208024625.271018-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

This is minimum and maximu, signed and unsigned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 71621f28e9..4815a34e75 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -168,7 +168,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
-#define TCG_TARGET_HAS_minmax_vec       0
+#define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a4c398417a..afd2807c09 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -191,6 +191,10 @@ typedef enum {
     INSN_VQADD_U   = 0xf3000010,
     INSN_VQSUB     = 0xf2000210,
     INSN_VQSUB_U   = 0xf3000210,
+    INSN_VMAX      = 0xf2000600,
+    INSN_VMAX_U    = 0xf3000600,
+    INSN_VMIN      = 0xf2000610,
+    INSN_VMIN_U    = 0xf3000610,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2404,9 +2408,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
@@ -2775,6 +2783,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mul_vec:
         tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_smax_vec:
+        tcg_out_vreg3(s, INSN_VMAX, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_smin_vec:
+        tcg_out_vreg3(s, INSN_VMIN, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2784,6 +2798,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sssub_vec:
         tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_umax_vec:
+        tcg_out_vreg3(s, INSN_VMAX_U, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_umin_vec:
+        tcg_out_vreg3(s, INSN_VMIN_U, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_usadd_vec:
         tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
         return;
@@ -2909,6 +2929,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_cmp_vec:
     case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return vece < MO_64;
     default:
         return 0;
-- 
2.25.1


