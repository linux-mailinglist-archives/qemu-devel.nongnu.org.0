Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AD6F53DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:58:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IP-0000yf-NZ; Wed, 03 May 2023 04:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IN-0000yK-I6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IL-0006dJ-SD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso32511895e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104224; x=1685696224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+U+88bxpW/MsY8CZaijHYadsAWl6K1XoFCgkecvaIys=;
 b=kesg1dw38cDWy750IJYCte4rTzJZ1Vt3e90iUc+blaUOHa3CJkNUU6t/7/oQFhSywQ
 v6hEoKuL804eSJ7R3Rd/ozD4tMtYAoaTQLPzcTH31HAaXx7XyKW8AlWvhRfMisDh8V21
 hQJr6AfFoYilz0K2LuVm6+ygrABvQ4k0nnTFj7vZu2lSW1JrDKLHE3u6nC9/WPxZS7Ta
 lIxbDpC9IGncft2mvaZB144Ygu60U+mHv9lG0lIsueGJwcN1mHBTleYWxKgsxXT0Da2a
 sBbC/lyxBp7FJRDO8vkEiTLsxsgsOq9x56qwwffPcxJ7iHOxrrqPrKKrSk1gQNPQf5mr
 3YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104224; x=1685696224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+U+88bxpW/MsY8CZaijHYadsAWl6K1XoFCgkecvaIys=;
 b=ct5Pi1VnJtfV1E4i9T9hRCbmvCbGbCX0NmTZ2WpyKzUm3tvd1bBK+oJjSY/ZX2I9Xh
 pVsA6dfWqVkDkbgjQBQgV9npo3BtpaE3Cok9Ok1Jq/sXZI5FXDcEdQy/JVPviRG7ds4F
 OiQ+6EJ3Zw3FIzy8d7wummLaisWqmkpBbDXH3ibVcfrphtG2asLXPhjh9oj5rVldMNac
 i2eBOBTkDbI/d8fJgxcWf8MpJMousAfo37ZJopNXVTH5NeaGxgx+9fn1CPgXZ18nTJ/Z
 4NfErm5UnkCCDreQzK70xAjO690uw9JRXzgHwZUxkAvyw5Bgh59SYBqUXLe9AOcU32sR
 eLkw==
X-Gm-Message-State: AC+VfDxjsdBclvUgD2zpIZTXkjNyUNhW54bJ0JGnLJ1CmN0/xYnHOWmD
 qssY3TPuhqNZ1f61IettdsHvJBR+fqYN2XcEx6vISA==
X-Google-Smtp-Source: ACHHUZ7otvNl0ljkNJEPhgFJtUR+AgH6hU9YeL81+1VX9En/XlFohRCQ7ZZ5PQ412YMoMMSo8cBPdQ==
X-Received: by 2002:a1c:f607:0:b0:3f1:72ec:4024 with SMTP id
 w7-20020a1cf607000000b003f172ec4024mr14057047wmc.21.1683104224317; 
 Wed, 03 May 2023 01:57:04 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 11/11] tcg/riscv: Support CTZ, CLZ from Zbb
Date: Wed,  3 May 2023 09:56:57 +0100
Message-Id: <20230503085657.1814850-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
 tcg/riscv/tcg-target.h         |  8 ++++----
 tcg/riscv/tcg-target.c.inc     | 35 ++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/tcg/riscv/tcg-target-con-set.h b/tcg/riscv/tcg-target-con-set.h
index a5cadd303f..aac5ceee2b 100644
--- a/tcg/riscv/tcg-target-con-set.h
+++ b/tcg/riscv/tcg-target-con-set.h
@@ -18,5 +18,6 @@ C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
+C_N1_I2(r, r, rM)
 C_O1_I4(r, r, rI, rM, rM)
 C_O2_I4(r, r, rZ, rZ, rM, rM)
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index e9e84be9a5..cff5de5c9e 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -125,8 +125,8 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_eqv_i32          have_zbb
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_clz_i32          1
+#define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        have_zbb
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
@@ -159,8 +159,8 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_eqv_i64          have_zbb
 #define TCG_TARGET_HAS_nand_i64         0
 #define TCG_TARGET_HAS_nor_i64          0
-#define TCG_TARGET_HAS_clz_i64          0
-#define TCG_TARGET_HAS_ctz_i64          0
+#define TCG_TARGET_HAS_clz_i64          1
+#define TCG_TARGET_HAS_ctz_i64          1
 #define TCG_TARGET_HAS_ctpop_i64        have_zbb
 #define TCG_TARGET_HAS_add2_i64         1
 #define TCG_TARGET_HAS_sub2_i64         1
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1c57b64182..a1c92b0603 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1063,6 +1063,22 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
+static void tcg_out_cltz(TCGContext *s, TCGType type, RISCVInsn insn,
+                         TCGReg ret, TCGReg src1, int src2, bool c_src2)
+{
+    tcg_out_opc_imm(s, insn, ret, src1, 0);
+
+    if (!c_src2 || src2 != (type == TCG_TYPE_I32 ? 32 : 64)) {
+        /*
+         * The requested zero result does not match the insn, so adjust.
+         * Note that constraints put 'ret' in a new register, so the
+         * computation above did not clobber either 'src1' or 'src2'.
+         */
+        tcg_out_movcond(s, TCG_COND_EQ, ret, src1, 0, true,
+                        src2, c_src2, ret, false);
+    }
+}
+
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
@@ -1724,6 +1740,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_imm(s, OPC_CPOP, a0, a1, 0);
         break;
 
+    case INDEX_op_clz_i32:
+        tcg_out_cltz(s, TCG_TYPE_I32, OPC_CLZW, a0, a1, a2, c2);
+        break;
+    case INDEX_op_clz_i64:
+        tcg_out_cltz(s, TCG_TYPE_I64, OPC_CLZ, a0, a1, a2, c2);
+        break;
+    case INDEX_op_ctz_i32:
+        tcg_out_cltz(s, TCG_TYPE_I32, OPC_CTZW, a0, a1, a2, c2);
+        break;
+    case INDEX_op_ctz_i64:
+        tcg_out_cltz(s, TCG_TYPE_I64, OPC_CTZ, a0, a1, a2, c2);
+        break;
+
     case INDEX_op_add2_i32:
         tcg_out_addsub2(s, a0, a1, a2, args[3], args[4], args[5],
                         const_args[4], const_args[5], false, true);
@@ -1917,6 +1946,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
+        return C_N1_I2(r, r, rM);
+
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
-- 
2.34.1


