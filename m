Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B06664C522
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:35:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUR-0003XW-Tt; Wed, 14 Dec 2022 02:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUN-0003TD-3a
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUI-0003et-Pi
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eniEyFKLifDi6SMu5FxMTCpkIgZYMu78BnAT8pDcmHw=;
 b=Bu6UGxY8m8Zjs8yUtmWb8KQ2Gb2OkdnyHZuRgX2LxDzHA6i8eZhcVumDIaeziro/fb+fBZ
 GqhIRmcTHszT+MuM3pmvghHnTHfjYopZNY8RV5SzNThdYSZJtQAOkeNRAlCsUgAjaHcEun
 nSntZbdDH3C09j7L+3J3F684V92HZuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-qy4hG7vlNpe6iVisAkP_eQ-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: qy4hG7vlNpe6iVisAkP_eQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE28B85CCE6
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 785512166B26;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78E8121E64B2; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 17/30] qapi misc: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:08 +0100
Message-Id: <20221214074721.731441-20-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/misc.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20221104160712.3005652-18-armbru@redhat.com>
---
 include/monitor/monitor.h |  3 +--
 monitor/hmp-cmds.c        |  2 +-
 monitor/misc.c            | 19 +++++--------------
 monitor/qmp-cmds.c        |  6 +-----
 softmmu/vl.c              |  2 +-
 util/qemu-config.c        | 17 +++++------------
 scripts/qapi/schema.py    |  1 -
 7 files changed, 14 insertions(+), 36 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 737e750670..1e6f4c9bd7 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -46,8 +46,7 @@ int monitor_read_password(MonitorHMP *mon, ReadLineFunc *readline_func,
                           void *opaque);
 
 AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
-                                bool has_opaque, const char *opaque,
-                                Error **errp);
+                                const char *opaque, Error **errp);
 int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags);
 void monitor_fdset_dup_fd_remove(int dup_fd);
 int64_t monitor_fdset_dup_fd_find(int dup_fd);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index aa71fdba11..c5c8cb593e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -104,7 +104,7 @@ void hmp_info_name(Monitor *mon, const QDict *qdict)
     NameInfo *info;
 
     info = qmp_query_name(NULL);
-    if (info->has_name) {
+    if (info->name) {
         monitor_printf(mon, "%s\n", info->name);
     }
     qapi_free_NameInfo(info);
diff --git a/monitor/misc.c b/monitor/misc.c
index 78790306b1..77aa5f1650 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1132,7 +1132,7 @@ void monitor_fdsets_cleanup(void)
     }
 }
 
-AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
+AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
                       const char *opaque, Error **errp)
 {
     int fd;
@@ -1145,8 +1145,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
         goto error;
     }
 
-    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id,
-                                  has_opaque, opaque, errp);
+    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
     if (fdinfo) {
         return fdinfo;
     }
@@ -1214,12 +1213,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
 
             fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
             fdsetfd_info->fd = mon_fdset_fd->fd;
-            if (mon_fdset_fd->opaque) {
-                fdsetfd_info->has_opaque = true;
-                fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
-            } else {
-                fdsetfd_info->has_opaque = false;
-            }
+            fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
 
             QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
         }
@@ -1231,8 +1225,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
 }
 
 AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
-                                bool has_opaque, const char *opaque,
-                                Error **errp)
+                                const char *opaque, Error **errp)
 {
     MonFdset *mon_fdset = NULL;
     MonFdsetFd *mon_fdset_fd;
@@ -1300,9 +1293,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
     mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
     mon_fdset_fd->fd = fd;
     mon_fdset_fd->removed = false;
-    if (has_opaque) {
-        mon_fdset_fd->opaque = g_strdup(opaque);
-    }
+    mon_fdset_fd->opaque = g_strdup(opaque);
     QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
 
     fdinfo = g_malloc0(sizeof(*fdinfo));
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 81c8fdadf8..f8ab5dd50f 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -50,11 +50,7 @@ NameInfo *qmp_query_name(Error **errp)
 {
     NameInfo *info = g_malloc0(sizeof(*info));
 
-    if (qemu_name) {
-        info->has_name = true;
-        info->name = g_strdup(qemu_name);
-    }
-
+    info->name = g_strdup(qemu_name);
     return info;
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5115221efe..798e1dc933 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -611,7 +611,7 @@ static int parse_add_fd(void *opaque, QemuOpts *opts, Error **errp)
     }
 
     /* add the duplicate fd, and optionally the opaque string, to the fd set */
-    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, !!fd_opaque, fd_opaque,
+    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque,
                                   &error_abort);
     g_free(fdinfo);
 
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 433488aa56..2467a07bd7 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -80,14 +80,8 @@ static CommandLineParameterInfoList *query_option_descs(const QemuOptDesc *desc)
             break;
         }
 
-        if (desc[i].help) {
-            info->has_help = true;
-            info->help = g_strdup(desc[i].help);
-        }
-        if (desc[i].def_value_str) {
-            info->has_q_default = true;
-            info->q_default = g_strdup(desc[i].def_value_str);
-        }
+        info->help = g_strdup(desc[i].help);
+        info->q_default = g_strdup(desc[i].def_value_str);
 
         QAPI_LIST_PREPEND(param_list, info);
     }
@@ -241,8 +235,7 @@ static QemuOptsList machine_opts = {
     }
 };
 
-CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
-                                                          const char *option,
+CommandLineOptionInfoList *qmp_query_command_line_options(const char *option,
                                                           Error **errp)
 {
     CommandLineOptionInfoList *conf_list = NULL;
@@ -250,7 +243,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
     int i;
 
     for (i = 0; vm_config_groups[i] != NULL; i++) {
-        if (!has_option || !strcmp(option, vm_config_groups[i]->name)) {
+        if (!option || !strcmp(option, vm_config_groups[i]->name)) {
             info = g_malloc0(sizeof(*info));
             info->option = g_strdup(vm_config_groups[i]->name);
             if (!strcmp("drive", vm_config_groups[i]->name)) {
@@ -263,7 +256,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
         }
     }
 
-    if (!has_option || !strcmp(option, "machine")) {
+    if (!option || !strcmp(option, "machine")) {
         info = g_malloc0(sizeof(*info));
         info->option = g_strdup("machine");
         info->parameters = query_option_descs(machine_opts.desc);
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ad5b665212..a34e25fdd7 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/misc.json',
             'qapi/net.json',
             'qapi/pci.json',
             'qapi/qdev.json',
-- 
2.37.3


