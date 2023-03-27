Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B066CB08F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEn-00047g-Nh; Mon, 27 Mar 2023 17:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEh-00046H-TN
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEf-0005xz-Jk
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so10393295pjl.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGR1FH4Yfs2yWXOpijdZet2xfEmVpJkhB4HWyQD2rq4=;
 b=jJqY8c6BSqr4dvzHSiGoe7S5wYl5sNbPS8WCKH6VYtpbzL3FTsyl2NplrahcQZGQhX
 B2EQmvQe84+teTYgjKW1hhiWbmlOlbVnMiyxwCiu2kN/e/mlhZvXdUpTDdmM/OuoqNYy
 tMYSpbkISnXglNoL/IOF9E7cGGqxYBPAkv6TZzUmEJuTZdafX+3FfyGf0+WJBVHCz6cE
 Nzvu1/NxeKqVb7V6gePUPbNEesDZc0JdSoyz4cTrooYjalv1w9VbtohSyCQl3c2IGUf5
 X0XJOHSuaw6pkR+qCHMj21+2kcNaKEaK6+lJ6LFpo/HxiFYfeObKvUoNUZtTCAz2IzRG
 sZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGR1FH4Yfs2yWXOpijdZet2xfEmVpJkhB4HWyQD2rq4=;
 b=swJ2Ir+YWR35I67SyX2DaRsGlH6E4jIbRojd4mzGoLWoFeA0vCy4Mqllb0aYB+lx8N
 eWAJ3h9axwkOR96Wlqc6khJEHST4WgRkQ9k9cyF3p3Ek5UanEUpEkMI8ItgaVdfYfBHT
 AXElbQeR7OnPx7n7KGT3zz6qvLo28ioXbBVAlVHrFavIHxJ/2+lsaGHoJXbo8JySrIRH
 RqzYN/8dqte3hUn3Xck1ehmdEwQQYX1EGlPfQACDptl2tW5L7urppPP6701+dhzaTl3N
 zgu5nrmmBUXgWgfZcijZA9JYu1EGSTlVV8CbHf2Z2AL97j0vuXru/IDQR0OHo+JKYN38
 +Zqw==
X-Gm-Message-State: AAQBX9eP16gknmUclDyJBVNQWePkCIjABKFZV4cs02WUQh2FFCIur0Pl
 HzClCCfFU/2R+qRKd1vkELJf6GZhx5hdL3+a0EM=
X-Google-Smtp-Source: AK7set8J0LuaUmPvYDrhqsuwE2M6UfzfBNtYSXRqwlAQB0ebmSa2E5PDt3dwsHLzEcYdPRgy2b+uWQ==
X-Received: by 2002:a17:90a:17a9:b0:23f:452c:7a4f with SMTP id
 q38-20020a17090a17a900b0023f452c7a4fmr13524212pja.46.1679951916097; 
 Mon, 27 Mar 2023 14:18:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 11/12] include/exec: Change reserved_va semantics
 to last byte
Date: Mon, 27 Mar 2023 14:18:23 -0700
Message-Id: <20230327211824.1785547-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 linux-user/elfload.c        | 14 +++++++-------
 linux-user/main.c           | 27 +++++++++++++--------------
 linux-user/mmap.c           |  4 ++--
 7 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 64cb62dc54..090922e4a8 100644
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
index 696057551a..565b9f97ed 100644
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
index dfae967908..f1370a7a8b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -208,7 +208,7 @@ static bool init_guest_commpage(void)
      * has specified -R reserved_va, which would trigger an assert().
      */
     if (reserved_va != 0 &&
-        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE - 1 > reserved_va) {
         error_report("Cannot allocate vsyscall page");
         exit(EXIT_FAILURE);
     }
@@ -2504,7 +2504,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
         if (guest_hiaddr > reserved_va) {
             error_report("%s: requires more than reserved virtual "
                          "address space (0x%" PRIx64 " > 0x%lx)",
-                         image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
+                         image_name, (uint64_t)guest_hiaddr, reserved_va);
             exit(EXIT_FAILURE);
         }
     } else {
@@ -2525,7 +2525,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     if (reserved_va) {
         guest_loaddr = (guest_base >= mmap_min_addr ? 0
                         : mmap_min_addr - guest_base);
-        guest_hiaddr = reserved_va - 1;
+        guest_hiaddr = reserved_va;
     }
 
     /* Reserve the address space for the binary, or reserved_va. */
@@ -2755,7 +2755,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     if (guest_hiaddr > reserved_va) {
         error_report("%s: requires more than reserved virtual "
                      "address space (0x%" PRIx64 " > 0x%lx)",
-                     image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
+                     image_name, (uint64_t)guest_hiaddr, reserved_va);
         exit(EXIT_FAILURE);
     }
 
@@ -2768,17 +2768,17 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
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
index 995146f60d..0aa8ae7356 100644
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


