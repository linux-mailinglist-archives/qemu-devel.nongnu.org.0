Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFA3A3162
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:52:12 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNuZ-0003ZO-R6
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lrNqm-00016U-4Z; Thu, 10 Jun 2021 12:48:12 -0400
Received: from [201.28.113.2] (port=50320 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lrNqk-0003S0-PO; Thu, 10 Jun 2021 12:48:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 10 Jun 2021 13:47:04 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id A2DB68014C4;
 Thu, 10 Jun 2021 13:47:04 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 1/3] target/ppc: Turn ppc_tlb_invalid_all in a noop
Date: Thu, 10 Jun 2021 13:46:46 -0300
Message-Id: <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 10 Jun 2021 16:47:04.0789 (UTC)
 FILETIME=[3E489850:01D75E18]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The function ppc_tlb_invalid_all is now a no op when compiling without TCG.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/mmu_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 1ecb36e85a..e7ba39c9e1 100644
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
@@ -1956,6 +1958,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 /* TLB management */
 void ppc_tlb_invalidate_all(CPUPPCState *env)
 {
+#ifdef CONFIG_TCG
 #if defined(TARGET_PPC64)
     if (mmu_is_64bit(env->mmu_model)) {
         env->tlb_need_flush = 0;
@@ -1994,6 +1997,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
         cpu_abort(env_cpu(env), "Unknown MMU model %x\n", env->mmu_model);
         break;
     }
+#endif
 }
 
 #ifdef CONFIG_TCG
-- 
2.17.1


