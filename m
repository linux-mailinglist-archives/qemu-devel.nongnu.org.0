Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718E32EB1BA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:48:01 +0100 (CET)
Received: from localhost ([::1]:53960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqR6-00049x-FX
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq1A-0003JQ-Ob
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:14 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq14-0006mr-11
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:21:08 -0500
Received: by mail-pj1-x1029.google.com with SMTP id lj6so27017pjb.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4gbZ1hEp2iGpxBH0NVqdoNfsrRxmgU8uhJbc8FVSLCA=;
 b=hZ+cWB4JJNCC6SzCMhiypjU7ItO1yQtCJctncUOfgmpx+koUrah3tCyEf57MobX17k
 82CGHGnkMR5TSDfLWd1aUDYfETn9J0m/EOsOStgFML+VWP+4HedVQfa+Zg8rJWlmJ1RT
 333YlZT3e3zaYluZNKjXz5bMgQHugoy7vAtpJlNf03lxyMV+Hvpu2AHETxCAmU8JgJnH
 XFHxJojOnKs7S+4QUakS9dg/wEEAHCBRnay2cki8IuJk9cIZPUPh/ooirELlBUFoapow
 Lx2gjTIu/4lhbn5FNOsYr7NAZanH1mZrfca6JxeeFrCmRkOxNxliCtjHr+E41GXUlJQf
 yVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4gbZ1hEp2iGpxBH0NVqdoNfsrRxmgU8uhJbc8FVSLCA=;
 b=MnKqn2mJZbMHz5RKbbFFCaOw/dfeT6yMhyTGfVSzwHEJWB7lRV3CnDu+wFa5Yw/6uB
 O+EM253ctAFkv1mRcX/tTveBvQrO305M2gQFe3k8iZBfjwLUCqD3c92kBxOL9Vtb83zW
 WuPsDpMbNTXYTHJIpXbc99ri9h/Zj13QrJM7vsySxNF1DWeCu/pFyVZkZ41dBwbXMCWQ
 RrhAVw1wJIXPbc9GYw107idjROol9r3aLFCxFmIy8blSv3fFYCb1RsEFHvQLhQdP6Wa0
 iNPB1Ia1/jW9kGTb950o2Hgf06GCbERsCcCyvTDu303UJM8BjHjj2Mk9D74ELTzqpe56
 WgTw==
X-Gm-Message-State: AOAM532bmSF8Est6aBp++uMwzrmV3womOyrWkHDazHof19EB6YgHfZce
 2R99GCgpDx9aKglCaM9hasA24o9L1biYfQ==
X-Google-Smtp-Source: ABdhPJy64uuqiWO25G4IwdhLMY+hLnb3zlqGTU0RbbuJTvEqUAOtUOur+0spt7h4CCAVHMX0DX4fdw==
X-Received: by 2002:a17:902:6a83:b029:dc:2a2c:6b91 with SMTP id
 n3-20020a1709026a83b02900dc2a2c6b91mr299973plk.8.1609867264152; 
 Tue, 05 Jan 2021 09:21:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:21:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 42/43] tcg: Constify tcg_code_gen_epilogue
Date: Tue,  5 Jan 2021 07:19:49 -1000
Message-Id: <20210105171950.415486-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx,
make this pointer const.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 2 +-
 tcg/tcg.c                    | 2 +-
 tcg/aarch64/tcg-target.c.inc | 3 +--
 tcg/arm/tcg-target.c.inc     | 3 +--
 tcg/i386/tcg-target.c.inc    | 3 +--
 tcg/mips/tcg-target.c.inc    | 3 +--
 tcg/ppc/tcg-target.c.inc     | 3 +--
 tcg/riscv/tcg-target.c.inc   | 3 +--
 tcg/s390/tcg-target.c.inc    | 3 +--
 tcg/sparc/tcg-target.c.inc   | 3 +--
 10 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e6fce9a049..95fe5604eb 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -677,7 +677,7 @@ struct TCGContext {
 
 extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
-extern void *tcg_code_gen_epilogue;
+extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
 extern TCGv_env cpu_env;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f278772512..472bf1755b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -161,7 +161,7 @@ static int tcg_out_ldst_finalize(TCGContext *s);
 static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
-void *tcg_code_gen_epilogue;
+const void *tcg_code_gen_epilogue;
 uintptr_t tcg_splitwx_diff;
 
 #ifndef CONFIG_TCG_INTERPRETER
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 2e33162c03..0b7eb09a27 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2900,8 +2900,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_X0, 0);
 
     /* TB epilogue */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 3d2717aeb0..d6cb19ca9f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2301,8 +2301,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 0);
     tcg_out_epilogue(s);
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 34bf0b9a35..91400d575c 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3804,8 +3804,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);
 
     /* TB epilogue */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a2201bd1dd..18fd474593 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2473,8 +2473,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_V0, TCG_REG_ZERO);
 
     /* TB epilogue */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 33b5915005..5f191c03d9 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2346,8 +2346,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out32(s, BCCTR | BO_ALWAYS);
 
     /* Epilogue */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
 
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_REG_R1, FRAME_SIZE+LR_OFFSET);
     for (i = 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); ++i) {
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 4d595b01d6..c76dc9f9ca 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1784,8 +1784,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, tcg_target_call_iarg_regs[1], 0);
 
     /* Return path for goto_ptr. Set return value to 0 */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
 
     /* TB epilogue */
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 582a8ef941..b3660ffedf 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2551,8 +2551,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
      * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
      * and fall through to the rest of the epilogue.
      */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2, 0);
 
     /* TB epilogue */
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 182124b96c..922ae96481 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1039,8 +1039,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_nop(s);
 
     /* Epilogue for goto_ptr.  */
-    /* TODO: Cast goes away when all hosts converted */
-    tcg_code_gen_epilogue = (void *)tcg_splitwx_to_rx(s->code_ptr);
+    tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
     tcg_out_movi_imm13(s, TCG_REG_O0, 0);
-- 
2.25.1


