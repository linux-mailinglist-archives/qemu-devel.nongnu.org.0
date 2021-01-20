Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8036C2FDA2F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:55:57 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ja7-0003h8-W4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXl-0001z6-1r
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:29 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXi-0002zr-QN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:28 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N49Ul-1m29WV1Dub-0108ou; Wed, 20 Jan 2021 20:53:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
Date: Wed, 20 Jan 2021 20:53:13 +0100
Message-Id: <20210120195317.84222-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120195317.84222-1-laurent@vivier.eu>
References: <20210120195317.84222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N3RF0IJ+riHmTTL3ZPKNyyt8pj9sc+ZJQFba2Fgl/AsOKSNcnsD
 mXI35ThLZChqnVZRev55hY4i5t17K2/b6V5y90OMGYSC3ctPhnB87/RL0RzU6P5vo9RUG3H
 vZZyvozE7y0C/AoWfb+iFXFubWGhZfBGGkvLxy1Y50zWLD28HNqPnZXVSN+XfLGY41bH0JO
 Oz9G1MEsZhiJos4fR/8WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x/WkA89aGbM=:GJxrvkIjVwwcIo/aLc+zzc
 oES07V23nyrDFiP7rEhaQfob+kYg7OHU/b5AFqyvDOAQBBXaFQHXjidDTtMjiMZuWrHVS7o+4
 wzhnQOMe2bAUV7HseREXTAy4tFd8pkcBPeHkjUmh2l9Ac1l67Vv+pSyJySZeJ3Z0END5SpPPd
 k8l7q+AihN5LV0MNZzC++DV9yEJC+RENcF0AYpb+EHuM/LAaR1ulyrhom9szY1LzyK4nuvtpv
 asAOeuGjkfhXSAQVa/3Agko49b3vYiORd3wXi0fyjkkcSoTSQ/jEXH4wFvVJsOpkS0iyLzDJ/
 ruJidwSnuZvniRpWVvoWNTCsYpqeT8wJTUZOJpMV03Sivoril/CnuUXgIUyXSoNsRcYr5omr0
 9+0KkwjUT81l6UWhCENiKodBArCyhDLfZcBSWBtaC6jmZZXAJ52JxNU8AzjNG69EJ0lQY3Y2V
 eJxllHfPLg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

Also reorder blocks so that they are all in the same order everywhere.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-2-scw@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c       | 39 ++++++++++++++++++++++++++++++++-------
 linux-user/syscall.c      | 10 ++++++++++
 linux-user/syscall_defs.h | 14 ++++++++------
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e00275fcb51b..227812c07e63 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2066,11 +2066,34 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
         break;
     case TARGET_F_SETLEASE:
         qemu_log("F_SETLEASE,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
         break;
     case TARGET_F_GETLEASE:
         qemu_log("F_GETLEASE");
         break;
+#ifdef F_DUPFD_CLOEXEC
+    case TARGET_F_DUPFD_CLOEXEC:
+        qemu_log("F_DUPFD_CLOEXEC,");
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+        break;
+#endif
+    case TARGET_F_NOTIFY:
+        qemu_log("F_NOTIFY,");
+        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+        break;
+#ifdef F_GETOWN_EX
+    case TARGET_F_GETOWN_EX:
+        qemu_log("F_GETOWN_EX,");
+        print_pointer(arg2, 1);
+        break;
+#endif
+#ifdef F_SETOWN_EX
+    case TARGET_F_SETOWN_EX:
+        qemu_log("F_SETOWN_EX,");
+        print_pointer(arg2, 1);
+        break;
+#endif
+#ifdef F_SETPIPE_SZ
     case TARGET_F_SETPIPE_SZ:
         qemu_log("F_SETPIPE_SZ,");
         print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
@@ -2078,14 +2101,16 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
     case TARGET_F_GETPIPE_SZ:
         qemu_log("F_GETPIPE_SZ");
         break;
-    case TARGET_F_DUPFD_CLOEXEC:
-        qemu_log("F_DUPFD_CLOEXEC,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 1);
+#endif
+#ifdef F_ADD_SEALS
+    case TARGET_F_ADD_SEALS:
+        qemu_log("F_ADD_SEALS,");
+        print_raw_param("0x"TARGET_ABI_FMT_lx, arg2, 1);
         break;
-    case TARGET_F_NOTIFY:
-        qemu_log("F_NOTIFY,");
-        print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
+    case TARGET_F_GET_SEALS:
+        qemu_log("F_GET_SEALS");
         break;
+#endif
     default:
         print_raw_param(TARGET_ABI_FMT_ld, arg1, 0);
         print_pointer(arg2, 1);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d182890ff04a..98aaca01872f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6639,6 +6639,14 @@ static int target_to_host_fcntl_cmd(int cmd)
     case TARGET_F_GETPIPE_SZ:
         ret = F_GETPIPE_SZ;
         break;
+#endif
+#ifdef F_ADD_SEALS
+    case TARGET_F_ADD_SEALS:
+        ret = F_ADD_SEALS;
+        break;
+    case TARGET_F_GET_SEALS:
+        ret = F_GET_SEALS;
+        break;
 #endif
     default:
         ret = -TARGET_EINVAL;
@@ -6931,6 +6939,8 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
     case TARGET_F_GETLEASE:
     case TARGET_F_SETPIPE_SZ:
     case TARGET_F_GETPIPE_SZ:
+    case TARGET_F_ADD_SEALS:
+    case TARGET_F_GET_SEALS:
         ret = get_errno(safe_fcntl(fd, host_cmd, arg));
         break;
 
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a00bfc2647c7..f98c1c1c8de4 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2408,12 +2408,14 @@ struct target_statfs64 {
 #endif
 
 #define TARGET_F_LINUX_SPECIFIC_BASE 1024
-#define TARGET_F_SETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 0)
-#define TARGET_F_GETLEASE (TARGET_F_LINUX_SPECIFIC_BASE + 1)
-#define TARGET_F_DUPFD_CLOEXEC (TARGET_F_LINUX_SPECIFIC_BASE + 6)
-#define TARGET_F_SETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 7)
-#define TARGET_F_GETPIPE_SZ (TARGET_F_LINUX_SPECIFIC_BASE + 8)
-#define TARGET_F_NOTIFY  (TARGET_F_LINUX_SPECIFIC_BASE+2)
+#define TARGET_F_SETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 0)
+#define TARGET_F_GETLEASE            (TARGET_F_LINUX_SPECIFIC_BASE + 1)
+#define TARGET_F_DUPFD_CLOEXEC       (TARGET_F_LINUX_SPECIFIC_BASE + 6)
+#define TARGET_F_NOTIFY              (TARGET_F_LINUX_SPECIFIC_BASE + 2)
+#define TARGET_F_SETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 7)
+#define TARGET_F_GETPIPE_SZ          (TARGET_F_LINUX_SPECIFIC_BASE + 8)
+#define TARGET_F_ADD_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 9)
+#define TARGET_F_GET_SEALS           (TARGET_F_LINUX_SPECIFIC_BASE + 10)
 
 #include "target_fcntl.h"
 
-- 
2.29.2


