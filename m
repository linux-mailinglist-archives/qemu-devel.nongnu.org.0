Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D881150FE38
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:03:33 +0200 (CEST)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKqq-0005ZF-Ck
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKek-0004gZ-Bh; Tue, 26 Apr 2022 08:51:02 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKei-00005X-IB; Tue, 26 Apr 2022 08:51:02 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B421080009B;
 Tue, 26 Apr 2022 09:50:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 6/7] target/ppc: Implemented pmxvf*ger*
Date: Tue, 26 Apr 2022 09:50:27 -0300
Message-Id: <20220426125028.18844-7-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:38.0272 (UTC)
 FILETIME=[3AA5E400:01D8596C]
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
pmxvf16ger2:   Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update)
pmxvf16ger2nn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Negative multiply, Negative accumulate
pmxvf16ger2np: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Negative multiply, Positive accumulate
pmxvf16ger2pn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Positive multiply, Negative accumulate
pmxvf16ger2pp: Prefixed Masked VSX Vector 16-bit Floating-Point GER
(rank-2 update) Positive multiply, Positive accumulate
pmxvf32ger:    Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update)
pmxvf32gernn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Negative multiply, Negative accumulate
pmxvf32gernp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Negative multiply, Positive accumulate
pmxvf32gerpn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Positive multiply, Negative accumulate
pmxvf32gerpp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
(rank-1 update) Positive multiply, Positive accumulate
pmxvf64ger:    Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update)
pmxvf64gernn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Negative multiply, Negative accumulate
pmxvf64gernp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Negative multiply, Positive accumulate
pmxvf64gerpn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Positive multiply, Negative accumulate
pmxvf64gerpp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
(rank-1 update) Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn64.decode            | 39 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 33 ++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 18915f1977..bc5e4dfe1a 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -73,10 +73,16 @@
 %xx3_xa         2:1 16:5
 %xx3_xb         1:1 11:5
 %xx3_at         23:3 !function=times_4
+%xx3_xa_pair    2:1 17:4 !function=times_2
 @MMIRR_XX3      ...... .. .... .. . . ........ xmsk:4 ymsk:4  \
                 ...... ... .. ..... ..... ........ ...  \
                 &MMIRR_XX3 xa=%xx3_xa xb=%xx3_xb xt=%xx3_at
 
+&MMIRR_XX3_NO_P xa xb xt xmsk ymsk
+@MMIRR_XX3_NO_P ...... .. .... .. . . ........ xmsk:4 .... \
+                ...... ... .. ..... ..... ........ ... \
+                &MMIRR_XX3_NO_P xb=%xx3_xb xt=%xx3_at
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -145,6 +151,39 @@ PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
 PMXVI16GER2SPP  000001 11 1001 -- - - pmsk:2 ------ ........       \
                 111011 ... -- ..... ..... 00101010 ..-  @MMIRR_XX3
 
+PMXVF16GER2     000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00010011 ..-  @MMIRR_XX3
+PMXVF16GER2PP   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 00010010 ..-  @MMIRR_XX3
+PMXVF16GER2PN   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 10010010 ..-  @MMIRR_XX3
+PMXVF16GER2NP   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 01010010 ..-  @MMIRR_XX3
+PMXVF16GER2NN   000001 11 1001 -- - - pmsk:2 ------ ........ \
+                111011 ... -- ..... ..... 11010010 ..-  @MMIRR_XX3
+
+PMXVF32GER      000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 00011011 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERPP    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 00011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERPN    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 10011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERNP    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 01011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+PMXVF32GERNN    000001 11 1001 -- - - -------- .... ymsk:4 \
+                111011 ... -- ..... ..... 11011010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa
+
+PMXVF64GER      000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 00111011 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERPP    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 00111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERPN    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 10111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERNP    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 01111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+PMXVF64GERNN    000001 11 1001 -- - - -------- .... ymsk:2 -- \
+                111011 ... -- ....0 ..... 11111010 ..-  @MMIRR_XX3_NO_P xa=%xx3_xa_pair
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9285e27159..06f5c1220d 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2867,6 +2867,22 @@ static bool do_ger_MMIRR_XX3(DisasContext *ctx, arg_MMIRR_XX3 *a, uint32_t op,
     return true;
 
 }
+
+static bool do_ger_MMIRR_XX3_NO_PMSK(DisasContext *ctx, arg_MMIRR_XX3_NO_P *a,
+                                     int op_flag, void (*helper)(TCGv_env,
+                                     TCGv_i32, TCGv_i32, TCGv_i32,
+                                     TCGv_i32, TCGv_i32))
+{
+    arg_MMIRR_XX3 x;
+    x.xa = a->xa;
+    x.xb = a->xb;
+    x.xt = a->xt;
+    x.pmsk = 0x1;
+    x.ymsk = a->ymsk;
+    x.xmsk = a->xmsk;
+    return do_ger_MMIRR_XX3(ctx, &x, op_flag, helper);
+}
+
 static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op_flags,
                        void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
                                       TCGv_i32, TCGv_i32, TCGv_i32))
@@ -2935,6 +2951,23 @@ TRANS(XVF64GERPN, do_ger_XX3, GER_PN, gen_helper_XVF64GER)
 TRANS(XVF64GERNP, do_ger_XX3, GER_NP, gen_helper_XVF64GER)
 TRANS(XVF64GERNN, do_ger_XX3, GER_NN, gen_helper_XVF64GER)
 
+TRANS64(PMXVF16GER2, do_ger_MMIRR_XX3, GER_NOP, gen_helper_XVF16GER2)
+TRANS64(PMXVF16GER2PP, do_ger_MMIRR_XX3, GER_PP, gen_helper_XVF16GER2)
+TRANS64(PMXVF16GER2PN, do_ger_MMIRR_XX3, GER_PN, gen_helper_XVF16GER2)
+TRANS64(PMXVF16GER2NP, do_ger_MMIRR_XX3, GER_NP, gen_helper_XVF16GER2)
+TRANS64(PMXVF16GER2NN, do_ger_MMIRR_XX3, GER_NN, gen_helper_XVF16GER2)
+
+TRANS64(PMXVF32GER, do_ger_MMIRR_XX3_NO_PMSK, GER_NOP, gen_helper_XVF32GER)
+TRANS64(PMXVF32GERPP, do_ger_MMIRR_XX3_NO_PMSK, GER_PP, gen_helper_XVF32GER)
+TRANS64(PMXVF32GERPN, do_ger_MMIRR_XX3_NO_PMSK, GER_PN, gen_helper_XVF32GER)
+TRANS64(PMXVF32GERNP, do_ger_MMIRR_XX3_NO_PMSK, GER_NP, gen_helper_XVF32GER)
+TRANS64(PMXVF32GERNN, do_ger_MMIRR_XX3_NO_PMSK, GER_NN, gen_helper_XVF32GER)
+
+TRANS64(PMXVF64GER, do_ger_MMIRR_XX3_NO_PMSK, GER_NOP, gen_helper_XVF64GER)
+TRANS64(PMXVF64GERPP, do_ger_MMIRR_XX3_NO_PMSK, GER_PP, gen_helper_XVF64GER)
+TRANS64(PMXVF64GERPN, do_ger_MMIRR_XX3_NO_PMSK, GER_PN, gen_helper_XVF64GER)
+TRANS64(PMXVF64GERNP, do_ger_MMIRR_XX3_NO_PMSK, GER_NP, gen_helper_XVF64GER)
+TRANS64(PMXVF64GERNN, do_ger_MMIRR_XX3_NO_PMSK, GER_NN, gen_helper_XVF64GER)
 
 #undef GER_NOP
 #undef GER_PP
-- 
2.31.1


