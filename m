Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE5643C77
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlR-0003CN-9L; Mon, 05 Dec 2022 23:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlP-0003Bq-Gh
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:03 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlN-00034P-8p
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:03 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso4152975fac.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ICekQBiYa39S52CeNXzqAhofq/3hTD6t+TgM2t5GlXk=;
 b=st9eIQc4bq6eaDH6uorLdJw/jnE7blzrhoo+SkHQxzklV6NDjD93rMarK+HnfrAv7q
 QOPtSQIlwMbNKpetuNDh5j62h7Yk2x0/oL0jCQZbwL9chWNzsROohrjvhclR+L+R3PSd
 cA7dRQcsb+LQIi8U8I0c2GTBXsMmfn7JB10fdiMo7L5TS9lZMAcx5qYMBJgNGX4P71pp
 X4Z3lNmudjQtzq1qxx8IxTxqzwq4dpTkrbHZGTYH/YuypLg43Yx/5N9K7iWZYorEK69x
 Wdkxmg2p4AFaxmqICz6NJvn+Q1ntxHEglfMr+U72XUf7dpJgckotF7pafWWX77T9w+Ik
 WTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICekQBiYa39S52CeNXzqAhofq/3hTD6t+TgM2t5GlXk=;
 b=KGPcRsoZPNh3L573mCO2/5xoml+7L5kxX5tSN64pDnbPOENZyKikwZcLpxUu+izPUp
 zcxpsl5pTrAxTcLW+q9z1k1H21BRC06O3z2ba9KYOks7hLI/yeQyfmKPYZKerSLGjy+l
 QwyBQup6qjcMC3xVa5DWr++SYwSZUQ04T9XP91wEuxIA5dythnF2zPGT4Zw1GngALjKq
 QyE1Z64otbaQKYZvxLEOw+ui3oIB0lyCfeIgWp7cJwH5BhGVwdr2DBx2lc8PAxNiLfjd
 h4Azl5lQOu6oJbAnXshjUbsPzhpuEUxxzilCe/yy6FNdUPWlT3NMYakTWYWpM9lDm1Kj
 glwg==
X-Gm-Message-State: ANoB5plqIxtLJdKyhOuhDUJy9lQrG8O7BaWIypnVo9TDyK2ls+BxVjqJ
 bctHTk7v4WLr1c6HOnMin2QCfr4SGaTsb5lP2oY=
X-Google-Smtp-Source: AA0mqf45b8KP1CkzOQNpsBIS28WwEq8tQIpa9E+9e19Xp0As7eEGGt0mJEes/vVLMbsIeRdDZ77lJQ==
X-Received: by 2002:a05:6870:b52a:b0:143:de0b:e6a5 with SMTP id
 v42-20020a056870b52a00b00143de0be6a5mr18912525oap.240.1670301660058; 
 Mon, 05 Dec 2022 20:41:00 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.40.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:40:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] tcg/loongarch64: Improve setcond expansion
Date: Mon,  5 Dec 2022 22:40:48 -0600
Message-Id: <20221206044051.322543-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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

Split out a helper function, tcg_out_setcond_int, which
does not always produce the complete boolean result, but
returns a set of flags to do so.

Accept all int32_t as constant input, so that LE/GT can
adjust the constant to LT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 165 +++++++++++++++++++++----------
 1 file changed, 115 insertions(+), 50 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a477b1b96d..325ae3b5c9 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -469,64 +469,131 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
-static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
-                            TCGReg arg1, TCGReg arg2, bool c2)
-{
-    TCGReg tmp;
+#define SETCOND_INV    TCG_TARGET_NB_REGS
+#define SETCOND_NEZ    (SETCOND_INV << 1)
+#define SETCOND_FLAGS  (SETCOND_INV | SETCOND_NEZ)
 
-    if (c2) {
-        tcg_debug_assert(arg2 == 0);
+static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
+                               TCGReg arg1, tcg_target_long arg2, bool c2)
+{
+    int flags = 0;
+
+    switch (cond) {
+    case TCG_COND_EQ:    /* -> NE  */
+    case TCG_COND_GE:    /* -> LT  */
+    case TCG_COND_GEU:   /* -> LTU */
+    case TCG_COND_GT:    /* -> LE  */
+    case TCG_COND_GTU:   /* -> LEU */
+        cond = tcg_invert_cond(cond);
+        flags ^= SETCOND_INV;
+        break;
+    default:
+        break;
     }
 
     switch (cond) {
-    case TCG_COND_EQ:
-        if (c2) {
-            tmp = arg1;
-        } else {
-            tcg_out_opc_sub_d(s, ret, arg1, arg2);
-            tmp = ret;
-        }
-        tcg_out_opc_sltui(s, ret, tmp, 1);
-        break;
-    case TCG_COND_NE:
-        if (c2) {
-            tmp = arg1;
-        } else {
-            tcg_out_opc_sub_d(s, ret, arg1, arg2);
-            tmp = ret;
-        }
-        tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, tmp);
-        break;
-    case TCG_COND_LT:
-        tcg_out_opc_slt(s, ret, arg1, arg2);
-        break;
-    case TCG_COND_GE:
-        tcg_out_opc_slt(s, ret, arg1, arg2);
-        tcg_out_opc_xori(s, ret, ret, 1);
-        break;
     case TCG_COND_LE:
-        tcg_out_setcond(s, TCG_COND_GE, ret, arg2, arg1, false);
-        break;
-    case TCG_COND_GT:
-        tcg_out_setcond(s, TCG_COND_LT, ret, arg2, arg1, false);
-        break;
-    case TCG_COND_LTU:
-        tcg_out_opc_sltu(s, ret, arg1, arg2);
-        break;
-    case TCG_COND_GEU:
-        tcg_out_opc_sltu(s, ret, arg1, arg2);
-        tcg_out_opc_xori(s, ret, ret, 1);
-        break;
     case TCG_COND_LEU:
-        tcg_out_setcond(s, TCG_COND_GEU, ret, arg2, arg1, false);
+        /*
+         * If we have a constant input, the most efficient way to implement
+         * LE is by adding 1 and using LT.  Watch out for wrap around for LEU.
+         * We don't need to care for this for LE because the constant input
+         * is still constrained to int32_t, and INT32_MAX+1 is representable
+         * in the 64-bit temporary register.
+         */
+        if (c2) {
+            if (cond == TCG_COND_LEU) {
+                /* unsigned <= -1 is true */
+                if (arg2 == -1) {
+                    tcg_out_movi(s, TCG_TYPE_REG, ret, !(flags & SETCOND_INV));
+                    return ret;
+                }
+                cond = TCG_COND_LTU;
+            } else {
+                cond = TCG_COND_LT;
+            }
+            arg2 += 1;
+        } else {
+            TCGReg tmp = arg2;
+            arg2 = arg1;
+            arg1 = tmp;
+            cond = tcg_swap_cond(cond);    /* LE -> GE */
+            cond = tcg_invert_cond(cond);  /* GE -> LT */
+            flags ^= SETCOND_INV;
+        }
         break;
-    case TCG_COND_GTU:
-        tcg_out_setcond(s, TCG_COND_LTU, ret, arg2, arg1, false);
+    default:
         break;
+    }
+
+    switch (cond) {
+    case TCG_COND_NE:
+        flags |= SETCOND_NEZ;
+        if (!c2) {
+            tcg_out_opc_xor(s, ret, arg1, arg2);
+        } else if (arg2 == 0) {
+            ret = arg1;
+        } else if (arg2 >= 0 && arg2 <= 0xfff) {
+            tcg_out_opc_xori(s, ret, arg1, arg2);
+        } else {
+            tcg_out_addi(s, TCG_TYPE_REG, ret, arg1, -arg2);
+        }
+        break;
+
+    case TCG_COND_LT:
+    case TCG_COND_LTU:
+        if (c2) {
+            if (arg2 >= -0x800 && arg2 <= 0x7ff) {
+                if (cond == TCG_COND_LT) {
+                    tcg_out_opc_slti(s, ret, arg1, arg2);
+                } else {
+                    tcg_out_opc_sltui(s, ret, arg1, arg2);
+                }
+                break;
+            }
+            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP0, arg2);
+            arg2 = TCG_REG_TMP0;
+        }
+        if (cond == TCG_COND_LT) {
+            tcg_out_opc_slt(s, ret, arg1, arg2);
+        } else {
+            tcg_out_opc_sltu(s, ret, arg1, arg2);
+        }
+        break;
+
     default:
         g_assert_not_reached();
         break;
     }
+
+    return ret | flags;
+}
+
+static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg arg1, tcg_target_long arg2, bool c2)
+{
+    int tmpflags = tcg_out_setcond_int(s, cond, ret, arg1, arg2, c2);
+
+    if (tmpflags != ret) {
+        TCGReg tmp = tmpflags & ~SETCOND_FLAGS;
+
+        switch (tmpflags & SETCOND_FLAGS) {
+        case SETCOND_INV:
+            /* Intermediate result is boolean: simply invert. */
+            tcg_out_opc_xori(s, ret, tmp, 1);
+            break;
+        case SETCOND_NEZ:
+            /* Intermediate result is zero/non-zero: test != 0. */
+            tcg_out_opc_sltu(s, ret, TCG_REG_ZERO, tmp);
+            break;
+        case SETCOND_NEZ | SETCOND_INV:
+            /* Intermediate result is zero/non-zero: test == 0. */
+            tcg_out_opc_sltui(s, ret, tmp, 1);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 }
 
 /*
@@ -1645,18 +1712,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ctz_i64:
         return C_O1_I2(r, r, rW);
 
-    case INDEX_op_setcond_i32:
-    case INDEX_op_setcond_i64:
-        return C_O1_I2(r, r, rZ);
-
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
         return C_O1_I2(r, 0, rZ);
 
     case INDEX_op_sub_i32:
+    case INDEX_op_setcond_i32:
         return C_O1_I2(r, rZ, ri);
     case INDEX_op_sub_i64:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_mul_i32:
-- 
2.34.1


