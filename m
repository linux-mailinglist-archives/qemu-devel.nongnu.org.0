Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D64532C2B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:27:27 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntVVO-00050i-B7
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntVAt-0003IM-Rk; Tue, 24 May 2022 10:06:16 -0400
Received: from [187.72.171.209] (port=60107 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntVAs-0004xw-5n; Tue, 24 May 2022 10:06:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 24 May 2022 11:05:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E7BC6800761;
 Tue, 24 May 2022 11:05:40 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v6 3/8] target/ppc: Implemented pmxvi*ger* instructions
Date: Tue, 24 May 2022 11:05:32 -0300
Message-Id: <20220524140537.27451-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
References: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 May 2022 14:05:41.0210 (UTC)
 FILETIME=[5A2CB3A0:01D86F77]
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn64.decode            | 30 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 10 ++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 691e8fe6c0..0eed35c8cd 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -68,6 +68,15 @@
                 ...... ..... ..... ..... ..... .. ....   \
                 &8RR_XX4_uim3 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
+# Format MMIRR:XX3
+&MMIRR_XX3      !extern xa xb xt pmsk xmsk ymsk
+%xx3_xa         2:1 16:5
+%xx3_xb         1:1 11:5
+%xx3_at         23:3
+@MMIRR_XX3      ...... .. .... .. . . ........ xmsk:4 ymsk:4  \
+                ...... ... .. ..... ..... ........ ...  \
+                &MMIRR_XX3 xa=%xx3_xa xb=%xx3_xb xt=%xx3_at
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -115,6 +124,27 @@ PSTFS           000001 10 0--.-- .................. \
 PSTFD           000001 10 0--.-- .................. \
                 110110 ..... ..... ................     @PLS_D
 
+## VSX GER instruction
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
index 6026b203e0..b10eded1da 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2888,6 +2888,16 @@ TRANS(XVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
 TRANS(XVI16GER2S, do_ger, gen_helper_XVI16GER2S)
 TRANS(XVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
 
+TRANS64(PMXVI4GER8, do_ger, gen_helper_XVI4GER8)
+TRANS64(PMXVI4GER8PP, do_ger, gen_helper_XVI4GER8PP)
+TRANS64(PMXVI8GER4, do_ger, gen_helper_XVI8GER4)
+TRANS64(PMXVI8GER4PP, do_ger, gen_helper_XVI8GER4PP)
+TRANS64(PMXVI8GER4SPP, do_ger, gen_helper_XVI8GER4SPP)
+TRANS64(PMXVI16GER2, do_ger, gen_helper_XVI16GER2)
+TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
+TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
+TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


