Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4784BFBEE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:07:37 +0100 (CET)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWlM-0007O1-EB
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:07:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWMq-0008Bh-Vr; Tue, 22 Feb 2022 09:42:18 -0500
Received: from [187.72.171.209] (port=44973 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWMp-0005xE-55; Tue, 22 Feb 2022 09:42:16 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7BED480047A;
 Tue, 22 Feb 2022 11:37:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 25/47] target/ppc: implement vrlq
Date: Tue, 22 Feb 2022 11:36:23 -0300
Message-Id: <20220222143646.1268606-26-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:44.0853 (UTC)
 FILETIME=[C12A1450:01D827F9]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 -  New in v4.
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e788dc5152..c3d47a8815 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -491,6 +491,7 @@ VRLB            000100 ..... ..... ..... 00000000100    @VX
 VRLH            000100 ..... ..... ..... 00001000100    @VX
 VRLW            000100 ..... ..... ..... 00010000100    @VX
 VRLD            000100 ..... ..... ..... 00011000100    @VX
+VRLQ            000100 ..... ..... ..... 00000000101    @VX
 
 VRLWMI          000100 ..... ..... ..... 00010000101    @VX
 VRLDMI          000100 ..... ..... ..... 00011000101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index a025404032..6b68a81706 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1053,6 +1053,55 @@ TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false, false);
 TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
 TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
 
+static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 ah, al, n, t0, t1, sf = tcg_constant_i64(64);
+
+    REQUIRE_VECTOR(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+
+    ah = tcg_temp_new_i64();
+    al = tcg_temp_new_i64();
+    n = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(ah, a->vra, true);
+    get_avr64(al, a->vra, false);
+    get_avr64(n, a->vrb, true);
+
+    tcg_gen_andi_i64(n, n, 0x7F);
+
+    tcg_gen_mov_i64(t0, ah);
+    tcg_gen_movcond_i64(TCG_COND_GE, ah, n, sf, al, ah);
+    tcg_gen_movcond_i64(TCG_COND_GE, al, n, sf, t0, al);
+    tcg_gen_andi_i64(n, n, ~64ULL);
+
+    tcg_gen_shl_i64(t0, ah, n);
+    tcg_gen_shl_i64(t1, al, n);
+
+    tcg_gen_xori_i64(n, n, 63);
+
+    tcg_gen_shr_i64(al, al, n);
+    tcg_gen_shri_i64(al, al, 1);
+    tcg_gen_or_i64(t0, al, t0);
+
+    tcg_gen_shr_i64(ah, ah, n);
+    tcg_gen_shri_i64(ah, ah, 1);
+    tcg_gen_or_i64(t1, ah, t1);
+
+    set_avr64(a->vrt, t0, true);
+    set_avr64(a->vrt, t1, false);
+
+    tcg_temp_free_i64(ah);
+    tcg_temp_free_i64(al);
+    tcg_temp_free_i64(n);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
                                          TCGv_vec sat, TCGv_vec a,      \
-- 
2.25.1


