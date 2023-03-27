Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850156CB085
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEi-00046F-1S; Mon, 27 Mar 2023 17:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEf-00044w-WC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEd-0005xL-QE
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id w4so9715386plg.9
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=l4gyYzpQXh/yW3+KnNKBc5ZP+6aeQbNHwL0z1fkOfjELz7L0eqmOlGLk0t9YkDpZ83
 BcgrN37yfjhLNerPUXOIYpctyjvfkxSw4MIKUHgZMliYuBT1JqEQJvzeYfejtA+6m8/3
 C7M5vj/9tZ8/v6Tq+k+NtSTQWFUHc+JOTP74o3E/+VDvXt9YgdHY2AUpwvaqP2wuyx1i
 Tesw7I4gC+8nVoQ3xaXYgfHEPtYVTCvrvv6zFSUQTAH64v74uGbdJDIR3IV/7qYh9BRJ
 oiDCKMA5rpUx/eyew9mGpYfx1eK7TcqBg0FO9Pg3rf7CX9Y7gW9I7M6VpJvopOs5sijX
 aHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kk3UquZ0rVIuilYEk4nV7wLaq1oBqNaW1wOekl52DrA=;
 b=2xp7y7OuoqFfXMpcoARTm1feb9mq4GhQ4cO/oBREmaj2fRqRlxNokU5I/XmqYl4PS9
 T0Kn34hBZCpE43VJDfUdhrl7KleHzMpBqmq1BNtFVjF+CVle5YPEvygvAxjHJs/NTSZO
 uHQ4C8uafAT80AewsZm8jbQD2j+DEOKRbHUMATOQ4H99fGcOWK9oQSxKtRU79XpLDbN0
 W4IObliyBkknsxV9tfgOFK5kb1AryiF/L2L+dsJVb+RBaK6MxuJHduVKwIIABVACvFT1
 rfeTfRzEtBH1eHl3PZF6z+1ZyZiwrkbez7l/nI//xZhkk1uphDCm2C1Rw+HbW5bADhCw
 w0Hg==
X-Gm-Message-State: AAQBX9d7IqD39Po3JINXZdaKgkutvSJp+0OMlIJ4sgtsjc8F1SQK0FEz
 fE3gjL5ww4JIoralJmcm+UmW8pVLdd7TbUcz8DM=
X-Google-Smtp-Source: AKy350ZqRL/56tSIrKKCbcOZ4KnItUHSByxIjQL1D8M4DiWaCP6ncWI8eeXgFHX2mmdKnfzTQ6XAPQ==
X-Received: by 2002:a17:90b:3148:b0:23b:49ad:a350 with SMTP id
 ip8-20020a17090b314800b0023b49ada350mr14439535pjb.9.1679951914537; 
 Mon, 27 Mar 2023 14:18:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 09/12] accel/tcg: Pass last not end to
 tb_invalidate_phys_range
Date: Mon, 27 Mar 2023 14:18:21 -0700
Message-Id: <20230327211824.1785547-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


