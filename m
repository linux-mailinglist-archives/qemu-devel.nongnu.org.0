Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82945EE6EA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:59:19 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode9G-0007fI-RG
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddev-0008Ux-Gk
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:57 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddet-0006Th-2O
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:57 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MO9vD-1otOIO0ptx-00ObHV; Wed, 28
 Sep 2022 22:27:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 16/37] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
Date: Wed, 28 Sep 2022 22:27:16 +0200
Message-Id: <20220928202737.793171-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9j/9cvNf9CzPK9v5Lw6ejSm3B0TyF0+wOV93MTN+RNM9vXaKI/k
 vhhIsbSDIDtFWqhNr9az7nBbwGRODFwnWxMLf2ksOomnH7hUFCJ1KSUfh/aMH1HsMSpqnJU
 fiBrc1uUL1GzGxW24kkmVpwyRbs0T6PrmCclD1oHxoBbjJDi+SZIgRIu9R3bcQN/QDsuVDH
 WYyHxCaYLJYjfPxlW9lMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vi1r5Wh2IU8=:ugxUKS6qt9EcSyZDl0wAG+
 uGo4EF2pKXGvluL1ULgPhDwGsnK105cFS7e2jtXH4PuCthZy5V6Ff0jU7hTnJBqnL0b/bPFxa
 NDw3jYzR0GX/6F+5AKUOgKCjRgZ2Ppd/T/LkToScb755DkiNUpQfo+BNXN9bPHKzgxzQICUDS
 A2cVAx3h5fs7iTVE3MQtGOMohgIytJp9w27dL6nJwP99WSbsg0EQ/grHT6nCX0znJG80E3s++
 NnmRV12BdREUas4H2wRB4lEDcZnvmqqoSzItqsra2Du3V+6gL76Mn4PA3zbnlTym64iGbfmIa
 XViZmDKURxbfdri6ciu+InGSaTLchC861t2yjF40+Wkiv9+zk2lK7AofZApFceU/LmvupOy9Y
 twvvkp6KqbReQuO0YZR2T/9vOkzHT66c+GTEJio4etIHZWKAXR26YeIH+ZBB7gqg8Y9bTZb6+
 O3uWCJB4SMHpkIxyfVnt6gvVCQ1mKK8dlcxTUzwzBquGDl1cPXQD/S8COy06+QrcV5p6mgsTh
 GrHKgHjwQIqio3LBy1/HZT067dUkoCB3ihPP6Q9EMH4s5WTzZSdIAQGsIBGU5fpzs5YehSXtA
 FdW6UERmrjGQvG44m4WNkhEVFw908c4Af61L9LATH130ZLTUJ5WKX9emRbdy9U04R00/Bc3mr
 En69SxmT2Jae8EBRlF1ETciHt9kvBgHOlrIiGniSHyc+qWT7dSPd+LL4EpQJ1alAs/5O0Oxee
 bWD2Qcu9Mq3gpUUAl7JRuyufE3CslHpReRC2Ihn01iZaqhDS0grdbTF6AAyZD7Jd8zk2rr6y5
 jnkgc1i
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


