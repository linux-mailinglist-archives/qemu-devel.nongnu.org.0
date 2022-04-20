Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A51509141
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:15:00 +0200 (CEST)
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGj5-0003aY-SA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGCS-00056d-Oo; Wed, 20 Apr 2022 15:41:16 -0400
Received: from [187.72.171.209] (port=35275 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGCR-0007El-4u; Wed, 20 Apr 2022 15:41:16 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 16:40:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A0EF0800059;
 Wed, 20 Apr 2022 16:40:44 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 9/9] target/ppc: Implemented vector module quadword
Date: Wed, 20 Apr 2022 16:40:37 -0300
Message-Id: <20220420194037.263661-10-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
References: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 19:40:44.0922 (UTC)
 FILETIME=[86E035A0:01D854EE]
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
vmodsq: Vector Modulo Signed Quadword
vmoduq: Vector Modulo Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 21 +++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 67ecff2c9a..881e03959a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -177,6 +177,8 @@ DEF_HELPER_FLAGS_3(VDIVESD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVEUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVESQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVEUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMODSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VMODUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 36b42e41d2..b53efe1915 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -724,3 +724,5 @@ VMODSW          000100 ..... ..... ..... 11110001011    @VX
 VMODUW          000100 ..... ..... ..... 11010001011    @VX
 VMODSD          000100 ..... ..... ..... 11111001011    @VX
 VMODUD          000100 ..... ..... ..... 11011001011    @VX
+VMODSQ          000100 ..... ..... ..... 11100001011    @VX
+VMODUQ          000100 ..... ..... ..... 11000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 27c8ce96ac..fc4d887eeb 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1121,6 +1121,27 @@ void helper_VDIVEUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
+void helper_VMODSQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 neg1 = int128_makes64(-1);
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    if (likely(int128_nz(b->s128) &&
+              (int128_ne(a->s128, int128_min) || int128_ne(b->s128, neg1)))) {
+        t->s128 = int128_rems(a->s128, b->s128);
+    } else {
+        t->s128 = int128_zero(); /* Undefined behavior */
+    }
+}
+
+void helper_VMODUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    if (likely(int128_nz(b->s128))) {
+        t->s128 = int128_remu(a->s128, b->s128);
+    } else {
+        t->s128 = int128_zero(); /* Undefined behavior */
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 69f71dc216..07fe9c1c44 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3379,6 +3379,8 @@ TRANS_FLAGS2(ISA310, VMODSW, do_vdiv_vmod, MO_32, do_modsw , NULL)
 TRANS_FLAGS2(ISA310, VMODUW, do_vdiv_vmod, MO_32, do_moduw, NULL)
 TRANS_FLAGS2(ISA310, VMODSD, do_vdiv_vmod, MO_64, NULL, do_modsd)
 TRANS_FLAGS2(ISA310, VMODUD, do_vdiv_vmod, MO_64, NULL, do_modud)
+TRANS_FLAGS2(ISA310, VMODSQ, do_vx_helper, gen_helper_VMODSQ)
+TRANS_FLAGS2(ISA310, VMODUQ, do_vx_helper, gen_helper_VMODUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.31.1


