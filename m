Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922EF6CCDC9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGf-0006s6-Gy; Tue, 28 Mar 2023 18:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGd-0006rH-9i
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGb-00073J-0H
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso16757118pjb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCPczMczM94oK/Alb9CocBQFGZzrUwYTVyWrzUdkU2M=;
 b=Rk3LVpjTR0fu/sDX0uHMh8d/PKRRoHN4ldNrrowcBDnFf6HzAGb3vkujlqNpIudoGQ
 35diYY5pHVlGXfrFq0YehGFxQUu9dgxGqPZ6OD76FriStj0y+/tubg/8YW6rDDW00REn
 H749GlfTXkxs/5WYU2/YUSZzdNpoBIPpPme1f0PnovRKr2+5aLqwHa4uH+WvmDdNcLGx
 4n5Z0T/oXcPtBWhMlNnMk5rbDECxdPh6B0lcd17xMPKyR8F3YyBIqwwIV9Hi6eKRpJ9o
 izmH9ie9EDGHei6fgzD1JUgD1EmD+LNnxnJAs3v8eZcQ/X9gwegCmS3lWuB9R4zlJmxB
 Lfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCPczMczM94oK/Alb9CocBQFGZzrUwYTVyWrzUdkU2M=;
 b=jAIWT8iwZHGlEY5Wc+a2xOsaFDoHBX9C63eg5as8FZgOoA8OGYpTkjNHdN5OH/Bt8D
 eZhzIwRox2lFuvy/edWFqDJF05YiXlFNgfqXEV6Hm1bf5i+nTUEiwS/rhDA5K/oNaVPF
 gL1GGegMKG9jGylkImiWO372u0YNPHqewhhxqwKKf5bBhEoInum1acI7GbfkfhalduCH
 rbLslnwXw/wS4vTKubociuiOVcvZ1NTB6IMBt3XR/DNH39on26L5JJIUe+Af4wRQf58v
 H/5D3/q6pIArmZx2M5a8XkMe8EOT4OlwwtJ+pl9uUwAnANL36fweWrf36hHy//cMTV7Y
 yMgw==
X-Gm-Message-State: AAQBX9dXkL+EOniGiH8EBQGTMxeRS/doBZ/Hv1BFJc2fqRR9Co0nVSfb
 uTygRsFEFdSdBFqE7WW4YqxaIazZjMXx3WxGovo=
X-Google-Smtp-Source: AKy350YsGX+AY7Qzdyb3EX82v80Xu6HVZmuQGaXok5+mwe+bLWXvZ/cm0a0jlT+PugWslUfBM00fAw==
X-Received: by 2002:a17:90b:1d02:b0:23d:133a:62cc with SMTP id
 on2-20020a17090b1d0200b0023d133a62ccmr18603018pjb.17.1680044291591; 
 Tue, 28 Mar 2023 15:58:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/15] accel/tcg: Pass last not end to page_set_flags
Date: Tue, 28 Mar 2023 15:57:55 -0700
Message-Id: <20230328225806.2278728-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1528
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  2 +-
 accel/tcg/user-exec.c  | 16 +++++++---------
 bsd-user/mmap.c        |  6 +++---
 linux-user/elfload.c   | 11 ++++++-----
 linux-user/mmap.c      | 16 ++++++++--------
 linux-user/syscall.c   |  4 ++--
 6 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 548be9c8ea..a2662b1e83 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -276,7 +276,7 @@ typedef int (*walk_memory_regions_fn)(void *, target_ulong,
 int walk_memory_regions(void *, walk_memory_regions_fn);
 
 int page_get_flags(target_ulong address);
-void page_set_flags(target_ulong start, target_ulong end, int flags);
+void page_set_flags(target_ulong start, target_ulong last, int flags);
 void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 7b37fd229e..035f8096b2 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -480,24 +480,22 @@ static bool pageflags_set_clear(target_ulong start, target_ulong last,
  * The flag PAGE_WRITE_ORG is positioned automatically depending
  * on PAGE_WRITE.  The mmap_lock should already be held.
  */
-void page_set_flags(target_ulong start, target_ulong end, int flags)
+void page_set_flags(target_ulong start, target_ulong last, int flags)
 {
-    target_ulong last;
     bool reset = false;
     bool inval_tb = false;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
        a missing call to h2g_valid.  */
-    assert(start < end);
-    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start <= last);
+    assert(last <= GUEST_ADDR_MAX);
     /* Only set PAGE_ANON with new mappings. */
     assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
     assert_memory_lock();
 
-    start = start & TARGET_PAGE_MASK;
-    end = TARGET_PAGE_ALIGN(end);
-    last = end - 1;
+    start &= TARGET_PAGE_MASK;
+    last |= ~TARGET_PAGE_MASK;
 
     if (!(flags & PAGE_VALID)) {
         flags = 0;
@@ -510,7 +508,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     }
 
     if (!flags || reset) {
-        page_reset_target_data(start, end);
+        page_reset_target_data(start, last + 1);
         inval_tb |= pageflags_unset(start, last);
     }
     if (flags) {
@@ -518,7 +516,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
                                         ~(reset ? 0 : PAGE_STICKY));
     }
     if (inval_tb) {
-        tb_invalidate_phys_range(start, end);
+        tb_invalidate_phys_range(start, last + 1);
     }
 }
 
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index d6c5a344c9..696057551a 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -118,7 +118,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         if (ret != 0)
             goto error;
     }
-    page_set_flags(start, start + len, prot | PAGE_VALID);
+    page_set_flags(start, start + len - 1, prot | PAGE_VALID);
     mmap_unlock();
     return 0;
 error:
@@ -656,7 +656,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         }
     }
  the_end1:
-    page_set_flags(start, start + len, prot | PAGE_VALID);
+    page_set_flags(start, start + len - 1, prot | PAGE_VALID);
  the_end:
 #ifdef DEBUG_MMAP
     printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
@@ -767,7 +767,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     }
 
     if (ret == 0) {
-        page_set_flags(start, start + len, 0);
+        page_set_flags(start, start + len - 1, 0);
     }
     mmap_unlock();
     return ret;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1dbc1f0f9b..fa4cc41567 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -213,7 +213,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
     page_set_flags(TARGET_VSYSCALL_PAGE,
-                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   TARGET_VSYSCALL_PAGE | ~TARGET_PAGE_MASK,
                    PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -444,7 +444,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
 
-    page_set_flags(commpage, commpage + qemu_host_page_size,
+    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
                    PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -1316,7 +1316,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
 
-    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE | ~TARGET_PAGE_MASK,
                    PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -1728,7 +1728,7 @@ static bool init_guest_commpage(void)
      * and implement syscalls.  Here, simply mark the page executable.
      * Special case the entry points during translation (see do_page_zero).
      */
-    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE | ~TARGET_PAGE_MASK,
                    PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -2209,7 +2209,8 @@ static void zero_bss(abi_ulong elf_bss, abi_ulong last_bss, int prot)
 
     /* Ensure that the bss page(s) are valid */
     if ((page_get_flags(last_bss-1) & prot) != prot) {
-        page_set_flags(elf_bss & TARGET_PAGE_MASK, last_bss, prot | PAGE_VALID);
+        page_set_flags(elf_bss & TARGET_PAGE_MASK, last_bss - 1,
+                       prot | PAGE_VALID);
     }
 
     if (host_start < host_map_start) {
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28135c9e6a..1d07ff5d2c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -181,7 +181,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
         }
     }
 
-    page_set_flags(start, start + len, page_flags);
+    page_set_flags(start, start + len - 1, page_flags);
     ret = 0;
 
 error:
@@ -640,15 +640,15 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
     }
     page_flags |= PAGE_RESET;
     if (passthrough_start == passthrough_end) {
-        page_set_flags(start, start + len, page_flags);
+        page_set_flags(start, start + len - 1, page_flags);
     } else {
         if (start < passthrough_start) {
-            page_set_flags(start, passthrough_start, page_flags);
+            page_set_flags(start, passthrough_start - 1, page_flags);
         }
-        page_set_flags(passthrough_start, passthrough_end,
+        page_set_flags(passthrough_start, passthrough_end - 1,
                        page_flags | PAGE_PASSTHROUGH);
         if (passthrough_end < start + len) {
-            page_set_flags(passthrough_end, start + len, page_flags);
+            page_set_flags(passthrough_end, start + len - 1, page_flags);
         }
     }
  the_end:
@@ -763,7 +763,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     }
 
     if (ret == 0) {
-        page_set_flags(start, start + len, 0);
+        page_set_flags(start, start + len - 1, 0);
     }
     mmap_unlock();
     return ret;
@@ -849,8 +849,8 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     } else {
         new_addr = h2g(host_addr);
         prot = page_get_flags(old_addr);
-        page_set_flags(old_addr, old_addr + old_size, 0);
-        page_set_flags(new_addr, new_addr + new_size,
+        page_set_flags(old_addr, old_addr + old_size - 1, 0);
+        page_set_flags(new_addr, new_addr + new_size - 1,
                        prot | PAGE_VALID | PAGE_RESET);
     }
     mmap_unlock();
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 27871641f4..69f740ff98 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4595,7 +4595,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     }
     raddr=h2g((unsigned long)host_raddr);
 
-    page_set_flags(raddr, raddr + shm_info.shm_segsz,
+    page_set_flags(raddr, raddr + shm_info.shm_segsz - 1,
                    PAGE_VALID | PAGE_RESET | PAGE_READ |
                    (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
 
@@ -4625,7 +4625,7 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
     for (i = 0; i < N_SHM_REGIONS; ++i) {
         if (shm_regions[i].in_use && shm_regions[i].start == shmaddr) {
             shm_regions[i].in_use = false;
-            page_set_flags(shmaddr, shmaddr + shm_regions[i].size, 0);
+            page_set_flags(shmaddr, shmaddr + shm_regions[i].size - 1, 0);
             break;
         }
     }
-- 
2.34.1


