Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B444A6C1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:19:01 +0100 (CET)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKTE-0003Th-Bm
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3l-0004UG-F2; Tue, 09 Nov 2021 00:52:44 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:60631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3h-0006h7-W0; Tue, 09 Nov 2021 00:52:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp1NmWz4xds; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=T0pNzU+2355ov3ASQRdDwuPooB/sI2v8CbvaHhv5LyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eHcmjbo21xC9M2S3e0ixLAeC/9TraQ+MYV6TUkXvhQh+7VyovVqVHa1lqZFlJCqoR
 6GPrh2Mcp9QGgOo5XQBkkg92JM0Xwx2vdPcUXrH1cEH7NyHDLi7kDZmoVubA8PixTD
 VrSHcYALjtMC3HmZZ/jLvdcTr7TxeEfRxGFE0vWE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 17/54] target/ppc: Implement DCTFIXQQ
Date: Tue,  9 Nov 2021 16:51:27 +1100
Message-Id: <20211109055204.230765-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Implement the following PowerISA v3.1 instruction:
dctfixqq: DFP Convert To Fixed Quadword Quad

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-8-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c             | 52 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  1 +
 target/ppc/insn32.decode            |  5 +++
 target/ppc/translate/dfp-impl.c.inc | 17 ++++++++++
 4 files changed, 75 insertions(+)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index 6b837c4450..6ab46d7db5 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -51,6 +51,11 @@ static void set_dfp128(ppc_fprp_t *dfp, ppc_vsr_t *src)
     dfp[1].VsrD(0) = src->VsrD(1);
 }
 
+static void set_dfp128_to_avr(ppc_avr_t *dst, ppc_vsr_t *src)
+{
+    *dst = *src;
+}
+
 struct PPC_DFP {
     CPUPPCState *env;
     ppc_vsr_t vt, va, vb;
@@ -1020,6 +1025,53 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)              \
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
index 8e4f67ceac..3812bb0270 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -739,6 +739,7 @@ DEF_HELPER_3(dcffixq, void, env, fprp, fprp)
 DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)
 DEF_HELPER_3(dctfix, void, env, fprp, fprp)
 DEF_HELPER_3(dctfixq, void, env, fprp, fprp)
+DEF_HELPER_3(DCTFIXQQ, void, env, avr, fprp)
 DEF_HELPER_4(ddedpd, void, env, fprp, fprp, i32)
 DEF_HELPER_4(ddedpdq, void, env, fprp, fprp, i32)
 DEF_HELPER_4(denbcd, void, env, fprp, fprp, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 36586dfa59..33463c14ea 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -54,6 +54,10 @@
 %x_frtp         22:4 !function=times_2
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
 
+&X_vrt_frbp     vrt frbp
+%x_frbp         12:4 !function=times_2
+@X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
+
 ### Fixed-Point Load Instructions
 
 LBZ             100010 ..... ..... ................     @D
@@ -167,6 +171,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
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
2.33.1


