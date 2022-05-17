Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD552A3B1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:42:19 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxSs-0003dC-LM
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUY-0003fS-14; Tue, 17 May 2022 08:40:05 -0400
Received: from [187.72.171.209] (port=50866 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nqwUW-0003z4-78; Tue, 17 May 2022 08:39:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 09:39:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 56584800C32;
 Tue, 17 May 2022 09:39:31 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 05/12] target/ppc: Use TCG_CALL_NO_RWG_SE in fsel helper
Date: Tue, 17 May 2022 09:39:22 -0300
Message-Id: <20220517123929.284511-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 12:39:31.0626 (UTC)
 FILETIME=[27F888A0:01D869EB]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

fsel doesn't change FPSCR and CR1 is handled by gen_set_cr1_from_fpscr,
so helper_fsel doesn't need the env argument and can be declared with
TCG_CALL_NO_RWG_SE. We also take this opportunity to move the insn to
decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c            | 15 +++++++--------
 target/ppc/helper.h                |  2 +-
 target/ppc/insn32.decode           |  7 +++++++
 target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++++++--
 target/ppc/translate/fp-ops.c.inc  |  1 -
 5 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f6c8318a71..b4d6f6ed4c 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -916,18 +916,17 @@ float64 helper_frsqrtes(CPUPPCState *env, float64 arg)
 }
 
 /* fsel - fsel. */
-uint64_t helper_fsel(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
-                     uint64_t arg3)
+uint64_t helper_FSEL(uint64_t a, uint64_t b, uint64_t c)
 {
-    CPU_DoubleU farg1;
+    CPU_DoubleU fa;
 
-    farg1.ll = arg1;
+    fa.ll = a;
 
-    if ((!float64_is_neg(farg1.d) || float64_is_zero(farg1.d)) &&
-        !float64_is_any_nan(farg1.d)) {
-        return arg2;
+    if ((!float64_is_neg(fa.d) || float64_is_zero(fa.d)) &&
+        !float64_is_any_nan(fa.d)) {
+        return c;
     } else {
-        return arg3;
+        return b;
     }
 }
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f82c5bd0db..ddfa0308bc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -120,7 +120,7 @@ DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
 DEF_HELPER_2(frsqrtes, i64, env, i64)
-DEF_HELPER_4(fsel, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_3(FSEL, TCG_CALL_NO_RWG_SE, i64, i64, i64, i64)
 
 DEF_HELPER_FLAGS_2(ftdiv, TCG_CALL_NO_RWG_SE, i32, i64, i64)
 DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39372fe673..1d0b55bde3 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -17,6 +17,9 @@
 # License along with this library; if not, see <http://www.gnu.org/licenses/>.
 #
 
+&A              frt fra frb frc rc:bool
+@A              ...... frt:5 fra:5 frb:5 frc:5 ..... rc:1       &A
+
 &D              rt ra si:int64_t
 @D              ...... rt:5 ra:5 si:s16                 &D
 
@@ -308,6 +311,10 @@ STFDU           110111 ..... ...... ...............     @D
 STFDX           011111 ..... ...... .... 1011010111 -   @X
 STFDUX          011111 ..... ...... .... 1011110111 -   @X
 
+### Floating-Point Select Instruction
+
+FSEL            111111 ..... ..... ..... ..... 10111 .  @A
+
 ### Move To/From System Register Instructions
 
 SETBC           011111 ..... ..... ----- 0110000000 -   @X_bi
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index cfb27bd020..f9b58b844e 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -222,8 +222,34 @@ static void gen_frsqrtes(DisasContext *ctx)
     tcg_temp_free_i64(t1);
 }
 
-/* fsel */
-_GEN_FLOAT_ACB(sel, 0x3F, 0x17, 0, PPC_FLOAT_FSEL);
+static bool trans_FSEL(DisasContext *ctx, arg_A *a)
+{
+    TCGv_i64 t0, t1, t2;
+
+    REQUIRE_INSNS_FLAGS(ctx, FLOAT_FSEL);
+    REQUIRE_FPU(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    get_fpr(t0, a->fra);
+    get_fpr(t1, a->frb);
+    get_fpr(t2, a->frc);
+
+    gen_helper_FSEL(t0, t0, t1, t2);
+    set_fpr(a->frt, t0);
+    if (a->rc) {
+        gen_set_cr1_from_fpscr(ctx);
+    }
+
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+
+    return true;
+}
+
 /* fsub - fsubs */
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT);
 /* Optional: */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 4260635a12..0538ab2d2d 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -24,7 +24,6 @@ GEN_FLOAT_AC(mul, 0x19, 0x0000F800, 1, PPC_FLOAT),
 GEN_FLOAT_BS(re, 0x3F, 0x18, 1, PPC_FLOAT_EXT),
 GEN_FLOAT_BS(res, 0x3B, 0x18, 1, PPC_FLOAT_FRES),
 GEN_FLOAT_BS(rsqrte, 0x3F, 0x1A, 1, PPC_FLOAT_FRSQRTE),
-_GEN_FLOAT_ACB(sel, sel, 0x3F, 0x17, 0, 0, PPC_FLOAT_FSEL),
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT),
 GEN_FLOAT_ACB(madd, 0x1D, 1, PPC_FLOAT),
 GEN_FLOAT_ACB(msub, 0x1C, 1, PPC_FLOAT),
-- 
2.25.1


