Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD73E3735
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:50:13 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUCq-00011e-Hx
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5v-0006VN-RH
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:03 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:37708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5u-0004mi-9x
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:03 -0400
Received: by mail-io1-xd2f.google.com with SMTP id l20so17747665iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dePqRfLieOh5IHKSbQnDO4W7oo5sOeCIO/RCpBHQhuk=;
 b=sguoURSKSfvxvOkzXYw63YmXfnAHpfOdXQIG30HGiH/Ec1KyB/oOibpcat+YXdZ9YL
 dyPleshKlaWwtyMjUVAYAhajzZGwAQctzxDW9m94n/qVc+mPRcSLMwIzR/PaICL8MQiW
 1JPyybJRPGeO5VWsi9PDdAfYq4co9w+CRJz60ON+oSdLDPRYMOS7kMK8HczXoLI2k1nQ
 /ZNbrFL8sTD5qttBqzSAMw39LzScRgwoI4mTKHLHx121hCwxw0dnotn2kw49yEC3MoOw
 dNufwH1ifuWMyeiluFQabbiptQ29WC1ZLtOHAoQGqMMn7XTkSMfG9XsqnHdAsid1LMo3
 vZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dePqRfLieOh5IHKSbQnDO4W7oo5sOeCIO/RCpBHQhuk=;
 b=COuSu9UVxSlfJIx+Yy0C+G4Gs237gwKC+I+Ka02/NzZWqZRosl1USpkvQsvvih/QT6
 6gW1XFgx0UiwsCiOfM9WiMzmzRJ1DoffpyYcEfok+yBsqgvqb4ugDEyolbGp+1NQ0mID
 Z1ciw8lpHqLerXMJAvumObs5z5n+5IHnh3BUqHvWwQdAgLOwhj9uOuTsjgFizDTsxhos
 turIY66675ENgmkF8JvQSnD5gYufdXNjEJORXgJhxVmwvJxbUQY98x3qN/BxQxWoTQrZ
 cWWkYm4C56MNjUgIf0eoc5V+V2tZwYQTrbcZRW/URPsvJsJA61RXApjX4hrtIeP2/Lf+
 NaZg==
X-Gm-Message-State: AOAM532lwVOVlsyRRkXbxL5rGFuUkJfkMYobcd3wWYHxSFGiBaculLlD
 IbB0HWar08mFbvm96MD6XB/zH4K+/3+q9eOe
X-Google-Smtp-Source: ABdhPJwT6tC/dyvuLqQo01HemOBZvI/fm/zO6vHL/629ac08bLR+/Pc4vhJpjZxn3chEX5qeQ4x1JQ==
X-Received: by 2002:a92:6909:: with SMTP id e9mr16360ilc.231.1628372580849;
 Sat, 07 Aug 2021 14:43:00 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 10/49] bsd-user: pass the bsd_param into loader_exec
Date: Sat,  7 Aug 2021 15:42:03 -0600
Message-Id: <20210807214242.82385-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass the bsd_param into loader_exec, and adjust.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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
index 5c579d7c2c..65958729f1 100644
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
 
@@ -565,7 +569,8 @@ int main(int argc, char **argv)
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


