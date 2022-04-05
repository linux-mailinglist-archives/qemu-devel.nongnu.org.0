Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CF4F3D7B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 22:03:27 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpOg-0002RS-9q
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 16:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHj-0003r7-5Z; Tue, 05 Apr 2022 15:56:15 -0400
Received: from [187.72.171.209] (port=24543 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHh-00049c-H8; Tue, 05 Apr 2022 15:56:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 5 Apr 2022 16:56:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3584B8000CB;
 Tue,  5 Apr 2022 16:56:02 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/9] target/ppc: Implemented vector divide instructions
Date: Tue,  5 Apr 2022 16:55:51 -0300
Message-Id: <20220405195558.66144-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2022 19:56:02.0745 (UTC)
 FILETIME=[2DBEA290:01D84927]
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
 target/ppc/insn32.decode            |  7 ++++
 target/ppc/translate/vmx-impl.c.inc | 59 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index 6101bca3fd..be35d6fdf3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3236,6 +3236,65 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
 TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
 TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
+#define TRANS_VDIV_VMOD(FLAGS, NAME, VECE, FNI4_FUNC, FNI8_FUNC)        \
+static bool trans_##NAME(DisasContext *ctx, arg_VX *a)                  \
+{                                                                       \
+    static const GVecGen3 op = {                                        \
+        .fni4 = FNI4_FUNC,                                              \
+        .fni8 = FNI8_FUNC,                                              \
+        .vece = VECE                                                    \
+    };                                                                  \
+                                                                        \
+    REQUIRE_VECTOR(ctx);                                                \
+    REQUIRE_INSNS_FLAGS2(ctx, FLAGS);                                   \
+                                                                        \
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),    \
+                   avr_full_offset(a->vrb), 16, 16, &op);               \
+                                                                        \
+    return true;                                                        \
+}
+
+#define DO_VDIV_VMOD(NAME, SZ, DIV, SIGNED)                             \
+static void NAME(TCGv_i##SZ t, TCGv_i##SZ a, TCGv_i##SZ b)              \
+{                                                                       \
+    /*                                                                  \
+     *  If N/0 the instruction used by the backend might deliver        \
+     *  an invalid division signal to the process, so if b = 0 return   \
+     *  N/1 and if signed instruction, the same for a = int_min, b = -1 \
+     */                                                                 \
+    if (SIGNED) {                                                       \
+        TCGv_i##SZ t0 = tcg_temp_new_i##SZ();                           \
+        TCGv_i##SZ t1 = tcg_temp_new_i##SZ();                           \
+        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t0, a, INT##SZ##_MIN);      \
+        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, -1);                 \
+        tcg_gen_and_i##SZ(t0, t0, t1);                                  \
+        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, 0);                  \
+        tcg_gen_or_i##SZ(t0, t0, t1);                                   \
+        tcg_gen_movi_i##SZ(t1, 0);                                      \
+        tcg_gen_movcond_i##SZ(TCG_COND_NE, b, t0, t1, t0, b);           \
+        DIV(t, a, b);                                                   \
+        tcg_temp_free_i##SZ(t0);                                        \
+        tcg_temp_free_i##SZ(t1);                                        \
+    } else {                                                            \
+        TCGv_i##SZ zero = tcg_constant_i##SZ(0);                        \
+        TCGv_i##SZ one = tcg_constant_i##SZ(1);                         \
+        tcg_gen_movcond_i##SZ(TCG_COND_EQ, b, b, zero, one, b);         \
+        DIV(t, a, b);                                                   \
+    }                                                                   \
+}
+
+DO_VDIV_VMOD(do_divsw, 32, tcg_gen_div_i32, true)
+DO_VDIV_VMOD(do_divuw, 32, tcg_gen_divu_i32, false)
+DO_VDIV_VMOD(do_divsd, 64, tcg_gen_div_i64, true)
+DO_VDIV_VMOD(do_divud, 64, tcg_gen_divu_i64, false)
+
+TRANS_VDIV_VMOD(ISA310, VDIVSW, MO_32, do_divsw, NULL)
+TRANS_VDIV_VMOD(ISA310, VDIVUW, MO_32, do_divuw, NULL)
+TRANS_VDIV_VMOD(ISA310, VDIVSD, MO_64, NULL, do_divsd)
+TRANS_VDIV_VMOD(ISA310, VDIVUD, MO_64, NULL, do_divud)
+
+#undef DO_VDIV_VMOD
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.31.1


