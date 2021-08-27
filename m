Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A33F94E8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:14:06 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW3x-00050W-0r
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0000wd-M6; Fri, 27 Aug 2021 03:10:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43687 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW00-0007QS-Sv; Fri, 27 Aug 2021 03:10:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ0sBzz9sW5; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=mV3gNmU1XvFoeL8Q2t1cJ4ZrlkZLuiwXorUpetappVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kjlTfRZlZdMteoxXAQvfIpOO1Rzyl2V+2qC8BgwtxDk4YFj6B0TiNOvGnudOJywAu
 4P9QJ+V9KhEthQd3gKT2hvBlj+ypy2RyiWfo3mVAeZauYHrjjg/Z2sSEJyCXlwOVay
 DvhoY7f4daIXbBxwl+mOcgS9T092lcjuvpyZjbmc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/18] target/ppc: moved store_40x_sler to helper_regs.c
Date: Fri, 27 Aug 2021 17:09:33 +1000
Message-Id: <20210827070946.219970-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

moved store_40x_sler from mmu_common.c to helper_regs.c as it is
a function to store a value in a special purpose register, so
moving it to a file focused in special register manipulation
is more appropriate.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210723175627.72847-4-lucas.araujo@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


