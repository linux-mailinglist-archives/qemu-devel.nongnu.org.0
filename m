Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B43438ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 07:28:23 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mesX0-0008BG-Nx
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 01:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUj-0005OK-2Y
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mesUh-0005ME-1D
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 01:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635139558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bjp40QDMjzLp4z/JRZN/dq3S4AhYW7hNmIAirog1dOg=;
 b=FE1iDTHloLvj6ECC1ApA+SIFevUGHhV5kjt/JaJ0lWU0Tyfm6BwsY0XwuoZAasOgXLcrnL
 Ou4af/Upnwg4OLg4KX4ySibGl0TelZT5fnohdZASz69zltFKIuxj+fmZvY4MncjYKltup2
 U+lETK9MT/Fh2B8qkudCS+LG/BsgILo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-mY2m8B7yPTaAOA1ppdHfRA-1; Mon, 25 Oct 2021 01:25:55 -0400
X-MC-Unique: mY2m8B7yPTaAOA1ppdHfRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FBE6802B52;
 Mon, 25 Oct 2021 05:25:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D6D060BF4;
 Mon, 25 Oct 2021 05:25:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E25B011380CD; Mon, 25 Oct 2021 07:25:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] qapi: Generalize command policy checking
Date: Mon, 25 Oct 2021 07:25:29 +0200
Message-Id: <20211025052532.3859634-7-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-1-armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code to check command policy can see special feature flag
'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
flag 'unstable' visible there as well, so I can add policy for it.

To let me make it visible, add member @special_features (a bitset of
QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
through qmp_register_command().  Then replace "QCO_DEPRECATED in
@flags" by QAPI_DEPRECATED in @special_features", and drop
QCO_DEPRECATED.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/qmp/dispatch.h          | 5 +++--
 monitor/misc.c                       | 6 ++++--
 qapi/qmp-dispatch.c                  | 2 +-
 qapi/qmp-registry.c                  | 4 +++-
 storage-daemon/qemu-storage-daemon.c | 3 ++-
 scripts/qapi/commands.py             | 9 ++++-----
 6 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 0ce88200b9..1e4240fd0d 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -25,7 +25,6 @@ typedef enum QmpCommandOptions
     QCO_ALLOW_OOB             =  (1U << 1),
     QCO_ALLOW_PRECONFIG       =  (1U << 2),
     QCO_COROUTINE             =  (1U << 3),
-    QCO_DEPRECATED            =  (1U << 4),
 } QmpCommandOptions;
 
 typedef struct QmpCommand
@@ -34,6 +33,7 @@ typedef struct QmpCommand
     /* Runs in coroutine context if QCO_COROUTINE is set */
     QmpCommandFunc *fn;
     QmpCommandOptions options;
+    unsigned special_features;
     QTAILQ_ENTRY(QmpCommand) node;
     bool enabled;
     const char *disable_reason;
@@ -42,7 +42,8 @@ typedef struct QmpCommand
 typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
 
 void qmp_register_command(QmpCommandList *cmds, const char *name,
-                          QmpCommandFunc *fn, QmpCommandOptions options);
+                          QmpCommandFunc *fn, QmpCommandOptions options,
+                          unsigned special_features);
 const QmpCommand *qmp_find_command(const QmpCommandList *cmds,
                                    const char *name);
 void qmp_disable_command(QmpCommandList *cmds, const char *name,
diff --git a/monitor/misc.c b/monitor/misc.c
index 3556b177f6..c2d227a07c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -230,11 +230,13 @@ static void monitor_init_qmp_commands(void)
 
     qmp_init_marshal(&qmp_commands);
 
-    qmp_register_command(&qmp_commands, "device_add", qmp_device_add, 0);
+    qmp_register_command(&qmp_commands, "device_add",
+                         qmp_device_add, 0, 0);
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
-                         qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
+                         qmp_marshal_qmp_capabilities,
+                         QCO_ALLOW_PRECONFIG, 0);
 }
 
 /* Set the current CPU defined by the user. Callers must hold BQL. */
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 7e943a0af5..8cca18c891 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                   "The command %s has not been found", command);
         goto out;
     }
-    if (cmd->options & QCO_DEPRECATED) {
+    if (cmd->special_features & 1u << QAPI_DEPRECATED) {
         switch (compat_policy.deprecated_input) {
         case COMPAT_POLICY_INPUT_ACCEPT:
             break;
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index f78c064aae..485bc5e6fc 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -16,7 +16,8 @@
 #include "qapi/qmp/dispatch.h"
 
 void qmp_register_command(QmpCommandList *cmds, const char *name,
-                          QmpCommandFunc *fn, QmpCommandOptions options)
+                          QmpCommandFunc *fn, QmpCommandOptions options,
+                          unsigned special_features)
 {
     QmpCommand *cmd = g_malloc0(sizeof(*cmd));
 
@@ -27,6 +28,7 @@ void qmp_register_command(QmpCommandList *cmds, const char *name,
     cmd->fn = fn;
     cmd->enabled = true;
     cmd->options = options;
+    cmd->special_features = special_features;
     QTAILQ_INSERT_TAIL(cmds, cmd, node);
 }
 
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 10a1a33761..52cf17e8ac 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -146,7 +146,8 @@ static void init_qmp_commands(void)
 
     QTAILQ_INIT(&qmp_cap_negotiation_commands);
     qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
-                         qmp_marshal_qmp_capabilities, QCO_ALLOW_PRECONFIG);
+                         qmp_marshal_qmp_capabilities,
+                         QCO_ALLOW_PRECONFIG, 0);
 }
 
 static int getopt_set_loc(int argc, char **argv, const char *optstring,
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index c8a975528f..21001bbd6b 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -26,6 +26,7 @@
     QAPISchemaModularCVisitor,
     build_params,
     ifcontext,
+    gen_special_features,
 )
 from .schema import (
     QAPISchema,
@@ -217,9 +218,6 @@ def gen_register_command(name: str,
                          coroutine: bool) -> str:
     options = []
 
-    if 'deprecated' in [f.name for f in features]:
-        options += ['QCO_DEPRECATED']
-
     if not success_response:
         options += ['QCO_NO_SUCCESS_RESP']
     if allow_oob:
@@ -231,10 +229,11 @@ def gen_register_command(name: str,
 
     ret = mcgen('''
     qmp_register_command(cmds, "%(name)s",
-                         qmp_marshal_%(c_name)s, %(opts)s);
+                         qmp_marshal_%(c_name)s, %(opts)s, %(feats)s);
 ''',
                 name=name, c_name=c_name(name),
-                opts=' | '.join(options) or 0)
+                opts=' | '.join(options) or 0,
+                feats=gen_special_features(features))
     return ret
 
 
-- 
2.31.1


