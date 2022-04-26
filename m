Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3B50FDE3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:56:59 +0200 (CEST)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKkU-0006SZ-HS
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeb-0004Hm-0T; Tue, 26 Apr 2022 08:50:53 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeZ-00005X-9y; Tue, 26 Apr 2022 08:50:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2215C801008;
 Tue, 26 Apr 2022 09:50:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 3/7] target/ppc: Implemented pmxvi*ger* instructions
Date: Tue, 26 Apr 2022 09:50:24 -0300
Message-Id: <20220426125028.18844-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:37.0364 (UTC)
 FILETIME=[3A1B5740:01D8596C]
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
pmxvi4ger8:     Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update)
pmxvi4ger8pp:   Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update) Positive multiply, Positive accumulate
pmxvi8ger4:     Prefixed Masked VSX Vector 4-bit Signed Integer GER
(rank-8 update)
pmxvi8ger4pp:   Prefixed Masked VSX Vector 4-bit Signed Integer GER
(rank-8 update) Positive multiply, Positive accumulate
pmxvi8ger4spp:  Prefixed Masked VSX Vector 8-bit Signed/Unsigned Integer
GER (rank-4 update) with Saturate Positive multiply, Positive accumulate
pmxvi16ger2:    Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update)
pmxvi16ger2pp:  Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) Positive multiply, Positive accumulate
pmxvi16ger2s:   Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) with Saturation
pmxvi16ger2spp: Prefixed Masked VSX Vector 16-bit Signed Integer GER
(rank-2 update) with Saturation Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn64.decode            | 30 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 28 +++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 691e8fe6c0..18915f1977 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -68,6 +68,15 @@
                 ...... ..... ..... ..... ..... .. ....   \
                 &8RR_XX4_uim3 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
+# Format MMIRR:XX3
+&MMIRR_XX3      xa xb xt pmsk xmsk ymsk
+%xx3_xa         2:1 16:5
+%xx3_xb         1:1 11:5
+%xx3_at         23:3 !function=times_4
+@MMIRR_XX3      ...... .. .... .. . . ........ xmsk:4 ymsk:4  \
+                ...... ... .. ..... ..... ........ ...  \
+                &MMIRR_XX3 xa=%xx3_xa xb=%xx3_xb xt=%xx3_at
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -115,6 +124,27 @@ PSTFS           000001 10 0--.-- .................. \
 PSTFD           000001 10 0--.-- .................. \
                 110110 ..... ..... ................     @PLS_D
 
+## Vector GER instruction
+
+PMXVI4GER8      000001 11 1001 -- - - pmsk:8 ........              \
+                111011 ... -- ..... ..... 00100011 ..-  @MMIRR_XX3
+PMXVI4GER8PP    000001 11 1001 -- - - pmsk:8 ........              \
+                111011 ... -- ..... ..... 00100010 ..-  @MMIRR_XX3
+PMXVI8GER4      000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 00000011 ..-  @MMIRR_XX3
+PMXVI8GER4PP    000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 00000010 ..-  @MMIRR_XX3
+PMXVI16GER2     000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 01001011 ..-  @MMIRR_XX3
+PMXVI16GER2PP   000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 01101011 ..-  @MMIRR_XX3
+PMXVI8GER4SPP   000001 11 1001 -- - - pmsk:4 ---- ........         \
+                111011 ... -- ..... ..... 01100011 ..-  @MMIRR_XX3
+PMXVI16GER2S    000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 00101011 ..-  @MMIRR_XX3
+PMXVI16GER2SPP  000001 11 1001 -- - - pmsk:2 ------ ........       \
+                111011 ... -- ..... ..... 00101010 ..-  @MMIRR_XX3
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 1eb68c7081..eb7b8cb0c6 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2835,7 +2835,7 @@ static uint32_t pack_flags_xvi(int acc, int sat)
     return (sat << 1) | acc;
 }
 
-static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op,
+static bool do_ger_MMIRR_XX3(DisasContext *ctx, arg_MMIRR_XX3 *a, uint32_t op,
                              void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
                                             TCGv_i32, TCGv_i32, TCGv_i32))
 {
@@ -2847,11 +2847,25 @@ static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op,
         return true;
     }
 
-    mask = 0xFFFFFFFF;
+    mask = ger_pack_masks(a->pmsk, a->ymsk, a->xmsk);
     helper(cpu_env, tcg_constant_i32(a->xa), tcg_constant_i32(a->xb),
            tcg_constant_i32(a->xt), tcg_constant_i32(mask),
            tcg_constant_i32(op));
     return true;
+
+}
+static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op_flags,
+                       void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
+                                      TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    arg_MMIRR_XX3 m;
+    m.xa = a->xa;
+    m.xb = a->xb;
+    m.xt = a->xt;
+    m.pmsk = 0xFF;
+    m.ymsk = 0xF;
+    m.xmsk = 0xF;
+    return do_ger_MMIRR_XX3(ctx, &m, op_flags, helper);
 }
 
 /* Used to keep line length < 80 */
@@ -2868,6 +2882,16 @@ TRANS(XVI16GER2, do_ger_XX3, GER_NOP, gen_helper_XVI16GER2)
 TRANS(XVI16GER2PP, do_ger_XX3, GER_PP, gen_helper_XVI16GER2)
 TRANS(XVI16GER2S, do_ger_XX3, GER_SAT, gen_helper_XVI16GER2)
 TRANS(XVI16GER2SPP, do_ger_XX3, GER_SPP, gen_helper_XVI16GER2)
+
+TRANS64(PMXVI4GER8, do_ger_MMIRR_XX3, GER_NOP, gen_helper_XVI4GER8)
+TRANS64(PMXVI4GER8PP, do_ger_MMIRR_XX3, GER_PP, gen_helper_XVI4GER8)
+TRANS64(PMXVI8GER4, do_ger_MMIRR_XX3, GER_NOP, gen_helper_XVI8GER4)
+TRANS64(PMXVI8GER4PP, do_ger_MMIRR_XX3, GER_PP, gen_helper_XVI8GER4)
+TRANS64(PMXVI8GER4SPP, do_ger_MMIRR_XX3, GER_SPP, gen_helper_XVI8GER4)
+TRANS64(PMXVI16GER2, do_ger_MMIRR_XX3, GER_NOP, gen_helper_XVI16GER2)
+TRANS64(PMXVI16GER2PP, do_ger_MMIRR_XX3, GER_PP, gen_helper_XVI16GER2)
+TRANS64(PMXVI16GER2S, do_ger_MMIRR_XX3, GER_SAT, gen_helper_XVI16GER2)
+TRANS64(PMXVI16GER2SPP, do_ger_MMIRR_XX3, GER_SPP, gen_helper_XVI16GER2)
 #undef GER_NOP
 #undef GER_PP
 #undef GER_SAT
-- 
2.31.1


