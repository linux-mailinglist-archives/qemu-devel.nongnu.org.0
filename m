Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC336F53DE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:59:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IP-0000yb-2x; Wed, 03 May 2023 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IM-0000xL-S4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IK-0006cv-VE
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so30351175e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104223; x=1685696223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EI3wOjdBpFbW0dpuzsBYjraKASUcW6h2rL91SDLBvrI=;
 b=ENA7jdXVsuLApM+hcPXz4O8YMnCYv0xcUIf1gfR/n+gdNgNfiM+moHEzmqMa/7VaLH
 bvLxCtNfmnCANHEUnYZGY5oOfPhORiqk97wYWBbMccs+DrW5KUO0yWAZ3IV+N0gRhe44
 j0Q7nXTjA4DeUoQCIBlfqHIToYOojMPJPLny0fB5anc5G8/BaiyMST2lOB/UKoo4uUUQ
 C3unG82nanJYWsvKHdOYJk2UiqDm7RIlDSOrGPqwzyGE64W5m24hTO+1bsYwnXnm4McE
 1ccRbf4D/oP4w13ZOaQ6NgOpBPHIh1xH/7jcTZVTF7UdB9cpOVb8crAu6BEzR27oJHwb
 Gebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104223; x=1685696223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EI3wOjdBpFbW0dpuzsBYjraKASUcW6h2rL91SDLBvrI=;
 b=bGrtlpgGtMDIm4WAqDiz+SwjGzF1oX8s/OPLGdxR78hZZzf6gRyUZImDVebuj3P7+w
 xSfAdIVCaf5hw06NCabIFs7NOY721jwVI6K6vxSWuxwE/FYZdFklp0YISZKOCWn4Lftq
 kTEn2z9OCD5RVC6a1aiD5dwxRLPo16LyUOpMzZdAHkSR5U5bGC1Df+oviCqrygX2T1Oo
 ZZrownPEbu87eaRigfBBZIU0yPSBaEUB537UZaM0X6aBQHhlNQNCmVhWetHWi2f8GsyA
 KwjiaiDlBJ/oM9T+GnwAAVB/0ZnkOZHTZt1l61vcf8vqrNuoQLz5B6JN/ihxviqjBXQD
 YixQ==
X-Gm-Message-State: AC+VfDw3+NdQdnKYw1zilxZb57QpxfKh3RhVrOXjxX6ZkfNnf5kfmpHn
 lCqOwJJENQ7NZ49xZU3be5R8VOXnqsfe7BD7fCZuFQ==
X-Google-Smtp-Source: ACHHUZ5YiRCQkv5XLzyEzREtDeHm6VZCP3piWxJ26Rh/XyM1VPabwjKzOYMYONB7u84+g3RuhJcPSg==
X-Received: by 2002:a7b:ce8c:0:b0:3f3:468d:d019 with SMTP id
 q12-20020a7bce8c000000b003f3468dd019mr3306312wmj.16.1683104223087; 
 Wed, 03 May 2023 01:57:03 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 09/11] tcg/riscv: Improve setcond expansion
Date: Wed,  3 May 2023 09:56:55 +0100
Message-Id: <20230503085657.1814850-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Split out a helper function, tcg_out_setcond_int, which does not
always produce the complete boolean result, but returns a set of
flags to do so.

Based on 21af16198425, the same improvement for loongarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 164 +++++++++++++++++++++++++++----------
 1 file changed, 121 insertions(+), 43 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 044ddfb160..84b646105c 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -812,50 +812,128 @@ static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
     tcg_out_opc_branch(s, op, arg1, arg2, 0);
 }
 
-static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
-                            TCGReg arg1, TCGReg arg2)
+#define SETCOND_INV    TCG_TARGET_NB_REGS
+#define SETCOND_NEZ    (SETCOND_INV << 1)
+#define SETCOND_FLAGS  (SETCOND_INV | SETCOND_NEZ)
+
+static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
+                               TCGReg arg1, tcg_target_long arg2, bool c2)
 {
+    int flags = 0;
+
     switch (cond) {
-    case TCG_COND_EQ:
-        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
-        tcg_out_opc_imm(s, OPC_SLTIU, ret, ret, 1);
-        break;
-    case TCG_COND_NE:
-        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
-        tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, ret);
-        break;
-    case TCG_COND_LT:
-        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
-        break;
-    case TCG_COND_GE:
-        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
-        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
-        break;
-    case TCG_COND_LE:
-        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
-        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
-        break;
-    case TCG_COND_GT:
-        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
-        break;
-    case TCG_COND_LTU:
-        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
-        break;
-    case TCG_COND_GEU:
-        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
-        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
-        break;
-    case TCG_COND_LEU:
-        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
-        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
-        break;
-    case TCG_COND_GTU:
-        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
+    case TCG_COND_EQ:    /* -> NE  */
+    case TCG_COND_GE:    /* -> LT  */
+    case TCG_COND_GEU:   /* -> LTU */
+    case TCG_COND_GT:    /* -> LE  */
+    case TCG_COND_GTU:   /* -> LEU */
+        cond = tcg_invert_cond(cond);
+        flags ^= SETCOND_INV;
         break;
     default:
-         g_assert_not_reached();
-         break;
-     }
+        break;
+    }
+
+    switch (cond) {
+    case TCG_COND_LE:
+    case TCG_COND_LEU:
+        /*
+         * If we have a constant input, the most efficient way to implement
+         * LE is by adding 1 and using LT.  Watch out for wrap around for LEU.
+         * We don't need to care for this for LE because the constant input
+         * is constrained to signed 12-bit, and 0x800 is representable in the
+         * temporary register.
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
+            tcg_debug_assert(arg2 <= 0x7ff);
+            if (++arg2 == 0x800) {
+                tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP0, arg2);
+                arg2 = TCG_REG_TMP0;
+                c2 = false;
+            }
+        } else {
+            TCGReg tmp = arg2;
+            arg2 = arg1;
+            arg1 = tmp;
+            cond = tcg_swap_cond(cond);    /* LE -> GE */
+            cond = tcg_invert_cond(cond);  /* GE -> LT */
+            flags ^= SETCOND_INV;
+        }
+        break;
+    default:
+        break;
+    }
+
+    switch (cond) {
+    case TCG_COND_NE:
+        flags |= SETCOND_NEZ;
+        if (!c2) {
+            tcg_out_opc_reg(s, OPC_XOR, ret, arg1, arg2);
+        } else if (arg2 == 0) {
+            ret = arg1;
+        } else {
+            tcg_out_opc_reg(s, OPC_XORI, ret, arg1, arg2);
+        }
+        break;
+
+    case TCG_COND_LT:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_SLTI, ret, arg1, arg2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
+        }
+        break;
+
+    case TCG_COND_LTU:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_SLTIU, ret, arg1, arg2);
+        } else {
+            tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
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
+            tcg_out_opc_imm(s, OPC_XORI, ret, tmp, 1);
+            break;
+        case SETCOND_NEZ:
+            /* Intermediate result is zero/non-zero: test != 0. */
+            tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, tmp);
+            break;
+        case SETCOND_NEZ | SETCOND_INV:
+            /* Intermediate result is zero/non-zero: test == 0. */
+            tcg_out_opc_imm(s, OPC_SLTIU, ret, tmp, 1);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 }
 
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
@@ -1543,7 +1621,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        tcg_out_setcond(s, args[3], a0, a1, a2);
+        tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -1662,6 +1740,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_and_i64:
     case INDEX_op_or_i64:
     case INDEX_op_xor_i64:
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
         return C_O1_I2(r, r, rI);
 
     case INDEX_op_andc_i32:
@@ -1683,7 +1763,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_divu_i32:
     case INDEX_op_rem_i32:
     case INDEX_op_remu_i32:
-    case INDEX_op_setcond_i32:
     case INDEX_op_mul_i64:
     case INDEX_op_mulsh_i64:
     case INDEX_op_muluh_i64:
@@ -1691,7 +1770,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_divu_i64:
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i64:
-    case INDEX_op_setcond_i64:
         return C_O1_I2(r, rZ, rZ);
 
     case INDEX_op_shl_i32:
-- 
2.34.1


