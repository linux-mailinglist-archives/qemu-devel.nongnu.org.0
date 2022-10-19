Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C3604666
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:28 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8p5-0007Zn-20
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YG-00055J-Ma; Wed, 19 Oct 2022 08:52:07 -0400
Received: from [200.168.210.66] (port=3639 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YE-00025u-N9; Wed, 19 Oct 2022 08:52:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B25EB800150;
 Wed, 19 Oct 2022 09:50:42 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 02/12] target/ppc: Move VMH[R]ADDSHS instruction to
 decodetree
Date: Wed, 19 Oct 2022 09:50:30 -0300
Message-Id: <20221019125040.48028-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:43.0046 (UTC)
 FILETIME=[66325860:01D8E3B9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch moves VMHADDSHS and VMHRADDSHS to decodetree I couldn't find
a satisfactory implementation with TCG inline.

vmhaddshs:
rept    loop    master             patch
8       12500   0,02983400         0,02648500 (-11.2%)
25      4000    0,02946000         0,02518000 (-14.5%)
100     1000    0,03104300         0,02638000 (-15.0%)
500     200     0,04002000         0,03502500 (-12.5%)
2500    40      0,08090100         0,07562200 (-6.5%)
8000    12      0,19242600         0,18626800 (-3.2%)

vmhraddshs:
rept    loop    master             patch
8       12500   0,03078600         0,02851000 (-7.4%)
25      4000    0,02793200         0,02746900 (-1.7%)
100     1000    0,02886000         0,02839900 (-1.6%)
500     200     0,03714700         0,03799200 (+2.3%)
2500    40      0,07948000         0,07852200 (-1.2%)
8000    12      0,19049800         0,18813900 (-1.2%)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 | 4 ++--
 target/ppc/insn32.decode            | 2 ++
 target/ppc/int_helper.c             | 4 ++--
 target/ppc/translate/vmx-impl.c.inc | 5 +++--
 target/ppc/translate/vmx-ops.c.inc  | 1 -
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9c562ab00e..f02a9497b7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -258,8 +258,8 @@ DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
+DEF_HELPER_5(VMHADDSHS, void, env, avr, avr, avr, avr)
+DEF_HELPER_5(VMHRADDSHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7445455a12..9a509e84df 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -694,6 +694,8 @@ VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
 VMLADDUHM       000100 ..... ..... ..... ..... 100010   @VA
+VMHADDSHS       000100 ..... ..... ..... ..... 100000   @VA
+VMHRADDSHS      000100 ..... ..... ..... ..... 100001   @VA
 
 ## Vector String Instructions
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 0d25000b2a..ae1ba8084d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -939,7 +939,7 @@ target_ulong helper_vctzlsbb(ppc_avr_t *r)
     return count;
 }
 
-void helper_vmhaddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMHADDSHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                       ppc_avr_t *b, ppc_avr_t *c)
 {
     int sat = 0;
@@ -957,7 +957,7 @@ void helper_vmhaddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmhraddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMHRADDSHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                        ppc_avr_t *b, ppc_avr_t *c)
 {
     int sat = 0;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 9f18c6d4f2..3acd585a2f 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2521,7 +2521,7 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
         tcg_temp_free_ptr(rd);                                          \
     }
 
-GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16)
+GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
 static bool do_va_helper(DisasContext *ctx, arg_VA *a,
     void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
@@ -2620,7 +2620,8 @@ static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
 TRANS_FLAGS(ALTIVEC, VMSUMUHS, do_va_env_helper, gen_helper_VMSUMUHS)
 TRANS_FLAGS(ALTIVEC, VMSUMSHS, do_va_env_helper, gen_helper_VMSUMSHS)
 
-GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
+TRANS_FLAGS(ALTIVEC, VMHADDSHS, do_va_env_helper, gen_helper_VMHADDSHS)
+TRANS_FLAGS(ALTIVEC, VMHRADDSHS, do_va_env_helper, gen_helper_VMHRADDSHS)
 
 GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index a3a0fd0650..7cd9d40e06 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -219,7 +219,6 @@ GEN_VXFORM_UIMM(vctsxs, 5, 15),
 
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
-GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.37.3


