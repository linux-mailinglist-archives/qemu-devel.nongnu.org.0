Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1F64CE6F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Uu6-0004yu-Hl; Wed, 14 Dec 2022 11:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uu0-0004wL-2w
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5Uty-0002PK-8x
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671036397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gYgBaHNx3tQZl1M3hxj/5HcZJFZVOxUIGoWyr9Kfbg=;
 b=QnNoIajyJxHjNG3/+0ZDQxmWLj7cQH1efqG8LY/1jdHn2cIZCqkp8MHwc6xGk3Vq8gmZW4
 vCmlI0X1EHPItxnxxy+YC0z8gyzgB2lO0hjIyV8gmdzLIfJpsz5jBQfesXIijy79kuCo5T
 /wNWzYBPOQtfkIB5Cq90RXYnWR3xkVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-wi_zSELrPEKNnSOogm8lqg-1; Wed, 14 Dec 2022 11:46:36 -0500
X-MC-Unique: wi_zSELrPEKNnSOogm8lqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12FE83C10EC6;
 Wed, 14 Dec 2022 16:46:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C29492C14;
 Wed, 14 Dec 2022 16:46:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4228221E6491; Wed, 14 Dec 2022 17:46:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 07/14] qemu-config: Make config_parse_qdict() return bool
Date: Wed, 14 Dec 2022 17:46:22 +0100
Message-Id: <20221214164629.919880-8-armbru@redhat.com>
In-Reply-To: <20221214164629.919880-1-armbru@redhat.com>
References: <20221214164629.919880-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This simplifies error checking.

Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221121085054.683122-7-armbru@redhat.com>
---
 include/qemu/config-file.h |  2 +-
 block/blkdebug.c           |  4 +---
 util/qemu-config.c         | 39 ++++++++++++++++++--------------------
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 321e7c7c03..b82a778123 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -22,7 +22,7 @@ int qemu_read_config_file(const char *filename, QEMUConfigCB *f, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
-void qemu_config_parse_qdict(QDict *options, QemuOptsList **lists,
+bool qemu_config_parse_qdict(QDict *options, QemuOptsList **lists,
                              Error **errp);
 
 #endif /* QEMU_CONFIG_FILE_H */
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 4265ca125e..ca65b043f0 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -297,9 +297,7 @@ static int read_config(BDRVBlkdebugState *s, const char *filename,
         }
     }
 
-    qemu_config_parse_qdict(options, config_groups, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!qemu_config_parse_qdict(options, config_groups, errp)) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 433488aa56..e983607b46 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -423,12 +423,12 @@ int qemu_read_config_file(const char *filename, QEMUConfigCB *cb, Error **errp)
     return ret;
 }
 
-static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
+static bool config_parse_qdict_section(QDict *options, QemuOptsList *opts,
                                        Error **errp)
 {
     QemuOpts *subopts;
-    QDict *subqdict;
-    QList *list = NULL;
+    g_autoptr(QDict) subqdict = NULL;
+    g_autoptr(QList) list = NULL;
     size_t orig_size, enum_size;
     char *prefix;
 
@@ -437,23 +437,23 @@ static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
     g_free(prefix);
     orig_size = qdict_size(subqdict);
     if (!orig_size) {
-        goto out;
+        return true;
     }
 
     subopts = qemu_opts_create(opts, NULL, 0, errp);
     if (!subopts) {
-        goto out;
+        return false;
     }
 
     if (!qemu_opts_absorb_qdict(subopts, subqdict, errp)) {
-        goto out;
+        return false;
     }
 
     enum_size = qdict_size(subqdict);
     if (enum_size < orig_size && enum_size) {
         error_setg(errp, "Unknown option '%s' for [%s]",
                    qdict_first(subqdict)->key, opts->name);
-        goto out;
+        return false;
     }
 
     if (enum_size) {
@@ -468,7 +468,7 @@ static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
         if (qdict_size(subqdict)) {
             error_setg(errp, "Unused option '%s' for [%s]",
                        qdict_first(subqdict)->key, opts->name);
-            goto out;
+            return false;
         }
 
         QLIST_FOREACH_ENTRY(list, list_entry) {
@@ -478,46 +478,43 @@ static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
             if (!section) {
                 error_setg(errp, "[%s] section (index %u) does not consist of "
                            "keys", opts->name, i);
-                goto out;
+                return false;
             }
 
             opt_name = g_strdup_printf("%s.%u", opts->name, i++);
             subopts = qemu_opts_create(opts, opt_name, 1, errp);
             g_free(opt_name);
             if (!subopts) {
-                goto out;
+                return false;
             }
 
             if (!qemu_opts_absorb_qdict(subopts, section, errp)) {
                 qemu_opts_del(subopts);
-                goto out;
+                return false;
             }
 
             if (qdict_size(section)) {
                 error_setg(errp, "[%s] section doesn't support the option '%s'",
                            opts->name, qdict_first(section)->key);
                 qemu_opts_del(subopts);
-                goto out;
+                return false;
             }
         }
     }
 
-out:
-    qobject_unref(subqdict);
-    qobject_unref(list);
+    return true;
 }
 
-void qemu_config_parse_qdict(QDict *options, QemuOptsList **lists,
+bool qemu_config_parse_qdict(QDict *options, QemuOptsList **lists,
                              Error **errp)
 {
     int i;
-    Error *local_err = NULL;
 
     for (i = 0; lists[i]; i++) {
-        config_parse_qdict_section(options, lists[i], &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
+        if (!config_parse_qdict_section(options, lists[i], errp)) {
+            return false;
         }
     }
+
+    return true;
 }
-- 
2.37.3


