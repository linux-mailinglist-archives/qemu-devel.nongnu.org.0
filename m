Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7C4ECDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:34:11 +0200 (CEST)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZf19-0005J8-0J
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:34:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuM-0004Mf-5r; Wed, 30 Mar 2022 16:27:10 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuK-0001WS-Dz; Wed, 30 Mar 2022 16:27:09 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8BA7A8002AF;
 Wed, 30 Mar 2022 17:25:39 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 05/10] target/ppc: Implemented vector divide extended word
Date: Wed, 30 Mar 2022 17:25:10 -0300
Message-Id: <20220330202515.66554-6-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:40.0076 (UTC)
 FILETIME=[52A352C0:01D84474]
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
vdivesw: Vector Divide Extended Signed Word
vdiveuw: Vector Divide Extended Unsigned Word
Undefined behavior based on mambo.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  3 ++
 target/ppc/translate/vmx-impl.c.inc | 65 +++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3a88a0b5bc..8c115c9c60 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -712,3 +712,6 @@ VDIVSD          000100 ..... ..... ..... 00111001011    @VX
 VDIVUD          000100 ..... ..... ..... 00011001011    @VX
 VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
 VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
+
+VDIVESW         000100 ..... ..... ..... 01110001011    @VX
+VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 949e47be1c..752f3af659 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3287,6 +3287,71 @@ TRANS_VDIV_VMOD(ISA310, VDIVUD, MO_64, NULL, do_vx_divu_i64)
 TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
 TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
 
+static void do_vx_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 res, val1, val2;
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 one =  tcg_constant_i64(1);
+
+    res = tcg_temp_new_i64();
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+
+    tcg_gen_ext_i32_i64(val1, a);
+    tcg_gen_ext_i32_i64(val2, b);
+
+    /* return 0 if b = 0, so make b = 1 so the result doesn't fit in 32 bits*/
+    tcg_gen_movcond_i64(TCG_COND_EQ, val2, val2, zero, one, val2);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_div_i64(res, val1, val2);
+
+    tcg_gen_ext32s_i64(val1, res);
+    /* if result is undefined (quotient doesn't fit in 32 bits) return 0 */
+    tcg_gen_movcond_i64(TCG_COND_EQ, res, res, val1, res, zero);
+    tcg_gen_extrl_i64_i32(t, res);
+
+    tcg_temp_free_i64(res);
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+static void do_vx_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 val1, val2;
+    TCGv_i32 h, l;
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 one =  tcg_constant_i32(1);
+
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+    h = tcg_temp_new_i32();
+    l = tcg_temp_new_i32();
+
+    /* return 0 if b = 0, so make b = 1 so the result doesn't fit in 32 bits*/
+    tcg_gen_movcond_i32(TCG_COND_EQ, b, b, zero, one, b);
+
+    tcg_gen_ext_i32_i64(val1, a);
+    tcg_gen_extu_i32_i64(val2, b);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_divu_i64(val1, val1, val2);
+
+    tcg_gen_extrh_i64_i32(h, val1);
+    tcg_gen_extrl_i64_i32(l, val1);
+    /* if result is undefined (quotient doesn't fit in 32 bits) return 0 */
+    tcg_gen_movcond_i32(TCG_COND_EQ, t, h, zero, l, zero);
+    tcg_temp_free_i32(h);
+    tcg_temp_free_i32(l);
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+TRANS_VDIV_VMOD(ISA310, VDIVESW, MO_32, do_vx_dives_i32, NULL)
+TRANS_VDIV_VMOD(ISA310, VDIVEUW, MO_32, do_vx_diveu_i32, NULL)
+
 #undef GEN_VR_LDX
 #undef GEN_VR_STX
 #undef GEN_VR_LVE
-- 
2.31.1


