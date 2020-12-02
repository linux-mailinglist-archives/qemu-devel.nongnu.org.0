Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9602CBA36
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:13:25 +0100 (CET)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP8S-0000fS-D2
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3j-0003gu-Dw
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3g-0004fP-VP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjjxMa7niNak+4B8OwlH39bC3M6TfeZq2Z5AzWs83Pw=;
 b=M4Lv5VBGZkLnHf/sP/oEJe8jglSjlIKCKnIxR7nQIhpLhwFtah3uITWbB0t9UOa0TlNkE+
 AtJMdQpvJ4rVvi2cWKYI5nQJuYff9ayltDEwcvC9iDTGr+1j9c1tKa6Yn1iq60pjm4QvU3
 K/KiVlECbrPD5x52wGWuNAqIFGd9oik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-8NpAmqM3Ng-kavlZQjqFcg-1; Wed, 02 Dec 2020 04:04:18 -0500
X-MC-Unique: 8NpAmqM3Ng-kavlZQjqFcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34C08581AA;
 Wed,  2 Dec 2020 09:03:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84A3E6085A;
 Wed,  2 Dec 2020 09:03:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/28] qemu-config: add error propagation to qemu_config_parse
Date: Wed,  2 Dec 2020 04:02:51 -0500
Message-Id: <20201202090305.4129317-15-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
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
index 4039bf3a39..16a5cd1046 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2045,17 +2045,20 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
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
@@ -2586,9 +2589,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (userconfig) {
-        if (qemu_read_default_config_file() < 0) {
-            exit(1);
-        }
+        qemu_read_default_config_file(&error_fatal);
     }
 
     /* second pass of option parsing */
@@ -3284,15 +3285,8 @@ void qemu_init(int argc, char **argv, char **envp)
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
index cc5be3c779..85f20079de 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -314,7 +314,7 @@ void qemu_add_opts(QemuOptsList *list)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
 {
     char line[1024], group[64], id[64], arg[64], value[1024];
     Location loc;
@@ -339,7 +339,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group with id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, id, 1, NULL);
@@ -350,7 +350,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group without id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, NULL, 0, &error_abort);
@@ -362,20 +362,19 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
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
@@ -384,16 +383,17 @@ out:
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



