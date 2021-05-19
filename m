Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21FC388F31
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:32:02 +0200 (CEST)
Received: from localhost ([::1]:56692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMIr-0004gQ-Km
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLiA-0003rX-Rf; Wed, 19 May 2021 08:54:07 -0400
Received: from ozlabs.org ([203.11.71.1]:35721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLi7-0001lZ-OE; Wed, 19 May 2021 08:54:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnv3vbfz9sWp; Wed, 19 May 2021 22:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428739;
 bh=umesooVcUeFH4XPX81RM+rIlHRDgiF1YwCRIpSTNnjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IhSX28fSoIUYsS4Gw6MB5NvLp14+yMQ+kBUCmjm8Q/KDdQbkmydpDsyFYPrcjppvW
 EbfUW1hDJLCSNMOd0Ndb9fnMy2+yfIC4pawY5NeG/hmVMbSRXfZmsVQXFmVoalfTBJ
 LbLO0s220j2Ha99UbIyn699YBHSaqUZbmBCNLrL4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 47/48] target/ppc: Remove type argument from
 mmubooke206_check_tlb
Date: Wed, 19 May 2021 22:51:47 +1000
Message-Id: <20210519125148.27720-48-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Message-Id: <20210518201146.794854-15-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 46 ++++++++++++++---------------------------
 1 file changed, 15 insertions(+), 31 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 7535a1aa7d..144a14abd9 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -944,10 +944,8 @@ static bool mmubooke206_get_as(CPUPPCState *env,
 static int mmubooke206_check_tlb(CPUPPCState *env, ppcmas_tlb_t *tlb,
                                  hwaddr *raddr, int *prot,
                                  target_ulong address,
-                                 MMUAccessType access_type,
-                                 int type, int mmu_idx)
+                                 MMUAccessType access_type, int mmu_idx)
 {
-    int ret;
     int prot2 = 0;
     uint32_t epid;
     bool as, pr;
@@ -1004,39 +1002,25 @@ found_tlb:
     }
 
     /* Check the address space and permissions */
-    if (type == ACCESS_CODE) {
+    if (access_type == MMU_INST_FETCH) {
         /* There is no way to fetch code using epid load */
         assert(!use_epid);
-        if (msr_ir != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
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
-        if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
+        as = msr_ir;
+    }
 
-        *prot = prot2;
-        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
-            LOG_SWTLB("%s: found TLB!\n", __func__);
-            return 0;
-        }
+    if (as != ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
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
 
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
@@ -1060,7 +1044,7 @@ static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                 continue;
             }
             ret = mmubooke206_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                        access_type, type, mmu_idx);
+                                        access_type, mmu_idx);
             if (ret != -1) {
                 goto found_tlb;
             }
-- 
2.31.1


