Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD94404EC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:28:46 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZQb-00010h-9c
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYWW-0001he-I9; Fri, 29 Oct 2021 16:30:50 -0400
Received: from [201.28.113.2] (port=54018 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYWT-0004EY-RB; Fri, 29 Oct 2021 16:30:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:26:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 21956800B36;
 Fri, 29 Oct 2021 17:26:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 34/34] target/ppc: Implement lxvkq instruction
Date: Fri, 29 Oct 2021 17:24:25 -0300
Message-Id: <20211029202424.175401-35-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:26:37.0647 (UTC)
 FILETIME=[4629F5F0:01D7CD03]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
- valid_values mask removed
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vsx-impl.c.inc | 43 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fd73946122..e135b8aba4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -100,6 +100,9 @@
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
+&X_uim5         xt uim:uint8_t
+@X_uim5         ...... ..... ..... uim:5 .......... .           &X_uim5 xt=%x_xt
+
 &X_tb_sp_rc     rt rb sp rc:bool
 @X_tb_sp_rc     ...... rt:5 sp:2 ... rb:5 .......... rc:1       &X_tb_sp_rc
 
@@ -420,3 +423,7 @@ STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
 
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
+
+## VSX Vector Load Special Value Instruction
+
+LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 1b890b60a9..f4f19dd479 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1503,6 +1503,49 @@ static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
     return true;
 }
 
+static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
+{
+    static const uint64_t values[32] = {
+        0, /* Unspecified */
+        0x3FFF000000000000llu, /* QP +1.0 */
+        0x4000000000000000llu, /* QP +2.0 */
+        0x4000800000000000llu, /* QP +3.0 */
+        0x4001000000000000llu, /* QP +4.0 */
+        0x4001400000000000llu, /* QP +5.0 */
+        0x4001800000000000llu, /* QP +6.0 */
+        0x4001C00000000000llu, /* QP +7.0 */
+        0x7FFF000000000000llu, /* QP +Inf */
+        0x7FFF800000000000llu, /* QP dQNaN */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0x8000000000000000llu, /* QP -0.0 */
+        0xBFFF000000000000llu, /* QP -1.0 */
+        0xC000000000000000llu, /* QP -2.0 */
+        0xC000800000000000llu, /* QP -3.0 */
+        0xC001000000000000llu, /* QP -4.0 */
+        0xC001400000000000llu, /* QP -5.0 */
+        0xC001800000000000llu, /* QP -6.0 */
+        0xC001C00000000000llu, /* QP -7.0 */
+        0xFFFF000000000000llu, /* QP -Inf */
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    if (values[a->uim]) {
+        set_cpu_vsr(a->xt, tcg_constant_i64(0x0), false);
+        set_cpu_vsr(a->xt, tcg_constant_i64(values[a->uim]), true);
+    } else {
+        gen_invalid(ctx);
+    }
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.25.1


