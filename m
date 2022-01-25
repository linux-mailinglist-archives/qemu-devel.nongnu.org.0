Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEF749B4A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:10:22 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLaX-0006qj-KD
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7I-0000kL-GE; Tue, 25 Jan 2022 07:40:13 -0500
Received: from [187.72.171.209] (port=18692 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7E-0006sH-TU; Tue, 25 Jan 2022 07:40:08 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2968F8009AB;
 Tue, 25 Jan 2022 09:20:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 04/38] target/ppc: vmulh* instructions use gvec
Date: Tue, 25 Jan 2022 09:19:09 -0300
Message-Id: <20220125121943.3269077-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:35.0568 (UTC)
 FILETIME=[F48FD700:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Changed vmulhuw, vmulhud, vmulhsw, vmulhsd to use
gvec instructions

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |   8 +-
 target/ppc/int_helper.c             |   8 +-
 target/ppc/translate/vmx-impl.c.inc | 154 +++++++++++++++++++++++++++-
 3 files changed, 158 insertions(+), 12 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 02eda1c137..96c113fe1c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -207,10 +207,10 @@ DEF_HELPER_3(VMULOUB, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUH, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUW, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUD, void, avr, avr, avr)
-DEF_HELPER_3(VMULHSW, void, avr, avr, avr)
-DEF_HELPER_3(VMULHUW, void, avr, avr, avr)
-DEF_HELPER_3(VMULHSD, void, avr, avr, avr)
-DEF_HELPER_3(VMULHUD, void, avr, avr, avr)
+DEF_HELPER_4(VMULHSW, void, avr, avr, avr, i32)
+DEF_HELPER_4(VMULHUW, void, avr, avr, avr, i32)
+DEF_HELPER_4(VMULHSD, void, avr, avr, avr, i32)
+DEF_HELPER_4(VMULHUD, void, avr, avr, avr, i32)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index e134162fdd..79cde68f19 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1200,7 +1200,7 @@ void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
 }
 
-void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
 {
     int i;
 
@@ -1209,7 +1209,7 @@ void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
-void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
 {
     int i;
 
@@ -1219,7 +1219,7 @@ void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
-void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
 {
     uint64_t discard;
 
@@ -1227,7 +1227,7 @@ void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     muls64(&discard, &r->u64[1], a->s64[1], b->s64[1]);
 }
 
-void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
 {
     uint64_t discard;
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 62d0642226..bed8df81c4 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2126,10 +2126,156 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_helper, gen_helper_VMULOSD)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_helper, gen_helper_VMULEUD)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_helper, gen_helper_VMULOUD)
 
-TRANS_FLAGS2(ISA310, VMULHSW, do_vx_helper, gen_helper_VMULHSW)
-TRANS_FLAGS2(ISA310, VMULHSD, do_vx_helper, gen_helper_VMULHSD)
-TRANS_FLAGS2(ISA310, VMULHUW, do_vx_helper, gen_helper_VMULHUW)
-TRANS_FLAGS2(ISA310, VMULHUD, do_vx_helper, gen_helper_VMULHUD)
+static void do_vx_vmulhu_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec a1, b1, mask, w, k;
+    unsigned bits;
+    bits = (vece == MO_32) ? 16 : 32;
+
+    a1 = tcg_temp_new_vec_matching(t);
+    b1 = tcg_temp_new_vec_matching(t);
+    w  = tcg_temp_new_vec_matching(t);
+    k  = tcg_temp_new_vec_matching(t);
+    mask = tcg_temp_new_vec_matching(t);
+
+    tcg_gen_dupi_vec(vece, mask, (vece == MO_32) ? 0xFFFF : 0xFFFFFFFF);
+    tcg_gen_and_vec(vece, a1, a, mask);
+    tcg_gen_and_vec(vece, b1, b, mask);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_shri_vec(vece, k, t, bits);
+
+    tcg_gen_shri_vec(vece, a1, a, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, k);
+    tcg_gen_and_vec(vece, k, t, mask);
+    tcg_gen_shri_vec(vece, w, t, bits);
+
+    tcg_gen_and_vec(vece, a1, a, mask);
+    tcg_gen_shri_vec(vece, b1, b, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, k);
+    tcg_gen_shri_vec(vece, k, t, bits);
+
+    tcg_gen_shri_vec(vece, a1, a, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, w);
+    tcg_gen_add_vec(vece, t, t, k);
+
+    tcg_temp_free_vec(a1);
+    tcg_temp_free_vec(b1);
+    tcg_temp_free_vec(w);
+    tcg_temp_free_vec(k);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vx_mulhu(DisasContext *ctx, arg_VX *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, INDEX_op_add_vec, INDEX_op_shri_vec, 0
+    };
+
+    static const GVecGen3 op[2] = {
+        {
+            .fniv = do_vx_vmulhu_vec,
+            .fno  = gen_helper_VMULHUW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = do_vx_vmulhu_vec,
+            .fno  = gen_helper_VMULHUD,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                    avr_full_offset(a->vrb), 16, 16, &op[vece - MO_32]);
+
+    return true;
+
+}
+
+static void do_vx_vmulhs_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec a1, b1, mask, w, k;
+    unsigned bits;
+    bits = (vece == MO_32) ? 16 : 32;
+
+    a1 = tcg_temp_new_vec_matching(t);
+    b1 = tcg_temp_new_vec_matching(t);
+    w  = tcg_temp_new_vec_matching(t);
+    k  = tcg_temp_new_vec_matching(t);
+    mask = tcg_temp_new_vec_matching(t);
+
+    tcg_gen_dupi_vec(vece, mask, (vece == MO_32) ? 0xFFFF : 0xFFFFFFFF);
+    tcg_gen_and_vec(vece, a1, a, mask);
+    tcg_gen_and_vec(vece, b1, b, mask);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_shri_vec(vece, k, t, bits);
+
+    tcg_gen_sari_vec(vece, a1, a, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, k);
+    tcg_gen_and_vec(vece, k, t, mask);
+    tcg_gen_sari_vec(vece, w, t, bits);
+
+    tcg_gen_and_vec(vece, a1, a, mask);
+    tcg_gen_sari_vec(vece, b1, b, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, k);
+    tcg_gen_sari_vec(vece, k, t, bits);
+
+    tcg_gen_sari_vec(vece, a1, a, bits);
+    tcg_gen_mul_vec(vece, t, a1, b1);
+    tcg_gen_add_vec(vece, t, t, w);
+    tcg_gen_add_vec(vece, t, t, k);
+
+    tcg_temp_free_vec(a1);
+    tcg_temp_free_vec(b1);
+    tcg_temp_free_vec(w);
+    tcg_temp_free_vec(k);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vx_mulhs(DisasContext *ctx, arg_VX *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_mul_vec, INDEX_op_add_vec, INDEX_op_shri_vec,
+        INDEX_op_sari_vec, 0
+    };
+
+    static const GVecGen3 op[2] = {
+        {
+            .fniv = do_vx_vmulhs_vec,
+            .fno  = gen_helper_VMULHSW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = do_vx_vmulhs_vec,
+            .fno  = gen_helper_VMULHSD,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                    avr_full_offset(a->vrb), 16, 16, &op[vece - MO_32]);
+
+    return true;
+}
+
+TRANS(VMULHSW, do_vx_mulhs, MO_32)
+TRANS(VMULHSD, do_vx_mulhs, MO_64)
+TRANS(VMULHUW, do_vx_mulhu, MO_32)
+TRANS(VMULHUD, do_vx_mulhu, MO_64)
 
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
-- 
2.25.1


