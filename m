Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34E32662B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:13:57 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFggd-0007eg-0v
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFgbP-0003oq-05
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFgbF-0001bb-BZ
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614359300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E2RgQqc4LXJmIbtacf1EgV5LUJ345hehTop/uhGhYX0=;
 b=PYn//A4LJi5PmtDBnZUs/+6idimAQ3bFSIrPR9PSo8vSNN7+mDL7OE4y+LoiYiCEM9UN24
 0kEXoQgGgEdwtw2+Q4ZF8F4bWN1iMqrO0wTvc9QY3GZ/Crek/r5YCsYxkovVJPYv5ki/sH
 AtABDMT1tIJEN/pJfpQxVhOxfiHkxd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-uwOkV1X7M_qZHAU950pcoQ-1; Fri, 26 Feb 2021 12:08:18 -0500
X-MC-Unique: uwOkV1X7M_qZHAU950pcoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25DBC80403A
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 17:08:17 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D745760BE5;
 Fri, 26 Feb 2021 17:08:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-config: add error propagation to qemu_config_parse
Date: Fri, 26 Feb 2021 12:08:16 -0500
Message-Id: <20210226170816.231173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables some simplification of vl.c via error_fatal, and improves
error messages.  Before:

Before:
  $ ./qemu-system-x86_64 -readconfig .
  qemu-system-x86_64: error reading file
  qemu-system-x86_64: -readconfig .: read config .: Invalid argument
  $ /usr/libexec/qemu-kvm -readconfig foo
  qemu-kvm: -readconfig foo: read config foo: No such file or directory

After:

  $ ./qemu-system-x86_64 -readconfig .
  qemu-system-x86_64: -readconfig .: error reading file: Is a directory
  $ ./qemu-system-x86_64 -readconfig foo
  qemu-system-x86_64: -readconfig foo: Cannot read config file foo: No such file or directory

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
index e67f91dd37..e80859c40d 100644
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
@@ -2640,9 +2642,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (userconfig) {
-        if (qemu_read_default_config_file() < 0) {
-            exit(1);
-        }
+        qemu_read_default_config_file(&error_fatal);
     }
 
     /* second pass of option parsing */
@@ -3330,15 +3330,8 @@ void qemu_init(int argc, char **argv, char **envp)
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
index e2a700b284..af89df109d 100644
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
+        error_setg_errno(errp, errno, "error reading file");
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
+        error_setg_errno(errp, errno, "Cannot read config file %s", filename);
         return -errno;
     }
 
-    ret = qemu_config_parse(f, vm_config_groups, filename);
+    ret = qemu_config_parse(f, vm_config_groups, filename, errp);
     fclose(f);
     return ret;
 }
-- 
2.26.2


