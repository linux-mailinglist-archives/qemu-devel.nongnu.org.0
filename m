Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FFD6EC523
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp3k-0004o3-V0; Mon, 24 Apr 2023 01:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0J-00060S-Rl
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0A-0005IA-CN
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:44:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso97929f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=x7AxKqfdO4iYTa6OP2nvmJc8fqhEDPS3fcWahYVhsOAAvp0UdYZ6cYYBep8LhZtnq4
 0uDOdUqFjiGtVO/llLfvc2NAjWt7HLG1cOJvOEAnUFFDNEcBGJv95gXZjKtvQtgi+d9n
 dB2tR6iT1+2xIW1p9EJt3FGGPZtNf9RldGoaIEhdrbSBHXymk/YOg1sHg9iEd2SQClar
 DZQXafjW5hM2uyBhzTOAMcFBEGkSyojcaYtgAMOxxZS/9hLeEm/5mwwW93bYhISdUl0C
 RrGWa/osl76q/CMkHxhZh6p05UJdsGUZIUbpNkoJosGNLR49wXYGTjp45G7MzogrP4LR
 QO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bp+7jHuRwCoumX81kkmi2LLSK4XPzI38mrYIrW5iAjM=;
 b=OyzpeNhDtUX0g5H8+a7RIjUzqv6pZt9pSFg14eQBBE33MjHRB4Sjxpb5LCFgJr7Bh9
 uzthMAbXtgX5PDPkZ9BrJN76Wtc5bFaqy7otx3Xs2g3UYKfn7vyAzHr4Q6Z4VkcG0kWL
 NRK30PQYi+pMGAw26ibB/jDVAzxl2XZ6tgsfHb1HWspoxr8/OKwqIWyOorY5xN1yOPKm
 WtjZzyngwtKUrCh/UzGCzbjRRs/zOOX//JCWeUlrHE9IDCiU1jx4kjwmIhxtwS6jysdh
 hpdCB0CHjMMnGxwQcOnux2KDTJr4XsT6cDLcfAPrZ+/Cj1Y+6pr1DeKsxb9o20ffSKiq
 QRhg==
X-Gm-Message-State: AAQBX9e3YyzYnSUB5FBkkiuEramecMxdk7FzC155m5D7Xz4BZavonbm8
 yQpUl83I8b2umNTrtsgRHBQPwY8+y2ezzITmGFvRbA==
X-Google-Smtp-Source: AKy350ZnecfBEtcjGQB5bw8Re8YVFVwME5RHfJoHydaWWL2bJse6T21Kv+jvrtajtWO8seFq2+CwXw==
X-Received: by 2002:adf:f8ca:0:b0:302:df29:cf15 with SMTP id
 f10-20020adff8ca000000b00302df29cf15mr7035302wrq.46.1682315072805; 
 Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 45/57] tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:53 +0100
Message-Id: <20230424054105.1579315-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 88 ++++++++++++----------------------------
 1 file changed, 26 insertions(+), 62 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 7239335bdf..042136fee7 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2003,44 +2003,38 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_TMP1;
+    }
+    tcg_out32(s, MFSPR | RT(arg) | LR);
+    return arg;
+}
+
+/*
+ * For the purposes of ppc32 sorting 4 input registers into 4 argument
+ * registers, there is an outside chance we would require 3 temps.
+ * Because of constraints, no inputs are in r3, and env will not be
+ * placed into r3 until after the sorting is done, and is thus free.
+ */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen,
+    .ntmp = 3,
+    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
-        tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
-    } else {
-        tcg_out_movext(s, lb->type, lo,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
-    }
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tcg_out_b(s, 0, lb->raddr);
     return true;
@@ -2048,43 +2042,13 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg hi, lo, arg = TCG_REG_R3;
+    MemOp opc = get_memop(lb->oi);
 
     if (!reloc_pc14(lb->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, arg++, TCG_AREG0);
-
-    lo = lb->addrlo_reg;
-    hi = lb->addrhi_reg;
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        /* If the address needed to be zero-extended, we'll have already
-           placed it in R4.  The only remaining case is 64-bit guest.  */
-        tcg_out_mov(s, TCG_TYPE_TL, arg++, lo);
-    }
-
-    lo = lb->datalo_reg;
-    hi = lb->datahi_reg;
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
-        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
-    } else {
-        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                       arg++, lb->type, s_bits, lo);
-    }
-
-    tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
-    tcg_out32(s, MFSPR | RT(arg) | LR);
-
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, LK, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tcg_out_b(s, 0, lb->raddr);
-- 
2.34.1


