Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B264D2C0DDD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:41:23 +0100 (CET)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khD1u-0004Ho-Q5
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcU-0003MG-GL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcN-0007pv-Id
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9vGObZRIC7nAUEZ3pR+p0NESAsMacm6JfzgB4QhQpU=;
 b=IrHDbD6CXKbTHP1IexHTy4Q+T8oqTsTZbGw/9gdFhCkDZnKIHSEp6PTgg2fmSSaQ8/KyJ3
 CQ41gsi8ZmZ51R+nfKruIx8ZW5Lqupi3dmNXYcR6ozQY60wsyRQctm0gWE6zcczJdI11vh
 KJwZ/OfaUn5iuoQ5wNcSKxIbJAC47R0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-deQF4Bk4MJOnPnkt4D-fXQ-1; Mon, 23 Nov 2020 09:14:56 -0500
X-MC-Unique: deQF4Bk4MJOnPnkt4D-fXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37BFF18B9EDC
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 066D05D9E3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/36] vl: remove separate preconfig main_loop
Date: Mon, 23 Nov 2020 09:14:26 -0500
Message-Id: <20201123141435.2726558-28-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move post-preconfig initialization to the x-exit-preconfig.  If preconfig
is not requested, just exit preconfig mode immediately with the QMP
command.

As a result, the preconfig loop will run with accel_setup_post
and os_setup_post restrictions (xen_restrict, chroot, etc.)
already done.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/runstate.h |  1 -
 monitor/qmp-cmds.c        |  9 ----
 softmmu/vl.c              | 95 +++++++++++++++++----------------------
 3 files changed, 41 insertions(+), 64 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index f760094858..e557f470d4 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -41,7 +41,6 @@ typedef enum WakeupReason {
     QEMU_WAKEUP_REASON_OTHER,
 } WakeupReason;
 
-void qemu_exit_preconfig_request(void);
 void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 501a3024c7..7ced7eb3e8 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -102,15 +102,6 @@ void qmp_system_powerdown(Error **errp)
     qemu_system_powerdown_request();
 }
 
-void qmp_x_exit_preconfig(Error **errp)
-{
-    if (qdev_hotplug) {
-        error_setg(errp, "The command is permitted only before machine initialization");
-        return;
-    }
-    qemu_exit_preconfig_request();
-}
-
 void qmp_cont(Error **errp)
 {
     BlockBackend *blk;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 95c62bdad4..aa11fc4871 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1313,7 +1313,6 @@ static pid_t shutdown_pid;
 static int powerdown_requested;
 static int debug_requested;
 static int suspend_requested;
-static bool preconfig_exit_requested = true;
 static WakeupReason wakeup_reason;
 static NotifierList powerdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(powerdown_notifiers);
@@ -1400,11 +1399,6 @@ static int qemu_debug_requested(void)
     return r;
 }
 
-void qemu_exit_preconfig_request(void)
-{
-    preconfig_exit_requested = true;
-}
-
 /*
  * Reset the VM. Issue an event unless @reason is SHUTDOWN_CAUSE_NONE.
  */
@@ -1626,10 +1620,6 @@ static bool main_loop_should_exit(void)
     RunState r;
     ShutdownCause request;
 
-    if (preconfig_exit_requested) {
-        preconfig_exit_requested = false;
-        return true;
-    }
     if (qemu_debug_requested()) {
         vm_stop(RUN_STATE_DEBUG);
     }
@@ -3517,6 +3507,43 @@ static void qemu_machine_creation_done(void)
     register_global_state();
 }
 
+void qmp_x_exit_preconfig(Error **errp)
+{
+    if (qdev_hotplug) {
+        error_setg(errp, "The command is permitted only before machine initialization");
+        return;
+    }
+
+    qemu_init_board();
+    qemu_create_cli_devices();
+    qemu_machine_creation_done();
+
+    if (loadvm) {
+        Error *local_err = NULL;
+        if (load_snapshot(loadvm, &local_err) < 0) {
+            error_report_err(local_err);
+            autostart = 0;
+            exit(1);
+        }
+    }
+    if (replay_mode != REPLAY_MODE_NONE) {
+        replay_vmstate_init();
+    }
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
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -4081,7 +4108,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_preconfig:
-                preconfig_exit_requested = false;
                 preconfig_requested = true;
                 break;
             case QEMU_OPTION_enable_kvm:
@@ -4506,57 +4532,18 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
 
-    if (preconfig_requested) {
-        qemu_init_displays();
-    }
-
-    /* do monitor/qmp handling at preconfig state if requested */
-    qemu_main_loop();
-
-    qemu_init_board();
-
-    qemu_create_cli_devices();
-
-    /* initialize displays after all errors have been reported */
-    if (!preconfig_requested) {
-        qemu_init_displays();
-    }
-    qemu_machine_creation_done();
-
-    if (loadvm) {
-        Error *local_err = NULL;
-        if (load_snapshot(loadvm, &local_err) < 0) {
-            error_report_err(local_err);
-            autostart = 0;
-            exit(1);
-        }
-    }
-    if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
-    }
-
     if (vmstate_dump_file) {
         /* dump and exit */
         dump_vmstate_json_to_file(vmstate_dump_file);
         exit(0);
     }
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
 
+    qemu_init_displays();
+    if (!preconfig_requested) {
+        qmp_x_exit_preconfig(&error_fatal);
+    }
     accel_setup_post(current_machine);
     os_setup_post();
-
-    return;
 }
 
 void qemu_cleanup(void)
-- 
2.26.2



