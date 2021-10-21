Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E9B436C45
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:36:55 +0200 (CEST)
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeo2-0003pS-2e
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde8k-00051m-6k; Thu, 21 Oct 2021 15:54:14 -0400
Received: from [201.28.113.2] (port=19044 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde8i-0006WJ-Ah; Thu, 21 Oct 2021 15:54:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BE76080012A;
 Thu, 21 Oct 2021 16:47:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 33/33] target/ppc: Implement lxvkq instruction
Date: Thu, 21 Oct 2021 16:45:47 -0300
Message-Id: <20211021194547.672988-34-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:08.0251 (UTC)
 FILETIME=[6E96D2B0:01D7C6B4]
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
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vsx-impl.c.inc | 44 +++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

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
index 4619d7f238..badf70cb01 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1552,6 +1552,50 @@ static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
     return true;
 }
 
+static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
+{
+    static const uint32_t valid_values = 0b00000001111111110000001111111110;
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
+    if (!(valid_values & (1 << a->uim))) {
+        gen_invalid(ctx);
+    } else {
+        set_cpu_vsrl(a->xt, tcg_constant_i64(0x0));
+        set_cpu_vsrh(a->xt, tcg_constant_i64(values[a->uim]));
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


