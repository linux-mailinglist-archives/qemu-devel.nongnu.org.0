Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A113F9034
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:37:56 +0200 (CEST)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN4D-0000MD-1D
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg8-0006SO-9C
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:53 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg5-0006yy-E1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:51 -0400
Received: by mail-io1-xd44.google.com with SMTP id j18so5557412ioj.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsoJhzBLSXaxNP6+ZSNtSaMWi8k+iuQEDNX6YmpoQMc=;
 b=En6X/14v8hY9IcQcbM5vPjOTkwA+Q2t0A6aewzBZjJ0VG1FdLMkCjBe5I8LPh41XUt
 ftcY7kL8TL9xHalB+zJU5YXoVVw/HP187Eq2MAKhgaLEMV8NjXqu07OXxANean4sxm3u
 yNacmk4bBvxK/spUKUeWiMBKaA33FKvw7JSdevqrywTydAqF3pCgTCEUqTrAykpUEE/2
 ON/ySereRR3UHSed1R+9TZen9a1tTSLvqux3Kv4Lgq+UYW7dY4+idMTrroKIhmD3oXAh
 qWR3tz7VaIYJHh6R8/knZ2fyMbXaFbV2c07KGokKyHiE2tXGOztKgB1/Mmix5sZDVjcj
 u/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsoJhzBLSXaxNP6+ZSNtSaMWi8k+iuQEDNX6YmpoQMc=;
 b=pCB5Ws4FPfsz6f5jvDC1rQfhWznUWJK+5g5UJlVgW9Yjp6Hw0uVTWTLQCgKzdhMT4j
 0GVWVKr6YRB1Y2c5mxd0YPVdONlIvvcUOEjpRxhxrOxeP+J7yUnbXrV7VOH1au6MBOFK
 3u/aHAG6ZveTqzp5IFo5bS+JkymX/ev5MyrSKm1OPtu4+R+Y/mgHndigOPq7u9fzEYGb
 /IW04ecpfJDEB9lue0HBqCcCkRu+bJgyM4mpz5Abha7fDQA1kmyE+CHBXdMOw/9+FDR3
 95VmFtxjZUNL0AegzfIwW5dTrgyJPVj/ujSDYYxuz2VwKYhQtxEPsiNT2BQp/QbbNO/y
 7w4g==
X-Gm-Message-State: AOAM531voEkXGGMI4ktmT6CJBRQ3KaUwjXY4UJUz74NQiTRvAlUGLBQC
 xfdVOjPi16VSJ+rfP57BnWmabnRDwcX16yU7
X-Google-Smtp-Source: ABdhPJzebu+nRjmuAn08azvhuKwCSQNvScVcns1nkhI7Dg7cRKn3QYiTcL5kO1iW6P1y5Sc1Nt1kYg==
X-Received: by 2002:a05:6602:1543:: with SMTP id
 h3mr4626019iow.123.1630012367727; 
 Thu, 26 Aug 2021 14:12:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:47 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/43] bsd-user: Add system independent stack,
 data and text limiting
Date: Thu, 26 Aug 2021 15:11:46 -0600
Message-Id: <20210826211201.98877-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
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
 bsd-user/main.c    | 51 +++++++++++++++++++++++++++++++++-------------
 bsd-user/qemu.h    |  7 ++++++-
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 70a0f81f3d..5ceb60b1c2 100644
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
index f16d6c80e2..f6643896f6 100644
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
 
@@ -161,6 +163,22 @@ void init_task_state(TaskState *ts)
     ts->sigqueue_table[i].next = NULL;
 }
 
+static void
+adjust_ssize(void)
+{
+    struct rlimit rl;
+
+    if (getrlimit(RLIMIT_STACK, &rl) != 0)
+        return;
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
@@ -197,6 +215,8 @@ int main(int argc, char **argv)
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
 
+    adjust_ssize();
+
     if (argc <= 1) {
         usage();
     }
@@ -257,14 +277,17 @@ int main(int argc, char **argv)
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
index a9df7ab874..3e3bd96cff 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -220,7 +220,12 @@ void mmap_fork_end(int child);
 
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


