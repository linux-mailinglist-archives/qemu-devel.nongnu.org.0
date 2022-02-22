Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDFE4BFB4F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:56:02 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWaA-0004Ht-0N
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJg-0004go-Jp; Tue, 22 Feb 2022 09:39:01 -0500
Received: from [187.72.171.209] (port=3932 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJe-00057A-Fc; Tue, 22 Feb 2022 09:39:00 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1C88B8000A7;
 Tue, 22 Feb 2022 11:37:38 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 04/47] target/ppc: vmulh* instructions without helpers
Date: Tue, 22 Feb 2022 11:36:02 -0300
Message-Id: <20220222143646.1268606-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:38.0531 (UTC)
 FILETIME=[BD656B30:01D827F9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Changed vmulhuw, vmulhud, vmulhsw, vmulhsd to not
use helpers.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
Changes in v4:
Changed from gvec to i64, this resulted in a better performance on
a Power host for all 4 instructions and a better performance for
vmulhsw and vmulhuw in x86, but a worse performance for vmulhsd and
vmulhud in a x86 host.
---
 target/ppc/helper.h                 |   4 -
 target/ppc/int_helper.c             |  35 --------
 target/ppc/translate/vmx-impl.c.inc | 123 +++++++++++++++++++++++++++-
 3 files changed, 119 insertions(+), 43 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5d11158f1f..d0c5a3fef1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -206,10 +206,6 @@ DEF_HELPER_3(VMULOUB, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUH, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUW, void, avr, avr, avr)
 DEF_HELPER_3(VMULOUD, void, avr, avr, avr)
-DEF_HELPER_3(VMULHSW, void, avr, avr, avr)
-DEF_HELPER_3(VMULHUW, void, avr, avr, avr)
-DEF_HELPER_3(VMULHSD, void, avr, avr, avr)
-DEF_HELPER_3(VMULHUD, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 8ddeccef12..64c87d9418 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1113,41 +1113,6 @@ void helper_VMULOUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     mulu64(&r->VsrD(1), &r->VsrD(0), a->VsrD(1), b->VsrD(1));
 }
 
-void helper_VMULHSW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i = 0; i < 4; i++) {
-        r->s32[i] = (int32_t)(((int64_t)a->s32[i] * (int64_t)b->s32[i]) >> 32);
-    }
-}
-
-void helper_VMULHUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i = 0; i < 4; i++) {
-        r->u32[i] = (uint32_t)(((uint64_t)a->u32[i] *
-                               (uint64_t)b->u32[i]) >> 32);
-    }
-}
-
-void helper_VMULHSD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    uint64_t discard;
-
-    muls64(&discard, &r->u64[0], a->s64[0], b->s64[0]);
-    muls64(&discard, &r->u64[1], a->s64[1], b->s64[1]);
-}
-
-void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    uint64_t discard;
-
-    mulu64(&discard, &r->u64[0], a->u64[0], b->u64[0]);
-    mulu64(&discard, &r->u64[1], a->u64[1], b->u64[1]);
-}
-
 void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
                   ppc_avr_t *c)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 62d0642226..3951ae124a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2126,10 +2126,125 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_helper, gen_helper_VMULOSD)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_helper, gen_helper_VMULEUD)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_helper, gen_helper_VMULOUD)
 
-TRANS_FLAGS2(ISA310, VMULHSW, do_vx_helper, gen_helper_VMULHSW)
-TRANS_FLAGS2(ISA310, VMULHSD, do_vx_helper, gen_helper_VMULHSD)
-TRANS_FLAGS2(ISA310, VMULHUW, do_vx_helper, gen_helper_VMULHUW)
-TRANS_FLAGS2(ISA310, VMULHUD, do_vx_helper, gen_helper_VMULHUD)
+static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
+{
+    TCGv_i64 hh, lh, temp;
+
+    uint64_t c;
+    hh = tcg_temp_new_i64();
+    lh = tcg_temp_new_i64();
+    temp = tcg_temp_new_i64();
+
+    c = 0xFFFFFFFF;
+
+    if (sign) {
+        tcg_gen_ext32s_i64(lh, a);
+        tcg_gen_ext32s_i64(temp, b);
+    } else {
+        tcg_gen_andi_i64(lh, a, c);
+        tcg_gen_andi_i64(temp, b, c);
+    }
+    tcg_gen_mul_i64(lh, lh, temp);
+
+    if (sign) {
+        tcg_gen_sari_i64(hh, a, 32);
+        tcg_gen_sari_i64(temp, b, 32);
+    } else {
+        tcg_gen_shri_i64(hh, a, 32);
+        tcg_gen_shri_i64(temp, b, 32);
+    }
+    tcg_gen_mul_i64(hh, hh, temp);
+
+    tcg_gen_shri_i64(lh, lh, 32);
+    tcg_gen_andi_i64(hh, hh, c << 32);
+    tcg_gen_or_i64(t, hh, lh);
+
+    tcg_temp_free_i64(hh);
+    tcg_temp_free_i64(lh);
+    tcg_temp_free_i64(temp);
+}
+
+static void do_vx_vmulhd_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
+{
+    TCGv_i64 a1, b1, mask, w, k;
+    void (*tcg_gen_shift_imm)(TCGv_i64, TCGv_i64, int64_t);
+
+    a1 = tcg_temp_new_i64();
+    b1 = tcg_temp_new_i64();
+    w  = tcg_temp_new_i64();
+    k  = tcg_temp_new_i64();
+    mask = tcg_temp_new_i64();
+    if (sign) {
+        tcg_gen_shift_imm = tcg_gen_sari_i64;
+    } else {
+        tcg_gen_shift_imm = tcg_gen_shri_i64;
+    }
+
+    tcg_gen_movi_i64(mask, 0xFFFFFFFF);
+    tcg_gen_and_i64(a1, a, mask);
+    tcg_gen_and_i64(b1, b, mask);
+    tcg_gen_mul_i64(t, a1, b1);
+    tcg_gen_shri_i64(k, t, 32);
+
+    tcg_gen_shift_imm(a1, a, 32);
+    tcg_gen_mul_i64(t, a1, b1);
+    tcg_gen_add_i64(t, t, k);
+    tcg_gen_and_i64(k, t, mask);
+    tcg_gen_shift_imm(w, t, 32);
+
+    tcg_gen_and_i64(a1, a, mask);
+    tcg_gen_shift_imm(b1, b, 32);
+    tcg_gen_mul_i64(t, a1, b1);
+    tcg_gen_add_i64(t, t, k);
+    tcg_gen_shift_imm(k, t, 32);
+
+    tcg_gen_shift_imm(a1, a, 32);
+    tcg_gen_mul_i64(t, a1, b1);
+    tcg_gen_add_i64(t, t, w);
+    tcg_gen_add_i64(t, t, k);
+
+    tcg_temp_free_i64(a1);
+    tcg_temp_free_i64(b1);
+    tcg_temp_free_i64(w);
+    tcg_temp_free_i64(k);
+    tcg_temp_free_i64(mask);
+}
+
+static bool do_vx_mulh(DisasContext *ctx, arg_VX *a, bool sign,
+                       void (*func)(TCGv_i64, TCGv_i64, TCGv_i64, bool))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    TCGv_i64 vra, vrb, vrt;
+    int i;
+
+    vra = tcg_temp_new_i64();
+    vrb = tcg_temp_new_i64();
+    vrt = tcg_temp_new_i64();
+
+    for (i = 0; i < 2; i++) {
+        get_avr64(vra, a->vra, i);
+        get_avr64(vrb, a->vrb, i);
+        get_avr64(vrt, a->vrt, i);
+
+        func(vrt, vra, vrb, sign);
+
+        set_avr64(a->vrt, vrt, i);
+    }
+
+    tcg_temp_free_i64(vra);
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(vrt);
+
+    return true;
+
+}
+
+TRANS(VMULHSW, do_vx_mulh, true , do_vx_vmulhw_i64)
+TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
+TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
+TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
-- 
2.25.1


