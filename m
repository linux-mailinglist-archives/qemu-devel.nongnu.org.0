Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8A52A8D7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:03:44 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0bd-0008Qz-96
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0O8-0001zi-L9; Tue, 17 May 2022 12:49:38 -0400
Received: from [187.72.171.209] (port=25718 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0O5-0006r1-Mp; Tue, 17 May 2022 12:49:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:48:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8F03C800603;
 Tue, 17 May 2022 13:48:01 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH RESEND 10/10] target/ppc: implement cdtbcd
Date: Tue, 17 May 2022 13:47:44 -0300
Message-Id: <20220517164744.58131-11-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:48:01.0810 (UTC)
 FILETIME=[DF220F20:01D86A0D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the Convert Declets To Binary Coded Decimal instruction.
Since libdecnumber doesn't expose the methods for direct conversion
(decDigitsFromDPD, DPD2BCD, etc), a positive decimal32 with zero
exponent is used as an intermediate value to convert the declets.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/dfp_helper.c                    | 26 ++++++++++++++++++++++
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  1 +
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++++
 4 files changed, 35 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index db9e994c8c..5ba74b2124 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1392,6 +1392,32 @@ DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
 DFP_HELPER_SHIFT(DSCRI, 64, 0)
 DFP_HELPER_SHIFT(DSCRIQ, 128, 0)
 
+target_ulong helper_CDTBCD(target_ulong s)
+{
+    uint64_t res = 0;
+    uint32_t dec32, declets;
+    uint8_t bcd[6];
+    int i, w, sh;
+    decNumber a;
+
+    for (w = 1; w >= 0; w--) {
+        res <<= 32;
+        declets = extract64(s, 32 * w, 20);
+        if (declets) {
+            /* decimal32 with zero exponent and word "w" declets */
+            dec32 = (0x225ULL << 20) | declets;
+            decimal32ToNumber((decimal32 *)&dec32, &a);
+            decNumberGetBCD(&a, bcd);
+            for (i = 0; i < a.digits; i++) {
+                sh = 4 * (a.digits - 1 - i);
+                res |= (uint64_t)bcd[i] << sh;
+            }
+        }
+    }
+
+    return res;
+}
+
 target_ulong helper_CBCDTD(target_ulong s)
 {
     uint64_t res = 0;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index da1a30555b..1ad674d8ce 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_1(CDTBCD, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(CBCDTD, TCG_CALL_NO_RWG_SE, tl, tl)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f2defc635c..4256614fdc 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -302,6 +302,7 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 ## BCD Assist
 
 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+CDTBCD          011111 ..... ..... ----- 0100011010 -   @X_sa
 CBCDTD          011111 ..... ..... ----- 0100111010 -   @X_sa
 
 ### Float-Point Load Instructions
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index d9174d2ba3..9362c4bde8 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -528,6 +528,13 @@ static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
     return true;
 }
 
+static bool trans_CDTBCD(DisasContext *ctx, arg_X_sa *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+    gen_helper_CDTBCD(cpu_gpr[a->ra], cpu_gpr[a->rs]);
+    return true;
+}
+
 static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
 {
     REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
-- 
2.25.1


