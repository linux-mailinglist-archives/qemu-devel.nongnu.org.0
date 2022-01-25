Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD149B57C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:58:38 +0100 (CET)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMLF-0007BW-EI
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAL-0001NJ-Be; Tue, 25 Jan 2022 07:43:17 -0500
Received: from [187.72.171.209] (port=34172 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAJ-0007RC-C2; Tue, 25 Jan 2022 07:43:16 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 22FE780001E;
 Tue, 25 Jan 2022 09:20:39 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 15/38] target/ppc: implement vclrlb
Date: Tue, 25 Jan 2022 09:19:20 -0300
Message-Id: <20220125121943.3269077-16-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:39.0464 (UTC)
 FILETIME=[F6E25280:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 56 +++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ea497ecd80..483651cf9c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -501,6 +501,8 @@ VSTRIBR         000100 ..... 00001 ..... . 0000001101   @VX_tb_rc
 VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
 VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
 
+VCLRLB          000100 ..... ..... ..... 00110001101    @VX
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8bcf637ff8..3fb4935bff 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1956,6 +1956,62 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
 TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
 TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
 
+static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 hi, lo, rb;
+    TCGLabel *l, *end;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    l = gen_new_label();
+    end = gen_new_label();
+
+    hi = tcg_const_local_i64(0);
+    lo = tcg_const_local_i64(0);
+    rb = tcg_temp_local_new_i64();
+
+    tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
+
+    /* RB == 0: all zeros */
+    tcg_gen_brcondi_i64(TCG_COND_EQ, rb, 0, end);
+
+    get_avr64(lo, a->vra, false);
+
+    /* RB <= 8 */
+    tcg_gen_brcondi_i64(TCG_COND_LEU, rb, 8, l);
+
+    get_avr64(hi, a->vra, true);
+
+    /* RB >= 16: just copy VRA to VRB */
+    tcg_gen_brcondi_i64(TCG_COND_GEU, rb, 16, end);
+
+    /* 8 < RB < 16: copy lo and partially clear hi */
+    tcg_gen_subfi_i64(rb, 16, rb);
+    tcg_gen_shli_i64(rb, rb, 3);
+    tcg_gen_shl_i64(hi, hi, rb);
+    tcg_gen_shr_i64(hi, hi, rb);
+    tcg_gen_br(end);
+
+    /* 0 < RB <= 8: zeroes hi and partially clears lo */
+    gen_set_label(l);
+    tcg_gen_subfi_i64(rb, 8, rb);
+    tcg_gen_shli_i64(rb, rb, 3);
+    tcg_gen_shl_i64(lo, lo, rb);
+    tcg_gen_shr_i64(lo, lo, rb);
+
+    /* Update VRT */
+    gen_set_label(end);
+    set_avr64(a->vrt, hi, true);
+    set_avr64(a->vrt, lo, false);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(rb);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


