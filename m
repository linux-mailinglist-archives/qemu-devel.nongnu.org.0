Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4D38C484
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:23:18 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2JI-0005rW-UH
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk2HK-0003UR-S0
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk2HG-0007nC-BE
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621592468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkDCgCDEMk+BHCKGPRxdR773g5PB9L4d9uFwZavyI2E=;
 b=Z3oEkm55zhXUORdz13TGIsT9ieeEf4AX7SQobehMZJfbX2Vb5d35HQ9aFagofZuol1SMlM
 y7MVxHvoYq0J8etiup2xwPt5VeWWe4TlFWBA0QW0QiqEn08f6kqiqDEI1OyAeXz6oh2kN+
 s7Ge48HEV+EBqcZbvTle3x9ak31SeJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-0gOQk2b0OzexIYPO5PDIhQ-1; Fri, 21 May 2021 06:21:06 -0400
X-MC-Unique: 0gOQk2b0OzexIYPO5PDIhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB36E1083E90;
 Fri, 21 May 2021 10:21:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EF9C610B0;
 Fri, 21 May 2021 10:21:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] qemu-config: parse configuration files to a QDict
Date: Fri, 21 May 2021 06:21:02 -0400
Message-Id: <20210521102104.3271053-2-pbonzini@redhat.com>
In-Reply-To: <20210521102104.3271053-1-pbonzini@redhat.com>
References: <20210521102104.3271053-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the parser to put the values into a QDict and pass them
to a callback.  qemu_config_parse's QemuOpts creation is
itself turned into a callback function.

This is useful for -readconfig to support keyval-based options;
getting a QDict from the parser removes a roundtrip from
QDict to QemuOpts and then back to QDict.

Unfortunately there is a disadvantage in that semantic errors will
point to the last line of the group, because the entries of the QDict
do not have a location attached.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v1->v2: check for unrecognized entries in the QDict, move a loc_pop for
        better error messages

v2->v3: fix error propagation

 include/qemu/config-file.h |  7 ++-
 softmmu/vl.c               |  4 +-
 util/qemu-config.c         | 98 ++++++++++++++++++++++++++------------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 0500b3668d..f605423321 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_CONFIG_FILE_H
 #define QEMU_CONFIG_FILE_H
 
+typedef void QEMUConfigCB(const char *group, QDict *qdict, void *opaque, Error **errp);
+
 void qemu_load_module_for_opts(const char *group);
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
@@ -14,7 +16,10 @@ void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
                       Error **errp);
 
-int qemu_read_config_file(const char *filename, Error **errp);
+/* A default callback for qemu_read_config_file().  */
+void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp);
+
+int qemu_read_config_file(const char *filename, QEMUConfigCB *f, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6054f6f0b9..47dfdd704f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2133,7 +2133,7 @@ static void qemu_read_default_config_file(Error **errp)
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, errp);
+    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(*errp);
@@ -3399,7 +3399,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, &error_fatal);
+                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 34974c4b47..33143cd4be 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -2,6 +2,7 @@
 #include "block/qdict.h" /* for qdict_extract_subqdict() */
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qemu/error-report.h"
@@ -351,19 +352,19 @@ void qemu_config_write(FILE *fp)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
+static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
+                               const char *fname, Error **errp)
 {
-    char line[1024], group[64], id[64], arg[64], value[1024];
+    char line[1024], prev_group[64], group[64], arg[64], value[1024];
     Location loc;
-    QemuOptsList *list = NULL;
     Error *local_err = NULL;
-    QemuOpts *opts = NULL;
+    QDict *qdict = NULL;
     int res = -EINVAL, lno = 0;
     int count = 0;
 
     loc_push_none(&loc);
     while (fgets(line, sizeof(line), fp) != NULL) {
-        loc_set_file(fname, ++lno);
+        ++lno;
         if (line[0] == '\n') {
             /* skip empty lines */
             continue;
@@ -372,39 +373,39 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
             /* comment */
             continue;
         }
-        if (sscanf(line, "[%63s \"%63[^\"]\"]", group, id) == 2) {
-            /* group with id */
-            list = find_list(lists, group, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                goto out;
+        if (line[0] == '[') {
+            QDict *prev = qdict;
+            if (sscanf(line, "[%63s \"%63[^\"]\"]", group, value) == 2) {
+                qdict = qdict_new();
+                qdict_put_str(qdict, "id", value);
+                count++;
+            } else if (sscanf(line, "[%63[^]]]", group) == 1) {
+                qdict = qdict_new();
+                count++;
             }
-            opts = qemu_opts_create(list, id, 1, NULL);
-            count++;
-            continue;
-        }
-        if (sscanf(line, "[%63[^]]]", group) == 1) {
-            /* group without id */
-            list = find_list(lists, group, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                goto out;
+            if (qdict != prev) {
+                if (prev) {
+                    cb(prev_group, prev, opaque, &local_err);
+                    qobject_unref(prev);
+                    if (local_err) {
+                        error_propagate(errp, local_err);
+                        goto out;
+                    }
+                }
+                strcpy(prev_group, group);
+                continue;
             }
-            opts = qemu_opts_create(list, NULL, 0, &error_abort);
-            count++;
-            continue;
         }
+        loc_set_file(fname, lno);
         value[0] = '\0';
         if (sscanf(line, " %63s = \"%1023[^\"]\"", arg, value) == 2 ||
             sscanf(line, " %63s = \"\"", arg) == 1) {
             /* arg = value */
-            if (opts == NULL) {
+            if (qdict == NULL) {
                 error_setg(errp, "no group defined");
                 goto out;
             }
-            if (!qemu_opt_set(opts, arg, value, errp)) {
-                goto out;
-            }
+            qdict_put_str(qdict, arg, value);
             continue;
         }
         error_setg(errp, "parse error");
@@ -417,11 +418,48 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
     }
     res = count;
 out:
+    if (qdict) {
+        cb(group, qdict, opaque, errp);
+        qobject_unref(qdict);
+    }
     loc_pop(&loc);
     return res;
 }
 
-int qemu_read_config_file(const char *filename, Error **errp)
+void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
+{
+    QemuOptsList **lists = opaque;
+    const char *id = qdict_get_try_str(qdict, "id");
+    QemuOptsList *list;
+    QemuOpts *opts;
+    const QDictEntry *unrecognized;
+
+    list = find_list(lists, group, errp);
+    if (!list) {
+        return;
+    }
+
+    opts = qemu_opts_create(list, id, 1, errp);
+    if (!opts) {
+        return;
+    }
+    qemu_opts_absorb_qdict(opts, qdict, errp);
+    if (errp) {
+        return;
+    }
+    unrecognized = qdict_first(qdict);
+    if (unrecognized) {
+        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);
+        qemu_opts_del(opts);
+    }
+}
+
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
+{
+    return qemu_config_foreach(fp, qemu_config_do_parse, lists, fname, errp);
+}
+
+int qemu_read_config_file(const char *filename, QEMUConfigCB *cb, Error **errp)
 {
     FILE *f = fopen(filename, "r");
     int ret;
@@ -431,7 +469,7 @@ int qemu_read_config_file(const char *filename, Error **errp)
         return -errno;
     }
 
-    ret = qemu_config_parse(f, vm_config_groups, filename, errp);
+    ret = qemu_config_foreach(f, cb, vm_config_groups, filename, errp);
     fclose(f);
     return ret;
 }
-- 
2.27.0



