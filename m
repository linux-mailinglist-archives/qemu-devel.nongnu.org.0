Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BEA5634C4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:56:54 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7H8f-0003Pt-EL
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7GpA-0003D2-VC; Fri, 01 Jul 2022 09:36:45 -0400
Received: from [200.168.210.66] (port=50439 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7Gp7-0006Vs-PU; Fri, 01 Jul 2022 09:36:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 1 Jul 2022 10:35:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1E01380023A;
 Fri,  1 Jul 2022 10:35:16 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH RESEND 04/11] target/ppc: Move slbieg to decodetree
Date: Fri,  1 Jul 2022 10:35:00 -0300
Message-Id: <20220701133507.740619-5-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
References: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jul 2022 13:35:16.0524 (UTC)
 FILETIME=[664636C0:01D88D4F]
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

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  1 +
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 13 -------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index b51b3d9f07..8f9dde6d3f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -696,7 +696,7 @@ DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_FLAGS_2(slbieg, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
 DEF_HELPER_FLAGS_2(load_sr, TCG_CALL_NO_RWG, tl, env, tl)
 DEF_HELPER_FLAGS_3(store_sr, TCG_CALL_NO_RWG, void, env, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d282cf00c1..d3517d412c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -816,6 +816,7 @@ VMODUQ          000100 ..... ..... ..... 11000001011    @VX
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
index 14881e637f..ad19a68f5c 100644
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


