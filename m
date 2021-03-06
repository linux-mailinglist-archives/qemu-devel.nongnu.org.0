Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F632F986
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:59:04 +0100 (CET)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUeF-0003Gp-8G
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZu-0005yI-8B
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:35 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZs-00089X-KT
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so816004wmj.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENrDjQ3yvjkw1J/kmjEqPKOaLJXndkSJMGpd0qO5N8M=;
 b=heg9SL1JXErDRNTKCmrDzVWamMV8JZizsS3WMi87Uhwm+KbNbdwT3vxdCVTDk43h2h
 8riaFqwOB+pZzAa8c1/YwEsngzbIkBYOF/2EykFbU+aolGAetv2cL7NP5Ux5RvOGKZ41
 4BKyZ/bIxS6x9Qoy6WTiW89y8p3Lyxmjra9usrWNNY4e/7k5/wnkMp3OQ2cZ7TsUp5qB
 r5HG4fZ3iPKJKo4LG1180BylO8/dV8OWnmaWrXjU0X03JsI576yojAEEevA3BPm+W6mk
 PDFzM+zL+Yb0YWYLdZ8S9v1p74FIJRDWAm8GzFYyA8FDXTalTOMgv1xudpC10XHFatN6
 6WvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ENrDjQ3yvjkw1J/kmjEqPKOaLJXndkSJMGpd0qO5N8M=;
 b=qWyltjAKHob1041ZrK4Ps3sbyeLR0Lf5m0DDXffoTH7edGa5CLLCl5Msy7FOEQS83n
 Jb+MK+jvyNvkvvO6FNGDvDF/dwmAn6eu0eKwZ2vxmsxOmLGIM/dA0CvGZzddqSTehANy
 s8QA9odH/LAy78jbfB5Ax8xXbB8TdF5hWoGLd/xbQZq9ppuNAXLwQmLd4Y6LjP0j5Rid
 UjrOexVX1cvQHmqezSJvhsAa2PhVaa4ASusPTrRoXc6xwGtxdCCBrqYbss3+zTM9NC9D
 9yHrK6Vxgj8z6tu67s5p3cFdhCI/gb1gWrr/JMEC9MORTJ5WHc00UDSHp5VMBH3V/d57
 mUzQ==
X-Gm-Message-State: AOAM533cYOUG8CqqvbVDohON5NEwdiBUStg/3PutPL0TSzQcV5nBu8V/
 XYatRGbw/DEUmgvbhS1D9ypfvyTqokU=
X-Google-Smtp-Source: ABdhPJyxc5yIWpMA156y1Nr/YXDVO1LGkGlrnZfJ6Z60/ZkNlJnpSjXvf/ySJ6QOJOB+isClPFx0ww==
X-Received: by 2002:a1c:988c:: with SMTP id
 a134mr12956887wme.120.1615028071320; 
 Sat, 06 Mar 2021 02:54:31 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] qemu-config: add error propagation to qemu_config_parse
Date: Sat,  6 Mar 2021 11:54:08 +0100
Message-Id: <20210306105419.110503-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables some simplification of vl.c via error_fatal, and improves
error messages.  Before:

  $ ./qemu-system-x86_64 -readconfig .
  qemu-system-x86_64: error reading file
  qemu-system-x86_64: -readconfig .: read config .: Invalid argument
  $ /usr/libexec/qemu-kvm -readconfig foo
  qemu-kvm: -readconfig foo: read config foo: No such file or directory

After:

  $ ./qemu-system-x86_64 -readconfig .
  qemu-system-x86_64: -readconfig .: Cannot read config file: Is a directory
  $ ./qemu-system-x86_64 -readconfig foo
  qemu-system-x86_64: -readconfig foo: Could not open 'foo': No such file or directory

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210226170816.231173-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c           |  3 +--
 include/qemu/config-file.h |  5 +++--
 softmmu/vl.c               | 29 +++++++++++------------------
 util/qemu-config.c         | 23 ++++++++++++-----------
 4 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 5fe6172da9..7eaa8a28bf 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -279,9 +279,8 @@ static int read_config(BDRVBlkdebugState *s, const char *filename,
             return -errno;
         }
 
-        ret = qemu_config_parse(f, config_groups, filename);
+        ret = qemu_config_parse(f, config_groups, filename, errp);
         if (ret < 0) {
-            error_setg(errp, "Could not parse blkdebug config file");
             goto fail;
         }
     }
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 29226107bd..8d3e53ae4d 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -11,9 +11,10 @@ void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
 void qemu_config_write(FILE *fp);
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
+                      Error **errp);
 
-int qemu_read_config_file(const char *filename);
+int qemu_read_config_file(const char *filename, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7e8110bd6e..2f4958db2a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2062,17 +2062,19 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
-static int qemu_read_default_config_file(void)
+static void qemu_read_default_config_file(Error **errp)
 {
+    ERRP_GUARD();
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file);
-    if (ret < 0 && ret != -ENOENT) {
-        return ret;
+    ret = qemu_read_config_file(file, errp);
+    if (ret < 0) {
+        if (ret == -ENOENT) {
+            error_free(*errp);
+            *errp = NULL;
+        }
     }
-
-    return 0;
 }
 
 static int qemu_set_option(const char *str)
@@ -2633,9 +2635,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (userconfig) {
-        if (qemu_read_default_config_file() < 0) {
-            exit(1);
-        }
+        qemu_read_default_config_file(&error_fatal);
     }
 
     /* second pass of option parsing */
@@ -3323,15 +3323,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                {
-                    int ret = qemu_read_config_file(optarg);
-                    if (ret < 0) {
-                        error_report("read config %s: %s", optarg,
-                                     strerror(-ret));
-                        exit(1);
-                    }
-                    break;
-                }
+                qemu_read_config_file(optarg, &error_fatal);
+                break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
                 if (!olist) {
diff --git a/util/qemu-config.c b/util/qemu-config.c
index e2a700b284..670bd6ebca 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -350,7 +350,7 @@ void qemu_config_write(FILE *fp)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
 {
     char line[1024], group[64], id[64], arg[64], value[1024];
     Location loc;
@@ -375,7 +375,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group with id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, id, 1, NULL);
@@ -386,7 +386,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group without id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, NULL, 0, &error_abort);
@@ -398,21 +398,21 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             sscanf(line, " %63s = \"\"", arg) == 1) {
             /* arg = value */
             if (opts == NULL) {
-                error_report("no group defined");
+                error_setg(errp, "no group defined");
                 goto out;
             }
-            if (!qemu_opt_set(opts, arg, value, &local_err)) {
-                error_report_err(local_err);
+            if (!qemu_opt_set(opts, arg, value, errp)) {
                 goto out;
             }
             continue;
         }
-        error_report("parse error");
+        error_setg(errp, "parse error");
         goto out;
     }
     if (ferror(fp)) {
-        error_report("error reading file");
-        goto out;
+        loc_pop(&loc);
+        error_setg_errno(errp, errno, "Cannot read config file");
+        return res;
     }
     res = count;
 out:
@@ -420,16 +420,17 @@ out:
     return res;
 }
 
-int qemu_read_config_file(const char *filename)
+int qemu_read_config_file(const char *filename, Error **errp)
 {
     FILE *f = fopen(filename, "r");
     int ret;
 
     if (f == NULL) {
+        error_setg_file_open(errp, errno, filename);
         return -errno;
     }
 
-    ret = qemu_config_parse(f, vm_config_groups, filename);
+    ret = qemu_config_parse(f, vm_config_groups, filename, errp);
     fclose(f);
     return ret;
 }
-- 
2.29.2



