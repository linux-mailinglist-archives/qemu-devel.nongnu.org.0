Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A72D99C9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:24:18 +0100 (CET)
Received: from localhost ([::1]:45710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koolt-0001FK-Ot
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSu-0002R2-Ks
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:40 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSm-000435-Pb
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:40 -0500
Received: by mail-ot1-x344.google.com with SMTP id j20so11294054otq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sfLvztrUGFMGQ8L1kj5P/IO1L5kK/jJ3mfS34ntrWYs=;
 b=WE1gXhnPDhPcBB8fXdCFdzQrDVflrN1VY718B8CdqyNSOQwD0dIp0vFPccFrmondEd
 Pg8Hw1H+zja4jEPoxMrUiBI7UGIhiFL9FAh1c90D8Cre2+8qUSpYg9D/7YFdSXFhPFNs
 9FDpFG36kWyDRR32zHG6lxmMtQqN6/3I4O/pFSr3UAaRpEmTC2FuyylTTbtC2z7yLCQA
 OHMlEwnXVwNLEdf4ndhDfD9CzaYfh5iiLwzdUdeGyAJpocaI1mh88xtj+HTTvg+z3t4T
 ZO6MqHrVIu5IXGJXv+t2sPUqH160Bjs5LTvPWdsuNxQqRhg5OaBtyGCTwuk8OI+31JNA
 KUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sfLvztrUGFMGQ8L1kj5P/IO1L5kK/jJ3mfS34ntrWYs=;
 b=rwXsArdXghCzLVCj9fPLZAbBqKCEAeTy85oF28ZcfP8hsWI8CWx+lkqR4dqijfHBCp
 apuFKOPywqG+wGAbuLWT6a5TKCb77E99hziAXMTTTga04wFHtvrkDXPS6gwCbhDA+s3J
 vVafA+mWPCiy8Deb9OCRJjDU3G9lVEF6bhOqGv62KkyCvGq3FJjEIdbrzRFEF+cOP+32
 imHI37pflTgA6S4urjWiwM9Jw5qgoG9orN8MjexaaWbT01Ca4srqPELrxDSqpMkp+1ln
 EsSOxiV7WqWYjDSRrPTLqMU3UxaUXsOexxdQhbgPaC/pU7rarJexLlPkYKfv8uX1l320
 dtLA==
X-Gm-Message-State: AOAM533rHfLipRVxN4Q7UbgGtg4VriMXNvMSnJUYcXx4JxO89VBBGt4+
 2x5NGvOuWh2IXBb2Mm0ju4X4u67CN0wutlgE
X-Google-Smtp-Source: ABdhPJzIgdVBgwea11+9niaYTPbXS28IbvBXAqZkH+AC3N7URd+tKRMq0XGO/rRFF/OOaIUl2PCecg==
X-Received: by 2002:a9d:5549:: with SMTP id h9mr18936328oti.230.1607954669275; 
 Mon, 14 Dec 2020 06:04:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 42/43] tcg: Constify tcg_code_gen_epilogue
Date: Mon, 14 Dec 2020 08:03:13 -0600
Message-Id: <20201214140314.18544-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all native tcg hosts support splitwx,
make this pointer const.

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
index 90ec7c1445..477919aeb6 100644
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
index 5f585c2ed2..d961ebcecb 100644
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
index 23c7a8a383..be57d2330a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3826,8 +3826,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
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
index 5c1e0f8fc1..7b4ee4a084 100644
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


