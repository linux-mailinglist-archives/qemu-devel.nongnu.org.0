Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E459C614
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:25:43 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQC7K-0000F8-GA
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Of-0004dS-TC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oc-0001am-5w
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo14332503pjd.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=y/iSNxff4IufTYAu9VatBCHbVe/4R7TVJMkL2BFBTek=;
 b=xdStfUhvm4atoaStF51HDeAMRT6dXZTSmfD3Wq1S5cPom30zGwRFs83NFzBa3ABgTq
 KBAg2PY6mL9WbG068eRE+jcEzmcL/jvCi/Q+ouhcvfpDzJyz8aOIRsx3WT/JkxkdeR5S
 Cx168Y2SOL/ARd5HsnSVD8+r+3VwBS3eQDpeK1tfvH3PUWYH1CCRcLFJFQt9kJ4pwIm7
 XOaF2dzah9SAIKeuZYzI7j9V4JBPbg9wv6IsxpGmLm5TP1Rs7u3wJe91tDH8lDtx+g9M
 HiRdqdaSbYLDHqb+WMGjPW9hBWmFMd4PpITXDnrmcyC8jP8gnr+WQI9g8Ww2L7ZFHBE2
 xgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=y/iSNxff4IufTYAu9VatBCHbVe/4R7TVJMkL2BFBTek=;
 b=Jkt1TBBQNPFh90bD2djE0V2fU+ec8NxAvLRT+HMKocb60XagsPv3d1PqdP0im5/uFR
 B/B+dTXhLPJ+Igwz7adcV3ZU/BNKE1+FJUlqjpTixsllazu9IMXbgXKKG8Zd/Et7sxpV
 6qAO8loQa6HvO4caAzqmbNF3Gh+Us5wlAgOCjESqUOhFYvjg06opglrOTzXFB8bQGflJ
 ipXwSf3atsl+E3W+1GxDhnoZQCSPAIGbqIiVQyuX2oWfFykxK8gwhQ0GSubRyq78KAr5
 TTNOhE9Su7Jh72HXiw5wIA+GCkEJedmzWArCmcM8LiDts9MD7mVEVzJmr40bRhFIAFKS
 xOlQ==
X-Gm-Message-State: ACgBeo3ytbO0LCiasN+Tt3qoFlCkzKqnbUCR9eXprcLZLPEJ01/3JjpJ
 tXZSg7rhx+0hQrkD+7Maj1Nix9DQSNDpfA==
X-Google-Smtp-Source: AA6agR6WPlYIOyHqSxQtvZkm2v8/De00nt3pg9TXXoGr0+0R8MOjX6XHZUPYqWD8fGaFRcTajEdcEQ==
X-Received: by 2002:a17:902:7c01:b0:16f:9649:be73 with SMTP id
 x1-20020a1709027c0100b0016f9649be73mr20470928pll.70.1661182280432; 
 Mon, 22 Aug 2022 08:31:20 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 41/66] accel/tcg: Introduce tlb_set_page_full
Date: Mon, 22 Aug 2022 08:27:16 -0700
Message-Id: <20220822152741.1617527-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 14 ++++++++++
 include/exec/exec-all.h | 22 +++++++++++++++
 accel/tcg/cputlb.c      | 61 +++++++++++++++++++++++++++--------------
 3 files changed, 77 insertions(+), 20 deletions(-)

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
index e366b5c1ba..e7b54e8e5c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -258,6 +258,28 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
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
+ * single TARGET_PAGE_SIZE region is mapped; @full->ld_page_size is only
+ * used by tlb_flush_page.
+ */
+void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
+                       CPUTLBEntryFull *full);
+
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1c59e701e6..8c95f57266 100644
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
 
@@ -1236,8 +1237,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
      * subtract here is that of the page base, and not the same as the
      * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
      */
+    desc->fulltlb[index] = *full;
     desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
-    desc->fulltlb[index].attrs = attrs;
+    desc->fulltlb[index].prot = prot;
 
     /* Now calculate the new entry */
     tn.addend = addend - vaddr_page;
@@ -1272,15 +1274,34 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
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
 {
-    tlb_set_page_with_attrs(cpu, vaddr, paddr, MEMTXATTRS_UNSPECIFIED,
-                            prot, mmu_idx, size);
+    CPUTLBEntryFull full = {
+        .phys_addr = paddr,
+        .attrs = MEMTXATTRS_UNSPECIFIED,
+        .prot = prot,
+        .lg_page_size = ctz64(size)
+    };
+
+    assert(is_power_of_2(size));
+    tlb_set_page_full(cpu, mmu_idx, vaddr, &full);
 }
 
 static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
-- 
2.34.1


