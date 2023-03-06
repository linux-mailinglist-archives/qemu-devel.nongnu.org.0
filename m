Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9896AB48A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lq-0003RK-EQ; Sun, 05 Mar 2023 21:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Ln-0003Nh-QG
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:19 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Ll-00062m-RL
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:19 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so6513085pjb.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QVanyJTWx9kYUSCDwvXPA8IbvB2BsZd8rvitNx43raw=;
 b=ayvQl+8YGbvYwzu2VfbWJMzKY8re4mA2CxS2K3aBpu72UB+sqLcOYucprBaDy5ys4H
 kmLv9nZoKvU3GV4bk5S6rbtM9tflB16OlU+3GgC7gPbNMVEUxsvl1Tsbew7g6JtYhY5a
 R8YRWJDsvb76J3sw4bZaYeauBSwG7qZEYgM3Zn3RhC/KsyujDfGhfqxTzSyGjPK1tQ5O
 v3cxxr2j/mwKOXf15QWyw4hH7o3PsQ2gmawAUY54DqzII3sIXEEyScu29zIRPK5kf+ma
 i6n+2hIKCTpx4YuflWG8sxfLXdTGEt0rJx+rywYP4c2cUlEGKo+fW+zbQNKCuCgkNUuw
 N2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVanyJTWx9kYUSCDwvXPA8IbvB2BsZd8rvitNx43raw=;
 b=NeYKWKsI39uXSv+g2EzRD0ft3tO0caQbkKuk2dq21P+clC7lpTuYNWJdcHzmr3skvi
 9kiIvEy5q2uzoLgI7yuFGksiwDNanZMNSmw1iCLzYTQJmO2EBdHMya0Qcpg1sBkS77iX
 n1VOUk4B6/oIEXensCPYvFbJEL7OE528YFsZrCyY7fAGYlVk2nODGr10GFhDA+PEqnO4
 D5dEUNgCxsiOYzYtwHbr0Jdm5Ps5/VmVVcEqLfE9+EsUgj8POPGpDQXA5Bs/Qp/XAsfA
 sxbbLXFYrYktoEBJiRj+ZPhrid3VWWjFT5YMhJnqUVNljuqXVBE93qybRxYk3Ags8VhE
 Ybgw==
X-Gm-Message-State: AO0yUKUePve9jWExzCDhewZjRXQjZuBHEOwsZZ7bgUq6D1S/yQHHIKwI
 7Zk6oTj2FnCFV4/CW3V+DI31/noUfoPrkZi8tdxwpg==
X-Google-Smtp-Source: AK7set/bsDRz/09sB/qg+oGkEdNT+SF2X9cjh6EDw7GrWHiRKLGJzy5p1t7CeSHHXEI7/miUnPIMVw==
X-Received: by 2002:a05:6a20:a021:b0:ad:def6:af3 with SMTP id
 p33-20020a056a20a02100b000addef60af3mr8494129pzj.57.1678068796563; 
 Sun, 05 Mar 2023 18:13:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] accel/tcg: Pass last not end to tb_invalidate_phys_range
Date: Sun,  5 Mar 2023 18:13:07 -0800
Message-Id: <20230306021307.1879483-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Pass the address of the last byte to be changed, rather than
the first address past the last byte.  This avoids overflow
when the last page of the address space is involved.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  2 +-
 accel/tcg/tb-maint.c      | 31 ++++++++++++++++---------------
 accel/tcg/translate-all.c |  2 +-
 accel/tcg/user-exec.c     |  2 +-
 softmmu/physmem.c         |  2 +-
 5 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e09254333d..58d37276d9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -679,7 +679,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index a93c4c3ef7..19f88fd048 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -989,11 +989,10 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
  * Called with mmap_lock held for user-mode emulation.
  * NOTE: this function must not be called while a TB is running.
  */
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last)
 {
     TranslationBlock *tb;
     PageForEachNext n;
-    tb_page_addr_t last = end - 1;
 
     assert_memory_lock();
 
@@ -1009,11 +1008,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
  */
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
-    tb_page_addr_t start, end;
+    tb_page_addr_t start, last;
 
     start = addr & TARGET_PAGE_MASK;
-    end = start + TARGET_PAGE_SIZE;
-    tb_invalidate_phys_range(start, end);
+    last = addr | ~TARGET_PAGE_MASK;
+    tb_invalidate_phys_range(start, last);
 }
 
 /*
@@ -1167,28 +1166,30 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
 
 /*
  * Invalidate all TBs which intersect with the target physical address range
- * [start;end[. NOTE: start and end may refer to *different* physical pages.
+ * [start;last]. NOTE: start and end may refer to *different* physical pages.
  * 'is_cpu_write_access' should be true if called from a real cpu write
  * access: the virtual CPU will exit the current TB if code is modified inside
  * this TB.
  */
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last)
 {
     struct page_collection *pages;
-    tb_page_addr_t next;
+    tb_page_addr_t index, index_last;
 
-    pages = page_collection_lock(start, end - 1);
-    for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-         start < end;
-         start = next, next += TARGET_PAGE_SIZE) {
-        PageDesc *pd = page_find(start >> TARGET_PAGE_BITS);
-        tb_page_addr_t bound = MIN(next, end);
+    pages = page_collection_lock(start, last);
+
+    index_last = last >> TARGET_PAGE_BITS;
+    for (index = start >> TARGET_PAGE_BITS; index <= index_last; index++) {
+        PageDesc *pd = page_find(index);
+        tb_page_addr_t bound;
 
         if (pd == NULL) {
             continue;
         }
         assert_page_locked(pd);
-        tb_invalidate_phys_page_range__locked(pages, pd, start, bound - 1, 0);
+        bound = (index << TARGET_PAGE_BITS) | ~TARGET_PAGE_MASK;
+        bound = MIN(bound, last);
+        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
     }
     page_collection_unlock(pages);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4b5abc0f44..4500d78a16 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -570,7 +570,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
         addr = get_page_addr_code(env, pc);
         if (addr != -1) {
-            tb_invalidate_phys_range(addr, addr + 1);
+            tb_invalidate_phys_range(addr, addr);
         }
     }
 }
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 20b6fc2f6e..a7e0c3e2f4 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -516,7 +516,7 @@ void page_set_flags(target_ulong start, target_ulong last, int flags)
                                         ~(reset ? 0 : PAGE_STICKY));
     }
     if (inval_tb) {
-        tb_invalidate_phys_range(start, last + 1);
+        tb_invalidate_phys_range(start, last);
     }
 }
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 47143edb4f..abebf5b963 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2521,7 +2521,7 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
     }
     if (dirty_log_mask & (1 << DIRTY_MEMORY_CODE)) {
         assert(tcg_enabled());
-        tb_invalidate_phys_range(addr, addr + length);
+        tb_invalidate_phys_range(addr, addr + length - 1);
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
     }
     cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
-- 
2.34.1


