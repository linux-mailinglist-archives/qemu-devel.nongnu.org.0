Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE9454943
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:52:34 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMIb-0007aw-Vw
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME1-0004hK-1J
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnMDy-0000oo-T6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:48 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9C39421C69;
 Wed, 17 Nov 2021 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637160465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKDIuZwq+gAsKudbYFrvq0MH7a7EWDom6AXh82DmPE0=;
 b=zX2BBScleBt6eAEIfbdROvoLUaRf+qryi/wxcVSpsj2AEQ9qtjwrAIE3rH3pcQw/Odl7ye
 8lA0njEub89tBDZ3sS1LhV/86UPonzqtxHyoH8u7ajjDqIQt6zXJGXpIN4xX2EFMoib/ay
 7AfAAzpdTpdq1TYvYCnlarxLJrUTQks=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/5] qapi: Implement x-machine-init QMP command
Date: Wed, 17 Nov 2021 15:47:01 +0100
Message-Id: <20211117144703.16305-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117144703.16305-1-damien.hedde@greensocs.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, edgar.iglesias@xilinx.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mirela Grujic <mirela.grujic@greensocs.com>

The x-machine-init QMP command is available only if the -preconfig
option is used and the current machine initialization phase is
accel-created.

The command triggers QEMU to enter machine initialized phase and wait
for the QMP configuration. In the next commit, we will add the
possibility to create devices at this point. To exit the initialized
phase, use the existing x-exit-preconfig QMP command.

As part of preconfig mode, the command has the 'unstable' feature.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Alistair Francis <alistair.francis@wdc.com>

v3:
 + add 'unstable' feature
 + bump the target version to 7.0
 + fix the entrance check (and drop alistair ack-by). In previous
   version we were only checking we were not too early, we now check
   we are not too late too.
---
 qapi/machine.json | 27 +++++++++++++++++++++++++++
 softmmu/vl.c      | 19 +++++++++++++++----
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 8e9a8afb1d..39c2397629 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1617,3 +1617,30 @@
 { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
   'features' : ['unstable'],
   'allow-preconfig': true }
+
+##
+# @x-machine-init:
+#
+# Enter machine initialized phase
+#
+# Features:
+# @unstable: This command is part of the experimental preconfig mode.
+#
+# Since: 7.0
+#
+# Returns: nothing
+#
+# Notes: This command will trigger QEMU to execute initialization steps
+#        that are required to enter the machine initialized phase. The command
+#        is available only if the -preconfig command line option was passed and
+#        if the machine is currently in the accel-created phase.
+#
+# Example:
+#
+# -> { "execute": "x-machine-init" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'x-machine-init',
+  'features' : ['unstable'],
+  'allow-preconfig': true }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index df19b911e6..a3bbe7b249 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -123,6 +123,7 @@
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2636,10 +2637,16 @@ static void qemu_init_displays(void)
     }
 }
 
-static void qemu_init_board(void)
+void qmp_x_machine_init(Error **errp)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
 
+    if (phase_get() != MACHINE_INIT_PHASE_ACCEL_CREATED) {
+        error_setg(errp, "The command is permitted only when "
+                         "the machine is in accel-created phase");
+        return;
+    }
+
     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
         create_default_memdev(current_machine, mem_path);
@@ -2732,12 +2739,16 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
-        error_setg(errp, "The command is permitted only before machine initialization");
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
+        error_setg(errp, "The command is permitted only before "
+                         "the machine is ready");
         return;
     }
 
-    qemu_init_board();
+    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        qmp_x_machine_init(errp);
+    }
+
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
-- 
2.33.0


