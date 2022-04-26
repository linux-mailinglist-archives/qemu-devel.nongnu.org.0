Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449550FE7F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:11:43 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKyj-0001S2-QB
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKen-0004pV-59; Tue, 26 Apr 2022 08:51:05 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKel-00005X-Az; Tue, 26 Apr 2022 08:51:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E1CB2801008;
 Tue, 26 Apr 2022 09:50:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 7/7] target/ppc: Implemented [pm]xvbf16ger2*
Date: Tue, 26 Apr 2022 09:50:28 -0300
Message-Id: <20220426125028.18844-8-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:38.0459 (UTC)
 FILETIME=[3AC26CB0:01D8596C]
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
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
hardware where implementing it with float32_mul then float32_muladd
results in incorrect signal in some 0 or infinite results, but implementing
with a multiplication then muladd using FloatParts64 results in a different
result in operations where an underflow would've ocurred in the first
multiplication if it was rounded to 32 bits. I've not been able to solve this
---
 target/ppc/cpu.h                    |  3 +++
 target/ppc/fpu_helper.c             |  1 +
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  6 ++++++
 target/ppc/insn64.decode            | 11 +++++++++++
 target/ppc/translate/vsx-impl.c.inc | 12 ++++++++++++
 6 files changed, 34 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 91167f8cc0..10780adf65 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -225,6 +225,7 @@ typedef union _ppc_vsr_t {
     int16_t s16[8];
     int32_t s32[4];
     int64_t s64[2];
+    bfloat16 bf16[8];
     float16 f16[8];
     float32 f32[4];
     float64 f64[2];
@@ -2653,6 +2654,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[i]
 #define VsrD(i) u64[i]
 #define VsrSD(i) s64[i]
+#define VsrBF(i) bf16[i]
 #define VsrHF(i) f16[i]
 #define VsrSF(i) f32[i]
 #define VsrDF(i) f64[i]
@@ -2665,6 +2667,7 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
 #define VsrSW(i) s32[3 - (i)]
 #define VsrD(i) u64[1 - (i)]
 #define VsrSD(i) s64[1 - (i)]
+#define VsrBF(i) bf16[7 - (i)]
 #define VsrHF(i) f16[7 - (i)]
 #define VsrSF(i) f32[3 - (i)]
 #define VsrDF(i) f64[1 - (i)]
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c3aead642a..9acba0f804 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3583,6 +3583,7 @@ static inline bool ger_neg_acc_flag(uint32_t flag)
         do_float_check_status(env, GETPC());                            \
     }
 
+VSXGER16(helper_XVBF16GER2, bfloat16, BF)
 VSXGER16(helper_XVF16GER2, float16, HF)
 VSXGER(helper_XVF32GER, float32, SF)
 VSXGER(helper_XVF64GER, float64, DF)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index cc59a3b71d..68748ecc03 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -540,6 +540,7 @@ DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_6(XVI4GER8, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI8GER4, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVI16GER2, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVBF16GER2, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVF16GER2, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVF32GER, void, env, i32, i32, i32, i32, i32)
 DEF_HELPER_6(XVF64GER, void, env, i32, i32, i32, i32, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a204730d1d..fff6e406f0 100644
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
index bc5e4dfe1a..4cd6219ad5 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -151,6 +151,17 @@ PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
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
index 06f5c1220d..bb5e6f0693 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2933,6 +2933,12 @@ TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, GER_SPP, gen_helper_XVI16GER2)
 #define GER_PN ger_pack_flags_xvf(true, false, true)
 #define GER_NN ger_pack_flags_xvf(true, true, true)
 
+TRANS(XVBF16GER2, do_ger_XX3, GER_NOP, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2PP, do_ger_XX3, GER_PP, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2PN, do_ger_XX3, GER_PN, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2NP, do_ger_XX3, GER_NP, gen_helper_XVBF16GER2)
+TRANS(XVBF16GER2NN, do_ger_XX3, GER_NN, gen_helper_XVBF16GER2)
+
 TRANS(XVF16GER2, do_ger_XX3, GER_NOP, gen_helper_XVF16GER2)
 TRANS(XVF16GER2PP, do_ger_XX3, GER_PP, gen_helper_XVF16GER2)
 TRANS(XVF16GER2PN, do_ger_XX3, GER_PN, gen_helper_XVF16GER2)
@@ -2957,6 +2963,12 @@ TRANS64(PMXVF16GER2PN, do_ger_MMIRR_XX3, GER_PN, gen_helper_XVF16GER2)
 TRANS64(PMXVF16GER2NP, do_ger_MMIRR_XX3, GER_NP, gen_helper_XVF16GER2)
 TRANS64(PMXVF16GER2NN, do_ger_MMIRR_XX3, GER_NN, gen_helper_XVF16GER2)
 
+TRANS64(PMXVBF16GER2, do_ger_MMIRR_XX3, GER_NOP, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2PP, do_ger_MMIRR_XX3, GER_PP, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2PN, do_ger_MMIRR_XX3, GER_PN, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2NP, do_ger_MMIRR_XX3, GER_NP, gen_helper_XVBF16GER2)
+TRANS64(PMXVBF16GER2NN, do_ger_MMIRR_XX3, GER_NN, gen_helper_XVBF16GER2)
+
 TRANS64(PMXVF32GER, do_ger_MMIRR_XX3_NO_PMSK, GER_NOP, gen_helper_XVF32GER)
 TRANS64(PMXVF32GERPP, do_ger_MMIRR_XX3_NO_PMSK, GER_PP, gen_helper_XVF32GER)
 TRANS64(PMXVF32GERPN, do_ger_MMIRR_XX3_NO_PMSK, GER_PN, gen_helper_XVF32GER)
-- 
2.31.1


