Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB9F31299C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:01:56 +0100 (CET)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xkJ-0000oa-J2
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZZ-00041p-VE
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:46 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZU-00009B-VC
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:45 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u11so7005393plg.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=reRP6xWNArAQ4z5/WchJHcoykmUgBZ0MZ2SwzFhH+TE=;
 b=Rrbo5Auuq4amiBLWlaQ7fIgoe5UzJbmVnTX818tJ04dnbvMvKOmFq8PhTFUeNuRHPk
 V0dfuzbvmzulhkgEio63ZIWQyImz/82ln3F1tCXRXAMspH/fMGBbyvEE8q2u0Lj/XAZo
 xCXgnJD/BvGjXuX1bnsEIpVHQBVTllsGT8PRaoaMYhd4u/OWZsWEC3LzH89c6pr/5woH
 stAnyu4PrXyDJpiRONPA4HlvpoCwJj+2MxEV2eHvtnwWa4iwhW/m60jF5AdBiToKMxpR
 1AAHiLqz/FtopaDft4qaAybOGWbnfIj+jB3MYIkDRa0XLAIIEYaQhdo2wbqULSg35sRA
 vNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reRP6xWNArAQ4z5/WchJHcoykmUgBZ0MZ2SwzFhH+TE=;
 b=jazx8U+bjvRzXumLF0c1iMncqsUPqS+iN6Wu+dTJX3/ZB8qbCBaHy58YsNfNU53wiT
 OHtjSuu4e5f0ks9NAJfQXgfZvVYbNesIAmMADGMGmfuRC7LSdVkiQiNCiXkgQZxrg1rg
 cPMYPfVPZeU3eMkUwiQrk972cgse7Ifd+UNefR96I/c8Osui+n9PgFlzQB4eqyWe658t
 cVxajsqiS44LVgGzXlM2wC6yywGaFW3wqGe7UHYPCxskSsq6ld5u7eQdyRBK7bVQozHW
 CrLhGjP7huequXqNkXkX2BzUNaHHTTnUje/eiJYp8efpzKei5pzemtQ2xw/pE04eZjqF
 nmaw==
X-Gm-Message-State: AOAM530XCyRBNP2rXo0D0VbJzkuw84p8eh2g2SKoh9wBMZeo4SWrtb1e
 QB1brtB4tuQ/rHYglFk4xCpItWIp5xg/+A==
X-Google-Smtp-Source: ABdhPJzyIy+keRemuIT97mFPHLElHh0bbXg42ifWK4P0sBASyF4fD73dHoAcNz9Hf3DZspXXdfxIng==
X-Received: by 2002:a17:90a:654a:: with SMTP id
 f10mr14634755pjs.202.1612752399578; 
 Sun, 07 Feb 2021 18:46:39 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
Date: Sun,  7 Feb 2021 18:46:22 -0800
Message-Id: <20210208024625.271018-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NEON has 3 instructions implementing this 4 argument operation,
with each insn overlapping a different logical input onto the
destination register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |  1 +
 tcg/arm/tcg-target.h         |  2 +-
 tcg/arm/tcg-target.c.inc     | 22 ++++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index cc006f99cd..d02797cbf4 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -34,6 +34,7 @@ C_O1_I2(w, w, w)
 C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wV)
 C_O1_I2(w, w, wZ)
+C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 4815a34e75..d6222ba2db 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -169,7 +169,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       1
-#define TCG_TARGET_HAS_bitsel_vec       0
+#define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
 #define TCG_TARGET_DEFAULT_MO (0)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index afd2807c09..875d975d4b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -216,6 +216,10 @@ typedef enum {
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
 
+    INSN_VBSL      = 0xf3100110,
+    INSN_VBIT      = 0xf3200110,
+    INSN_VBIF      = 0xf3300110,
+
     INSN_VTST      = 0xf2000810,
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
@@ -2427,7 +2431,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(w, w, wV);
     case INDEX_op_cmp_vec:
         return C_O1_I2(w, w, wZ);
-
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(w, w, w, w);
     default:
         g_assert_not_reached();
     }
@@ -2748,7 +2753,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a3;
     int cmode, imm8;
 
     a0 = args[0];
@@ -2899,6 +2904,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         return;
 
+    case INDEX_op_bitsel_vec:
+        a3 = args[3];
+        if (a0 == a3) {
+            tcg_out_vreg3(s, INSN_VBIT, q, 0, a0, a2, a1);
+        } else if (a0 == a2) {
+            tcg_out_vreg3(s, INSN_VBIF, q, 0, a0, a3, a1);
+        } else {
+            tcg_out_mov(s, type, a0, a1);
+            tcg_out_vreg3(s, INSN_VBSL, q, 0, a0, a2, a3);
+        }
+        return;
+
     case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
     default:
@@ -2924,6 +2941,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
+    case INDEX_op_bitsel_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


