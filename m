Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D744537C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:03:08 +0100 (CET)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micOZ-0004zl-I9
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1q-0000Xj-A5; Thu, 04 Nov 2021 08:39:38 -0400
Received: from [201.28.113.2] (port=33857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic1n-0005sq-Pu; Thu, 04 Nov 2021 08:39:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6C571800BA7;
 Thu,  4 Nov 2021 09:39:17 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 05/25] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
Date: Thu,  4 Nov 2021 09:36:59 -0300
Message-Id: <20211104123719.323713-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:17.0840 (UTC)
 FILETIME=[FB9D7500:01D7D178]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implements the following PowerISA v3.1 instructions:
vinsblx: Vector Insert Byte from GPR using GPR-specified Left-Index
vinshlx: Vector Insert Halfword from GPR using GPR-specified Left-Index
vinswlx: Vector Insert Word from GPR using GPR-specified Left-Index
vinsdlx: Vector Insert Doubleword from GPR using GPR-specified
         Left-Index
vinsbrx: Vector Insert Byte from GPR using GPR-specified Right-Index
vinshrx: Vector Insert Halfword from GPR using GPR-specified
         Right-Index
vinswrx: Vector Insert Word from GPR using GPR-specified Right-Index
vinsdrx: Vector Insert Doubleword from GPR using GPR-specified
         Right-Index

The helpers and do_vinsx receive i64 to allow code sharing with the
future implementation of Vector Insert from VSR using GPR Index.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v3:
- Fixed helper endianness issue
---
 target/ppc/helper.h                 |  4 +++
 target/ppc/insn32.decode            |  9 ++++++
 target/ppc/int_helper.c             | 30 +++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 50 +++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0e99f8095c..80f88ce78b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -228,6 +228,10 @@ DEF_HELPER_3(vinsertb, void, avr, avr, i32)
 DEF_HELPER_3(vinserth, void, avr, avr, i32)
 DEF_HELPER_3(vinsertw, void, avr, avr, i32)
 DEF_HELPER_3(vinsertd, void, avr, avr, i32)
+DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
+DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
+DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
+DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
 DEF_HELPER_2(vextsb2w, void, avr, avr)
 DEF_HELPER_2(vextsh2w, void, avr, avr)
 DEF_HELPER_2(vextsb2d, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 257b11113d..b794424496 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -344,5 +344,14 @@ VPEXTD          000100 ..... ..... ..... 10110001101    @VX
 
 ## Vector Permute and Formatting Instruction
 
+VINSBLX         000100 ..... ..... ..... 01000001111    @VX
+VINSBRX         000100 ..... ..... ..... 01100001111    @VX
+VINSHLX         000100 ..... ..... ..... 01001001111    @VX
+VINSHRX         000100 ..... ..... ..... 01101001111    @VX
+VINSWLX         000100 ..... ..... ..... 01010001111    @VX
+VINSWRX         000100 ..... ..... ..... 01110001111    @VX
+VINSDLX         000100 ..... ..... ..... 01011001111    @VX
+VINSDRX         000100 ..... ..... ..... 01111001111    @VX
+
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 42541736f1..80b7f8814f 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1632,6 +1632,36 @@ VINSERT(h, u16)
 VINSERT(w, u32)
 VINSERT(d, u64)
 #undef VINSERT
+
+#if defined(HOST_WORDS_BIGENDIAN)
+#define ELEM_ADDR(VEC, IDX, SIZE) (&(VEC)->u8[IDX])
+#else
+#define ELEM_ADDR(VEC, IDX, SIZE) (&(VEC)->u8[15 - (IDX)] - (SIZE) + 1)
+#endif
+
+#define VINSX(SUFFIX, TYPE) \
+void glue(glue(helper_VINS, SUFFIX), LX)(CPUPPCState *env, ppc_avr_t *t,       \
+                                         uint64_t val, target_ulong index)     \
+{                                                                              \
+    const int maxidx = ARRAY_SIZE(t->u8) - sizeof(TYPE);                       \
+    target_long idx = index;                                                   \
+                                                                               \
+    if (idx < 0 || idx > maxidx) {                                             \
+        idx =  idx < 0 ? sizeof(TYPE) - idx : idx;                             \
+        qemu_log_mask(LOG_GUEST_ERROR,                                         \
+            "Invalid index for Vector Insert Element after 0x" TARGET_FMT_lx   \
+            ", RA = " TARGET_FMT_ld " > %d\n", env->nip, idx, maxidx);         \
+    } else {                                                                   \
+        TYPE src = val;                                                        \
+        memcpy(ELEM_ADDR(t, idx, sizeof(TYPE)), &src, sizeof(TYPE));           \
+    }                                                                          \
+}
+VINSX(B, uint8_t)
+VINSX(H, uint16_t)
+VINSX(W, uint32_t)
+VINSX(D, uint64_t)
+#undef ELEM_ADDR
+#undef VINSX
 #if defined(HOST_WORDS_BIGENDIAN)
 #define VEXTRACT(suffix, element)                                            \
     void helper_vextract##suffix(ppc_avr_t *r, ppc_avr_t *b, uint32_t index) \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 6edffd5637..21af60c616 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1238,6 +1238,56 @@ GEN_VXFORM_DUAL(vspltish, PPC_ALTIVEC, PPC_NONE,
 GEN_VXFORM_DUAL(vspltisw, PPC_ALTIVEC, PPC_NONE,
                 vinsertw, PPC_NONE, PPC2_ISA300);
 
+static bool do_vinsx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
+            TCGv_i64 rb, void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    TCGv_ptr t;
+    TCGv idx;
+
+    t = gen_avr_ptr(vrt);
+    idx = tcg_temp_new();
+
+    tcg_gen_andi_tl(idx, ra, 0xF);
+    if (right) {
+        tcg_gen_subfi_tl(idx, 16 - size, idx);
+    }
+
+    gen_helper(cpu_env, t, rb, idx);
+
+    tcg_temp_free_ptr(t);
+    tcg_temp_free(idx);
+
+    return true;
+}
+
+static bool do_vinsx_VX(DisasContext *ctx, arg_VX *a, int size, bool right,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    bool ok;
+    TCGv_i64 val;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    val = tcg_temp_new_i64();
+    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
+
+    ok = do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], val, gen_helper);
+
+    tcg_temp_free_i64(val);
+    return ok;
+}
+
+TRANS(VINSBLX, do_vinsx_VX, 1, false, gen_helper_VINSBLX)
+TRANS(VINSHLX, do_vinsx_VX, 2, false, gen_helper_VINSHLX)
+TRANS(VINSWLX, do_vinsx_VX, 4, false, gen_helper_VINSWLX)
+TRANS(VINSDLX, do_vinsx_VX, 8, false, gen_helper_VINSDLX)
+
+TRANS(VINSBRX, do_vinsx_VX, 1, true, gen_helper_VINSBLX)
+TRANS(VINSHRX, do_vinsx_VX, 2, true, gen_helper_VINSHLX)
+TRANS(VINSWRX, do_vinsx_VX, 4, true, gen_helper_VINSWLX)
+TRANS(VINSDRX, do_vinsx_VX, 8, true, gen_helper_VINSDLX)
+
 static void gen_vsldoi(DisasContext *ctx)
 {
     TCGv_ptr ra, rb, rd;
-- 
2.25.1


