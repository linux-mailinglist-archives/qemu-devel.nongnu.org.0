Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EA34BFB0F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:46:29 +0100 (CET)
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWQu-0001kA-Jy
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWKG-0005Ub-3v; Tue, 22 Feb 2022 09:39:36 -0500
Received: from [187.72.171.209] (port=25868 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWKC-0005Ic-HF; Tue, 22 Feb 2022 09:39:35 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 530EA80047A;
 Tue, 22 Feb 2022 11:37:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 11/47] target/ppc: Implement Vector Compare Equal Quadword
Date: Tue, 22 Feb 2022 11:36:09 -0300
Message-Id: <20220222143646.1268606-12-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:40.0705 (UTC)
 FILETIME=[BEB12510:01D827F9]
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

Implement the following PowerISA v3.1 instructions:
vcmpequq: Vector Compare Equal Quadword

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 - Branchless implementation (rth)
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index be9e05cc73..437a3e29e0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -382,6 +382,7 @@ VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
 VCMPEQUH        000100 ..... ..... ..... . 0001000110   @VC
 VCMPEQUW        000100 ..... ..... ..... . 0010000110   @VC
 VCMPEQUD        000100 ..... ..... ..... . 0011000111   @VC
+VCMPEQUQ        000100 ..... ..... ..... . 0111000111   @VC
 
 VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
 VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index d7f807b81d..d66a642b67 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1107,6 +1107,42 @@ TRANS(VCMPNEZB, do_vcmpnez, MO_8)
 TRANS(VCMPNEZH, do_vcmpnez, MO_16)
 TRANS(VCMPNEZW, do_vcmpnez, MO_32)
 
+static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
+{
+    TCGv_i64 t0, t1, t2;
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    get_avr64(t0, a->vra, true);
+    get_avr64(t1, a->vrb, true);
+    tcg_gen_xor_i64(t2, t0, t1);
+
+    get_avr64(t0, a->vra, false);
+    get_avr64(t1, a->vrb, false);
+    tcg_gen_xor_i64(t1, t0, t1);
+
+    tcg_gen_or_i64(t1, t1, t2);
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0);
+    tcg_gen_neg_i64(t1, t1);
+
+    set_avr64(a->vrt, t1, true);
+    set_avr64(a->vrt, t1, false);
+
+    if (a->rc) {
+        tcg_gen_extrl_i64_i32(cpu_crf[6], t1);
+        tcg_gen_andi_i32(cpu_crf[6], cpu_crf[6], 0xa);
+        tcg_gen_xori_i32(cpu_crf[6], cpu_crf[6], 0x2);
+    }
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
-- 
2.25.1


