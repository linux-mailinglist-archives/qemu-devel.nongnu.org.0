Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9A5EDAB9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:58:32 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUlr-0003Ka-Dz
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008F5-Db
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEC-0008FJ-Q7
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:38 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MF418-1oSVzy3Jnc-00FRrG; Wed, 28
 Sep 2022 10:15:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 31/38] linux-user: Sink call to do_safe_futex
Date: Wed, 28 Sep 2022 10:15:10 +0200
Message-Id: <20220928081517.734954-32-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F2vojFSJ83+rfnQq3MwZKPVeQRr+iDu/USOxEHslPkX5PQFRTxP
 Fmj5oKbjRd7TpUvXjxbGGwKr8TBbUei0onF0B7oBoCPMZrRgliI0JQuh8+t/I8zs9LIb7jx
 3VDsfze5KTAPcrxQBnYxVrXrjlWQhsVv+Yz9/xZGJLcaXc0F3HXmL0DlmlT54n8NodiVhG0
 VMkayuYT1bl5OJhPTU8cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GEbEnmnfBrc=:EEquTR23/HKaLJyx9YCf2/
 a4bTXfKB2uIyXCEr7pR4IQEP8Oeewy7w/GSwXDPW+ZHbsHuSBdL8abqv2+C+j+saGCzD3YlIC
 mkSQoP5KUQmUYckhlQcsx3lBZDupACsG2Zypmo9+HcKOyG71apiUI5pxVZm5/khP7bPHBn8Ny
 q4rErxxPRATX3O1X3Wr6itwmG/Ml/qTcEYzm4RMkcQ9FqjZSSdKHXWKeW47BLRyWN50QRBe2r
 lo9Yg6vEbfP2Tna9apCg93Cp3haBgOooSlW7OCsML13oBKgUQJqdsyzDpTJatvVpMq9nW3Fzu
 kBp6HIb/99VNfCsGod3eu52FL93LmrCUEl7E29vMN+BtzYXTw3B2QmDo3ioppCVfHE8xefVQc
 AzP1pmkDHtPR3JIJLCn999da94b1jJLjL1t5+hFCrunRoCMaLo+B4aQ43GFURSn79NWxCaY+A
 Bgn5TOiadGivCqxzjmkuIIua3dfUjWRyZbi8Rl03hdjhOAMntIPCIihlxd5K3OPs7+bqOsdW3
 b/Ge8MSPcqWPmlMNOKZnv0NWaWCZZ7QJb9gWfNKgThNZDdLdNaTdptde6Fi4cm/im40fR3jla
 7CJxBD489ZRXAQ3XcZCFbPdkA4bQx4YRX+e+7VWXIb+rpBTDOOW3BopciZgdwo0XmNolPzZpr
 B3C/mkXwPwmASOTAVbYG3GOI0bf6waaGp5lN0WCrQBrq6fI24i+nI9lQgWZYLgi4xIBfJ428o
 So3PbIK+WZwbHgUBhNy5IuS1bDcps90Obwm0N1vQvE1GKiIYoasWsWvn2zwwuKY0CIkIhjwKh
 m2TLNfT
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


