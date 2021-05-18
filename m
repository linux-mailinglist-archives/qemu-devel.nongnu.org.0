Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D7038817A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:37:29 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6T2-0008GE-Ae
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64p-0001aM-Kj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:27 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64a-0006Nj-DR
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:27 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso9795986ote.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVabIlHd+1O8w9MxTet9IEJq8n9egPdXmu6+V9UGjDE=;
 b=aD9V1SUsYYviIudB9itu72zOfak9PPJna0DVlp2G6DQLd2GCCjlDeeYCSgam6caHyN
 HzxbyZPqCvvkWzGIG1s5JCMDLR5C6cq/b88OqOU6+wArydtOp+LPeyozBokHY64uIITh
 7lZkgS2OHuCG4dj/Q4YdXeDfDWCPlPOf4d0wG1Qj5E4ewV4OmqpaS0Y82/KJNlMYiPFy
 UsvNKXX4bVlKtookyvWUZbQRSmDy376HpUdbU0rFJeBaEpSsdOThIeSB45IXm43XEhvs
 HJJivnVPaIel9UOaQth1orqCuhESKXEhAC8CxgwHKrUKnZToCSs3S6zW8KMpOyKsB5YS
 gP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVabIlHd+1O8w9MxTet9IEJq8n9egPdXmu6+V9UGjDE=;
 b=nUsvjsyy/iCQtTG8Y5tLCkiLJw6K+33lNjPctN4J8HW8/T6TP+g8gR0fi/W7LP9xXa
 JAlVGboSFS2vsI6Qlpmt29wtCvifHMidooYMdVyvUgaFsn8QG7W5ccJXNGHaZNfnV5NW
 qD0MyFpYy0iigVHdM2v2PH7IEIlBhuAeIkQsZTel7xzgLkW8Rusp9b+yJnzPjZbdgFUG
 zFAWX1wgnAXlv/qQYm1WsGm9hImeBD7nv5cm9xauCpJPSLavAxpI3JN/x/NGSl8nEn69
 mKrWCBiNKEjEChM6PPVFZ6QG9OtVNaKRhAylaCOgWEzqG6JTh9FjqjaOZSfoyLZUAeZW
 IdpQ==
X-Gm-Message-State: AOAM5338h0bFzsEX+wtvws1NEx5bOPF1iaAy8q1AdrJawkw0axnVFIuE
 QTicTz2Rtgjd5IMjxgYX0vAjRfyGP+t9cEQv
X-Google-Smtp-Source: ABdhPJz18uWLABLUztP0ryNThHPpgeVn2QTfzCqbHN15jokvMS8hziqQEIa5S4n304CPvXcfTZizEA==
X-Received: by 2002:a9d:4d84:: with SMTP id u4mr4154766otk.136.1621368731252; 
 Tue, 18 May 2021 13:12:11 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/24] target/ppc: Introduce ppc_xlate
Date: Tue, 18 May 2021 15:11:45 -0500
Message-Id: <20210518201146.794854-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create one common dispatch for all of the ppc_*_xlate functions.
Use ppc64_v3_radix to directly dispatch between ppc_radix64_xlate
and ppc_hash64_xlate.

Remove the separate *_handle_mmu_fault and *_get_phys_page_debug
functions, using common code for ppc_cpu_tlb_fill and
ppc_cpu_get_phys_page_debug.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-book3s-v3.h |   5 --
 target/ppc/mmu-hash32.h    |   6 +--
 target/ppc/mmu-hash64.h    |   6 +--
 target/ppc/mmu-radix64.h   |   6 +--
 target/ppc/mmu-book3s-v3.c |  19 -------
 target/ppc/mmu-hash32.c    |  38 ++-----------
 target/ppc/mmu-hash64.c    |  37 ++-----------
 target/ppc/mmu-radix64.c   |  38 ++-----------
 target/ppc/mmu_helper.c    | 106 ++++++++++++++-----------------------
 9 files changed, 58 insertions(+), 203 deletions(-)

diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
index 7b89be54b8..a1326df969 100644
--- a/target/ppc/mmu-book3s-v3.h
+++ b/target/ppc/mmu-book3s-v3.h
@@ -67,11 +67,6 @@ static inline bool ppc64_v3_radix(PowerPCCPU *cpu)
     return !!(cpu->env.spr[SPR_LPCR] & LPCR_HR);
 }
 
-hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr);
-
-int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                              int mmu_idx);
-
 static inline hwaddr ppc_hash64_hpt_base(PowerPCCPU *cpu)
 {
     uint64_t base;
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 30e35718a7..8694eccabd 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -4,9 +4,9 @@
 #ifndef CONFIG_USER_ONLY
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
-hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
-                                MMUAccessType access_type, int mmu_idx);
+bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible);
 
 /*
  * Segment register definitions
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 3e8a8eec1f..9f338e1fe9 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -7,9 +7,9 @@
 void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
-                                MMUAccessType access_type, int mmu_idx);
+bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
                                target_ulong pte0, target_ulong pte1);
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index 94bd72cb38..6b13b89b64 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -44,9 +44,9 @@
 
 #ifdef TARGET_PPC64
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                 MMUAccessType access_type, int mmu_idx);
-hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
+bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                       hwaddr *raddr, int *psizep, int *protp,
+                       bool guest_visible);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
 {
diff --git a/target/ppc/mmu-book3s-v3.c b/target/ppc/mmu-book3s-v3.c
index c78fd8dc0e..f4985bae78 100644
--- a/target/ppc/mmu-book3s-v3.c
+++ b/target/ppc/mmu-book3s-v3.c
@@ -23,25 +23,6 @@
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
 
-int ppc64_v3_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                              int mmu_idx)
-{
-    if (ppc64_v3_radix(cpu)) { /* Guest uses radix */
-        return ppc_radix64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
-    } else { /* Guest uses hash */
-        return ppc_hash64_handle_mmu_fault(cpu, eaddr, rwx, mmu_idx);
-    }
-}
-
-hwaddr ppc64_v3_get_phys_page_debug(PowerPCCPU *cpu, vaddr eaddr)
-{
-    if (ppc64_v3_radix(cpu)) {
-        return ppc_radix64_get_phys_page_debug(cpu, eaddr);
-    } else {
-        return ppc_hash64_get_phys_page_debug(cpu, eaddr);
-    }
-}
-
 bool ppc64_v3_get_pate(PowerPCCPU *cpu, target_ulong lpid, ppc_v3_pate_t *entry)
 {
     uint64_t patb = cpu->env.spr[SPR_PTCR] & PTCR_PATB;
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 959dc2ab53..32d1f4a954 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -425,10 +425,9 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn & ~mask) | (eaddr & mask);
 }
 
-static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddrp, int *psizep, int *protp,
-                             bool guest_visible)
+bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -570,34 +569,3 @@ static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
     *protp = prot;
     return true;
 }
-
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &raddr,
-                           &page_size, &prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL << page_size);
-    return 0;
-}
-
-hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
-                           &psize, &prot, false)) {
-        return -1;
-    }
-
-    return raddr & TARGET_PAGE_MASK;
-}
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 3024dd1e8c..ce0068590f 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -866,10 +866,9 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     return -1;
 }
 
-static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddrp, int *psizep, int *protp,
-                             bool guest_visible)
+bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -1087,36 +1086,6 @@ static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return true;
 }
 
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
-                          &page_size, &prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL << page_size);
-    return 0;
-}
-
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
-                          &psize, &prot, false)) {
-        return -1;
-    }
-
-    return raddr & TARGET_PAGE_MASK;
-}
-
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
                                target_ulong pte0, target_ulong pte1)
 {
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 7af3e697b2..eabfe4e261 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -464,10 +464,9 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                              MMUAccessType access_type,
-                              hwaddr *raddr, int *psizep, int *protp,
-                              bool guest_visible)
+bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                       hwaddr *raddr, int *psizep, int *protp,
+                       bool guest_visible)
 {
     CPUPPCState *env = &cpu->env;
     uint64_t lpid, pid;
@@ -585,34 +584,3 @@ static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
 
     return true;
 }
-
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                 MMUAccessType access_type, int mmu_idx)
-{
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
-
-    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
-                           &page_size, &prot, true)) {
-        return 1;
-    }
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL << page_size);
-    return 0;
-}
-
-hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
-{
-    int psize, prot;
-    hwaddr raddr;
-
-    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
-                           &psize, &prot, false)) {
-        return -1;
-    }
-
-    return raddr & TARGET_PAGE_MASK;
-}
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 68c2e59238..2535ea1836 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2915,98 +2915,72 @@ void helper_check_tlb_flush_global(CPUPPCState *env)
 
 /*****************************************************************************/
 
-static int cpu_ppc_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                    MMUAccessType access_type, int mmu_idx)
+static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
+                      hwaddr *raddrp, int *psizep, int *protp,
+                      int mmu_idx, bool guest_visible)
 {
-    CPUState *cs = CPU(cpu);
-    int page_size, prot;
-    hwaddr raddr;
+    switch (cpu->env.mmu_model) {
+#if defined(TARGET_PPC64)
+    case POWERPC_MMU_3_00:
+        if (ppc64_v3_radix(cpu)) {
+            return ppc_radix64_xlate(cpu, eaddr, access_type,
+                                     raddrp, psizep, protp, guest_visible);
+        }
+        /* fall through */
+    case POWERPC_MMU_64B:
+    case POWERPC_MMU_2_03:
+    case POWERPC_MMU_2_06:
+    case POWERPC_MMU_2_07:
+        return ppc_hash64_xlate(cpu, eaddr, access_type,
+                                raddrp, psizep, protp, guest_visible);
+#endif
 
-    if (!ppc_jumbo_xlate(cpu, eaddr, access_type, &raddr,
-                         &page_size, &prot, mmu_idx, true)) {
-        return 1;
+    case POWERPC_MMU_32B:
+    case POWERPC_MMU_601:
+        return ppc_hash32_xlate(cpu, eaddr, access_type,
+                                raddrp, psizep, protp, guest_visible);
+
+    default:
+        return ppc_jumbo_xlate(cpu, eaddr, access_type, raddrp,
+                               psizep, protp, mmu_idx, guest_visible);
     }
-
-    tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1UL << page_size);
-    return 0;
 }
 
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
     hwaddr raddr;
     int s, p;
 
-    switch (env->mmu_model) {
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        return ppc_hash64_get_phys_page_debug(cpu, addr);
-    case POWERPC_MMU_3_00:
-        return ppc64_v3_get_phys_page_debug(cpu, addr);
-#endif
-
-    case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
-        return ppc_hash32_get_phys_page_debug(cpu, addr);
-
-    default:
-        ;
-    }
-
     /*
      * Some MMUs have separate TLBs for code and data. If we only
      * try an MMU_DATA_LOAD, we may not be able to read instructions
      * mapped by code TLBs, so we also try a MMU_INST_FETCH.
      */
-    if (ppc_jumbo_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
-        ppc_jumbo_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) {
         return raddr & TARGET_PAGE_MASK;
     }
     return -1;
 }
 
-
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool probe, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
-    int ret;
+    hwaddr raddr;
+    int page_size, prot;
 
-    switch (env->mmu_model) {
-#if defined(TARGET_PPC64)
-    case POWERPC_MMU_64B:
-    case POWERPC_MMU_2_03:
-    case POWERPC_MMU_2_06:
-    case POWERPC_MMU_2_07:
-        ret = ppc_hash64_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-    case POWERPC_MMU_3_00:
-        ret = ppc64_v3_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-#endif
-
-    case POWERPC_MMU_32B:
-    case POWERPC_MMU_601:
-        ret = ppc_hash32_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
-
-    default:
-        ret = cpu_ppc_handle_mmu_fault(cpu, addr, access_type, mmu_idx);
-        break;
+    if (ppc_xlate(cpu, eaddr, access_type, &raddr,
+                  &page_size, &prot, mmu_idx, !probe)) {
+        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
+                     prot, mmu_idx, 1UL << page_size);
+        return true;
     }
-    if (unlikely(ret != 0)) {
-        if (probe) {
-            return false;
-        }
-        raise_exception_err_ra(env, cs->exception_index, env->error_code,
-                               retaddr);
+    if (probe) {
+        return false;
     }
-    return true;
+    raise_exception_err_ra(&cpu->env, cs->exception_index,
+                           cpu->env.error_code, retaddr);
 }
-- 
2.25.1


