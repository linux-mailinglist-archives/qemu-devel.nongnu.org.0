Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C549B5B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:08:08 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMUR-0005f8-Oy
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAP-0001QK-TT; Tue, 25 Jan 2022 07:43:22 -0500
Received: from [187.72.171.209] (port=34172 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAM-0007RC-Oc; Tue, 25 Jan 2022 07:43:20 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CA5AF80001E;
 Tue, 25 Jan 2022 09:20:39 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 17/38] target/ppc: implement vcntmb[bhwd]
Date: Tue, 25 Jan 2022 09:19:22 -0300
Message-Id: <20220125121943.3269077-18-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:40.0198 (UTC)
 FILETIME=[F7525260:01D811E5]
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
 target/ppc/insn32.decode            |  8 ++++++++
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index bf2f3b1e0b..0a3e39f3e9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -63,6 +63,9 @@
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
 
+&VX_mp          rt mp:bool vrb
+@VX_mp          ...... rt:5 .... mp:1 vrb:5 ...........         &VX_mp
+
 &VX_tb_rc       vrt vrb rc:bool
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
 
@@ -489,6 +492,11 @@ VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
 VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
 VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
 
+VCNTMBB         000100 ..... 1100 . ..... 11001000010   @VX_mp
+VCNTMBH         000100 ..... 1101 . ..... 11001000010   @VX_mp
+VCNTMBW         000100 ..... 1110 . ..... 11001000010   @VX_mp
+VCNTMBD         000100 ..... 1111 . ..... 11001000010   @VX_mp
+
 ## Vector Multiply-Sum Instructions
 
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 9ae0ab94ac..78b277466a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1932,6 +1932,38 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
     return true;
 }
 
+static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
+{
+    TCGv_i64 rt, vrb, mask;
+    rt = tcg_const_i64(0);
+    vrb = tcg_temp_new_i64();
+    mask = tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1)));
+
+    for (int i = 0; i < 2; i++) {
+        get_avr64(vrb, a->vrb, i);
+        if (a->mp) {
+            tcg_gen_and_i64(vrb, mask, vrb);
+        } else {
+            tcg_gen_andc_i64(vrb, mask, vrb);
+        }
+        tcg_gen_ctpop_i64(vrb, vrb);
+        tcg_gen_add_i64(rt, rt, vrb);
+    }
+
+    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(rt);
+
+    return true;
+}
+
+TRANS(VCNTMBB, do_vcntmb, MO_8)
+TRANS(VCNTMBH, do_vcntmb, MO_16)
+TRANS(VCNTMBW, do_vcntmb, MO_32)
+TRANS(VCNTMBD, do_vcntmb, MO_64)
+
 static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
                      void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv))
 {
-- 
2.25.1


