Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B36C4F14
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:11:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04c-00033e-Hj; Wed, 22 Mar 2023 11:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04B-0002mE-Cr
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf049-0007HX-3a
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:07:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id o2so12144636plg.4
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nl+O5kCXUOJVGVi2vwdOXVZym0o1Puo9UdIbwQgjClA=;
 b=BnK482Fm0ztxv5eg2gONNRDEI/vhCWqQUUZK9M8XdeGlsUrvMPweqCJyUEhZi6wilB
 4xnMGWc6VowiOfJpS11yxogXeBgGnWCVAwhOE43K/skAn9B4jqNNPsRBa2rBNzBHcYzy
 O/kbPQROqVN4/9ZexkenqlQCN/+wEUAbDRSAN5pwn9fX1XIBzF2kCb5cZkFKd5WHFoCQ
 qVccIJYuIY4ijWzMMx4dFSufPuZYsiyhkudGt8iNPFaE8zWhl09T1MSPQnNGabut+Jqt
 FVYzarSrJeWXinfAJBbzReK4RjKW15T3pI+6xMlbmR5Ke1kkiY/LKuI6OBn0+UyB3T+M
 9t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nl+O5kCXUOJVGVi2vwdOXVZym0o1Puo9UdIbwQgjClA=;
 b=OHqdkEcrCOk1Hld1oRxXDL94qYPMdFtk5weiIXvPRmZOycUos0nH18jqYjOVUHpFx7
 GUOUzYeHEjJ5pWdcGe2k2kStxTpmzLuwQ0AXw/mMIBmHgXFkJbbGiyPqnnHAcg7MNDMX
 qLSPhBNcQIqiFjzPKc1Cp8Iv+voSGdLzWExx9WxkndSvlKMhsamCIU+5a5CgDqyDvlFi
 WjfHQdI/v6VXKzjJiyt/42JnUH9hZaA0Mp4W9Ej9x5P5Nh3TObMywo5VArvoNfJRHeKp
 D8mrsGqCpsWmNUrkJvTatFlE8evQPAep9xDM/O1xF82eBemxzPQ3OLbUWVPdK/3Gg07B
 NfBg==
X-Gm-Message-State: AO0yUKW3Vq4mlIc+qJVZ32Jcm1eX2TqWy37W6cq0jOqge8DlvsM8xYLK
 5uCGrL2RlVM9ok61VNTtUrE0YKcYijp91C0apzE=
X-Google-Smtp-Source: AK7set+RYQ8eApXRD9IvokDVJzZda7LkKdVAO/ud2x4sQbwasK8jqq22p0V7ZvnJKEaiL28LX2+uCw==
X-Received: by 2002:a17:902:f211:b0:19f:1c69:54b5 with SMTP id
 m17-20020a170902f21100b0019f1c6954b5mr2627411plc.12.1679497671725; 
 Wed, 22 Mar 2023 08:07:51 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 04/11] include/exec: Change reserved_va semantics to
 last byte
Date: Wed, 22 Mar 2023 08:07:37 -0700
Message-Id: <20230322150744.175010-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Change the semantics to be the last byte of the guest va, rather
than the following byte.  This avoids some overflow conditions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h      | 11 ++++++++++-
 linux-user/arm/target_cpu.h |  2 +-
 bsd-user/main.c             | 10 +++-------
 bsd-user/mmap.c             |  4 ++--
 linux-user/elfload.c        | 21 +++++++++++----------
 linux-user/main.c           | 27 +++++++++++++--------------
 linux-user/mmap.c           |  4 ++--
 7 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 548be9c8ea..456afd0e22 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -152,6 +152,15 @@ static inline void tswap64s(uint64_t *s)
  */
 extern uintptr_t guest_base;
 extern bool have_guest_base;
+
+/*
+ * If non-zero, the guest virtual address space is a contiguous subset
+ * of the host virtual address space, i.e. '-R reserved_va' is in effect
+ * either from the command-line or by default.  The value is the last
+ * byte of the guest address space e.g. UINT32_MAX.
+ *
+ * If zero, the host and guest virtual address spaces are intermingled.
+ */
 extern unsigned long reserved_va;
 
 /*
@@ -171,7 +180,7 @@ extern unsigned long reserved_va;
 #define GUEST_ADDR_MAX_                                                 \
     ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
      UINT32_MAX : ~0ul)
-#define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
+#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
 
 #else
 
diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index 89ba274cfc..f6383a7cd1 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -30,7 +30,7 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
          * the high addresses.  Restrict linux-user to the
          * cached write-back RAM in the system map.
          */
-        return 0x80000000ul;
+        return 0x7ffffffful;
     } else {
         /*
          * We need to be able to map the commpage.
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 89f225dead..babc3b009b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -68,13 +68,9 @@ bool have_guest_base;
 # if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
 #  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
       (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
-/*
- * There are a number of places where we assign reserved_va to a variable
- * of type abi_ulong and expect it to fit.  Avoid the last page.
- */
-#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
+#   define MAX_RESERVED_VA  0xfffffffful
 #  else
-#   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
+#   define MAX_RESERVED_VA  ((1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
 #  endif
 # else
 #  define MAX_RESERVED_VA  0
@@ -466,7 +462,7 @@ int main(int argc, char **argv)
     envlist_free(envlist);
 
     if (reserved_va) {
-            mmap_next_start = reserved_va;
+        mmap_next_start = reserved_va + 1;
     }
 
     {
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index d6c5a344c9..d35650e562 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -234,7 +234,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
     size = HOST_PAGE_ALIGN(size) + alignment;
     end_addr = start + size;
     if (end_addr > reserved_va) {
-        end_addr = reserved_va;
+        end_addr = reserved_va + 1;
     }
     addr = end_addr - qemu_host_page_size;
 
@@ -243,7 +243,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
             if (looped) {
                 return (abi_ulong)-1;
             }
-            end_addr = reserved_va;
+            end_addr = reserved_va + 1;
             addr = end_addr - qemu_host_page_size;
             looped = 1;
             continue;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 150d1d4503..bb2001bf30 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -207,7 +207,7 @@ static bool init_guest_commpage(void)
      * has specified -R reserved_va, which would trigger an assert().
      */
     if (reserved_va != 0 &&
-        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE - 1 > reserved_va) {
         error_report("Cannot allocate vsyscall page");
         exit(EXIT_FAILURE);
     }
@@ -2499,10 +2499,11 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
 
     /* Sanity check the guest binary. */
     if (reserved_va) {
-        if (guest_hiaddr > reserved_va) {
+        if (guest_hiaddr - 1 > reserved_va) {
             error_report("%s: requires more than reserved virtual "
                          "address space (0x%" PRIx64 " > 0x%lx)",
-                         image_name, (uint64_t)guest_hiaddr, reserved_va);
+                         image_name, (uint64_t)guest_hiaddr - 1,
+                         reserved_va);
             exit(EXIT_FAILURE);
         }
     } else {
@@ -2523,7 +2524,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     if (reserved_va) {
         guest_loaddr = (guest_base >= mmap_min_addr ? 0
                         : mmap_min_addr - guest_base);
-        guest_hiaddr = reserved_va;
+        guest_hiaddr = reserved_va + 1;
     }
 
     /* Reserve the address space for the binary, or reserved_va. */
@@ -2750,15 +2751,15 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE;
     void *addr, *test;
 
-    if (guest_hiaddr > reserved_va) {
+    if (guest_hiaddr - 1 > reserved_va) {
         error_report("%s: requires more than reserved virtual "
                      "address space (0x%" PRIx64 " > 0x%lx)",
-                     image_name, (uint64_t)guest_hiaddr, reserved_va);
+                     image_name, (uint64_t)guest_hiaddr - 1, reserved_va);
         exit(EXIT_FAILURE);
     }
 
     /* Widen the "image" to the entire reserved address space. */
-    pgb_static(image_name, 0, reserved_va, align);
+    pgb_static(image_name, 0, reserved_va + 1, align);
 
     /* osdep.h defines this as 0 if it's missing */
     flags |= MAP_FIXED_NOREPLACE;
@@ -2766,17 +2767,17 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     /* Reserve the memory on the host. */
     assert(guest_base != 0);
     test = g2h_untagged(0);
-    addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
+    addr = mmap(test, reserved_va + 1, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "using -R option)", reserved_va + 1, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
 
     qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %lu bytes\n",
-                  __func__, addr, reserved_va);
+                  __func__, addr, reserved_va + 1);
 }
 
 void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
diff --git a/linux-user/main.c b/linux-user/main.c
index 39d9bd4d7a..fe03293516 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -109,11 +109,9 @@ static const char *last_log_filename;
 # if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
 #  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
       (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
-/* There are a number of places where we assign reserved_va to a variable
-   of type abi_ulong and expect it to fit.  Avoid the last page.  */
-#   define MAX_RESERVED_VA(CPU)  (0xfffffffful & TARGET_PAGE_MASK)
+#   define MAX_RESERVED_VA(CPU)  0xfffffffful
 #  else
-#   define MAX_RESERVED_VA(CPU)  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
+#   define MAX_RESERVED_VA(CPU)  ((1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
 #  endif
 # else
 #  define MAX_RESERVED_VA(CPU)  0
@@ -379,7 +377,9 @@ static void handle_arg_reserved_va(const char *arg)
 {
     char *p;
     int shift = 0;
-    reserved_va = strtoul(arg, &p, 0);
+    unsigned long val;
+
+    val = strtoul(arg, &p, 0);
     switch (*p) {
     case 'k':
     case 'K':
@@ -393,10 +393,10 @@ static void handle_arg_reserved_va(const char *arg)
         break;
     }
     if (shift) {
-        unsigned long unshifted = reserved_va;
+        unsigned long unshifted = val;
         p++;
-        reserved_va <<= shift;
-        if (reserved_va >> shift != unshifted) {
+        val <<= shift;
+        if (val >> shift != unshifted) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
@@ -405,6 +405,8 @@ static void handle_arg_reserved_va(const char *arg)
         fprintf(stderr, "Unrecognised -R size suffix '%s'\n", p);
         exit(EXIT_FAILURE);
     }
+    /* The representation is size - 1, with 0 remaining "default". */
+    reserved_va = val ? val - 1 : 0;
 }
 
 static void handle_arg_singlestep(const char *arg)
@@ -793,7 +795,7 @@ int main(int argc, char **argv, char **envp)
      */
     max_reserved_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
-        if (reserved_va % qemu_host_page_size) {
+        if ((reserved_va + 1) % qemu_host_page_size) {
             char *s = size_to_str(qemu_host_page_size);
             fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
             g_free(s);
@@ -804,11 +806,8 @@ int main(int argc, char **argv, char **envp)
             exit(EXIT_FAILURE);
         }
     } else if (HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32) {
-        /*
-         * reserved_va must be aligned with the host page size
-         * as it is used with mmap()
-         */
-        reserved_va = max_reserved_va & qemu_host_page_mask;
+        /* MAX_RESERVED_VA + 1 is a large power of 2, so is aligned. */
+        reserved_va = max_reserved_va;
     }
 
     {
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28135c9e6a..cf14930c30 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -283,7 +283,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
     end_addr = start + size;
     if (start > reserved_va - size) {
         /* Start at the top of the address space.  */
-        end_addr = ((reserved_va - size) & -align) + size;
+        end_addr = ((reserved_va + 1 - size) & -align) + size;
         looped = true;
     }
 
@@ -297,7 +297,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
                 return (abi_ulong)-1;
             }
             /* Re-start at the top of the address space.  */
-            addr = end_addr = ((reserved_va - size) & -align) + size;
+            addr = end_addr = ((reserved_va + 1 - size) & -align) + size;
             looped = true;
         } else {
             prot = page_get_flags(addr);
-- 
2.34.1


