Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD07DB8A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:32:09 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAFc-0007Vm-Ba
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA8C-00036l-JK
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA8B-0004Q0-LB
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:24:28 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:57751 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA8B-0004Ph-Ci
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:24:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5A5BE1A215B;
 Thu,  1 Aug 2019 14:24:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 377B01A20CF;
 Thu,  1 Aug 2019 14:24:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:16 +0200
Message-Id: <1564662076-17964-16-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 15/15] linux-user: Add support for
 semtimedop() syscall
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, laurent@vivier.eu,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Rikalo <arikalo@wavecomp.com>

Add support for semtimedop() emulation. It is based on invocation
of safe_semtimedop().

Conversion is left out of safe_semtimedop(), since other safe_xxx()
usually don't contain similar conversions.

Signed-off-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ee80175..6825458 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6650,7 +6650,43 @@ static inline abi_long host_to_target_statx(struct target_statx *host_stx,
     return 0;
 }
 #endif
+#ifdef TARGET_NR_semtimedop
+static inline abi_long do_semtimedop(int semid, abi_long ptr, unsigned nsops,
+                                     abi_long timeout)
+{
+    struct sembuf *sops;
+    struct timespec ts, *pts;
+    abi_long ret;
+
+    if (timeout) {
+        pts = &ts;
+        if (target_to_host_timespec(pts, timeout)) {
+            return -TARGET_EFAULT;
+        }
+    } else {
+        pts = NULL;
+    }
 
+    sops = g_malloc(sizeof(struct sembuf) * nsops);
+    if (sops == NULL) {
+        return -TARGET_EFAULT;
+    }
+
+    if (target_to_host_sembuf(sops, ptr, nsops)) {
+        g_free(sops);
+        return -TARGET_EFAULT;
+    }
+
+#ifdef __NR_semtimedop
+    ret = get_errno(safe_semtimedop(semid, sops, nsops, pts));
+#else
+    ret = -TARGET_ENOSYS;
+#endif
+    g_free(sops);
+
+    return ret;
+}
+#endif
 
 /* ??? Using host futex calls even when target atomic operations
    are not really atomic probably breaks things.  However implementing
@@ -9194,6 +9230,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_semop:
         return do_semop(arg1, arg2, arg3);
 #endif
+#ifdef TARGET_NR_semtimedop
+    case TARGET_NR_semtimedop:
+        return do_semtimedop(arg1, arg2, arg3, arg4);
+#endif
 #ifdef TARGET_NR_semctl
     case TARGET_NR_semctl:
         return do_semctl(arg1, arg2, arg3, arg4);
-- 
2.7.4


