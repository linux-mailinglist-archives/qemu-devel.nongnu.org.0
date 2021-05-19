Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB6388E84
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:01:40 +0200 (CEST)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLpT-0008G2-1A
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLga-0000ec-IB; Wed, 19 May 2021 08:52:28 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgX-00017a-M8; Wed, 19 May 2021 08:52:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnX2qPYz9sXS; Wed, 19 May 2021 22:52:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428720;
 bh=fPgOqNCttS4nP8bU9GwG0rrKEjYX+fEmmXtxRvF78io=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R8PBDqpdK0P2g28pNyz7L3FHfjcKzn5AI2P0aoBrvmQBIZs6Uk4X9ROxBp4ts81/+
 +2sfSDRa19m6p5wRyfuRaij1oDdrXGpUukM7VsyV2qn5dRfZ5M9nxsGh6Yb5veX2t/
 qa9vcPR8/b7IYnsYKZ/RVx+A7C/+0vWXtuaOYXWE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/48] target/ppc: moved function out of mmu-hash64
Date: Wed, 19 May 2021 22:51:07 +1000
Message-Id: <20210519125148.27720-8-david@gibson.dropbear.id.au>
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
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

The function ppc_hash64_filter_pagesizes has been moved from a function
with prototype in mmu-hash64.h and implemented in mmu-hash64.c to
a static function in hw/ppc/spapr_caps.c as it's only used in that file.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210506163941.106984-3-lucas.araujo@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_caps.c     | 59 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/mmu-hash64.c | 57 ---------------------------------------
 target/ppc/mmu-hash64.h |  3 ---
 3 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9ea7ddd1e9..d0c419b392 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -371,6 +371,65 @@ static bool spapr_pagesize_cb(void *opaque, uint32_t seg_pshift,
     return true;
 }
 
+static void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
+                                 bool (*cb)(void *, uint32_t, uint32_t),
+                                 void *opaque)
+{
+    PPCHash64Options *opts = cpu->hash64_opts;
+    int i;
+    int n = 0;
+    bool ci_largepage = false;
+
+    assert(opts);
+
+    n = 0;
+    for (i = 0; i < ARRAY_SIZE(opts->sps); i++) {
+        PPCHash64SegmentPageSizes *sps = &opts->sps[i];
+        int j;
+        int m = 0;
+
+        assert(n <= i);
+
+        if (!sps->page_shift) {
+            break;
+        }
+
+        for (j = 0; j < ARRAY_SIZE(sps->enc); j++) {
+            PPCHash64PageSize *ps = &sps->enc[j];
+
+            assert(m <= j);
+            if (!ps->page_shift) {
+                break;
+            }
+
+            if (cb(opaque, sps->page_shift, ps->page_shift)) {
+                if (ps->page_shift >= 16) {
+                    ci_largepage = true;
+                }
+                sps->enc[m++] = *ps;
+            }
+        }
+
+        /* Clear rest of the row */
+        for (j = m; j < ARRAY_SIZE(sps->enc); j++) {
+            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
+        }
+
+        if (m) {
+            n++;
+        }
+    }
+
+    /* Clear the rest of the table */
+    for (i = n; i < ARRAY_SIZE(opts->sps); i++) {
+        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
+    }
+
+    if (!ci_largepage) {
+        opts->flags &= ~PPC_HASH64_CI_LARGEPAGE;
+    }
+}
+
 static void cap_hpt_maxpagesize_cpu_apply(SpaprMachineState *spapr,
                                           PowerPCCPU *cpu,
                                           uint8_t val, Error **errp)
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index d517a99832..be3596f27b 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1200,61 +1200,4 @@ const PPCHash64Options ppc_hash64_opts_POWER7 = {
     }
 };
 
-void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
-                                 bool (*cb)(void *, uint32_t, uint32_t),
-                                 void *opaque)
-{
-    PPCHash64Options *opts = cpu->hash64_opts;
-    int i;
-    int n = 0;
-    bool ci_largepage = false;
-
-    assert(opts);
-
-    n = 0;
-    for (i = 0; i < ARRAY_SIZE(opts->sps); i++) {
-        PPCHash64SegmentPageSizes *sps = &opts->sps[i];
-        int j;
-        int m = 0;
 
-        assert(n <= i);
-
-        if (!sps->page_shift) {
-            break;
-        }
-
-        for (j = 0; j < ARRAY_SIZE(sps->enc); j++) {
-            PPCHash64PageSize *ps = &sps->enc[j];
-
-            assert(m <= j);
-            if (!ps->page_shift) {
-                break;
-            }
-
-            if (cb(opaque, sps->page_shift, ps->page_shift)) {
-                if (ps->page_shift >= 16) {
-                    ci_largepage = true;
-                }
-                sps->enc[m++] = *ps;
-            }
-        }
-
-        /* Clear rest of the row */
-        for (j = m; j < ARRAY_SIZE(sps->enc); j++) {
-            memset(&sps->enc[j], 0, sizeof(sps->enc[j]));
-        }
-
-        if (m) {
-            n++;
-        }
-    }
-
-    /* Clear the rest of the table */
-    for (i = n; i < ARRAY_SIZE(opts->sps); i++) {
-        memset(&opts->sps[i], 0, sizeof(opts->sps[i]));
-    }
-
-    if (!ci_largepage) {
-        opts->flags &= ~PPC_HASH64_CI_LARGEPAGE;
-    }
-}
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 87729d48b3..5dfd7f8b93 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -18,9 +18,6 @@ unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 void ppc_hash64_init(PowerPCCPU *cpu);
 void ppc_hash64_finalize(PowerPCCPU *cpu);
-void ppc_hash64_filter_pagesizes(PowerPCCPU *cpu,
-                                 bool (*cb)(void *, uint32_t, uint32_t),
-                                 void *opaque);
 #endif
 
 /*
-- 
2.31.1


