Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E005308146
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:45:09 +0100 (CET)
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G2G-0007jJ-38
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-0005P4-BG
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:58 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz2-00083t-Tz
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:41:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id b17so4175576plz.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqhLaUkTRfcquD/y4HQuI0t3uB4xsGUnAcI/7aPZ9e0=;
 b=ZeQxkLjMjO6WUw8GGKntd95hXAfnoOGDyTZYkpgvzhV5P6yvL97qK8pqJrhsyRM/GC
 HdxSFJ5lttkBVtk1FkFl6TWNBRHlqcu9EXwpTpd0OG5YDBBeHf1V8myu9IPL9rx1IvVZ
 8Q/Y6I+xIn23w3OZgaETVPJ9RxxaaOqVQ9Q3Bk0puabRvESfR4k+dkXCLME118f6uKFU
 PjwPLfqfrWuOtKxptr+pILKWkC5TsrQKcxRsCa6EXQtw3HKDeTQFqa6sGr0hGhOW0Z7Q
 IQaAqD87AigIhw586SViu0RJuWA705gh7VIVLcZAVyg+KE7fMea1vgHRR1cE7k/ScOIT
 j7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqhLaUkTRfcquD/y4HQuI0t3uB4xsGUnAcI/7aPZ9e0=;
 b=pjBDncPKRilpun8CKW9aUBLQE4bYwB9xclZc6GG4epaJ9LEAx4eRPoG5cmZU6moPqI
 q6FnXqsqsoOpdYH6nJg7nd6/KEodFJzTg09L1PJG3qh2poFMfoI6XX7DhZmRQEGD+D5c
 buzwAAAqfNQw27Xaf3rmh4KSw/mYnd6u2Mz/pd3VnTFKy/pd5r2xT0eisLFLM/dEBN6R
 n3+awuHj1kArMAqAb8v9Z/tirBx/Y3YZjmx1/PIXFpujjsMGlrSzcko2hwCfQf8DdyY2
 C3HkijLBNUHZZcdNbuYitNalB+NTsXqWCyZoaehOjvf1wnhGBfO+21MIQSmfELHrvEa0
 17dA==
X-Gm-Message-State: AOAM533gaJOuYqbbAlgM84mrAM3AWwnYf+L+mgX0KBkAliwPRb+yPUzO
 2s80nmr+jFlhZrb/za0w2YM3YNC0ownrKngC
X-Google-Smtp-Source: ABdhPJx7A6VLzuYE4epndpyiGMtnEF287DBHGeOQ844Vdg5cNkmzud4b2WIxUNGIPlMpinN7EiADVw==
X-Received: by 2002:a17:90a:890a:: with SMTP id
 u10mr1563207pjn.215.1611873706758; 
 Thu, 28 Jan 2021 14:41:46 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
Date: Thu, 28 Jan 2021 12:41:19 -1000
Message-Id: <20210128224141.638790-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This data can be allocated by page_alloc_target_data() and
released by page_set_flags(start, end, prot | PAGE_RESET).

This data will be used to hold tag memory for AArch64 MTE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
---
 include/exec/cpu-all.h    | 42 +++++++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++
 linux-user/mmap.c         |  4 +++-
 linux-user/syscall.c      |  4 ++--
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4b5408c341..99a09ee137 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -264,15 +264,21 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_EXEC      0x0004
 #define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)
 #define PAGE_VALID     0x0008
-/* original state of the write flag (used when tracking self-modifying
-   code */
+/*
+ * Original state of the write flag (used when tracking self-modifying code)
+ */
 #define PAGE_WRITE_ORG 0x0010
-/* Invalidate the TLB entry immediately, helpful for s390x
- * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs() */
-#define PAGE_WRITE_INV 0x0040
+/*
+ * Invalidate the TLB entry immediately, helpful for s390x
+ * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs()
+ */
+#define PAGE_WRITE_INV 0x0020
+/* For use with page_set_flags: page is being replaced; target_data cleared. */
+#define PAGE_RESET     0x0040
+
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
-#define PAGE_RESERVED  0x0020
+#define PAGE_RESERVED  0x0100
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
 #define PAGE_TARGET_1  0x0080
@@ -287,6 +293,30 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
 int page_check_range(target_ulong start, target_ulong len, int flags);
+
+/**
+ * page_alloc_target_data(address, size)
+ * @address: guest virtual address
+ * @size: size of data to allocate
+ *
+ * Allocate @size bytes of out-of-band data to associate with the
+ * guest page at @address.  If the page is not mapped, NULL will
+ * be returned.  If there is existing data associated with @address,
+ * no new memory will be allocated.
+ *
+ * The memory will be freed when the guest page is deallocated,
+ * e.g. with the munmap system call.
+ */
+void *page_alloc_target_data(target_ulong address, size_t size);
+
+/**
+ * page_get_target_data(address)
+ * @address: guest virtual address
+ *
+ * Return any out-of-bound memory assocated with the guest page
+ * at @address, as per page_alloc_target_data.
+ */
+void *page_get_target_data(target_ulong address);
 #endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 81d4c83f22..bba9c8e0b3 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -114,6 +114,7 @@ typedef struct PageDesc {
     unsigned int code_write_count;
 #else
     unsigned long flags;
+    void *target_data;
 #endif
 #ifndef CONFIG_USER_ONLY
     QemuSpin lock;
@@ -2740,6 +2741,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
+    bool reset_target_data;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -2754,6 +2756,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
+    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
          len != 0;
@@ -2767,10 +2771,34 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
+        if (reset_target_data && p->target_data) {
+            g_free(p->target_data);
+            p->target_data = NULL;
+        }
         p->flags = flags;
     }
 }
 
+void *page_get_target_data(target_ulong address)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    return p ? p->target_data : NULL;
+}
+
+void *page_alloc_target_data(target_ulong address, size_t size)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    void *ret = NULL;
+
+    if (p->flags & PAGE_VALID) {
+        ret = p->target_data;
+        if (!ret) {
+            p->target_data = ret = g_malloc0(size);
+        }
+    }
+    return ret;
+}
+
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     PageDesc *p;
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 810653c503..c693505b60 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
     trace_target_mmap_complete(start);
@@ -792,7 +793,8 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         new_addr = h2g(host_addr);
         prot = page_get_flags(old_addr);
         page_set_flags(old_addr, old_addr + old_size, 0);
-        page_set_flags(new_addr, new_addr + new_size, prot | PAGE_VALID);
+        page_set_flags(new_addr, new_addr + new_size,
+                       prot | PAGE_VALID | PAGE_RESET);
     }
     tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 34760779c8..6001022e96 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4632,8 +4632,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     raddr=h2g((unsigned long)host_raddr);
 
     page_set_flags(raddr, raddr + shm_info.shm_segsz,
-                   PAGE_VALID | PAGE_READ |
-                   ((shmflg & SHM_RDONLY)? 0 : PAGE_WRITE));
+                   PAGE_VALID | PAGE_RESET | PAGE_READ |
+                   (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
 
     for (i = 0; i < N_SHM_REGIONS; i++) {
         if (!shm_regions[i].in_use) {
-- 
2.25.1


