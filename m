Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179A49B59D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:04:04 +0100 (CET)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMQV-0003LB-3W
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAI-0001Jj-18; Tue, 25 Jan 2022 07:43:14 -0500
Received: from [187.72.171.209] (port=34172 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAG-0007RC-8m; Tue, 25 Jan 2022 07:43:13 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 74D7580001E;
 Tue, 25 Jan 2022 09:20:38 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 13/38] target/ppc: Implement Vector Compare Quadword
Date: Tue, 25 Jan 2022 09:19:18 -0300
Message-Id: <20220125121943.3269077-14-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:38.0792 (UTC)
 FILETIME=[F67BC880:01D811E5]
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

Implement the following PowerISA v3.1 instructions:
vcmpsq: Vector Compare Signed Quadword
vcmpuq: Vector Compare Unsigned Quadword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  6 ++++
 target/ppc/translate/vmx-impl.c.inc | 45 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 45649f7d1d..605e66872e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -60,6 +60,9 @@
 &VX             vrt vra vrb
 @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
 
+&VX_bf          bf vra vrb
+@VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
+
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
 
@@ -404,6 +407,9 @@ VCMPNEZB        000100 ..... ..... ..... . 0100000111   @VC
 VCMPNEZH        000100 ..... ..... ..... . 0101000111   @VC
 VCMPNEZW        000100 ..... ..... ..... . 0110000111   @VC
 
+VCMPSQ          000100 ... -- ..... ..... 00101000001   @VX_bf
+VCMPUQ          000100 ... -- ..... ..... 00100000001   @VX_bf
+
 ## Vector Bit Manipulation Instruction
 
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 302ef4370a..2c13fbeb39 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1204,6 +1204,51 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
 TRANS(VCMPGTSQ, do_vcmpgtq, true)
 TRANS(VCMPGTUQ, do_vcmpgtq, false)
 
+static bool do_vcmpq(DisasContext *ctx, arg_VX_bf *a, bool sign)
+{
+    TCGv_i64 vra, vrb;
+    TCGLabel *gt, *lt, *done;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vra = tcg_temp_local_new_i64();
+    vrb = tcg_temp_local_new_i64();
+    gt = gen_new_label();
+    lt = gen_new_label();
+    done = gen_new_label();
+
+    get_avr64(vra, a->vra, true);
+    get_avr64(vrb, a->vrb, true);
+    tcg_gen_brcond_i64((sign ? TCG_COND_GT : TCG_COND_GTU), vra, vrb, gt);
+    tcg_gen_brcond_i64((sign ? TCG_COND_LT : TCG_COND_LTU), vra, vrb, lt);
+
+    get_avr64(vra, a->vra, false);
+    get_avr64(vrb, a->vrb, false);
+    tcg_gen_brcond_i64(TCG_COND_GTU, vra, vrb, gt);
+    tcg_gen_brcond_i64(TCG_COND_LTU, vra, vrb, lt);
+
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_EQ);
+    tcg_gen_br(done);
+
+    gen_set_label(gt);
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_GT);
+    tcg_gen_br(done);
+
+    gen_set_label(lt);
+    tcg_gen_movi_i32(cpu_crf[a->bf], CRF_LT);
+    tcg_gen_br(done);
+
+    gen_set_label(done);
+    tcg_temp_free_i64(vra);
+    tcg_temp_free_i64(vrb);
+
+    return true;
+}
+
+TRANS(VCMPSQ, do_vcmpq, true)
+TRANS(VCMPUQ, do_vcmpq, false)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
-- 
2.25.1


