Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB055BF2D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:40:09 +0200 (CEST)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65pQ-0005Pp-LK
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fh-0003H7-Eh
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:06 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fe-0008M2-PU
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:04 -0400
Received: by mail-pg1-x536.google.com with SMTP id d129so11056785pgc.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVpqLWTsPExWd6f8jF1EY/VDSSozWoVLxOFKhLPqh5c=;
 b=UhoFZJZJ7sf6X6sDYSJ8kTUIHJnjrJP35kzXRhk1u5KJpN92OMg6fqNgAcj7Iz9h9B
 Af0kPXlAAmiOOghBCSYt6A7+LWnT1ihWPwkqXFEXJnwPURNLaJ8pX28Zul3Wq096sO85
 nIX5TPGgjO4Kwq8GlREq8jMjG4+Xpzt2wm70Tn2oMbjoXh8suf4pmfz4ZijmFCjda3DN
 83FoTide3wolQjJAeCTnLDVxZx9m8dg4U6KU2RKISdO46BdCHCHMFTMKK4d6tHb9gpC3
 aK804d607hTjEbVZxhe2192SbMoHWVfLjRxVA/HWDatfYqkYshqRTDx1ZFnysslOZd1u
 xhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVpqLWTsPExWd6f8jF1EY/VDSSozWoVLxOFKhLPqh5c=;
 b=ZB2cQ3gGeMP1DSOiXrGoWxNOMRFwJOtyYLRZiFy4l+7g3iLnijudV1X2vIkJ0bTNRI
 6Qi7XDdJ1WWDgcIZoGfi06DNJOfuQ/Ggy9LhYKNvnUaFkwjHdk4tXIyBjRzWIppDW0j8
 E5Mnd7U8f/22WIvZbCQFhvLbUee/ki7dTCNsiqYe/Lq2F44UCB/XtUhcUeqdw3xnUBJX
 3uI83afAaYQy9jlFazlZJNjvuQXEP4Oqc9zNpp/35L9y+ltAhFKe2Iy325ARQ/OatRDf
 iY4cvR955FDt/PfnCprLwtecPTmoHEC7u0q0WF08rUuY2ZgLXleiWNwDF+ixwmBMig+R
 /kcg==
X-Gm-Message-State: AJIora+0sCyiZavLBsISkFDB5Ey8Tc6BO5Ifu75dB5wtrIsYSVOVSbgr
 wH65FrdLhcd6wIYxEq9YkMlfVFT50tv2DQ==
X-Google-Smtp-Source: AGRyM1s05L2vvdkgKSVWkD1wmFQ1H0WFi1Xqvv3MjClGDgIoWE+20TpyMKH/ye16cFX2LJcuDRs+Jw==
X-Received: by 2002:a63:81c1:0:b0:411:6433:b4ba with SMTP id
 t184-20020a6381c1000000b004116433b4bamr19251pgd.585.1656392101383; 
 Mon, 27 Jun 2022 21:55:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/60] semihosting: Split common_semi_flen_buf per target
Date: Tue, 28 Jun 2022 10:23:25 +0530
Message-Id: <20220628045403.508716-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out common_semi_stack_bottom per target.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d2ce214078..7550dce622 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -217,6 +217,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return is_a64(env);
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    return is_a64(env) ? env->xregs[31] : env->regs[13];
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -246,6 +253,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
+
+static inline target_ulong common_semi_stack_bottom(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xSP];
+}
 #endif
 
 /*
@@ -301,31 +315,15 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Return an address in target memory of 64 bytes where the remote
+ * gdb should write its stat struct. (The format of this structure
+ * is defined by GDB's remote protocol and is not target-specific.)
+ * We put this on the guest's stack just below SP.
+ */
 static target_ulong common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp;
-#ifdef TARGET_ARM
-    /* Return an address in target memory of 64 bytes where the remote
-     * gdb should write its stat struct. (The format of this structure
-     * is defined by GDB's remote protocol and is not target-specific.)
-     * We put this on the guest's stack just below SP.
-     */
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-#endif
-#ifdef TARGET_RISCV
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-
-    sp = env->gpr[xSP];
-#endif
-
+    target_ulong sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
-- 
2.34.1


