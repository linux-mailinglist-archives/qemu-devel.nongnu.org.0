Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03162FA6B6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:52:20 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XlL-0001Yl-Sq
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRT-0002R3-Gb
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRI-0001VD-Te
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW0TiJdadx8IwKGZP+oSId/5ie9shy1Wn9Gkycwb1GA=;
 b=UFsvmOhtuUioy2Gv6bzex+zwErLQaate9LI/alOz8Sad6Y7knw9gAFmj7OBj/QvInnQbFK
 SyaQSz81tuMwTLcmyebH548qAchg3P00PiBEnxMlrvmfu27p9IvpuGCjmD5K0iz8LbUwSj
 hV0J/YWVSdhMywg0K6G6Zd2qs3OTpFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vWNQ1-RhO06WUs7rKrUzhw-1; Mon, 18 Jan 2021 11:31:33 -0500
X-MC-Unique: vWNQ1-RhO06WUs7rKrUzhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91116190B2A0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8C110013C0;
 Mon, 18 Jan 2021 16:31:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/25] qemu-config: add error propagation to qemu_config_parse
Date: Mon, 18 Jan 2021 11:31:00 -0500
Message-Id: <20210118163113.780171-13-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables some simplification of vl.c via error_fatal.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c           |  3 +--
 include/qemu/config-file.h |  4 ++--
 softmmu/vl.c               | 30 ++++++++++++------------------
 util/qemu-config.c         | 20 ++++++++++----------
 4 files changed, 25 insertions(+), 32 deletions(-)

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
index 7d26fe3816..da6f4690b7 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -10,9 +10,9 @@ void qemu_add_opts(QemuOptsList *list);
 void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp);
 
-int qemu_read_config_file(const char *filename);
+int qemu_read_config_file(const char *filename, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index d34307bf11..d991919155 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2056,17 +2056,20 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
-static int qemu_read_default_config_file(void)
+static void qemu_read_default_config_file(Error **errp)
 {
     int ret;
+    Error *local_err = NULL;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file);
-    if (ret < 0 && ret != -ENOENT) {
-        return ret;
+    ret = qemu_read_config_file(file, &local_err);
+    if (ret < 0) {
+        if (ret == -ENOENT) {
+            error_free(local_err);
+        } else {
+            error_propagate(errp, local_err);
+        }
     }
-
-    return 0;
 }
 
 static int qemu_set_option(const char *str)
@@ -2622,9 +2625,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (userconfig) {
-        if (qemu_read_default_config_file() < 0) {
-            exit(1);
-        }
+        qemu_read_default_config_file(&error_fatal);
     }
 
     /* second pass of option parsing */
@@ -3312,15 +3313,8 @@ void qemu_init(int argc, char **argv, char **envp)
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
index a4a1324c68..d0629f4960 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -308,7 +308,7 @@ void qemu_add_opts(QemuOptsList *list)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
 {
     char line[1024], group[64], id[64], arg[64], value[1024];
     Location loc;
@@ -333,7 +333,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group with id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, id, 1, NULL);
@@ -344,7 +344,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group without id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, NULL, 0, &error_abort);
@@ -356,20 +356,19 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
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
+        error_setg(errp, "error reading file");
         goto out;
     }
     res = count;
@@ -378,16 +377,17 @@ out:
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



