Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7753FF842
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:09:26 +0200 (CEST)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwlp-0001bz-4C
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRH-0006zO-5m
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:11 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRF-00035H-3d
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:10 -0400
Received: by mail-il1-x136.google.com with SMTP id z2so3602849iln.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sA5QHzmZM8n6t08NS5xsgqcfTBm3Za7WlXfug3IWldc=;
 b=MZqpnQP0ommsr8jJK7RiTGqa25wddw2Ww2FfUKRwQ+QZGDRQLT200Fq5gYJf9ZKazd
 Wn4dL4NQWQNdCq4OfGm6P42NGWj4G4IE6kXEtzD7PyURNK9P/jc6J7QIohd8kus6l7jJ
 1fKZc5K0wMrB0dC/aPtNaZVDh7wP/v4G4iSejlpc6y4wEgf7SGoQZ/bsHfyMSD+row+3
 EnhB17t6DIeb8LzA2bqr9BKvsDgFVNierPwM0yKYZNh3gU2gVnZdNWXuNRSpo2HdF7Cx
 rbH2c4c9JTdIN2X7AArRhhuhgA/Hkv0bQzIjyc/x3wMJmD2SJKqpOrZFTOWfPIaH1+qS
 JjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sA5QHzmZM8n6t08NS5xsgqcfTBm3Za7WlXfug3IWldc=;
 b=LcH2h5/8KrriKZQiQjahyCC21sn9FoC5ne64sja+i2962YFLM3ZhyIk3QYzZm88Is0
 gghNYTfz9/857u6Ep3tNvW4pou8FGM68Eyje64LhyJS969kqFwCoMmeSWUT2eFtpjIkj
 +h6VvmkGjYnK5OaYYIw3bJD+1pEHSkY/5PVtPu3h5A94zmKp2ybPoFN6ldOpDDjRNFnp
 RDAV8nZ5Gb/4kHj7MyQMwi19YXKGnNYiiOpgNy+1JeHY/S7zPzviOXSfO+iSa3u7/5AR
 D1BA20PzHcWc/jQbptj+v3/V/yZxellnkxCrcVuQ8ASqnWUyEoc2yLkmvp2hl9O1tY4m
 QHuA==
X-Gm-Message-State: AOAM53291K4n30TApUjjYkoDufUZiMSXggYbJfVifVAZIj087UP9H6p4
 rhsXdsROV50EpA4zHXrGzl/QdWzL/TrgmA==
X-Google-Smtp-Source: ABdhPJywEeGpFaUg2oHnBqP/UWKYKGIfE6WYYXyIb8CJKrDCnTlRIgFSeSJL/XMofVbgOaXzzKEecQ==
X-Received: by 2002:a05:6e02:531:: with SMTP id
 h17mr513195ils.288.1630626487753; 
 Thu, 02 Sep 2021 16:48:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:07 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/43] bsd-user: Add system independent stack,
 data and text limiting
Date: Thu,  2 Sep 2021 17:47:11 -0600
Message-Id: <20210902234729.76141-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


