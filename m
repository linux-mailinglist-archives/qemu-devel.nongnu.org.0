Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81446024D8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:59:59 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgZy-0000vY-Ns
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg66-0005g7-MI
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg62-0001F5-Kp
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGmqyWJ2Dtvzz9QRbAxVYqJ7oD7IR1AdCJy4OZd7Tuk=;
 b=grnNnazTkYnM43L74sKMrMkoBHKYSWn4QcQct+033g0J06ginbu4FNyTgRXV9SPg5uJFGr
 wcgcFWW9ccVswg6uHWwViaJarjhVavsytron2QId6NcLfuKxiIucAzpo55lWy/NLXD0b/7
 VI1iVk7M6KUyIxc4I7bU7nq8h5t2YEc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-XKKmJ8DmPVGNe6MFB1P1wg-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: XKKmJ8DmPVGNe6MFB1P1wg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F12EA185A792;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C05111DCE3;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C2BB21E6613; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 15/28] qapi misc: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:36 +0200
Message-Id: <20221018062849.3420573-16-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/misc.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/monitor/monitor.h |  3 +--
 monitor/hmp-cmds.c        |  2 +-
 monitor/misc.c            | 19 +++++--------------
 monitor/qmp-cmds.c        |  1 -
 softmmu/vl.c              |  2 +-
 util/qemu-config.c        | 17 +++++------------
 scripts/qapi/schema.py    |  1 -
 7 files changed, 13 insertions(+), 32 deletions(-)

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
index 8077ed82c9..63baf3f8c6 100644
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
index a51f0996cb..2663007dbc 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1131,7 +1131,7 @@ void monitor_fdsets_cleanup(void)
     }
 }
 
-AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
+AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
                       const char *opaque, Error **errp)
 {
     int fd;
@@ -1144,8 +1144,7 @@ AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
         goto error;
     }
 
-    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id,
-                                  has_opaque, opaque, errp);
+    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
     if (fdinfo) {
         return fdinfo;
     }
@@ -1213,12 +1212,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
 
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
@@ -1230,8 +1224,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
 }
 
 AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
-                                bool has_opaque, const char *opaque,
-                                Error **errp)
+                                const char *opaque, Error **errp)
 {
     MonFdset *mon_fdset = NULL;
     MonFdsetFd *mon_fdset_fd;
@@ -1299,9 +1292,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
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
index 81c8fdadf8..2a0c919472 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -51,7 +51,6 @@ NameInfo *qmp_query_name(Error **errp)
     NameInfo *info = g_malloc0(sizeof(*info));
 
     if (qemu_name) {
-        info->has_name = true;
         info->name = g_strdup(qemu_name);
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b464da25bc..e044979dfc 100644
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
index 5325f6bf80..95f61fc883 100644
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
@@ -245,8 +239,7 @@ static QemuOptsList machine_opts = {
     }
 };
 
-CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
-                                                          const char *option,
+CommandLineOptionInfoList *qmp_query_command_line_options(const char *option,
                                                           Error **errp)
 {
     CommandLineOptionInfoList *conf_list = NULL;
@@ -254,7 +247,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
     int i;
 
     for (i = 0; vm_config_groups[i] != NULL; i++) {
-        if (!has_option || !strcmp(option, vm_config_groups[i]->name)) {
+        if (!option || !strcmp(option, vm_config_groups[i]->name)) {
             info = g_malloc0(sizeof(*info));
             info->option = g_strdup(vm_config_groups[i]->name);
             if (!strcmp("drive", vm_config_groups[i]->name)) {
@@ -267,7 +260,7 @@ CommandLineOptionInfoList *qmp_query_command_line_options(bool has_option,
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
2.37.2


