Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB847C4CA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:15:49 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzijr-0004q6-TD
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ9-0000w0-Dl
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:11 -0500
Received: from [2607:f8b0:4864:20::633] (port=35722
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ1-0007er-FA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id n16so10442473plc.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i235Rzd3sllWY1/hcVlI1mYBAs2gRi1oFaIpyAT4e3A=;
 b=DHT9stQTWVcepwiD7n0cRNATqxqffM/HlawXcGeyalhka0zj2FVoHPklp/R8lQy0W7
 oGKjLAUy+Z5cfnenrzjIzsAkNz9H/WfFpiqYGHFzAIYk2mUIB+Bgh9fzE7kI7+lMGQy7
 YORHYUCBpOBW7K0F55UtaFEQmu4Y/q5n03b5mmw7v/58JrsRLa/aS1pcnx22aodt4gMx
 f/IzNFIyOuIMRCqS65MYLUoM9vfIvFktbnXpg1U5GunPzQKOPC5QO4RqvMtuGOZjOhzy
 tHWtjY9sC8kWd3K6EpmbHRklsQJS5aqywQ2vcdGU1xUh7tcIBjvEuWsfJw/uHy1xdD4u
 gf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i235Rzd3sllWY1/hcVlI1mYBAs2gRi1oFaIpyAT4e3A=;
 b=etZkZibAZTUf7ozUalXQt8sz0ho37FzYqLbLWjjr3Y14vlP1EZIcNGdGM/g87uwhCy
 0Ywf/FDhju7Q3VoPec8NjdfTLh5d9eVgGpixCNWPhcdTzD7oZa7bXPRb8Q/cKT7mda+L
 L495tzCoRollWvaO0OxWx4StcxQmOPagE19EoBl1vcsNDTyjnV6O+Zi1DgoglcWFgYeJ
 Yh5qyIM6icP0e1opGQVSHN6znOkie4WxLgI6mbs4g3x/NEIVgiJ91G+f9pfC5GxeYBKH
 AaW7jRcErVCuNxUf0fNZHsnNGUml1eaEfQUrbcKJ+4aTgzUimPz6LLdE5Qu2mPE9uteZ
 R64g==
X-Gm-Message-State: AOAM531eHIYc2rX9AvUjsSMpcTuWAGi282+0bGH2c82ZjYxiF2be+tyl
 Ep/oSGJ3ZfYifg2GBqn08YjePA7DT/9ZHg==
X-Google-Smtp-Source: ABdhPJx+DDokz4HfWGpOKeyTkeuEbuPDty3p7CDauOGeSG3SKIxhEm4w4qSoygAlcenueiSJQDT/ig==
X-Received: by 2002:a17:90a:5d0e:: with SMTP id
 s14mr4858920pji.136.1640105281104; 
 Tue, 21 Dec 2021 08:48:01 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/31] tcg/loongarch64: Implement tcg_target_qemu_prologue
Date: Tue, 21 Dec 2021 08:47:30 -0800
Message-Id: <20211221164737.1076007-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-25-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index f67d5fa110..0b7d6458c5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -968,6 +968,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
  * Entry-points
  */
 
+static const tcg_insn_unit *tb_ret_addr;
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1517,3 +1519,69 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         g_assert_not_reached();
     }
 }
+
+static const int tcg_target_callee_save_regs[] = {
+    TCG_REG_S0,     /* used for the global env (TCG_AREG0) */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+    TCG_REG_RA,     /* should be last for ABI compliance */
+};
+
+/* Stack frame parameters.  */
+#define REG_SIZE   (TCG_TARGET_REG_BITS / 8)
+#define SAVE_SIZE  ((int)ARRAY_SIZE(tcg_target_callee_save_regs) * REG_SIZE)
+#define TEMP_SIZE  (CPU_TEMP_BUF_NLONGS * (int)sizeof(long))
+#define FRAME_SIZE ((TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE + SAVE_SIZE \
+                     + TCG_TARGET_STACK_ALIGN - 1) \
+                    & -TCG_TARGET_STACK_ALIGN)
+#define SAVE_OFS   (TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE)
+
+/* We're expecting to be able to use an immediate for frame allocation.  */
+QEMU_BUILD_BUG_ON(FRAME_SIZE > 0x7ff);
+
+/* Generate global QEMU prologue and epilogue code */
+static void tcg_target_qemu_prologue(TCGContext *s)
+{
+    int i;
+
+    tcg_set_frame(s, TCG_REG_SP, TCG_STATIC_CALL_ARGS_SIZE, TEMP_SIZE);
+
+    /* TB prologue */
+    tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, -FRAME_SIZE);
+    for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_st(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+#if !defined(CONFIG_SOFTMMU)
+    if (USE_GUEST_BASE) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+        tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
+    }
+#endif
+
+    /* Call generated code */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
+
+    /* Return path for goto_ptr. Set return value to 0 */
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
+
+    /* TB epilogue */
+    tb_ret_addr = tcg_splitwx_to_rx(s->code_ptr);
+    for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+    tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, FRAME_SIZE);
+    tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_RA, 0);
+}
-- 
2.25.1


