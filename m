Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD58406B27
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:05:10 +0200 (CEST)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfHI-0007qS-H1
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiG-0005EW-Hw; Fri, 10 Sep 2021 07:28:57 -0400
Received: from [201.28.113.2] (port=29928 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mOeiF-0003iy-08; Fri, 10 Sep 2021 07:28:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Sep 2021 08:26:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id CECB3800C19;
 Fri, 10 Sep 2021 08:26:52 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 15/22] target/ppc: Implement DCTFIXQQ
Date: Fri, 10 Sep 2021 08:26:17 -0300
Message-Id: <20210910112624.72748-16-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Sep 2021 11:26:53.0014 (UTC)
 FILETIME=[C12D5F60:01D7A636]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the following PowerISA v3.1 instruction:
dctfixqq: DFP Convert To Fixed Quadword Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/dfp_helper.c             | 53 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  5 +++
 target/ppc/translate/dfp-impl.c.inc | 17 +++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 01a7ead783..ef1c370c3c 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -51,6 +51,12 @@ static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
     dfp[1].VsrD(0) = src->VsrD(1);
 }
 
+static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)
+{
+    dst->VsrD(0) = src->VsrD(0);
+    dst->VsrD(1) = src->VsrD(1);
+}
+
 struct PPC_DFP {
     CPUPPCState *env;
     ppc_vsr_t vt, va, vb;
@@ -1019,6 +1025,53 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)              \
 DFP_HELPER_CTFIX(dctfix, 64)
 DFP_HELPER_CTFIX(dctfixq, 128)
 
+void helper_DCTFIXQQ(CPUPPCState *env, ppc_avr_t *t, ppc_fprp_t *b)
+{
+    struct PPC_DFP dfp;
+    dfp_prepare_decimal128(&dfp, 0, b, env);
+
+    if (unlikely(decNumberIsSpecial(&dfp.b))) {
+        uint64_t invalid_flags = FP_VX | FP_VXCVI;
+        if (decNumberIsInfinite(&dfp.b)) {
+            if (decNumberIsNegative(&dfp.b)) {
+                dfp.vt.VsrD(0) = INT64_MIN;
+                dfp.vt.VsrD(1) = 0;
+            } else {
+                dfp.vt.VsrD(0) = INT64_MAX;
+                dfp.vt.VsrD(1) = UINT64_MAX;
+            }
+        } else { /* NaN */
+            dfp.vt.VsrD(0) = INT64_MIN;
+            dfp.vt.VsrD(1) = 0;
+            if (decNumberIsSNaN(&dfp.b)) {
+                invalid_flags |= FP_VXSNAN;
+            }
+        }
+        dfp_set_FPSCR_flag(&dfp, invalid_flags, FP_VE);
+    } else if (unlikely(decNumberIsZero(&dfp.b))) {
+        dfp.vt.VsrD(0) = 0;
+        dfp.vt.VsrD(1) = 0;
+    } else {
+        decNumberToIntegralExact(&dfp.b, &dfp.b, &dfp.context);
+        decNumberIntegralToInt128(&dfp.b, &dfp.context,
+                &dfp.vt.VsrD(1), &dfp.vt.VsrD(0));
+        if (decContextTestStatus(&dfp.context, DEC_Invalid_operation)) {
+            if (decNumberIsNegative(&dfp.b)) {
+                dfp.vt.VsrD(0) = INT64_MIN;
+                dfp.vt.VsrD(1) = 0;
+            } else {
+                dfp.vt.VsrD(0) = INT64_MAX;
+                dfp.vt.VsrD(1) = UINT64_MAX;
+            }
+            dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FP_VE);
+        } else {
+            dfp_check_for_XX(&dfp);
+        }
+    }
+
+    set_dfp128_to_avr(t, &dfp.vt);
+}
+
 static inline void dfp_set_bcd_digit_64(ppc_vsr_t *t, uint8_t digit,
                                         unsigned n)
 {
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index fff7bd46ad..20041ce977 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -737,6 +737,7 @@ DEF_HELPER_3(dcffixq, void, env, fprp, fprp)
 DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
 DEF_HELPER_3(dctfix, void, env, fprp, fprp)
 DEF_HELPER_3(dctfixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCTFIXQQ, void, env, avr, fprp)
 DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
 DEF_HELPER_4(ddedpdq, void, env, fprp, fprp, i32)
 DEF_HELPER_4(denbcd, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 92ea2d0739..6d97f9ae3b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -47,6 +47,10 @@
 %x_frtp         22:4 !function=times_2
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
+&X_vrt_frbp     vrt frbp
+%x_frbp         12:4 !function=times_2
+@X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -128,6 +132,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 ### Decimal Floating-Point Conversion Instructions
 
 DCFFIXQQ        111111 ..... 00000 ..... 1111100010 -   @X_frtp_vrb
+DCTFIXQQ        111111 ..... 00001 ..... 1111100010 -   @X_vrt_frbp
 
 ## Vector Bit Manipulation Instruction
 
diff --git a/target/ppc/translate/dfp-impl.c.inc b/target/ppc/translate/dfp-impl.c.inc
index d5b66567a6..e149777481 100644
--- a/target/ppc/translate/dfp-impl.c.inc
+++ b/target/ppc/translate/dfp-impl.c.inc
@@ -247,3 +247,20 @@ static bool trans_DCFFIXQQ(DisasContext *ctx, arg_DCFFIXQQ *a)
 
     return true;
 }
+
+static bool trans_DCTFIXQQ(DisasContext *ctx, arg_DCTFIXQQ *a)
+{
+    TCGv_ptr rt, rb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, DFP);
+    REQUIRE_FPU(ctx);
+    REQUIRE_VECTOR(ctx);
+
+    rt = gen_avr_ptr(a->vrt);
+    rb = gen_fprp_ptr(a->frbp);
+    gen_helper_DCTFIXQQ(cpu_env, rt, rb);
+    tcg_temp_free_ptr(rt);
+    tcg_temp_free_ptr(rb);
+
+    return true;
+}
-- 
2.25.1


