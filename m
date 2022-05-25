Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD4533E52
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:56:25 +0200 (CEST)
Received: from localhost ([::1]:58906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrUv-0001ru-1Y
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntrOr-0004aJ-K5; Wed, 25 May 2022 09:50:13 -0400
Received: from [187.72.171.209] (port=41510 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntrOp-0004Ec-Hq; Wed, 25 May 2022 09:50:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 25 May 2022 10:49:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7D72C8001D4;
 Wed, 25 May 2022 10:49:55 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH RESEND v3 2/8] target/ppc: Implemented vector divide quadword
Date: Wed, 25 May 2022 10:49:48 -0300
Message-Id: <20220525134954.85056-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 May 2022 13:49:55.0781 (UTC)
 FILETIME=[51116F50:01D8703E]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivsq: Vector Divide Signed Quadword
vdivuq: Vector Divide Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 21 +++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6233e28d85..9f33e589e0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -175,6 +175,8 @@ DEF_HELPER_FLAGS_3(VMULOSW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUB, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6df405e398..01bfde8c5e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -793,3 +793,5 @@ VDIVSW          000100 ..... ..... ..... 00110001011    @VX
 VDIVUW          000100 ..... ..... ..... 00010001011    @VX
 VDIVSD          000100 ..... ..... ..... 00111001011    @VX
 VDIVUD          000100 ..... ..... ..... 00011001011    @VX
+VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
+VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 105b626d1b..033718dc0e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1162,6 +1162,27 @@ void helper_XXPERMX(ppc_vsr_t *t, ppc_vsr_t *s0, ppc_vsr_t *s1, ppc_vsr_t *pcv,
     *t = tmp;
 }
 
+void helper_VDIVSQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 neg1 = int128_makes64(-1);
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    if (likely(int128_nz(b->s128) &&
+              (int128_ne(a->s128, int128_min) || int128_ne(b->s128, neg1)))) {
+        t->s128 = int128_divs(a->s128, b->s128);
+    } else {
+        t->s128 = a->s128; /* Undefined behavior */
+    }
+}
+
+void helper_VDIVUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    if (int128_nz(b->s128)) {
+        t->s128 = int128_divu(a->s128, b->s128);
+    } else {
+        t->s128 = a->s128; /* Undefined behavior */
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4c0b1a32ec..22572e6a79 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3317,6 +3317,8 @@ TRANS_FLAGS2(ISA310, VDIVSW, do_vdiv_vmod, MO_32, do_divsw, NULL)
 TRANS_FLAGS2(ISA310, VDIVUW, do_vdiv_vmod, MO_32, do_divuw, NULL)
 TRANS_FLAGS2(ISA310, VDIVSD, do_vdiv_vmod, MO_64, NULL, do_divsd)
 TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
+TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
+TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.31.1


