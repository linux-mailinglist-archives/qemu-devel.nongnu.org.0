Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEED2AF3AA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:34:05 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrCG-0001In-Iw
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4F-0008KN-QO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcr4C-0001n4-Ms
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605104744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqXNXi9fRRDcGyqa+T4f046tjbOG5b6Vv23Q69MGA2Q=;
 b=QfQkkfS1Kap6/ObsoXjvFtN8un4u9UuBUGnX1Y737sCwdePQScoOL84lAW+uYtd5i4go2c
 nlFSPAVgZEE65SrWqXHrhB8/r5gqACL4zPDHPCtm1XDUl8xC1HzXs3tVaOultldHMQIs3+
 UFVaWNRQ3Uqy/CqEBr1aXR5xxh0RUmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-nAluOhNdMaqf1OLpp13OmA-1; Wed, 11 Nov 2020 09:25:42 -0500
X-MC-Unique: nAluOhNdMaqf1OLpp13OmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2316417D
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:25:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38EE16115F;
 Wed, 11 Nov 2020 14:25:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] qemu-config: add error propagation to qemu_config_parse
Date: Wed, 11 Nov 2020 09:25:34 -0500
Message-Id: <20201111142537.1213209-10-pbonzini@redhat.com>
In-Reply-To: <20201111142537.1213209-1-pbonzini@redhat.com>
References: <20201111142537.1213209-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This enables some simplification of vl.c via error_fatal.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/blkdebug.c           |  3 +--
 include/qemu/config-file.h |  4 ++--
 softmmu/vl.c               | 24 +++++++-----------------
 util/qemu-config.c         | 20 ++++++++++----------
 4 files changed, 20 insertions(+), 31 deletions(-)

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
index 29226107bd..4e235f63ce 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -11,9 +11,9 @@ void qemu_add_drive_opts(QemuOptsList *list);
 int qemu_global_option(const char *str);
 
 void qemu_config_write(FILE *fp);
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp);
 
-int qemu_read_config_file(const char *filename);
+int qemu_read_config_file(const char *filename, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ac6fec732e..e46f286ad2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2041,17 +2041,16 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
-static int qemu_read_default_config_file(void)
+static void qemu_read_default_config_file(Error **errp)
 {
     int ret;
+    Error *local_err = NULL;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file);
+    ret = qemu_read_config_file(file, &local_err);
     if (ret < 0 && ret != -ENOENT) {
-        return ret;
+        error_propagate(errp, local_err);
     }
-
-    return 0;
 }
 
 static void user_register_global_props(void)
@@ -2598,9 +2597,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (userconfig) {
-        if (qemu_read_default_config_file() < 0) {
-            exit(1);
-        }
+        qemu_read_default_config_file(&error_fatal);
     }
 
     /* second pass of option parsing */
@@ -3292,15 +3289,8 @@ void qemu_init(int argc, char **argv, char **envp)
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
index 725e3d7e4b..7804333b5a 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -356,7 +356,7 @@ void qemu_config_write(FILE *fp)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
 {
     char line[1024], group[64], id[64], arg[64], value[1024];
     Location loc;
@@ -381,7 +381,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group with id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, id, 1, NULL);
@@ -392,7 +392,7 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
             /* group without id */
             list = find_list(lists, group, &local_err);
             if (local_err) {
-                error_report_err(local_err);
+                error_propagate(errp, local_err);
                 goto out;
             }
             opts = qemu_opts_create(list, NULL, 0, &error_abort);
@@ -404,20 +404,19 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname)
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
@@ -426,16 +425,17 @@ out:
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



