Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A686C4F08
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04d-0003AF-9Z; Wed, 22 Mar 2023 11:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04L-00032k-EZ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:10 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04H-0007Lx-Eu
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so8927189pjb.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=WpRuZGnr8cUOVM+SKteXxwAss+Nz+mo8Fcq7LyWDVLJWdQM3lSqiHkd5aVTjKEPtX3
 /VSwq6rASBTozh9/sNWDcj0dhzFiHclk84qqXSx6qKdZd4gl3Xygnk3umpZacsVbMHgx
 8qMtYo5qCukmLB3jmn1QPvnX6yOctAT7eGqq7nQwomgXqOesUTHqV/3QT1no1GfVu6K2
 xoNnK0omoNEUwkxFPn7hpuGC+tGrgVfEtNk2ILZWu++Yc8fT1fdVJXecV5GHJZqKjA7k
 TuvkPmLDbBTshPinRKCaAoBQxSpiU7t9tZPP02Ba1CttiSK3Hxdv/PJuyf6O3DQuQmdl
 Ptkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=FOJBVnSRCZfKggGHQG85bPUTJskex/0A4bAJEMbUmDvi7IeCzonOfGqe+KGoGvIVrA
 iYgzBpmFKqSRIyycbQ9HINDxKInx6fELYcdEjOs6V0P8fM4YKJcQtuJhoFugxXlGSOhm
 6qzQHxAww8qHbpj9mktbKKEhFa2O2UzCOkXjMFYAB/uWNlD2WF2wZS0ajB0qgrn2TXIC
 eodcihvpWtasaqcwzB5tUeQnscVTiuinb3HVNrVymLDoovxcmN7x/SC/lHMmL58c6CZN
 +W5AKeUuhgj/XAm21bzVOodW3AuKLv4tkskcM9n3AoYJ31PQXqjNCo19RDd+A5j6yF17
 si1A==
X-Gm-Message-State: AO0yUKX/0/oFJPjrds1uDDDKaqVG1/JbeI2lxjJQftPz5S1lVLjkjIvf
 uBBJOgAIOkGbYlQRUwGeqpmUoRiEPApBA3llCl8=
X-Google-Smtp-Source: AK7set/2v87b6X23lZTLGShmIjh8VmelloPALZUUS2ZtBRJbyhVVpteefmSAQKdhbd/KXKKQ7kcTdg==
X-Received: by 2002:a17:902:d411:b0:19c:f8c5:d504 with SMTP id
 b17-20020a170902d41100b0019cf8c5d504mr2296628ple.59.1679497678546; 
 Wed, 22 Mar 2023 08:07:58 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 10/11] accel/tcg: Pass last not end to
 tb_invalidate_phys_range
Date: Wed, 22 Mar 2023 08:07:43 -0700
Message-Id: <20230322150744.175010-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


