Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFC39C128
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:18:50 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGHJ-00048S-Ri
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB1-0005kh-JQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAy-0005KE-Dv
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id u9so5156395plr.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKgVv+rtw4u2zZTA0Jt80fDcSryskqJxy9a7wDy5O70=;
 b=HO5aPrAz5/pjUjRa8aRqaLynfZ5f6wwIrI+Hoy6fVH8afZ72h6UrsufU0PMRxs0p8i
 z+H2Mi8X/FZfe/7Z0kGEby98I0j+Getiji2mlH9+sptmbZbSllX2RZgssgUqXy/Tthwn
 bAk9tbCXha+CX+DUzLO1ASH7kY7cSaKJxo7QnO+a+DX9DarOBtawfPQ2/KdT+UmK5E3l
 /t4Dudit1N/L9I/Ek7oZv/XbFY9C5q40YmoPy3WMb4QH5ZZ9rfqc/b2d6nah7i2yALnx
 3Lm6rG9hzwQ0zm6jJIwZmV7PPxyYVghzghytyOvXisCngbhVEliPoUUK7Dk+TuBZqbaD
 b7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKgVv+rtw4u2zZTA0Jt80fDcSryskqJxy9a7wDy5O70=;
 b=Yu0/irCKl8WhGMbTeMrz8uEImXoqAXT10/a+Fhc/9BlT2m2SERXrBr7dS+7t7oC2am
 +m9gO6eIXsF9vM2l+hhTRQzdSeS6eKcC3sEzI+R/yy6SiG/ptT2QCkcWxA7DBv4V6ble
 zevKPT9jWYwMr9JSjScHWBQGQdayniFQaoSBKq+MPJII1N74I66J4Jo1Mr9R5qDRE6p0
 d1s0nW/OoYC+st7Da9FodLGX3BgrGGTj7+H/BWxHhKpJYX2H8HPZ34yEj8bT2RWmpZhj
 ZSZ/WQLJo1BWF3ILh7DhMpB+l+XAK6b4yRW0MYcR60QIatr5abXgwO+h+ZPphd07UX2e
 YjBg==
X-Gm-Message-State: AOAM533U+dwnWqJRDBcrzd2bxfGNW2JpIxpZi3/A2s8eCCBzppikANKR
 o8XfoEjrEYM6ypoDJN68DrZIMvnBwhnHRg==
X-Google-Smtp-Source: ABdhPJwERVg26nFwADn5q6Ysa+v3CFEcU2OoHQgNWWuzX7tkYbPcrrhZjpsOT1GJRQYSUJnfzXtjGw==
X-Received: by 2002:a17:90a:b294:: with SMTP id
 c20mr18382827pjr.236.1622837535159; 
 Fri, 04 Jun 2021 13:12:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] tcg/arm: Implement andc, orc, abs, neg,
 not vector operations
Date: Fri,  4 Jun 2021 13:12:02 -0700
Message-Id: <20210604201210.920136-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

These logical and arithmetic operations are optional, but are
trivial to accomplish with the existing infrastructure.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index ab98fa1381..2286e0aa09 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -178,11 +178,15 @@ typedef enum {
 
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
@@ -2369,14 +2373,20 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
@@ -2718,6 +2728,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2728,6 +2747,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2741,6 +2767,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2803,10 +2836,15 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


