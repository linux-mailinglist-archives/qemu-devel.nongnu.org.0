Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF07465E95
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:18:47 +0100 (CET)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgMg-0000E8-RI
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9M-0005T1-9z
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9I-0006EY-W0
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rEbd8tOszZohvM1hzIsT3+OdppvDgyOCcgQiUf6YvqE=;
 b=Pb+BM9/wDoYY5GxjAsU39sIGJ4038jXR4R/RoXS5tG0VXP3EvsXu4kHE5vn7mvQEN9K0q9
 //WlWFeUXx1f8DwqN2vJSB/0L7BS/aLx0kHca/fpl1LYEy0FR3LTBaQSNP7SP0+Op/Rqmv
 hlcpXrrDtjDqHZaoW85Ahk4Ov1KPeWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-aHBJg7tVMgeDxfg_C5RyIQ-1; Thu, 02 Dec 2021 02:04:53 -0500
X-MC-Unique: aHBJg7tVMgeDxfg_C5RyIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22B6183DD25;
 Thu,  2 Dec 2021 07:04:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95FD35D6BA;
 Thu,  2 Dec 2021 07:04:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1536F113860F; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 02/11] vl: Drop x-exit-preconfig
Date: Thu,  2 Dec 2021 08:04:41 +0100
Message-Id: <20211202070450.264743-3-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The startup code is split between qemu_init() and
qmp_x_exit_preconfig().  Cutting off the CLI leaves the QMP command
useless.  Drop it, and inline the startup code back into qemu_init().
I'm going to provide more general replacement shortly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/misc.json     | 27 -------------------------
 monitor/hmp-cmds.c |  8 --------
 softmmu/vl.c       | 50 ++++++++++++++++++----------------------------
 hmp-commands.hx    | 18 -----------------
 4 files changed, 19 insertions(+), 84 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 358548abe1..45e6ee104e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -174,33 +174,6 @@
 ##
 { 'command': 'cont' }
 
-##
-# @x-exit-preconfig:
-#
-# Exit from "preconfig" state
-#
-# This command makes QEMU exit the preconfig state and proceed with
-# VM initialization using configuration data provided on the command line
-# and via the QMP monitor during the preconfig state. The command is only
-# available during the preconfig state (i.e. when the --preconfig command
-# line option was in use).
-#
-# Features:
-# @unstable: This command is experimental.
-#
-# Since 3.0
-#
-# Returns: nothing
-#
-# Example:
-#
-# -> { "execute": "x-exit-preconfig" }
-# <- { "return": {} }
-#
-##
-{ 'command': 'x-exit-preconfig', 'allow-preconfig': true,
-  'features': [ 'unstable' ] }
-
 ##
 # @human-monitor-command:
 #
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..6865ed6010 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -931,14 +931,6 @@ void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
     qmp_system_powerdown(NULL);
 }
 
-void hmp_exit_preconfig(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    qmp_x_exit_preconfig(&err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_cpu(Monitor *mon, const QDict *qdict)
 {
     int64_t cpu_index;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2bad7a437e..39c67b91c4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -134,7 +134,6 @@ static const char *accelerators;
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
-static bool preconfig_requested;
 static ram_addr_t ram_size;
 static DisplayOptions dpy;
 
@@ -945,34 +944,6 @@ static void qemu_machine_creation_done(void)
     }
 }
 
-void qmp_x_exit_preconfig(Error **errp)
-{
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
-        error_setg(errp, "The command is permitted only before machine initialization");
-        return;
-    }
-
-    qemu_init_board();
-    qemu_machine_creation_done();
-
-    if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
-    }
-
-    if (incoming) {
-        Error *local_err = NULL;
-        if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
-            if (local_err) {
-                error_reportf_err(local_err, "-incoming %s: ", incoming);
-                exit(1);
-            }
-        }
-    } else if (autostart) {
-        qmp_cont(NULL);
-    }
-}
-
 void qemu_init(int argc, char **argv, char **envp)
 {
     MachineClass *machine_class;
@@ -1103,9 +1074,26 @@ void qemu_init(int argc, char **argv, char **envp)
         exit(0);
     }
 
-    if (!preconfig_requested) {
-        qmp_x_exit_preconfig(&error_fatal);
+    qemu_init_board();
+    qemu_machine_creation_done();
+
+    if (replay_mode != REPLAY_MODE_NONE) {
+        replay_vmstate_init();
     }
+
+    if (incoming) {
+        Error *local_err = NULL;
+        if (strcmp(incoming, "defer") != 0) {
+            qmp_migrate_incoming(incoming, &local_err);
+            if (local_err) {
+                error_reportf_err(local_err, "-incoming %s: ", incoming);
+                exit(1);
+            }
+        }
+    } else if (autostart) {
+        qmp_cont(NULL);
+    }
+
     qemu_init_displays();
     accel_setup_post(current_machine);
     os_setup_post();
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136ac2..838c1f5969 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -53,24 +53,6 @@ SRST
   Quit the emulator.
 ERST
 
-    {
-        .name       = "exit_preconfig",
-        .args_type  = "",
-        .params     = "",
-        .help       = "exit the preconfig state",
-        .cmd        = hmp_exit_preconfig,
-        .flags      = "p",
-    },
-
-SRST
-``exit_preconfig``
-  This command makes QEMU exit the preconfig state and proceed with
-  VM initialization using configuration data provided on the command line
-  and via the QMP monitor during the preconfig state. The command is only
-  available during the preconfig state (i.e. when the --preconfig command
-  line option was in use).
-ERST
-
     {
         .name       = "block_resize",
         .args_type  = "device:B,size:o",
-- 
2.31.1


