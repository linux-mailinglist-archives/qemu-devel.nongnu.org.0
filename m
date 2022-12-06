Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA2643C7F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlP-0003BW-DI; Mon, 05 Dec 2022 23:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlO-0003BK-75
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:02 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlM-00033r-HF
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:01 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso4152933fac.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WGdKBF2zneVVS/xRxqO1pXvHqF8OgdYYoM0h0n4kQKg=;
 b=FwmPrdGIFATH5ftz/gKOXOw9IukEBtmx0bpIOiD4oVQJq9zgtcrNbmP23gn4p5xtAz
 oYU4p78R2XhlWHs67k7kXqQFWyEBDHAITgYhX0GoP614C6e1JK3RQtQezbmdr38zidIq
 JMfAKrWpDiOdIHrSO4Jm8QbrOfkAUd1ISBQGaQw4+g3s+ESxpNdCMP+3qvRM32ZcRvpS
 mHPVbLgFC9Y4ybBncASyvEnE1OgVsfVj3jcZrryjUNB3trM/cObMWA7tsZddYys/kIDd
 Z8M6rsQxcuYHrUgHFWketxUeCJ/Ir9utVTAjU6+hKpNldPyP07aFZVfkpmSm/JZ1oNSh
 WoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGdKBF2zneVVS/xRxqO1pXvHqF8OgdYYoM0h0n4kQKg=;
 b=oRdTL1x8SmK/7hBosenfE4p3/7qNoeFaW2KLelLLXbMgdsGUwWP7zqp4i/i5fs13jA
 pkwSm1xgFAMctH3gEmjtd+m7IfCxsOrqXHbPTikOMUJ05Wa63v4Wy/rXZ+0fswvw+of4
 npVDskWLTdMUb1PL0GKZTxMDR56YJNqBCK0Fcx2bSr8jwWIVdDagp/gVrSlDKyX3Ovsf
 2Oenm9q6CHR5/D9+xDQ0v5Q7VEhtZkdABsUYrwtrYqzR2bfL4pgb0qrfQ2cVbNINN03s
 8epjIzxuthxD6BCpVRnehpkJcp6REDtZHpYGTbH0jOthL5tdwIKOYr92mAhWW1jhH6iU
 Cp7Q==
X-Gm-Message-State: ANoB5pkoaKBXlTD3HIxVqOrISIn/sZKoQImn2ukckKfxY7JjG+xKt1sA
 eQ6hjc0RpVW/YQ3aAJ21YeTiLmfOOP7Fj6+bspo=
X-Google-Smtp-Source: AA0mqf4LbsA+/PU3fp21bPngPHAOBLjC+r3DME+Q091lQ3dPgwTVHw7T8urfZQpx2/8Zwu4UuKbIyQ==
X-Received: by 2002:a05:6870:a2cd:b0:132:8d60:358f with SMTP id
 w13-20020a056870a2cd00b001328d60358fmr41169166oak.102.1670301658876; 
 Mon, 05 Dec 2022 20:40:58 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] tcg/loongarch64: Introduce tcg_out_addi
Date: Mon,  5 Dec 2022 22:40:47 -0600
Message-Id: <20221206044051.322543-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adjust the constraints to allow any int32_t for immediate
addition.  Split immediate adds into addu16i + addi, which
covers quite a lot of the immediate space.  For the hole in
the middle, load the constant into TMP0 instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  4 +-
 tcg/loongarch64/tcg-target-con-str.h |  2 +-
 tcg/loongarch64/tcg-target.c.inc     | 57 ++++++++++++++++++++++++----
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 349c672687..7b5a7a3f5d 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -23,9 +23,11 @@ C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, ri)
+C_O1_I2(r, rZ, rJ)
 C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index c3986a4fd4..541ff47fa9 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -21,7 +21,7 @@ REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S12)
-CONST('N', TCG_CT_CONST_N12)
+CONST('J', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U12)
 CONST('Z', TCG_CT_CONST_ZERO)
 CONST('C', TCG_CT_CONST_C12)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b2350f2cc7..a477b1b96d 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -126,7 +126,7 @@ static const int tcg_target_call_oarg_regs[] = {
 
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
-#define TCG_CT_CONST_N12   0x400
+#define TCG_CT_CONST_S32   0x400
 #define TCG_CT_CONST_U12   0x800
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
@@ -161,7 +161,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
         return true;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return true;
     }
     if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
@@ -378,6 +378,45 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static void tcg_out_addi(TCGContext *s, TCGType type, TCGReg rd,
+                         TCGReg rs, tcg_target_long imm)
+{
+    tcg_target_long lo12 = sextreg(imm, 0, 12);
+    tcg_target_long hi16 = sextreg(imm - lo12, 16, 16);
+
+    /*
+     * Note that there's a hole in between hi16 and lo12:
+     *
+     *       3                   2                   1                   0
+     *     1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+     * ...+-------------------------------+-------+-----------------------+
+     *    |             hi16              |       |          lo12         |
+     * ...+-------------------------------+-------+-----------------------+
+     *
+     * For bits within that hole, it's more efficient to use LU12I and ADD.
+     */
+    if (imm == (hi16 << 16) + lo12) {
+        if (hi16) {
+            tcg_out_opc_addu16i_d(s, rd, rs, hi16);
+            rs = rd;
+        }
+        if (type == TCG_TYPE_I32) {
+            tcg_out_opc_addi_w(s, rd, rs, lo12);
+        } else if (lo12) {
+            tcg_out_opc_addi_d(s, rd, rs, lo12);
+        } else {
+            tcg_out_mov(s, type, rd, rs);
+        }
+    } else {
+        tcg_out_movi(s, type, TCG_REG_TMP0, imm);
+        if (type == TCG_TYPE_I32) {
+            tcg_out_opc_add_w(s, rd, rs, TCG_REG_TMP0);
+        } else {
+            tcg_out_opc_add_d(s, rd, rs, TCG_REG_TMP0);
+        }
+    }
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_andi(s, ret, arg, 0xff);
@@ -1349,14 +1388,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_add_i32:
         if (c2) {
-            tcg_out_opc_addi_w(s, a0, a1, a2);
+            tcg_out_addi(s, TCG_TYPE_I32, a0, a1, a2);
         } else {
             tcg_out_opc_add_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_add_i64:
         if (c2) {
-            tcg_out_opc_addi_d(s, a0, a1, a2);
+            tcg_out_addi(s, TCG_TYPE_I64, a0, a1, a2);
         } else {
             tcg_out_opc_add_d(s, a0, a1, a2);
         }
@@ -1364,14 +1403,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_sub_i32:
         if (c2) {
-            tcg_out_opc_addi_w(s, a0, a1, -a2);
+            tcg_out_addi(s, TCG_TYPE_I32, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_sub_i64:
         if (c2) {
-            tcg_out_opc_addi_d(s, a0, a1, -a2);
+            tcg_out_addi(s, TCG_TYPE_I64, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_d(s, a0, a1, a2);
         }
@@ -1585,8 +1624,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_add_i32:
+        return C_O1_I2(r, r, ri);
     case INDEX_op_add_i64:
-        return C_O1_I2(r, r, rI);
+        return C_O1_I2(r, r, rJ);
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
@@ -1615,8 +1655,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, 0, rZ);
 
     case INDEX_op_sub_i32:
+        return C_O1_I2(r, rZ, ri);
     case INDEX_op_sub_i64:
-        return C_O1_I2(r, rZ, rN);
+        return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
-- 
2.34.1


