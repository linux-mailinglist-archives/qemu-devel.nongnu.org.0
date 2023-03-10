Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFFE6B53DE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvh-0008AU-E5; Fri, 10 Mar 2023 17:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvf-00089u-E2
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:35 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvd-0002ya-CZ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:35 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M4JVv-1paTwe1TRB-000N6w; Fri, 10
 Mar 2023 23:09:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 01/28] linux-user: Fix access to /proc/self/exe
Date: Fri, 10 Mar 2023 23:09:00 +0100
Message-Id: <20230310220927.326606-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eguOYkggVnjq5Jx6mjXFOKPtbiBYoniwkFyt4Db/y09kIFHGMVl
 o0iazAzfs5+b2BIrkbYFkazesGwsIW1y+dPwXqM1inADYj0yXm3puSsyvFOUAJxqEKilYDv
 EEfv5TdfdSnoWSwbSQjkSEoP2S1TTIwHThd3l4CEvkDRxgSck2vLJ+dK6tiZtNJiqSrjrxL
 iTtjczf7IYSpu8V9bUIJg==
UI-OutboundReport: notjunk:1;M01:P0:US87ns4qjoU=;ThuHwj5BSDwGkVky2zXQb0gVdJE
 80KqV2yNMxRZeZg+AQiRlO2X7VDDdTgaLrwES7OFDlQgJa+0HdkH6wteJxx2UICKuKWprmelR
 9qsRtIFWH1r/0QVILIZ7euU9RD5OyRpZJt41qTfyNU1LlZHrKF+HFDMJlQB71Az23DwnDNRaD
 UcVuwgJsosT35aEesZDqnmU/ndL6GmZKFRtXDOObcKc8A9jLX41iiKQS0m7WVj0GHaKWyx33t
 IxYpfmKjPGbsncYT2fmy6kvKb+qMn1Ny2AH7xWu9SOqSZhcGOMitdd7k6Tk+7jiI+rhZjde07
 JqiyW7yrVHnWGepx7L8lD0CtpGKJ924SzlZ0evaGqgXjpIcD+1qOQTfqsX+LxIT12Dmsai7ae
 91HNlnV4GSNBUbpRUzpmhb6KtKqqiaLj2N41JvSO7Ww+1E7n4E0lP9rCfYOTgu+zBXzZ5Ny7v
 84dDf+6HyeIyqcM4l1VSY4KL9in9NJx0uOugOIUg4cMRuNXkmUQFYIHBnrPoyqupyeq8S5XUG
 +1ySp8p7/h7eaMm3jd4DAot4+LrFEYW3zLW5B/dOhCgXfw1ewWaSf/FT+nB5fsQBrDqe8oDB7
 uK5jbcc9cGk2kXLXx+7o+RRt6tmu4vALTG/+fKPBL3eJtAx3o8A/NRXi5VQSVKOLPAxPQqDTE
 HCo1VA2aWTSn5QWKH8YwFUUPJOsrm4kJefvenaRVBw==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

When accsssing /proc/self/exe from a userspace program, linux-user tries
to resolve the name via realpath(), which may fail if the process
changed the working directory in the meantime.

An example:
- a userspace program ist started with ./testprogram
- the program runs chdir("/tmp")
- then the program calls readlink("/proc/self/exe")
- linux-user tries to run realpath("./testprogram") which fails
  because ./testprogram isn't in /tmp
- readlink() will return -ENOENT back to the program

Avoid this issue by resolving the full path name of the started process
at startup of linux-user and store it in real_exec_path[]. This then
simplifies the emulation of readlink() and readlinkat() as well, because
they can simply copy the path string to userspace.

I noticed this bug because the testsuite of the debian package "pandoc"
failed on linux-user while it succeeded on real hardware.  The full log
is here:
https://buildd.debian.org/status/fetch.php?pkg=pandoc&arch=hppa&ver=2.17.1.1-1.1%2Bb1&stamp=1670153210&raw=0

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221205113825.20615-1-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c    |  6 ++++++
 linux-user/syscall.c | 38 ++++++++++++++------------------------
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4ff30ff98066..798fdc0bce8e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -65,6 +65,7 @@
 #endif
 
 char *exec_path;
+char real_exec_path[PATH_MAX];
 
 int singlestep;
 static const char *argv0;
@@ -739,6 +740,11 @@ int main(int argc, char **argv, char **envp)
         }
     }
 
+    /* Resolve executable file name to full path name */
+    if (realpath(exec_path, real_exec_path)) {
+        exec_path = real_exec_path;
+    }
+
     /*
      * get binfmt_misc flags
      */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73cfe..cc650d4ccbd6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9989,18 +9989,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 /* Short circuit this for the magic exe check. */
                 ret = -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
-                char real[PATH_MAX], *temp;
-                temp = realpath(exec_path, real);
-                /* Return value is # of bytes that we wrote to the buffer. */
-                if (temp == NULL) {
-                    ret = get_errno(-1);
-                } else {
-                    /* Don't worry about sign mismatch as earlier mapping
-                     * logic would have thrown a bad address error. */
-                    ret = MIN(strlen(real), arg3);
-                    /* We cannot NUL terminate the string. */
-                    memcpy(p2, real, ret);
-                }
+                /*
+                 * Don't worry about sign mismatch as earlier mapping
+                 * logic would have thrown a bad address error.
+                 */
+                ret = MIN(strlen(exec_path), arg3);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret = get_errno(readlink(path(p), p2, arg3));
             }
@@ -10021,18 +10016,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 /* Short circuit this for the magic exe check. */
                 ret = -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
-                char real[PATH_MAX], *temp;
-                temp = realpath(exec_path, real);
-                /* Return value is # of bytes that we wrote to the buffer. */
-                if (temp == NULL) {
-                    ret = get_errno(-1);
-                } else {
-                    /* Don't worry about sign mismatch as earlier mapping
-                     * logic would have thrown a bad address error. */
-                    ret = MIN(strlen(real), arg4);
-                    /* We cannot NUL terminate the string. */
-                    memcpy(p2, real, ret);
-                }
+                /*
+                 * Don't worry about sign mismatch as earlier mapping
+                 * logic would have thrown a bad address error.
+                 */
+                ret = MIN(strlen(exec_path), arg4);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
-- 
2.39.2


