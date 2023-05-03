Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70396F53D2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:57:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IM-0000wM-9K; Wed, 03 May 2023 04:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IJ-0000ug-GC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IH-0006bt-BN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso1257425e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104220; x=1685696220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mRZoE25+tnk51V1W/8EHZSwTBCKVtFJFOYaXfMkXlQ=;
 b=Y4rC8Ro1bvHztSetWdpnX8G8xotEa8wc7ZvLXxE+4+QNT1dE1WuGeeXMiaHMD7Lq2r
 JODIKotqcft6R9ceX4YTJ5HhnDefZqrSS+AMqClUi/xlCcJoad442vOYpcqFeuA1pBxI
 rEmwvLwUtk5SH6CKwrHhiwhIV5OtWD9M9T7DPvX2uf75ZaQgDSJdPHCOu295La3ha29k
 koeqcgcCJQJaf2dgS8IGJCL5A9E2H7NDvxH7vuKd26GLSTQYITPukYbYBg1hIr6tb+P+
 ovHwwQwyasdPJ1jKoYO+F5ytd9rDz0E8YL9d34teag1y3bazWIYWIceLE8S5oF8Q6DR+
 OjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104220; x=1685696220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mRZoE25+tnk51V1W/8EHZSwTBCKVtFJFOYaXfMkXlQ=;
 b=NMKn+5f0oujmvvQz3bCeUeIIFSLuf8AtZlIZ8G1Mlq92Tef2SNDIUTjt3sBWMIBkUP
 H82tod5YR2HrsTsNZfXVJAplqZxLqTjINqQDLQyRtHfUCH/uvLXkZYmlVKu+6pe7cU0j
 2mnUjz9PvP2zehL1wDPjSJmfZETSWIxk9xMMbGOh/igBw6MfCNEChD4oPMljmAEkX3p5
 HGXfXeJgDylBVU4ELIh2KatDHcpWkhsZUAuhYz7KAZP1V2HQuLuYf6n1BkFPJDcUwnyb
 oN1e86tTGWFl/IaFZ+mK69D9k8pzOb1MXL8ICp9+Z+tTc+/njCQQ2cQ8GPiH351QMDB5
 hwGw==
X-Gm-Message-State: AC+VfDwy9XwYOQrtYL+TofVXb2+eS+ES2YDj+zWq2vUt9i7QqDEeogOv
 gZKssIqnXfIiUDUk9lrU3LXz9Bx+Lj9BBI0SOgatgQ==
X-Google-Smtp-Source: ACHHUZ6HEpGOQQmhk2/mnpkkN/EmPwK30bERJrQrNvDSw44K2Qh+nxwHJV2Zw4oBbIsEe/581VTIIg==
X-Received: by 2002:a1c:ed0e:0:b0:3f1:7372:66d1 with SMTP id
 l14-20020a1ced0e000000b003f1737266d1mr14168248wmh.0.1683104219857; 
 Wed, 03 May 2023 01:56:59 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:56:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 03/11] tcg/riscv: Support ANDN, ORN, XNOR from Zbb
Date: Wed,  3 May 2023 09:56:49 +0100
Message-Id: <20230503085657.1814850-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target-con-set.h |  1 +
 tcg/riscv/tcg-target-con-str.h |  1 +
 tcg/riscv/tcg-target.h         | 12 +++++-----
 tcg/riscv/tcg-target.c.inc     | 41 ++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index d88888d3ac..1a33ece98f 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -15,6 +15,7 @@ C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
index 6f1cfb976c..d5c419dff1 100644
--- a/tcg/riscv/tcg-target-con-str.h
+++ b/tcg/riscv/tcg-target-con-str.h
@@ -15,6 +15,7 @@ REGS('r', ALL_GENERAL_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S12)
+CONST('J', TCG_CT_CONST_J12)
 CONST('N', TCG_CT_CONST_N12)
 CONST('M', TCG_CT_CONST_M12)
 CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 863ac8ba2f..9f58d46208 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -120,9 +120,9 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_bswap32_i32      0
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_neg_i32          1
-#define TCG_TARGET_HAS_andc_i32         0
-#define TCG_TARGET_HAS_orc_i32          0
-#define TCG_TARGET_HAS_eqv_i32          0
+#define TCG_TARGET_HAS_andc_i32         have_zbb
+#define TCG_TARGET_HAS_orc_i32          have_zbb
+#define TCG_TARGET_HAS_eqv_i32          have_zbb
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
 #define TCG_TARGET_HAS_clz_i32          0
@@ -154,9 +154,9 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_bswap64_i64      0
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_neg_i64          1
-#define TCG_TARGET_HAS_andc_i64         0
-#define TCG_TARGET_HAS_orc_i64          0
-#define TCG_TARGET_HAS_eqv_i64          0
+#define TCG_TARGET_HAS_andc_i64         have_zbb
+#define TCG_TARGET_HAS_orc_i64          have_zbb
+#define TCG_TARGET_HAS_eqv_i64          have_zbb
 #define TCG_TARGET_HAS_nand_i64         0
 #define TCG_TARGET_HAS_nor_i64          0
 #define TCG_TARGET_HAS_clz_i64          0
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 49ff9c8b9d..c5b060023f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -138,6 +138,7 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
 #define TCG_CT_CONST_S12   0x200
 #define TCG_CT_CONST_N12   0x400
 #define TCG_CT_CONST_M12   0x800
+#define TCG_CT_CONST_J12  0x1000
 
 #define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
 
@@ -174,6 +175,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
         return 1;
     }
+    /*
+     * Inverse of sign extended from 12 bits: ~[-0x800, 0x7ff].
+     * Used to map ANDN back to ANDI, etc.
+     */
+    if ((ct & TCG_CT_CONST_J12) && ~val >= -0x800 && ~val <= 0x7ff) {
+        return 1;
+    }
     return 0;
 }
 
@@ -1306,6 +1314,31 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ANDI, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_ANDN, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_ORI, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_ORN, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+        if (c2) {
+            tcg_out_opc_imm(s, OPC_XORI, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_reg(s, OPC_XNOR, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_not_i32:
     case INDEX_op_not_i64:
         tcg_out_opc_imm(s, OPC_XORI, a0, a1, -1);
@@ -1536,6 +1569,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_i64:
         return C_O1_I2(r, r, rI);
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+    case INDEX_op_eqv_i32:
+    case INDEX_op_eqv_i64:
+        return C_O1_I2(r, r, rJ);
+
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
         return C_O1_I2(r, rZ, rN);
-- 
2.34.1


