Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3F509107
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:04:38 +0200 (CEST)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGZ1-0000hJ-Sv
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGC8-0004mP-FK; Wed, 20 Apr 2022 15:40:58 -0400
Received: from [187.72.171.209] (port=35275 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGC3-0007El-0H; Wed, 20 Apr 2022 15:40:54 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 16:40:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 664C8800059;
 Wed, 20 Apr 2022 16:40:40 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/9] target/ppc: Implemented vector divide instructions
Date: Wed, 20 Apr 2022 16:40:30 -0300
Message-Id: <20220420194037.263661-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
References: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 19:40:40.0657 (UTC)
 FILETIME=[84556C10:01D854EE]
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

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  7 +++
 target/ppc/translate/vmx-impl.c.inc | 85 +++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

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
index 764ac45409..0b18705c8e 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3236,6 +3236,91 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
 TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
 TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
+static bool do_vdiv_vmod(DisasContext *ctx, arg_VX *a, const int vece,
+                         void (*func_32)(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b),
+                         void (*func_64)(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b))
+{
+    const GVecGen3 op = {
+        .fni4 = func_32,
+        .fni8 = func_64,
+        .vece = vece
+    };
+
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op);
+
+    return true;
+}
+
+#define DIVU32(NAME, DIV)                                               \
+static void NAME(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)                    \
+{                                                                       \
+    TCGv_i32 zero = tcg_constant_i32(0);                                \
+    TCGv_i32 one = tcg_constant_i32(1);                                 \
+    tcg_gen_movcond_i32(TCG_COND_EQ, b, b, zero, one, b);               \
+    DIV(t, a, b);                                                       \
+}
+
+#define DIVS32(NAME, DIV)                                               \
+static void NAME(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)                    \
+{                                                                       \
+    TCGv_i32 t0 = tcg_temp_new_i32();                                   \
+    TCGv_i32 t1 = tcg_temp_new_i32();                                   \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t0, a, INT32_MIN);                \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t1, b, -1);                       \
+    tcg_gen_and_i32(t0, t0, t1);                                        \
+    tcg_gen_setcondi_i32(TCG_COND_EQ, t1, b, 0);                        \
+    tcg_gen_or_i32(t0, t0, t1);                                         \
+    tcg_gen_movi_i32(t1, 0);                                            \
+    tcg_gen_movcond_i32(TCG_COND_NE, b, t0, t1, t0, b);                 \
+    DIV(t, a, b);                                                       \
+    tcg_temp_free_i32(t0);                                              \
+    tcg_temp_free_i32(t1);                                              \
+}
+
+#define DIVU64(NAME, DIV)                                               \
+static void NAME(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)                    \
+{                                                                       \
+    TCGv_i64 zero = tcg_constant_i64(0);                                \
+    TCGv_i64 one = tcg_constant_i64(1);                                 \
+    tcg_gen_movcond_i64(TCG_COND_EQ, b, b, zero, one, b);               \
+    DIV(t, a, b);                                                       \
+}
+
+#define DIVS64(NAME, DIV)                                               \
+static void NAME(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)                    \
+{                                                                       \
+    TCGv_i64 t0 = tcg_temp_new_i64();                                   \
+    TCGv_i64 t1 = tcg_temp_new_i64();                                   \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t0, a, INT64_MIN);                \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, b, -1);                       \
+    tcg_gen_and_i64(t0, t0, t1);                                        \
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, b, 0);                        \
+    tcg_gen_or_i64(t0, t0, t1);                                         \
+    tcg_gen_movi_i64(t1, 0);                                            \
+    tcg_gen_movcond_i64(TCG_COND_NE, b, t0, t1, t0, b);                 \
+    DIV(t, a, b);                                                       \
+    tcg_temp_free_i64(t0);                                              \
+    tcg_temp_free_i64(t1);                                              \
+}
+
+DIVS32(do_divsw, tcg_gen_div_i32)
+DIVU32(do_divuw, tcg_gen_divu_i32)
+DIVS64(do_divsd, tcg_gen_div_i64)
+DIVU64(do_divud, tcg_gen_divu_i64)
+
+TRANS_FLAGS2(ISA310, VDIVSW, do_vdiv_vmod, MO_32, do_divsw, NULL)
+TRANS_FLAGS2(ISA310, VDIVUW, do_vdiv_vmod, MO_32, do_divuw, NULL)
+TRANS_FLAGS2(ISA310, VDIVSD, do_vdiv_vmod, MO_64, NULL, do_divsd)
+TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
+
+#undef DIVS32
+#undef DIVU32
+#undef DIVS64
+#undef DIVU64
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.31.1


