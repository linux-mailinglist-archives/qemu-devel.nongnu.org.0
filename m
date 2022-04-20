Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD4509150
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:19:46 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGni-0004TG-0k
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGCN-0004xb-1T; Wed, 20 Apr 2022 15:41:11 -0400
Received: from [187.72.171.209] (port=35275 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGCL-0007El-FI; Wed, 20 Apr 2022 15:41:10 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 16:40:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7423E800059;
 Wed, 20 Apr 2022 16:40:43 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 7/9] target/ppc: Implemented remaining vector divide
 extended
Date: Wed, 20 Apr 2022 16:40:35 -0300
Message-Id: <20220420194037.263661-8-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
References: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 19:40:43.0672 (UTC)
 FILETIME=[86217980:01D854EE]
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
vdivesd: Vector Divide Extended Signed Doubleword
vdiveud: Vector Divide Extended Unsigned Doubleword
vdivesq: Vector Divide Extended Signed Quadword
vdiveuq: Vector Divide Extended Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  4 ++
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 64 +++++++++++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  4 ++
 4 files changed, 76 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 4cfdf7b3ec..67ecff2c9a 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -173,6 +173,10 @@ DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVESD, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVEUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVESQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVEUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 8c115c9c60..3eb920ac76 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -715,3 +715,7 @@ VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
 
 VDIVESW         000100 ..... ..... ..... 01110001011    @VX
 VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
+VDIVESD         000100 ..... ..... ..... 01111001011    @VX
+VDIVEUD         000100 ..... ..... ..... 01011001011    @VX
+VDIVESQ         000100 ..... ..... ..... 01100001011    @VX
+VDIVEUQ         000100 ..... ..... ..... 01000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 55149c4fc7..27c8ce96ac 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1057,6 +1057,70 @@ void helper_VDIVUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
+void helper_VDIVESD(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+    int64_t high;
+    uint64_t low;
+    for (i = 0; i < 2; i++) {
+        high = a->s64[i];
+        low = 0;
+        if (unlikely((high == INT64_MIN && b->s64[i] == -1) || !b->s64[i])) {
+            t->s64[i] = a->s64[i]; /* Undefined behavior */
+        } else {
+            divs128(&low, &high, b->s64[i]);
+            t->s64[i] = low;
+        }
+    }
+}
+
+void helper_VDIVEUD(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+    uint64_t high, low;
+    for (i = 0; i < 2; i++) {
+        high = a->u64[i];
+        low = 0;
+        if (unlikely(!b->u64[i])) {
+            t->u64[i] = a->u64[i]; /* Undefined behavior */
+        } else {
+            divu128(&low, &high, b->u64[i]);
+            t->u64[i] = low;
+        }
+    }
+}
+
+void helper_VDIVESQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 high, low;
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    Int128 neg1 = int128_makes64(-1);
+
+    high = a->s128;
+    low = int128_zero();
+    if (unlikely(!int128_nz(b->s128) ||
+                 (int128_eq(b->s128, neg1) && int128_eq(high, int128_min)))) {
+        t->s128 = a->s128; /* Undefined behavior */
+    } else {
+        divs256(&low, &high, b->s128);
+        t->s128 = low;
+    }
+}
+
+void helper_VDIVEUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 high, low;
+
+    high = a->s128;
+    low = int128_zero();
+    if (unlikely(!int128_nz(b->s128))) {
+        t->s128 = a->s128; /* Undefined behavior */
+    } else {
+        divu256(&low, &high, b->s128);
+        t->s128 = low;
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index d1c1c6cf03..566a2e6d23 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3365,6 +3365,10 @@ DIVU32(do_diveuw, do_diveu_i32)
 
 TRANS_FLAGS2(ISA310, VDIVESW, do_vdiv_vmod, MO_32, do_divesw, NULL)
 TRANS_FLAGS2(ISA310, VDIVEUW, do_vdiv_vmod, MO_32, do_diveuw, NULL)
+TRANS_FLAGS2(ISA310, VDIVESD, do_vx_helper, gen_helper_VDIVESD)
+TRANS_FLAGS2(ISA310, VDIVEUD, do_vx_helper, gen_helper_VDIVEUD)
+TRANS_FLAGS2(ISA310, VDIVESQ, do_vx_helper, gen_helper_VDIVESQ)
+TRANS_FLAGS2(ISA310, VDIVEUQ, do_vx_helper, gen_helper_VDIVEUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.31.1


