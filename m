Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D453560F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:22:44 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLsR-0005ME-6R
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLDE-0003Ra-Rl; Thu, 26 May 2022 17:40:08 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLD8-0008I4-6F; Thu, 26 May 2022 17:40:08 -0400
Received: by mail-oi1-x22a.google.com with SMTP id w130so3716548oig.0;
 Thu, 26 May 2022 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VREffBwM1pKqJe4fMxGpsCOjBGIrxQlKCXOouLUY+ZA=;
 b=UchoygryAxOAHQvfSAbi3bqhHb+r8+gfFMBBNkF2DwjahRwJjJtYRy/Y2OBGHVvxrI
 wuJMTTpxAe3FQ/u1oUBCvc8m+HZ/U/BNOkkVrMetMg7W/sbEw01vkpoaOg7sGbquQN+e
 Pa2njgJmfVwErgENRGKsg3KkBFHahmW3ag/AiGesMEHD+iHyVLDkbyY6eDswkp582txT
 yG3Lo04zMAbeqxTQvE3FATugwHFajsTEHjqmrYZlXVMi2HoVpUbjiPyA/DkqqH+sDugv
 mPKiIggl6mewqbOW/6uI/utMQ9MfrOiHmcrM1Do7Ra7dzXw9O+d3PLvq81wvHEtXyF3y
 Yatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VREffBwM1pKqJe4fMxGpsCOjBGIrxQlKCXOouLUY+ZA=;
 b=W5cypO2m+vCGAjApTrhjspcpNYje5Bw79oT4NI60t1xTq5f147zNfZkVgtQ84mZnL4
 rYWLF+0lMABpI15AlKBqiFab3jHeY1wOO85webQNYh0Ab8K++2tJdKmzMwWfNwvdK+ML
 +k3UNWJFRZCNBiXN/cReOmk5LoOULNmZfU/W8fl0dcChmGJYtteEIk1wIifuZM6uUTJY
 YkewzI1t2SnG/luFFQ7HcOLZs9doMg2KwJZ2ml0A2OsFMQu1ywK0Ax6aAyqH141CO/Yi
 6Q4YEJfpTloWTWbmBG+hfLIdx0g2R4AepdHuhHgmKiFKtMRMKgwpRh8DEnyD4KvNh6tg
 +8qg==
X-Gm-Message-State: AOAM530+M7H+k3EW6VZSKX9nX25dk5Z4A3SaDt1Ba5aJXfoekWcwUOYO
 qso4kgDs25iFsFFUAcEFOBAhdW0zoYs=
X-Google-Smtp-Source: ABdhPJwbnaqeDRr/SKNq+oujEz4EV9andRwl4iuFbSrX/A3uqbOb/9K5ojkwQiQi2q4aCNFIFSnC9g==
X-Received: by 2002:aca:62c5:0:b0:326:b067:ac89 with SMTP id
 w188-20020aca62c5000000b00326b067ac89mr2263059oib.281.1653601200663; 
 Thu, 26 May 2022 14:40:00 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:40:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 33/34] target/ppc: Implemented [pm]xvbf16ger2*
Date: Thu, 26 May 2022 18:38:14 -0300
Message-Id: <20220526213815.92701-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xvbf16ger2:   VSX Vector bfloat16 GER (rank-2 update)
xvbf16ger2nn: VSX Vector bfloat16 GER (rank-2 update) Negative multiply,
Negative accumulate
xvbf16ger2np: VSX Vector bfloat16 GER (rank-2 update) Negative multiply,
Positive accumulate
xvbf16ger2pn: VSX Vector bfloat16 GER (rank-2 update) Positive multiply,
Negative accumulate
xvbf16ger2pp: VSX Vector bfloat16 GER (rank-2 update) Positive multiply,
Positive accumulate
pmxvbf16ger2:   Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
pmxvbf16ger2nn: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
Negative multiply, Negative accumulate
pmxvbf16ger2np: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
Negative multiply, Positive accumulate
pmxvbf16ger2pn: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
Positive multiply, Negative accumulate
pmxvbf16ger2pp: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-8-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c             | 40 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  5 ++++
 target/ppc/insn32.decode            |  6 +++++
 target/ppc/insn64.decode            | 11 ++++++++
 target/ppc/translate/vsx-impl.c.inc | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index a9b2ef370f..fed0ce420a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3517,6 +3517,11 @@ static float64 extract_hf16(float16 in, float_status *fp_status)
     return float16_to_float64(in, true, fp_status);
 }
 
+static float64 extract_bf16(bfloat16 in, float_status *fp_status)
+{
+    return bfloat16_to_float64(in, fp_status);
+}
+
 static void vsxger16(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
                      ppc_acc_t  *at, uint32_t mask, bool acc,
                      bool neg_mul, bool neg_acc, extract_f16 extract)
@@ -3639,6 +3644,41 @@ static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
     vsxger_excp(env, GETPC());
 }
 
+QEMU_FLATTEN
+void helper_XVBF16GER2(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, false, false, false, extract_bf16);
+}
+
+QEMU_FLATTEN
+void helper_XVBF16GER2PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                         ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, false, false, extract_bf16);
+}
+
+QEMU_FLATTEN
+void helper_XVBF16GER2PN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                         ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, false, true, extract_bf16);
+}
+
+QEMU_FLATTEN
+void helper_XVBF16GER2NP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                         ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, true, false, extract_bf16);
+}
+
+QEMU_FLATTEN
+void helper_XVBF16GER2NN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                         ppc_acc_t *at, uint32_t mask)
+{
+    vsxger16(env, a, b, at, mask, true, true, true, extract_bf16);
+}
+
 QEMU_FLATTEN
 void helper_XVF16GER2(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
                      ppc_acc_t *at, uint32_t mask)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4070c0891c..6233e28d85 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -555,6 +555,11 @@ DEF_HELPER_5(XVF16GER2PP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF16GER2PN, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF16GER2NP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF16GER2NN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVBF16GER2, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVBF16GER2PP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVBF16GER2PN, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVBF16GER2NP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVBF16GER2NN, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, acc, i32)
 DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, acc, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b8e317159c..18a94fa3b5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -763,6 +763,12 @@ XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
 XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
 
+XVBF16GER2      111011 ... -- ..... ..... 00110011 ..-  @XX3_at xa=%xx_xa
+XVBF16GER2PP    111011 ... -- ..... ..... 00110010 ..-  @XX3_at xa=%xx_xa
+XVBF16GER2PN    111011 ... -- ..... ..... 10110010 ..-  @XX3_at xa=%xx_xa
+XVBF16GER2NP    111011 ... -- ..... ..... 01110010 ..-  @XX3_at xa=%xx_xa
+XVBF16GER2NN    111011 ... -- ..... ..... 11110010 ..-  @XX3_at xa=%xx_xa
+
 XVF16GER2       111011 ... -- ..... ..... 00010011 ..-  @XX3_at xa=%xx_xa
 XVF16GER2PP     111011 ... -- ..... ..... 00010010 ..-  @XX3_at xa=%xx_xa
 XVF16GER2PN     111011 ... -- ..... ..... 10010010 ..-  @XX3_at xa=%xx_xa
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 5ecc5c85bf..de115c1943 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -150,6 +150,17 @@ PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
 PMXVI16GER2SPP  000001 11 1001 -- - - pmsk:2 ------ ........       \
                 111011 ... -- ..... ..... 00101010 ..-  @MMIRR_XX3
 
+PMXVBF16GER2    000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00110011 ..-  @MMIRR_XX3
+PMXVBF16GER2PP  000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00110010 ..-  @MMIRR_XX3
+PMXVBF16GER2PN  000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 10110010 ..-  @MMIRR_XX3
+PMXVBF16GER2NP  000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 01110010 ..-  @MMIRR_XX3
+PMXVBF16GER2NN  000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 11110010 ..-  @MMIRR_XX3
+
 PMXVF16GER2     000001 11 1001 -- - - pmsk:2 ------ ........ \
                 111011 ... -- ..... ..... 00010011 ..-  @MMIRR_XX3
 PMXVF16GER2PP   000001 11 1001 -- - - pmsk:2 ------ ........ \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index e79752899a..7acdbceec4 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2898,6 +2898,12 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
 TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
 TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
 
+TRANS(XVBF16GER2, do_ger, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2PP, do_ger, gen_helper_XVBF16GER2PP)
+TRANS(XVBF16GER2PN, do_ger, gen_helper_XVBF16GER2PN)
+TRANS(XVBF16GER2NP, do_ger, gen_helper_XVBF16GER2NP)
+TRANS(XVBF16GER2NN, do_ger, gen_helper_XVBF16GER2NN)
+
 TRANS(XVF16GER2, do_ger, gen_helper_XVF16GER2)
 TRANS(XVF16GER2PP, do_ger, gen_helper_XVF16GER2PP)
 TRANS(XVF16GER2PN, do_ger, gen_helper_XVF16GER2PN)
@@ -2916,6 +2922,12 @@ TRANS(XVF64GERPN, do_ger, gen_helper_XVF64GERPN)
 TRANS(XVF64GERNP, do_ger, gen_helper_XVF64GERNP)
 TRANS(XVF64GERNN, do_ger, gen_helper_XVF64GERNN)
 
+TRANS64(PMXVBF16GER2, do_ger, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2PP, do_ger, gen_helper_XVBF16GER2PP)
+TRANS64(PMXVBF16GER2PN, do_ger, gen_helper_XVBF16GER2PN)
+TRANS64(PMXVBF16GER2NP, do_ger, gen_helper_XVBF16GER2NP)
+TRANS64(PMXVBF16GER2NN, do_ger, gen_helper_XVBF16GER2NN)
+
 TRANS64(PMXVF16GER2, do_ger, gen_helper_XVF16GER2)
 TRANS64(PMXVF16GER2PP, do_ger, gen_helper_XVF16GER2PP)
 TRANS64(PMXVF16GER2PN, do_ger, gen_helper_XVF16GER2PN)
-- 
2.36.1


