Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C93C1EFA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:36:33 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jBg-0005f7-9a
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuK-0002ZR-Kv; Fri, 09 Jul 2021 01:18:37 -0400
Received: from ozlabs.org ([203.11.71.1]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuC-00026n-K1; Fri, 09 Jul 2021 01:18:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf6f1qz9t9y; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=IW1b31ozhZIG/pyqRQtJdVZq/uJD6DiefOWaqIQiPfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HGxwqIFagZgC/YYM1tajQ2dNn1Iw32R5foXVTg8Yat6HZRkNlUj8QNRpd2Viiaflx
 W5UevklKMw1oqyAG9k1k6ebDMxmgUsDYgzZGNb6qQPfDwawZavZd5rJSU9Mg7OkywH
 QSucwyxASxbh3Uh0LNpV8690mFwTw71ZqjpVVuUg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 30/33] target/ppc: Don't compile ppc_tlb_invalid_all without TCG
Date: Fri,  9 Jul 2021 15:17:25 +1000
Message-Id: <20210709051728.170203-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

The function ppc_tlb_invalid_all is not compiled anymore in a TCG-less
environment, and the call to that function has been disabled in this
situation

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210708164957.28096-2-lucas.araujo@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


