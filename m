Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D826B0909
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:30:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtqt-0001bg-RB; Wed, 08 Mar 2023 08:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqs-0001b8-AC
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:06 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqp-00063M-Ut
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:06 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MOAr1-1pu39w29wv-00OZtF; Wed, 08
 Mar 2023 14:29:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 01/28] linux-user: Fix access to /proc/self/exe
Date: Wed,  8 Mar 2023 14:28:30 +0100
Message-Id: <20230308132857.161793-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Va2nXUp8ccp8SmE7dnPBCF1RZ5p+gmFWYtw4vS7ZJMQwx7bUaRE
 f5WWpXRA2hZe9ICfQhLqcAj/db/aL6yp7B/lbe8SgDMSIg3dzsRQorEy408jyI8EvhoBmVM
 RMEy6gBvfAfvoL7efajSux+vXqzc423L/hHplNMM3BsCqznS9ziCisuADfRhpolgQNTjiFc
 Om66Lx0BDiksAymI6acqA==
UI-OutboundReport: notjunk:1;M01:P0:P020ciQ7zR8=;rouxZB+9cUI2owhqnJdvqBNwUn7
 HfBYrFKGISUaWB4qoLqIcrA9VLvHaadBUB+g5DKszKMEcD3ThQHQJS1jDJ+d0NH/JMu33bdYU
 WvK9OiHrg3k7EbYzR+FN5zrmj/M/1He/Z/n6p9tRpqrYMPTXyXeYPNV0Bbcz96DHJKBrGhJ5W
 nZw7iaQ01eTck/gqcQCKsQbD3gmGZ7TA0v7cOnxPuUIa1EI9ZZAI4krYDZqvqsVC+X9449mXE
 tSVqw69YoLgp6cg2fECrdaiSxBYUB0SzxFxvPLA1AqQjxP5xL/eSoFgxqCekSeJT614pFM5r7
 R+o6apCqdxPI/Cc21VZu/oiZgH6XwTqGF+9Oh5dtMf9pc/BK2K51KhUw1UQm4xXeS4/+JlZSr
 YhDevQAtwu8RZRctbALNByEugnNCRjc+OODWGWXwgMFIrEWTEDhPrAu45aOOdOKnRSBlU/vP8
 n8rmxfvzasNRLFLEspalAfuEFoclDqJYIF6Q8/AKUyPvevNirvhFlz7U2bEo8B1Lzess46FXt
 YuMnYa5NHo//1pRbCWXogta0eweFYev6XNlr5fDPQ+Q7NPCWpLsbsFeloo/4ynB6zYPdvdf0r
 Ro+eCrn58H6s33QQue7SiA3492oLPBiidCPS2FIXt5RUIYl/N+duHvCzFiGhwz6P9oRM4BqlR
 8DixGjMC5Jj8iIXK6R+3I2YANJWipoar05pE0fTpPA==
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
 linux-user/syscall.c | 34 ++++++++++------------------------
 2 files changed, 16 insertions(+), 24 deletions(-)

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
index a6c426d73cfe..6525a9c57a39 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9989,18 +9989,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
+	        /* Don't worry about sign mismatch as earlier mapping
+	         * logic would have thrown a bad address error. */
+                ret = MIN(strlen(exec_path), arg3);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret = get_errno(readlink(path(p), p2, arg3));
             }
@@ -10021,18 +10014,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
+	        /* Don't worry about sign mismatch as earlier mapping
+	         * logic would have thrown a bad address error. */
+                ret = MIN(strlen(exec_path), arg4);
+                /* We cannot NUL terminate the string. */
+                memcpy(p2, exec_path, ret);
             } else {
                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
-- 
2.39.2


