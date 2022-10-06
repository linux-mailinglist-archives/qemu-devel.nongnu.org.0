Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0591C5F5F63
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:18:32 +0200 (CEST)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHP4-00082l-KP
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIH-0005Vg-Nf
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIC-0006wa-Kp
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id q9so695334pgq.8
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sDiaF30K3/Y/0Ly7gGIN7QLvUdhADskzkDy0CghP+O0=;
 b=oEpHJcIqkxCSefa1jCTlBhEKyIfOabVVVG3DSHIuyuMCO4P36EDm55nRCjX1oy7ioX
 b8qfQI+hiepHqWE0HBfeTx7OAfPM+ZNPBJR0a4vf9kxcWzi1Yhjg44lZKQFdK6Qkn+RI
 tgQ3FW6T2fgr+LE2w8jj4XS21B5rbLcS/Pj8LejT2EGgIh1pMgTPyq7AoRajP37kwU0E
 5SiKQcCRb2fpQD1RMMlm7BsVhnKE/etdqYHc+V2F3SoJ3gpvdLmbsbYLHcVtSdNNjIER
 /9Q0/dQFQCFF0RTcary+4L+r87gRaiEDUDi9X6niwp75u6nPD70FNQ82jCqoI+1VSxtd
 B3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sDiaF30K3/Y/0Ly7gGIN7QLvUdhADskzkDy0CghP+O0=;
 b=hAYToHe2GlKEAZXxWm34a5RAW++PHwgoWOcCe9IeEkSniLug0Gup31dl6aYdE3Lm4m
 T8E/DpFU0oVVusM5zNcz7bf2cV7jJWmqzqCoinCamjLzoiJ4de68/1WKUiUjRW/suuT9
 KgsHWhMqPMwCQpsc9jl+wWOzD82EhSnrOHJwZ771ObJ8xldxaPbxOpwpRPr0fovnFYco
 Jeg+24japTmvV9uLEtqdO4ah0C7UIMedmB5kcsF9BkbUlL3QWyWob9aH4Roao6pLzcfG
 BRJb37tRg37uUXId1aFWQDEfOUCvo4Z0SXyHUa8zoVmC8J08uhGZUkh+2LF7lcEGWcbw
 9IBw==
X-Gm-Message-State: ACrzQf3sfm94R5lkmwKFPUbo9jOKPwjhOugOM9dxgs3x6PK/qrQX3gQc
 m6c2V+LIKUNObWlkNdI3PiGa8pwjE9bP4A==
X-Google-Smtp-Source: AMsMyM5Z7kxJtCI+urG7rz1IlzCy08ryBUE56lBk3XrCP3r/A4dUjeZZV4yPUPyexFLVDIiZGw7YSQ==
X-Received: by 2002:a05:6a00:288c:b0:561:9a3a:bca1 with SMTP id
 ch12-20020a056a00288c00b005619a3abca1mr2880943pfb.46.1665025881819; 
 Wed, 05 Oct 2022 20:11:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 05/24] accel/tcg: Split out tb-maint.c
Date: Wed,  5 Oct 2022 20:10:54 -0700
Message-Id: <20221006031113.1139454-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Move all of the TranslationBlock flushing and page linking
code from translate-all.c to tb-maint.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  55 +++
 accel/tcg/tb-maint.c      | 735 ++++++++++++++++++++++++++++++++++++
 accel/tcg/translate-all.c | 766 +-------------------------------------
 accel/tcg/meson.build     |   1 +
 4 files changed, 802 insertions(+), 755 deletions(-)
 create mode 100644 accel/tcg/tb-maint.c

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 62da49ed52..a77b110b78 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -35,6 +35,27 @@ typedef struct PageDesc {
 #endif
 } PageDesc;
 
+/* Size of the L2 (and L3, etc) page tables.  */
+#define V_L2_BITS 10
+#define V_L2_SIZE (1 << V_L2_BITS)
+
+/*
+ * L1 Mapping properties
+ */
+extern int v_l1_size;
+extern int v_l1_shift;
+extern int v_l2_levels;
+
+/*
+ * The bottom level has pointers to PageDesc, and is indexed by
+ * anything from 4 to (V_L2_BITS + 3) bits, depending on target page size.
+ */
+#define V_L1_MIN_BITS 4
+#define V_L1_MAX_BITS (V_L2_BITS + 3)
+#define V_L1_MAX_SIZE (1 << V_L1_MAX_BITS)
+
+extern void *l1_map[V_L1_MAX_SIZE];
+
 PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc);
 
 static inline PageDesc *page_find(tb_page_addr_t index)
@@ -42,12 +63,46 @@ static inline PageDesc *page_find(tb_page_addr_t index)
     return page_find_alloc(index, false);
 }
 
+/* list iterators for lists of tagged pointers in TranslationBlock */
+#define TB_FOR_EACH_TAGGED(head, tb, n, field)                          \
+    for (n = (head) & 1, tb = (TranslationBlock *)((head) & ~1);        \
+         tb; tb = (TranslationBlock *)tb->field[n], n = (uintptr_t)tb & 1, \
+             tb = (TranslationBlock *)((uintptr_t)tb & ~1))
+
+#define PAGE_FOR_EACH_TB(pagedesc, tb, n)                       \
+    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
+
+#define TB_FOR_EACH_JMP(head_tb, tb, n)                                 \
+    TB_FOR_EACH_TAGGED((head_tb)->jmp_list_head, tb, n, jmp_list_next)
+
+/* In user-mode page locks aren't used; mmap_lock is enough */
+#ifdef CONFIG_USER_ONLY
+#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
+static inline void page_lock(PageDesc *pd) { }
+static inline void page_unlock(PageDesc *pd) { }
+#else
+#ifdef CONFIG_DEBUG_TCG
+void do_assert_page_locked(const PageDesc *pd, const char *file, int line);
+#define assert_page_locked(pd) do_assert_page_locked(pd, __FILE__, __LINE__)
+#else
+#define assert_page_locked(pd)
+#endif
+void page_lock(PageDesc *pd);
+void page_unlock(PageDesc *pd);
+#endif
+
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
+void tb_reset_jump(TranslationBlock *tb, int n);
+TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                               tb_page_addr_t phys_page2);
+bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc);
+int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
+                              uintptr_t searched_pc, bool reset_icount);
 
 /* Return the current PC from CPU, which may be cached in TB. */
 static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
new file mode 100644
index 0000000000..66c1900ae6
--- /dev/null
+++ b/accel/tcg/tb-maint.c
@@ -0,0 +1,735 @@
+/*
+ * Translation Block Maintaince
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/cputlb.h"
+#include "exec/log.h"
+#include "exec/translate-all.h"
+#include "sysemu/tcg.h"
+#include "tcg/tcg.h"
+#include "tb-hash.h"
+#include "tb-context.h"
+#include "internal.h"
+
+/* FIXME: tb_invalidate_phys_range is declared in different places. */
+#ifdef CONFIG_USER_ONLY
+#include "exec/exec-all.h"
+#else
+#include "exec/ram_addr.h"
+#endif
+
+static bool tb_cmp(const void *ap, const void *bp)
+{
+    const TranslationBlock *a = ap;
+    const TranslationBlock *b = bp;
+
+    return ((TARGET_TB_PCREL || tb_pc(a) == tb_pc(b)) &&
+            a->cs_base == b->cs_base &&
+            a->flags == b->flags &&
+            (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
+            a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
+            a->page_addr[0] == b->page_addr[0] &&
+            a->page_addr[1] == b->page_addr[1]);
+}
+
+void tb_htable_init(void)
+{
+    unsigned int mode = QHT_MODE_AUTO_RESIZE;
+
+    qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
+}
+
+/* Set to NULL all the 'first_tb' fields in all PageDescs. */
+static void page_flush_tb_1(int level, void **lp)
+{
+    int i;
+
+    if (*lp == NULL) {
+        return;
+    }
+    if (level == 0) {
+        PageDesc *pd = *lp;
+
+        for (i = 0; i < V_L2_SIZE; ++i) {
+            page_lock(&pd[i]);
+            pd[i].first_tb = (uintptr_t)NULL;
+            page_unlock(&pd[i]);
+        }
+    } else {
+        void **pp = *lp;
+
+        for (i = 0; i < V_L2_SIZE; ++i) {
+            page_flush_tb_1(level - 1, pp + i);
+        }
+    }
+}
+
+static void page_flush_tb(void)
+{
+    int i, l1_sz = v_l1_size;
+
+    for (i = 0; i < l1_sz; i++) {
+        page_flush_tb_1(v_l2_levels, l1_map + i);
+    }
+}
+
+/* flush all the translation blocks */
+static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
+{
+    bool did_flush = false;
+
+    mmap_lock();
+    /* If it is already been done on request of another CPU, just retry. */
+    if (tb_ctx.tb_flush_count != tb_flush_count.host_int) {
+        goto done;
+    }
+    did_flush = true;
+
+    CPU_FOREACH(cpu) {
+        tcg_flush_jmp_cache(cpu);
+    }
+
+    qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
+    page_flush_tb();
+
+    tcg_region_reset_all();
+    /* XXX: flush processor icache at this point if cache flush is expensive */
+    qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
+
+done:
+    mmap_unlock();
+    if (did_flush) {
+        qemu_plugin_flush_cb();
+    }
+}
+
+void tb_flush(CPUState *cpu)
+{
+    if (tcg_enabled()) {
+        unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
+
+        if (cpu_in_exclusive_context(cpu)) {
+            do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
+        } else {
+            async_safe_run_on_cpu(cpu, do_tb_flush,
+                                  RUN_ON_CPU_HOST_INT(tb_flush_count));
+        }
+    }
+}
+
+/*
+ * user-mode: call with mmap_lock held
+ * !user-mode: call with @pd->lock held
+ */
+static inline void tb_page_remove(PageDesc *pd, TranslationBlock *tb)
+{
+    TranslationBlock *tb1;
+    uintptr_t *pprev;
+    unsigned int n1;
+
+    assert_page_locked(pd);
+    pprev = &pd->first_tb;
+    PAGE_FOR_EACH_TB(pd, tb1, n1) {
+        if (tb1 == tb) {
+            *pprev = tb1->page_next[n1];
+            return;
+        }
+        pprev = &tb1->page_next[n1];
+    }
+    g_assert_not_reached();
+}
+
+/* remove @orig from its @n_orig-th jump list */
+static inline void tb_remove_from_jmp_list(TranslationBlock *orig, int n_orig)
+{
+    uintptr_t ptr, ptr_locked;
+    TranslationBlock *dest;
+    TranslationBlock *tb;
+    uintptr_t *pprev;
+    int n;
+
+    /* mark the LSB of jmp_dest[] so that no further jumps can be inserted */
+    ptr = qatomic_or_fetch(&orig->jmp_dest[n_orig], 1);
+    dest = (TranslationBlock *)(ptr & ~1);
+    if (dest == NULL) {
+        return;
+    }
+
+    qemu_spin_lock(&dest->jmp_lock);
+    /*
+     * While acquiring the lock, the jump might have been removed if the
+     * destination TB was invalidated; check again.
+     */
+    ptr_locked = qatomic_read(&orig->jmp_dest[n_orig]);
+    if (ptr_locked != ptr) {
+        qemu_spin_unlock(&dest->jmp_lock);
+        /*
+         * The only possibility is that the jump was unlinked via
+         * tb_jump_unlink(dest). Seeing here another destination would be a bug,
+         * because we set the LSB above.
+         */
+        g_assert(ptr_locked == 1 && dest->cflags & CF_INVALID);
+        return;
+    }
+    /*
+     * We first acquired the lock, and since the destination pointer matches,
+     * we know for sure that @orig is in the jmp list.
+     */
+    pprev = &dest->jmp_list_head;
+    TB_FOR_EACH_JMP(dest, tb, n) {
+        if (tb == orig && n == n_orig) {
+            *pprev = tb->jmp_list_next[n];
+            /* no need to set orig->jmp_dest[n]; setting the LSB was enough */
+            qemu_spin_unlock(&dest->jmp_lock);
+            return;
+        }
+        pprev = &tb->jmp_list_next[n];
+    }
+    g_assert_not_reached();
+}
+
+/*
+ * Reset the jump entry 'n' of a TB so that it is not chained to another TB.
+ */
+void tb_reset_jump(TranslationBlock *tb, int n)
+{
+    uintptr_t addr = (uintptr_t)(tb->tc.ptr + tb->jmp_reset_offset[n]);
+    tb_set_jmp_target(tb, n, addr);
+}
+
+/* remove any jumps to the TB */
+static inline void tb_jmp_unlink(TranslationBlock *dest)
+{
+    TranslationBlock *tb;
+    int n;
+
+    qemu_spin_lock(&dest->jmp_lock);
+
+    TB_FOR_EACH_JMP(dest, tb, n) {
+        tb_reset_jump(tb, n);
+        qatomic_and(&tb->jmp_dest[n], (uintptr_t)NULL | 1);
+        /* No need to clear the list entry; setting the dest ptr is enough */
+    }
+    dest->jmp_list_head = (uintptr_t)NULL;
+
+    qemu_spin_unlock(&dest->jmp_lock);
+}
+
+static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
+{
+    CPUState *cpu;
+
+    if (TARGET_TB_PCREL) {
+        /* A TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            tcg_flush_jmp_cache(cpu);
+        }
+    } else {
+        uint32_t h = tb_jmp_cache_hash_func(tb_pc(tb));
+
+        CPU_FOREACH(cpu) {
+            CPUJumpCache *jc = cpu->tb_jmp_cache;
+
+            if (qatomic_read(&jc->array[h].tb) == tb) {
+                qatomic_set(&jc->array[h].tb, NULL);
+            }
+        }
+    }
+}
+
+/*
+ * In user-mode, call with mmap_lock held.
+ * In !user-mode, if @rm_from_page_list is set, call with the TB's pages'
+ * locks held.
+ */
+static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
+{
+    PageDesc *p;
+    uint32_t h;
+    tb_page_addr_t phys_pc;
+    uint32_t orig_cflags = tb_cflags(tb);
+
+    assert_memory_lock();
+
+    /* make sure no further incoming jumps will be chained to this TB */
+    qemu_spin_lock(&tb->jmp_lock);
+    qatomic_set(&tb->cflags, tb->cflags | CF_INVALID);
+    qemu_spin_unlock(&tb->jmp_lock);
+
+    /* remove the TB from the hash list */
+    phys_pc = tb->page_addr[0];
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
+    if (!qht_remove(&tb_ctx.htable, tb, h)) {
+        return;
+    }
+
+    /* remove the TB from the page list */
+    if (rm_from_page_list) {
+        p = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
+        tb_page_remove(p, tb);
+        if (tb->page_addr[1] != -1) {
+            p = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
+            tb_page_remove(p, tb);
+        }
+    }
+
+    /* remove the TB from the hash list */
+    tb_jmp_cache_inval_tb(tb);
+
+    /* suppress this TB from the two jump lists */
+    tb_remove_from_jmp_list(tb, 0);
+    tb_remove_from_jmp_list(tb, 1);
+
+    /* suppress any remaining jumps to this TB */
+    tb_jmp_unlink(tb);
+
+    qatomic_set(&tb_ctx.tb_phys_invalidate_count,
+                tb_ctx.tb_phys_invalidate_count + 1);
+}
+
+static void tb_phys_invalidate__locked(TranslationBlock *tb)
+{
+    qemu_thread_jit_write();
+    do_tb_phys_invalidate(tb, true);
+    qemu_thread_jit_execute();
+}
+
+static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
+{
+    PageDesc *p1, *p2;
+    tb_page_addr_t page1;
+    tb_page_addr_t page2;
+
+    assert_memory_lock();
+    g_assert(phys1 != -1);
+
+    page1 = phys1 >> TARGET_PAGE_BITS;
+    page2 = phys2 >> TARGET_PAGE_BITS;
+
+    p1 = page_find_alloc(page1, alloc);
+    if (ret_p1) {
+        *ret_p1 = p1;
+    }
+    if (likely(phys2 == -1)) {
+        page_lock(p1);
+        return;
+    } else if (page1 == page2) {
+        page_lock(p1);
+        if (ret_p2) {
+            *ret_p2 = p1;
+        }
+        return;
+    }
+    p2 = page_find_alloc(page2, alloc);
+    if (ret_p2) {
+        *ret_p2 = p2;
+    }
+    if (page1 < page2) {
+        page_lock(p1);
+        page_lock(p2);
+    } else {
+        page_lock(p2);
+        page_lock(p1);
+    }
+}
+
+#ifdef CONFIG_USER_ONLY
+static inline void page_lock_tb(const TranslationBlock *tb) { }
+static inline void page_unlock_tb(const TranslationBlock *tb) { }
+#else
+/* lock the page(s) of a TB in the correct acquisition order */
+static void page_lock_tb(const TranslationBlock *tb)
+{
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
+}
+
+static void page_unlock_tb(const TranslationBlock *tb)
+{
+    PageDesc *p1 = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
+
+    page_unlock(p1);
+    if (unlikely(tb->page_addr[1] != -1)) {
+        PageDesc *p2 = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
+
+        if (p2 != p1) {
+            page_unlock(p2);
+        }
+    }
+}
+#endif
+
+/*
+ * Invalidate one TB.
+ * Called with mmap_lock held in user-mode.
+ */
+void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
+{
+    if (page_addr == -1 && tb->page_addr[0] != -1) {
+        page_lock_tb(tb);
+        do_tb_phys_invalidate(tb, true);
+        page_unlock_tb(tb);
+    } else {
+        do_tb_phys_invalidate(tb, false);
+    }
+}
+
+/*
+ * Add the tb in the target page and protect it if necessary.
+ * Called with mmap_lock held for user-mode emulation.
+ * Called with @p->lock held in !user-mode.
+ */
+static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
+                               unsigned int n, tb_page_addr_t page_addr)
+{
+#ifndef CONFIG_USER_ONLY
+    bool page_already_protected;
+#endif
+
+    assert_page_locked(p);
+
+    tb->page_addr[n] = page_addr;
+    tb->page_next[n] = p->first_tb;
+#ifndef CONFIG_USER_ONLY
+    page_already_protected = p->first_tb != (uintptr_t)NULL;
+#endif
+    p->first_tb = (uintptr_t)tb | n;
+
+#if defined(CONFIG_USER_ONLY)
+    /* translator_loop() must have made all TB pages non-writable */
+    assert(!(p->flags & PAGE_WRITE));
+#else
+    /*
+     * If some code is already present, then the pages are already
+     * protected. So we handle the case where only the first TB is
+     * allocated in a physical page.
+     */
+    if (!page_already_protected) {
+        tlb_protect_code(page_addr);
+    }
+#endif
+}
+
+/*
+ * Add a new TB and link it to the physical page tables. phys_page2 is
+ * (-1) to indicate that only one page contains the TB.
+ *
+ * Called with mmap_lock held for user-mode emulation.
+ *
+ * Returns a pointer @tb, or a pointer to an existing TB that matches @tb.
+ * Note that in !user-mode, another thread might have already added a TB
+ * for the same block of guest code that @tb corresponds to. In that case,
+ * the caller should discard the original @tb, and use instead the returned TB.
+ */
+TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                               tb_page_addr_t phys_page2)
+{
+    PageDesc *p;
+    PageDesc *p2 = NULL;
+    void *existing_tb = NULL;
+    uint32_t h;
+
+    assert_memory_lock();
+    tcg_debug_assert(!(tb->cflags & CF_INVALID));
+
+    /*
+     * Add the TB to the page list, acquiring first the pages's locks.
+     * We keep the locks held until after inserting the TB in the hash table,
+     * so that if the insertion fails we know for sure that the TBs are still
+     * in the page descriptors.
+     * Note that inserting into the hash table first isn't an option, since
+     * we can only insert TBs that are fully initialized.
+     */
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
+    tb_page_add(p, tb, 0, phys_pc);
+    if (p2) {
+        tb_page_add(p2, tb, 1, phys_page2);
+    } else {
+        tb->page_addr[1] = -1;
+    }
+
+    /* add in the hash table */
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
+    qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
+
+    /* remove TB from the page(s) if we couldn't insert it */
+    if (unlikely(existing_tb)) {
+        tb_page_remove(p, tb);
+        if (p2) {
+            tb_page_remove(p2, tb);
+        }
+        tb = existing_tb;
+    }
+
+    if (p2 && p2 != p) {
+        page_unlock(p2);
+    }
+    page_unlock(p);
+    return tb;
+}
+
+/*
+ * @p must be non-NULL.
+ * user-mode: call with mmap_lock held.
+ * !user-mode: call with all @pages locked.
+ */
+static void
+tb_invalidate_phys_page_range__locked(struct page_collection *pages,
+                                      PageDesc *p, tb_page_addr_t start,
+                                      tb_page_addr_t end,
+                                      uintptr_t retaddr)
+{
+    TranslationBlock *tb;
+    tb_page_addr_t tb_start, tb_end;
+    int n;
+#ifdef TARGET_HAS_PRECISE_SMC
+    CPUState *cpu = current_cpu;
+    CPUArchState *env = NULL;
+    bool current_tb_not_found = retaddr != 0;
+    bool current_tb_modified = false;
+    TranslationBlock *current_tb = NULL;
+    target_ulong current_pc = 0;
+    target_ulong current_cs_base = 0;
+    uint32_t current_flags = 0;
+#endif /* TARGET_HAS_PRECISE_SMC */
+
+    assert_page_locked(p);
+
+#if defined(TARGET_HAS_PRECISE_SMC)
+    if (cpu != NULL) {
+        env = cpu->env_ptr;
+    }
+#endif
+
+    /*
+     * We remove all the TBs in the range [start, end[.
+     * XXX: see if in some cases it could be faster to invalidate all the code
+     */
+    PAGE_FOR_EACH_TB(p, tb, n) {
+        assert_page_locked(p);
+        /* NOTE: this is subtle as a TB may span two physical pages */
+        if (n == 0) {
+            /* NOTE: tb_end may be after the end of the page, but
+               it is not a problem */
+            tb_start = tb->page_addr[0];
+            tb_end = tb_start + tb->size;
+        } else {
+            tb_start = tb->page_addr[1];
+            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
+                                 & ~TARGET_PAGE_MASK);
+        }
+        if (!(tb_end <= start || tb_start >= end)) {
+#ifdef TARGET_HAS_PRECISE_SMC
+            if (current_tb_not_found) {
+                current_tb_not_found = false;
+                /* now we have a real cpu fault */
+                current_tb = tcg_tb_lookup(retaddr);
+            }
+            if (current_tb == tb &&
+                (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
+                /*
+                 * If we are modifying the current TB, we must stop
+                 * its execution. We could be more precise by checking
+                 * that the modification is after the current PC, but it
+                 * would require a specialized function to partially
+                 * restore the CPU state.
+                 */
+                current_tb_modified = true;
+                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
+                cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
+                                     &current_flags);
+            }
+#endif /* TARGET_HAS_PRECISE_SMC */
+            tb_phys_invalidate__locked(tb);
+        }
+    }
+#if !defined(CONFIG_USER_ONLY)
+    /* if no code remaining, no need to continue to use slow writes */
+    if (!p->first_tb) {
+        tlb_unprotect_code(start);
+    }
+#endif
+#ifdef TARGET_HAS_PRECISE_SMC
+    if (current_tb_modified) {
+        page_collection_unlock(pages);
+        /* Force execution of one insn next time.  */
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
+        mmap_unlock();
+        cpu_loop_exit_noexc(cpu);
+    }
+#endif
+}
+
+/*
+ * Invalidate all TBs which intersect with the target physical address range
+ * [start;end[. NOTE: start and end must refer to the *same* physical page.
+ * 'is_cpu_write_access' should be true if called from a real cpu write
+ * access: the virtual CPU will exit the current TB if code is modified inside
+ * this TB.
+ *
+ * Called with mmap_lock held for user-mode emulation
+ */
+void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
+{
+    struct page_collection *pages;
+    PageDesc *p;
+
+    assert_memory_lock();
+
+    p = page_find(start >> TARGET_PAGE_BITS);
+    if (p == NULL) {
+        return;
+    }
+    pages = page_collection_lock(start, end);
+    tb_invalidate_phys_page_range__locked(pages, p, start, end, 0);
+    page_collection_unlock(pages);
+}
+
+/*
+ * Invalidate all TBs which intersect with the target physical address range
+ * [start;end[. NOTE: start and end may refer to *different* physical pages.
+ * 'is_cpu_write_access' should be true if called from a real cpu write
+ * access: the virtual CPU will exit the current TB if code is modified inside
+ * this TB.
+ *
+ * Called with mmap_lock held for user-mode emulation.
+ */
+#ifdef CONFIG_SOFTMMU
+void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end)
+#else
+void tb_invalidate_phys_range(target_ulong start, target_ulong end)
+#endif
+{
+    struct page_collection *pages;
+    tb_page_addr_t next;
+
+    assert_memory_lock();
+
+    pages = page_collection_lock(start, end);
+    for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+         start < end;
+         start = next, next += TARGET_PAGE_SIZE) {
+        PageDesc *pd = page_find(start >> TARGET_PAGE_BITS);
+        tb_page_addr_t bound = MIN(next, end);
+
+        if (pd == NULL) {
+            continue;
+        }
+        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
+    }
+    page_collection_unlock(pages);
+}
+
+#ifdef CONFIG_SOFTMMU
+/*
+ * len must be <= 8 and start must be a multiple of len.
+ * Called via softmmu_template.h when code areas are written to with
+ * iothread mutex not held.
+ *
+ * Call with all @pages in the range [@start, @start + len[ locked.
+ */
+void tb_invalidate_phys_page_fast(struct page_collection *pages,
+                                  tb_page_addr_t start, int len,
+                                  uintptr_t retaddr)
+{
+    PageDesc *p;
+
+    assert_memory_lock();
+
+    p = page_find(start >> TARGET_PAGE_BITS);
+    if (!p) {
+        return;
+    }
+
+    assert_page_locked(p);
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
+                                          retaddr);
+}
+#else
+/*
+ * Called with mmap_lock held. If pc is not 0 then it indicates the
+ * host PC of the faulting store instruction that caused this invalidate.
+ * Returns true if the caller needs to abort execution of the current
+ * TB (because it was modified by this store and the guest CPU has
+ * precise-SMC semantics).
+ */
+bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
+{
+    TranslationBlock *tb;
+    PageDesc *p;
+    int n;
+#ifdef TARGET_HAS_PRECISE_SMC
+    TranslationBlock *current_tb = NULL;
+    CPUState *cpu = current_cpu;
+    CPUArchState *env = NULL;
+    int current_tb_modified = 0;
+    target_ulong current_pc = 0;
+    target_ulong current_cs_base = 0;
+    uint32_t current_flags = 0;
+#endif
+
+    assert_memory_lock();
+
+    addr &= TARGET_PAGE_MASK;
+    p = page_find(addr >> TARGET_PAGE_BITS);
+    if (!p) {
+        return false;
+    }
+
+#ifdef TARGET_HAS_PRECISE_SMC
+    if (p->first_tb && pc != 0) {
+        current_tb = tcg_tb_lookup(pc);
+    }
+    if (cpu != NULL) {
+        env = cpu->env_ptr;
+    }
+#endif
+    assert_page_locked(p);
+    PAGE_FOR_EACH_TB(p, tb, n) {
+#ifdef TARGET_HAS_PRECISE_SMC
+        if (current_tb == tb &&
+            (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
+            /*
+             * If we are modifying the current TB, we must stop its execution.
+             * We could be more precise by checking that the modification is
+             * after the current PC, but it would require a specialized
+             * function to partially restore the CPU state.
+             */
+            current_tb_modified = 1;
+            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
+            cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
+                                 &current_flags);
+        }
+#endif /* TARGET_HAS_PRECISE_SMC */
+        tb_phys_invalidate(tb, addr);
+    }
+    p->first_tb = (uintptr_t)NULL;
+#ifdef TARGET_HAS_PRECISE_SMC
+    if (current_tb_modified) {
+        /* Force execution of one insn next time.  */
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
+        return true;
+    }
+#endif
+
+    return false;
+}
+#endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 86848c6743..5e28e9fccd 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -109,18 +109,6 @@ struct page_collection {
     struct page_entry *max;
 };
 
-/* list iterators for lists of tagged pointers in TranslationBlock */
-#define TB_FOR_EACH_TAGGED(head, tb, n, field)                          \
-    for (n = (head) & 1, tb = (TranslationBlock *)((head) & ~1);        \
-         tb; tb = (TranslationBlock *)tb->field[n], n = (uintptr_t)tb & 1, \
-             tb = (TranslationBlock *)((uintptr_t)tb & ~1))
-
-#define PAGE_FOR_EACH_TB(pagedesc, tb, n)                       \
-    TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
-
-#define TB_FOR_EACH_JMP(head_tb, tb, n)                                 \
-    TB_FOR_EACH_TAGGED((head_tb)->jmp_list_head, tb, n, jmp_list_next)
-
 /*
  * In system mode we want L1_MAP to be based on ram offsets,
  * while in user mode we want it to be based on virtual addresses.
@@ -138,10 +126,6 @@ struct page_collection {
 # define L1_MAP_ADDR_SPACE_BITS  MIN(HOST_LONG_BITS, TARGET_ABI_BITS)
 #endif
 
-/* Size of the L2 (and L3, etc) page tables.  */
-#define V_L2_BITS 10
-#define V_L2_SIZE (1 << V_L2_BITS)
-
 /* Make sure all possible CPU event bits fit in tb->trace_vcpu_dstate */
 QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
                   sizeof_field(TranslationBlock, trace_vcpu_dstate)
@@ -150,18 +134,11 @@ QEMU_BUILD_BUG_ON(CPU_TRACE_DSTATE_MAX_EVENTS >
 /*
  * L1 Mapping properties
  */
-static int v_l1_size;
-static int v_l1_shift;
-static int v_l2_levels;
+int v_l1_size;
+int v_l1_shift;
+int v_l2_levels;
 
-/* The bottom level has pointers to PageDesc, and is indexed by
- * anything from 4 to (V_L2_BITS + 3) bits, depending on target page size.
- */
-#define V_L1_MIN_BITS 4
-#define V_L1_MAX_BITS (V_L2_BITS + 3)
-#define V_L1_MAX_SIZE (1 << V_L1_MAX_BITS)
-
-static void *l1_map[V_L1_MAX_SIZE];
+void *l1_map[V_L1_MAX_SIZE];
 
 TBContext tb_ctx;
 
@@ -274,8 +251,8 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
  * When reset_icount is true, current TB will be interrupted and
  * icount should be recalculated.
  */
-static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                                     uintptr_t searched_pc, bool reset_icount)
+int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
+                              uintptr_t searched_pc, bool reset_icount)
 {
     target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
@@ -487,26 +464,8 @@ PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
     return pd + (index & (V_L2_SIZE - 1));
 }
 
-static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc);
-
 /* In user-mode page locks aren't used; mmap_lock is enough */
 #ifdef CONFIG_USER_ONLY
-
-#define assert_page_locked(pd) tcg_debug_assert(have_mmap_lock())
-
-static inline void page_lock(PageDesc *pd)
-{ }
-
-static inline void page_unlock(PageDesc *pd)
-{ }
-
-static inline void page_lock_tb(const TranslationBlock *tb)
-{ }
-
-static inline void page_unlock_tb(const TranslationBlock *tb)
-{ }
-
 struct page_collection *
 page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
 {
@@ -555,8 +514,7 @@ static void page_unlock__debug(const PageDesc *pd)
     g_assert(removed);
 }
 
-static void
-do_assert_page_locked(const PageDesc *pd, const char *file, int line)
+void do_assert_page_locked(const PageDesc *pd, const char *file, int line)
 {
     if (unlikely(!page_is_locked(pd))) {
         error_report("assert_page_lock: PageDesc %p not locked @ %s:%d",
@@ -565,8 +523,6 @@ do_assert_page_locked(const PageDesc *pd, const char *file, int line)
     }
 }
 
-#define assert_page_locked(pd) do_assert_page_locked(pd, __FILE__, __LINE__)
-
 void assert_no_pages_locked(void)
 {
     ht_pages_locked_debug_init();
@@ -575,50 +531,23 @@ void assert_no_pages_locked(void)
 
 #else /* !CONFIG_DEBUG_TCG */
 
-#define assert_page_locked(pd)
-
-static inline void page_lock__debug(const PageDesc *pd)
-{
-}
-
-static inline void page_unlock__debug(const PageDesc *pd)
-{
-}
+static inline void page_lock__debug(const PageDesc *pd) { }
+static inline void page_unlock__debug(const PageDesc *pd) { }
 
 #endif /* CONFIG_DEBUG_TCG */
 
-static inline void page_lock(PageDesc *pd)
+void page_lock(PageDesc *pd)
 {
     page_lock__debug(pd);
     qemu_spin_lock(&pd->lock);
 }
 
-static inline void page_unlock(PageDesc *pd)
+void page_unlock(PageDesc *pd)
 {
     qemu_spin_unlock(&pd->lock);
     page_unlock__debug(pd);
 }
 
-/* lock the page(s) of a TB in the correct acquisition order */
-static inline void page_lock_tb(const TranslationBlock *tb)
-{
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
-}
-
-static inline void page_unlock_tb(const TranslationBlock *tb)
-{
-    PageDesc *p1 = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
-
-    page_unlock(p1);
-    if (unlikely(tb->page_addr[1] != -1)) {
-        PageDesc *p2 = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
-
-        if (p2 != p1) {
-            page_unlock(p2);
-        }
-    }
-}
-
 static inline struct page_entry *
 page_entry_new(PageDesc *pd, tb_page_addr_t index)
 {
@@ -790,434 +719,6 @@ void page_collection_unlock(struct page_collection *set)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
-{
-    PageDesc *p1, *p2;
-    tb_page_addr_t page1;
-    tb_page_addr_t page2;
-
-    assert_memory_lock();
-    g_assert(phys1 != -1);
-
-    page1 = phys1 >> TARGET_PAGE_BITS;
-    page2 = phys2 >> TARGET_PAGE_BITS;
-
-    p1 = page_find_alloc(page1, alloc);
-    if (ret_p1) {
-        *ret_p1 = p1;
-    }
-    if (likely(phys2 == -1)) {
-        page_lock(p1);
-        return;
-    } else if (page1 == page2) {
-        page_lock(p1);
-        if (ret_p2) {
-            *ret_p2 = p1;
-        }
-        return;
-    }
-    p2 = page_find_alloc(page2, alloc);
-    if (ret_p2) {
-        *ret_p2 = p2;
-    }
-    if (page1 < page2) {
-        page_lock(p1);
-        page_lock(p2);
-    } else {
-        page_lock(p2);
-        page_lock(p1);
-    }
-}
-
-static bool tb_cmp(const void *ap, const void *bp)
-{
-    const TranslationBlock *a = ap;
-    const TranslationBlock *b = bp;
-
-    return ((TARGET_TB_PCREL || tb_pc(a) == tb_pc(b)) &&
-            a->cs_base == b->cs_base &&
-            a->flags == b->flags &&
-            (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
-            a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
-            a->page_addr[0] == b->page_addr[0] &&
-            a->page_addr[1] == b->page_addr[1]);
-}
-
-void tb_htable_init(void)
-{
-    unsigned int mode = QHT_MODE_AUTO_RESIZE;
-
-    qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
-}
-
-/* Set to NULL all the 'first_tb' fields in all PageDescs. */
-static void page_flush_tb_1(int level, void **lp)
-{
-    int i;
-
-    if (*lp == NULL) {
-        return;
-    }
-    if (level == 0) {
-        PageDesc *pd = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            page_lock(&pd[i]);
-            pd[i].first_tb = (uintptr_t)NULL;
-            page_unlock(&pd[i]);
-        }
-    } else {
-        void **pp = *lp;
-
-        for (i = 0; i < V_L2_SIZE; ++i) {
-            page_flush_tb_1(level - 1, pp + i);
-        }
-    }
-}
-
-static void page_flush_tb(void)
-{
-    int i, l1_sz = v_l1_size;
-
-    for (i = 0; i < l1_sz; i++) {
-        page_flush_tb_1(v_l2_levels, l1_map + i);
-    }
-}
-
-/* flush all the translation blocks */
-static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
-{
-    bool did_flush = false;
-
-    mmap_lock();
-    /* If it is already been done on request of another CPU,
-     * just retry.
-     */
-    if (tb_ctx.tb_flush_count != tb_flush_count.host_int) {
-        goto done;
-    }
-    did_flush = true;
-
-    CPU_FOREACH(cpu) {
-        tcg_flush_jmp_cache(cpu);
-    }
-
-    qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
-    page_flush_tb();
-
-    tcg_region_reset_all();
-    /* XXX: flush processor icache at this point if cache flush is
-       expensive */
-    qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
-
-done:
-    mmap_unlock();
-    if (did_flush) {
-        qemu_plugin_flush_cb();
-    }
-}
-
-void tb_flush(CPUState *cpu)
-{
-    if (tcg_enabled()) {
-        unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
-
-        if (cpu_in_exclusive_context(cpu)) {
-            do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
-        } else {
-            async_safe_run_on_cpu(cpu, do_tb_flush,
-                                  RUN_ON_CPU_HOST_INT(tb_flush_count));
-        }
-    }
-}
-
-/*
- * user-mode: call with mmap_lock held
- * !user-mode: call with @pd->lock held
- */
-static inline void tb_page_remove(PageDesc *pd, TranslationBlock *tb)
-{
-    TranslationBlock *tb1;
-    uintptr_t *pprev;
-    unsigned int n1;
-
-    assert_page_locked(pd);
-    pprev = &pd->first_tb;
-    PAGE_FOR_EACH_TB(pd, tb1, n1) {
-        if (tb1 == tb) {
-            *pprev = tb1->page_next[n1];
-            return;
-        }
-        pprev = &tb1->page_next[n1];
-    }
-    g_assert_not_reached();
-}
-
-/* remove @orig from its @n_orig-th jump list */
-static inline void tb_remove_from_jmp_list(TranslationBlock *orig, int n_orig)
-{
-    uintptr_t ptr, ptr_locked;
-    TranslationBlock *dest;
-    TranslationBlock *tb;
-    uintptr_t *pprev;
-    int n;
-
-    /* mark the LSB of jmp_dest[] so that no further jumps can be inserted */
-    ptr = qatomic_or_fetch(&orig->jmp_dest[n_orig], 1);
-    dest = (TranslationBlock *)(ptr & ~1);
-    if (dest == NULL) {
-        return;
-    }
-
-    qemu_spin_lock(&dest->jmp_lock);
-    /*
-     * While acquiring the lock, the jump might have been removed if the
-     * destination TB was invalidated; check again.
-     */
-    ptr_locked = qatomic_read(&orig->jmp_dest[n_orig]);
-    if (ptr_locked != ptr) {
-        qemu_spin_unlock(&dest->jmp_lock);
-        /*
-         * The only possibility is that the jump was unlinked via
-         * tb_jump_unlink(dest). Seeing here another destination would be a bug,
-         * because we set the LSB above.
-         */
-        g_assert(ptr_locked == 1 && dest->cflags & CF_INVALID);
-        return;
-    }
-    /*
-     * We first acquired the lock, and since the destination pointer matches,
-     * we know for sure that @orig is in the jmp list.
-     */
-    pprev = &dest->jmp_list_head;
-    TB_FOR_EACH_JMP(dest, tb, n) {
-        if (tb == orig && n == n_orig) {
-            *pprev = tb->jmp_list_next[n];
-            /* no need to set orig->jmp_dest[n]; setting the LSB was enough */
-            qemu_spin_unlock(&dest->jmp_lock);
-            return;
-        }
-        pprev = &tb->jmp_list_next[n];
-    }
-    g_assert_not_reached();
-}
-
-/* reset the jump entry 'n' of a TB so that it is not chained to
-   another TB */
-static inline void tb_reset_jump(TranslationBlock *tb, int n)
-{
-    uintptr_t addr = (uintptr_t)(tb->tc.ptr + tb->jmp_reset_offset[n]);
-    tb_set_jmp_target(tb, n, addr);
-}
-
-/* remove any jumps to the TB */
-static inline void tb_jmp_unlink(TranslationBlock *dest)
-{
-    TranslationBlock *tb;
-    int n;
-
-    qemu_spin_lock(&dest->jmp_lock);
-
-    TB_FOR_EACH_JMP(dest, tb, n) {
-        tb_reset_jump(tb, n);
-        qatomic_and(&tb->jmp_dest[n], (uintptr_t)NULL | 1);
-        /* No need to clear the list entry; setting the dest ptr is enough */
-    }
-    dest->jmp_list_head = (uintptr_t)NULL;
-
-    qemu_spin_unlock(&dest->jmp_lock);
-}
-
-static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
-{
-    CPUState *cpu;
-
-    if (TARGET_TB_PCREL) {
-        /* A TB may be at any virtual address */
-        CPU_FOREACH(cpu) {
-            tcg_flush_jmp_cache(cpu);
-        }
-    } else {
-        uint32_t h = tb_jmp_cache_hash_func(tb_pc(tb));
-
-        CPU_FOREACH(cpu) {
-            CPUJumpCache *jc = cpu->tb_jmp_cache;
-
-            if (qatomic_read(&jc->array[h].tb) == tb) {
-                qatomic_set(&jc->array[h].tb, NULL);
-            }
-        }
-    }
-}
-
-/*
- * In user-mode, call with mmap_lock held.
- * In !user-mode, if @rm_from_page_list is set, call with the TB's pages'
- * locks held.
- */
-static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
-{
-    PageDesc *p;
-    uint32_t h;
-    tb_page_addr_t phys_pc;
-    uint32_t orig_cflags = tb_cflags(tb);
-
-    assert_memory_lock();
-
-    /* make sure no further incoming jumps will be chained to this TB */
-    qemu_spin_lock(&tb->jmp_lock);
-    qatomic_set(&tb->cflags, tb->cflags | CF_INVALID);
-    qemu_spin_unlock(&tb->jmp_lock);
-
-    /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
-                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
-    if (!qht_remove(&tb_ctx.htable, tb, h)) {
-        return;
-    }
-
-    /* remove the TB from the page list */
-    if (rm_from_page_list) {
-        p = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
-        tb_page_remove(p, tb);
-        if (tb->page_addr[1] != -1) {
-            p = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
-            tb_page_remove(p, tb);
-        }
-    }
-
-    /* remove the TB from the hash list */
-    tb_jmp_cache_inval_tb(tb);
-
-    /* suppress this TB from the two jump lists */
-    tb_remove_from_jmp_list(tb, 0);
-    tb_remove_from_jmp_list(tb, 1);
-
-    /* suppress any remaining jumps to this TB */
-    tb_jmp_unlink(tb);
-
-    qatomic_set(&tb_ctx.tb_phys_invalidate_count,
-                tb_ctx.tb_phys_invalidate_count + 1);
-}
-
-static void tb_phys_invalidate__locked(TranslationBlock *tb)
-{
-    qemu_thread_jit_write();
-    do_tb_phys_invalidate(tb, true);
-    qemu_thread_jit_execute();
-}
-
-/* invalidate one TB
- *
- * Called with mmap_lock held in user-mode.
- */
-void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
-{
-    if (page_addr == -1 && tb->page_addr[0] != -1) {
-        page_lock_tb(tb);
-        do_tb_phys_invalidate(tb, true);
-        page_unlock_tb(tb);
-    } else {
-        do_tb_phys_invalidate(tb, false);
-    }
-}
-
-/* add the tb in the target page and protect it if necessary
- *
- * Called with mmap_lock held for user-mode emulation.
- * Called with @p->lock held in !user-mode.
- */
-static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
-                               unsigned int n, tb_page_addr_t page_addr)
-{
-#ifndef CONFIG_USER_ONLY
-    bool page_already_protected;
-#endif
-
-    assert_page_locked(p);
-
-    tb->page_addr[n] = page_addr;
-    tb->page_next[n] = p->first_tb;
-#ifndef CONFIG_USER_ONLY
-    page_already_protected = p->first_tb != (uintptr_t)NULL;
-#endif
-    p->first_tb = (uintptr_t)tb | n;
-
-#if defined(CONFIG_USER_ONLY)
-    /* translator_loop() must have made all TB pages non-writable */
-    assert(!(p->flags & PAGE_WRITE));
-#else
-    /* if some code is already present, then the pages are already
-       protected. So we handle the case where only the first TB is
-       allocated in a physical page */
-    if (!page_already_protected) {
-        tlb_protect_code(page_addr);
-    }
-#endif
-}
-
-/*
- * Add a new TB and link it to the physical page tables. phys_page2 is
- * (-1) to indicate that only one page contains the TB.
- *
- * Called with mmap_lock held for user-mode emulation.
- *
- * Returns a pointer @tb, or a pointer to an existing TB that matches @tb.
- * Note that in !user-mode, another thread might have already added a TB
- * for the same block of guest code that @tb corresponds to. In that case,
- * the caller should discard the original @tb, and use instead the returned TB.
- */
-static TranslationBlock *
-tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
-             tb_page_addr_t phys_page2)
-{
-    PageDesc *p;
-    PageDesc *p2 = NULL;
-    void *existing_tb = NULL;
-    uint32_t h;
-
-    assert_memory_lock();
-    tcg_debug_assert(!(tb->cflags & CF_INVALID));
-
-    /*
-     * Add the TB to the page list, acquiring first the pages's locks.
-     * We keep the locks held until after inserting the TB in the hash table,
-     * so that if the insertion fails we know for sure that the TBs are still
-     * in the page descriptors.
-     * Note that inserting into the hash table first isn't an option, since
-     * we can only insert TBs that are fully initialized.
-     */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
-    tb_page_add(p, tb, 0, phys_pc);
-    if (p2) {
-        tb_page_add(p2, tb, 1, phys_page2);
-    } else {
-        tb->page_addr[1] = -1;
-    }
-
-    /* add in the hash table */
-    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
-                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
-    qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
-
-    /* remove TB from the page(s) if we couldn't insert it */
-    if (unlikely(existing_tb)) {
-        tb_page_remove(p, tb);
-        if (p2) {
-            tb_page_remove(p2, tb);
-        }
-        tb = existing_tb;
-    }
-
-    if (p2 && p2 != p) {
-        page_unlock(p2);
-    }
-    page_unlock(p);
-    return tb;
-}
-
 /* Called with mmap_lock held for user mode emulation.  */
 TranslationBlock *tb_gen_code(CPUState *cpu,
                               target_ulong pc, target_ulong cs_base,
@@ -1497,251 +998,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     return tb;
 }
 
-/*
- * @p must be non-NULL.
- * user-mode: call with mmap_lock held.
- * !user-mode: call with all @pages locked.
- */
-static void
-tb_invalidate_phys_page_range__locked(struct page_collection *pages,
-                                      PageDesc *p, tb_page_addr_t start,
-                                      tb_page_addr_t end,
-                                      uintptr_t retaddr)
-{
-    TranslationBlock *tb;
-    tb_page_addr_t tb_start, tb_end;
-    int n;
-#ifdef TARGET_HAS_PRECISE_SMC
-    CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
-    bool current_tb_not_found = retaddr != 0;
-    bool current_tb_modified = false;
-    TranslationBlock *current_tb = NULL;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
-#endif /* TARGET_HAS_PRECISE_SMC */
-
-    assert_page_locked(p);
-
-#if defined(TARGET_HAS_PRECISE_SMC)
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
-#endif
-
-    /* we remove all the TBs in the range [start, end[ */
-    /* XXX: see if in some cases it could be faster to invalidate all
-       the code */
-    PAGE_FOR_EACH_TB(p, tb, n) {
-        assert_page_locked(p);
-        /* NOTE: this is subtle as a TB may span two physical pages */
-        if (n == 0) {
-            /* NOTE: tb_end may be after the end of the page, but
-               it is not a problem */
-            tb_start = tb->page_addr[0];
-            tb_end = tb_start + tb->size;
-        } else {
-            tb_start = tb->page_addr[1];
-            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
-                                 & ~TARGET_PAGE_MASK);
-        }
-        if (!(tb_end <= start || tb_start >= end)) {
-#ifdef TARGET_HAS_PRECISE_SMC
-            if (current_tb_not_found) {
-                current_tb_not_found = false;
-                /* now we have a real cpu fault */
-                current_tb = tcg_tb_lookup(retaddr);
-            }
-            if (current_tb == tb &&
-                (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
-                /*
-                 * If we are modifying the current TB, we must stop
-                 * its execution. We could be more precise by checking
-                 * that the modification is after the current PC, but it
-                 * would require a specialized function to partially
-                 * restore the CPU state.
-                 */
-                current_tb_modified = true;
-                cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
-                cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                     &current_flags);
-            }
-#endif /* TARGET_HAS_PRECISE_SMC */
-            tb_phys_invalidate__locked(tb);
-        }
-    }
-#if !defined(CONFIG_USER_ONLY)
-    /* if no code remaining, no need to continue to use slow writes */
-    if (!p->first_tb) {
-        tlb_unprotect_code(start);
-    }
-#endif
-#ifdef TARGET_HAS_PRECISE_SMC
-    if (current_tb_modified) {
-        page_collection_unlock(pages);
-        /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
-        mmap_unlock();
-        cpu_loop_exit_noexc(cpu);
-    }
-#endif
-}
-
-/*
- * Invalidate all TBs which intersect with the target physical address range
- * [start;end[. NOTE: start and end must refer to the *same* physical page.
- * 'is_cpu_write_access' should be true if called from a real cpu write
- * access: the virtual CPU will exit the current TB if code is modified inside
- * this TB.
- *
- * Called with mmap_lock held for user-mode emulation
- */
-void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
-{
-    struct page_collection *pages;
-    PageDesc *p;
-
-    assert_memory_lock();
-
-    p = page_find(start >> TARGET_PAGE_BITS);
-    if (p == NULL) {
-        return;
-    }
-    pages = page_collection_lock(start, end);
-    tb_invalidate_phys_page_range__locked(pages, p, start, end, 0);
-    page_collection_unlock(pages);
-}
-
-/*
- * Invalidate all TBs which intersect with the target physical address range
- * [start;end[. NOTE: start and end may refer to *different* physical pages.
- * 'is_cpu_write_access' should be true if called from a real cpu write
- * access: the virtual CPU will exit the current TB if code is modified inside
- * this TB.
- *
- * Called with mmap_lock held for user-mode emulation.
- */
-#ifdef CONFIG_SOFTMMU
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end)
-#else
-void tb_invalidate_phys_range(target_ulong start, target_ulong end)
-#endif
-{
-    struct page_collection *pages;
-    tb_page_addr_t next;
-
-    assert_memory_lock();
-
-    pages = page_collection_lock(start, end);
-    for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-         start < end;
-         start = next, next += TARGET_PAGE_SIZE) {
-        PageDesc *pd = page_find(start >> TARGET_PAGE_BITS);
-        tb_page_addr_t bound = MIN(next, end);
-
-        if (pd == NULL) {
-            continue;
-        }
-        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
-    }
-    page_collection_unlock(pages);
-}
-
-#ifdef CONFIG_SOFTMMU
-/* len must be <= 8 and start must be a multiple of len.
- * Called via softmmu_template.h when code areas are written to with
- * iothread mutex not held.
- *
- * Call with all @pages in the range [@start, @start + len[ locked.
- */
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr)
-{
-    PageDesc *p;
-
-    assert_memory_lock();
-
-    p = page_find(start >> TARGET_PAGE_BITS);
-    if (!p) {
-        return;
-    }
-
-    assert_page_locked(p);
-    tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
-                                          retaddr);
-}
-#else
-/* Called with mmap_lock held. If pc is not 0 then it indicates the
- * host PC of the faulting store instruction that caused this invalidate.
- * Returns true if the caller needs to abort execution of the current
- * TB (because it was modified by this store and the guest CPU has
- * precise-SMC semantics).
- */
-static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
-{
-    TranslationBlock *tb;
-    PageDesc *p;
-    int n;
-#ifdef TARGET_HAS_PRECISE_SMC
-    TranslationBlock *current_tb = NULL;
-    CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
-    int current_tb_modified = 0;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
-#endif
-
-    assert_memory_lock();
-
-    addr &= TARGET_PAGE_MASK;
-    p = page_find(addr >> TARGET_PAGE_BITS);
-    if (!p) {
-        return false;
-    }
-
-#ifdef TARGET_HAS_PRECISE_SMC
-    if (p->first_tb && pc != 0) {
-        current_tb = tcg_tb_lookup(pc);
-    }
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
-#endif
-    assert_page_locked(p);
-    PAGE_FOR_EACH_TB(p, tb, n) {
-#ifdef TARGET_HAS_PRECISE_SMC
-        if (current_tb == tb &&
-            (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
-                /* If we are modifying the current TB, we must stop
-                   its execution. We could be more precise by checking
-                   that the modification is after the current PC, but it
-                   would require a specialized function to partially
-                   restore the CPU state */
-
-            current_tb_modified = 1;
-            cpu_restore_state_from_tb(cpu, current_tb, pc, true);
-            cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                 &current_flags);
-        }
-#endif /* TARGET_HAS_PRECISE_SMC */
-        tb_phys_invalidate(tb, addr);
-    }
-    p->first_tb = (uintptr_t)NULL;
-#ifdef TARGET_HAS_PRECISE_SMC
-    if (current_tb_modified) {
-        /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
-        return true;
-    }
-#endif
-
-    return false;
-}
-#endif
-
 /* user-mode: call with mmap_lock held */
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 {
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 7a0a79d731..75e1dffb4d 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -3,6 +3,7 @@ tcg_ss.add(files(
   'tcg-all.c',
   'cpu-exec-common.c',
   'cpu-exec.c',
+  'tb-maint.c',
   'tcg-runtime-gvec.c',
   'tcg-runtime.c',
   'translate-all.c',
-- 
2.34.1


