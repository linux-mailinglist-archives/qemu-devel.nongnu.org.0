Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F725E9235
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:57:11 +0200 (CEST)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPJt-0008De-Sy
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEl-0002cU-GB
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:51 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEj-0000MK-Kj
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:51 -0400
Received: by mail-qk1-x72c.google.com with SMTP id d17so2617822qko.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=L2u/Wygoa1a7jwv7/P7oYsTTqg/ROgTUNT3sOwsgxic=;
 b=Sqgmq/OVrZjQn0hRWxARzzH0i5pHjg164vtL80NqwPaBhVMu7aF29yKJfklu4G85xK
 HuO4b+d69cYLaXRUu5syLr+bMG95ZTFWoz5lTXHqF/z6Iad4PvRXIw39BCXzP4pIGukD
 LHUezilzCN8KB1M9woek8EOUaJWpXNSmxqxtx6rPYx9YkKmR4w3TLlscAMhi5SBzbKQB
 IJGrE1xVRfM1fuF/co1O6nH9K7spmykjS8Up5DPpZlLY+3tnaRR72ze938pjVkIkvqud
 oxqYu4NEBbfrQLiA9j0XX46K5WuHBpzUmgfKyDl/YZTlb2mNEjrTPj9mQDd5vZzuM4FV
 3U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=L2u/Wygoa1a7jwv7/P7oYsTTqg/ROgTUNT3sOwsgxic=;
 b=KVTxYFeegm6s7jNoXYfElt1rs+Xw6JlRVZVAuvBgWWM5BEQipteE/E3TQQ5+UT8EaK
 wu+Ku8HxzOy/TwXmPnhTdgPgysfzVH6v3JZuneXU+rAJ7UCKaMaC8c8P0f4Vy+AWUVDG
 0hgpOybbFnPz3EXdisMR3wKjuMHqN/q/Rs7hR3aJw+AvBLIj3p0LalWnOpya8tC5peNr
 1PX+FuP26zmNFnOGL++R4nmLO2maLFYrJ8u5d0/arHZyXres2ip1RVg0+nzErM43wb+o
 LoEynYf0TP/25Uq2YMYWtd3CuCb68+mBx7k+dBMe2+KQjgIUZo+YiY71RqTtZ9OGumVW
 yACQ==
X-Gm-Message-State: ACrzQf3YBgCmMMwkQefBuT891r4Mhk6fSeXoy6S42K+gs50JfdBGzW/K
 HKoQBA7ciiSImqYbFPHcq7nrRq+sXxzPDQ==
X-Google-Smtp-Source: AMsMyM5M3Tjc7YcqN3oYYn2dNVzm3/MKw6Yw0EJuF16UTbY165DtgnCqlhoSUZIbnZn1DsJWBXGcXQ==
X-Received: by 2002:a05:620a:448c:b0:6ce:a013:7fa3 with SMTP id
 x12-20020a05620a448c00b006cea0137fa3mr10981474qkp.532.1664103108387; 
 Sun, 25 Sep 2022 03:51:48 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 05/17] accel/tcg: Introduce tlb_set_page_full
Date: Sun, 25 Sep 2022 10:51:12 +0000
Message-Id: <20220925105124.82033-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
index 758cf6bcc7..0f25a1ba85 100644
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
index 62159549f6..382c5d3109 100644
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


