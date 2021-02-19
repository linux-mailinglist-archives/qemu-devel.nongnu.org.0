Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DE31F5E7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:30:15 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1B0-0004Ux-BL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lD19U-00041o-8a
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lD19Q-00076D-Ew
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613723314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WlzPDhsWyYmVpgt4p8xIle34xbaBixq/waUzAbD/t8E=;
 b=VCMFm4JUcKrFyCoo75LuFoGEu6HpLbs2ZJsc06nLneQNJmWsqDLUx4Fy3NfsGwq9FCYQOx
 UEu+WBA/UnrZ+zIBJk/3KozeBp2JW93rb53G89pPFVkCJXz9lh9P9IrrXsw1gC051Jyxje
 BvZlnrEQ49OoqLLSIoQRfeYwJM319dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-s6NgRdLyNo6wkOJEcww3zg-1; Fri, 19 Feb 2021 03:28:32 -0500
X-MC-Unique: s6NgRdLyNo6wkOJEcww3zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CD6C804041;
 Fri, 19 Feb 2021 08:28:31 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E82BA171FE;
 Fri, 19 Feb 2021 08:28:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3] qga: return a more explicit error on why a command is
 disabled
Date: Fri, 19 Feb 2021 12:28:14 +0400
Message-Id: <20210219082814.2661979-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qmp_disable_command() now takes an optional error string to return a
more explicit error message.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1928806

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
v3:
 - back to passing an error string, but appended to the error message.

 include/qapi/qmp/dispatch.h |  3 ++-
 qapi/qmp-dispatch.c         |  6 ++++--
 qapi/qmp-registry.c         | 10 ++++++----
 qga/main.c                  |  4 ++--
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1486cac3ef..bd15d9c35a 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -36,6 +36,7 @@ typedef struct QmpCommand
     QmpCommandOptions options;
     QTAILQ_ENTRY(QmpCommand) node;
     bool enabled;
+    const char *disable_reason;
 } QmpCommand;
 
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
@@ -44,7 +45,7 @@ void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options);
 const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
                                    const char *name);
-void qmp_disable_command(QmpCommandList *cmds, const char *name);
+void qmp_disable_command(QmpCommandList *cmds, const char *name, const char *err_msg);
 void qmp_enable_command(QmpCommandList *cmds, const char *name);
 
 bool qmp_command_is_enabled(const QmpCommand *cmd);
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0a2b20a4e4..5e597c76f7 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -157,8 +157,10 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     }
     if (!cmd->enabled) {
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
-                  "The command %s has been disabled for this instance",
-                  command);
+                  "Command %s has been disabled%s%s",
+                  command,
+                  cmd->disable_reason ? ": " : "",
+                  cmd->disable_reason ?: "");
         goto out;
     }
     if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 58c65b5052..f78c064aae 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -43,26 +43,28 @@ const QmpCommand *qmp_find_command(const QmpCommandList *cmds, const char *name)
 }
 
 static void qmp_toggle_command(QmpCommandList *cmds, const char *name,
-                               bool enabled)
+                               bool enabled, const char *disable_reason)
 {
     QmpCommand *cmd;
 
     QTAILQ_FOREACH(cmd, cmds, node) {
         if (strcmp(cmd->name, name) == 0) {
             cmd->enabled = enabled;
+            cmd->disable_reason = disable_reason;
             return;
         }
     }
 }
 
-void qmp_disable_command(QmpCommandList *cmds, const char *name)
+void qmp_disable_command(QmpCommandList *cmds, const char *name,
+                         const char *disable_reason)
 {
-    qmp_toggle_command(cmds, name, false);
+    qmp_toggle_command(cmds, name, false, disable_reason);
 }
 
 void qmp_enable_command(QmpCommandList *cmds, const char *name)
 {
-    qmp_toggle_command(cmds, name, true);
+    qmp_toggle_command(cmds, name, true, NULL);
 }
 
 bool qmp_command_is_enabled(const QmpCommand *cmd)
diff --git a/qga/main.c b/qga/main.c
index e7f8f3b161..f2cc8e89a3 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
     }
     if (!whitelisted) {
         g_debug("disabling command: %s", name);
-        qmp_disable_command(&ga_commands, name);
+        qmp_disable_command(&ga_commands, name, "the agent is in frozen state");
     }
 }
 
@@ -1329,7 +1329,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
         s->blacklist = config->blacklist;
         do {
             g_debug("disabling command: %s", (char *)l->data);
-            qmp_disable_command(&ga_commands, l->data);
+            qmp_disable_command(&ga_commands, l->data, NULL);
             l = g_list_next(l);
         } while (l);
     }
-- 
2.29.0


