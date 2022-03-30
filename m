Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490904ECDF8
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:31:15 +0200 (CEST)
Received: from localhost ([::1]:46796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZeyI-0008AB-Ap
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:31:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuH-0004B0-4r; Wed, 30 Mar 2022 16:27:05 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuF-0001WS-HI; Wed, 30 Mar 2022 16:27:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6917E8002AF;
 Wed, 30 Mar 2022 17:25:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 03/10] target/ppc: Implemented vector divide instructions
Date: Wed, 30 Mar 2022 17:25:08 -0300
Message-Id: <20220330202515.66554-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:37.0887 (UTC)
 FILETIME=[51554EF0:01D84474]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivsw: Vector Divide Signed Word
vdivuw: Vector Divide Unsigned Word 
vdivsd: Vector Divide Signed Doubleword
vdivud: Vector Divide Unsigned Doubleword

Hardware behavior based on mambo

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ac2d3da9a7..597768558b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -703,3 +703,10 @@ XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
 RFEBB           010011-------------- .   0010010010 -   @XL_s
+
+## Vector Division Instructions
+
+VDIVSW          000100 ..... ..... ..... 00110001011    @VX
+VDIVUW          000100 ..... ..... ..... 00010001011    @VX
+VDIVSD          000100 ..... ..... ..... 00111001011    @VX
+VDIVUD          000100 ..... ..... ..... 00011001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 6101bca3fd..d96e804abb 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3236,6 +3236,55 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
 TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
 TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
+#define TRANS_VDIV_VMOD(FLAGS, NAME, VECE, FNI4_FUNC, FNI8_FUNC)        \
+static bool trans_##NAME(DisasContext *ctx, arg_VX *a)                  \
+{                                                                       \
+    static const GVecGen3 op[2] = {                                     \
+        {                                                               \
+            .fni4 = FNI4_FUNC,                                          \
+            .fni8 = FNI8_FUNC,                                          \
+            .vece = MO_32                                               \
+        },                                                              \
+        {                                                               \
+            .fni4 = FNI4_FUNC,                                          \
+            .fni8 = FNI8_FUNC,                                          \
+            .vece = MO_64                                               \
+        },                                                              \
+    };                                                                  \
+                                                                        \
+    REQUIRE_VECTOR(ctx);                                                \
+    REQUIRE_INSNS_FLAGS2(ctx, FLAGS);                                   \
+                                                                        \
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),    \
+                   avr_full_offset(a->vrb), 16, 16, &op[VECE - MO_32]); \
+                                                                        \
+    return true;                                                        \
+}
+
+#define DIV_VEC(NAME, SZ, DIV)                                          \
+static void do_vx_##NAME(TCGv_##SZ t, TCGv_##SZ a, TCGv_##SZ b)         \
+{                                                                       \
+    TCGv_##SZ zero = tcg_constant_##SZ(0), one = tcg_constant_##SZ(1);  \
+    /*                                                                  \
+     *  If N/0 the instruction used by the backend might deliver        \
+     *  a signal to the process and the hardware returns 0 when         \
+     *  N/0, so if b = 0 return 0/1                                     \
+     */                                                                 \
+    tcg_gen_movcond_##SZ(TCG_COND_EQ, a, b, zero, zero, a);             \
+    tcg_gen_movcond_##SZ(TCG_COND_EQ, b, b, zero, one, b);              \
+    DIV(t, a, b);                                                       \
+}
+
+DIV_VEC(div_i32 , i32, tcg_gen_div_i32)
+DIV_VEC(divu_i32, i32, tcg_gen_divu_i32)
+DIV_VEC(div_i64 , i64, tcg_gen_div_i64)
+DIV_VEC(divu_i64, i64, tcg_gen_divu_i64)
+
+TRANS_VDIV_VMOD(ISA310, VDIVSW, MO_32, do_vx_div_i32 , NULL)
+TRANS_VDIV_VMOD(ISA310, VDIVUW, MO_32, do_vx_divu_i32, NULL)
+TRANS_VDIV_VMOD(ISA310, VDIVSD, MO_64, NULL, do_vx_div_i64)
+TRANS_VDIV_VMOD(ISA310, VDIVUD, MO_64, NULL, do_vx_divu_i64)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.31.1


