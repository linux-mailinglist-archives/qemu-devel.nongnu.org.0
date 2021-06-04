Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB539C134
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:21:55 +0200 (CEST)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGKI-0002FK-Ij
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB3-0005r4-Uk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB1-0005Lv-9a
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:21 -0400
Received: by mail-pg1-x531.google.com with SMTP id y11so589367pgp.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jk5jd4GgRdQNaOXBNRlXkKpYthjcQtoi0Q/kjOejxw=;
 b=I6UYXJgCKILvBtbJ06JeGEQFRAB0lQ3fHDh95lCi1pf8ZdfiTWMI3N4x47Lxyzn5R7
 z7UuHUsamTwlnOoGXgTT+7y3u5o10cSRjV3IQpNjunnPR6LmFHukq8sQYQwTMA3OUSc3
 FamcO+OYf80b3k8411oCnGqjXUtxAAxudUbPlV2VRYKpXRfhO8N1wEh4H3HZW8oiW2+l
 lRXetFhbKPllkL9L5LOYvXEoscBmi+DgJ1i2cB0hm3Ze3oyf97lXwip2c8gbwOvcfnvo
 2htKh9PdYswy4cvp5U8rs2OJR9Sa2967y4ZkbulmD5dnamr3l4rsWZujP1mT47iEuo9g
 eMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jk5jd4GgRdQNaOXBNRlXkKpYthjcQtoi0Q/kjOejxw=;
 b=EE2ljZptK5gFDytJCs0m94Eoyb40cJ03IqzRgR/g2xGsvtNGn+rR/OPj5esrK4H63d
 5FSK/y5D6oOfgyLyjQnqyHzc8200v6U3ss4vw0UxNbbTx5A8yM8uGPqZm0qUKCOJHHgC
 /TKjrECEoq19Z3ibb27NKvQYJWdScD+OvaudYzm4nwSorv/WI2fZe7EpI7n7bh3xpoVS
 9l4xUOOMZnArtSy3P/NP+kc2doS0kVqPWKFVDfhmz882K0O0JGenFukAP+o78ZBRyrK+
 IeMGF/TLmZmrzhNSGlyJltFcuZ5oRp71mmZQpsrLiV+/JQhfGqfb6WhdP8TE8Nhz+oYl
 fnAQ==
X-Gm-Message-State: AOAM531zf3oUUGVb2XW+EKQrDoPV/jMyt6cnnFKS9W3MVtkGALZfr5Qj
 QzpocrRX7mpF/jyB02qNW6AVajLN9w+7nw==
X-Google-Smtp-Source: ABdhPJzCEV5Yq19QGgx3VInFY5chhNvpP/E4GrnsqvCUSrIdyn0nHrVxzc++YKVVWB/IkuBdbXh3vw==
X-Received: by 2002:a62:784d:0:b029:2e9:a58e:8006 with SMTP id
 t74-20020a62784d0000b02902e9a58e8006mr5990838pfc.22.1622837537969; 
 Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
Date: Fri,  4 Jun 2021 13:12:07 -0700
Message-Id: <20210604201210.920136-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

NEON has 3 instructions implementing this 4 argument operation,
with each insn overlapping a different logical input onto the
destination register.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 8193d768d6..3381240909 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -213,6 +213,10 @@ typedef enum {
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
 
+    INSN_VBSL      = 0xf3100110,
+    INSN_VBIT      = 0xf3200110,
+    INSN_VBIF      = 0xf3300110,
+
     INSN_VTST      = 0xf2000810,
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
@@ -2423,7 +2427,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(w, w, wV);
     case INDEX_op_cmp_vec:
         return C_O1_I2(w, w, wZ);
-
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(w, w, w, w);
     default:
         g_assert_not_reached();
     }
@@ -2741,7 +2746,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a3;
     int cmode, imm8;
 
     a0 = args[0];
@@ -2892,6 +2897,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2917,6 +2934,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
+    case INDEX_op_bitsel_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


