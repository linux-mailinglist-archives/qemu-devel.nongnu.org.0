Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD722E2919
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:52:53 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZTY-0001iq-4X
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMO-0001vU-53
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:28 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMM-0008K8-H5
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:27 -0500
Received: by mail-pf1-x42f.google.com with SMTP id h10so858560pfo.9
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UyOkiHtHg6XwqoRof2ZS3dpBuJLGq7jCLO0tGEoKGoU=;
 b=bdhB+Cezh/ouRlR3Ktqh+ACtC2Z88rx7yzht+nTTlSXpKYxFrY7YqQ2fcK6gHFEmsT
 HjFzPSwXhvcMprXjYr9zhc7Tl6zkaa3Rjd5A3vP1grEfYe//9CyZYYovrqpEeEr23fa3
 qpDS3l0C+e4ORypsqNAByUOkTIc8CwgLPzkQVrSZ7JqJWBDd7uuDjczWFvHGKYGvaHXT
 066OZY2h4xJVu1mHl+U3CeEIFm5x8Oa0SN3NT84FMjMiu5kxHhmFzyq0NryrKyxHY6gD
 GzbxlyPnxqX484ldEBauIS/IMYNvr/XAOHAHsDC5bPy0nH2rR7o/ukHWHCFu0IZ3R++0
 sRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UyOkiHtHg6XwqoRof2ZS3dpBuJLGq7jCLO0tGEoKGoU=;
 b=FS4PfHokvuKBBUamjPEmwFqLKypjbsBMIDj6z9jBw27FmOt5z5BcHYh0FhiSnweVPS
 xtk///Wz8QQTTNR61nfxtTZWQys3qTIt3or0aY093iu2O/5g/9ywAO443yQA96h+KOW3
 XIAYFKY77UyArUkhCIIXAu6lbbNeFxx0Xh3e9BdRqWGDDdYruBPvQB3Dp7LhyLlh/65G
 4YPmRQyj5mvjxu2xwU8GY6X3edKNcKupjmBPTWlQG7xJwVuY7o5FplPFq+r4vZnbv9aV
 eBb5Gxk9U6umyulkjxZFbiQSvqHWeWVwskxaJaY0oMe/gLs0vkh8VjTTBjhQWnOYZqra
 4MNg==
X-Gm-Message-State: AOAM533QtFA0qMOzriw/ne3w1VWg0/4ZIOzD3p2OWJ/D/qRCU+wKyEbr
 cAorpV9vWIEZJnMGxFB9J8ADaEQoB2jcCw==
X-Google-Smtp-Source: ABdhPJy8LMxxJu7vgVwQuMSKJhc1/ByKwkziUmS5ykQwiRDCLob5Z7WIMZe0dem7tdezsnTz/H9D+w==
X-Received: by 2002:a63:1d22:: with SMTP id d34mr29767332pgd.335.1608849924879; 
 Thu, 24 Dec 2020 14:45:24 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] tcg/arm: Implement TCG_TARGET_HAS_shi_vec
Date: Thu, 24 Dec 2020 14:45:07 -0800
Message-Id: <20201224224514.626561-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
index bb9302c616..344b0d3199 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -162,7 +162,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_roti_vec         0
 #define TCG_TARGET_HAS_rots_vec         0
 #define TCG_TARGET_HAS_rotv_vec         0
-#define TCG_TARGET_HAS_shi_vec          0
+#define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 88814c6836..f5d10e262a 100644
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
@@ -1298,6 +1302,14 @@ static void tcg_out_vmovi(TCGContext *s, TCGReg rd,
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
@@ -2353,6 +2365,9 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_abs_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_sari_vec:
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
@@ -2726,6 +2741,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2821,6 +2845,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


