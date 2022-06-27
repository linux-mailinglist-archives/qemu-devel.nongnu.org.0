Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8955B986
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:28:27 +0200 (CEST)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nqs-0007lR-OK
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5ncd-00061o-0U; Mon, 27 Jun 2022 08:13:43 -0400
Received: from [200.168.210.66] (port=26430 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5ncb-0001dl-8s; Mon, 27 Jun 2022 08:13:42 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 08:56:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 58F288001D4;
 Mon, 27 Jun 2022 08:56:17 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH RESEND 05/11] target/ppc: Move slbia to decodetree
Date: Mon, 27 Jun 2022 08:54:18 -0300
Message-Id: <20220627115424.348073-6-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
References: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 11:56:17.0718 (UTC)
 FILETIME=[E8D15560:01D88A1C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.coutinho@eldorado.org.br; helo=outlook.eldorado.org.br
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

Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  5 +++++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 17 -----------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8f9dde6d3f..c2440a8854 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -694,7 +694,7 @@ DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
 DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
-DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d3517d412c..1349c5e8a7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -131,6 +131,9 @@
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
+&X_ih           ih:uint8_t
+@X_ih           ...... .. ih:3 ..... ..... .......... .         &X_ih
+
 &X_rb           rb
 @X_rb           ...... ..... ..... rb:5 .......... .            &X_rb
 
@@ -818,6 +821,8 @@ VMODUQ          000100 ..... ..... ..... 11000001011    @VX
 SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
 SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
+SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index a842fbd6f6..dd2c7e588f 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -101,7 +101,7 @@ void dump_slb(PowerPCCPU *cpu)
 }
 
 #ifdef CONFIG_TCG
-void helper_slbia(CPUPPCState *env, uint32_t ih)
+void helper_SLBIA(CPUPPCState *env, uint32_t ih)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     int starting_entry;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ad19a68f5c..5d2416143f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5450,22 +5450,6 @@ static void gen_tlbsync(DisasContext *ctx)
 }
 
 #if defined(TARGET_PPC64)
-/* slbia */
-static void gen_slbia(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    uint32_t ih = (ctx->opcode >> 21) & 0x7;
-    TCGv_i32 t0 = tcg_const_i32(ih);
-
-    CHK_SV(ctx);
-
-    gen_helper_slbia(cpu_env, t0);
-    tcg_temp_free_i32(t0);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* slbsync */
 static void gen_slbsync(DisasContext *ctx)
 {
@@ -6885,7 +6869,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  */
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
-GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
 GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
 #endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index b9bb950f7d..cbb8b81f13 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -49,6 +49,20 @@ static bool trans_SLBIEG(DisasContext *ctx, arg_SLBIEG *a)
     return true;
 }
 
+static bool trans_SLBIA(DisasContext *ctx, arg_SLBIA *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SLBI);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIA(cpu_env, tcg_constant_i32(a->ih));
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
 static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 {
 #if defined(CONFIG_USER_ONLY)
-- 
2.25.1


