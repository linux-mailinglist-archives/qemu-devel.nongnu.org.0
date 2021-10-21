Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99404436BCE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:11:11 +0200 (CEST)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeP8-0007Xk-K3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde5s-0000JS-Hn; Thu, 21 Oct 2021 15:51:16 -0400
Received: from [201.28.113.2] (port=62474 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde5n-0003ye-St; Thu, 21 Oct 2021 15:51:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id AC63980012A;
 Thu, 21 Oct 2021 16:47:01 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 19/33] target/ppc: Implement Vector Extract Double to VSR
 using GPR index insns
Date: Thu, 21 Oct 2021 16:45:33 -0300
Message-Id: <20211021194547.672988-20-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:02.0195 (UTC)
 FILETIME=[6AFAC030:01D7C6B4]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vextdubvlx: Vector Extract Double Unsigned Byte to VSR using
            GPR-specified Left-Index
vextduhvlx: Vector Extract Double Unsigned Halfword to VSR using
            GPR-specified Left-Index
vextduwvlx: Vector Extract Double Unsigned Word to VSR using
            GPR-specified Left-Index
vextddvlx: Vector Extract Double Unsigned Doubleword to VSR using
           GPR-specified Left-Index
vextdubvrx: Vector Extract Double Unsigned Byte to VSR using
            GPR-specified Right-Index
vextduhvrx: Vector Extract Double Unsigned Halfword to VSR using
            GPR-specified Right-Index
vextduwvrx: Vector Extract Double Unsigned Word to VSR using
            GPR-specified Right-Index
vextddvrx: Vector Extract Double Unsigned Doubleword to VSR using
           GPR-specified Right-Index

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 +++
 target/ppc/insn32.decode            | 12 +++++++++
 target/ppc/int_helper.c             | 41 ++++++++++++++++++++++++++++-
 target/ppc/translate/vmx-impl.c.inc | 37 ++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 53c65ca1c7..ac8ab7e436 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -336,6 +336,10 @@ DEF_HELPER_2(vextuwlx, tl, tl, avr)
 DEF_HELPER_2(vextubrx, tl, tl, avr)
 DEF_HELPER_2(vextuhrx, tl, tl, avr)
 DEF_HELPER_2(vextuwrx, tl, tl, avr)
+DEF_HELPER_5(VEXTDUBVLX, void, env, avr, avr, avr, tl)
+DEF_HELPER_5(VEXTDUHVLX, void, env, avr, avr, avr, tl)
+DEF_HELPER_5(VEXTDUWVLX, void, env, avr, avr, avr, tl)
+DEF_HELPER_5(VEXTDDVLX, void, env, avr, avr, avr, tl)
 
 DEF_HELPER_2(vsbox, void, avr, avr)
 DEF_HELPER_3(vcipher, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2eb7fb4e92..e438177b32 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -38,6 +38,9 @@
 %dx_d           6:s10 16:5 0:1
 @DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
 
+&VA             vrt vra vrb rc
+@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
+
 &VN             vrt vra vrb sh
 @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
 
@@ -347,6 +350,15 @@ VPEXTD          000100 ..... ..... ..... 10110001101    @VX
 
 ## Vector Permute and Formatting Instruction
 
+VEXTDUBVLX      000100 ..... ..... ..... ..... 011000   @VA
+VEXTDUBVRX      000100 ..... ..... ..... ..... 011001   @VA
+VEXTDUHVLX      000100 ..... ..... ..... ..... 011010   @VA
+VEXTDUHVRX      000100 ..... ..... ..... ..... 011011   @VA
+VEXTDUWVLX      000100 ..... ..... ..... ..... 011100   @VA
+VEXTDUWVRX      000100 ..... ..... ..... ..... 011101   @VA
+VEXTDDVLX       000100 ..... ..... ..... ..... 011110   @VA
+VEXTDDVRX       000100 ..... ..... ..... ..... 011111   @VA
+
 VINSERTB        000100 ..... - .... ..... 01100001101   @VX_uim4
 VINSERTH        000100 ..... - .... ..... 01101001101   @VX_uim4
 VINSERTW        000100 ..... - .... ..... 01110001101   @VX_uim4
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 5a925a564d..1577ea8788 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1673,8 +1673,47 @@ VINSX(B, uint8_t)
 VINSX(H, uint16_t)
 VINSX(W, uint32_t)
 VINSX(D, uint64_t)
-#undef ELEM_ADDR
 #undef VINSX
+#define VEXTDVLX(NAME, TYPE) \
+void glue(glue(helper_VEXTD, NAME), VLX)(CPUPPCState *env, ppc_avr_t *t,       \
+                                         ppc_avr_t *a, ppc_avr_t *b,           \
+                                         target_ulong index)                   \
+{                                                                              \
+    const int array_size = ARRAY_SIZE(t->u8), elem_size = sizeof(TYPE);        \
+    const target_long idx = index;                                             \
+                                                                               \
+    if (idx < 0) {                                                             \
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VEXTD" #NAME "VRX at"\
+            " 0x" TARGET_FMT_lx ", RC = " TARGET_FMT_ld " > %d\n", env->nip,   \
+            32 - elem_size - idx, 32 - elem_size);                             \
+    } else if (idx + elem_size <= array_size) {                                \
+        t->VsrD(0) = *(TYPE *)ELEM_ADDR(a, idx, elem_size);                    \
+        t->VsrD(1) = 0;                                                        \
+    } else if (idx < array_size) {                                             \
+        ppc_avr_t tmp = { .u64 = { 0, 0 } };                                   \
+        const int len_a = array_size - idx, len_b = elem_size - len_a;         \
+                                                                               \
+        memmove(ELEM_ADDR(&tmp, array_size / 2 - elem_size, len_a),            \
+                ELEM_ADDR(a, idx, len_a), len_a);                              \
+        memmove(ELEM_ADDR(&tmp, array_size / 2 - len_b, len_b),                \
+                ELEM_ADDR(b, 0, len_b), len_b);                                \
+                                                                               \
+        *t = tmp;                                                              \
+    } else if (idx + elem_size <= 2 * array_size) {                            \
+        t->VsrD(0) = *(TYPE *)ELEM_ADDR(b, idx - array_size, elem_size);       \
+        t->VsrD(1) = 0;                                                        \
+    } else {                                                                   \
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VEXTD" #NAME "VLX at"\
+            " 0x" TARGET_FMT_lx ", RC = " TARGET_FMT_ld " > %d\n", env->nip,   \
+            idx, 32 - elem_size);                                              \
+    }                                                                          \
+}
+VEXTDVLX(UB, uint8_t)
+VEXTDVLX(UH, uint16_t)
+VEXTDVLX(UW, uint32_t)
+VEXTDVLX(D, uint64_t)
+#undef ELEM_ADDR
+#undef VEXTDVLX
 #if defined(HOST_WORDS_BIGENDIAN)
 #define VEXTRACT(suffix, element)                                            \
     void helper_vextract##suffix(ppc_avr_t *r, ppc_avr_t *b, uint32_t index) \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7f98875192..b361f73a67 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1228,6 +1228,43 @@ GEN_VXFORM_DUAL(vsplth, PPC_ALTIVEC, PPC_NONE,
 GEN_VXFORM_DUAL(vspltw, PPC_ALTIVEC, PPC_NONE,
                 vextractuw, PPC_NONE, PPC2_ISA300);
 
+static bool do_vextdx(DisasContext *ctx, arg_VA *a, int size, bool right,
+               void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv))
+{
+    TCGv_ptr vrt, vra, vrb;
+    TCGv rc;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vra = gen_avr_ptr(a->vra);
+    vrb = gen_avr_ptr(a->vrb);
+    rc = tcg_temp_new();
+
+    tcg_gen_andi_tl(rc, cpu_gpr[a->rc], 0x1F);
+    if (right) {
+        tcg_gen_subfi_tl(rc, 32 - size, rc);
+    }
+    gen_helper(cpu_env, vrt, vra, vrb, rc);
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free(rc);
+    return true;
+}
+
+TRANS(VEXTDUBVLX, do_vextdx, 1, false, gen_helper_VEXTDUBVLX)
+TRANS(VEXTDUHVLX, do_vextdx, 2, false, gen_helper_VEXTDUHVLX)
+TRANS(VEXTDUWVLX, do_vextdx, 4, false, gen_helper_VEXTDUWVLX)
+TRANS(VEXTDDVLX, do_vextdx, 8, false, gen_helper_VEXTDDVLX)
+
+TRANS(VEXTDUBVRX, do_vextdx, 1, true, gen_helper_VEXTDUBVLX)
+TRANS(VEXTDUHVRX, do_vextdx, 2, true, gen_helper_VEXTDUHVLX)
+TRANS(VEXTDUWVRX, do_vextdx, 4, true, gen_helper_VEXTDUWVLX)
+TRANS(VEXTDDVRX, do_vextdx, 8, true, gen_helper_VEXTDDVLX)
+
 static bool do_vinsx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
             TCGv_i64 rb, void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
 {
-- 
2.25.1


