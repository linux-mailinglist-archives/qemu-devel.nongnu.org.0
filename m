Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B94030B8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:08:44 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjGl-0000XO-UQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2Z-0005uP-Rz
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:04 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2X-0000zh-SL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:03 -0400
Received: by mail-io1-xd42.google.com with SMTP id m11so459417ioo.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sA5QHzmZM8n6t08NS5xsgqcfTBm3Za7WlXfug3IWldc=;
 b=ftMhVQgIyBdwld+I8He1yn9HaP2xFO0IKa/GLOpf8D0UhXpOeuXHukj0DcmVOSMz35
 ildbyu4F03yRFFGB0ZWiH/qJdbCYQiIC/GTLOjj8ETbqH9lsrUlngFlG88InsaAL+oXy
 wqgr+8r3V/YDj5v8hUBEKLHdCUOf5Uuk2Qe0WkxSeU8A2DLtugmqfn+1vpIX/jtL0y3u
 wqJCRLIusvYricUdlw7ebNWPOBcJArS42mZfGkXVnJ4h7ZrT0O1ofz4p9FaROOg4PLh+
 7zcToHPF/AMNBdJmASiKbybp+W9j4epmfeWOoPGZ/HJd0aF79Xsrxqp+UXV6Q5oXMVI8
 IMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sA5QHzmZM8n6t08NS5xsgqcfTBm3Za7WlXfug3IWldc=;
 b=t7gUE3fFDtD+M82AOwIBkLw2VK4YLwkII3iS1fknCD6wsvnDF9pUyyKENGGlKb0kby
 Hjb6xfiRQtp2GBxr1xXbZ3EMvytJgV76fSfiOpmQm/35GYyxJuDYVk6uT/MahhtJrkNF
 Kdp3UNIdFPgQQNrtfygjOzI3OkQ7sY5wXaYEaF2WPV1I3O0iuBXpqC5TCF0fZPMA+dHa
 pixzzrm1xVR5ibH6rzFnMHXTBDwgTpfGHZqPcxKDWy9nHtILNZg4NnzLJlYJ88P4nIWe
 JMs/waqbyjOzrjseNjPqIfvg1CkomD8hVD4NT525QVPfpN4Q6lRRFkogSjm/tPWpTAX7
 OcbQ==
X-Gm-Message-State: AOAM530jsV3wvV0+xHuyXRHbUGz7mCMq7wxj/ExBnnOluq4k5pHHi01E
 CvXRBntHNtcNN54z2C5g+5q5D4A7s0LDnXuo8D8=
X-Google-Smtp-Source: ABdhPJx4r57MNhpmoH/zkRw6YIeaoJDgfjrqFvI6AMvoa0qTpZ1DbBctdygyGwEpQtIvBRSP1yTQdA==
X-Received: by 2002:a05:6638:1491:: with SMTP id
 j17mr434385jak.75.1631051640716; 
 Tue, 07 Sep 2021 14:54:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:00 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 25/42] bsd-user: Add system independent stack,
 data and text limiting
Date: Tue,  7 Sep 2021 15:53:15 -0600
Message-Id: <20210907215332.30737-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Eliminate the x86 specific stack stuff in favor of more generic control
over the process size:
    target_maxtsiz  max text size
    target_dfldsiz  initial data size limit
    target_maxdsiz  max data size
    target_dflssiz  initial stack size limit
    target_maxssiz  max stack size
    target_sgrowsiz amount to grow stack
These can be set on a per-arch basis, and the stack size can be set
on the command line. Adjust the stack size parameters at startup.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c |  2 +-
 bsd-user/main.c    | 52 +++++++++++++++++++++++++++++++++-------------
 bsd-user/qemu.h    |  7 ++++++-
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index c28ef34143..59465b71d4 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -204,7 +204,7 @@ static abi_ulong setup_arg_pages(abi_ulong p, struct bsd_binprm *bprm,
     /* Create enough stack to hold everything.  If we don't use
      * it for args, we'll use it for something else...
      */
-    size = x86_stack_size;
+    size = target_dflssiz;
     if (size < MAX_ARG_PAGES * TARGET_PAGE_SIZE)
         size = MAX_ARG_PAGES * TARGET_PAGE_SIZE;
     error = target_mmap(0,
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 3d4ed202a0..19bf3a09a7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -18,6 +18,11 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/resource.h>
+#include <sys/sysctl.h>
+
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
@@ -44,8 +49,6 @@
 #include "host-os.h"
 #include "target_arch_cpu.h"
 
-#include <sys/sysctl.h>
-
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
@@ -57,12 +60,12 @@ const char *qemu_uname_release;
 enum BSDType bsd_type;
 char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
 
-/*
- * XXX: on x86 MAP_GROWSDOWN only works if ESP <= address + 32, so
- * we allocate a bigger stack. Need a better solution, for example
- * by remapping the process stack directly at the right place
- */
-unsigned long x86_stack_size = 512 * 1024;
+unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
+unsigned long target_dfldsiz = TARGET_DFLDSIZ;   /* initial data size limit */
+unsigned long target_maxdsiz = TARGET_MAXDSIZ;   /* max data size */
+unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
+unsigned long target_maxssiz = TARGET_MAXSSIZ;   /* max stack size */
+unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 
 void gemu_log(const char *fmt, ...)
 {
@@ -112,7 +115,6 @@ static void usage(void)
            "-d item1[,...]    enable logging of specified items\n"
            "                  (use '-d help' for a list of log items)\n"
            "-D logfile        write logs to 'logfile' (default stderr)\n"
-           "-p pagesize       set the host page size to 'pagesize'\n"
            "-singlestep       always run in singlestep mode\n"
            "-strace           log system calls\n"
            "-trace            [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
@@ -132,7 +134,7 @@ static void usage(void)
            ,
            TARGET_NAME,
            interp_prefix,
-           x86_stack_size);
+           target_dflssiz);
     exit(1);
 }
 
@@ -161,6 +163,23 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+static void
+adjust_ssize(void)
+{
+    struct rlimit rl;
+
+    if (getrlimit(RLIMIT_STACK, &rl) != 0) {
+        return;
+    }
+
+    target_maxssiz = MIN(target_maxssiz, rl.rlim_max);
+    target_dflssiz = MIN(MAX(target_dflssiz, rl.rlim_cur), target_maxssiz);
+
+    rl.rlim_max = target_maxssiz;
+    rl.rlim_cur = target_dflssiz;
+    setrlimit(RLIMIT_STACK, &rl);
+}
+
 static void save_proc_pathname(char *argv0)
 {
     int mib[4];
@@ -197,6 +216,8 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
 
+    adjust_ssize();
+
     if (argc <= 1) {
         usage();
     }
@@ -257,14 +278,17 @@ int main(int argc, char **argv)
             }
         } else if (!strcmp(r, "s")) {
             r = argv[optind++];
-            rv = qemu_strtoul(r, &r, 0, &x86_stack_size);
-            if (rv < 0 || x86_stack_size <= 0) {
+            rv = qemu_strtoul(r, &r, 0, &target_dflssiz);
+            if (rv < 0 || target_dflssiz <= 0) {
                 usage();
             }
             if (*r == 'M') {
-                x86_stack_size *= MiB;
+                target_dflssiz *= 1024 * 1024;
             } else if (*r == 'k' || *r == 'K') {
-                x86_stack_size *= KiB;
+                target_dflssiz *= 1024;
+            }
+            if (target_dflssiz > target_maxssiz) {
+                usage();
             }
         } else if (!strcmp(r, "L")) {
             interp_prefix = argv[optind++];
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1b37757e06..21efa7d777 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -219,7 +219,12 @@ void mmap_fork_end(int child);
 
 /* main.c */
 extern char qemu_proc_pathname[];
-extern unsigned long x86_stack_size;
+extern unsigned long target_maxtsiz;
+extern unsigned long target_dfldsiz;
+extern unsigned long target_maxdsiz;
+extern unsigned long target_dflssiz;
+extern unsigned long target_maxssiz;
+extern unsigned long target_sgrowsiz;
 
 /* user access */
 
-- 
2.32.0


