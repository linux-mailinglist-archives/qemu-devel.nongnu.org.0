Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE9155B97F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:22:18 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nkv-0007Ee-8u
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5nci-0006HD-O0; Mon, 27 Jun 2022 08:13:48 -0400
Received: from [200.168.210.66] (port=26430 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5nch-0001dl-2p; Mon, 27 Jun 2022 08:13:48 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 08:56:19 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1EA6D8001D4;
 Mon, 27 Jun 2022 08:56:19 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH RESEND 07/11] target/ppc: Move slbmfev to decodetree
Date: Mon, 27 Jun 2022 08:54:20 -0300
Message-Id: <20220627115424.348073-8-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
References: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 11:56:19.0484 (UTC)
 FILETIME=[E9DECDC0:01D88A1C]
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
 target/ppc/insn32.decode                     |  2 ++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 12 ------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ad88073ae0..1d23de7358 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -692,7 +692,7 @@ DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
         env, tl, tl, i32)
 DEF_HELPER_FLAGS_3(SLBMTE, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
-DEF_HELPER_2(load_slb_vsid, tl, env, tl)
+DEF_HELPER_2(SLBMFEV, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e255f9241b..9354014ca5 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -825,6 +825,8 @@ SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
 
 SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 
+SLBMFEV         011111 ..... ----- ..... 1101010011 -   @X_tb
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 1922960608..7854b91043 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -343,7 +343,7 @@ target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
     return rt;
 }
 
-target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
+target_ulong helper_SLBMFEV(CPUPPCState *env, target_ulong rb)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     target_ulong rt = 0;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d421fe267c..6b44c6312b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5363,17 +5363,6 @@ static void gen_slbmfee(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-static void gen_slbmfev(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_load_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-                             cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
 
 static void gen_slbfee_(DisasContext *ctx)
 {
@@ -6845,7 +6834,6 @@ GEN_HANDLER2(mtsr_64b, "mtsr", 0x1F, 0x12, 0x06, 0x0010F801, PPC_SEGMENT_64B),
 GEN_HANDLER2(mtsrin_64b, "mtsrin", 0x1F, 0x12, 0x07, 0x001F0001,
              PPC_SEGMENT_64B),
 GEN_HANDLER2(slbmfee, "slbmfee", 0x1F, 0x13, 0x1C, 0x001F0001, PPC_SEGMENT_64B),
-GEN_HANDLER2(slbmfev, "slbmfev", 0x1F, 0x13, 0x1A, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbfee_, "slbfee.", 0x1F, 0x13, 0x1E, 0x001F0000, PPC_SEGMENT_64B),
 #endif
 GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 4c2dd758b5..a037fc2b95 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -77,6 +77,20 @@ static bool trans_SLBMTE(DisasContext *ctx, arg_SLBMTE *a)
     return true;
 }
 
+static bool trans_SLBMFEV(DisasContext *ctx, arg_SLBMFEV *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SEGMENT_64B);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBMFEV(cpu_gpr[a->rt], cpu_env, cpu_gpr[a->rb]);
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


