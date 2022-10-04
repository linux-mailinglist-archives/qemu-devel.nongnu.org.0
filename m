Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E55F4A32
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:16:37 +0200 (CEST)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoLD-0003fA-PR
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyI-0001jC-GW
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyG-0000GX-8s
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c24so3488947pls.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dAY3x/lc+/32wE3SHUuBvqOuB1dTrfgmxaF5UaNYDSM=;
 b=w0P32aVrKB8kZshVn7wxdMSySieYubCTJ1BEs0SkykhCuH55O+C92Jt5K3RyB4R0aq
 z+ltoP9yAyBsVq7FV29UbiEc60WYPVaD/lH6JWLMcLcspHS0mhY/pAZj1cQBQsPRspdE
 ixC2DmV/Peemw7O7dpHTIha8512gkW76NwMImaTfJLVAeWtRLZwu9FftGzZeOjX+bj7c
 2Dn15SbIyJX6mIqHmrUHR3HEeu1J7m2w27rI275BIImWNBtt+yknAcrysd6lmgYpkcFp
 2PsW4nroruZsDk/yxGSqc5pRSvE7Ehp0wz7YYzP5Bh6jFGJ9Vn27nZ3GB8Ofi/L+xUsO
 37Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dAY3x/lc+/32wE3SHUuBvqOuB1dTrfgmxaF5UaNYDSM=;
 b=sJsVzMnaA0v5lzhl+f7gIrN2tOTsKa3rpEcYRUfOh2VVB/tmBReRiY34PKnQQZc4h3
 25aYsVfyl7xzwQy+e/JBWAQ9XN9ZPQWONLoSKRGh3ikoLAAutljUyjsX5CQ81do3ywGm
 onHlSQ/4gUOjG1NjEKAwfQGyyi1Amf6jYTXxMAMTZfeSDJwffyMoRNgfA44al/V+rs1p
 7BX+hkun+IIenVqJQ+2Lkd8OlqtWs10BbTMIxePTaKsqOy5Yd0QOXcieUsxGP48nXlFm
 FpuUzq2Lbsa7tWevAywkh24Dqv4t7nFtHin2Bkme4xTfDDF19Of0nHBfwhxOLoXorrfU
 afzA==
X-Gm-Message-State: ACrzQf2EzLaAriZOaTAmT1OUtF8KXX2xQf646oj4WfCgjL4oLHerR11/
 ezP6K5wKdeh6BENY+w/W8J5WZV/7J8xpwA==
X-Google-Smtp-Source: AMsMyM4lmQD5oTk8sUN3cfLc0rYhkzMrLit7+ahiBgehUTN+AlHB3HsPLGeBIVasd+crEqQo1MPomw==
X-Received: by 2002:a17:90b:1d11:b0:20a:9b3a:bf10 with SMTP id
 on17-20020a17090b1d1100b0020a9b3abf10mr1241628pjb.215.1664913170876; 
 Tue, 04 Oct 2022 12:52:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/20] accel/tcg: Introduce tlb_set_page_full
Date: Tue,  4 Oct 2022 12:52:29 -0700
Message-Id: <20221004195241.46491-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Now that we have collected all of the page data into
CPUTLBEntryFull, provide an interface to record that
all in one go, instead of using 4 arguments.  This interface
allows CPUTLBEntryFull to be extended without having to
change the number of arguments.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 14 +++++++++++
 include/exec/exec-all.h | 22 ++++++++++++++++++
 accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++---------------
 3 files changed, 69 insertions(+), 18 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index f70f54d850..5e12cc1854 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -148,7 +148,21 @@ typedef struct CPUTLBEntryFull {
      *     + the offset within the target MemoryRegion (otherwise)
      */
     hwaddr xlat_section;
+
+    /*
+     * @phys_addr contains the physical address in the address space
+     * given by cpu_asidx_from_attrs(cpu, @attrs).
+     */
+    hwaddr phys_addr;
+
+    /* @attrs contains the memory transaction attributes for the page. */
     MemTxAttrs attrs;
+
+    /* @prot contains the complete protections for the page. */
+    uint8_t prot;
+
+    /* @lg_page_size contains the log2 of the page size. */
+    uint8_t lg_page_size;
 } CPUTLBEntryFull;
 
 /*
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d255d69bc1..b1b920a713 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -257,6 +257,28 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                uint16_t idxmap,
                                                unsigned bits);
 
+/**
+ * tlb_set_page_full:
+ * @cpu: CPU context
+ * @mmu_idx: mmu index of the tlb to modify
+ * @vaddr: virtual address of the entry to add
+ * @full: the details of the tlb entry
+ *
+ * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
+ * @full must be filled, except for xlat_section, and constitute
+ * the complete description of the translated page.
+ *
+ * This is generally called by the target tlb_fill function after
+ * having performed a successful page table walk to find the physical
+ * address and attributes for the translation.
+ *
+ * At most one entry for a given virtual address is permitted. Only a
+ * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
+ * used by tlb_flush_page.
+ */
+void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
+                       CPUTLBEntryFull *full);
+
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e3ee4260bd..361078471b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1095,16 +1095,16 @@ static void tlb_add_large_page(CPUArchState *env, int mmu_idx,
     env_tlb(env)->d[mmu_idx].large_page_mask = lp_mask;
 }
 
-/* Add a new TLB entry. At most one entry for a given virtual address
+/*
+ * Add a new TLB entry. At most one entry for a given virtual address
  * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
  * supplied size is only used by tlb_flush_page.
  *
  * Called from TCG-generated code, which is under an RCU read-side
  * critical section.
  */
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
-                             hwaddr paddr, MemTxAttrs attrs, int prot,
-                             int mmu_idx, target_ulong size)
+void tlb_set_page_full(CPUState *cpu, int mmu_idx,
+                       target_ulong vaddr, CPUTLBEntryFull *full)
 {
     CPUArchState *env = cpu->env_ptr;
     CPUTLB *tlb = env_tlb(env);
@@ -1117,35 +1117,36 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     CPUTLBEntry *te, tn;
     hwaddr iotlb, xlat, sz, paddr_page;
     target_ulong vaddr_page;
-    int asidx = cpu_asidx_from_attrs(cpu, attrs);
-    int wp_flags;
+    int asidx, wp_flags, prot;
     bool is_ram, is_romd;
 
     assert_cpu_is_self(cpu);
 
-    if (size <= TARGET_PAGE_SIZE) {
+    if (full->lg_page_size <= TARGET_PAGE_BITS) {
         sz = TARGET_PAGE_SIZE;
     } else {
-        tlb_add_large_page(env, mmu_idx, vaddr, size);
-        sz = size;
+        sz = (hwaddr)1 << full->lg_page_size;
+        tlb_add_large_page(env, mmu_idx, vaddr, sz);
     }
     vaddr_page = vaddr & TARGET_PAGE_MASK;
-    paddr_page = paddr & TARGET_PAGE_MASK;
+    paddr_page = full->phys_addr & TARGET_PAGE_MASK;
 
+    prot = full->prot;
+    asidx = cpu_asidx_from_attrs(cpu, full->attrs);
     section = address_space_translate_for_iotlb(cpu, asidx, paddr_page,
-                                                &xlat, &sz, attrs, &prot);
+                                                &xlat, &sz, full->attrs, &prot);
     assert(sz >= TARGET_PAGE_SIZE);
 
     tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
               " prot=%x idx=%d\n",
-              vaddr, paddr, prot, mmu_idx);
+              vaddr, full->phys_addr, prot, mmu_idx);
 
     address = vaddr_page;
-    if (size < TARGET_PAGE_SIZE) {
+    if (full->lg_page_size < TARGET_PAGE_BITS) {
         /* Repeat the MMU check and TLB fill on every access.  */
         address |= TLB_INVALID_MASK;
     }
-    if (attrs.byte_swap) {
+    if (full->attrs.byte_swap) {
         address |= TLB_BSWAP;
     }
 
@@ -1236,8 +1237,10 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
      * subtract here is that of the page base, and not the same as the
      * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
      */
+    desc->fulltlb[index] = *full;
     desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
-    desc->fulltlb[index].attrs = attrs;
+    desc->fulltlb[index].phys_addr = paddr_page;
+    desc->fulltlb[index].prot = prot;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
@@ -1272,9 +1275,21 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     qemu_spin_unlock(&tlb->c.lock);
 }
 
-/* Add a new TLB entry, but without specifying the memory
- * transaction attributes to be used.
- */
+void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+                             hwaddr paddr, MemTxAttrs attrs, int prot,
+                             int mmu_idx, target_ulong size)
+{
+    CPUTLBEntryFull full = {
+        .phys_addr = paddr,
+        .attrs = attrs,
+        .prot = prot,
+        .lg_page_size = ctz64(size)
+    };
+
+    assert(is_power_of_2(size));
+    tlb_set_page_full(cpu, mmu_idx, vaddr, &full);
+}
+
 void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size)
-- 
2.34.1


