Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B031D5A1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:11:56 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCH07-00071L-56
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lCGyK-0006SU-MC
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lCGyE-0003h3-J2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613545796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZSUdrBRPPPxVgZzDnP5hw4/zEg9sFLZ0KUMcgAkdJVo=;
 b=Oz3y041jtCxtRcu3jnErf9/fFBAowtZw0+6qsl+ZWgo/b/8nYKH0HBuOYeBoarCL3V+6Jb
 VWsNzXGL8zhoEx5Lo2s0gaGgUQnxe3C46G1eSUnxxDnZ+KeoBn2fqqmSROG1O0gTdqjHfc
 DFkqZsPRgqwfKq+7BiiVNB32Li7FEvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-pNsuhB8ONXKCuKRz4RPQNA-1; Wed, 17 Feb 2021 02:09:53 -0500
X-MC-Unique: pNsuhB8ONXKCuKRz4RPQNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39B84100A623;
 Wed, 17 Feb 2021 07:09:52 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B110E10023B2;
 Wed, 17 Feb 2021 07:09:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qga: return a more explicit error on why a command is
 disabled
Date: Wed, 17 Feb 2021 11:09:44 +0400
Message-Id: <20210217070944.2371327-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qmp_disable_command() now takes an enum for the reason, to be able
to give more explicit error messages.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1928806

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

v2:
 - replace string with an enum for disabling reason
 - remove trailing dot

 include/qapi/qmp/dispatch.h | 12 ++++++++++--
 monitor/qmp-cmds-control.c  |  2 +-
 qapi/qmp-dispatch.c         | 10 +++++++++-
 qapi/qmp-registry.c         | 16 +++++++++-------
 qga/main.c                  |  4 ++--
 5 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1486cac3ef..fda9ffad73 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -28,6 +28,13 @@ typedef enum QmpCommandOptions
     QCO_COROUTINE             =  (1U << 3),
 } QmpCommandOptions;
 
+typedef enum QmpDisabled
+{
+    QMP_DISABLED_NONE,
+    QMP_DISABLED_GENERIC,
+    QMP_DISABLED_FROZEN,
+} QmpDisabled;
+
 typedef struct QmpCommand
 {
     const char *name;
@@ -35,7 +42,7 @@ typedef struct QmpCommand
     QmpCommandFunc *fn;
     QmpCommandOptions options;
     QTAILQ_ENTRY(QmpCommand) node;
-    bool enabled;
+    QmpDisabled disabled;
 } QmpCommand;
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
@@ -44,7 +51,8 @@ void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options);
 const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
                                    const char *name);
-void qmp_disable_command(QmpCommandList *cmds, const char *name);
+void qmp_disable_command(QmpCommandList *cmds, const char *name,
+                         QmpDisabled disabled);
 void qmp_enable_command(QmpCommandList *cmds, const char *name);
 
 bool qmp_command_is_enabled(const QmpCommand *cmd);
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 509ae870bd..94a8e133b6 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -107,7 +107,7 @@ static void query_commands_cb(const QmpCommand *cmd, void *opaque)
     CommandInfo *info;
     CommandInfoList **list = opaque;
 
-    if (!cmd->enabled) {
+    if (!qmp_command_is_enabled(cmd)) {
         return;
     }
 
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0a2b20a4e4..b65f670152 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -155,11 +155,19 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                   "The command %s has not been found", command);
         goto out;
     }
-    if (!cmd->enabled) {
+    switch (cmd->disabled) {
+    case QMP_DISABLED_FROZEN:
+        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
+                  "The command %s has been disabled after fsfreeze",
+                  command);
+        goto out;
+    case QMP_DISABLED_GENERIC:
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                   "The command %s has been disabled for this instance",
                   command);
         goto out;
+    case QMP_DISABLED_NONE:
+        break;
     }
     if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
         error_setg(&err, "The command %s does not support OOB",
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 58c65b5052..e39e3b449c 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -25,7 +25,7 @@ void qmp_register_command(QmpCommandList *cmds, const char *name,
 
     cmd->name = name;
     cmd->fn = fn;
-    cmd->enabled = true;
+    cmd->disabled = QMP_DISABLED_NONE;
     cmd->options = options;
     QTAILQ_INSERT_TAIL(cmds, cmd, node);
 }
@@ -43,31 +43,33 @@ const QmpCommand *qmp_find_command(const QmpCommandList *cmds, const char *name)
 }
 
 static void qmp_toggle_command(QmpCommandList *cmds, const char *name,
-                               bool enabled)
+                               QmpDisabled disabled)
 {
     QmpCommand *cmd;
 
     QTAILQ_FOREACH(cmd, cmds, node) {
         if (strcmp(cmd->name, name) == 0) {
-            cmd->enabled = enabled;
+            cmd->disabled = disabled;
             return;
         }
     }
 }
 
-void qmp_disable_command(QmpCommandList *cmds, const char *name)
+void qmp_disable_command(QmpCommandList *cmds, const char *name,
+                         QmpDisabled disabled)
 {
-    qmp_toggle_command(cmds, name, false);
+    assert(disabled != QMP_DISABLED_NONE);
+    qmp_toggle_command(cmds, name, disabled);
 }
 
 void qmp_enable_command(QmpCommandList *cmds, const char *name)
 {
-    qmp_toggle_command(cmds, name, true);
+    qmp_toggle_command(cmds, name, QMP_DISABLED_NONE);
 }
 
 bool qmp_command_is_enabled(const QmpCommand *cmd)
 {
-    return cmd->enabled;
+    return cmd->disabled != QMP_DISABLED_NONE;
 }
 
 const char *qmp_command_name(const QmpCommand *cmd)
diff --git a/qga/main.c b/qga/main.c
index e7f8f3b161..0dbf0cacd2 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
     }
     if (!whitelisted) {
         g_debug("disabling command: %s", name);
-        qmp_disable_command(&ga_commands, name);
+        qmp_disable_command(&ga_commands, name, QMP_DISABLED_FROZEN);
     }
 }
 
@@ -1329,7 +1329,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         s->blacklist = config->blacklist;
         do {
             g_debug("disabling command: %s", (char *)l->data);
-            qmp_disable_command(&ga_commands, l->data);
+            qmp_disable_command(&ga_commands, l->data, QMP_DISABLED_GENERIC);
             l = g_list_next(l);
         } while (l);
     }
-- 
2.29.0


