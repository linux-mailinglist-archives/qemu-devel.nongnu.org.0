Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0E6B0946
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtu2-0004Wt-Tn; Wed, 08 Mar 2023 08:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqw-0001gv-RT
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-00065L-0w
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:10 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXH7g-1q4G2X1I9G-00Yil8; Wed, 08
 Mar 2023 14:29:07 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/28] linux-user: Add translation for argument of msync()
Date: Wed,  8 Mar 2023 14:28:41 +0100
Message-Id: <20230308132857.161793-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q20SVmdaVHOUR7GXeDl9sTUNf31LYkjg0VSPqOvcEl8wx19L2kD
 tRia6aq7lntHe2TY5K+4DoDjuX/ljermER/Hpq/EDgZOR4cgZuqy9OX4RIlsntV/zUuZlaQ
 SewEpDtm7Hqt1BHyRNmcfcYsG+FbeELuJ/V+hTzhsK22FiDo9tjueH3CixUtV7QYt8nbJcM
 y/Tcg/XWhrAgb6d3x0P7Q==
UI-OutboundReport: notjunk:1;M01:P0:BRI9fYN4/tc=;ReggTbUj3kmSk4QbcWaLO7tMiBu
 OIpEL26JuNfqTD+0BkCpv6vjXHJf0T91Wh/2kOmqQlmGKjAppy4/ja7XxxKh3unNZgDJIsDok
 sitrDIA26UmRAekrnDiWuXaB4nfNubFuJZYny9qcrFqJyJpwdLEUvrrpc731zT87m5FcTgzXk
 mA19GHKcXduVpuhCfGG4OoCD5T+8GjcwBQkpLzxhqsdj8s6kxTH4yHXac1TomB9H0qSAg3Cem
 poTBBfOuaktr8WAEDx4hQbHAq7s9hnrn7VbxQjqZdwAIJfqGn9bJnU5zWVPWt0XEdmx4MDGzo
 6nRxeKUUhIimZL9f7Nt5E0hjZPxIXW/sZ/DAcks62hNMtegFo9KKz00YWfgHj4vUlEmensaVT
 VO+AfRV9fXQ8jz3Ju+jhYjzie+DboFTWLylQ7u7rDl5w65pzimdjJjW+Bb66odmx05qHDOzIU
 phFAkUhqYOCMCy3Xfjz3pvO938UAOb1V2Rj62zZQss+hVqotNshp9CU4Urb5bSSnEI3+fj+Q9
 l80IqcDuiWJrH7BfNc9LMotodeeD73vILpIbQDHe+/0xy3v7btTNET1Z5nMf0ZNTC8hOtugdX
 W3UKbQ+g1wdJfGe0BusF+gO0BMA+8SKuuDmV3tJP/SJsQnNj3/BMZkARYfUxSjZMkxCcpgpYz
 PD/5efNEGLePMzT69fU+OerORDg7eGeQFJhRJiDjuQ==
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

msync() uses the flags MS_ASYNC, MS_INVALIDATE and MS_SYNC, which differ
between platforms, specifcally on alpha and hppa.

Add a target to host translation for those and wire up a nicer strace
output.

This fixes the testsuite of the macaulay2 debian package with a hppa-linux
guest on a x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <Y5rMcts4qe15RaVN@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_mman.h   |  4 ++++
 linux-user/generic/target_mman.h | 13 +++++++++++++
 linux-user/hppa/target_mman.h    |  4 ++++
 linux-user/strace.list           |  2 +-
 linux-user/syscall.c             | 12 +++++++++++-
 5 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman.h
index cd6e3d70a604..051544f5abd8 100644
--- a/linux-user/alpha/target_mman.h
+++ b/linux-user/alpha/target_mman.h
@@ -3,6 +3,10 @@
 
 #define TARGET_MADV_DONTNEED 6
 
+#define TARGET_MS_ASYNC 1
+#define TARGET_MS_SYNC 2
+#define TARGET_MS_INVALIDATE 4
+
 #include "../generic/target_mman.h"
 
 #endif
diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
index 1436a3c54308..32bf1a52d07e 100644
--- a/linux-user/generic/target_mman.h
+++ b/linux-user/generic/target_mman.h
@@ -89,4 +89,17 @@
 #define TARGET_MADV_DONTNEED_LOCKED 24
 #endif
 
+
+#ifndef TARGET_MS_ASYNC
+#define TARGET_MS_ASYNC 1
+#endif
+
+#ifndef TARGET_MS_INVALIDATE
+#define TARGET_MS_INVALIDATE 2
+#endif
+
+#ifndef TARGET_MS_SYNC
+#define TARGET_MS_SYNC 4
+#endif
+
 #endif
diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
index 66dd9f79414e..f9b6b9703255 100644
--- a/linux-user/hppa/target_mman.h
+++ b/linux-user/hppa/target_mman.h
@@ -10,6 +10,10 @@
 #define TARGET_MADV_WIPEONFORK 71
 #define TARGET_MADV_KEEPONFORK 72
 
+#define TARGET_MS_SYNC 1
+#define TARGET_MS_ASYNC 2
+#define TARGET_MS_INVALIDATE 4
+
 #include "../generic/target_mman.h"
 
 #endif
diff --git a/linux-user/strace.list b/linux-user/strace.list
index f776c73fa04c..c7808ea118f9 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -656,7 +656,7 @@
 { TARGET_NR_msgsnd, "msgsnd" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_msync
-{ TARGET_NR_msync, "msync" , NULL, NULL, NULL },
+{ TARGET_NR_msync, "msync" , "%s(%p,%u,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_multiplexer
 { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f903dd67cba..44498e9e8ac7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -22,6 +22,7 @@
 #include "qemu/path.h"
 #include "qemu/memfd.h"
 #include "qemu/queue.h"
+#include "target_mman.h"
 #include <elf.h>
 #include <endian.h>
 #include <grp.h>
@@ -7612,6 +7613,14 @@ static inline int target_to_host_mlockall_arg(int arg)
 }
 #endif
 
+static inline int target_to_host_msync_arg(abi_long arg)
+{
+    return ((arg & TARGET_MS_ASYNC) ? MS_ASYNC : 0) |
+           ((arg & TARGET_MS_INVALIDATE) ? MS_INVALIDATE : 0) |
+           ((arg & TARGET_MS_SYNC) ? MS_SYNC : 0) |
+           (arg & ~(TARGET_MS_ASYNC | TARGET_MS_INVALIDATE | TARGET_MS_SYNC));
+}
+
 #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||     \
      defined(TARGET_NR_fstat64) || defined(TARGET_NR_fstatat64) ||  \
      defined(TARGET_NR_newfstatat))
@@ -10124,7 +10133,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         /* ??? msync/mlock/munlock are broken for softmmu.  */
 #ifdef TARGET_NR_msync
     case TARGET_NR_msync:
-        return get_errno(msync(g2h(cpu, arg1), arg2, arg3));
+        return get_errno(msync(g2h(cpu, arg1), arg2,
+                               target_to_host_msync_arg(arg3)));
 #endif
 #ifdef TARGET_NR_mlock
     case TARGET_NR_mlock:
-- 
2.39.2


