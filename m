Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB0F52A4B2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:22:48 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy63-0008Md-T3
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwW2-0004dU-Jy; Tue, 17 May 2022 08:41:32 -0400
Received: from [187.72.171.209] (port=53711 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwW1-0004gP-1i; Tue, 17 May 2022 08:41:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:32 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8509C800C32;
 Tue, 17 May 2022 09:39:32 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 11/12] target/ppc: declare vmsumuhm helper with call flags
Date: Tue, 17 May 2022 09:39:28 -0300
Message-Id: <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:32.0786 (UTC)
 FILETIME=[28A98920:01D869EB]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move vmsumuhm and vmsumuhs to decodetree, declare vmsumuhm helper with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 ++--
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  5 ++---
 target/ppc/translate/vmx-impl.c.inc | 24 ++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f0761fe38d..5127851f2c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -242,8 +242,8 @@ DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumuhs, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fdb8d76456..43ea03c3e7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -601,6 +601,8 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 
 VMSUMUBM        000100 ..... ..... ..... ..... 100100   @VA
 VMSUMMBM        000100 ..... ..... ..... ..... 100101   @VA
+VMSUMUHM        000100 ..... ..... ..... ..... 100110   @VA
+VMSUMUHS        000100 ..... ..... ..... ..... 100111   @VA
 
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 85a7442103..9285a1c2a1 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -942,8 +942,7 @@ void helper_VMSUMUBM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     }
 }
 
-void helper_vmsumuhm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
-                     ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMSUMUHM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     uint32_t prod[8];
     int i;
@@ -957,7 +956,7 @@ void helper_vmsumuhm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMSUMUHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                      ppc_avr_t *b, ppc_avr_t *c)
 {
     uint32_t prod[8];
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4cbd724641..da81296b96 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2587,11 +2587,31 @@ static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19)
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
-
 TRANS_FLAGS(ALTIVEC, VMSUMUBM, do_va_helper, gen_helper_VMSUMUBM)
 TRANS_FLAGS(ALTIVEC, VMSUMMBM, do_va_helper, gen_helper_VMSUMMBM)
+TRANS_FLAGS(ALTIVEC, VMSUMUHM, do_va_helper, gen_helper_VMSUMUHM)
+
+static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr vrt, vra, vrb, vrc;
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vra = gen_avr_ptr(a->vra);
+    vrb = gen_avr_ptr(a->vrb);
+    vrc = gen_avr_ptr(a->rc);
+    gen_helper(cpu_env, vrt, vra, vrb, vrc);
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VMSUMUHS, do_va_env_helper, gen_helper_VMSUMUHS)
 
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 5b85322c06..15b3e06410 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -224,7 +224,6 @@ GEN_VXFORM_UIMM(vctsxs, 5, 15),
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
-GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
-- 
2.25.1


