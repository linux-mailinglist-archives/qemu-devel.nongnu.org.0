Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315BE388F1B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:29:10 +0200 (CEST)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMG3-0007jd-OD
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLho-0002Ow-TG; Wed, 19 May 2021 08:53:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:49581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLhl-0001kP-Rw; Wed, 19 May 2021 08:53:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnt1gTgz9sPf; Wed, 19 May 2021 22:52:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428738;
 bh=sipivPMIlLrzXZG/dcDLE4GTPmzZmFYDG/cqAob/gEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FacMkJ3Rgoa6b8AAR2Pz2c7vlQDswNtxeiDHx2v3xHSfVSRbsD3dGB0coG0X2wGW0
 5jxAkrspfsYhbFgKP7WwC6+fSL0Yr8Jmg5xoNaD7rFnQ1wqmFV777wP8OjjazRgCtr
 HNPIAXT/n2YQoc+du3pfhUOxIwK46m4d+in+qVIA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 45/48] target/ppc: Remove type argument from mmubooke_check_tlb
Date: Wed, 19 May 2021 22:51:45 +1000
Message-Id: <20210519125148.27720-46-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We can now use MMU_INST_FETCH from access_type for this.
Unify the I/D code paths, making use of prot_for_access_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-13-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 44 ++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 1426973b4d..4e5cc11b44 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -738,9 +738,9 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
 
 static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
                               hwaddr *raddr, int *prot, target_ulong address,
-                              MMUAccessType access_type, int type, int i)
+                              MMUAccessType access_type, int i)
 {
-    int ret, prot2;
+    int prot2;
 
     if (ppcemb_tlb_check(env, tlb, raddr, address,
                          env->spr[SPR_BOOKE_PID],
@@ -772,37 +772,19 @@ found_tlb:
     }
 
     /* Check the address space */
-    if (type == ACCESS_CODE) {
-        if (msr_ir != (tlb->attr & 1)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & PAGE_EXEC) {
-            LOG_SWTLB("%s: good TLB!\n", __func__);
-            return 0;
-        }
-
-        LOG_SWTLB("%s: no PAGE_EXEC: %x\n", __func__, prot2);
-        ret = -3;
-    } else {
-        if (msr_dr != (tlb->attr & 1)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
-            LOG_SWTLB("%s: found TLB!\n", __func__);
-            return 0;
-        }
+    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
+        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        return -1;
+    }
 
-        LOG_SWTLB("%s: PAGE_READ/WRITE doesn't match: %x\n", __func__, prot2);
-        ret = -2;
+    *prot = prot2;
+    if (prot2 & prot_for_access_type(access_type)) {
+        LOG_SWTLB("%s: good TLB!\n", __func__);
+        return 0;
     }
 
-    return ret;
+    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    return access_type == MMU_INST_FETCH ? -3 : -2;
 }
 
 static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
@@ -819,7 +801,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     for (i = 0; i < env->nb_tlb; i++) {
         tlb = &env->tlb.tlbe[i];
         ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                 access_type, type, i);
+                                 access_type, i);
         if (ret != -1) {
             break;
         }
-- 
2.31.1


