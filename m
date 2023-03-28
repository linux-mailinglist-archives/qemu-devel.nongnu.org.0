Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661116CCDC8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGn-0006vV-CF; Tue, 28 Mar 2023 18:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGh-0006tk-UG
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGg-00074V-0B
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id w4so13148624plg.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=HvSDjnzNOS1ee0cuc0sr8/eD2+lmdHtDZqxUIPPEGaR5szLhae4r85Br0+duySzffF
 /JaabLscxDAYf7PiYFOM0Gv/G2+wtaavYTvzd9OSD+2cqhFAHf1s43DSuGE/bf5N4/iy
 jtI9+enDL0jK9epvPWNBFWduFVbZuHEbb8gFiWGjni7Duxu0aCeVi+EhIxFvYQ+Tbn5K
 cXYDmfb20jKU5tus2/sTTMhXgvbizmug+unvudXf6DVeUIy6YqVXhE6yDu8k9SIAdqfM
 0g0NGyCIyxML6ZEwL5ZNa7D/EnwUfHmAs6t54sjWYTBr64CeGleE2MOXvuMzXM+nIPvs
 ClEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=zyQg2itTv5RKjLgDBsEbdftg8WnsfSAX0Mc3uA1N3EEjQUeAsoFbB5Lqq5QT3rPUdB
 DkhlsT8vkeQv2dqW184te2N0p4zfUBxp3pxoHGz9OCOVvNSa7Tk8MY0fuLgPQ2P5WQ+H
 m+PRKh7JPfAHFhTTiUfi1aSkKlyVWxk+5QZu4Ty3za/PEpkp6K6bvc+35iwJH6DTvCIP
 jG8hhvVTOYHA71xG6xxgvehXm2qng23UthavG2kKObJ9ap1RdtWOGuHBXkDWCu6R54XC
 CAMn4NEAqAKIbHBTdqUC5cntASBSjALItxPcufsIsJnMTPBJd76IPb+QLTkpu813BLCd
 cqGg==
X-Gm-Message-State: AAQBX9dB/jMxI5lSfS9dAtDC/E2+pi7eQhtxwdwpB2kn0btDEcDp8WT3
 cgSW1T12sQPW2GMM9hsffRmvHPENncXmhSIVvWI=
X-Google-Smtp-Source: AKy350ZkD6GehuJ0n066XjGad7n0qnkkxiZB4DntCvCT+dDnsKvtS8J9Wu6RXpr5x+TFTo1T8C/ucw==
X-Received: by 2002:a17:90b:1a81:b0:23f:ec0f:aaae with SMTP id
 ng1-20020a17090b1a8100b0023fec0faaaemr18478074pjb.33.1680044296421; 
 Tue, 28 Mar 2023 15:58:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/15] accel/tcg: Pass last not end to tb_invalidate_phys_range
Date: Tue, 28 Mar 2023 15:58:00 -0700
Message-Id: <20230328225806.2278728-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  2 +-
 accel/tcg/tb-maint.c      | 31 ++++++++++++++++---------------
 accel/tcg/translate-all.c |  2 +-
 accel/tcg/user-exec.c     |  2 +-
 softmmu/physmem.c         |  2 +-
 5 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ad9eb6067b..ecded1f112 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -678,7 +678,7 @@ void tb_invalidate_phys_addr(target_ulong addr);
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
+void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 74823ba464..cb1f806f00 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -991,11 +991,10 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
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
 
@@ -1011,11 +1010,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
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
@@ -1169,28 +1168,30 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
 
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
index 74deb18bd0..5b13281119 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -572,7 +572,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
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
index e35061bba4..0e0182d9f2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2527,7 +2527,7 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
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


