Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173237F44D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:42:27 +0200 (CEST)
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6vK-0002s5-IG
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gT-000578-Q1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:05 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gR-0001Lq-RL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:05 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 41C3721CCE;
 Thu, 13 May 2021 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0L9WVsHpVsn+U2PyClRd9i7mpiz97H6Qub00HmSwQSE=;
 b=2Vlx9oSJGolKPfctJ0VAuWkd245ExgVz58AF9KHlbGTgNVFXAqF4QYImM0C6JpMrN0N8vA
 4Vc0c+0OG6ZBi+jSH7yUNzhl5rNN9nOVj5EJ6QhN7VNfbTzBbOQhoWX9Bjl63QD1wiU9yi
 dOGo3LKxgySvQxpD4ZHjTAqG0UkKlgQ=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/9] qapi: Implement 'next-machine-phase' command
Date: Thu, 13 May 2021 10:25:45 +0200
Message-Id: <20210513082549.114275-6-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mirela.grujic@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command will be used to control via QMP the advancing of machine
through initialization phases. The feature is needed to enable the
machine configuration via QMP.

The command triggers QEMU to advance the machine to the next init phase,
i.e. to execute initialization steps required to enter the next phase.
The command is used in combination with -preconfig command line option.

Note: advancing the machine to the final phase has the same effect as
executing 'x-exit-preconfig' command.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json          | 24 ++++++++++++++++++++++++
 include/sysemu/sysemu.h    |  3 +++
 hw/core/machine-qmp-cmds.c | 12 ++++++++++++
 softmmu/vl.c               |  3 +--
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 47bdbec817..968d67dd95 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1328,3 +1328,27 @@
 ##
 { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
              'allow-preconfig': true }
+
+##
+# @next-machine-phase:
+#
+# Increment machine initialization phase
+#
+# Since: #FIXME
+#
+# Returns: If successful, nothing
+#
+# Notes: This command will trigger QEMU to execute initialization steps
+#        that are required to enter the next machine initialization phase.
+#        If by incrementing the initialization phase the machine reaches
+#        the final phase, the guest will start running immediately unless
+#        the -S option is used. The command is available only if the
+#        -preconfig command line option was passed.
+#
+# Example:
+#
+# -> { "execute": "next-machine-phase" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'next-machine-phase', 'allow-preconfig': true }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667172..0df06d095d 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -2,6 +2,7 @@
 #define SYSEMU_H
 /* Misc. things related to the system emulator.  */
 
+#include "hw/qdev-core.h"
 #include "qemu/timer.h"
 #include "qemu/notify.h"
 #include "qemu/uuid.h"
@@ -20,6 +21,8 @@ void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
+void qemu_machine_enter_phase(MachineInitPhase target_phase, Error **errp);
+
 void configure_rtc(QemuOpts *opts);
 
 void qemu_init_subsystems(void);
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 23f837dadb..8aa743d59b 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -207,3 +207,15 @@ MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
 
     return status;
 }
+
+void qmp_next_machine_phase(Error **errp)
+{
+    MachineInitPhase target_phase = phase_get() + 1;
+
+    if (target_phase >= MACHINE_INIT_PHASE__MAX) {
+        error_setg(errp, "Cannot increment machine init phase any further");
+        return;
+    }
+
+    qemu_machine_enter_phase(target_phase, errp);
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 88f504aff9..0f402806f5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2578,8 +2578,7 @@ static void qemu_machine_creation_done(void)
     }
 }
 
-static void qemu_machine_enter_phase(MachineInitPhase target_phase,
-                                     Error **errp)
+void qemu_machine_enter_phase(MachineInitPhase target_phase, Error **errp)
 {
     /* target phases before initialization are not handled here */
     if (target_phase < MACHINE_INIT_PHASE_INITIALIZED) {
-- 
2.25.1


