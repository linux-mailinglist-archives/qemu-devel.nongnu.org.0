Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE896B53F2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvi-0008Bc-W7; Fri, 10 Mar 2023 17:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvg-0008AD-LX
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakve-00030H-Od
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:36 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N6LIF-1qcBPx2Ja5-016e5y; Fri, 10
 Mar 2023 23:09:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 07/28] linux-user: Fix brk() to release pages
Date: Fri, 10 Mar 2023 23:09:06 +0100
Message-Id: <20230310220927.326606-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8pGh/K99GwQonSx2gI0q1Eek1Pl7mg0AJB4Tcx/qMdxdB0+1QtI
 CHbpRTZD4zEXClsmErfb1ZoZn+y1cA0Y3n4YOsf8hZMAkHn23Zt7+DTGKVBgUyBFmmeW+rZ
 s8Vrw9wx7DpdHgzGoRpbZEt+z4F/12nywO9gqSfRH2tGBCIbGkx4JPpu6PXbkXCle2qUSnG
 dPdIY79w0zFXovrFtH4Zg==
UI-OutboundReport: notjunk:1;M01:P0:p3CulZuH4CE=;ljofvFwCft21YqJBajlUyQuF8a/
 jG0x1HxAM4a4ehvvad8Tv37qmrWJQSSytfs0fzxt01NB6wd5jTAOFGqUcMWGU2DiF0tMHQEiR
 tqBQOboHegxDTHKpMyKnXBCoXhJqx2M6U8+rBSMNpd3DNLHOQ9LXztRZO6jSP6dblfbuHcHwe
 ghAzQRHe7KmDbGmEHXghDRANqypvlSaDO12Bw8y/m0RtHiMYpk96iXCrRX++wMiK/QP9uHGoe
 coMNRmStqQ1VAA1hdZXFNa8s4joMFWPeGJSpB0pqGClex//5PiCxz68/VETwkEXeMbKwbI0U/
 CuCwCik7SwX++krn/KUnGOmroQaXjtU9Dd7pBGjSF5efeNohugw8Lwf5NtpkhgU43vORQOKJH
 Y5xQgbCZ5gEWuzBqRcuPWHqFnRQa/Hqwobjj7ZFgCl+t5klZ3kLRNMp0GVo3c8V7Y7xL9YKb+
 +zvi7+g1NvJrCjv5YjxoL5Hh950KkeAXjMr8aZDgWQ+b8FFReHmBPcgCqP8jjZ/UP9f5Ybf1r
 J7m+4vUjCg9LH0Pqbii7ll3OT15IElp7E5y2B17c44aWm9jsk/zQJ0Z3Qh9QPbOXjpl853A9Z
 VoqfwCbs56b3n3ZkhoAtJyxAXkVuLxEsS2IwXRhX8BkPasgpQs89sumoq52R0KHC6f1LQTcDn
 8nimnXiz5hXdNiVnq+nuSXiQUY5fLdWjjoijyE9hwQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

The current brk() implementation does not de-allocate pages if a lower
address is given compared to earlier brk() calls.
But according to the manpage, brk() shall deallocate memory in this case
and currently it breaks a real-world application, specifically building
the debian gcl package in qemu-user.

Fix this issue by reworking the qemu brk() implementation.

Tested with the C-code testcase included in qemu commit 4d1de87c750, and
by building debian package of gcl in a hppa-linux guest on a x86-64
host.

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <Y6gId80ek49TK1xB@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 69 ++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 49a4fee89918..931f9db47552 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -795,49 +795,52 @@ static inline int host_to_target_sock_type(int host_type)
 }
 
 static abi_ulong target_brk;
-static abi_ulong target_original_brk;
 static abi_ulong brk_page;
 
 void target_set_brk(abi_ulong new_brk)
 {
-    target_original_brk = target_brk = HOST_PAGE_ALIGN(new_brk);
+    target_brk = new_brk;
     brk_page = HOST_PAGE_ALIGN(target_brk);
 }
 
-//#define DEBUGF_BRK(message, args...) do { fprintf(stderr, (message), ## args); } while (0)
-#define DEBUGF_BRK(message, args...)
-
 /* do_brk() must return target values and target errnos. */
-abi_long do_brk(abi_ulong new_brk)
+abi_long do_brk(abi_ulong brk_val)
 {
     abi_long mapped_addr;
     abi_ulong new_alloc_size;
+    abi_ulong new_brk, new_host_brk_page;
 
     /* brk pointers are always untagged */
 
-    DEBUGF_BRK("do_brk(" TARGET_ABI_FMT_lx ") -> ", new_brk);
-
-    if (!new_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (!new_brk)\n", target_brk);
+    /* return old brk value if brk_val unchanged or zero */
+    if (!brk_val || brk_val == target_brk) {
         return target_brk;
     }
-    if (new_brk < target_original_brk) {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk < target_original_brk)\n",
-                   target_brk);
+
+    new_brk = TARGET_PAGE_ALIGN(brk_val);
+    new_host_brk_page = HOST_PAGE_ALIGN(brk_val);
+
+    /* brk_val and old target_brk might be on the same page */
+    if (new_brk == TARGET_PAGE_ALIGN(target_brk)) {
+        if (brk_val > target_brk) {
+            /* empty remaining bytes in (possibly larger) host page */
+            memset(g2h_untagged(target_brk), 0, new_host_brk_page - target_brk);
+        }
+        target_brk = brk_val;
         return target_brk;
     }
 
-    /* If the new brk is less than the highest page reserved to the
-     * target heap allocation, set it and we're almost done...  */
-    if (new_brk <= brk_page) {
-        /* Heap contents are initialized to zero, as for anonymous
-         * mapped pages.  */
-        if (new_brk > target_brk) {
-            memset(g2h_untagged(target_brk), 0, new_brk - target_brk);
-        }
-	target_brk = new_brk;
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (new_brk <= brk_page)\n", target_brk);
-	return target_brk;
+    /* Release heap if necesary */
+    if (new_brk < target_brk) {
+        /* empty remaining bytes in (possibly larger) host page */
+        memset(g2h_untagged(brk_val), 0, new_host_brk_page - brk_val);
+
+        /* free unused host pages and set new brk_page */
+        target_munmap(new_host_brk_page, brk_page - new_host_brk_page);
+        brk_page = new_host_brk_page;
+
+        target_brk = brk_val;
+        return target_brk;
     }
 
     /* We need to allocate more memory after the brk... Note that
@@ -846,10 +849,14 @@ abi_long do_brk(abi_ulong new_brk)
      * itself); instead we treat "mapped but at wrong address" as
      * a failure and unmap again.
      */
-    new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page);
-    mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
+    new_alloc_size = new_host_brk_page - brk_page;
+    if (new_alloc_size) {
+        mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
                                         PROT_READ|PROT_WRITE,
                                         MAP_ANON|MAP_PRIVATE, 0, 0));
+    } else {
+        mapped_addr = brk_page;
+    }
 
     if (mapped_addr == brk_page) {
         /* Heap contents are initialized to zero, as for anonymous
@@ -861,10 +868,8 @@ abi_long do_brk(abi_ulong new_brk)
          * then shrunken).  */
         memset(g2h_untagged(target_brk), 0, brk_page - target_brk);
 
-        target_brk = new_brk;
-        brk_page = HOST_PAGE_ALIGN(target_brk);
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr == brk_page)\n",
-            target_brk);
+        target_brk = brk_val;
+        brk_page = new_host_brk_page;
         return target_brk;
     } else if (mapped_addr != -1) {
         /* Mapped but at wrong address, meaning there wasn't actually
@@ -872,10 +877,6 @@ abi_long do_brk(abi_ulong new_brk)
          */
         target_munmap(mapped_addr, new_alloc_size);
         mapped_addr = -1;
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (mapped_addr != -1)\n", target_brk);
-    }
-    else {
-        DEBUGF_BRK(TARGET_ABI_FMT_lx " (otherwise)\n", target_brk);
     }
 
 #if defined(TARGET_ALPHA)
-- 
2.39.2


