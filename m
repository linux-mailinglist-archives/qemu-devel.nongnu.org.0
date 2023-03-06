Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA396AB3BC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyu7-0004XG-UF; Sun, 05 Mar 2023 19:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytY-0004NL-10
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:04 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytV-0006N2-Cy
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:03 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7390633pjz.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNJ0BoJd5Ft7YOUGU8YN5Xif+AtaH26DAZFojfLBnfQ=;
 b=DTeGAQFo1ocIc2sY1vG3sI8jNr21lymGFuBrGdSw+UPMRWEibusKujCIUgyv1EAGsn
 ayBkIfAmX2auRCx5U4nbgoW3DoReRqP7h0nbd4kotrRwQgKHnMpqmxPY1YoF4Xg7kjIy
 4W414AFmwZMBJTjzJ/n1f9QJ7liKL5A7nLC7rbgDbYNraPzSAH3YZnPZoyGCJd6nwequ
 xNII2xZtBoGbZ5anuBxv9U9Qak+fpclwTFjyXDgGyEKQPC6+53DuH4oVyNnFrWdWPJRk
 xQDSYUpZsOA81lKek0lr0DD/jL2bYe16K4j2gF2zEZy7OGlGLxbQjWGkWoAOxJ+RLhfE
 TnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNJ0BoJd5Ft7YOUGU8YN5Xif+AtaH26DAZFojfLBnfQ=;
 b=WxTWlIR3IEGPE5et/uJOdGdCk7EYY6e/zK7Xo+fpyuXvJuE1xOTY0vS4x3SXaX6KR0
 uq1/l2W70whbmnCPdj/alEqlf1RWeDv2fePt1q9EBDvdGK1Ksdit2zwYImZYa5/6Dyxe
 mdTWiazMQOoLoJ+aKV3wF4AyeyrolVbLiuLIK6lL9v7wShd6fs7yg4JuNGxyQorc5GRU
 uyb9Wz9MDbcyYqLhTklFl0ubvPl6alNP5l29GXnGpuRmM2MeRbEcNgVBhgK1lPOuepg3
 hpTjWhlAeaT3QhLd4s9LEbGzyg/YXXsZMbU4mH8SzhZBJOpD3ccNU67J3n9gYirsil4n
 jX8Q==
X-Gm-Message-State: AO0yUKUP5qhot7ScVWguakjpdFlF4ORXx+P9B+qLk1zxQRYZpyv21+a8
 qWgYA0qnRiMEIhtdkBkNsd9eRTaw5NGyjQcLFsrd5Q==
X-Google-Smtp-Source: AK7set+5MgRa38Ct3lQcK2jCEzipROkc1G1Oz1tXVuNUHigB3V6rcDveoIS1999pNMZkqbck5MPB5w==
X-Received: by 2002:a17:90b:180b:b0:233:e660:aaae with SMTP id
 lw11-20020a17090b180b00b00233e660aaaemr9818919pjb.16.1678063199410; 
 Sun, 05 Mar 2023 16:39:59 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:39:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/84] target/sparc: Use tlb_set_page_full
Date: Sun,  5 Mar 2023 16:38:34 -0800
Message-Id: <20230306003954.1866998-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pass CPUTLBEntryFull to get_physical_address instead
of a collection of pointers.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/mmu_helper.c | 121 +++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 67 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 6e7f46f847..453498c670 100644
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
@@ -157,16 +156,17 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
                 case 2: /* L3 PTE */
                     page_offset = 0;
                 }
-                *page_size = TARGET_PAGE_SIZE;
+                full->lg_page_size = TARGET_PAGE_BITS;
                 break;
             case 2: /* L2 PTE */
                 page_offset = address & 0x3f000;
-                *page_size = 0x40000;
+                full->lg_page_size = 18;
             }
             break;
         case 2: /* L1 PTE */
             page_offset = address & 0xfff000;
-            *page_size = 0x1000000;
+            full->lg_page_size = 24;
+            break;
         }
     }
 
@@ -188,16 +188,16 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
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
 
@@ -208,11 +208,9 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
-    hwaddr paddr;
+    CPUTLBEntryFull full = {};
     target_ulong vaddr;
-    target_ulong page_size;
-    int error_code = 0, prot, access_index;
-    MemTxAttrs attrs = {};
+    int error_code = 0, access_index;
 
     /*
      * TODO: If we ever need tlb_vaddr_to_host for this target,
@@ -223,16 +221,15 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     assert(!probe);
 
     address &= TARGET_PAGE_MASK;
-    error_code = get_physical_address(env, &paddr, &prot, &access_index, &attrs,
-                                      address, access_type,
-                                      mmu_idx, &page_size);
+    error_code = get_physical_address(env, &full, &access_index,
+                                      address, access_type, mmu_idx);
     vaddr = address;
     if (likely(error_code == 0)) {
         qemu_log_mask(CPU_LOG_MMU,
                       "Translate at %" VADDR_PRIx " -> "
                       HWADDR_FMT_plx ", vaddr " TARGET_FMT_lx "\n",
-                      address, paddr, vaddr);
-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, page_size);
+                      address, full.phys_addr, vaddr);
+        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
         return true;
     }
 
@@ -247,8 +244,8 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            permissions. If no mapping is available, redirect accesses to
            neverland. Fake/overridden mappings will be flushed when
            switching to normal mode. */
-        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        tlb_set_page(cs, vaddr, paddr, prot, mmu_idx, TARGET_PAGE_SIZE);
+        full.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        tlb_set_page_full(cs, mmu_idx, vaddr, &full);
         return true;
     } else {
         if (access_type == MMU_INST_FETCH) {
@@ -545,8 +542,7 @@ static uint64_t build_sfsr(CPUSPARCState *env, int mmu_idx, int rw)
     return sfsr;
 }
 
-static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
-                                     int *prot, MemTxAttrs *attrs,
+static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
                                      target_ulong address, int rw, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
@@ -579,11 +575,12 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
 
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
@@ -616,9 +613,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
             }
 
             if (!do_fault) {
-                *prot = PAGE_READ;
+                full->prot = PAGE_READ;
                 if (TTE_IS_W_OK(env->dtlb[i].tte)) {
-                    *prot |= PAGE_WRITE;
+                    full->prot |= PAGE_WRITE;
                 }
 
                 TTE_SET_USED(env->dtlb[i].tte);
@@ -645,8 +642,7 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
     return 1;
 }
 
-static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
-                                     int *prot, MemTxAttrs *attrs,
+static int get_physical_address_code(CPUSPARCState *env, CPUTLBEntryFull *full,
                                      target_ulong address, int mmu_idx)
 {
     CPUState *cs = env_cpu(env);
@@ -681,7 +677,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
     for (i = 0; i < 64; i++) {
         /* ctx match, vaddr match, valid? */
         if (ultrasparc_tag_match(&env->itlb[i],
-                                 address, context, physical)) {
+                                 address, context, &full->phys_addr)) {
             /* access ok? */
             if (TTE_IS_PRIV(env->itlb[i].tte) && is_user) {
                 /* Fault status register */
@@ -708,7 +704,7 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
 
                 return 1;
             }
-            *prot = PAGE_EXEC;
+            full->prot = PAGE_EXEC;
             TTE_SET_USED(env->itlb[i].tte);
             return 0;
         }
@@ -722,14 +718,13 @@ static int get_physical_address_code(CPUSPARCState *env, hwaddr *physical,
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
@@ -747,17 +742,15 @@ static int get_physical_address(CPUSPARCState *env, hwaddr *physical,
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
 
@@ -768,25 +761,17 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
-    target_ulong vaddr;
-    hwaddr paddr;
-    target_ulong page_size;
-    MemTxAttrs attrs = {};
-    int error_code = 0, prot, access_index;
+    CPUTLBEntryFull full = {};
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
-
-        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, prot, mmu_idx,
-                                page_size);
+        tlb_set_page_full(cs, mmu_idx, address, &full);
         return true;
     }
     if (probe) {
@@ -888,12 +873,14 @@ void dump_mmu(CPUSPARCState *env)
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
+    if (ret == 0) {
+        *phys = full.phys_addr;
+    }
+    return ret;
 }
 
 #if defined(TARGET_SPARC64)
-- 
2.34.1


