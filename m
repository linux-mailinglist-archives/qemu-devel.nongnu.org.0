Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543E388171
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:33:59 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Pe-0002hX-Ej
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64j-00018O-Jb
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:21 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:36397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64X-0006Ld-HB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:21 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso9767629otn.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAOCThhXXKzWEyU1N2Jujki8VzX4Cn5CzyuQOJ/ubYc=;
 b=w5+1Ep5twbeCod/oZOv1NumS78bPPtAAFySPXFKJ2jxV2jyN1jwDGrqo0gLnPQ7qXe
 CINEs7F1AIr+s9hzfA+TmV3feiOcZj0ow/GWiffwiQmzNdynWpfwLLLkBDpVh/QpGXHo
 wPq1L76OFSUdLvKqf4Pbq+xwTIS15RZ83oVyAAyIMMYSqZI3dt3NzaACYDdEClIGU3BF
 i4j72cQMWb5dAYeokblOl3fZq+53bf2LVYMLWUUxO7WwJHlpXizMyPGaxo3l3ii53fe+
 DHuc2yhXGGKMKqRkSpMeMXubJkgiRjtAG4UMKsel8rK8qEMhuGMXF9vF+7DR4bPWwsxx
 59iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAOCThhXXKzWEyU1N2Jujki8VzX4Cn5CzyuQOJ/ubYc=;
 b=AUYeecJK5PnziZbSWWe+ZALPHzdBvEcim/5lfh8U1J099qQytPjVd5AY1S/bPwNIm3
 HJyKW+k9hZZGvw7uPXY4G8BYse0iDxyB0bHOHXe/uypS/x4uAPXbpNYx2tW/6xycRlDJ
 JqEJFQVfPyqqpsY/Y/Ah0lrjU60xJqS9Qqdsffox8Vue7ixr3WQ5f23LOjyW/a222arX
 K93hPZcRLI8Pkpw/ameTTXUtR1menwi6rncR4rrmlcOmFHQDS0c4+0DyAsrN/pynjr8H
 8Yq4rqnxibivXHO08Il5+7NNoetIsSW5ngBsfmmTdFjhwTaNs2hi5NhyFpv+U2uQucx6
 OagQ==
X-Gm-Message-State: AOAM533toaJLagh/IbSxKra1jjtIADDIW04jmzrt6kvAK6GZNnOgplWq
 LGEdDwgUNgivIEVTdoYufxLjd1zWiRvz6ZLw
X-Google-Smtp-Source: ABdhPJx5yP9BwlJ3NdbG2l3hBwmAPduEGrpSG3EodlhE88T3zOGPlj7ogwBG9S7DnxOpSGwV6PtY5A==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr5854334otb.257.1621368728154; 
 Tue, 18 May 2021 13:12:08 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/24] target/ppc: Split out ppc_hash64_xlate
Date: Tue, 18 May 2021 15:11:42 -0500
Message-Id: <20210518201146.794854-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the interface of ppc_radix64_xlate, putting all of
the logic for hash64 translation into a single function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash64.c | 125 +++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 66 deletions(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 877a01a296..3024dd1e8c 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -866,8 +866,10 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
     return -1;
 }
 
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -911,9 +913,11 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             slb = &vrma_slbe;
             if (build_vrma_slbe(cpu, slb) != 0) {
                 /* Invalid VRMA setup, machine check */
-                cs->exception_index = POWERPC_EXCP_MCHECK;
-                env->error_code = 0;
-                return 1;
+                if (guest_visible) {
+                    cs->exception_index = POWERPC_EXCP_MCHECK;
+                    env->error_code = 0;
+                }
+                return false;
             }
 
             goto skip_slb_search;
@@ -922,6 +926,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
             /* Emulated old-style RMO mode, bounds check against RMLS */
             if (raddr >= limit) {
+                if (!guest_visible) {
+                    return false;
+                }
                 switch (access_type) {
                 case MMU_INST_FETCH:
                     ppc_hash64_set_isi(cs, SRR1_PROTFAULT);
@@ -936,15 +943,16 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
                 default:
                     g_assert_not_reached();
                 }
-                return 1;
+                return false;
             }
 
             raddr |= env->spr[SPR_RMOR];
         }
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+
+        *raddrp = raddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *psizep = TARGET_PAGE_BITS;
+        return true;
     }
 
     /* 2. Translation is on, so look up the SLB */
@@ -957,6 +965,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
             exit(1);
         }
         /* Segment still not found, generate the appropriate interrupt */
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             cs->exception_index = POWERPC_EXCP_ISEG;
@@ -971,20 +982,25 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
 
-skip_slb_search:
+ skip_slb_search:
 
     /* 3. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH && (slb->vsid & SLB_VSID_N)) {
-        ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
-        return 1;
+        if (guest_visible) {
+            ppc_hash64_set_isi(cs, SRR1_NOEXEC_GUARD);
+        }
+        return false;
     }
 
     /* 4. Locate the PTE in the hash table */
     ptex = ppc_hash64_htab_lookup(cpu, slb, eaddr, &pte, &apshift);
     if (ptex == -1) {
+        if (!guest_visible) {
+            return false;
+        }
         switch (access_type) {
         case MMU_INST_FETCH:
             ppc_hash64_set_isi(cs, SRR1_NOPTE);
@@ -998,7 +1014,7 @@ skip_slb_search:
         default:
             g_assert_not_reached();
         }
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                   "found PTE at index %08" HWADDR_PRIx "\n", ptex);
@@ -1014,6 +1030,9 @@ skip_slb_search:
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
+        if (!guest_visible) {
+            return false;
+        }
         if (access_type == MMU_INST_FETCH) {
             int srr1 = 0;
             if (PAGE_EXEC & ~exec_prot) {
@@ -1038,7 +1057,7 @@ skip_slb_search:
             }
             ppc_hash64_set_dsi(cs, eaddr, dsisr);
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -1062,66 +1081,40 @@ skip_slb_search:
 
     /* 7. Determine the real address from the PTE */
 
-    raddr = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
+    *raddrp = deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, eaddr);
+    *protp = prot;
+    *psizep = apshift;
+    return true;
+}
+
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    if (!ppc_hash64_xlate(cpu, eaddr, access_type, &raddr,
+                          &page_size, &prot, true)) {
+        return 1;
+    }
 
     tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, 1ULL << apshift);
-
+                 prot, mmu_idx, 1UL << page_size);
     return 0;
 }
 
-hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr)
+hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &cpu->env;
-    ppc_slb_t vrma_slbe;
-    ppc_slb_t *slb;
-    hwaddr ptex, raddr;
-    ppc_hash_pte64_t pte;
-    unsigned apshift;
+    int psize, prot;
+    hwaddr raddr;
 
-    /* Handle real mode */
-    if (msr_dr == 0) {
-        /* In real mode the top 4 effective address bits are ignored */
-        raddr = addr & 0x0FFFFFFFFFFFFFFFULL;
-
-        if (cpu->vhyp) {
-            /*
-             * In virtual hypervisor mode, there's nothing to do:
-             *   EA == GPA == qemu guest address
-             */
-            return raddr;
-        } else if ((msr_hv || !env->has_hv_mode) && !(addr >> 63)) {
-            /* In HV mode, add HRMOR if top EA bit is clear */
-            return raddr | env->spr[SPR_HRMOR];
-        } else if (ppc_hash64_use_vrma(env)) {
-            /* Emulated VRMA mode */
-            slb = &vrma_slbe;
-            if (build_vrma_slbe(cpu, slb) != 0) {
-                return -1;
-            }
-        } else {
-            target_ulong limit = rmls_limit(cpu);
-
-            /* Emulated old-style RMO mode, bounds check against RMLS */
-            if (raddr >= limit) {
-                return -1;
-            }
-            return raddr | env->spr[SPR_RMOR];
-        }
-    } else {
-        slb = slb_lookup(cpu, addr);
-        if (!slb) {
-            return -1;
-        }
-    }
-
-    ptex = ppc_hash64_htab_lookup(cpu, slb, addr, &pte, &apshift);
-    if (ptex == -1) {
+    if (!ppc_hash64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                          &psize, &prot, false)) {
         return -1;
     }
 
-    return deposit64(pte.pte1 & HPTE64_R_RPN, 0, apshift, addr)
-        & TARGET_PAGE_MASK;
+    return raddr & TARGET_PAGE_MASK;
 }
 
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
-- 
2.25.1


