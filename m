Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C474B2FBED0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:22:31 +0100 (CET)
Received: from localhost ([::1]:34128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1veA-0006nm-Q9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDB-00027o-E4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:37 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:38943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-00041F-Er
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:37 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5FtF-1m0Nb00Ghx-0117LD; Tue, 19 Jan 2021 18:54:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
Date: Tue, 19 Jan 2021 18:54:23 +0100
Message-Id: <20210119175427.2050737-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
References: <20210119175427.2050737-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nQ/XkIVQ63nTCKEJsoyjKiUs+ljebC9TvOoOECIp9QgejxINY42
 R47V20pXbuRgE2QMrL/GeEancwtyFc1zKGeOZIF2X6xKwfkKnxGo4HSHESkGvgO7M2eWdRS
 iuxwQd646f2IQ6vIRR9eu9smIKSND0w4r4eZv+uzwfFOAGDlwa9SuksBbmd4rBTbZNTTsPN
 tFKEyAKzzqAJqenLDCt9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:toZv0CJ7gL4=:DCkOoqPJiC5vBh5tKFXkaC
 +lqF/8ZnAc6eb5Ne19yBiSV4HCh9bZpgeHBsfu05SpYzJ8I5t073j4efSP6XSCEc5gtBMBF0Z
 QSDUyixPRq9mNp/hem3budWDl2MihI3ljjiz2BoZxwW8JFgNXKZNBsqigh0SEE+oIjSxyRAeh
 umLPIsDWf0Qi2sNBjeCrM6sPgFBf/1hp/bPQ3yxlALSC7yli0Q4TkccXC0iCWRKuj5pT1efmY
 LeaH4HHtk4mSk//ER8smLDYUkRqDp+V8koHWG/ZUYm+coRiycT9H6kQiSfUv17TQpP7Al+Rp8
 bWbL+cm4iyvyiYwgBSmpRBkvsuOZ5K1BxWDQ3ozI56v8HwDxVJl1Q2fa7XE8g0IzA6t850Vii
 ZVFHWOL54MgSN5QsGbxLis18GLwgjkRb4qKNPefMuLfnPeKY8Boa2PRZA355C
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


