Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF363C182F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:33:15 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xti-0001oi-FI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m1XFI-0008HG-1M; Thu, 08 Jul 2021 12:51:28 -0400
Received: from [201.28.113.2] (port=18772 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m1XFG-0003G3-Kd; Thu, 08 Jul 2021 12:51:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 8 Jul 2021 13:50:22 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C4E89800976;
 Thu,  8 Jul 2021 13:50:22 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 1/4] target/ppc: Don't compile ppc_tlb_invalid_all without
 TCG
Date: Thu,  8 Jul 2021 13:49:54 -0300
Message-Id: <20210708164957.28096-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
References: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 08 Jul 2021 16:50:22.0911 (UTC)
 FILETIME=[57F09CF0:01D77419]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function ppc_tlb_invalid_all is not compiled anymore in a TCG-less
environment, and the call to that function has been disabled in this
situation

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/cpu_init.c   | 2 ++
 target/ppc/mmu_helper.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6f8ce010ba..505a0ed6ac 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8847,9 +8847,11 @@ static void ppc_cpu_reset(DeviceState *dev)
 
 #if !defined(CONFIG_USER_ONLY)
     env->nip = env->hreset_vector | env->excp_prefix;
+#if defined(CONFIG_TCG)
     if (env->mmu_model != POWERPC_MMU_REAL) {
         ppc_tlb_invalidate_all(env);
     }
+#endif /* CONFIG_TCG */
 #endif
 
     hreg_compute_hflags(env);
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 47e9f9529e..869d24d301 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
+#ifdef CONFIG_TCG
 static void booke206_flush_tlb(CPUPPCState *env, int flags,
                                const int check_iprot)
 {
@@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int flags,
 
     tlb_flush(env_cpu(env));
 }
+#endif
 
 static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
                                         ppcmas_tlb_t *tlb)
@@ -1901,6 +1903,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 }
 #endif
 
+#ifdef CONFIG_TCG
 /*****************************************************************************/
 /* TLB management */
 void ppc_tlb_invalidate_all(CPUPPCState *env)
@@ -1944,6 +1947,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
         break;
     }
 }
+#endif
 
 #ifdef CONFIG_TCG
 void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
-- 
2.17.1


