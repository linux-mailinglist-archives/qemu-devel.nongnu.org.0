Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895439C119
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:16:21 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGEu-0005rn-E0
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB1-0005j4-3J
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:19 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAy-0005Ku-W2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 69so5223401plc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8FC7U3mh7b5gil8pz0tCvspjOEtbOrrXBksja+JNWs=;
 b=YfC1mgZs1PDpD+r2D81lpezdFbMd4tRzLZZqxihcocb6HwEveGq3N6f7Ee0d1A2lwN
 i4F2R3CIBzSaC+Oq2RUKeP4DyLXCLh+Zs0GndRwGrsKVzhF4M6BYvxHHZYxCXMM3nAOB
 YbH4laA+UNP61RaHlYMlzZWXACntmKC6J6j5bspUgXjVBa1+Oww1oioFBhWGWWgddHlK
 TA64sn2yjg+JqVTD4Vo1DoiQPm4d/3fT9p7HCT20YSw1lPn165dmiino/cBpM3Dz0/lk
 JTaJMVqknzFAnrqXe9ZWWdo3+Y6Fx0vGPTiaHZThmbr/u1MtfyqOWpcFF4NwnLyU42Xe
 VYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8FC7U3mh7b5gil8pz0tCvspjOEtbOrrXBksja+JNWs=;
 b=B0BaTTh/iUylYOmJK10z5ed3hHHUin12XKuYnj6ZCXJrM9miP0PwcOL/8OzKqVdGoG
 T8KYN8WCp0I89MRkouLudBQl4XXF5gsSD/AK+eCiQtAUgRyHxu6Sy8tE7azC2tSkx7+h
 cHtK8DAzZFiVG9/RmTPQgT5eQx1BfmVmCq4XvbwzK50kDm2lefWvmiUBF4h3aoRrqbXM
 pWU6Rv+a+g4nPsnn68l7l2B7A1sYZAEWiwaRAa9LaEUGE1L2SL5MX6CNpNhWKQDFZ/qB
 5g7jqLOq34WmRcIbw2oaV5TuZlHX4BV29ISavyQeU7zinwtwLJEnxOS14I7QDmV1U4YI
 jHVg==
X-Gm-Message-State: AOAM5335dXh/vZ098jaeGBv/4cqpSlj1SOtfZ0z2EumQjqMxWaagyYY6
 GK6CGLDWqM015WNDM8rquEyCOF/eTEJp+Q==
X-Google-Smtp-Source: ABdhPJy0sPbanmy9KbGQjPE71yLriEurojRaBaXBjQtK3fVS8UPG946+YH6GuGEsifE78ETe7EXUZQ==
X-Received: by 2002:a17:90a:5b17:: with SMTP id
 o23mr6607177pji.14.1622837535805; 
 Fri, 04 Jun 2021 13:12:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] tcg/arm: Implement TCG_TARGET_HAS_shi_vec
Date: Fri,  4 Jun 2021 13:12:03 -0700
Message-Id: <20210604201210.920136-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This consists of the three immediate shifts: shli, shri, sari.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 2286e0aa09..d21aaab6f7 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -200,6 +200,10 @@ typedef enum {
     INSN_VCGE_U    = 0xf3000310,
     INSN_VCGT_U    = 0xf3000300,
 
+    INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
+    INSN_VSARI     = 0xf2800010,  /* VSHR.S */
+    INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+
     INSN_VTST      = 0xf2000810,
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
@@ -1321,6 +1325,14 @@ static void tcg_out_vmovi(TCGContext *s, TCGReg rd,
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
@@ -2376,6 +2388,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_abs_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_sari_vec:
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
@@ -2746,6 +2761,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2841,6 +2865,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


