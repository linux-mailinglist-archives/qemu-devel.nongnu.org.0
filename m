Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3149B55B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:51:31 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMEL-0002I1-CF
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:51:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAW-0001VY-5B; Tue, 25 Jan 2022 07:43:28 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAQ-0007RA-Ea; Tue, 25 Jan 2022 07:43:24 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 363828009AB;
 Tue, 25 Jan 2022 09:20:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 18/38] target/ppc: implement vgnb
Date: Tue, 25 Jan 2022 09:19:23 -0300
Message-Id: <20220125121943.3269077-19-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:40.0544 (UTC)
 FILETIME=[F7871E00:01D811E5]
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
 target/ppc/insn32.decode            |  5 ++++
 target/ppc/translate/vmx-impl.c.inc | 44 +++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0a3e39f3e9..7b629e81af 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -66,6 +66,9 @@
 &VX_mp          rt mp:bool vrb
 @VX_mp          ...... rt:5 .... mp:1 vrb:5 ...........         &VX_mp
 
+&VX_n           rt vrb n
+@VX_n           ...... rt:5 .. n:3 vrb:5 ...........            &VX_n
+
 &VX_tb_rc       vrt vrb rc:bool
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
 
@@ -418,6 +421,8 @@ VCMPUQ          000100 ... -- ..... ..... 00100000001   @VX_bf
 
 ## Vector Bit Manipulation Instruction
 
+VGNB            000100 ..... -- ... ..... 10011001100   @VX_n
+
 VCFUGED         000100 ..... ..... ..... 10101001101    @VX
 VCLZDM          000100 ..... ..... ..... 11110000100    @VX
 VCTZDM          000100 ..... ..... ..... 11111000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 78b277466a..43eb7ab70c 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1438,6 +1438,50 @@ GEN_VXFORM_DUAL(vsplth, PPC_ALTIVEC, PPC_NONE,
 GEN_VXFORM_DUAL(vspltw, PPC_ALTIVEC, PPC_NONE,
                 vextractuw, PPC_NONE, PPC2_ISA300);
 
+static bool trans_VGNB(DisasContext *ctx, arg_VX_n *a)
+{
+    TCGv_i64 vrb, tmp, rt;
+    int in = 63, out = 63;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->n < 2) {
+        /*
+         * "N can be any value between 2 and 7, inclusive." Otherwise, the
+         * result is undefined, so we don't need to change RT. Also, N > 7 is
+         * impossible since the immediate field is 3 bits only.
+         */
+        return true;
+    }
+
+    vrb = tcg_temp_new_i64();
+    tmp = tcg_temp_new_i64();
+    rt = tcg_const_i64(0);
+
+    for (int dw = 1; dw >= 0; dw--) {
+        get_avr64(vrb, a->vrb, dw);
+        for (; in >= 0; in -= a->n, out--) {
+            if (in > out) {
+                tcg_gen_shri_i64(tmp, vrb, in - out);
+            } else {
+                tcg_gen_shli_i64(tmp, vrb, out - in);
+            }
+            tcg_gen_andi_i64(tmp, tmp, 1ULL << out);
+            tcg_gen_or_i64(rt, rt, tmp);
+        }
+        in += 64;
+    }
+
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+
+    tcg_temp_free_i64(vrb);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(rt);
+
+    return true;
+}
+
 static bool do_vextdx(DisasContext *ctx, arg_VA *a, int size, bool right,
                void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv))
 {
-- 
2.25.1


