Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088462DB351
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:10:37 +0100 (CET)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEmS-0007wQ-2A
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXQ-0003Ay-GY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXJ-0001Up-N8
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txE81bkRxS3YH817C4u+ziMQexClrI6RylZd68gE8g8=;
 b=QxUH2XBmuat0j3PST4LYp1e7WHLtgNzMNqMFp/yUEN81D2R0tXX8xJd+wpfxJuqFlaIwGd
 lABUEcxNHRblWJs/g22kcoxzGeKH+QscnUfJCJLHRLvN4dIwv12bnPAwdHjbBfNwN5YLhh
 HI5ISbGuAYHUXVdIZi26ECXw0S+2gOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-_gMx-HciPJyLpnXTWL04iA-1; Tue, 15 Dec 2020 12:54:53 -0500
X-MC-Unique: _gMx-HciPJyLpnXTWL04iA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C5659;
 Tue, 15 Dec 2020 17:54:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 897C5100238C;
 Tue, 15 Dec 2020 17:54:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
Date: Tue, 15 Dec 2020 12:54:16 -0500
Message-Id: <20201215175445.1272776-17-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>

The current default action of pausing a guest after a panic event
is received leaves the responsibility to resume guest execution to the
management layer. The reasons for this behavior are discussed here:
https://lore.kernel.org/qemu-devel/52148F88.5000509@redhat.com/

However, in instances like the case of older guests (Linux and
Windows) using a pvpanic device but missing support for the
PVPANIC_CRASHLOADED event, and Windows guests using the hv-crash
enlightenment, it is desirable to allow the guests to continue
running after sending a PVPANIC_PANICKED event. This allows such
guests to proceed to capture a crash dump and automatically reboot
without intervention of a management layer.

Add an option to avoid stopping a VM after a panic event is received,
by passing:

-action panic=none

in the command line arguments, or during runtime by using an upcoming
QMP command.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Message-Id: <1607705564-26264-3-git-send-email-alejandro.j.jimenez@oracle.com>
[Do not fix panic action in the variable, instead modify -no-shutdown. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/runstate-action.h |  1 +
 qapi/run-state.json              | 16 ++++++++++++++++
 qemu-options.hx                  |  3 +++
 softmmu/runstate-action.c        |  5 +++++
 softmmu/runstate.c               | 18 ++++++++++++++----
 softmmu/vl.c                     |  5 ++++-
 6 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/runstate-action.h b/include/sysemu/runstate-action.h
index 51a461c4ac..cff45a047b 100644
--- a/include/sysemu/runstate-action.h
+++ b/include/sysemu/runstate-action.h
@@ -14,5 +14,6 @@
 /* in softmmu/runstate-action.c */
 extern RebootAction reboot_action;
 extern ShutdownAction shutdown_action;
+extern PanicAction panic_action;
 
 #endif /* RUNSTATE_ACTION_H */
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 25e82d1be1..1f3b329f05 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -353,6 +353,18 @@
 { 'enum': 'ShutdownAction',
   'data': [ 'poweroff', 'pause' ] }
 
+##
+# @PanicAction:
+#
+# @none: Continue VM execution
+#
+# @pause: Pause the VM
+#
+# Since: 6.0
+##
+{ 'enum': 'PanicAction',
+  'data': [ 'poweroff', 'pause', 'none' ] }
+
 ##
 # @watchdog-set-action:
 #
@@ -372,6 +384,8 @@
 #
 # @shutdown: @ShutdownAction action taken on guest shutdown.
 #
+# @panic: @PanicAction action taken on guest panic.
+#
 # @watchdog: @WatchdogAction action taken when watchdog timer expires .
 #
 # Returns: Nothing on success.
@@ -383,12 +397,14 @@
 # -> { "execute": "set-action",
 #      "arguments": { "reboot": "shutdown",
 #                     "shutdown" : "pause",
+#                     "panic": "pause",
 #                     "watchdog": "inject-nmi" } }
 # <- { "return": {} }
 ##
 { 'command': 'set-action',
   'data': { '*reboot': 'RebootAction',
             '*shutdown': 'ShutdownAction',
+            '*panic': 'PanicAction',
             '*watchdog': 'WatchdogAction' },
   'allow-preconfig': true }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index eb55cd0eea..94cdfcf32e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
     "                   action when guest reboots [default=none]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
+    "-action panic=poweroff|pause|none\n"
+    "                   action when guest panics [default=poweroff]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
     QEMU_ARCH_ALL)
@@ -3911,6 +3913,7 @@ SRST
 
     Examples:
 
+    ``-action panic=none``
     ``-action reboot=shutdown,shutdown=pause``
     ``-watchdog i6300esb -action watchdog=pause``
 
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index 44de01adaf..99ce880886 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -15,6 +15,7 @@
 
 RebootAction reboot_action = REBOOT_ACTION_NONE;
 ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
+PanicAction panic_action = PANIC_ACTION_POWEROFF;
 
 /*
  * Receives actions to be applied for specific guest events
@@ -30,6 +31,10 @@ void qmp_set_action(bool has_reboot, RebootAction reboot,
         reboot_action = reboot;
     }
 
+    if (has_panic) {
+        panic_action = panic;
+    }
+
     if (has_watchdog) {
         qmp_watchdog_set_action(watchdog, errp);
     }
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index bd0522ed9e..636aab0add 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -469,13 +469,23 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     if (current_cpu) {
         current_cpu->crash_occurred = true;
     }
-    qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
-                                   !!info, info);
-    vm_stop(RUN_STATE_GUEST_PANICKED);
-    if (shutdown_action == SHUTDOWN_ACTION_POWEROFF) {
+    /*
+     * TODO:  Currently the available panic actions are: none, pause, and
+     * poweroff, but in principle debug and reset could be supported as well.
+     * Investigate any potential use cases for the unimplemented actions.
+     */
+    if (panic_action == PANIC_ACTION_PAUSE) {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
+                                        !!info, info);
+        vm_stop(RUN_STATE_GUEST_PANICKED);
+    } else if (panic_action == PANIC_ACTION_POWEROFF) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
+        vm_stop(RUN_STATE_GUEST_PANICKED);
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+    } else {
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN,
+                                        !!info, info);
     }
 
     if (info) {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6d1a7ebb08..3921a04f77 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -489,6 +489,9 @@ static QemuOptsList qemu_action_opts = {
         },{
             .name = "reboot",
             .type = QEMU_OPT_STRING,
+        },{
+            .name = "panic",
+            .type = QEMU_OPT_STRING,
         },{
             .name = "watchdog",
             .type = QEMU_OPT_STRING,
@@ -3212,7 +3215,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_no_shutdown:
                 olist = qemu_find_opts("action");
-                qemu_opts_parse_noisily(olist, "shutdown=pause", false);
+                qemu_opts_parse_noisily(olist, "panic=pause,shutdown=pause", false);
                 break;
             case QEMU_OPTION_show_cursor:
                 warn_report("The -show-cursor option is deprecated. Please "
-- 
2.26.2



