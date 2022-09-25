Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108835E9270
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:07:04 +0200 (CEST)
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPTQ-0001AC-5Q
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEr-0002pK-PZ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:57 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEp-0000Mp-Rh
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:57 -0400
Received: by mail-qt1-x830.google.com with SMTP id cj27so2593817qtb.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=C4cnyVS8vICXRoqp2MTyChEcgnUmtmWgBGvL+B2MHMI=;
 b=B/fp7TvzSmBfDgNff2DADPv4m5v3HTv4eyTgU8sfP6BtWSS0zBU77oZ86pw1Rze9uv
 leMLHM5yOHohhg/Q5H+Pn66f2nImBqzlF/H8lMSrSW0BJgvc09kqY2ZJT64V22YjBm2D
 xZFKdPGIb9aLZ7QPAyYfEcrTnAueSQQ4fgnYYMAiteItJInoSGClr4ONTi7Yx+bcmGqx
 kAV7CCGpFzaWgk0TekJzRN42Z0n7LYokEXgxIqNl8Atiik0VXHxVvkN4YjmspD375M/r
 mgz6D7PRQTfHNRNdfJ5bf+8jkHtLSGhDX2Ag3cbrKtzkBDrvMSBydpsTtQj9AYHAHB/n
 5q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=C4cnyVS8vICXRoqp2MTyChEcgnUmtmWgBGvL+B2MHMI=;
 b=eoyTvvri6IJOCWis3n1LFlKtnUYW9qc68+UFKJY3urqaTbTlqKJ2dn9jL2x/Fbaqzk
 1oTDLuw9a6wc3Lj24FHp13bbeCUGeVItpWQKIkNTkCM1j/9kS3DqOnB0oDpjQ5wK/9mE
 HRgw91j1jki/iXPjnYQkg4p/yZvWcWhn43PEiEQSB1qSIDrzZAp6VEx2Kezq+XPggZw4
 i2HXx0OdVd3w+5/ZUfrNl0PlT8HxYQlLNKxTb2nsfWuU8Kkak9z3v50M5az9ipWs4kS3
 B1ZEusYXDXU54xI0ZcLHDwdiLfvN0hRRdH3gKnnSnUZDCpfaHciyXrGdet2KMWupKknv
 +2Bw==
X-Gm-Message-State: ACrzQf3ZdgzmX7Lwzc/6aooyDxRanKG2kz9k/RAIMEAnz6iux37Ypa59
 4Q6g7jyTAcmeLiNmQePHMU3Q6IBlNCL8kw==
X-Google-Smtp-Source: AMsMyM75E2B7cwPpZLm0+6hn5dbGVVY059k8flVYWvgYNZVqOao56Dsp4PvQHrR7ouvKonhS0C05lg==
X-Received: by 2002:a05:622a:11cd:b0:35d:d3a:6ecb with SMTP id
 n13-20020a05622a11cd00b0035d0d3a6ecbmr13870972qtk.376.1664103114850; 
 Sun, 25 Sep 2022 03:51:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v5 07/17] target/sparc: Use tlb_set_page_full
Date: Sun, 25 Sep 2022 10:51:14 +0000
Message-Id: <20220925105124.82033-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert get_physical_address and all subroutines to use
CPUTLBEntryFull, consolidating 4 pointer arguments, and
providing the larger structure to the lower layers.
This last will be important to the next patch.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 123 ++++++++++++++++----------------------
 1 file changed, 53 insertions(+), 70 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..08f656cbb6 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -64,10 +64,9 @@ static const int perm_table[2][8] = {
     }
 };
 
-static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index, MemTxAttrs *attrs,
-                                target_ulong address, int rw, int mmu_idx,
-                                target_ulong *page_size)
+static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
+                                int *access_index, target_ulong address,
+                                int rw, int mmu_idx)
 {
     int access_perms = 0;
     hwaddr pde_ptr;
@@ -80,20 +79,20 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
     is_user = mmu_idx == MMU_USER_IDX;
 
     if (mmu_idx == MMU_PHYS_IDX) {
-        *page_size = TARGET_PAGE_SIZE;
+        full->lg_page_size = TARGET_PAGE_BITS;
         /* Boot mode: instruction fetches are taken from PROM */
         if (rw == 2 && (env->mmuregs[0] & env->def.mmu_bm)) {
-            *physical = env->prom_addr | (address & 0x7ffffULL);
-            *prot = PAGE_READ | PAGE_EXEC;
+            full->phys_addr = env->prom_addr | (address & 0x7ffffULL);
+            full->prot = PAGE_READ | PAGE_EXEC;
             return 0;
         }
-        *physical = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        full->phys_addr = address;
+        full->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return 0;
     }
 
     *access_index = ((rw & 1) << 2) | (rw & 2) | (is_user ? 0 : 1);
-    *physical = 0xffffffffffff0000ULL;
+    full->phys_addr = 0xffffffffffff0000ULL;
 
     /* SPARC reference MMU table walk: Context table->L1->L2->PTE */
     /* Context base + context number */
@@ -157,16 +156,16 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
                 case 2: /* L3 PTE */
                     page_offset = 0;
                 }
-                *page_size = TARGET_PAGE_SIZE;
+                full->lg_page_size = TARGET_PAGE_BITS;
                 break;
             case 2: /* L2 PTE */
                 page_offset = address & 0x3f000;
-                *page_size = 0x40000;
+                full->lg_page_size = ctz32(0x40000);
             }
             break;
         case 2: /* L1 PTE */
             page_offset = address & 0xfff000;
-            *page_size = 0x1000000;
+            full->lg_page_size = ctz32(0x1000000);
         }
     }
 
@@ -188,16 +187,16 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
     }
 
     /* the page can be put in the TLB */
-    *prot = perm_table[is_user][access_perms];
+    full->prot = perm_table[is_user][access_perms];
     if (!(pde & PG_MODIFIED_MASK)) {
         /* only set write access if already dirty... otherwise wait
            for dirty access */
-        *prot &= ~PAGE_WRITE;
+        full->prot &= ~PAGE_WRITE;
     }
 
     /* Even if large ptes, we map only one 4KB page in the cache to
        avoid filling it too fast */
-    *physical = ((hwaddr)(pde & PTE_ADDR_MASK) << 4) + page_offset;
+    full->phys_addr = ((hwaddr)(pde & PTE_ADDR_MASK) << 4) + page_offset;
     return error_code;
 }
 
@@ -208,11 +207,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
-    hwaddr paddr;
-    target_ulong vaddr;
-    target_ulong page_size;
-    int error_code = 0, prot, access_index;
-    MemTxAttrs attrs = {};
+    CPUTLBEntryFull full = { };
+    int error_code = 0, access_index;
 
     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -223,16 +219,13 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     assert(!probe);
 
     address &= TARGET_PAGE_MASK;
-    error_code = get_physical_address(env, &paddr, &prot, &access_index, &attrs,
-                                      address, access_type,
-                                      mmu_idx, &page_size);
-    vaddr = address;
+    error_code = get_physical_address(env, &full, &access_index,
+                                      address, access_type, mmu_idx);
     if (likely(error_code == 0)) {
         qemu_log_mask(CPU_LOG_MMU,
-                      "Translate at %" VADDR_PRIx " -> "
-                      TARGET_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
-                      address, paddr, vaddr);
-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
+                      "Translate at %" VADDR_PRIx " -> " TARGET_FMT_plx "\n",
+                      address, full.phys_addr);
+        tlb_set_page_full(cs, mmu_idx, address, &full);
         return true;
     }
 
@@ -247,8 +240,9 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            permissions. If no mapping is available, redirect accesses to
            neverland. Fake/overridden mappings will be flushed when
            switching to normal mode. */
-        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, TARGET_PAGE_SIZE);
+        full.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        full.lg_page_size = TARGET_PAGE_BITS;
+        tlb_set_page_full(cs, mmu_idx, address, &full);
         return true;
     } else {
         if (access_type == MMU_INST_FETCH) {
@@ -545,8 +539,7 @@ static uint64_t build_sfsr(CPUSPARCState *env, int mmu_idx, int rw)
     return sfsr;
 }
 
-static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
-                                     int *prot, MemTxAttrs *attrs,
+static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
                                      target_ulong address, int rw, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
@@ -579,11 +572,12 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
 
     for (i = 0; i < 64; i++) {
         /* ctx match, vaddr match, valid? */
-        if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical)) {
+        if (ultrasparc_tag_match(&env->dtlb[i], address, context,
+                                 &full->phys_addr)) {
             int do_fault = 0;
 
             if (TTE_IS_IE(env->dtlb[i].tte)) {
-                attrs->byte_swap = true;
+                full->attrs.byte_swap = true;
             }
 
             /* access ok? */
@@ -616,9 +610,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
             }
 
             if (!do_fault) {
-                *prot = PAGE_READ;
+                full->prot = PAGE_READ;
                 if (TTE_IS_W_OK(env->dtlb[i].tte)) {
-                    *prot |= PAGE_WRITE;
+                    full->prot |= PAGE_WRITE;
                 }
 
                 TTE_SET_USED(env->dtlb[i].tte);
@@ -645,8 +639,7 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
     return 1;
 }
 
-static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
-                                     int *prot, MemTxAttrs *attrs,
+static int get_physical_address_code(CPUSPARCState *env, CPUTLBEntryFull *full,
                                      target_ulong address, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
@@ -681,7 +674,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
     for (i = 0; i < 64; i++) {
         /* ctx match, vaddr match, valid? */
         if (ultrasparc_tag_match(&env->itlb[i],
-                                 address, context, physical)) {
+                                 address, context, &full->phys_addr)) {
             /* access ok? */
             if (TTE_IS_PRIV(env->itlb[i].tte) && is_user) {
                 /* Fault status register */
@@ -708,7 +701,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
 
                 return 1;
             }
-            *prot = PAGE_EXEC;
+            full->prot = PAGE_EXEC;
             TTE_SET_USED(env->itlb[i].tte);
             return 0;
         }
@@ -722,14 +715,13 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
     return 1;
 }
 
-static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
-                                int *prot, int *access_index, MemTxAttrs *attrs,
-                                target_ulong address, int rw, int mmu_idx,
-                                target_ulong *page_size)
+static int get_physical_address(CPUSPARCState *env, CPUTLBEntryFull *full,
+                                int *access_index, target_ulong address,
+                                int rw, int mmu_idx)
 {
     /* ??? We treat everything as a small page, then explicitly flush
        everything when an entry is evicted.  */
-    *page_size = TARGET_PAGE_SIZE;
+    full->lg_page_size = TARGET_PAGE_BITS;
 
     /* safety net to catch wrong softmmu index use from dynamic code */
     if (env->tl > 0 && mmu_idx != MMU_NUCLEUS_IDX) {
@@ -747,17 +739,15 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
     }
 
     if (mmu_idx == MMU_PHYS_IDX) {
-        *physical = ultrasparc_truncate_physical(address);
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        full->phys_addr = ultrasparc_truncate_physical(address);
+        full->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return 0;
     }
 
     if (rw == 2) {
-        return get_physical_address_code(env, physical, prot, attrs, address,
-                                         mmu_idx);
+        return get_physical_address_code(env, full, address, mmu_idx);
     } else {
-        return get_physical_address_data(env, physical, prot, attrs, address,
-                                         rw, mmu_idx);
+        return get_physical_address_data(env, full, address, rw, mmu_idx);
     }
 }
 
@@ -768,25 +758,18 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
-    target_ulong vaddr;
-    hwaddr paddr;
-    target_ulong page_size;
-    MemTxAttrs attrs = {};
-    int error_code = 0, prot, access_index;
+    CPUTLBEntryFull full;
+    int error_code = 0, access_index;
 
     address &= TARGET_PAGE_MASK;
-    error_code = get_physical_address(env, &paddr, &prot, &access_index, &attrs,
-                                      address, access_type,
-                                      mmu_idx, &page_size);
+    error_code = get_physical_address(env, &full, &access_index,
+                                      address, access_type, mmu_idx);
     if (likely(error_code == 0)) {
-        vaddr = address;
-
-        trace_mmu_helper_mmu_fault(address, paddr, mmu_idx, env->tl,
+        trace_mmu_helper_mmu_fault(address, full.phys_addr, mmu_idx, env->tl,
                                    env->dmmu.mmu_primary_context,
                                    env->dmmu.mmu_secondary_context);
 
-        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
-                                page_size);
+        tlb_set_page_full(cs, mmu_idx, address, &full);
         return true;
     }
     if (probe) {
@@ -888,12 +871,12 @@ void dump_mmu(CPUSPARCState *env)
 static int cpu_sparc_get_phys_page(CPUSPARCState *env, hwaddr *phys,
                                    target_ulong addr, int rw, int mmu_idx)
 {
-    target_ulong page_size;
-    int prot, access_index;
-    MemTxAttrs attrs = {};
+    CPUTLBEntryFull full = {};
+    int access_index, ret;
 
-    return get_physical_address(env, phys, &prot, &access_index, &attrs, addr,
-                                rw, mmu_idx, &page_size);
+    ret = get_physical_address(env, &full, &access_index, addr, rw, mmu_idx);
+    *phys = full.phys_addr;
+    return ret;
 }
 
 #if defined(TARGET_SPARC64)
-- 
2.34.1


