Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649054D228
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:57:07 +0200 (CEST)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Z8U-0001Y1-0J
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o1Ypy-0001ie-Ot; Wed, 15 Jun 2022 15:38:02 -0400
Received: from [187.72.171.209] (port=43830 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o1Ypx-0000ee-7M; Wed, 15 Jun 2022 15:37:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 15 Jun 2022 16:20:31 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 338A88001F1;
 Wed, 15 Jun 2022 16:20:31 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH 04/11] target/ppc: Move slbieg to decodetree
Date: Wed, 15 Jun 2022 16:19:59 -0300
Message-Id: <20220615192006.3075821-5-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
References: <20220615192006.3075821-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jun 2022 19:20:31.0537 (UTC)
 FILETIME=[FAC65A10:01D880EC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
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
 target/ppc/insn32.decode                     |  1 +
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 13 -------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 793f307ab0..86cd12f399 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -688,7 +688,7 @@ DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_FLAGS_2(slbieg, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
 DEF_HELPER_FLAGS_2(load_sr, TCG_CALL_NO_RWG, tl, env, tl)
 DEF_HELPER_FLAGS_3(store_sr, TCG_CALL_NO_RWG, void, env, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index af13625832..b900fd8f17 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -793,6 +793,7 @@ XVF64GERNN      111011 ... -- .... 0 ..... 11111010 ..-  @XX3_at xa=%xx_xa_pair
 ## SLB Management Instructions
 
 SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
+SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
 ## TLB Management Instructions
 
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 03f71a82ec..a842fbd6f6 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -202,7 +202,7 @@ void helper_SLBIE(CPUPPCState *env, target_ulong addr)
     __helper_slbie(env, addr, false);
 }
 
-void helper_slbieg(CPUPPCState *env, target_ulong addr)
+void helper_SLBIEG(CPUPPCState *env, target_ulong addr)
 {
     __helper_slbie(env, addr, true);
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b0bb67b676..6e47b81bf7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5466,18 +5466,6 @@ static void gen_slbia(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* slbieg */
-static void gen_slbieg(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_slbieg(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* slbsync */
 static void gen_slbsync(DisasContext *ctx)
 {
@@ -6898,7 +6886,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
-GEN_HANDLER_E(slbieg, 0x1F, 0x12, 0x0E, 0x001F0001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
 #endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 41fc5ade8b..b9bb950f7d 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -35,6 +35,20 @@ static bool trans_SLBIE(DisasContext *ctx, arg_SLBIE *a)
     return true;
 }
 
+static bool trans_SLBIEG(DisasContext *ctx, arg_SLBIEG *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIEG(cpu_env, cpu_gpr[a->rb]);
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


