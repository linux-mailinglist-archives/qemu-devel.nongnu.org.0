Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687815EDA01
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:23:43 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUE8-0007OW-UW
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008Aq-Nt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE6-0008BD-JJ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:32 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N63JO-1pJWA20rCy-016QSd; Wed, 28
 Sep 2022 10:15:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 15/38] linux-user: Implement stracing madvise()
Date: Wed, 28 Sep 2022 10:14:54 +0200
Message-Id: <20220928081517.734954-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nDHUuuST60S5LHG25c5IcMxkEmHfXMUq7xrZ8Iks5GXPySc6C19
 enWEjdU/DAWbtYksH6o608VAJ6+ryUh/ZxcPiE6R3WbYLUDwv/0lr7a5rN4/5Tl2RjBdzMs
 cPFDCE9X+jLcvrQF62GNunCsR+bllpj1gQjOpuOllyjtR+h9T06Jr5fgXKMymSRbKh9ai6R
 OvCOj730QQBvj5q5kd+NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5sq+y7gYpX8=:NmDi6G+CEf1P+28Fd5Y53n
 9Y+4pXJhg/XcAJMXPDC17nZirOJhYg3BIgC/b6/QWUyOdG6Zs7euT2hDRQw3WuThFZAY0F5LL
 GNDJwLP2LcMEJWkm8uqSUynD7MQnBH7zIyo5Zu1cGLXz6wxAWrhRTaTLGpqMEKUAjbLLltigT
 62yROXfb8kWMqbYNUqoqoGSFpLZ8AZ6yXyq3LOvBkwrJjEwEUPR4gG0YHDrQJ7V/ioLEefMCz
 5MZ3/f9myXVZbhJ0TgpgIYe/MiewjArSFiaTakPdVwSY3baSDIHFt1O3BIJRTBRKetJL6t1lS
 OwPsCuNl4tgGnAQYdikEXwo1bt+59oKecMP2nxqCJOry9+t4Rmf/vZmKzA6Vpr4vQJt8FBcpT
 r5J89p02UAWcMhujWRFOpX8iWMC01xvkGu7YHp0rZu10KRH7+YyXYgK94g7T3nj6rrJhgQStv
 O7ewDxAHuobWln3HnQuSGbZvrMe/PK86XguIw033rGRx0zR3WoH+wPRrtPbD9sGTtST4xi6tn
 Cpny2LIK+6psVB4JZX5v/ygrJurbFtvV+LC83giax/o+BZeCFY5dsdwu5N3WdGSZjWkxwngWY
 ihG64N7bbDMSLgSZFaPAWZxseKVR5zsWEPzAZWBEslg+NRWJr2EgNUR5uQLffD+/M7Ke0cGPV
 l81Ol1IUk1cbklgcr8IEm9rn38XehnH5oKFfnH/DBYVehRLvw6iPhDEypu+9WHJvouDPQCO9S
 p6cwM/gt97u7jx0L3zZAaqRwZQtHXiTAlrfCFPWWcDlBnisqg0uoabWtw1XrKY9jKu/8UbNkk
 Q8z2UpF
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

The default implementation has several problems: the first argument is
not displayed as a pointer, making it harder to grep; the third
argument is not symbolized; and there are several extra unused
arguments.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-4-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index b6b9abaea466..2deb84a2c106 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -18,6 +18,7 @@
 #include "user-internals.h"
 #include "strace.h"
 #include "signal-common.h"
+#include "target_mman.h"
 
 struct syscallname {
     int nr;
@@ -3019,6 +3020,46 @@ print_stat(CPUArchState *cpu_env, const struct syscallname *name,
 #define print_lstat64   print_stat
 #endif
 
+#if defined(TARGET_NR_madvise)
+static struct enums madvise_advice[] = {
+    ENUM_TARGET(MADV_NORMAL),
+    ENUM_TARGET(MADV_RANDOM),
+    ENUM_TARGET(MADV_SEQUENTIAL),
+    ENUM_TARGET(MADV_WILLNEED),
+    ENUM_TARGET(MADV_DONTNEED),
+    ENUM_TARGET(MADV_FREE),
+    ENUM_TARGET(MADV_REMOVE),
+    ENUM_TARGET(MADV_DONTFORK),
+    ENUM_TARGET(MADV_DOFORK),
+    ENUM_TARGET(MADV_MERGEABLE),
+    ENUM_TARGET(MADV_UNMERGEABLE),
+    ENUM_TARGET(MADV_HUGEPAGE),
+    ENUM_TARGET(MADV_NOHUGEPAGE),
+    ENUM_TARGET(MADV_DONTDUMP),
+    ENUM_TARGET(MADV_DODUMP),
+    ENUM_TARGET(MADV_WIPEONFORK),
+    ENUM_TARGET(MADV_KEEPONFORK),
+    ENUM_TARGET(MADV_COLD),
+    ENUM_TARGET(MADV_PAGEOUT),
+    ENUM_TARGET(MADV_POPULATE_READ),
+    ENUM_TARGET(MADV_POPULATE_WRITE),
+    ENUM_TARGET(MADV_DONTNEED_LOCKED),
+    ENUM_END,
+};
+
+static void
+print_madvise(CPUArchState *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_pointer(arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_enums(madvise_advice, arg2, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #if defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
 static void
 print_fstat(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 215d971b2aea..c6f748505a9e 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -542,7 +542,7 @@
 { TARGET_NR_lstat64, "lstat64" , NULL, print_lstat64, NULL },
 #endif
 #ifdef TARGET_NR_madvise
-{ TARGET_NR_madvise, "madvise" , NULL, NULL, NULL },
+{ TARGET_NR_madvise, "madvise" , NULL, print_madvise, NULL },
 #endif
 #ifdef TARGET_NR_madvise1
 { TARGET_NR_madvise1, "madvise1" , NULL, NULL, NULL },
-- 
2.37.3


