Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A53D4027
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:06:11 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6zYo-0004KC-HR
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6zPr-0005uw-AF; Fri, 23 Jul 2021 13:56:55 -0400
Received: from [201.28.113.2] (port=37617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1m6zPp-00038U-N4; Fri, 23 Jul 2021 13:56:55 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Jul 2021 14:56:40 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 0B174801022;
 Fri, 23 Jul 2021 14:56:40 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 3/3] target/ppc: moved store_40x_sler to helper_regs.c
Date: Fri, 23 Jul 2021 14:56:27 -0300
Message-Id: <20210723175627.72847-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723175627.72847-1-lucas.araujo@eldorado.org.br>
References: <20210723175627.72847-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 23 Jul 2021 17:56:40.0166 (UTC)
 FILETIME=[16C3D060:01D77FEC]
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
Cc: luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

moved store_40x_sler from mmu_common.c to helper_regs.c as it is
a function to store a value in a special purpose register, so
moving it to a file focused in special register manipulation
is more appropriate.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/helper_regs.c | 12 ++++++++++++
 target/ppc/mmu_common.c  | 10 ----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 3723872aa6..405450d863 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -258,6 +258,18 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     return excp;
 }
 
+#ifdef CONFIG_SOFTMMU
+void store_40x_sler(CPUPPCState *env, uint32_t val)
+{
+    /* XXX: TO BE FIXED */
+    if (val != 0x00000000) {
+        cpu_abort(env_cpu(env),
+                  "Little-endian regions are not supported by now\n");
+    }
+    env->spr[SPR_405_SLER] = val;
+}
+#endif /* CONFIG_SOFTMMU */
+
 #ifndef CONFIG_USER_ONLY
 void check_tlb_flush(CPUPPCState *env, bool global)
 {
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index a0518f611b..754509e556 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -622,16 +622,6 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     return ret;
 }
 
-void store_40x_sler(CPUPPCState *env, uint32_t val)
-{
-    /* XXX: TO BE FIXED */
-    if (val != 0x00000000) {
-        cpu_abort(env_cpu(env),
-                  "Little-endian regions are not supported by now\n");
-    }
-    env->spr[SPR_405_SLER] = val;
-}
-
 static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
                               hwaddr *raddr, int *prot, target_ulong address,
                               MMUAccessType access_type, int i)
-- 
2.17.1


