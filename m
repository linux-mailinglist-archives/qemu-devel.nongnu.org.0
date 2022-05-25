Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE72533EA2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:02:27 +0200 (CEST)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrak-0007vg-99
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntrPw-0005Ms-L3; Wed, 25 May 2022 09:51:16 -0400
Received: from [187.72.171.209] (port=5282 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntrPu-0004iJ-Kw; Wed, 25 May 2022 09:51:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 25 May 2022 10:49:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A62A8800761;
 Wed, 25 May 2022 10:49:55 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH RESEND v3 3/8] target/ppc: Implemented vector divide extended
 word
Date: Wed, 25 May 2022 10:49:49 -0300
Message-Id: <20220525134954.85056-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 May 2022 13:49:55.0875 (UTC)
 FILETIME=[511FC730:01D8703E]
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
vdivesw: Vector Divide Extended Signed Word
vdiveuw: Vector Divide Extended Unsigned Word

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  3 ++
 target/ppc/translate/vmx-impl.c.inc | 48 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 01bfde8c5e..f6d2d4b257 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -795,3 +795,6 @@ VDIVSD          000100 ..... ..... ..... 00111001011    @VX
 VDIVUD          000100 ..... ..... ..... 00011001011    @VX
 VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
 VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
+
+VDIVESW         000100 ..... ..... ..... 01110001011    @VX
+VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 22572e6a79..8c542bcb29 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3320,6 +3320,54 @@ TRANS_FLAGS2(ISA310, VDIVUD, do_vdiv_vmod, MO_64, NULL, do_divud)
 TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
 TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
 
+static void do_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 val1, val2;
+
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+
+    tcg_gen_ext_i32_i64(val1, a);
+    tcg_gen_ext_i32_i64(val2, b);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_div_i64(val1, val1, val2);
+
+    /* if quotient doesn't fit in 32 bits the result is undefined */
+    tcg_gen_extrl_i64_i32(t, val1);
+
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 val1, val2;
+
+    val1 = tcg_temp_new_i64();
+    val2 = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(val1, a);
+    tcg_gen_extu_i32_i64(val2, b);
+
+    /* (a << 32)/b */
+    tcg_gen_shli_i64(val1, val1, 32);
+    tcg_gen_divu_i64(val1, val1, val2);
+
+    /* if quotient doesn't fit in 32 bits the result is undefined */
+    tcg_gen_extrl_i64_i32(t, val1);
+
+    tcg_temp_free_i64(val1);
+    tcg_temp_free_i64(val2);
+}
+
+DIVS32(do_divesw, do_dives_i32)
+DIVU32(do_diveuw, do_diveu_i32)
+
+TRANS_FLAGS2(ISA310, VDIVESW, do_vdiv_vmod, MO_32, do_divesw, NULL)
+TRANS_FLAGS2(ISA310, VDIVEUW, do_vdiv_vmod, MO_32, do_diveuw, NULL)
+
 #undef DIVS32
 #undef DIVU32
 #undef DIVS64
-- 
2.31.1


