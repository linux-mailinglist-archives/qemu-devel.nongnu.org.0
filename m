Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED085605FC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:39:24 +0200 (CEST)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aip-0004F0-Rp
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6abh-0004k7-Ag; Wed, 29 Jun 2022 12:32:01 -0400
Received: from [200.168.210.66] (port=28502 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6abf-0000WJ-Ll; Wed, 29 Jun 2022 12:32:01 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 29 Jun 2022 13:29:13 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E8266800603;
 Wed, 29 Jun 2022 13:29:12 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br
Subject: [PATCH v3 10/11] target/ppc: implement cbcdtd
Date: Wed, 29 Jun 2022 13:29:03 -0300
Message-Id: <20220629162904.105060-11-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
References: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Jun 2022 16:29:13.0310 (UTC)
 FILETIME=[5E41DFE0:01D88BD5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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

Implements the Convert Binary Coded Decimal To Declets instruction.
Since libdecnumber doesn't expose the methods for direct conversion
(decDigitsToDPD, BCD2DPD, etc.), the BCD values are converted to
decimal32 format, from which the declets are extracted.

Where the behavior is undefined, we try to match the result observed in
a POWER9 DD2.3.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/dfp_helper.c                    | 39 ++++++++++++++++++++++
 target/ppc/helper.h                        |  1 +
 target/ppc/insn32.decode                   |  4 +++
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++
 4 files changed, 51 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 0d01ac3de0..db9e994c8c 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -1391,3 +1391,42 @@ DFP_HELPER_SHIFT(DSCLI, 64, 1)
 DFP_HELPER_SHIFT(DSCLIQ, 128, 1)
 DFP_HELPER_SHIFT(DSCRI, 64, 0)
 DFP_HELPER_SHIFT(DSCRIQ, 128, 0)
+
+target_ulong helper_CBCDTD(target_ulong s)
+{
+    uint64_t res = 0;
+    uint32_t dec32;
+    uint8_t bcd[6];
+    int w, i, offs;
+    decNumber a;
+    decContext context;
+
+    decContextDefault(&context, DEC_INIT_DECIMAL32);
+
+    for (w = 1; w >= 0; w--) {
+        res <<= 32;
+        decNumberZero(&a);
+        /* Extract each BCD field of word "w" */
+        for (i = 5; i >= 0; i--) {
+            offs = 4 * (5 - i) + 32 * w;
+            bcd[i] = extract64(s, offs, 4);
+            if (bcd[i] > 9) {
+                /*
+                 * If the field value is greater than 9, the results are
+                 * undefined. We could use a fixed value like 0 or 9, but
+                 * an and with 9 seems to better match the hardware behavior.
+                 */
+                bcd[i] &= 9;
+            }
+        }
+
+        /* Create a decNumber with the BCD values and convert to decimal32 */
+        decNumberSetBCD(&a, bcd, 6);
+        decimal32FromNumber((decimal32 *)&dec32, &a, &context);
+
+        /* Extract the two declets from the decimal32 value */
+        res |= dec32 & 0xfffff;
+    }
+
+    return res;
+}
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d627cfe6ed..643bd69db8 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -54,6 +54,7 @@ DEF_HELPER_3(sraw, tl, env, tl, tl)
 DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
+DEF_HELPER_FLAGS_1(CBCDTD, TCG_CALL_NO_RWG_SE, tl, tl)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_2(cmpeqb, TCG_CALL_NO_RWG_SE, i32, tl, tl)
 DEF_HELPER_FLAGS_1(popcntw, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 36db427537..5222d540b1 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -87,6 +87,9 @@
 &X_rc           rt ra rb rc:bool
 @X_rc           ...... rt:5 ra:5 rb:5 .......... rc:1           &X_rc
 
+&X_sa           rs ra
+@X_sa           ...... rs:5 ra:5 ..... .......... .             &X_sa
+
 %x_frtp         22:4 !function=times_2
 %x_frap         17:4 !function=times_2
 %x_frbp         12:4 !function=times_2
@@ -314,6 +317,7 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 ## BCD Assist
 
 ADDG6S          011111 ..... ..... ..... - 001001010 -  @X
+CBCDTD          011111 ..... ..... ----- 0100111010 -   @X_sa
 
 ### Float-Point Load Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 490e49cfc7..892c9d2568 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -529,3 +529,10 @@ static bool trans_ADDG6S(DisasContext *ctx, arg_X *a)
 
     return true;
 }
+
+static bool trans_CBCDTD(DisasContext *ctx, arg_X_sa *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, BCDA_ISA206);
+    gen_helper_CBCDTD(cpu_gpr[a->ra], cpu_gpr[a->rs]);
+    return true;
+}
-- 
2.25.1


