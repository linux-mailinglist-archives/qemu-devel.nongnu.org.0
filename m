Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952412D2076
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 03:05:53 +0100 (CET)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSO0-0000Rg-4x
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 21:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <technoboy85@gmail.com>)
 id 1kmQhD-0007fx-GV
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:17:35 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <technoboy85@gmail.com>)
 id 1kmQhB-0002zJ-N5
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:17:35 -0500
Received: by mail-ed1-f66.google.com with SMTP id b2so15752137edm.3
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2smWY3oYsuTtzL43PsXNtmYVPputxJkErMBPTf/suzw=;
 b=MsvlhwRIEzb+mQbyWGEg3s/MSbbjY2D5jmGOLXJu7PoKvY+8wyHXaawqRmQKVuDZ/D
 uWeQhbdQZP6O1FlWqh5OgPOaGOXpRQFPizGeUqsGbjksTdYJ8lKms016kvafxnqam5im
 sClWXfMFgZXB/5osp0MSSlCJUGol40mSgELcbHKPYbRfTYzi6IkxilDDYzxNx3ax4pOz
 /g7ZGU7/oAfUUGgQVVFEPBNA6WwElUUcGgQ1aEJXrbMHClKBlE+l9DyRqkb7oicPnXLJ
 HZFEMnwSectLazR4d/mp5cYt2xzxkMg9pPBMN4h3DkwSFXs5kg4Cwe9Lrpj0gKmV+3SP
 Zc3A==
X-Gm-Message-State: AOAM531r2eRy7NJHXg2SzJfQkEP+H6QbT6TgWZH0w7vDRI1sE0Hrbgv0
 xVRaUSi1H9eHifVkmTXT+3racISG5NM86tcx
X-Google-Smtp-Source: ABdhPJzKqtY9h9vIH4+oN11vTJRnx2nqJgov1SKCQJKgPnjuSHIEgbBtE9namIuA5541GNNxue6iOg==
X-Received: by 2002:a50:bc06:: with SMTP id j6mr23395822edh.150.1607386650933; 
 Mon, 07 Dec 2020 16:17:30 -0800 (PST)
Received: from msft-t490s.teknoraver.net
 (net-37-182-2-234.cust.vodafonedsl.it. [37.182.2.234])
 by smtp.gmail.com with ESMTPSA id r11sm3538673edt.58.2020.12.07.16.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:17:30 -0800 (PST)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: add option to chroot before emulation
Date: Tue,  8 Dec 2020 01:17:27 +0100
Message-Id: <20201208001727.17433-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.66; envelope-from=technoboy85@gmail.com;
 helo=mail-ed1-f66.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Dec 2020 21:04:05 -0500
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matteo Croce <mcroce@microsoft.com>

Add a '-c' option which does a chroot() just before starting the
emulation. This is useful when the static QEMU user binary can't
be copied into the target root filesystem, e.g. if it's readonly.

Move some code which accesses /proc/sys/vm/mmap_min_addr before
the chroot, otherwise it would fail.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 linux-user/main.c | 128 +++++++++++++++++++++++++++-------------------
 1 file changed, 75 insertions(+), 53 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 24d1eb73ad..4788e4b5bc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -60,6 +60,7 @@ static const char *seed_optarg;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
 bool have_guest_base;
+static const char *qemu_chroot;
 
 /*
  * Used to implement backwards-compatibility for the `-strace`, and
@@ -304,6 +305,11 @@ static void handle_arg_pagesize(const char *arg)
     }
 }
 
+static void handle_arg_chroot(const char *arg)
+{
+    qemu_chroot = arg;
+}
+
 static void handle_arg_seed(const char *arg)
 {
     seed_optarg = arg;
@@ -450,6 +456,8 @@ static const struct qemu_argument arg_table[] = {
      "logfile",     "write logs to 'logfile' (default stderr)"},
     {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
      "pagesize",   "set the host page size to 'pagesize'"},
+    {"c",          "QEMU_CHROOT",      true,  handle_arg_chroot,
+     "chroot",     "chroot to 'chroot' before starting emulation"},
     {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
      "",           "run in singlestep mode"},
     {"strace",     "QEMU_STRACE",      false, handle_arg_strace,
@@ -688,6 +696,73 @@ int main(int argc, char **argv, char **envp)
 
     init_qemu_uname_release();
 
+    /*
+     * Read in mmap_min_addr kernel parameter.  This value is used
+     * When loading the ELF image to determine whether guest_base
+     * is needed.  It is also used in mmap_find_vma.
+     */
+    {
+        FILE *fp;
+
+        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
+            unsigned long tmp;
+            if (fscanf(fp, "%lu", &tmp) == 1 && tmp != 0) {
+                mmap_min_addr = tmp;
+                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
+                              mmap_min_addr);
+            }
+            fclose(fp);
+        }
+    }
+
+    /*
+     * We prefer to not make NULL pointers accessible to QEMU.
+     * If we're in a chroot with no /proc, fall back to 1 page.
+     */
+    if (mmap_min_addr == 0) {
+        mmap_min_addr = qemu_host_page_size;
+        qemu_log_mask(CPU_LOG_PAGE,
+                      "host mmap_min_addr=0x%lx (fallback)\n",
+                      mmap_min_addr);
+    }
+
+    /*
+     * Prepare copy of argv vector for target.
+     */
+    target_argc = argc - optind;
+    target_argv = calloc(target_argc + 1, sizeof (char *));
+    if (target_argv == NULL) {
+        (void) fprintf(stderr, "Unable to allocate memory for target_argv\n");
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * If argv0 is specified (using '-0' switch) we replace
+     * argv[0] pointer with the given one.
+     */
+    i = 0;
+    if (argv0 != NULL) {
+        target_argv[i++] = strdup(argv0);
+    }
+    for (; i < target_argc; i++) {
+        target_argv[i] = strdup(argv[optind + i]);
+    }
+    target_argv[target_argc] = NULL;
+
+    /*
+     * Change root if requested wuth '-c'
+     */
+    if (qemu_chroot) {
+        if (chroot(qemu_chroot) < 0) {
+            error_report("chroot failed");
+            exit(1);
+        }
+        if (chdir("/")) {
+            error_report("not able to chdir to /: %s", strerror(errno));
+            exit(1);
+        }
+    }
+
     execfd = qemu_getauxval(AT_EXECFD);
     if (execfd == 0) {
         execfd = open(exec_path, O_RDONLY);
@@ -746,59 +821,6 @@ int main(int argc, char **argv, char **envp)
     target_environ = envlist_to_environ(envlist, NULL);
     envlist_free(envlist);
 
-    /*
-     * Read in mmap_min_addr kernel parameter.  This value is used
-     * When loading the ELF image to determine whether guest_base
-     * is needed.  It is also used in mmap_find_vma.
-     */
-    {
-        FILE *fp;
-
-        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
-            unsigned long tmp;
-            if (fscanf(fp, "%lu", &tmp) == 1 && tmp != 0) {
-                mmap_min_addr = tmp;
-                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
-                              mmap_min_addr);
-            }
-            fclose(fp);
-        }
-    }
-
-    /*
-     * We prefer to not make NULL pointers accessible to QEMU.
-     * If we're in a chroot with no /proc, fall back to 1 page.
-     */
-    if (mmap_min_addr == 0) {
-        mmap_min_addr = qemu_host_page_size;
-        qemu_log_mask(CPU_LOG_PAGE,
-                      "host mmap_min_addr=0x%lx (fallback)\n",
-                      mmap_min_addr);
-    }
-
-    /*
-     * Prepare copy of argv vector for target.
-     */
-    target_argc = argc - optind;
-    target_argv = calloc(target_argc + 1, sizeof (char *));
-    if (target_argv == NULL) {
-        (void) fprintf(stderr, "Unable to allocate memory for target_argv\n");
-        exit(EXIT_FAILURE);
-    }
-
-    /*
-     * If argv0 is specified (using '-0' switch) we replace
-     * argv[0] pointer with the given one.
-     */
-    i = 0;
-    if (argv0 != NULL) {
-        target_argv[i++] = strdup(argv0);
-    }
-    for (; i < target_argc; i++) {
-        target_argv[i] = strdup(argv[optind + i]);
-    }
-    target_argv[target_argc] = NULL;
-
     ts = g_new0(TaskState, 1);
     init_task_state(ts);
     /* build Task State */
-- 
2.28.0


