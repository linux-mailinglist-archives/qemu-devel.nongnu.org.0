Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530A5634E6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:12:09 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7HNQ-0002H2-Dg
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7GpW-0003cQ-DM; Fri, 01 Jul 2022 09:37:06 -0400
Received: from [200.168.210.66] (port=50439 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7GpU-0006Vs-RM; Fri, 01 Jul 2022 09:37:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 1 Jul 2022 10:35:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6457B80023A;
 Fri,  1 Jul 2022 10:35:27 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH RESEND 11/11] target/ppc: Implement slbiag
Date: Fri,  1 Jul 2022 10:35:07 -0300
Message-Id: <20220701133507.740619-12-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
References: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jul 2022 13:35:27.0747 (UTC)
 FILETIME=[6CF6B530:01D88D4F]
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
 target/ppc/helper.h                          |  1 +
 target/ppc/insn32.decode                     |  4 +++
 target/ppc/mmu-hash64.c                      | 27 ++++++++++++++++++++
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 649b2a9c58..2e7c61e117 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -695,6 +695,7 @@ DEF_HELPER_2(SLBMFEE, tl, env, tl)
 DEF_HELPER_2(SLBMFEV, tl, env, tl)
 DEF_HELPER_2(SLBFEE, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_3(SLBIAG, TCG_CALL_NO_RWG, void, env, tl, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fb53bce0c8..e4aa336bbf 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -137,6 +137,9 @@
 &X_rb           rb
 @X_rb           ...... ..... ..... rb:5 .......... .            &X_rb
 
+&X_rs_l         rs l:bool
+@X_rs_l         ...... rs:5 .... l:1 ..... .......... .         &X_rs_l
+
 &X_uim5         xt uim:uint8_t
 @X_uim5         ...... ..... ..... uim:5 .......... .           &X_uim5 xt=%x_xt
 
@@ -822,6 +825,7 @@ SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
 SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
 SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
+SLBIAG          011111 ..... ----. ----- 1101010010 -   @X_rs_l
 
 SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 7ec7a67a78..b9b31fd276 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -173,6 +173,33 @@ void helper_SLBIA(CPUPPCState *env, uint32_t ih)
     }
 }
 
+#if defined(TARGET_PPC64)
+void helper_SLBIAG(CPUPPCState *env, target_ulong rs, uint32_t l)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    int n;
+
+    /*
+     * slbiag must always flush all TLB (which is equivalent to ERAT in ppc
+     * architecture). Matching on SLB_ESID_V is not good enough, because slbmte
+     * can overwrite a valid SLB without flushing its lookaside information.
+     *
+     * It would be possible to keep the TLB in synch with the SLB by flushing
+     * when a valid entry is overwritten by slbmte, and therefore slbiag would
+     * not have to flush unless it evicts a valid SLB entry. However it is
+     * expected that slbmte is more common than slbiag, and slbiag is usually
+     * going to evict valid SLB entries, so that tradeoff is unlikely to be a
+     * good one.
+     */
+    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
+
+    for (n = 0; n < cpu->hash64_opts->slb_size; n++) {
+        ppc_slb_t *slb = &env->slb[n];
+        slb->esid &= ~SLB_ESID_V;
+    }
+}
+#endif
+
 static void __helper_slbie(CPUPPCState *env, target_ulong addr,
                            target_ulong global)
 {
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index c90cad10b4..6a4ba4089e 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -63,6 +63,20 @@ static bool trans_SLBIA(DisasContext *ctx, arg_SLBIA *a)
     return true;
 }
 
+static bool trans_SLBIAG(DisasContext *ctx, arg_SLBIAG *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIAG(cpu_env, cpu_gpr[a->rs], tcg_constant_i32(a->l));
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
 static bool trans_SLBMTE(DisasContext *ctx, arg_SLBMTE *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.25.1


