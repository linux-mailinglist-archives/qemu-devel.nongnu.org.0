Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6935E85BE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:19:27 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obr14-00088h-2O
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYM-00071W-TR; Fri, 23 Sep 2022 17:49:56 -0400
Received: from [200.168.210.66] (port=12827 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYL-0006ea-0R; Fri, 23 Sep 2022 17:49:46 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 23 Sep 2022 18:47:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D86788000B4;
 Fri, 23 Sep 2022 18:47:58 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 12/12] target/ppc: Use gvec to decode XVTSTDC[DS]P
Date: Fri, 23 Sep 2022 18:47:54 -0300
Message-Id: <20220923214754.217819-13-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Sep 2022 21:47:59.0140 (UTC)
 FILETIME=[25AA6E40:01D8CF96]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Used gvec to translate XVTSTDCSP and XVTSTDCDP.

xvtstdcsp:
rept    loop    patch10             patch12
8       12500   2,70288900          1,24050300 (-54.1%)
25      4000    2,65665700          1,14078900 (-57.1%)
100     1000    2,82795400          1,53337200 (-45.8%)
500     200     3,62225400          3,91718000 (+8.1%)
2500    40      6,45658000         12,60683700 (+95.3%)
8000    12     17,48091900         44,15384000 (+152.6%)

xvtstdcdp:
rept    loop    patch10             patch12
8       12500    1,56435900         1,24554800 (-20.4%)
25      4000     1,53789500         1,14177800 (-25.8%)
100     1000     1,67964600         1,54280000 (-8.1%)
500     200      2,46777100         3,96816000 (+60.8%)
2500    40       5,21938900        12,79937800 (+145.2%)
8000    12      15,97600500        45,44233000 (+184.4%)

Overall these instructions are the hardest ones to measure performance
as the helper implementation is affected by the immediate. So for
example in a worst case scenario (high REPT, LOOP = 1, immediate 127) it
took 13x longer with the gvec implementation, and in a best case
scenario (low REPT, high LOOP, only 1 bit set in the immediate) the
execution took 21.8% of the time with gvec (-78.2%).
The tests here are the sum of every possible immediate.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc | 73 ++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index c3c179723b..dc95e8fdf4 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1121,16 +1121,85 @@ GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
 
+static void do_xvtstdc_vec(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t imm)
+{
+    TCGv_vec match = tcg_const_ones_vec_matching(t);
+    TCGv_vec temp;
+    TCGv_vec mask;
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    uint64_t frc_msk = ~(exp_msk | sgn_msk);
+    mask = tcg_constant_vec_matching(t, vece, 0);
+    tcg_gen_mov_vec(t, mask);
+    if (imm & (0x3 << 0)) {
+        /* test if Denormal */
+        temp = tcg_temp_new_vec_matching(t);
+        mask = tcg_constant_vec_matching(t, vece, ~sgn_msk);
+        tcg_gen_and_vec(vece, t, b, mask);
+        mask = tcg_constant_vec_matching(t, vece, frc_msk);
+        tcg_gen_cmp_vec(TCG_COND_LE, vece, temp, t, mask);
+        mask = tcg_constant_vec_matching(t, vece, 0);
+        tcg_gen_cmpsel_vec(TCG_COND_NE, vece, temp, t, mask, temp, mask);
+
+        tcg_gen_mov_vec(t, mask);
+        mask = tcg_constant_vec_matching(t, vece, sgn_msk);
+        if (imm & (0x1)) {
+            /* test if negative */
+            tcg_gen_cmpsel_vec(TCG_COND_GTU, vece, t, b, mask, temp, t);
+        }
+        if (imm & (0x2)) {
+            /* test if positive */
+            tcg_gen_cmpsel_vec(TCG_COND_LTU, vece, t, b, mask, temp, t);
+        }
+        tcg_temp_free_vec(temp);
+    }
+    if (imm & (1 << 2)) {
+        /* test if -0 */
+        mask = tcg_constant_vec_matching(t, vece, sgn_msk);
+        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
+    }
+    if (imm & (1 << 3)) {
+        /* test if +0 */
+        mask = tcg_constant_vec_matching(t, vece, 0);
+        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
+    }
+    if (imm & (1 << 4)) {
+        /* test if -Inf */
+        mask = tcg_constant_vec_matching(t, vece, exp_msk | sgn_msk);
+        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
+    }
+    if (imm & (1 << 5)) {
+        /* test if +Inf */
+        mask = tcg_constant_vec_matching(t, vece, exp_msk);
+        tcg_gen_cmpsel_vec(TCG_COND_EQ, vece, t, b, mask, match, t);
+    }
+    if (imm & (1 << 6)) {
+        /* test if NaN */
+        mask = tcg_constant_vec_matching(t, vece, ~sgn_msk);
+        tcg_gen_and_vec(vece, b, b, mask);
+        mask = tcg_constant_vec_matching(t, vece, exp_msk);
+        tcg_gen_cmpsel_vec(TCG_COND_GT, vece, t, b, mask, match, t);
+    }
+    tcg_temp_free_vec(match);
+}
+
 static bool do_xvtstdc(DisasContext *ctx, arg_XX2_uim *a, unsigned vece)
 {
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, INDEX_op_cmpsel_vec, 0
+    };
     static const GVecGen2i op[] = {
         {
             .fnoi = gen_helper_XVTSTDCSP,
-            .vece = MO_32
+            .fniv = do_xvtstdc_vec,
+            .vece = MO_32,
+            .opt_opc = vecop_list
         },
         {
             .fnoi = gen_helper_XVTSTDCDP,
-            .vece = MO_64
+            .fniv = do_xvtstdc_vec,
+            .vece = MO_64,
+            .opt_opc = vecop_list
         },
     };
 
-- 
2.31.1


