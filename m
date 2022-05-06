Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8AE51D7F1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:33:25 +0200 (CEST)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmx9A-0001J1-J4
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwwW-0007KN-P3; Fri, 06 May 2022 08:20:21 -0400
Received: from [187.72.171.209] (port=47457 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwwU-0005uX-QS; Fri, 06 May 2022 08:20:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 6 May 2022 09:18:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id AC3B5801008;
 Fri,  6 May 2022 09:18:49 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [RFC PATCH v2 7/7] target/ppc: Implemented [pm]xvbf16ger2*
Date: Fri,  6 May 2022 09:18:44 -0300
Message-Id: <20220506121844.18969-8-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 May 2022 12:18:50.0134 (UTC)
 FILETIME=[7170A360:01D86143]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
---
There's a discrepancy between this implementation and mambo/the
hardware where implementing it with float64_mul then float64r32_muladd
sometimes results in an incorrect result after an underflow, but
implementing with float32_mul then float32_muladd results in incorrect
signal in some 0 or infinite results. I've not been able to solve this
---
 target/ppc/fpu_helper.c             | 40 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  5 ++++
 target/ppc/insn32.decode            |  6 +++++
 target/ppc/insn64.decode            | 11 ++++++++
 target/ppc/translate/vsx-impl.c.inc | 12 +++++++++
 5 files changed, 74 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6857be6ccc..0882702301 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3491,6 +3491,11 @@ static float64 extract_hf16(float16 in, float_status *fp_status)
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
@@ -3611,6 +3616,41 @@ static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
     do_float_check_status(env, GETPC());
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
index 5f2f574d30..59e6b74f94 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -551,6 +551,11 @@ DEF_HELPER_5(XVF16GER2PP, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF16GER2PN, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF16GER2NP, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF16GER2NN, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVBF16GER2, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVBF16GER2PP, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVBF16GER2PN, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVBF16GER2NP, void, env, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVBF16GER2NN, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index bbd4bc80f8..2090c17268 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -736,6 +736,12 @@ XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
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
index a12f11044c..78738924c6 100644
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
index 00eed2b1b9..bb5b68ee06 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2884,6 +2884,12 @@ TRANS64(PMXVI16GER2PP, do_ger_MMIRR_XX3, gen_helper_XVI16GER2PP)
 TRANS64(PMXVI16GER2S, do_ger_MMIRR_XX3, gen_helper_XVI16GER2S)
 TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, gen_helper_XVI16GER2SPP)
 
+TRANS(XVBF16GER2, do_ger_XX3, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2PP, do_ger_XX3, gen_helper_XVBF16GER2PP)
+TRANS(XVBF16GER2PN, do_ger_XX3, gen_helper_XVBF16GER2PN)
+TRANS(XVBF16GER2NP, do_ger_XX3, gen_helper_XVBF16GER2NP)
+TRANS(XVBF16GER2NN, do_ger_XX3, gen_helper_XVBF16GER2NN)
+
 TRANS(XVF16GER2, do_ger_XX3, gen_helper_XVF16GER2)
 TRANS(XVF16GER2PP, do_ger_XX3, gen_helper_XVF16GER2PP)
 TRANS(XVF16GER2PN, do_ger_XX3, gen_helper_XVF16GER2PN)
@@ -2902,6 +2908,12 @@ TRANS(XVF64GERPN, do_ger_XX3, gen_helper_XVF64GERPN)
 TRANS(XVF64GERNP, do_ger_XX3, gen_helper_XVF64GERNP)
 TRANS(XVF64GERNN, do_ger_XX3, gen_helper_XVF64GERNN)
 
+TRANS64(PMXVBF16GER2, do_ger_MMIRR_XX3, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2PP, do_ger_MMIRR_XX3, gen_helper_XVBF16GER2PP)
+TRANS64(PMXVBF16GER2PN, do_ger_MMIRR_XX3, gen_helper_XVBF16GER2PN)
+TRANS64(PMXVBF16GER2NP, do_ger_MMIRR_XX3, gen_helper_XVBF16GER2NP)
+TRANS64(PMXVBF16GER2NN, do_ger_MMIRR_XX3, gen_helper_XVBF16GER2NN)
+
 TRANS64(PMXVF16GER2, do_ger_MMIRR_XX3, gen_helper_XVF16GER2)
 TRANS64(PMXVF16GER2PP, do_ger_MMIRR_XX3, gen_helper_XVF16GER2PP)
 TRANS64(PMXVF16GER2PN, do_ger_MMIRR_XX3, gen_helper_XVF16GER2PN)
-- 
2.31.1


