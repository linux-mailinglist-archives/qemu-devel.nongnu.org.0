Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9113388168
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:29:55 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Li-0005z8-JS
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64k-0001Cb-Dh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:22 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64Y-0006Lm-GE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:22 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 o14-20020a4a384e0000b029020ec48a2358so430796oof.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dI0TcqqVur7KeZZ864aPqiTFlL/jbhkC3bypNwh4QZk=;
 b=cQUg/zeeKSHzz2eKoQgUEzK2UnqFG2PyGIQiN8q6aeNxYBHhhYeicdTzxi+3CnK6gd
 aDv6dhUvC4OSm5yjhZ0dYLz7fGN/uxrhKXa0WZPDTJtYUBuks+86RmByCj2awY7LTx6t
 JMfeZLygdtRz9PaWfabFs5FUozsmnFCy+4IOUGS+L5ucJxej1kEV4doWuC9gjKlwL90V
 SAkG7xFK0xO9GfyRlL3vTRa+XHdjtbb+6r6IxqctTBJmltch5RQyPljz80lPN28j7fDy
 zmfa5rqqh/ETS2cpJ5J0h/3VT/PoUumaH7GyeBqrFTBCmJmnX8qfS9owZrMGNmX3iVfR
 DQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dI0TcqqVur7KeZZ864aPqiTFlL/jbhkC3bypNwh4QZk=;
 b=MRejGQbWTrhMlocCZ6YFXQDPfwpb41JJFahVEMKoCrheMJF2+trkaEangW4Z1Xx+gV
 lQyw1uT1+10cZNkEsA129oiSmqjc4OFF0ek6aXzBFJE8E8cQ2eFkFc1TOhqYyjFgKY6m
 GcNJktNI6t7ZiBPlFeM50QGfe1NI0G/ONKMddgsB1b9AJzUAeWTypTDdsQFw1v8A4uDh
 OXINFGtdbfki3DajmosmMI+n51beuT/10Qo/mvjzhwLKomgoF4XaJ/EVczxgTH2xKH16
 M69vIFMoekNgLSkT7xWnneW8rIEbm6fCIa6R8m0kvSHd2K64BD6R5eSR0tplcUjkOPnP
 R/nQ==
X-Gm-Message-State: AOAM531FGD0AUoIqwMQyUpWy7QotrmcBjp5XZv8jvXuGtaUHn0t7PmeC
 fbqxm6s8gPpW1oPHG4ji4NO3kI+7FHCIhC81
X-Google-Smtp-Source: ABdhPJyj7GT7yzUtIMoySbreooa3a1T8bGybiN8iaMue2aVttLz/8hCWPnm8yVGQiSA55iujkzROuw==
X-Received: by 2002:a4a:aa41:: with SMTP id y1mr5880764oom.52.1621368729184;
 Tue, 18 May 2021 13:12:09 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/24] target/ppc: Split out ppc_hash32_xlate
Date: Tue, 18 May 2021 15:11:43 -0500
Message-Id: <20210518201146.794854-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
the logic for hash32 translation into a single entry point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash32.c | 224 ++++++++++++++++++++--------------------
 1 file changed, 113 insertions(+), 111 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index d51be59f95..959dc2ab53 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -219,10 +219,11 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
     return -1;
 }
 
-static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
-                                   target_ulong eaddr,
-                                   MMUAccessType access_type,
-                                   hwaddr *raddr, int *prot)
+static bool ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
+                                    target_ulong eaddr,
+                                    MMUAccessType access_type,
+                                    hwaddr *raddr, int *prot,
+                                    bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -239,17 +240,23 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          */
         *raddr = ((sr & 0xF) << 28) | (eaddr & 0x0FFFFFFF);
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        return 0;
+        return true;
     }
 
     if (access_type == MMU_INST_FETCH) {
         /* No code fetch is allowed in direct-store areas */
-        cs->exception_index = POWERPC_EXCP_ISI;
-        env->error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs->exception_index = POWERPC_EXCP_ISI;
+            env->error_code = 0x10000000;
+        }
+        return false;
     }
 
-    switch (env->access_type) {
+    /*
+     * From ppc_cpu_get_phys_page_debug, env->access_type is not set.
+     * Assume ACCESS_INT for that case.
+     */
+    switch (guest_visible ? env->access_type : ACCESS_INT) {
     case ACCESS_INT:
         /* Integer load/store : only access allowed */
         break;
@@ -258,7 +265,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         cs->exception_index = POWERPC_EXCP_ALIGN;
         env->error_code = POWERPC_EXCP_ALIGN_FP;
         env->spr[SPR_DAR] = eaddr;
-        return 1;
+        return false;
     case ACCESS_RES:
         /* lwarx, ldarx or srwcx. */
         env->error_code = 0;
@@ -268,7 +275,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x04000000;
         }
-        return 1;
+        return false;
     case ACCESS_CACHE:
         /*
          * dcba, dcbt, dcbtst, dcbf, dcbi, dcbst, dcbz, or icbi
@@ -277,7 +284,7 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
          * no-op, it's quite easy :-)
          */
         *raddr = eaddr;
-        return 0;
+        return true;
     case ACCESS_EXT:
         /* eciwx or ecowx */
         cs->exception_index = POWERPC_EXCP_DSI;
@@ -288,16 +295,18 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x04100000;
         }
-        return 1;
+        return false;
     default:
-        cpu_abort(cs, "ERROR: instruction should not need "
-                 "address translation\n");
+        cpu_abort(cs, "ERROR: insn should not need address translation\n");
     }
-    if ((access_type == MMU_DATA_STORE || key != 1) &&
-        (access_type == MMU_DATA_LOAD || key != 0)) {
+
+    *prot = key ? PAGE_READ | PAGE_WRITE : PAGE_READ;
+    if (*prot & prot_for_access_type(access_type)) {
         *raddr = eaddr;
-        return 0;
-    } else {
+        return true;
+    }
+
+    if (guest_visible) {
         cs->exception_index = POWERPC_EXCP_DSI;
         env->error_code = 0;
         env->spr[SPR_DAR] = eaddr;
@@ -306,8 +315,8 @@ static int ppc_hash32_direct_store(PowerPCCPU *cpu, target_ulong sr,
         } else {
             env->spr[SPR_DSISR] = 0x08000000;
         }
-        return 1;
     }
+    return false;
 }
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash)
@@ -416,8 +425,10 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn & ~mask) | (eaddr & mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                MMUAccessType access_type, int mmu_idx)
+static bool ppc_hash32_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                             MMUAccessType access_type,
+                             hwaddr *raddrp, int *psizep, int *protp,
+                             bool guest_visible)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -428,43 +439,43 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     int need_prot;
     hwaddr raddr;
 
-    need_prot = prot_for_access_type(access_type);
+    /* There are no hash32 large pages. */
+    *psizep = TARGET_PAGE_BITS;
 
     /* 1. Handle real mode accesses */
     if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
         /* Translation is off */
-        raddr = eaddr;
-        tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                     PAGE_READ | PAGE_WRITE | PAGE_EXEC, mmu_idx,
-                     TARGET_PAGE_SIZE);
-        return 0;
+        *raddrp = eaddr;
+        *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return true;
     }
 
+    need_prot = prot_for_access_type(access_type);
+
     /* 2. Check Block Address Translation entries (BATs) */
     if (env->nb_BATs != 0) {
-        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, &prot);
+        raddr = ppc_hash32_bat_lookup(cpu, eaddr, access_type, protp);
         if (raddr != -1) {
-            if (need_prot & ~prot) {
-                if (access_type == MMU_INST_FETCH) {
-                    cs->exception_index = POWERPC_EXCP_ISI;
-                    env->error_code = 0x08000000;
-                } else {
-                    cs->exception_index = POWERPC_EXCP_DSI;
-                    env->error_code = 0;
-                    env->spr[SPR_DAR] = eaddr;
-                    if (access_type == MMU_DATA_STORE) {
-                        env->spr[SPR_DSISR] = 0x0a000000;
+            if (need_prot & ~*protp) {
+                if (guest_visible) {
+                    if (access_type == MMU_INST_FETCH) {
+                        cs->exception_index = POWERPC_EXCP_ISI;
+                        env->error_code = 0x08000000;
                     } else {
-                        env->spr[SPR_DSISR] = 0x08000000;
+                        cs->exception_index = POWERPC_EXCP_DSI;
+                        env->error_code = 0;
+                        env->spr[SPR_DAR] = eaddr;
+                        if (access_type == MMU_DATA_STORE) {
+                            env->spr[SPR_DSISR] = 0x0a000000;
+                        } else {
+                            env->spr[SPR_DSISR] = 0x08000000;
+                        }
                     }
                 }
-                return 1;
+                return false;
             }
-
-            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
-                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
+            *raddrp = raddr;
+            return true;
         }
     }
 
@@ -473,42 +484,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 4. Handle direct store segments */
     if (sr & SR32_T) {
-        if (ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
-                                    &raddr, &prot) == 0) {
-            tlb_set_page(cs, eaddr & TARGET_PAGE_MASK,
-                         raddr & TARGET_PAGE_MASK, prot, mmu_idx,
-                         TARGET_PAGE_SIZE);
-            return 0;
-        } else {
-            return 1;
-        }
+        return ppc_hash32_direct_store(cpu, sr, eaddr, access_type,
+                                       raddrp, protp, guest_visible);
     }
 
     /* 5. Check for segment level no-execute violation */
     if (access_type == MMU_INST_FETCH && (sr & SR32_NX)) {
-        cs->exception_index = POWERPC_EXCP_ISI;
-        env->error_code = 0x10000000;
-        return 1;
+        if (guest_visible) {
+            cs->exception_index = POWERPC_EXCP_ISI;
+            env->error_code = 0x10000000;
+        }
+        return false;
     }
 
     /* 6. Locate the PTE in the hash table */
     pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
     if (pte_offset == -1) {
-        if (access_type == MMU_INST_FETCH) {
-            cs->exception_index = POWERPC_EXCP_ISI;
-            env->error_code = 0x40000000;
-        } else {
-            cs->exception_index = POWERPC_EXCP_DSI;
-            env->error_code = 0;
-            env->spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env->spr[SPR_DSISR] = 0x42000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs->exception_index = POWERPC_EXCP_ISI;
+                env->error_code = 0x40000000;
             } else {
-                env->spr[SPR_DSISR] = 0x40000000;
+                cs->exception_index = POWERPC_EXCP_DSI;
+                env->error_code = 0;
+                env->spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env->spr[SPR_DSISR] = 0x42000000;
+                } else {
+                    env->spr[SPR_DSISR] = 0x40000000;
+                }
             }
         }
-
-        return 1;
+        return false;
     }
     qemu_log_mask(CPU_LOG_MMU,
                 "found PTE at offset %08" HWADDR_PRIx "\n", pte_offset);
@@ -520,20 +527,22 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     if (need_prot & ~prot) {
         /* Access right violation */
         qemu_log_mask(CPU_LOG_MMU, "PTE access rejected\n");
-        if (access_type == MMU_INST_FETCH) {
-            cs->exception_index = POWERPC_EXCP_ISI;
-            env->error_code = 0x08000000;
-        } else {
-            cs->exception_index = POWERPC_EXCP_DSI;
-            env->error_code = 0;
-            env->spr[SPR_DAR] = eaddr;
-            if (access_type == MMU_DATA_STORE) {
-                env->spr[SPR_DSISR] = 0x0a000000;
+        if (guest_visible) {
+            if (access_type == MMU_INST_FETCH) {
+                cs->exception_index = POWERPC_EXCP_ISI;
+                env->error_code = 0x08000000;
             } else {
-                env->spr[SPR_DSISR] = 0x08000000;
+                cs->exception_index = POWERPC_EXCP_DSI;
+                env->error_code = 0;
+                env->spr[SPR_DAR] = eaddr;
+                if (access_type == MMU_DATA_STORE) {
+                    env->spr[SPR_DSISR] = 0x0a000000;
+                } else {
+                    env->spr[SPR_DSISR] = 0x08000000;
+                }
             }
         }
-        return 1;
+        return false;
     }
 
     qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -557,45 +566,38 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* 9. Determine the real address from the PTE */
 
-    raddr = ppc_hash32_pte_raddr(sr, pte, eaddr);
+    *raddrp = ppc_hash32_pte_raddr(sr, pte, eaddr);
+    *protp = prot;
+    return true;
+}
+
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    int page_size, prot;
+    hwaddr raddr;
+
+    /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
+    if (!ppc_hash32_xlate(cpu, eaddr, access_type, &raddr,
+                           &page_size, &prot, true)) {
+        return 1;
+    }
 
     tlb_set_page(cs, eaddr & TARGET_PAGE_MASK, raddr & TARGET_PAGE_MASK,
-                 prot, mmu_idx, TARGET_PAGE_SIZE);
-
+                 prot, mmu_idx, 1UL << page_size);
     return 0;
 }
 
 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
 {
-    CPUPPCState *env = &cpu->env;
-    target_ulong sr;
-    hwaddr pte_offset;
-    ppc_hash_pte32_t pte;
-    int prot;
+    int psize, prot;
+    hwaddr raddr;
 
-    if (msr_dr == 0) {
-        /* Translation is off */
-        return eaddr;
-    }
-
-    if (env->nb_BATs != 0) {
-        hwaddr raddr = ppc_hash32_bat_lookup(cpu, eaddr, 0, &prot);
-        if (raddr != -1) {
-            return raddr;
-        }
-    }
-
-    sr = env->sr[eaddr >> 28];
-
-    if (sr & SR32_T) {
-        /* FIXME: Add suitable debug support for Direct Store segments */
+    if (!ppc_hash32_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                           &psize, &prot, false)) {
         return -1;
     }
 
-    pte_offset = ppc_hash32_htab_lookup(cpu, sr, eaddr, &pte);
-    if (pte_offset == -1) {
-        return -1;
-    }
-
-    return ppc_hash32_pte_raddr(sr, pte, eaddr) & TARGET_PAGE_MASK;
+    return raddr & TARGET_PAGE_MASK;
 }
-- 
2.25.1


