Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835285ADA2D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:29:39 +0200 (CEST)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIir-0000wo-Kl
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcm-0007Jn-U7
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcg-0004ZE-TY
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t14so5343687wrx.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nt1aL/S2kb9oWyxTHsH7QG5cEjvmgw/rl9aHHcIbwB4=;
 b=PJt/RvF2z0BkWHdDPwVfQsyTIFSGXnOdGIIjYJ+CNGGTLITGoN0COfUO8zD8CWUeex
 w8jaq/IgOlDVQX1gZNdKFbQWjw2V3j4AB2/DIsP03/MwBosvEbb/G/s5FIKenIcnoyns
 rfkVZ7Y3ek201JOCJd+sbRpeD+P6C9ycAnnBGgRg6ynPyav35VXUaxZAX0NJjiY4ZyVX
 6Ahpi1HU3lC6EuWSExIMLA8obn8QzcnO1LP4reM79OHDJ6PWPNqYfLDOtDbkYdWMUNbF
 U7AAL+ixXqEuwzoFxfctAvY9vFJExH7eOqyA3LEn1Sai+6ubF596BbtipoXF67gzZsus
 7h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nt1aL/S2kb9oWyxTHsH7QG5cEjvmgw/rl9aHHcIbwB4=;
 b=gEFXRU3CgtkrC97Gi9a2Er0/59hZVG5YObb8b31I7ischHMZgkhm59b6dXAltgPgAx
 z/3T+By35/JxCfs97MrM1ZuF744VgqT+t+/fvTT+TS8hQW2acSr3MyDLbTiJAOU97Gkx
 IxNX193dAhNbWB4ReM285yrX/Qr0dT+eTW+Tofj/UYtPp84oAsPTc4PswIR7iLu6Xa17
 W66jpNbnlFP007AwpujdLlxuCb6sKocCNekl+rhODcDLOyZuJ/rrjYv9JN6moWutSScn
 7nLMBwGRjuxaD5ijtD9aRFDvbj6npX6OLPcW24zXkCzRvZeuicxR3CcbZv7z0eFJK1lg
 /a+g==
X-Gm-Message-State: ACgBeo3MDNPekki+GrBwO1swAdwaiLlCsTOiWT1IUxDU2hAcNxutQlDg
 ujY4mQr/wP1Ti017A/avvEuarricHkDxBwh9
X-Google-Smtp-Source: AA6agR4iUhBts+TBQu/Wdy4toedjpwWk26Lnn/KQR4I6jQfp04icV0HecN+Fvp1UVYIEA+Sm1f2MGA==
X-Received: by 2002:adf:f085:0:b0:226:d6e4:58f5 with SMTP id
 n5-20020adff085000000b00226d6e458f5mr24162729wro.50.1662409388345; 
 Mon, 05 Sep 2022 13:23:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 5/6] accel/tcg: Introduce tlb_set_page_full
Date: Mon,  5 Sep 2022 21:22:58 +0100
Message-Id: <20220905202259.189852-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 accel/tcg/cputlb.c      | 62 ++++++++++++++++++++++++++++-------------
 3 files changed, 78 insertions(+), 20 deletions(-)

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
index 758cf6bcc7..1a30c857f4 100644
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
index 62159549f6..3a3549ad4a 100644
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
@@ -1272,15 +1275,34 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
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
 
 /*
-- 
2.34.1


