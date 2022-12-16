Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A257A64F199
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:14:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fpu-0000RL-4b; Fri, 16 Dec 2022 13:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpr-0000OM-9z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:31 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpm-0003FK-OS
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:30 -0500
Received: by mail-pl1-x62a.google.com with SMTP id 17so3250753pll.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jloeNmMr+Uf/GUu9zkfcyVNn7bo9MScPLiA7lhFAJ+M=;
 b=rUgtCvE+1KX+dUO2VW86vMB/Y/mxxFwq3VxvG6XRjXdOctn/I1fA8w13qWWUJp2KoH
 oGwcB4OEmNEwmCmN98+i/LiWR+rtysYmfPSunZfBsdC/i8j4b1EL8KMxxzFR9ZcwSJou
 v2Kj6k1igeOSK6pqWY6tAaoCDduFNsJ6HfCL1ME5G8LStChnz4Lx41MVOishsgfli5Hw
 cVBhFsgwZR4UUTmGersgrUeE3GhMd9yqaWvbXNp53YN2+y3rmFvxrvGR/kfftmx/mTO3
 zg6W9BgQ4iKzuvSk20WSjvf8rleH0szUmZbf2H+GcuJb3G8BcL7B+QHicuMBHD7DXjuD
 WHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jloeNmMr+Uf/GUu9zkfcyVNn7bo9MScPLiA7lhFAJ+M=;
 b=YxcTaWMEyndBHHOKBrlNYB4NKH2afkCQ+T7nIbZSwcd7EeguKF2/7uW0I/CuKiPBnn
 cr5zJw/azz6bT8bvThXGdyGd7X1qJANMjZf0CR3cJKUaMMWxYLWL3vZiTyBg+pFEwpPZ
 sMCR8GZe50v2yiPirK01PZwZdQHFSJs0gqx0kA/lU5SRogyNuymXghG/pvIwfuwfmJ+a
 hje/XG9LelNAWugfXV00FopFH3R5r7/DvAuxrg6mzeJGgLvkOhtvHIpq8XDEKSjgrxeA
 UrMHDQlB8sjUTm7wf+JH7V1vIYN+PboMGIRaDMf7T3/JC36LvA3/1S3OagOpbKzbMLiY
 RD2A==
X-Gm-Message-State: AFqh2kpFOxKSGmBa6mDSr3yHtYxhHR3vpLsU79YmMyKVb9cSCzenFBb8
 +0ppVwhmNN1zqs1nRYuzYVwu8RYKk8mYrB++
X-Google-Smtp-Source: AMrXdXvZqfMPPYirwNamykEG/kTTxAHUgItOqrEBgEHDI4DP+edMNeEW/Q67tuujGVPK9Zy+K8Vd9g==
X-Received: by 2002:a05:6a21:3398:b0:af:8ff3:fc78 with SMTP id
 yy24-20020a056a21339800b000af8ff3fc78mr12849578pzb.19.1671216803071; 
 Fri, 16 Dec 2022 10:53:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 05/13] accel/tcg: Move page_{get,set}_flags to user-exec.c
Date: Fri, 16 Dec 2022 10:52:57 -0800
Message-Id: <20221216185305.3429913-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This page tracking implementation is specific to user-only,
since the system softmmu version is in cputlb.c.  Move it
out of translate-all.c to user-exec.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  17 ++
 accel/tcg/translate-all.c | 350 --------------------------------------
 accel/tcg/user-exec.c     | 346 +++++++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+), 350 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 0f91ee939c..ddd1fa6bdc 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -33,6 +33,23 @@ typedef struct PageDesc {
 #endif
 } PageDesc;
 
+/*
+ * In system mode we want L1_MAP to be based on ram offsets,
+ * while in user mode we want it to be based on virtual addresses.
+ *
+ * TODO: For user mode, see the caveat re host vs guest virtual
+ * address spaces near GUEST_ADDR_MAX.
+ */
+#if !defined(CONFIG_USER_ONLY)
+#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
+# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
+#else
+# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
+#endif
+#else
+# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
+#endif
+
 /* Size of the L2 (and L3, etc) page tables.  */
 #define V_L2_BITS 10
 #define V_L2_SIZE (1 << V_L2_BITS)
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b964ea44d7..0d7596fcb8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -109,23 +109,6 @@ struct page_collection {
     struct page_entry *max;
 };
 
-/*
- * In system mode we want L1_MAP to be based on ram offsets,
- * while in user mode we want it to be based on virtual addresses.
- *
- * TODO: For user mode, see the caveat re host vs guest virtual
- * address spaces near GUEST_ADDR_MAX.
- */
-#if !defined(CONFIG_USER_ONLY)
-#if HOST_LONG_BITS < TARGET_PHYS_ADDR_SPACE_BITS
-# define L1_MAP_ADDR_SPACE_BITS  HOST_LONG_BITS
-#else
-# define L1_MAP_ADDR_SPACE_BITS  TARGET_PHYS_ADDR_SPACE_BITS
-#endif
-#else
-# define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
-#endif
-
 /* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
 QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
                   sizeof_field(TranslationBlock, trace_vcpu_dstate)
@@ -1235,339 +1218,6 @@ void cpu_interrupt(CPUState *cpu, int mask)
     qatomic_set(&cpu_neg(cpu)->icount_decr.u16.high, -1);
 }
 
-/*
- * Walks guest process memory "regions" one by one
- * and calls callback function 'fn' for each region.
- */
-struct walk_memory_regions_data {
-    walk_memory_regions_fn fn;
-    void *priv;
-    target_ulong start;
-    int prot;
-};
-
-static int walk_memory_regions_end(struct walk_memory_regions_data *data,
-                                   target_ulong end, int new_prot)
-{
-    if (data->start != -1u) {
-        int rc = data->fn(data->priv, data->start, end, data->prot);
-        if (rc != 0) {
-            return rc;
-        }
-    }
-
-    data->start = (new_prot ? end : -1u);
-    data->prot = new_prot;
-
-    return 0;
-}
-
-static int walk_memory_regions_1(struct walk_memory_regions_data *data,
-                                 target_ulong base, int level, void **lp)
-{
-    target_ulong pa;
-    int i, rc;
-
-    if (*lp == NULL) {
-        return walk_memory_regions_end(data, base, 0);
-    }
-
-    if (level == 0) {
-        PageDesc *pd = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            int prot = pd[i].flags;
-
-            pa = base | (i << TARGET_PAGE_BITS);
-            if (prot != data->prot) {
-                rc = walk_memory_regions_end(data, pa, prot);
-                if (rc != 0) {
-                    return rc;
-                }
-            }
-        }
-    } else {
-        void **pp = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            pa = base | ((target_ulong)i <<
-                (TARGET_PAGE_BITS + V_L2_BITS * level));
-            rc = walk_memory_regions_1(data, pa, level - 1, pp + i);
-            if (rc != 0) {
-                return rc;
-            }
-        }
-    }
-
-    return 0;
-}
-
-int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
-{
-    struct walk_memory_regions_data data;
-    uintptr_t i, l1_sz = v_l1_size;
-
-    data.fn = fn;
-    data.priv = priv;
-    data.start = -1u;
-    data.prot = 0;
-
-    for (i = 0; i < l1_sz; i++) {
-        target_ulong base = i << (v_l1_shift + TARGET_PAGE_BITS);
-        int rc = walk_memory_regions_1(&data, base, v_l2_levels, l1_map + i);
-        if (rc != 0) {
-            return rc;
-        }
-    }
-
-    return walk_memory_regions_end(&data, 0, 0);
-}
-
-static int dump_region(void *priv, target_ulong start,
-    target_ulong end, unsigned long prot)
-{
-    FILE *f = (FILE *)priv;
-
-    (void) fprintf(f, TARGET_FMT_lx"-"TARGET_FMT_lx
-        " "TARGET_FMT_lx" %c%c%c\n",
-        start, end, end - start,
-        ((prot & PAGE_READ) ? 'r' : '-'),
-        ((prot & PAGE_WRITE) ? 'w' : '-'),
-        ((prot & PAGE_EXEC) ? 'x' : '-'));
-
-    return 0;
-}
-
-/* dump memory mappings */
-void page_dump(FILE *f)
-{
-    const int length = sizeof(target_ulong) * 2;
-    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
-            length, "start", length, "end", length, "size", "prot");
-    walk_memory_regions(f, dump_region);
-}
-
-int page_get_flags(target_ulong address)
-{
-    PageDesc *p;
-
-    p = page_find(address >> TARGET_PAGE_BITS);
-    if (!p) {
-        return 0;
-    }
-    return p->flags;
-}
-
-/*
- * Allow the target to decide if PAGE_TARGET_[12] may be reset.
- * By default, they are not kept.
- */
-#ifndef PAGE_TARGET_STICKY
-#define PAGE_TARGET_STICKY  0
-#endif
-#define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
-
-/* Modify the flags of a page and invalidate the code if necessary.
-   The flag PAGE_WRITE_ORG is positioned automatically depending
-   on PAGE_WRITE.  The mmap_lock should already be held.  */
-void page_set_flags(target_ulong start, target_ulong end, int flags)
-{
-    target_ulong addr, len;
-    bool reset, inval_tb = false;
-
-    /* This function should never be called with addresses outside the
-       guest address space.  If this assert fires, it probably indicates
-       a missing call to h2g_valid.  */
-    assert(end - 1 <= GUEST_ADDR_MAX);
-    assert(start < end);
-    /* Only set PAGE_ANON with new mappings. */
-    assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
-    assert_memory_lock();
-
-    start = start & TARGET_PAGE_MASK;
-    end = TARGET_PAGE_ALIGN(end);
-
-    if (flags & PAGE_WRITE) {
-        flags |= PAGE_WRITE_ORG;
-    }
-    reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
-    if (reset) {
-        page_reset_target_data(start, end);
-    }
-    flags &= ~PAGE_RESET;
-
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
-
-        /*
-         * If the page was executable, but is reset, or is no longer
-         * executable, or has become writable, then invalidate any code.
-         */
-        if ((p->flags & PAGE_EXEC)
-            && (reset ||
-                !(flags & PAGE_EXEC) ||
-                (flags & ~p->flags & PAGE_WRITE))) {
-            inval_tb = true;
-        }
-        /* Using mprotect on a page does not change sticky bits. */
-        p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
-    }
-
-    if (inval_tb) {
-        tb_invalidate_phys_range(start, end);
-    }
-}
-
-int page_check_range(target_ulong start, target_ulong len, int flags)
-{
-    PageDesc *p;
-    target_ulong end;
-    target_ulong addr;
-
-    /* This function should never be called with addresses outside the
-       guest address space.  If this assert fires, it probably indicates
-       a missing call to h2g_valid.  */
-    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
-        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
-    }
-
-    if (len == 0) {
-        return 0;
-    }
-    if (start + len - 1 < start) {
-        /* We've wrapped around.  */
-        return -1;
-    }
-
-    /* must do before we loose bits in the next step */
-    end = TARGET_PAGE_ALIGN(start + len);
-    start = start & TARGET_PAGE_MASK;
-
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        p = page_find(addr >> TARGET_PAGE_BITS);
-        if (!p) {
-            return -1;
-        }
-        if (!(p->flags & PAGE_VALID)) {
-            return -1;
-        }
-
-        if ((flags & PAGE_READ) && !(p->flags & PAGE_READ)) {
-            return -1;
-        }
-        if (flags & PAGE_WRITE) {
-            if (!(p->flags & PAGE_WRITE_ORG)) {
-                return -1;
-            }
-            /* unprotect the page if it was put read-only because it
-               contains translated code */
-            if (!(p->flags & PAGE_WRITE)) {
-                if (!page_unprotect(addr, 0)) {
-                    return -1;
-                }
-            }
-        }
-    }
-    return 0;
-}
-
-void page_protect(tb_page_addr_t page_addr)
-{
-    target_ulong addr;
-    PageDesc *p;
-    int prot;
-
-    p = page_find(page_addr >> TARGET_PAGE_BITS);
-    if (p && (p->flags & PAGE_WRITE)) {
-        /*
-         * Force the host page as non writable (writes will have a page fault +
-         * mprotect overhead).
-         */
-        page_addr &= qemu_host_page_mask;
-        prot = 0;
-        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
-             addr += TARGET_PAGE_SIZE) {
-
-            p = page_find(addr >> TARGET_PAGE_BITS);
-            if (!p) {
-                continue;
-            }
-            prot |= p->flags;
-            p->flags &= ~PAGE_WRITE;
-        }
-        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
-                 (prot & PAGE_BITS) & ~PAGE_WRITE);
-    }
-}
-
-/* called from signal handler: invalidate the code and unprotect the
- * page. Return 0 if the fault was not handled, 1 if it was handled,
- * and 2 if it was handled but the caller must cause the TB to be
- * immediately exited. (We can only return 2 if the 'pc' argument is
- * non-zero.)
- */
-int page_unprotect(target_ulong address, uintptr_t pc)
-{
-    unsigned int prot;
-    bool current_tb_invalidated;
-    PageDesc *p;
-    target_ulong host_start, host_end, addr;
-
-    /* Technically this isn't safe inside a signal handler.  However we
-       know this only ever happens in a synchronous SEGV handler, so in
-       practice it seems to be ok.  */
-    mmap_lock();
-
-    p = page_find(address >> TARGET_PAGE_BITS);
-    if (!p) {
-        mmap_unlock();
-        return 0;
-    }
-
-    /* if the page was really writable, then we change its
-       protection back to writable */
-    if (p->flags & PAGE_WRITE_ORG) {
-        current_tb_invalidated = false;
-        if (p->flags & PAGE_WRITE) {
-            /* If the page is actually marked WRITE then assume this is because
-             * this thread raced with another one which got here first and
-             * set the page to PAGE_WRITE and did the TB invalidate for us.
-             */
-#ifdef TARGET_HAS_PRECISE_SMC
-            TranslationBlock *current_tb = tcg_tb_lookup(pc);
-            if (current_tb) {
-                current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
-            }
-#endif
-        } else {
-            host_start = address & qemu_host_page_mask;
-            host_end = host_start + qemu_host_page_size;
-
-            prot = 0;
-            for (addr = host_start; addr < host_end; addr += TARGET_PAGE_SIZE) {
-                p = page_find(addr >> TARGET_PAGE_BITS);
-                p->flags |= PAGE_WRITE;
-                prot |= p->flags;
-
-                /* and since the content will be modified, we must invalidate
-                   the corresponding translated code. */
-                current_tb_invalidated |=
-                    tb_invalidate_phys_page_unwind(addr, pc);
-            }
-            mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
-                     prot & PAGE_BITS);
-        }
-        mmap_unlock();
-        /* If current TB was invalidated return to main loop */
-        return current_tb_invalidated ? 2 : 1;
-    }
-    mmap_unlock();
-    return 0;
-}
 #endif /* CONFIG_USER_ONLY */
 
 /*
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 42a04bdb21..22ef780900 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -135,6 +135,352 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
+/*
+ * Walks guest process memory "regions" one by one
+ * and calls callback function 'fn' for each region.
+ */
+struct walk_memory_regions_data {
+    walk_memory_regions_fn fn;
+    void *priv;
+    target_ulong start;
+    int prot;
+};
+
+static int walk_memory_regions_end(struct walk_memory_regions_data *data,
+                                   target_ulong end, int new_prot)
+{
+    if (data->start != -1u) {
+        int rc = data->fn(data->priv, data->start, end, data->prot);
+        if (rc != 0) {
+            return rc;
+        }
+    }
+
+    data->start = (new_prot ? end : -1u);
+    data->prot = new_prot;
+
+    return 0;
+}
+
+static int walk_memory_regions_1(struct walk_memory_regions_data *data,
+                                 target_ulong base, int level, void **lp)
+{
+    target_ulong pa;
+    int i, rc;
+
+    if (*lp == NULL) {
+        return walk_memory_regions_end(data, base, 0);
+    }
+
+    if (level == 0) {
+        PageDesc *pd = *lp;
+
+        for (i = 0; i < V_L2_SIZE; ++i) {
+            int prot = pd[i].flags;
+
+            pa = base | (i << TARGET_PAGE_BITS);
+            if (prot != data->prot) {
+                rc = walk_memory_regions_end(data, pa, prot);
+                if (rc != 0) {
+                    return rc;
+                }
+            }
+        }
+    } else {
+        void **pp = *lp;
+
+        for (i = 0; i < V_L2_SIZE; ++i) {
+            pa = base | ((target_ulong)i <<
+                (TARGET_PAGE_BITS + V_L2_BITS * level));
+            rc = walk_memory_regions_1(data, pa, level - 1, pp + i);
+            if (rc != 0) {
+                return rc;
+            }
+        }
+    }
+
+    return 0;
+}
+
+int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
+{
+    struct walk_memory_regions_data data;
+    uintptr_t i, l1_sz = v_l1_size;
+
+    data.fn = fn;
+    data.priv = priv;
+    data.start = -1u;
+    data.prot = 0;
+
+    for (i = 0; i < l1_sz; i++) {
+        target_ulong base = i << (v_l1_shift + TARGET_PAGE_BITS);
+        int rc = walk_memory_regions_1(&data, base, v_l2_levels, l1_map + i);
+        if (rc != 0) {
+            return rc;
+        }
+    }
+
+    return walk_memory_regions_end(&data, 0, 0);
+}
+
+static int dump_region(void *priv, target_ulong start,
+    target_ulong end, unsigned long prot)
+{
+    FILE *f = (FILE *)priv;
+
+    (void) fprintf(f, TARGET_FMT_lx"-"TARGET_FMT_lx
+        " "TARGET_FMT_lx" %c%c%c\n",
+        start, end, end - start,
+        ((prot & PAGE_READ) ? 'r' : '-'),
+        ((prot & PAGE_WRITE) ? 'w' : '-'),
+        ((prot & PAGE_EXEC) ? 'x' : '-'));
+
+    return 0;
+}
+
+/* dump memory mappings */
+void page_dump(FILE *f)
+{
+    const int length = sizeof(target_ulong) * 2;
+    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
+            length, "start", length, "end", length, "size", "prot");
+    walk_memory_regions(f, dump_region);
+}
+
+int page_get_flags(target_ulong address)
+{
+    PageDesc *p;
+
+    p = page_find(address >> TARGET_PAGE_BITS);
+    if (!p) {
+        return 0;
+    }
+    return p->flags;
+}
+
+/*
+ * Allow the target to decide if PAGE_TARGET_[12] may be reset.
+ * By default, they are not kept.
+ */
+#ifndef PAGE_TARGET_STICKY
+#define PAGE_TARGET_STICKY  0
+#endif
+#define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
+
+/*
+ * Modify the flags of a page and invalidate the code if necessary.
+ * The flag PAGE_WRITE_ORG is positioned automatically depending
+ * on PAGE_WRITE.  The mmap_lock should already be held.
+ */
+void page_set_flags(target_ulong start, target_ulong end, int flags)
+{
+    target_ulong addr, len;
+    bool reset, inval_tb = false;
+
+    /* This function should never be called with addresses outside the
+       guest address space.  If this assert fires, it probably indicates
+       a missing call to h2g_valid.  */
+    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start < end);
+    /* Only set PAGE_ANON with new mappings. */
+    assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
+    assert_memory_lock();
+
+    start = start & TARGET_PAGE_MASK;
+    end = TARGET_PAGE_ALIGN(end);
+
+    if (flags & PAGE_WRITE) {
+        flags |= PAGE_WRITE_ORG;
+    }
+    reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    if (reset) {
+        page_reset_target_data(start, end);
+    }
+    flags &= ~PAGE_RESET;
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
+
+        /*
+         * If the page was executable, but is reset, or is no longer
+         * executable, or has become writable, then invalidate any code.
+         */
+        if ((p->flags & PAGE_EXEC)
+            && (reset ||
+                !(flags & PAGE_EXEC) ||
+                (flags & ~p->flags & PAGE_WRITE))) {
+            inval_tb = true;
+        }
+        /* Using mprotect on a page does not change sticky bits. */
+        p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
+    }
+
+    if (inval_tb) {
+        tb_invalidate_phys_range(start, end);
+    }
+}
+
+int page_check_range(target_ulong start, target_ulong len, int flags)
+{
+    PageDesc *p;
+    target_ulong end;
+    target_ulong addr;
+
+    /*
+     * This function should never be called with addresses outside the
+     * guest address space.  If this assert fires, it probably indicates
+     * a missing call to h2g_valid.
+     */
+    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
+        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
+    }
+
+    if (len == 0) {
+        return 0;
+    }
+    if (start + len - 1 < start) {
+        /* We've wrapped around.  */
+        return -1;
+    }
+
+    /* must do before we loose bits in the next step */
+    end = TARGET_PAGE_ALIGN(start + len);
+    start = start & TARGET_PAGE_MASK;
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        p = page_find(addr >> TARGET_PAGE_BITS);
+        if (!p) {
+            return -1;
+        }
+        if (!(p->flags & PAGE_VALID)) {
+            return -1;
+        }
+
+        if ((flags & PAGE_READ) && !(p->flags & PAGE_READ)) {
+            return -1;
+        }
+        if (flags & PAGE_WRITE) {
+            if (!(p->flags & PAGE_WRITE_ORG)) {
+                return -1;
+            }
+            /* unprotect the page if it was put read-only because it
+               contains translated code */
+            if (!(p->flags & PAGE_WRITE)) {
+                if (!page_unprotect(addr, 0)) {
+                    return -1;
+                }
+            }
+        }
+    }
+    return 0;
+}
+
+void page_protect(tb_page_addr_t page_addr)
+{
+    target_ulong addr;
+    PageDesc *p;
+    int prot;
+
+    p = page_find(page_addr >> TARGET_PAGE_BITS);
+    if (p && (p->flags & PAGE_WRITE)) {
+        /*
+         * Force the host page as non writable (writes will have a page fault +
+         * mprotect overhead).
+         */
+        page_addr &= qemu_host_page_mask;
+        prot = 0;
+        for (addr = page_addr; addr < page_addr + qemu_host_page_size;
+             addr += TARGET_PAGE_SIZE) {
+
+            p = page_find(addr >> TARGET_PAGE_BITS);
+            if (!p) {
+                continue;
+            }
+            prot |= p->flags;
+            p->flags &= ~PAGE_WRITE;
+        }
+        mprotect(g2h_untagged(page_addr), qemu_host_page_size,
+                 (prot & PAGE_BITS) & ~PAGE_WRITE);
+    }
+}
+
+/*
+ * Called from signal handler: invalidate the code and unprotect the
+ * page. Return 0 if the fault was not handled, 1 if it was handled,
+ * and 2 if it was handled but the caller must cause the TB to be
+ * immediately exited. (We can only return 2 if the 'pc' argument is
+ * non-zero.)
+ */
+int page_unprotect(target_ulong address, uintptr_t pc)
+{
+    unsigned int prot;
+    bool current_tb_invalidated;
+    PageDesc *p;
+    target_ulong host_start, host_end, addr;
+
+    /*
+     * Technically this isn't safe inside a signal handler.  However we
+     * know this only ever happens in a synchronous SEGV handler, so in
+     * practice it seems to be ok.
+     */
+    mmap_lock();
+
+    p = page_find(address >> TARGET_PAGE_BITS);
+    if (!p) {
+        mmap_unlock();
+        return 0;
+    }
+
+    /*
+     * If the page was really writable, then we change its
+     * protection back to writable.
+     */
+    if (p->flags & PAGE_WRITE_ORG) {
+        current_tb_invalidated = false;
+        if (p->flags & PAGE_WRITE) {
+            /*
+             * If the page is actually marked WRITE then assume this is because
+             * this thread raced with another one which got here first and
+             * set the page to PAGE_WRITE and did the TB invalidate for us.
+             */
+#ifdef TARGET_HAS_PRECISE_SMC
+            TranslationBlock *current_tb = tcg_tb_lookup(pc);
+            if (current_tb) {
+                current_tb_invalidated = tb_cflags(current_tb) & CF_INVALID;
+            }
+#endif
+        } else {
+            host_start = address & qemu_host_page_mask;
+            host_end = host_start + qemu_host_page_size;
+
+            prot = 0;
+            for (addr = host_start; addr < host_end; addr += TARGET_PAGE_SIZE) {
+                p = page_find(addr >> TARGET_PAGE_BITS);
+                p->flags |= PAGE_WRITE;
+                prot |= p->flags;
+
+                /*
+                 * Since the content will be modified, we must invalidate
+                 * the corresponding translated code.
+                 */
+                current_tb_invalidated |=
+                    tb_invalidate_phys_page_unwind(addr, pc);
+            }
+            mprotect((void *)g2h_untagged(host_start), qemu_host_page_size,
+                     prot & PAGE_BITS);
+        }
+        mmap_unlock();
+        /* If current TB was invalidated return to main loop */
+        return current_tb_invalidated ? 2 : 1;
+    }
+    mmap_unlock();
+    return 0;
+}
+
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
-- 
2.34.1


