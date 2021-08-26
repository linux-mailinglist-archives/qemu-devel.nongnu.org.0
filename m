Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C63F8FD9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:21:01 +0200 (CEST)
Received: from localhost ([::1]:59680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMnv-0005AJ-Ln
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfp-0005fg-13
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:33 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfn-0006mt-CN
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:32 -0400
Received: by mail-il1-x12b.google.com with SMTP id v2so4687257ilg.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RR9Eb4tGe3RUp1JrfJwomFWx+r8AkMn1NRFTHBcD78Y=;
 b=qRzhqTcQAMSCMKbp9uVOCFWQg13z3d1inQAu1mamxE4+dmsQkUuva8tysLP5dcBZkg
 JUDO3gIl2emzuqKDfsHpPcJPlMBE1E6Q0hjvT/akKCXFF1B++FuFguLehI30fMnORo1T
 by0QBDMgcBvVYfaS3/BOKM7t2v/M6qgjxVOalk/qFgy3PQAJdo2m1on86KT12srvS8iK
 FwJm/MiUVdZF9yvTNql5nG+6TEX8csk7nInlbYjYOiD/nDXINtfHVmxgWYPZAjheIWGj
 7fGrLqwvt80+KpfDUQwL/mySLb6dQHYzioR6TvYJpB3OHM1Z7i7ZzctI1WpimDSOfYm+
 vVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RR9Eb4tGe3RUp1JrfJwomFWx+r8AkMn1NRFTHBcD78Y=;
 b=mIbwYlq3bY7sjm7DIYnQB6nMwj/in5G/cbNPow3Ixm5xNe0Cek4R5EaDM9jJIQbcBb
 ITVsphygDi7jycJxGqAZbLoLVwSfIRiVsnzRMmCFzgJnU/v1HZYS691IqYXc1iVE+CSh
 3q4ewezDnjY+U8PZAqvstPOnCOnZKtwVLlvkA6xLwhRE0rNifuKfPwSzZyTrHTtySnIz
 n1taRHaef0XdqsI5U+R0MQwrQQTHyP/4IuRfzQkDjinlQMrXyZOsaUYl0hXPNXLfkWA/
 NDOH0xJJaWdDz94hqYBsQpS6IVh0aZ/mim1lo2ob/OndvC0BNLy78JTNZxrbwyOe9sA/
 5ORA==
X-Gm-Message-State: AOAM533kBmdfI86KLXoz+PJwHQV5VGKuvEJe3SPFVcw4In0z7t0Ya/WL
 Ex+IIwzWWm7glZNTyQ9makWs9BegMHZQqedu
X-Google-Smtp-Source: ABdhPJzG0lh7Qsp0/TIErQI8QTJkCwWf3CQg61gQQmAol082VOFEWulAJreJZYkvD673sYM71sY0hw==
X-Received: by 2002:a05:6e02:1107:: with SMTP id
 u7mr3865152ilk.39.1630012350149; 
 Thu, 26 Aug 2021 14:12:30 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:29 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/43] bsd-user: pass the bsd_param into loader_exec
Date: Thu, 26 Aug 2021 15:11:26 -0600
Message-Id: <20210826211201.98877-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Pass the bsd_param into loader_exec, and adjust.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 37 +++++++++++++++++++------------------
 bsd-user/main.c    |  7 ++++++-
 bsd-user/qemu.h    |  3 ++-
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index ec71c5e923..5282a7c4f2 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -140,35 +140,36 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 }
 
 int loader_exec(const char *filename, char **argv, char **envp,
-                struct target_pt_regs *regs, struct image_info *infop)
+                struct target_pt_regs *regs, struct image_info *infop,
+                struct bsd_binprm *bprm)
 {
-    struct bsd_binprm bprm;
     int retval;
     int i;
 
-    bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
-    for (i = 0 ; i < MAX_ARG_PAGES ; i++) {     /* clear page-table */
-        bprm.page[i] = NULL;
+    bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
+    for (i = 0; i < MAX_ARG_PAGES; i++) {       /* clear page-table */
+        bprm->page[i] = NULL;
     }
     retval = open(filename, O_RDONLY);
     if (retval < 0) {
         return retval;
     }
-    bprm.fd = retval;
-    bprm.filename = (char *)filename;
-    bprm.argc = count(argv);
-    bprm.argv = argv;
-    bprm.envc = count(envp);
-    bprm.envp = envp;
 
-    retval = prepare_binprm(&bprm);
+    bprm->fd = retval;
+    bprm->filename = (char *)filename;
+    bprm->argc = count(argv);
+    bprm->argv = argv;
+    bprm->envc = count(envp);
+    bprm->envp = envp;
+
+    retval = prepare_binprm(bprm);
 
     if (retval >= 0) {
-        if (bprm.buf[0] == 0x7f
-                && bprm.buf[1] == 'E'
-                && bprm.buf[2] == 'L'
-                && bprm.buf[3] == 'F') {
-            retval = load_elf_binary(&bprm, regs, infop);
+        if (bprm->buf[0] == 0x7f
+                && bprm->buf[1] == 'E'
+                && bprm->buf[2] == 'L'
+                && bprm->buf[3] == 'F') {
+            retval = load_elf_binary(bprm, regs, infop);
         } else {
             fprintf(stderr, "Unknown binary format\n");
             return -1;
@@ -183,7 +184,7 @@ int loader_exec(const char *filename, char **argv, char **envp,
 
     /* Something went wrong, return the inode and free the argument pages*/
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
-        g_free(bprm.page[i]);
+        g_free(bprm->page[i]);
     }
     return retval;
 }
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 39c4a0f33c..7e1284c368 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -343,6 +343,7 @@ int main(int argc, char **argv)
     const char *log_mask = NULL;
     struct target_pt_regs regs1, *regs = &regs1;
     struct image_info info1, *info = &info1;
+    struct bsd_binprm bprm;
     TaskState ts1, *ts = &ts1;
     CPUArchState *env;
     CPUState *cpu;
@@ -499,6 +500,9 @@ int main(int argc, char **argv)
     /* Zero out regs */
     memset(regs, 0, sizeof(struct target_pt_regs));
 
+    /* Zero bsd params */
+    memset(&bprm, 0, sizeof(bprm));
+
     /* Zero out image_info */
     memset(info, 0, sizeof(struct image_info));
 
@@ -566,7 +570,8 @@ int main(int argc, char **argv)
         }
     }
 
-    if (loader_exec(filename, argv + optind, target_environ, regs, info) != 0) {
+    if (loader_exec(filename, argv+optind, target_environ, regs, info,
+                    &bprm) != 0) {
         printf("Error loading %s\n", filename);
         _exit(1);
     }
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c02e8a5ca1..5237e35f9c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -131,7 +131,8 @@ void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
                               abi_ulong stringp, int push_ptr);
 int loader_exec(const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop);
+                struct target_pt_regs *regs, struct image_info *infop,
+                struct bsd_binprm *bprm);
 
 int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                     struct image_info *info);
-- 
2.32.0


