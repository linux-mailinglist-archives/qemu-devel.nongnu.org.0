Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB8436C46
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 22:37:49 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeou-0004lE-3E
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 16:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7V-0002lM-58; Thu, 21 Oct 2021 15:52:57 -0400
Received: from [201.28.113.2] (port=46784 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde7T-0005Hb-85; Thu, 21 Oct 2021 15:52:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:47:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id E83E080012A;
 Thu, 21 Oct 2021 16:47:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 29/33] target/ppc: implemented XXSPLTI32DX
Date: Thu, 21 Oct 2021 16:45:43 -0300
Message-Id: <20211021194547.672988-30-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:47:06.0426 (UTC)
 FILETIME=[6D8059A0:01D7C6B4]
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
 luis.pires@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Implemented XXSPLTI32DX emulation using decodetree

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode            | 11 ++++++++
 target/ppc/translate/vsx-impl.c.inc | 41 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 880ac3edc7..8d8d5d5729 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -32,6 +32,14 @@
                 ...... ..... ra:5 ................       \
                 &PLS_D si=%pls_si rt=%rt_tsxp
 
+# Format 8RR:D
+%8rr_si         32:s16 0:16
+%8rr_xt         16:1 21:5
+&8RR_D_IX       xt ix si:int32_t
+@8RR_D_IX       ...... .. .... .. .. ................ \
+                ...... ..... ... ix:1 . ................ \
+                &8RR_D_IX si=%8rr_si xt=%8rr_xt
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -156,3 +164,6 @@ PLXVP           000001 00 0--.-- .................. \
                 111010 ..... ..... ................     @8LS_D_TSXP
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
+
+XXSPLTI32DX     000001 01 0000 -- -- ................ \
+                100000 ..... 000 .. ................    @8RR_D_IX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 3dbdfc2539..17cbe2dc15 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1491,6 +1491,47 @@ static bool trans_XXSPLTIB(DisasContext *ctx, arg_X_imm8 *a)
     return true;
 }
 
+static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    TCGv_i64 new_val;
+    TCGv_i64 mask;
+    TCGv_i64 t0;
+    TCGv_i64 t1;
+    new_val = tcg_temp_new_i64();
+    mask = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_cpu_vsrh(t0, a->xt);
+    get_cpu_vsrl(t1, a->xt);
+
+    tcg_gen_movi_i64(new_val, a->si);
+    if (a->ix) {
+        tcg_gen_movi_i64(mask, 0x00000000ffffffff);
+        tcg_gen_shli_i64(new_val, new_val, 32);
+    } else {
+        tcg_gen_movi_i64(mask, 0xffffffff00000000);
+    }
+    tcg_gen_and_i64(t0, t0, mask);
+    tcg_gen_or_i64(t0, t0, new_val);
+    tcg_gen_and_i64(t1, t1, mask);
+    tcg_gen_or_i64(t1, t1, new_val);
+
+    set_cpu_vsrh(a->xt, t0);
+    set_cpu_vsrl(a->xt, t1);
+
+
+    tcg_temp_free_i64(mask);
+    tcg_temp_free_i64(new_val);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t0);
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.25.1


