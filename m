Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E24C50E1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:48:48 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiSF-0001JP-G8
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhqp-0007uB-Bs; Fri, 25 Feb 2022 16:10:11 -0500
Received: from [187.72.171.209] (port=25884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhqn-0003De-Aj; Fri, 25 Feb 2022 16:10:07 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A1A6B8006BB;
 Fri, 25 Feb 2022 18:09:47 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 04/49] target/ppc: vmulh* instructions without helpers
Date: Fri, 25 Feb 2022 18:08:51 -0300
Message-Id: <20220225210936.1749575-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:48.0068 (UTC)
 FILETIME=[05551640:01D82A8C]
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
 target/ppc/helper.h                 |  4 --
 target/ppc/int_helper.c             | 35 -----------
 target/ppc/translate/vmx-impl.c.inc | 91 +++++++++++++++++++++++++++--
 3 files changed, 87 insertions(+), 43 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4ff71b2fa3..a223d6ce92 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -202,10 +202,6 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHSD, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(VMULHUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 873f957bf4..46ef3ffb3f 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1097,41 +1097,6 @@ VMUL(UW, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
 
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
index d493de3629..97a075efd1 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2151,10 +2151,93 @@ TRANS_FLAGS2(ISA310, VMULOSD, do_vx_vmuleo, false, tcg_gen_muls2_i64)
 TRANS_FLAGS2(ISA310, VMULEUD, do_vx_vmuleo, true , tcg_gen_mulu2_i64)
 TRANS_FLAGS2(ISA310, VMULOUD, do_vx_vmuleo, false, tcg_gen_mulu2_i64)
 
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
+    TCGv_i64 tlow;
+
+    tlow  = tcg_temp_new_i64();
+    if (sign) {
+        tcg_gen_muls2_i64(tlow, t, a, b);
+    } else {
+        tcg_gen_mulu2_i64(tlow, t, a, b);
+    }
+
+    tcg_temp_free_i64(tlow);
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


