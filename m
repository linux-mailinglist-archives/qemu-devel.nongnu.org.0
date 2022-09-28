Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B65EE809
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:11:30 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeL3-0006NP-M8
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf3-0000XW-3l
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:05 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf1-0006XU-Bi
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:04 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYvse-1oi5cv1L4i-00Unr0; Wed, 28
 Sep 2022 22:28:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 30/37] linux-user: Combine do_futex and do_futex_time64
Date: Wed, 28 Sep 2022 22:27:30 +0200
Message-Id: <20220928202737.793171-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JzmsyS0Y7f03zx4SXYAFTBAFPn3GbPokU4K6X5Rhijd2sQXthY2
 JPo3VSh+bzfg/QHrtxTJWqNxrvKqR39KRowWuFywsEpVRqR84HI8of2nFnsVuy3I5Zh7RNB
 9pfKOuOTUyvbrmgLT1F2WKC9bIPImxUQuHTLbjeXXSfiHwia93tiseUOZwyNESUOF25gzuz
 n/U4Eid94ZpaREIVy5pVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xAdfGUoZHNQ=:bYPt78or1+RyMfd5MOLPns
 BnWJgZFBHyEoHfbAXAVN0UJ+wBOFbIGya3G/jG45HcKez+UlHkSiEnq07Ed3RmYEP46li/UUy
 woxbUHwfbeROjOBEoNO7pxO34nZmMLaZTRv84AnJqPsuZVsaRJg/EdEfrPj+/mOEKodC76/Al
 2wyLG/mzR2QAW2upnG3AtpWC9KMQ6G0QjBm58SoRz3HSMaNIjqGz9zz/IkRAazZ2NMqeqgFs+
 Jzrh2f5uxHGu8cyeOFGB77yo2yrT0TuPT+cXdxksFLMIZgzS7/BGHM930tol13Skh3y8b0AoG
 DvNwRGoIdOS93uyymNAaWks2nSBqrIYDIeytS0wSO4g+5lNgoHxB7/ZZPj2J3bHWViiWNFrn/
 OUzIyboG+9OH1jVC0+L/R8GHcjMg1O9khAkf0q8jZl1cG4DukvYNwpSlxGtAyM4e38fkrr6QP
 eenDv4pCfL84Wr/C1uVuwCnEABtwp4acJhnrIIBD6sBpKrFYfaRgr8PGE65kBNAFRiD1/a8MZ
 77OqNJ2EyPr7d3ZfQ8uFtWC8YY4iX076KHHXPh+gUsMyRDR80FwytRJXBh43WGAMJrRMbYFTc
 8PB6sUgjDPEECn+w7HwiVE+jXWPY83T7DiQ+1Qv0le/DtrZTwc3snKStneD5bp0yyN0KTPPzn
 W8Bo0Pc7JmB1+Fv4/kPww5cwqWAxPuy3MRcSmDCl0DKnGR9HEsTc9gBS3nVz8z8lrtiuoefHx
 wuO4IMdNUkXv56ycst+3/FcFGe0wXAr2TOD+eGpDqmMFsA+NNCsnTclO6VsXuo5XgMZc2nca1
 t2bYEZW
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

From: Richard Henderson <richard.henderson@linaro.org>

Pass a boolean to select between time32 and time64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 67 ++++++++------------------------------------
 1 file changed, 11 insertions(+), 56 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e0e0f058121f..af3a605fc458 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7768,9 +7768,10 @@ static int do_safe_futex(int *uaddr, int op, int val,
    futexes locally would make futexes shared between multiple processes
    tricky.  However they're probably useless because guest atomic
    operations won't work either.  */
-#if defined(TARGET_NR_futex)
-static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
-                    target_ulong timeout, target_ulong uaddr2, int val3)
+#if defined(TARGET_NR_futex) || defined(TARGET_NR_futex_time64)
+static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
+                    int op, int val, target_ulong timeout,
+                    target_ulong uaddr2, int val3)
 {
     struct timespec ts, *pts;
     int base_op;
@@ -7787,7 +7788,11 @@ static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
     case FUTEX_WAIT_BITSET:
         if (timeout) {
             pts = &ts;
-            target_to_host_timespec(pts, timeout);
+            if (time64
+                ? target_to_host_timespec64(pts, timeout)
+                : target_to_host_timespec(pts, timeout)) {
+                return -TARGET_EFAULT;
+            }
         } else {
             pts = NULL;
         }
@@ -7817,56 +7822,6 @@ static int do_futex(CPUState *cpu, target_ulong uaddr, int op, int val,
 }
 #endif
 
-#if defined(TARGET_NR_futex_time64)
-static int do_futex_time64(CPUState *cpu, target_ulong uaddr, int op,
-                           int val, target_ulong timeout,
-                           target_ulong uaddr2, int val3)
-{
-    struct timespec ts, *pts;
-    int base_op;
-
-    /* ??? We assume FUTEX_* constants are the same on both host
-       and target.  */
-#ifdef FUTEX_CMD_MASK
-    base_op = op & FUTEX_CMD_MASK;
-#else
-    base_op = op;
-#endif
-    switch (base_op) {
-    case FUTEX_WAIT:
-    case FUTEX_WAIT_BITSET:
-        if (timeout) {
-            pts = &ts;
-            if (target_to_host_timespec64(pts, timeout)) {
-                return -TARGET_EFAULT;
-            }
-        } else {
-            pts = NULL;
-        }
-        return do_safe_futex(g2h(cpu, uaddr), op,
-                             tswap32(val), pts, NULL, val3);
-    case FUTEX_WAKE:
-        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
-    case FUTEX_FD:
-        return do_safe_futex(g2h(cpu, uaddr), op, val, NULL, NULL, 0);
-    case FUTEX_REQUEUE:
-    case FUTEX_CMP_REQUEUE:
-    case FUTEX_WAKE_OP:
-        /* For FUTEX_REQUEUE, FUTEX_CMP_REQUEUE, and FUTEX_WAKE_OP, the
-           TIMEOUT parameter is interpreted as a uint32_t by the kernel.
-           But the prototype takes a `struct timespec *'; insert casts
-           to satisfy the compiler.  We do not need to tswap TIMEOUT
-           since it's not compared to guest memory.  */
-        pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
-                             (base_op == FUTEX_CMP_REQUEUE
-                              ? tswap32(val3) : val3));
-    default:
-        return -TARGET_ENOSYS;
-    }
-}
-#endif
-
 #if defined(TARGET_NR_name_to_handle_at) && defined(CONFIG_OPEN_BY_HANDLE)
 static abi_long do_name_to_handle_at(abi_long dirfd, abi_long pathname,
                                      abi_long handle, abi_long mount_id,
@@ -12372,11 +12327,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_futex
     case TARGET_NR_futex:
-        return do_futex(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex(cpu, false, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #ifdef TARGET_NR_futex_time64
     case TARGET_NR_futex_time64:
-        return do_futex_time64(cpu, arg1, arg2, arg3, arg4, arg5, arg6);
+        return do_futex(cpu, true, arg1, arg2, arg3, arg4, arg5, arg6);
 #endif
 #ifdef CONFIG_INOTIFY
 #if defined(TARGET_NR_inotify_init)
-- 
2.37.3


