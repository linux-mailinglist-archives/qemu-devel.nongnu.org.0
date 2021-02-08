Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469C312998
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:56:41 +0100 (CET)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xfE-0005Wd-KD
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZS-0003yy-G1
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:38 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZQ-00007e-Ql
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:38 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l18so7940505pji.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gowexwenP0ZkS0ebio3iaGH39rk+PDid2Xbx2FaWzPQ=;
 b=ozu6WKxaUcgQFi+smw5JwAvyCn75MN9ycWL0nDl6ygTdJYya7Ua6T8S0zIZXd0Ifav
 hJsghoiLmLlNYp7+tLRKSSuIAt+6ZRG0a1xfsLhAkXGNWRMQaNNatTyX12cbRwN0Hu7X
 o7l3r0rY6koyx+jgTniX6AudQkzkgYVOTASd7aTBn376fVXgF2gSYa86OwuRIl1vqAma
 +QlQiHjyLR0WSCZ0w2+t1u5UAPXW4pGi1eYRPfGqAfLlEBxOAQUQRbjU5Y7p5bLROTB0
 Re1Fonj6VHCblxrdpruS2rGNVCioAyCi07hOzB1UtsmA9D30562cwbtkF/js4tVclxjg
 EzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gowexwenP0ZkS0ebio3iaGH39rk+PDid2Xbx2FaWzPQ=;
 b=fdjACJAICHUfvs33I/YdE5hzh+hWV7Hfb3KFPkq81dNmk81oONGcPSv1qwh4Vjibh8
 o4tushswA5D8avApdG2fwFxWEt8qjtHvSQ+PTafSNY5rXNmZEbnZ41SngvIjS6Go89tX
 I6yQrTC23pR6W1RsDWF09EJyLE4on4EO2Ioflj+Fg60ig/ARkrDgjuD1zOgL78HI5GUT
 C/jMuZ3wVjvvyLU/I/OBBYt1nem68pu8WaN8+j94ocCxxeEXlY1c+FH0ahYV8dk38f3l
 lnhVvs9acBVT0CtYncea5KRIRtZv4NAkBjHYXmYNtM+LZA/CgJ5iWuxAxpFXRj1Yvl2h
 CAow==
X-Gm-Message-State: AOAM532n4JiM3Qt1L36BmbMJJM06jzlsPXzXbjmVoQagmZWtREJfRPz2
 HouAci45tZM2ecKAcLZbFYEhR7KRt6YO4g==
X-Google-Smtp-Source: ABdhPJy/GbMzIwhDyZ4iENheOA6KYP1tESC0U4d0ovkSRXw92EpYsgya0B9TO2j1iatK+TX3VZKBGg==
X-Received: by 2002:a17:902:a517:b029:de:79a7:48d9 with SMTP id
 s23-20020a170902a517b02900de79a748d9mr14174678plq.45.1612752395555; 
 Sun, 07 Feb 2021 18:46:35 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/15] tcg/arm: Implement TCG_TARGET_HAS_shi_vec
Date: Sun,  7 Feb 2021 18:46:18 -0800
Message-Id: <20210208024625.271018-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

This consists of the three immediate shifts: shli, shri, sari.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 6ac9fc6b9b..cfbadad72c 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -163,7 +163,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_roti_vec         0
 #define TCG_TARGET_HAS_rots_vec         0
 #define TCG_TARGET_HAS_rotv_vec         0
-#define TCG_TARGET_HAS_shi_vec          0
+#define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 1b31f11f6c..22cf44263c 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -203,6 +203,10 @@ typedef enum {
     INSN_VCGE_U    = 0xf3000310,
     INSN_VCGT_U    = 0xf3000300,
 
+    INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
+    INSN_VSARI     = 0xf2800010,  /* VSHR.S */
+    INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+
     INSN_VTST      = 0xf2000810,
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
@@ -1325,6 +1329,14 @@ static void tcg_out_vmovi(TCGContext *s, TCGReg rd,
               | (extract32(imm8, 7, 1) << 24));
 }
 
+static void tcg_out_vshifti(TCGContext *s, ARMInsn insn, int q,
+                            TCGReg rd, TCGReg rm, int l_imm6)
+{
+    tcg_out32(s, insn | (q << 6) | encode_vd(rd) | encode_vm(rm) |
+              (extract32(l_imm6, 6, 1) << 7) |
+              (extract32(l_imm6, 0, 6) << 16));
+}
+
 static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
                           TCGReg rd, TCGReg rn, int offset)
 {
@@ -2380,6 +2392,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_abs_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_sari_vec:
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
@@ -2753,6 +2768,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_xor_vec:
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
+    case INDEX_op_shli_vec:
+        tcg_out_vshifti(s, INSN_VSHLI, q, a0, a1, a2 + (8 << vece));
+        return;
+    case INDEX_op_shri_vec:
+        tcg_out_vshifti(s, INSN_VSHRI, q, a0, a1, (16 << vece) - a2);
+        return;
+    case INDEX_op_sari_vec:
+        tcg_out_vshifti(s, INSN_VSARI, q, a0, a1, (16 << vece) - a2);
+        return;
 
     case INDEX_op_andc_vec:
         if (!const_args[2]) {
@@ -2848,6 +2872,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_sari_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


