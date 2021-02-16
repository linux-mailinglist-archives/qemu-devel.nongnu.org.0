Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B531CB51
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:40:23 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0aU-0006pO-Iu
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lC0Z6-0005id-7H
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lC0Z3-0000cM-9d
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=szKdsNJtEr/a6XnD2Jd+oSRCBzyNgM1CmD5Kl3JBUYM=;
 b=DxkGZRsxYWpB8RDvKQM+E8Pd/g8aa5o6lqnFH8AExzqFuHIuQh9d5JEpnVoktKcU64cUsI
 kpc3YdtluSch5/xK2yaqMleg6j8h+5x5phpSQvVGYgSa8Qn3ZySiJQWHKkhtf4NappZEyR
 PvFOl1Kb62Jx+IYdCIOi/z0JWXHJax8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-6qcP7E0XNrqW03Y9T7SxCA-1; Tue, 16 Feb 2021 08:38:49 -0500
X-MC-Unique: 6qcP7E0XNrqW03Y9T7SxCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0698080196C;
 Tue, 16 Feb 2021 13:38:42 +0000 (UTC)
Received: from localhost (unknown [10.36.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C708F5C1B4;
 Tue, 16 Feb 2021 13:38:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: return a more explicit error on why a command is disabled
Date: Tue, 16 Feb 2021 17:38:37 +0400
Message-Id: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
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
 include/qapi/qmp/dispatch.h | 3 ++-
 qapi/qmp-dispatch.c         | 2 +-
 qapi/qmp-registry.c         | 9 +++++----
 qga/main.c                  | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 1486cac3ef..d50420cdd8 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -36,6 +36,7 @@ typedef struct QmpCommand
     QmpCommandOptions options;
     QTAILQ_ENTRY(QmpCommand) node;
     bool enabled;
+    const char *err_msg;
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
index 0a2b20a4e4..ce4bf56b2c 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -157,7 +157,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
     }
     if (!cmd->enabled) {
         error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
-                  "The command %s has been disabled for this instance",
+                  cmd->err_msg ?: "The command %s has been disabled for this instance",
                   command);
         goto out;
     }
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 58c65b5052..ddc49b8f2d 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -43,26 +43,27 @@ const QmpCommand *qmp_find_command(const QmpCommandList *cmds, const char *name)
 }
 
 static void qmp_toggle_command(QmpCommandList *cmds, const char *name,
-                               bool enabled)
+                               bool enabled, const char *err_msg)
 {
     QmpCommand *cmd;
 
     QTAILQ_FOREACH(cmd, cmds, node) {
         if (strcmp(cmd->name, name) == 0) {
             cmd->enabled = enabled;
+            cmd->err_msg = err_msg;
             return;
         }
     }
 }
 
-void qmp_disable_command(QmpCommandList *cmds, const char *name)
+void qmp_disable_command(QmpCommandList *cmds, const char *name, const char *err_msg)
 {
-    qmp_toggle_command(cmds, name, false);
+    qmp_toggle_command(cmds, name, false, err_msg);
 }
 
 void qmp_enable_command(QmpCommandList *cmds, const char *name)
 {
-    qmp_toggle_command(cmds, name, true);
+    qmp_toggle_command(cmds, name, true, NULL);
 }
 
 bool qmp_command_is_enabled(const QmpCommand *cmd)
diff --git a/qga/main.c b/qga/main.c
index e7f8f3b161..c59b610691 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
     }
     if (!whitelisted) {
         g_debug("disabling command: %s", name);
-        qmp_disable_command(&ga_commands, name);
+        qmp_disable_command(&ga_commands, name, "The command was disabled after fsfreeze.");
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


