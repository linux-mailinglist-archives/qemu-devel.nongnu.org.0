Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B21D6F53DD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:58:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IQ-0000z0-8C; Wed, 03 May 2023 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IN-0000y8-DB
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:07 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IL-0006d9-El
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f315712406so14808145e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104224; x=1685696224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmoYi5mzvqJYAtMQbdHDy5/NmOb6rMQv5LtvmjoqGcI=;
 b=Ini0iXlo/Ydm/RQ+ID3eAGqiM3z0iSxTZ3r/tiPjWCqbHqYpyWnKzGMArzFhBoZ0T/
 rWuIMpxChr9Wj+AcvlxK1YeMwS4Jg2b8vscnoM+LxrcdgC1fcdlDzwo7B1wdGCpf094U
 BPhXKSb4Lini/M11R6DL5fM3K4UfMRBJ88P93oLLWpYKg894zMlJ1M8AFVC73143byL5
 zMdwQXg/XehLpEMSa00hxYz+TDbyseEvXrx5UCHMiYy6gLll1ysortkryKhzIpHE8s0m
 02ZIlUntmm2s7B/CyAAWSFheeurYzBx87RIo6JkThgvC4SwmqsBIoJ4gUMDQcgZcTFbz
 aSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104224; x=1685696224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmoYi5mzvqJYAtMQbdHDy5/NmOb6rMQv5LtvmjoqGcI=;
 b=DNkgtBSjinRas4Wgj7eOxKc7XXOJcqLJStsq691Oga+Ybi4Bm8hc5/6nPhGUaxeWc5
 7gxsVKFTXTAXU0iLX+72+/k0auwOj9TeGOTuo7BRG+9KDrp7f+rqCS2v+GwQeLADOlEW
 CkTcn/9BbcTTY7oADBiiAffvzz9Z3mgSOyHn5AjHmM26iSf3W5JE30E7zdtv59px0mbP
 7o8MWeWegpRwC1qb+rFYBBwPj+houn0vQ30ASLZNTbGy3IhITv5VBwwwjhxeZSfcIY+E
 lo2LRG8MJT94dPFy0827fKIXQb37lcucQzJkijsBh9MoToESNucHscfDGldSuOa/UaXN
 lIWw==
X-Gm-Message-State: AC+VfDxuiuv/4Zi6AumME64qyQuxbOY9dYJNU08NPFlpLBEIzzqa1XdG
 CMcdtyn26ILXxiI/sRAr79ECj/y3j2igVb/WYNcW7g==
X-Google-Smtp-Source: ACHHUZ4gVo5NGp6YlxidCocL4QoiaqgQTFPyuNMKMz1IPi2wPyGkpLZG8L5YSnaXf9n3Zu6u5ocynA==
X-Received: by 2002:a1c:7915:0:b0:3f1:6880:3308 with SMTP id
 l21-20020a1c7915000000b003f168803308mr1062485wme.1.1683104223797; 
 Wed, 03 May 2023 01:57:03 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 10/11] tcg/riscv: Implement movcond
Date: Wed,  3 May 2023 09:56:56 +0100
Message-Id: <20230503085657.1814850-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

Implement with and without Zicond.  Without Zicond, we were letting
the middle-end expand to a 5 insn sequence; better to use a branch
over a single insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |   1 +
 tcg/riscv/tcg-target.h         |   4 +-
 tcg/riscv/tcg-target.c.inc     | 139 ++++++++++++++++++++++++++++++++-
 3 files changed, 141 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index 1a33ece98f..a5cadd303f 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -18,4 +18,5 @@ C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
+C_O1_I4(r, r, rI, rM, rM)
 C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index e0b23006c4..e9e84be9a5 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -97,7 +97,7 @@ extern bool have_zbb;
 #endif
 
 /* optional instructions */
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
 #define TCG_TARGET_HAS_div2_i32         0
@@ -132,7 +132,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_setcond2         1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
 #define TCG_TARGET_HAS_div2_i64         0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 84b646105c..1c57b64182 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -169,7 +169,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
     /*
      * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
-     * Used by addsub2, which may need the negative operation,
+     * Used by addsub2 and movcond, which may need the negative value,
      * and requires the modified constant to be representable.
      */
     if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
@@ -936,6 +936,133 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
+static void tcg_out_movcond_zicond(TCGContext *s, TCGReg ret, TCGReg test_ne,
+                                   int val1, bool c_val1,
+                                   int val2, bool c_val2)
+{
+    if (val1 == 0) {
+        if (c_val2) {
+            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val2);
+            val2 = TCG_REG_TMP1;
+        }
+        tcg_out_opc_reg(s, OPC_CZERO_NEZ, ret, val2, test_ne);
+        return;
+    }
+
+    if (val2 == 0) {
+        if (c_val1) {
+            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val1);
+            val1 = TCG_REG_TMP1;
+        }
+        tcg_out_opc_reg(s, OPC_CZERO_EQZ, ret, val1, test_ne);
+        return;
+    }
+
+    if (c_val2) {
+        if (c_val1) {
+            tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, val1 - val2);
+        } else {
+            tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_TMP1, val1, -val2);
+        }
+        tcg_out_opc_reg(s, OPC_CZERO_EQZ, ret, TCG_REG_TMP1, test_ne);
+        tcg_out_opc_imm(s, OPC_ADDI, ret, ret, val2);
+        return;
+    }
+
+    if (c_val1) {
+        tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_TMP1, val2, -val1);
+        tcg_out_opc_reg(s, OPC_CZERO_NEZ, ret, TCG_REG_TMP1, test_ne);
+        tcg_out_opc_imm(s, OPC_ADDI, ret, ret, val1);
+        return;
+    }
+
+    tcg_out_opc_reg(s, OPC_CZERO_NEZ, TCG_REG_TMP1, val2, test_ne);
+    tcg_out_opc_reg(s, OPC_CZERO_EQZ, TCG_REG_TMP0, val1, test_ne);
+    tcg_out_opc_reg(s, OPC_OR, ret, TCG_REG_TMP0, TCG_REG_TMP1);
+}
+
+static void tcg_out_movcond_br1(TCGContext *s, TCGCond cond, TCGReg ret,
+                                TCGReg cmp1, TCGReg cmp2,
+                                int val, bool c_val)
+{
+    RISCVInsn op;
+    int disp = 8;
+
+    tcg_debug_assert((unsigned)cond < ARRAY_SIZE(tcg_brcond_to_riscv));
+    op = tcg_brcond_to_riscv[cond].op;
+    tcg_debug_assert(op != 0);
+
+    if (tcg_brcond_to_riscv[cond].swap) {
+        tcg_out_opc_branch(s, op, cmp2, cmp1, disp);
+    } else {
+        tcg_out_opc_branch(s, op, cmp1, cmp2, disp);
+    }
+    if (c_val) {
+        tcg_out_opc_imm(s, OPC_ADDI, ret, TCG_REG_ZERO, val);
+    } else {
+        tcg_out_opc_imm(s, OPC_ADDI, ret, val, 0);
+    }
+}
+
+static void tcg_out_movcond_br2(TCGContext *s, TCGCond cond, TCGReg ret,
+                                TCGReg cmp1, TCGReg cmp2,
+                                int val1, bool c_val1,
+                                int val2, bool c_val2)
+{
+    TCGReg tmp;
+
+    /* TCG optimizer reorders to prefer ret matching val2. */
+    if (!c_val2 && ret == val2) {
+        cond = tcg_invert_cond(cond);
+        tcg_out_movcond_br1(s, cond, ret, cmp1, cmp2, val1, c_val1);
+        return;
+    }
+
+    if (!c_val1 && ret == val1) {
+        tcg_out_movcond_br1(s, cond, ret, cmp1, cmp2, val2, c_val2);
+        return;
+    }
+
+    tmp = (ret == cmp1 || ret == cmp2 ? TCG_REG_TMP1 : ret);
+    if (c_val1) {
+        tcg_out_movi(s, TCG_TYPE_REG, tmp, val1);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, tmp, val1);
+    }
+    tcg_out_movcond_br1(s, cond, tmp, cmp1, cmp2, val2, c_val2);
+    tcg_out_mov(s, TCG_TYPE_REG, ret, tmp);
+}
+
+static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg cmp1, int cmp2, bool c_cmp2,
+                            TCGReg val1, bool c_val1,
+                            TCGReg val2, bool c_val2)
+{
+    int tmpflags;
+    TCGReg t;
+
+    if (!have_zicond && (!c_cmp2 || cmp2 == 0)) {
+        tcg_out_movcond_br2(s, cond, ret, cmp1, cmp2,
+                            val1, c_val1, val2, c_val2);
+        return;
+    }
+
+    tmpflags = tcg_out_setcond_int(s, cond, TCG_REG_TMP0, cmp1, cmp2, c_cmp2);
+    t = tmpflags & ~SETCOND_FLAGS;
+
+    if (have_zicond) {
+        if (tmpflags & SETCOND_INV) {
+            tcg_out_movcond_zicond(s, ret, t, val2, c_val2, val1, c_val1);
+        } else {
+            tcg_out_movcond_zicond(s, ret, t, val1, c_val1, val2, c_val2);
+        }
+    } else {
+        cond = tmpflags & SETCOND_INV ? TCG_COND_EQ : TCG_COND_NE;
+        tcg_out_movcond_br2(s, cond, ret, t, TCG_REG_ZERO,
+                            val1, c_val1, val2, c_val2);
+    }
+}
+
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
@@ -1624,6 +1751,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
+        tcg_out_movcond(s, args[5], a0, a1, a2, c2,
+                        args[3], const_args[3], args[4], const_args[4]);
+        break;
+
     case INDEX_op_qemu_ld_i32:
         tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
@@ -1788,6 +1921,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
+        return C_O1_I4(r, r, rI, rM, rM);
+
     case INDEX_op_add2_i32:
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
-- 
2.34.1


