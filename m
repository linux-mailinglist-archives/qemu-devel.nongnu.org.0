Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2155EDAFC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:02:28 +0200 (CEST)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUpe-000761-SU
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEC-0008E9-4s
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:36 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:50021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008C1-30
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:35 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7sM0-1oZcT62qQ6-005101; Wed, 28
 Sep 2022 10:15:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 16/38] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
Date: Wed, 28 Sep 2022 10:14:55 +0200
Message-Id: <20220928081517.734954-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LQ82ZVVfgkO4SbaPem9hFKWDkmY+n/GBDvsj7la4Ul6cIMvAF4O
 FK3G82QdkeKYXrffTTYNvGjbAZLO2Yj7FsiSm7flLfnmMzOwLqCgx35sddVLmLdBK+YuvYG
 4u4aFXAMMPMlvzzPw5LOOC+UDaMJUFnQ3gJL2gvcvU6R8L5Y7xWr7wOG6PGU0AspMweb3uR
 FNisTq2e2HPFfRfRtqBFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1z9D+VJIki0=:gIjIhTpY47nKUgYbXFQiCf
 JVZmZZEiJ8wflk9Ki/+HzwIEcYp1EXgE2qCU7FU4sToLAnP/sg4xz29aITiSZHsYPgiUYX1uT
 fp6HP85FUBeg0HIws09XiMCYtg6ipkEHkeI1rvYMbBW65dDjscdR3KmG1JNA6I/SfLzKhhcyP
 jFj4o2TFPFSjI9fvejcEYWzjARrgA2krjx33Ib0eFMTf5V2x41oVJh04u2Yh1g/jmHShURWEJ
 nu1obDYcFDTDdWcoxpo6uGDPrwhRU0pT6HaE+fQpGjgd9oNEDYl9XPnAzlaPVftb8tXxqeqHl
 qzk1EObKsdSfCfKP2j/CNHN/8yHMFplkrI1bgay5Da1fwsTGmFEl49qOQG4PA8nrOMrMzRXcd
 BjGMNIcStJ/ZLP9pYlne2rHnymdbGGbvljtl+HJndmQ2sYe/PTaprLACiOZcDZ5ugYznxdmBE
 SoWg5nOGY3bpUr8HsbD0a+Ci1zTl/pxXdjzkQJElMl032vDeOdVSC0KQGGf+IMrvhHs1UvSBu
 ddYvHaJKb6jQNnoVk7WoVjP1zWokTiVdQ9LzH6z5lhongbfLlKmCWmNNS8y63oZCdjR7Fmos/
 E8331xedHwWEMZ6HywM8b7fotf88Id72VYiXRfQrEkNPMXC+dRRdO7n+YvQboK4gCB/0gc6Es
 EuucaC4uh/HJ93PL6kEfix5Ie76KBaRAZdgPwkQWA+i28pkLZrLEOrhxOCWVsnU7NEBRbhfnf
 8T5ohCy4KHMt96Q/R8KVQYMrJacZuFV28drfsqlJH2ZZlWSh7a4jQjNJz/VGTBVdR7YV43jOH
 KzXGx9o
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
support for MADV_DONTNEED"), which added passthrough for anonymous
mappings. File mappings can be handled in a similar manner.

In order to do that, mark pages, for which mmap() was passed through,
with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
pages. Drop the explicit PAGE_ANON check, since anonymous mappings are
expected to have PAGE_PASSTHROUGH anyway.

Add PAGE_PASSTHROUGH to PAGE_STICKY in order to keep it on mprotect().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220725125043.43048-1-iii@linux.ibm.com>
Message-Id: <20220906000839.1672934-5-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/tcg/translate-all.c |  2 +-
 include/exec/cpu-all.h    |  6 ++++++
 linux-user/mmap.c         | 27 ++++++++++++++++++++++-----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f5e8592d4a47..d71d04d338db 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2258,7 +2258,7 @@ int page_get_flags(target_ulong address)
 #ifndef PAGE_TARGET_STICKY
 #define PAGE_TARGET_STICKY  0
 #endif
-#define PAGE_STICKY  (PAGE_ANON | PAGE_TARGET_STICKY)
+#define PAGE_STICKY  (PAGE_ANON | PAGE_PASSTHROUGH | PAGE_TARGET_STICKY)
 
 /* Modify the flags of a page and invalidate the code if necessary.
    The flag PAGE_WRITE_ORG is positioned automatically depending
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 491629b9ba7a..16b7df41bf5e 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
 #define PAGE_TARGET_1  0x0200
 #define PAGE_TARGET_2  0x0400
 
+/*
+ * For linux-user, indicates that the page is mapped with the same semantics
+ * in both guest and host.
+ */
+#define PAGE_PASSTHROUGH 0x0800
+
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 942bec7e8528..e557f3626e5d 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -431,7 +431,8 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      int flags, int fd, abi_ulong offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len,
+              passthrough_start = -1, passthrough_end = -1;
     int page_flags, host_prot;
 
     mmap_lock();
@@ -544,6 +545,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
             host_start += offset - host_offset;
         }
         start = h2g(host_start);
+        passthrough_start = start;
+        passthrough_end = start + len;
     } else {
         if (start & ~TARGET_PAGE_MASK) {
             errno = EINVAL;
@@ -626,6 +629,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      host_prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
+            passthrough_start = real_start;
+            passthrough_end = real_end;
         }
     }
  the_end1:
@@ -633,7 +638,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         page_flags |= PAGE_ANON;
     }
     page_flags |= PAGE_RESET;
-    page_set_flags(start, start + len, page_flags);
+    if (passthrough_start == passthrough_end) {
+        page_set_flags(start, start + len, page_flags);
+    } else {
+        if (start < passthrough_start) {
+            page_set_flags(start, passthrough_start, page_flags);
+        }
+        page_set_flags(passthrough_start, passthrough_end,
+                       page_flags | PAGE_PASSTHROUGH);
+        if (passthrough_end < start + len) {
+            page_set_flags(passthrough_end, start + len, page_flags);
+        }
+    }
  the_end:
     trace_target_mmap_complete(start);
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
@@ -852,7 +868,7 @@ static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
     }
 
     for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
-        if (!(page_get_flags(addr) & PAGE_ANON)) {
+        if (!(page_get_flags(addr) & PAGE_PASSTHROUGH)) {
             return false;
         }
     }
@@ -894,8 +910,9 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * This is a hint, so ignoring and returning success is ok.
      *
      * This breaks MADV_DONTNEED, completely implementing which is quite
-     * complicated. However, there is one low-hanging fruit: host-page-aligned
-     * anonymous mappings. In this case passthrough is safe, so do it.
+     * complicated. However, there is one low-hanging fruit: mappings that are
+     * known to have the same semantics in the host and the guest. In this case
+     * passthrough is safe, so do it.
      */
     mmap_lock();
     if (advice == TARGET_MADV_DONTNEED &&
-- 
2.37.3


