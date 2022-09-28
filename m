Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DEB5EE73E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:04:10 +0200 (CEST)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeDx-0005Jl-5k
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf4-0000bS-Nt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddf2-0006Xe-2G
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:28:06 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M7JnA-1oaLL348L6-007oPe; Wed, 28
 Sep 2022 22:28:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 31/37] linux-user: Sink call to do_safe_futex
Date: Wed, 28 Sep 2022 22:27:31 +0200
Message-Id: <20220928202737.793171-32-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3Dsd8htV0Ts3QTvlCwAirljX2/FKlMrweXRllB2x8razXLD97+P
 tKSyEzY6naVsL7/VsZ1ql8zjfm5WtW7TPIlNXAAeyGXSWNu8MQhpbEQnyWNX2sZYDazTjLQ
 WdD/nWrjUC15bn6vhauj3wyVV7z69ZomCf/2VnaLBVegOtpwxZRm7OZXPxL6Uh0e3mrvhZN
 VP1lDkley9Ihi2bUkgRSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FKcYcn75Hsg=:Fo1Oq4HggXlxH7Ip9m7M1R
 lcAooG2HB7jze0gAJLzE3M4yuiCIuPxrC4DA5I51mjmOjak5gFphE/LCzthwwyx81xaJhJJ0n
 iIc+/1RmOSU0f2t2p3M7urp+AByYGJiRD0wE1GCMDQaWrUrkKpHudO2abYlVy+aC2ReT5cRq1
 JqayIhIrDmJsjKKNdkukQHSeLn01jOL8i31EnKFT9rUEQ7eNzAUvRnL3hN4SGrXk46n2z49SP
 hNUSM46WZcMIPKtWuHKhnU6AOlq5n6gNrEhj+3KoK/mGlTUEy0kItYywiCvRa2tTlRdZ0C+DI
 wV68My3hdhZfWYddG6e6O3shOJquCOu7s96hO0bN04HcayPNVp8JNzKZr2bYD0oY4dbbznXMy
 qRTiAg/PBIrB0xlLXGwah6xsdL4g7BJqEu9ce7o/GpF6WtY3Mn+d/7s8b+yxvRANPVdwObH7l
 BocAS1A2Fz6t1ooWAHtKmYu23+cL7O6qnCS5hkKx5tXJSBZ/xizmmpxoHYOvVwN8QWVhisXPW
 4wpFud7BQIX6gBxgXORrAOzeV5sLh7jGeBq1ZzQRCOAvAl7vdrUOjybpdXgjmvDgBgEn9Ap2b
 v/LiDsj+LrFVJE5l9NjybJDrR9InB7rcUrf2fJ0i+k5QzMdxJNK2+jUssmhblO+cWH1zOXtCs
 zFVRNzknyMGmnTU8vahogi3xoajLNGoFAaWmGgB2xrN8Kwb5A2ikhkgxjUdxVrty0fZGhiefE
 Lmx/+OqhcFEmt5C1EzTAREqvX5SKt5TlYXhDCY8fiwEaUJMWoAsl7xQkep3xl6NPoQssKjRau
 lwF9Wxz
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Leave only the argument adjustments within the shift,
and sink the actual syscall to the end.  Sink the
timespec conversion as well, as there will be more users.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 60 +++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index af3a605fc458..17e17f480456 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7773,11 +7773,11 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
                     int op, int val, target_ulong timeout,
                     target_ulong uaddr2, int val3)
 {
-    struct timespec ts, *pts;
+    struct timespec ts, *pts = NULL;
+    void *haddr2 = NULL;
     int base_op;
 
-    /* ??? We assume FUTEX_* constants are the same on both host
-       and target.  */
+    /* We assume FUTEX_* constants are the same on both host and target. */
 #ifdef FUTEX_CMD_MASK
     base_op = op & FUTEX_CMD_MASK;
 #else
@@ -7786,39 +7786,41 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
     switch (base_op) {
     case FUTEX_WAIT:
     case FUTEX_WAIT_BITSET:
-        if (timeout) {
-            pts = &ts;
-            if (time64
-                ? target_to_host_timespec64(pts, timeout)
-                : target_to_host_timespec(pts, timeout)) {
-                return -TARGET_EFAULT;
-            }
-        } else {
-            pts = NULL;
-        }
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, tswap32(val), pts, NULL, val3);
+        val = tswap32(val);
+        break;
     case FUTEX_WAKE:
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, val, NULL, NULL, 0);
+        timeout = 0;
+        break;
     case FUTEX_FD:
-        return do_safe_futex(g2h(cpu, uaddr),
-                             op, val, NULL, NULL, 0);
-    case FUTEX_REQUEUE:
+        timeout = 0;
+        break;
     case FUTEX_CMP_REQUEUE:
+        val3 = tswap32(val3);
+        /* fall through */
+    case FUTEX_REQUEUE:
     case FUTEX_WAKE_OP:
-        /* For FUTEX_REQUEUE, FUTEX_CMP_REQUEUE, and FUTEX_WAKE_OP, the
-           TIMEOUT parameter is interpreted as a uint32_t by the kernel.
-           But the prototype takes a `struct timespec *'; insert casts
-           to satisfy the compiler.  We do not need to tswap TIMEOUT
-           since it's not compared to guest memory.  */
-        pts = (struct timespec *)(uintptr_t) timeout;
-        return do_safe_futex(g2h(cpu, uaddr), op, val, pts, g2h(cpu, uaddr2),
-                             (base_op == FUTEX_CMP_REQUEUE
-                              ? tswap32(val3) : val3));
+        /*
+         * For these, the 4th argument is not TIMEOUT, but VAL2.
+         * But the prototype of do_safe_futex takes a pointer, so
+         * insert casts to satisfy the compiler.  We do not need
+         * to tswap VAL2 since it's not compared to guest memory.
+          */
+        pts = (struct timespec *)(uintptr_t)timeout;
+        timeout = 0;
+        haddr2 = g2h(cpu, uaddr2);
+        break;
     default:
         return -TARGET_ENOSYS;
     }
+    if (timeout) {
+        pts = &ts;
+        if (time64
+            ? target_to_host_timespec64(pts, timeout)
+            : target_to_host_timespec(pts, timeout)) {
+            return -TARGET_EFAULT;
+        }
+    }
+    return do_safe_futex(g2h(cpu, uaddr), op, val, pts, haddr2, val3);
 }
 #endif
 
-- 
2.37.3


