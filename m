Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C06AB48B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Ll-0003Fc-Sn; Sun, 05 Mar 2023 21:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lj-0003Et-Jc
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lg-00061U-TO
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: by mail-pl1-x635.google.com with SMTP id a9so8649052plh.11
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QlRIa4mqF+/zPLE6gRuo0J3urdHypr+y4L2ws8MEG1I=;
 b=DE+/LtxL0NKgA/930lO6R64pIzUZyw83exoB+6WMuhyEph6kr+fKLqVV8Dmbf6Rpv8
 5hnyTkxX5+Hg+OANZBg6iezo4Ss4/ilqXmw7Ky1BZG8jWBXfXjnXUBaFZb1ydxzq3JMU
 wBAe/y0Z264FR9QoNJSxy83aXv9R7Yyyg4BmQZ7FGYIIR0/hngC/nLrMeRwxz2Cgxlx2
 ZktLbvCpyKZJhLRDxUPfph7nFwODFx7B+W7yHeIKaEcttbWcZgm1oJU43S8zqSyvF5uI
 qpz1AAdgFDQZLtYcWucu3YsGMYZoDjipLa94E8w6RNJ69/sxWAhGLWcaMgixXQ2sN8aa
 U2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlRIa4mqF+/zPLE6gRuo0J3urdHypr+y4L2ws8MEG1I=;
 b=1OQmqxpCuHl37AnFD+OYnmF5Dt5zLU2XV3Tu2zFhM42KqG9RSOJiMDOeE6saG/feM7
 IvSwO+IBdkV3wPNLNANrGZy162v1NcamQ4Uy9U48DXtZL4db/+OwYim+PhhA9csPBKXH
 nQ0oiN16sE6kCb2GfI+NZEMoBcmvFTmK4RCT5yJ2qm9Sts8w6/exSEmVMkzihOSmA0kz
 EwS8zxjMCA/W3nYwqompBePeoPeRhjdDG9JDRTTwx5EqUbPkDbsjTnm9kBng8FST4jpR
 o4DLK0D6RvnjDk4CCGysHO8EXpv4tMFJOS0f9++U2gDOlBBb2zMM6xXS8hgl9VJBHyF2
 j+LA==
X-Gm-Message-State: AO0yUKVZmYvdb5GjqJtnZfRRaf2cerenqCrGfH3nyGTXZqnGjRWy/Aq8
 fkxpCic1cOw50x41vs4ZoYW5T5sVjGGNJgzToumdtw==
X-Google-Smtp-Source: AK7set/zUd19oKURtk/T010xtKdSBtTsEDEXDaiV8k2Zrv762Hy2+9dlGA0RzfQrXuS4FleA7kBi+w==
X-Received: by 2002:a17:902:cec1:b0:19e:ab29:1ec2 with SMTP id
 d1-20020a170902cec100b0019eab291ec2mr6640894plg.65.1678068791255; 
 Sun, 05 Mar 2023 18:13:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] include/exec: Replace reserved_va with max_reserved_va
Date: Sun,  5 Mar 2023 18:13:01 -0800
Message-Id: <20230306021307.1879483-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

In addition to the rename, change the semantics to be the
last byte of the guest va, rather than the following byte.
This avoids some overflow conditions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h      | 15 ++++++++++++---
 linux-user/arm/target_cpu.h |  2 +-
 bsd-user/main.c             | 18 +++++++-----------
 bsd-user/mmap.c             | 12 ++++++------
 bsd-user/signal.c           |  4 ++--
 linux-user/elfload.c        | 36 ++++++++++++++++++------------------
 linux-user/main.c           | 36 ++++++++++++++++--------------------
 linux-user/mmap.c           | 20 ++++++++++----------
 linux-user/signal.c         |  4 ++--
 target/arm/cpu.c            |  2 +-
 10 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2eb1176538..7ef6b9a94d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -152,12 +152,21 @@ static inline void tswap64s(uint64_t *s)
  */
 extern uintptr_t guest_base;
 extern bool have_guest_base;
-extern unsigned long reserved_va;
+
+/*
+ * If non-zero, the guest virtual address space is a contiguous subset
+ * of the host virtual address space, i.e. '-R reserved-va' is in effect
+ * either from the command-line or by default.  The value is the last
+ * byte of the guest address space e.g. UINT32_MAX.
+ *
+ * If zero, the host and guest virtual address spaces are intermingled.
+ */
+extern unsigned long max_reserved_va;
 
 /*
  * Limit the guest addresses as best we can.
  *
- * When not using -R reserved_va, we cannot really limit the guest
+ * When not using -R <reserved-va>, we cannot really limit the guest
  * to less address space than the host.  For 32-bit guests, this
  * acts as a sanity check that we're not giving the guest an address
  * that it cannot even represent.  For 64-bit guests... the address
@@ -171,7 +180,7 @@ extern unsigned long reserved_va;
 #define GUEST_ADDR_MAX_                                                 \
     ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
      UINT32_MAX : ~0ul)
-#define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
+#define GUEST_ADDR_MAX    (max_reserved_va ? : GUEST_ADDR_MAX_)
 
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
index 41290e16f9..de413bd1d2 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -67,16 +67,12 @@ bool have_guest_base;
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
-#  define MAX_RESERVED_VA  0
+#  define MAX_RESERVED_VA   (-1ul)
 # endif
 #endif
 
@@ -86,9 +82,9 @@ bool have_guest_base;
  * if directed by the command-line option, but not by default.
  */
 #if HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32
-unsigned long reserved_va = MAX_RESERVED_VA;
+unsigned long max_reserved_va = MAX_RESERVED_VA;
 #else
-unsigned long reserved_va;
+unsigned long max_reserved_va;
 #endif
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
@@ -464,8 +460,8 @@ int main(int argc, char **argv)
     target_environ = envlist_to_environ(envlist, NULL);
     envlist_free(envlist);
 
-    if (reserved_va) {
-            mmap_next_start = reserved_va;
+    if (max_reserved_va) {
+        mmap_next_start = max_reserved_va;
     }
 
     {
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index d6c5a344c9..e9a330d599 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -227,14 +227,14 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
     int prot;
     int looped = 0;
 
-    if (size > reserved_va) {
+    if (size > max_reserved_va) {
         return (abi_ulong)-1;
     }
 
     size = HOST_PAGE_ALIGN(size) + alignment;
     end_addr = start + size;
-    if (end_addr > reserved_va) {
-        end_addr = reserved_va;
+    if (end_addr > max_reserved_va) {
+        end_addr = max_reserved_va + 1;
     }
     addr = end_addr - qemu_host_page_size;
 
@@ -243,7 +243,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
             if (looped) {
                 return (abi_ulong)-1;
             }
-            end_addr = reserved_va;
+            end_addr = max_reserved_va + 1;
             addr = end_addr - qemu_host_page_size;
             looped = 1;
             continue;
@@ -291,7 +291,7 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong start, abi_ulong size,
 
     size = HOST_PAGE_ALIGN(size);
 
-    if (reserved_va) {
+    if (max_reserved_va) {
         return mmap_find_vma_reserved(start, size,
             (alignment != 0 ? 1 << alignment : 0));
     }
@@ -759,7 +759,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     ret = 0;
     /* unmap what we can */
     if (real_start < real_end) {
-        if (reserved_va) {
+        if (max_reserved_va) {
             mmap_reserve(real_start, real_end - real_start);
         } else {
             ret = munmap(g2h_untagged(real_start), real_end - real_start);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 58a5386395..be12568f6c 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -492,7 +492,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 
         /*
          * Convert forcefully to guest address space: addresses outside
-         * reserved_va are still valid to report via SEGV_MAPERR.
+         * max_reserved_va are still valid to report via SEGV_MAPERR.
          */
         guest_addr = h2g_nocheck(host_addr);
 
@@ -512,7 +512,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
                 }
 
                 /*
-                 * With reserved_va, the whole address space is PROT_NONE,
+                 * With max_reserved_va, the whole address space is PROT_NONE,
                  * which means that we may get ACCERR when we want MAPERR.
                  */
                 if (page_get_flags(guest_addr) & PAGE_VALID) {
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5928c14dfc..104c13ec77 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -204,10 +204,10 @@ static bool init_guest_commpage(void)
      * The vsyscall page is at a high negative address aka kernel space,
      * which means that we cannot actually allocate it with target_mmap.
      * We still should be able to use page_set_flags, unless the user
-     * has specified -R reserved_va, which would trigger an assert().
+     * has specified -R <reserved-va>, which would trigger an assert().
      */
-    if (reserved_va != 0 &&
-        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+    if (max_reserved_va != 0 &&
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE - 1 >= max_reserved_va) {
         error_report("Cannot allocate vsyscall page");
         exit(EXIT_FAILURE);
     }
@@ -2484,11 +2484,11 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     }
 
     /* Sanity check the guest binary. */
-    if (reserved_va) {
-        if (guest_hiaddr > reserved_va) {
+    if (max_reserved_va) {
+        if (guest_hiaddr - 1 > max_reserved_va) {
             error_report("%s: requires more than reserved virtual "
                          "address space (0x%" PRIx64 " > 0x%lx)",
-                         image_name, (uint64_t)guest_hiaddr, reserved_va);
+                         image_name, (uint64_t)guest_hiaddr - 1, max_reserved_va);
             exit(EXIT_FAILURE);
         }
     } else {
@@ -2503,16 +2503,16 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     }
 
     /*
-     * Expand the allocation to the entire reserved_va.
+     * Expand the allocation to the entire max_reserved_va.
      * Exclude the mmap_min_addr hole.
      */
-    if (reserved_va) {
+    if (max_reserved_va) {
         guest_loaddr = (guest_base >= mmap_min_addr ? 0
                         : mmap_min_addr - guest_base);
-        guest_hiaddr = reserved_va;
+        guest_hiaddr = max_reserved_va + 1;
     }
 
-    /* Reserve the address space for the binary, or reserved_va. */
+    /* Reserve the address space for the binary, or max_reserved_va. */
     test = g2h_untagged(guest_loaddr);
     addr = mmap(test, guest_hiaddr - guest_loaddr, PROT_NONE, flags, -1, 0);
     if (test != addr) {
@@ -2716,7 +2716,7 @@ static void pgb_dynamic(const char *image_name, long align)
     if (HI_COMMPAGE) {
         uintptr_t addr, commpage;
 
-        /* 64-bit hosts should have used reserved_va. */
+        /* 64-bit hosts should have used max_reserved_va. */
         assert(sizeof(uintptr_t) == 4);
 
         /*
@@ -2736,15 +2736,15 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE;
     void *addr, *test;
 
-    if (guest_hiaddr > reserved_va) {
+    if (guest_hiaddr - 1 > max_reserved_va) {
         error_report("%s: requires more than reserved virtual "
                      "address space (0x%" PRIx64 " > 0x%lx)",
-                     image_name, (uint64_t)guest_hiaddr, reserved_va);
+                     image_name, (uint64_t)guest_hiaddr - 1, max_reserved_va);
         exit(EXIT_FAILURE);
     }
 
     /* Widen the "image" to the entire reserved address space. */
-    pgb_static(image_name, 0, reserved_va, align);
+    pgb_static(image_name, 0, max_reserved_va + 1, align);
 
     /* osdep.h defines this as 0 if it's missing */
     flags |= MAP_FIXED_NOREPLACE;
@@ -2752,17 +2752,17 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     /* Reserve the memory on the host. */
     assert(guest_base != 0);
     test = g2h_untagged(0);
-    addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
+    addr = mmap(test, max_reserved_va + 1, PROT_NONE, flags, -1, 0);
     if (addr == MAP_FAILED || addr != test) {
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "using -R option)", max_reserved_va + 1, test, strerror(errno));
         exit(EXIT_FAILURE);
     }
 
     qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %lu bytes\n",
-                  __func__, addr, reserved_va);
+                  __func__, addr, max_reserved_va + 1);
 }
 
 void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
@@ -2773,7 +2773,7 @@ void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
 
     if (have_guest_base) {
         pgb_have_guest_base(image_name, guest_loaddr, guest_hiaddr, align);
-    } else if (reserved_va) {
+    } else if (max_reserved_va) {
         pgb_reserved_va(image_name, guest_loaddr, guest_hiaddr, align);
     } else if (guest_loaddr) {
         pgb_static(image_name, guest_loaddr, guest_hiaddr, align);
diff --git a/linux-user/main.c b/linux-user/main.c
index 5fcaddffc2..f5731a1157 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -107,18 +107,16 @@ static const char *last_log_filename;
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
-#  define MAX_RESERVED_VA(CPU)  0
+#  define MAX_RESERVED_VA(CPU)   (-1ul)
 # endif
 #endif
 
-unsigned long reserved_va;
+unsigned long max_reserved_va;
 
 static void usage(int exitcode);
 
@@ -369,7 +367,8 @@ static void handle_arg_reserved_va(const char *arg)
 {
     char *p;
     int shift = 0;
-    reserved_va = strtoul(arg, &p, 0);
+
+    max_reserved_va = strtoul(arg, &p, 0);
     switch (*p) {
     case 'k':
     case 'K':
@@ -383,10 +382,10 @@ static void handle_arg_reserved_va(const char *arg)
         break;
     }
     if (shift) {
-        unsigned long unshifted = reserved_va;
+        unsigned long unshifted = max_reserved_va;
         p++;
-        reserved_va <<= shift;
-        if (reserved_va >> shift != unshifted) {
+        max_reserved_va <<= shift;
+        if (max_reserved_va >> shift != unshifted) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
@@ -395,16 +394,17 @@ static void handle_arg_reserved_va(const char *arg)
         fprintf(stderr, "Unrecognised -R size suffix '%s'\n", p);
         exit(EXIT_FAILURE);
     }
-    if (reserved_va == 0) {
+    if (max_reserved_va == 0) {
         fprintf(stderr, "Invalid -R size value 0\n");
         exit(EXIT_FAILURE);
     }
     /* Must be aligned with the host page size as it is used with mmap. */
-    if (reserved_va & qemu_host_page_mask) {
+    if (max_reserved_va & qemu_host_page_mask) {
         fprintf(stderr, "Invalid -R size value %lu: must be aligned mod %lu\n",
-		reserved_va, qemu_host_page_size);
+                max_reserved_va, qemu_host_page_size);
         exit(EXIT_FAILURE);
     }
+    max_reserved_va--;
 }
 
 static void handle_arg_singlestep(const char *arg)
@@ -787,17 +787,13 @@ int main(int argc, char **argv, char **envp)
      * not by default.
      */
     local_max_va = MAX_RESERVED_VA(cpu);
-    if (reserved_va != 0) {
-        if (local_max_va && reserved_va > local_max_va) {
+    if (max_reserved_va != 0) {
+        if (max_reserved_va > local_max_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
     } else if (HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32) {
-        /*
-         * reserved_va must be aligned with the host page size
-         * as it is used with mmap()
-         */
-        reserved_va = local_max_va & qemu_host_page_mask;
+        max_reserved_va = local_max_va;
     }
 
     {
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28135c9e6a..547be8dff6 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -274,16 +274,16 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
     int prot;
     bool looped = false;
 
-    if (size > reserved_va) {
+    if (size > max_reserved_va) {
         return (abi_ulong)-1;
     }
 
     /* Note that start and size have already been aligned by mmap_find_vma. */
 
     end_addr = start + size;
-    if (start > reserved_va - size) {
+    if (start > max_reserved_va + 1 - size) {
         /* Start at the top of the address space.  */
-        end_addr = ((reserved_va - size) & -align) + size;
+        end_addr = ((max_reserved_va + 1 - size) & -align) + size;
         looped = true;
     }
 
@@ -297,7 +297,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
                 return (abi_ulong)-1;
             }
             /* Re-start at the top of the address space.  */
-            addr = end_addr = ((reserved_va - size) & -align) + size;
+            addr = end_addr = ((max_reserved_va + 1 - size) & -align) + size;
             looped = true;
         } else {
             prot = page_get_flags(addr);
@@ -339,7 +339,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 
     size = HOST_PAGE_ALIGN(size);
 
-    if (reserved_va) {
+    if (max_reserved_va) {
         return mmap_find_vma_reserved(start, size, align);
     }
 
@@ -755,7 +755,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     ret = 0;
     /* unmap what we can */
     if (real_start < real_end) {
-        if (reserved_va) {
+        if (max_reserved_va) {
             mmap_reserve(real_start, real_end - real_start);
         } else {
             ret = munmap(g2h_untagged(real_start), real_end - real_start);
@@ -791,7 +791,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         host_addr = mremap(g2h_untagged(old_addr), old_size, new_size,
                            flags, g2h_untagged(new_addr));
 
-        if (reserved_va && host_addr != MAP_FAILED) {
+        if (max_reserved_va && host_addr != MAP_FAILED) {
             /* If new and old addresses overlap then the above mremap will
                already have failed with EINVAL.  */
             mmap_reserve(old_addr, old_size);
@@ -808,13 +808,13 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
             host_addr = mremap(g2h_untagged(old_addr), old_size, new_size,
                                flags | MREMAP_FIXED,
                                g2h_untagged(mmap_start));
-            if (reserved_va) {
+            if (max_reserved_va) {
                 mmap_reserve(old_addr, old_size);
             }
         }
     } else {
         int prot = 0;
-        if (reserved_va && old_size < new_size) {
+        if (max_reserved_va && old_size < new_size) {
             abi_ulong addr;
             for (addr = old_addr + old_size;
                  addr < old_addr + new_size;
@@ -834,7 +834,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
                                        new_size, old_size, flags);
                     errno = ENOMEM;
                     host_addr = MAP_FAILED;
-                } else if (reserved_va && old_size > new_size) {
+                } else if (max_reserved_va && old_size > new_size) {
                     mmap_reserve(old_addr + old_size, old_size - new_size);
                 }
             }
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 098f3a787d..f40b0a616a 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -808,7 +808,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 
         /*
          * Convert forcefully to guest address space: addresses outside
-         * reserved_va are still valid to report via SEGV_MAPERR.
+         * max_reserved_va are still valid to report via SEGV_MAPERR.
          */
         guest_addr = h2g_nocheck(host_addr);
 
@@ -827,7 +827,7 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
                 }
 
                 /*
-                 * With reserved_va, the whole address space is PROT_NONE,
+                 * With max_reserved_va, the whole address space is PROT_NONE,
                  * which means that we may get ACCERR when we want MAPERR.
                  */
                 if (page_get_flags(guest_addr) & PAGE_VALID) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5182ed0c91..b9cd0d3e33 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -264,7 +264,7 @@ static void arm_cpu_reset_hold(Object *obj)
             }
         }
         /*
-         * Enable 48-bit address space (TODO: take reserved_va into account).
+         * Enable 48-bit address space (TODO: take max_reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-- 
2.34.1


