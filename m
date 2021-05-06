Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509903758D7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:01:18 +0200 (CEST)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehNF-00021v-Br
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2r-0004mX-RM; Thu, 06 May 2021 12:40:15 -0400
Received: from [201.28.113.2] (port=23611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2q-0001sf-3v; Thu, 06 May 2021 12:40:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 6 May 2021 13:39:51 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 20E6D800E42;
 Thu,  6 May 2021 13:39:51 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/4] target/ppc: moved function out of mmu-hash64
Date: Thu,  6 May 2021 13:39:39 -0300
Message-Id: <20210506163941.106984-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 06 May 2021 16:39:51.0277 (UTC)
 FILETIME=[6F6EA9D0:01D74296]
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 farosas@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function ppc_hash64_filter_pagesizes has been moved from a function
with prototype in mmu-hash64.h and implemented in mmu-hash64.c to
a static function in hw/ppc/spapr_caps.c as it's only used in that file.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
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
2.17.1


