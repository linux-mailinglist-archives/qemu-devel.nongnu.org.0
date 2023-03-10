Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3326B53EC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvl-0008Dg-Cf; Fri, 10 Mar 2023 17:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvi-0008BH-5a
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:38 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvg-00030s-8d
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:37 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5FMB-1qb4xf2ZYj-011Ays; Fri, 10
 Mar 2023 23:09:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 12/28] linux-user: Add translation for argument of msync()
Date: Fri, 10 Mar 2023 23:09:11 +0100
Message-Id: <20230310220927.326606-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xoKc1/G9qkiGxEHqSkJfWemSWhV2+lraHV6df/FPgXB8fn8vDMk
 tSK2Un7+nPR9dDuFYZmRqcceW20aVBag6dcRoYccVLSDlblkU46U4igfbePyEteWEQUiLJb
 QgF5acV3t2f7sjCr5gBEJz/fJaSkeljJdX6KPFLy7lF8gB2E1Ufaa/XvhSGdfXYSGPxBRkV
 3BgGQ1WlqILn2Prh66dZA==
UI-OutboundReport: notjunk:1;M01:P0:IKGrArqErXk=;TCLsdlCT/0Wgceu4Gb+d/VAL7i5
 4vQaPcIIuq5jZ/No9h2VgAfdbQSg1+G6K2EsSQpy47tAH65nVE4k4XXqUQ6ZbxOXvoCZN558d
 u+XAxEQjHANmOMmIw7UUcZT411eRfkDFJqXVjiH8A0uayHAjM8lBZDK81woXR2LmfPlxqRVsx
 RNx7gu9KkjQtAqIB3I1BAMOl7BmyTSSh/uVDTBRXkAODO+kCPsr/Dwj7RUR+pAgy+bNOPViiZ
 tuxsuvemshRCIRd7PVh7YPnsVkewI4F2FDVtQF9jS5+GsnMB6Q3Lw7KCc7qvOO8flQx0+/IQ/
 oQRsR+Am8nxw4D/uygrRIEis72oGmsgz4dwIKEhKnlX7ppgOtKV1bFqgktC1iw8cUbSuKgm2+
 vYWYYjtp0OXD12Winiqabjf6PflFPnWQA1aTt79SisB4ITdAxVnozh2NRHV9oTm8pE2+ni7Eu
 CmjI1NxOiIpMZ6EDabZBnM1ulaXLcBuVbCJ8eJ+HRyZ2++pwH/Qq7tt2lzKM3PcfqRz7VqiKF
 4PEPcPzGCUYxU5QYg1coPw2H0L1KG9Da5Bh9jp5GKc2U/D0Q6Wy2mgWVajypqLIGk6spR4p2V
 +c08AggPqGOP4YHdqx/hOFUHBhkvriYPyrzdC+5rc94vE59+uUvtpzfRlTSwPzhYOh/pRY6RQ
 PKw2Pmd4kY8nyHb5ZftEn/Esml0LRWCyE3QQdnvtoA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
index 05c81079e745..dad2c3312032 100644
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
@@ -10128,7 +10137,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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


