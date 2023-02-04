Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CF468AB0F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL60-0005Qy-5Z; Sat, 04 Feb 2023 11:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5u-0005Fp-6u
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:50 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5s-0006yi-6e
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:49 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiIlc-1oiyT6482Q-00fV8N; Sat, 04
 Feb 2023 17:08:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 18/22] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Date: Sat,  4 Feb 2023 17:08:26 +0100
Message-Id: <20230204160830.193093-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0PJVmYugrpL6sj84cTTodUdppOXI1jCI6CmO1lzfVLHDyU8fytD
 1igHbKQYCus8wPYqnkN44id5mhhjJS7K19YGjy2TNBBu9XxYWvyDbriL+4J2LmKjMTWK/RC
 imi1eBVLnt+FnbsvmU73CmsDbIwuQNNNitX6uOrdGlZwUeTxTo+XVfyhpZ4sZFwpt0aOzBl
 AonGAUIUZHa+708zrPpfA==
UI-OutboundReport: notjunk:1;M01:P0:bFC3L7TPPmM=;DQNkNOZEQMARrO48hcbjWHzv00W
 RRTxPo4YcyByLQ9Yh7ovrf7C4xWq+ygg/XTA7/UoEiLenQjOnDgI0tetVk44HJCAIa9/JG6Zw
 QPnJAOe9JHOK7neC5e1modvjmZI4zpekyQWZkGXGSR7W/qFfCHptJoDO5n5i9fIgVfT2UBHfK
 8GNbVcsv+xRZN3/RGAplPY4xR1zmvW7Z1z7FDJ5khau2R06rKuPI38UdyroXvCIVbNhKm7sq3
 0l53QAkYBujSaZctpxgr0zXwsbto8l8jF0/wHx9YvKpbRqCE9418W2ZsozIxZbSU+I9X6A3qC
 K6Se5BdTYKenenr3YU21A/3/+CvxETyb5OYnKvOGO71WshiaJTeHAxpZgT2TFaE86lERob7yW
 z1f2hAF8f6TSR7wxwhnG8oYXCjTZO1wCGfi+ah5uxH3JTwwukKUV7B+R9FmP6YRZGpPO7PWhf
 SVhYH/V2XccE9sORJy4QtYjqSgKKQzUWtZOyhWettC65I5cGJRP0wbhOYjerFAX9hnxEzEkhG
 qm6HjqCKa87+MThbfS6dMqz7dosflY0JmknjCUapxzBPUS3iu4sguOFkX3ZgjC9/mpJ89EI1F
 en8FWhgidzTmwCIXK9DjYBuyNl+qNUtMRNymqlQg5cBv4tCXg2w24djJ7XmT3P2mulzRM4ycw
 5GSY4NP7IrVpfkPIw7ZIENpIQzji1j9MQMgR06GFAQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

Both parameters have a different value on the parisc platform, so first
translate the target value into a host value for usage in the native
madvise() syscall.

Those parameters are often used by security sensitive applications (e.g.
tor browser, boringssl, ...) which expect the call to return a proper
return code on failure, so return -EINVAL if qemu fails to forward the
syscall to the host OS.

While touching this code, enhance the comments about MADV_DONTNEED.

Tested with testcase of tor browser when running hppa-linux guest on
x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <Y5iwTaydU7i66K/i@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 56 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 10f5079331c3..28135c9e6aa9 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -857,7 +857,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
     return new_addr;
 }
 
-static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
+static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
 {
     ulong addr;
 
@@ -901,23 +901,53 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
         return -TARGET_EINVAL;
     }
 
+    /* Translate for some architectures which have different MADV_xxx values */
+    switch (advice) {
+    case TARGET_MADV_DONTNEED:      /* alpha */
+        advice = MADV_DONTNEED;
+        break;
+    case TARGET_MADV_WIPEONFORK:    /* parisc */
+        advice = MADV_WIPEONFORK;
+        break;
+    case TARGET_MADV_KEEPONFORK:    /* parisc */
+        advice = MADV_KEEPONFORK;
+        break;
+    /* we do not care about the other MADV_xxx values yet */
+    }
+
     /*
-     * A straight passthrough may not be safe because qemu sometimes turns
-     * private file-backed mappings into anonymous mappings.
+     * Most advice values are hints, so ignoring and returning success is ok.
+     *
+     * However, some advice values such as MADV_DONTNEED, MADV_WIPEONFORK and
+     * MADV_KEEPONFORK are not hints and need to be emulated.
      *
-     * This is a hint, so ignoring and returning success is ok.
+     * A straight passthrough for those may not be safe because qemu sometimes
+     * turns private file-backed mappings into anonymous mappings.
+     * can_passthrough_madvise() helps to check if a passthrough is possible by
+     * comparing mappings that are known to have the same semantics in the host
+     * and the guest. In this case passthrough is safe.
      *
-     * This breaks MADV_DONTNEED, completely implementing which is quite
-     * complicated. However, there is one low-hanging fruit: mappings that are
-     * known to have the same semantics in the host and the guest. In this case
-     * passthrough is safe, so do it.
+     * We pass through MADV_WIPEONFORK and MADV_KEEPONFORK if possible and
+     * return failure if not.
+     *
+     * MADV_DONTNEED is passed through as well, if possible.
+     * If passthrough isn't possible, we nevertheless (wrongly!) return
+     * success, which is broken but some userspace programs fail to work
+     * otherwise. Completely implementing such emulation is quite complicated
+     * though.
      */
     mmap_lock();
-    if (advice == TARGET_MADV_DONTNEED &&
-        can_passthrough_madv_dontneed(start, end)) {
-        ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
-        if (ret == 0) {
-            page_reset_target_data(start, start + len);
+    switch (advice) {
+    case MADV_WIPEONFORK:
+    case MADV_KEEPONFORK:
+        ret = -EINVAL;
+        /* fall through */
+    case MADV_DONTNEED:
+        if (can_passthrough_madvise(start, end)) {
+            ret = get_errno(madvise(g2h_untagged(start), len, advice));
+            if ((advice == MADV_DONTNEED) && (ret == 0)) {
+                page_reset_target_data(start, start + len);
+            }
         }
     }
     mmap_unlock();
-- 
2.39.1


