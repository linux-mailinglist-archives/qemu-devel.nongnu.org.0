Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875E6FEDB7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:15:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Li-0007MQ-Ea; Thu, 11 May 2023 04:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lg-0007Lw-H1
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ld-0001yZ-R9
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso15032033a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792504; x=1686384504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQDu2HKCDjr5A0VdwCNB/e4QqMUK+gBC/z+Nthp1m2c=;
 b=JJbnN6DxFldTJmY059JoVghqRBJHraK1atAdFekQseufGCs3oya/YUghEyqXIx1c7f
 sXn+CEg24twiep7w8HnXMHdH1TiWfjiVrFK0OiJLBUhCQWwCrsCFcPAd5OQbbGSrxmr3
 9TviVNaO8CqgWmd1z5OWfZCmVipzoAwn930X7CbqAezh4ItleILtbc7xA/kAM4ww/pFZ
 QGiCwmVHmrBJFah7GnfGZlzk0ACe5Qw1SYmokG1qUXhW5gbQ8h45bRPflVvOH/SGHh6f
 Rp9gRJSc5oq9QnYfGfDZ0ROvHCGwSQAY9eRkC0abF7RPjlumHHW1SVpkkJuEpKeE1XGa
 0Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792504; x=1686384504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQDu2HKCDjr5A0VdwCNB/e4QqMUK+gBC/z+Nthp1m2c=;
 b=hF3ecUeVB12nf+IutY+v+DQrf030/Cy2PvFO/R+DuiDfz5m6/03jeMArqvqCmT+iJc
 Un9PUsv4/bgNUVDmfmv6T83CYYhJ1LHsY6EVzzJEktZFR8yINC6NHUhLItCWz50T9Tsh
 7fbJtX2ojW/WjsM/vF8xal9opCtM9ikfFsa0S9ZwL8G8YLDgwzbDQ31J+geBJLb9MN1h
 JYnde1Wv3APZpbhljeMFC1rTMppg9lqtCJk6EHCY3JpiuSGPw6ZoBTTE2YauNOYqJrKy
 liJ9VKJP+A99pMEL2o6hiD/jSRKLXMWiurxGiyaQmr+tjT0/VmefL2B9ZuC+4GN4gH/6
 JmLg==
X-Gm-Message-State: AC+VfDxrhuuO34Jg7bGusLWlSj9cwcZCjqhs4Redw0TwhX5EYxx7sb5K
 5AjdxdvLNgmT4m09D7obT3BNt71P7eCSoyDha+mcIQ==
X-Google-Smtp-Source: ACHHUZ5I8vGFU2ZcpxjXnyUBJDDlFVdtp/tOv601L/hEdvDDf1P65om1YsoG7NSJVGtdWXVhymXTsw==
X-Received: by 2002:a17:907:97cb:b0:96a:4654:9a57 with SMTP id
 js11-20020a17090797cb00b0096a46549a57mr3623194ejc.54.1683792504336; 
 Thu, 11 May 2023 01:08:24 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 52/53] accel/tcg: Reorg system mode store helpers
Date: Thu, 11 May 2023 09:04:49 +0100
Message-Id: <20230511080450.860923-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of trying to unify all operations on uint64_t, use
mmu_lookup() to perform the basic tlb hit and resolution.
Create individual functions to handle access by size.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 408 +++++++++++++++++++++------------------------
 1 file changed, 193 insertions(+), 215 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a85edd8246..617777055a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2532,322 +2532,300 @@ store_memop(void *haddr, uint64_t val, MemOp op)
     }
 }
 
-static void full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                         MemOpIdx oi, uintptr_t retaddr);
-
-static void __attribute__((noinline))
-store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
-                       uintptr_t retaddr, size_t size, uintptr_t mmu_idx,
-                       bool big_endian)
+/**
+ * do_st_mmio_leN:
+ * @env: cpu context
+ * @p: translation parameters
+ * @val_le: data to store
+ * @mmu_idx: virtual address context
+ * @ra: return address into tcg generated code, or 0
+ *
+ * Store @p->size bytes at @p->addr, which is memory-mapped i/o.
+ * The bytes to store are extracted in little-endian order from @val_le;
+ * return the bytes of @val_le beyond @p->size that have not been stored.
+ */
+static uint64_t do_st_mmio_leN(CPUArchState *env, MMULookupPageData *p,
+                               uint64_t val_le, int mmu_idx, uintptr_t ra)
 {
-    uintptr_t index, index2;
-    CPUTLBEntry *entry, *entry2;
-    target_ulong page1, page2, tlb_addr, tlb_addr2;
-    MemOpIdx oi;
-    size_t size2;
-    int i;
+    CPUTLBEntryFull *full = p->full;
+    target_ulong addr = p->addr;
+    int i, size = p->size;
 
-    /*
-     * Ensure the second page is in the TLB.  Note that the first page
-     * is already guaranteed to be filled, and that the second page
-     * cannot evict the first.  An exception to this rule is PAGE_WRITE_INV
-     * handling: the first page could have evicted itself.
-     */
-    page1 = addr & TARGET_PAGE_MASK;
-    page2 = (addr + size) & TARGET_PAGE_MASK;
-    size2 = (addr + size) & ~TARGET_PAGE_MASK;
-    index2 = tlb_index(env, mmu_idx, page2);
-    entry2 = tlb_entry(env, mmu_idx, page2);
-
-    tlb_addr2 = tlb_addr_write(entry2);
-    if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
-        if (!victim_tlb_hit(env, mmu_idx, index2, MMU_DATA_STORE, page2)) {
-            tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
-                     mmu_idx, retaddr);
-            index2 = tlb_index(env, mmu_idx, page2);
-            entry2 = tlb_entry(env, mmu_idx, page2);
-        }
-        tlb_addr2 = tlb_addr_write(entry2);
+    QEMU_IOTHREAD_LOCK_GUARD();
+    for (i = 0; i < size; i++, val_le >>= 8) {
+        io_writex(env, full, mmu_idx, val_le, addr + i, ra, MO_UB);
     }
+    return val_le;
+}
 
-    index = tlb_index(env, mmu_idx, addr);
-    entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = tlb_addr_write(entry);
+/**
+ * do_st_bytes_leN:
+ * @p: translation parameters
+ * @val_le: data to store
+ *
+ * Store @p->size bytes at @p->haddr, which is RAM.
+ * The bytes to store are extracted in little-endian order from @val_le;
+ * return the bytes of @val_le beyond @p->size that have not been stored.
+ */
+static uint64_t do_st_bytes_leN(MMULookupPageData *p, uint64_t val_le)
+{
+    uint8_t *haddr = p->haddr;
+    int i, size = p->size;
 
-    /*
-     * Handle watchpoints.  Since this may trap, all checks
-     * must happen before any store.
-     */
-    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-        cpu_check_watchpoint(env_cpu(env), addr, size - size2,
-                             env_tlb(env)->d[mmu_idx].fulltlb[index].attrs,
-                             BP_MEM_WRITE, retaddr);
-    }
-    if (unlikely(tlb_addr2 & TLB_WATCHPOINT)) {
-        cpu_check_watchpoint(env_cpu(env), page2, size2,
-                             env_tlb(env)->d[mmu_idx].fulltlb[index2].attrs,
-                             BP_MEM_WRITE, retaddr);
+    for (i = 0; i < size; i++, val_le >>= 8) {
+        haddr[i] = val_le;
     }
+    return val_le;
+}
 
-    /*
-     * XXX: not efficient, but simple.
-     * This loop must go in the forward direction to avoid issues
-     * with self-modifying code in Windows 64-bit.
-     */
-    oi = make_memop_idx(MO_UB, mmu_idx);
-    if (big_endian) {
-        for (i = 0; i < size; ++i) {
-            /* Big-endian extract.  */
-            uint8_t val8 = val >> (((size - 1) * 8) - (i * 8));
-            full_stb_mmu(env, addr + i, val8, oi, retaddr);
-        }
+/*
+ * Wrapper for the above.
+ */
+static uint64_t do_st_leN(CPUArchState *env, MMULookupPageData *p,
+                          uint64_t val_le, int mmu_idx, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        return do_st_mmio_leN(env, p, val_le, mmu_idx, ra);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        return val_le >> (p->size * 8);
     } else {
-        for (i = 0; i < size; ++i) {
-            /* Little-endian extract.  */
-            uint8_t val8 = val >> (i * 8);
-            full_stb_mmu(env, addr + i, val8, oi, retaddr);
-        }
+        return do_st_bytes_leN(p, val_le);
     }
 }
 
-static inline void QEMU_ALWAYS_INLINE
-store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
-             MemOpIdx oi, uintptr_t retaddr, MemOp op)
+static void do_st_1(CPUArchState *env, MMULookupPageData *p, uint8_t val,
+                    int mmu_idx, uintptr_t ra)
 {
-    const unsigned a_bits = get_alignment_bits(get_memop(oi));
-    const size_t size = memop_size(op);
-    uintptr_t mmu_idx = get_mmuidx(oi);
-    uintptr_t index;
-    CPUTLBEntry *entry;
-    target_ulong tlb_addr;
-    void *haddr;
-
-    tcg_debug_assert(mmu_idx < NB_MMU_MODES);
-
-    /* Handle CPU specific unaligned behaviour */
-    if (addr & ((1 << a_bits) - 1)) {
-        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
-                             mmu_idx, retaddr);
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, MO_UB);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        *(uint8_t *)p->haddr = val;
     }
-
-    index = tlb_index(env, mmu_idx, addr);
-    entry = tlb_entry(env, mmu_idx, addr);
-    tlb_addr = tlb_addr_write(entry);
-
-    /* If the TLB entry is for a different page, reload and try again.  */
-    if (!tlb_hit(tlb_addr, addr)) {
-        if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
-            addr & TARGET_PAGE_MASK)) {
-            tlb_fill(env_cpu(env), addr, size, MMU_DATA_STORE,
-                     mmu_idx, retaddr);
-            index = tlb_index(env, mmu_idx, addr);
-            entry = tlb_entry(env, mmu_idx, addr);
-        }
-        tlb_addr = tlb_addr_write(entry) & ~TLB_INVALID_MASK;
-    }
-
-    /* Handle anything that isn't just a straight memory access.  */
-    if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUTLBEntryFull *full;
-        bool need_swap;
-
-        /* For anything that is unaligned, recurse through byte stores.  */
-        if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
-        }
-
-        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
-        /* Handle watchpoints.  */
-        if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
-            /* On watchpoint hit, this will longjmp out.  */
-            cpu_check_watchpoint(env_cpu(env), addr, size,
-                                 full->attrs, BP_MEM_WRITE, retaddr);
-        }
-
-        need_swap = size > 1 && (tlb_addr & TLB_BSWAP);
-
-        /* Handle I/O access.  */
-        if (tlb_addr & TLB_MMIO) {
-            io_writex(env, full, mmu_idx, val, addr, retaddr,
-                      op ^ (need_swap * MO_BSWAP));
-            return;
-        }
-
-        /* Ignore writes to ROM.  */
-        if (unlikely(tlb_addr & TLB_DISCARD_WRITE)) {
-            return;
-        }
-
-        /* Handle clean RAM pages.  */
-        if (tlb_addr & TLB_NOTDIRTY) {
-            notdirty_write(env_cpu(env), addr, size, full, retaddr);
-        }
-
-        haddr = (void *)((uintptr_t)addr + entry->addend);
-
-        /*
-         * Keep these two store_memop separate to ensure that the compiler
-         * is able to fold the entire function to a single instruction.
-         * There is a build-time assert inside to remind you of this.  ;-)
-         */
-        if (unlikely(need_swap)) {
-            store_memop(haddr, val, op ^ MO_BSWAP);
-        } else {
-            store_memop(haddr, val, op);
-        }
-        return;
-    }
-
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                     >= TARGET_PAGE_SIZE)) {
-    do_unaligned_access:
-        store_helper_unaligned(env, addr, val, retaddr, size,
-                               mmu_idx, memop_big_endian(op));
-        return;
-    }
-
-    haddr = (void *)((uintptr_t)addr + entry->addend);
-    store_memop(haddr, val, op);
 }
 
-static void __attribute__((noinline))
-full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-             MemOpIdx oi, uintptr_t retaddr)
+static void do_st_2(CPUArchState *env, MMULookupPageData *p, uint16_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
 {
-    validate_memop(oi, MO_UB);
-    store_helper(env, addr, val, oi, retaddr, MO_UB);
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap16(val);
+        }
+        store_memop(p->haddr, val, MO_UW);
+    }
+}
+
+static void do_st_4(CPUArchState *env, MMULookupPageData *p, uint32_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap32(val);
+        }
+        store_memop(p->haddr, val, MO_UL);
+    }
+}
+
+static void do_st_8(CPUArchState *env, MMULookupPageData *p, uint64_t val,
+                    int mmu_idx, MemOp memop, uintptr_t ra)
+{
+    if (unlikely(p->flags & TLB_MMIO)) {
+        io_writex(env, p->full, mmu_idx, val, p->addr, ra, memop);
+    } else if (unlikely(p->flags & TLB_DISCARD_WRITE)) {
+        /* nothing */
+    } else {
+        /* Swap to host endian if necessary, then store. */
+        if (memop & MO_BSWAP) {
+            val = bswap64(val);
+        }
+        store_memop(p->haddr, val, MO_UQ);
+    }
 }
 
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
-                        MemOpIdx oi, uintptr_t retaddr)
+                        MemOpIdx oi, uintptr_t ra)
 {
-    full_stb_mmu(env, addr, val, oi, retaddr);
+    MMULookupLocals l;
+    bool crosspage;
+
+    validate_memop(oi, MO_UB);
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    tcg_debug_assert(!crosspage);
+
+    do_st_1(env, &l.page[0], val, l.mmu_idx, ra);
 }
 
-static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
+static void do_st2_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+                       MemOpIdx oi, uintptr_t ra)
 {
-    validate_memop(oi, MO_LEUW);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUW);
+    MMULookupLocals l;
+    bool crosspage;
+    uint8_t a, b;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_2(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    if ((l.memop & MO_BSWAP) == MO_LE) {
+        a = val, b = val >> 8;
+    } else {
+        b = val, a = val >> 8;
+    }
+    do_st_1(env, &l.page[0], a, l.mmu_idx, ra);
+    do_st_1(env, &l.page[1], b, l.mmu_idx, ra);
 }
 
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_le_stw_mmu(env, addr, val, oi, retaddr);
-}
-
-static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUW);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUW);
+    validate_memop(oi, MO_LEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_be_stw_mmu(env, addr, val, oi, retaddr);
+    validate_memop(oi, MO_BEUW);
+    do_st2_mmu(env, addr, val, oi, retaddr);
 }
 
-static void full_le_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
+static void do_st4_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
+                       MemOpIdx oi, uintptr_t ra)
 {
-    validate_memop(oi, MO_LEUL);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUL);
+    MMULookupLocals l;
+    bool crosspage;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_4(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    /* Swap to little endian for simplicity, then store by bytes. */
+    if ((l.memop & MO_BSWAP) != MO_LE) {
+        val = bswap32(val);
+    }
+    val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
+    (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
 }
 
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_le_stl_mmu(env, addr, val, oi, retaddr);
-}
-
-static void full_be_stl_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
-                            MemOpIdx oi, uintptr_t retaddr)
-{
-    validate_memop(oi, MO_BEUL);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUL);
+    validate_memop(oi, MO_LEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
-    full_be_stl_mmu(env, addr, val, oi, retaddr);
+    validate_memop(oi, MO_BEUL);
+    do_st4_mmu(env, addr, val, oi, retaddr);
+}
+
+static void do_st8_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
+                       MemOpIdx oi, uintptr_t ra)
+{
+    MMULookupLocals l;
+    bool crosspage;
+
+    crosspage = mmu_lookup(env, addr, oi, ra, MMU_DATA_STORE, &l);
+    if (likely(!crosspage)) {
+        do_st_8(env, &l.page[0], val, l.mmu_idx, l.memop, ra);
+        return;
+    }
+
+    /* Swap to little endian for simplicity, then store by bytes. */
+    if ((l.memop & MO_BSWAP) != MO_LE) {
+        val = bswap64(val);
+    }
+    val = do_st_leN(env, &l.page[0], val, l.mmu_idx, ra);
+    (void) do_st_leN(env, &l.page[1], val, l.mmu_idx, ra);
 }
 
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_LEUQ);
-    store_helper(env, addr, val, oi, retaddr, MO_LEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     validate_memop(oi, MO_BEUQ);
-    store_helper(env, addr, val, oi, retaddr, MO_BEUQ);
+    do_st8_mmu(env, addr, val, oi, retaddr);
 }
 
 /*
  * Store Helpers for cpu_ldst.h
  */
 
-typedef void FullStoreHelper(CPUArchState *env, target_ulong addr,
-                             uint64_t val, MemOpIdx oi, uintptr_t retaddr);
-
-static inline void cpu_store_helper(CPUArchState *env, target_ulong addr,
-                                    uint64_t val, MemOpIdx oi, uintptr_t ra,
-                                    FullStoreHelper *full_store)
+static void plugin_store_cb(CPUArchState *env, abi_ptr addr, MemOpIdx oi)
 {
-    full_store(env, addr, val, oi, ra);
     qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_W);
 }
 
 void cpu_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                  MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_stb_mmu);
+    helper_ret_stb_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_be_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stw_mmu);
+    helper_be_stw_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_be_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_be_stl_mmu);
+    helper_be_stl_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_be_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, helper_be_stq_mmu);
+    helper_be_stq_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stw_le_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stw_mmu);
+    helper_le_stw_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stl_le_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, full_le_stl_mmu);
+    helper_le_stl_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                     MemOpIdx oi, uintptr_t retaddr)
 {
-    cpu_store_helper(env, addr, val, oi, retaddr, helper_le_stq_mmu);
+    helper_le_stq_mmu(env, addr, val, oi, retaddr);
+    plugin_store_cb(env, addr, oi);
 }
 
 void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
-- 
2.34.1


