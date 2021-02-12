Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93D31A4C6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:52:58 +0100 (CET)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdYn-0003Wq-Nk
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV8-0001Ux-3F
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:11 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV4-0007ey-OD
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gx20so158584pjb.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGNWj3WniKXXd4jIRcOYjihD3VZhshb33k4IkX9ycXc=;
 b=W7Q8bOgUVgvmvKEupfuuBtlJYdB+vZJCcDbVspVs0vIehaR4RAs4NcjowOpe1tdJ7Y
 G3HxcQSo+kEzmMdxWl+AT8xej38BdUbRqVFl9FKCEDNUfhcgzcgL1rC6nbgTu3YmBs/u
 nq7lHw2iXqZBe75vxL//Fx+IK6LyAipUxpDkaYvQoAMEda/k71uVqIA27XZomAW1OKg3
 2CExxyBi6gljYE5o39qh4EIPw+rJiNMTl7p+sR0g+wT9kD4mocbsMQcXKIunDVgzww+B
 izopCKuW5o8JrJN1C1mx/ZeI8esgeZKbALdltBIsnn2VGN/Daw8ojO2fXqqTPAeTZhJg
 ANYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGNWj3WniKXXd4jIRcOYjihD3VZhshb33k4IkX9ycXc=;
 b=IUrdWa4Fd0OjKFYSs4E+KjgTA+V2bbnrLGBY1sEtSnT7Sc0mxU9Sk8CDZASk9wIYp1
 c4sbiMl72Qvmc0Cod9uy9vxrVe2TlNxNs4eOwqzI/wa3PZZwiFlqw4ot6dgstIdj0gNe
 Gci8zqFwVovp718KexhPe9nDfpGOCwMLufB6SXEr2CMqFZT78KZKkg/vmBWVAl5IkmQQ
 pi9SPxyrkklVGgZYtvKrK5prhFBNsNKT67qbo3kfy+jA8BqH8WiATqaO1tjWUImdTDeh
 RfGU3bLG35JCgIi1MTu+lcxEp4aaZShQuRLl3hGTKb2+Bw0yyEt6IoF2MdxAReJdyrCC
 eYIA==
X-Gm-Message-State: AOAM531Ran3geihwL2bq1danXaEJ3/0BzU2Sz55UqoYCfl3xBTHQbOm5
 jeNFN8Fk7Vw4VO5zLumUOw6gNmSrx75lbg==
X-Google-Smtp-Source: ABdhPJzAH88SP73REgIIBsH8GZjxBWBmucbZE5nLlJ+V2gJnolC2qJNjJbGPd9eJSp0HJxQ1mrA/Bw==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr3993858pjg.189.1613155745348; 
 Fri, 12 Feb 2021 10:49:05 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/31] tcg: Introduce target-specific page data for
 user-only
Date: Fri, 12 Feb 2021 10:48:32 -0800
Message-Id: <20210212184902.1251044-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This data can be allocated by page_alloc_target_data() and
released by page_set_flags(start, end, prot | PAGE_RESET).

This data will be used to hold tag memory for AArch64 MTE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    | 42 +++++++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++
 linux-user/mmap.c         |  4 +++-
 linux-user/syscall.c      |  4 ++--
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index cfb1d79331..af555f1798 100644
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


