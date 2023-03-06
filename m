Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43636AB491
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lp-0003PH-1l; Sun, 05 Mar 2023 21:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lj-0003Ew-Tn
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lh-00061i-Fi
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:15 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9830030pjn.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d/d0OBIClNgz9uS/ri2TTMH+bBSoAaI+6QK8Ud7Uf5M=;
 b=igcpnZtghlU0m6W6J66lr/2xsUcTj5Mx4VbBdRW5FAL5G+2c24lhFYX3kYyQXEhZy7
 jbWXYY2Qp5U0YLY4ug4RHGs6ZsLq1oDuoUNmlOjE1Ro8llPTlwSlcCKGkQBleYz0oIz4
 Bib+45i3pwFc5hLNa1FLWqrQkHN10p3FQ27nBTCyvw6r5AR1a3wtddxC5QcGz9uGwYhZ
 B9joQaOKUbVfH6cn+LM9nd/xluMv3vQJMQVbwrcwBCzEQ8qphuUyLWyKAIdabpDHvXV8
 ouinMDwKjOCeRHe/N30xfvoiv/7+pTMJlc47NctV6gGQE7A/8BdubspJXRTDhzYfZgQc
 XPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/d0OBIClNgz9uS/ri2TTMH+bBSoAaI+6QK8Ud7Uf5M=;
 b=h8BTCO6jNCahmLEcp0G/YIlbcAk8TvqL73E4B24udFW2k1BUD6ELDDwcaKDi5uetl3
 s6+9PaVUsIBhBjKsI9aGgesEWCnNrMTE2mSL1OXB/qY7OI1dNkueJo2RL7ldXkfj+AIU
 e4zQXOI5Z3tJMP+sJNQtElWrCWNjwVEdXYK0S8IpKe3jm3bOWhhU0f1eIbvyc1MaOa8w
 4qw6leo0g2alkHlV9jw3SSMCGRNQG8x2n7aLS8/D2shIejMw8GBmwE/CcA6Fxd5/hSGR
 HYP9hlQXKTDzgar6GXUKC34Us560PAAfPXS5mlu7m6DpMXn7mbI+RGFqWFMLkajjcOfL
 Hj3Q==
X-Gm-Message-State: AO0yUKUgPvS4lFzdgfBi/652DnwIa4MvpFcoBHIU3KFnRLXjPOn33FhH
 Ei2DELdr7DXpvl6Pe/udqb06C1rFxKiXMfSvjcUFxQtO
X-Google-Smtp-Source: AK7set+wXTnBwF5lfiv969iXGlHJsITGdedtw250NzlBSqSrjprzyuVNC5QvsGKq8hayL0gA1Y3K2w==
X-Received: by 2002:a05:6a20:7349:b0:cc:9b29:f5ff with SMTP id
 v9-20020a056a20734900b000cc9b29f5ffmr9228819pzc.35.1678068792106; 
 Sun, 05 Mar 2023 18:13:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] accel/tcg: Pass last not end to page_set_flags
Date: Sun,  5 Mar 2023 18:13:02 -0800
Message-Id: <20230306021307.1879483-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
index 7ef6b9a94d..748764459c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -285,7 +285,7 @@ typedef int (*walk_memory_regions_fn)(void *, target_ulong,
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
index e9a330d599..301fc63817 100644
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
index 104c13ec77..a3431d8d62 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -212,7 +212,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
     page_set_flags(TARGET_VSYSCALL_PAGE,
-                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   TARGET_VSYSCALL_PAGE | ~TARGET_PAGE_MASK,
                    PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -443,7 +443,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
 
-    page_set_flags(commpage, commpage + qemu_host_page_size,
+    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
                    PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -1315,7 +1315,7 @@ static bool init_guest_commpage(void)
         exit(EXIT_FAILURE);
     }
 
-    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE | ~TARGET_PAGE_MASK,
                    PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -1727,7 +1727,7 @@ static bool init_guest_commpage(void)
      * and implement syscalls.  Here, simply mark the page executable.
      * Special case the entry points during translation (see do_page_zero).
      */
-    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE | ~TARGET_PAGE_MASK,
                    PAGE_EXEC | PAGE_VALID);
     return true;
 }
@@ -2199,7 +2199,8 @@ static void zero_bss(abi_ulong elf_bss, abi_ulong last_bss, int prot)
 
     /* Ensure that the bss page(s) are valid */
     if ((page_get_flags(last_bss-1) & prot) != prot) {
-        page_set_flags(elf_bss & TARGET_PAGE_MASK, last_bss, prot | PAGE_VALID);
+        page_set_flags(elf_bss & TARGET_PAGE_MASK, last_bss - 1,
+                       prot | PAGE_VALID);
     }
 
     if (host_start < host_map_start) {
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 547be8dff6..9cf85f4090 100644
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
index a6c426d73c..78e14ee875 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4583,7 +4583,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     }
     raddr=h2g((unsigned long)host_raddr);
 
-    page_set_flags(raddr, raddr + shm_info.shm_segsz,
+    page_set_flags(raddr, raddr + shm_info.shm_segsz - 1,
                    PAGE_VALID | PAGE_RESET | PAGE_READ |
                    (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
 
@@ -4613,7 +4613,7 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
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


