Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138834030A7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:01:53 +0200 (CEST)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjA8-0002uK-4Y
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2K-0005gF-Od
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:48 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2J-0000kp-1A
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:48 -0400
Received: by mail-il1-x132.google.com with SMTP id l10so156903ilh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13uIwIKejgalnxws+XzFC57N6RAgVKudYeg7SEKXCvk=;
 b=ITrZlAbT4rxIO4orNcwAhKKqYSqBZU77nRjBf61WNM28NcetVBBxdH/3rl+g26sOEI
 0+aYGaF7XY+3JlUhLqssm71eWLvEhycBpMv4rBMfdUdeynYM9/k6mXvXBTDbJoFDMveh
 LrHhg4oDqFzrkjpWBVjf9rzHp0BZ0/y7u2SOM+13an27e4sKF7t0A/ZlDEGFC2r1b86N
 3WgO4XvmqNl+Grn3TMDEkToG5onnkIHdL4UzoR+4tf+U+N0pCQ9RPCtN66l+EwItvU7L
 mMNEm9xVtyN0ZhzU7fdh0JiD3mG8l8QLNuDN+YHxrJ8ZqzQ8Okh9gcShpE5yFBdbEZyB
 ws4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13uIwIKejgalnxws+XzFC57N6RAgVKudYeg7SEKXCvk=;
 b=VUMOEsM4fKa1DFaMl/RyF9WOVzJQaVFtkRLtHvqwMUAr74sNvoTzLiEjLzXOqqZ0hQ
 NgEkiT/1dIFPOKfCvUyEkL642JiNqcXal2UJ2VP89UpPdgzYXAa+o6rG/R4P6QeT6dvr
 9nd27WpRbvARR8/MlkwyekItU4cKHwlx6KrtqqxsUXRvVXqKTbTCPNPlYeuOvhnSIrXf
 PInfKWSnzftBA3scS5WodZXOQ/q1BZLTtbudLv+CPzpOPaWcJVcbxT3nCqP5lfWmRAHp
 SBKcNqsSc3RR/lu72309weSjo6PA8f4omLGPyF/B1rbeJurU37eawmOyyxCDD3amhc7E
 HUlg==
X-Gm-Message-State: AOAM533V06bLFHLKYpuD2T6Tkl39zcRJtKXDVAAO1dbxeQqgFwOr4YSx
 fK6pDIev02Ke7Unq3qAGmqFgluJ3kQf+psIBa+U=
X-Google-Smtp-Source: ABdhPJzM73cfAszFkcwvk5u8sX8l5nc1GyWDb6ifqYivY20UH7yej9xqnBKUbSm4ozmj56y4V4+QIA==
X-Received: by 2002:a05:6e02:19ce:: with SMTP id
 r14mr313118ill.58.1631051625687; 
 Tue, 07 Sep 2021 14:53:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:44 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/42] bsd-user: pass the bsd_param into loader_exec
Date: Tue,  7 Sep 2021 15:52:58 -0600
Message-Id: <20210907215332.30737-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Pass the bsd_param into loader_exec, and adjust. We use it to track the
inital stack allocation and to set stack, open files, and other state
shared between bsdload.c and elfload.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 39c4a0f33c..1388c7a13d 100644
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
+    if (loader_exec(filename, argv + optind, target_environ, regs, info,
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


