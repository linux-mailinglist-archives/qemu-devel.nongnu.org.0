Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE249B567
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:54:55 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMHd-0005XW-1R
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAH-0001Ib-3X; Tue, 25 Jan 2022 07:43:13 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAF-0007RA-GB; Tue, 25 Jan 2022 07:43:12 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1FA868009AB;
 Tue, 25 Jan 2022 09:20:38 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 12/38] target/ppc: Implement Vector Compare Greater Than
 Quadword
Date: Tue, 25 Jan 2022 09:19:17 -0300
Message-Id: <20220125121943.3269077-13-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:38.0462 (UTC)
 FILETIME=[F6496DE0:01D811E5]
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
vcmpgtsq: Vector Compare Greater Than Signed Quadword
vcmpgtuq: Vector Compare Greater Than Unsigned Quadword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39730df32d..45649f7d1d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -388,11 +388,13 @@ VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
 VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
 VCMPGTSW        000100 ..... ..... ..... . 1110000110   @VC
 VCMPGTSD        000100 ..... ..... ..... . 1111000111   @VC
+VCMPGTSQ        000100 ..... ..... ..... . 1110000111   @VC
 
 VCMPGTUB        000100 ..... ..... ..... . 1000000110   @VC
 VCMPGTUH        000100 ..... ..... ..... . 1001000110   @VC
 VCMPGTUW        000100 ..... ..... ..... . 1010000110   @VC
 VCMPGTUD        000100 ..... ..... ..... . 1011000111   @VC
+VCMPGTUQ        000100 ..... ..... ..... . 1010000111   @VC
 
 VCMPNEB         000100 ..... ..... ..... . 0000000111   @VC
 VCMPNEH         000100 ..... ..... ..... . 0001000111   @VC
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index bdb0b4370b..302ef4370a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1155,6 +1155,55 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
     return true;
 }
 
+static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
+{
+    TCGv_i64 t0, t1;
+    TCGLabel *l1, *l2, *l3;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    t0 = tcg_temp_local_new_i64();
+    t1 = tcg_temp_local_new_i64();
+    l1 = gen_new_label();
+    l2 = gen_new_label();
+    l3 = gen_new_label();
+
+    get_avr64(t0, a->vra, true);
+    get_avr64(t1, a->vrb, true);
+    tcg_gen_brcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t0, t1, l1);
+    tcg_gen_brcond_i64(sign ? TCG_COND_LT : TCG_COND_LTU, t0, t1, l2);
+
+    get_avr64(t0, a->vra, false);
+    get_avr64(t1, a->vrb, false);
+    tcg_gen_brcond_i64(TCG_COND_GTU, t0, t1, l1);
+    tcg_gen_br(l2);
+
+    gen_set_label(l1);
+    set_avr64(a->vrt, tcg_constant_i64(-1), true);
+    set_avr64(a->vrt, tcg_constant_i64(-1), false);
+    if (a->rc) {
+        tcg_gen_movi_i32(cpu_crf[6], 1 << 3);
+    }
+    tcg_gen_br(l3);
+
+    gen_set_label(l2);
+    set_avr64(a->vrt, tcg_constant_i64(0), true);
+    set_avr64(a->vrt, tcg_constant_i64(0), false);
+    if (a->rc) {
+        tcg_gen_movi_i32(cpu_crf[6], 1 << 1);
+    }
+
+    gen_set_label(l3);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(VCMPGTSQ, do_vcmpgtq, true)
+TRANS(VCMPGTUQ, do_vcmpgtq, false)
+
 GEN_VXRFORM(vcmpeqfp, 3, 3)
 GEN_VXRFORM(vcmpgefp, 3, 7)
 GEN_VXRFORM(vcmpgtfp, 3, 11)
-- 
2.25.1


