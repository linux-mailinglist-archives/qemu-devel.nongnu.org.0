Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E038E4B0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:00:30 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8Jx-0002mp-QJ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ll8Hb-0007jL-2p
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:58:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ll8HX-0004qM-0i
 for qemu-devel@nongnu.org; Mon, 24 May 2021 06:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621853878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIrRF+BcVz53flEMCLyqe0dnwuEd36HQ4RVvDptDqA0=;
 b=REKzrsakd0LJTpjECHDs1LaUkWl45e16otyTSV2/L1LxjDZhwV6wESWEjM+8w3S709dpph
 TptYMmshzd89CMB0uuq0mPmWnoUbtqlmIBoliX8ILRHLwgf5O6wZP1G6/ZVRLWxxn5V/KA
 UD+pvhCF1/3R5t0pHM541xnnGB2WgjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-reDAriseMD6SN_lCM1hD_A-1; Mon, 24 May 2021 06:57:57 -0400
X-MC-Unique: reDAriseMD6SN_lCM1hD_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32BFB6DD32;
 Mon, 24 May 2021 10:57:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF0FA19C79;
 Mon, 24 May 2021 10:57:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] vl: plumb keyval-based options into -readconfig
Date: Mon, 24 May 2021 06:57:51 -0400
Message-Id: <20210524105752.3318299-3-pbonzini@redhat.com>
In-Reply-To: <20210524105752.3318299-1-pbonzini@redhat.com>
References: <20210524105752.3318299-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let -readconfig support parsing command line options into QDict or
QemuOpts.  This will be used to add back support for objects in
-readconfig.

Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v1->v2: fix overlong line

 include/block/qdict.h    |  2 -
 include/qapi/qmp/qdict.h |  3 ++
 softmmu/vl.c             | 83 ++++++++++++++++++++++++++++------------
 3 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/include/block/qdict.h b/include/block/qdict.h
index d8cb502d7d..ced2acfb92 100644
--- a/include/block/qdict.h
+++ b/include/block/qdict.h
@@ -20,8 +20,6 @@ void qdict_join(QDict *dest, QDict *src, bool overwrite);
 void qdict_extract_subqdict(QDict *src, QDict **dst, const char *start);
 void qdict_array_split(QDict *src, QList **dst);
 int qdict_array_entries(QDict *src, const char *subqdict);
-QObject *qdict_crumple(const QDict *src, Error **errp);
-void qdict_flatten(QDict *qdict);
 
 typedef struct QDictRenames {
     const char *from;
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index 9934539c1b..d5b5430e21 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -64,4 +64,7 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
+QObject *qdict_crumple(const QDict *src, Error **errp);
+void qdict_flatten(QDict *qdict);
+
 #endif /* QDICT_H */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 47dfdd704f..5e8240b9d8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -121,6 +121,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2127,13 +2128,53 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+/*
+ * Return whether configuration group @group is stored in QemuOpts, or
+ * recorded as one or more QDicts by qemu_record_config_group.
+ */
+static bool is_qemuopts_group(const char *group)
+{
+    return true;
+}
+
+static void qemu_record_config_group(const char *group, QDict *dict,
+                                     bool from_json, Error **errp)
+{
+    abort();
+}
+
+/*
+ * Parse non-QemuOpts config file groups, pass the rest to
+ * qemu_config_do_parse.
+ */
+static void qemu_parse_config_group(const char *group, QDict *qdict,
+                                    void *opaque, Error **errp)
+{
+    QObject *crumpled;
+    if (is_qemuopts_group(group)) {
+        qemu_config_do_parse(group, qdict, opaque, errp);
+        return;
+    }
+
+    crumpled = qdict_crumple(qdict, errp);
+    if (!crumpled) {
+        return;
+    }
+    if (qobject_type(crumpled) != QTYPE_QDICT) {
+        assert(qobject_type(crumpled) == QTYPE_QLIST);
+        error_setg(errp, "Lists cannot be at top level of a configuration section");
+        return;
+    }
+    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+}
+
 static void qemu_read_default_config_file(Error **errp)
 {
     ERRP_GUARD();
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
+    ret = qemu_read_config_file(file, qemu_parse_config_group, errp);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(*errp);
@@ -2142,9 +2183,8 @@ static void qemu_read_default_config_file(Error **errp)
     }
 }
 
-static int qemu_set_option(const char *str)
+static void qemu_set_option(const char *str, Error **errp)
 {
-    Error *local_err = NULL;
     char group[64], id[64], arg[64];
     QemuOptsList *list;
     QemuOpts *opts;
@@ -2152,27 +2192,23 @@ static int qemu_set_option(const char *str)
 
     rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
     if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
-    }
-
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
-    }
-
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
+        error_setg(errp, "can't parse: \"%s\"", str);
+        return;
     }
 
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
+    if (!is_qemuopts_group(group)) {
+        error_setg(errp, "-set is not supported with %s", group);
+    } else {
+        list = qemu_find_opts_err(group, errp);
+        if (list) {
+            opts = qemu_opts_find(list, id);
+            if (!opts) {
+                error_setg(errp, "there is no %s \"%s\" defined", group, id);
+                return;
+            }
+            qemu_opt_set(opts, arg, str + offset + 1, errp);
+        }
     }
-    return 0;
 }
 
 static void user_register_global_props(void)
@@ -2766,8 +2802,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_set:
-                if (qemu_set_option(optarg) != 0)
-                    exit(1);
+                qemu_set_option(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
@@ -3399,7 +3434,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
+                qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
-- 
2.27.0



