Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CF37F413
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:31:41 +0200 (CEST)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6ku-0008Hj-7w
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gI-0004j2-QG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:54 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gF-0001Dk-Gj
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:26:54 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BBA0821C39;
 Thu, 13 May 2021 08:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/atZYjSvZ3AvjWV8ApwNQtHVspelNgQxRu1GjX90r3E=;
 b=6RWKqtxxRonwa5Jk6ADW3CBw51R/H13Ub6PuppW71LirFzF/KI83AZ55BpGBGSmo6EDMMN
 ftO6eWRZptMsD0DwvcUjBT/eDMrrjQuglkaVnifZjz+tj0KkfA8YyS9/kkwPVIGjvcBFEK
 YXBETqntylIG2GswkIV79fmkStN8DyY=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/9] vl: Allow finer control in advancing machine through
 phases
Date: Thu, 13 May 2021 10:25:41 +0200
Message-Id: <20210513082549.114275-2-mirela.grujic@greensocs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513082549.114275-1-mirela.grujic@greensocs.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In addition to the existing preconfig approach, which allows configuring
the machine via QMP before the machine is initialized, we need the ability
to configure the machine right after it's initialized. This patch will
enable doing that in a scalable fashion as follows.

The basic idea is to group machine initialization steps into chunks
that need to be executed to advance machine initialization from one
phase to the next one. Then, we add a finer control to allow executing
only a chunk, i.e. to advance machine initialization to the next phase.
Between the phases, we would configure the machine properties via QMP,
add devices, etc. (depends on the phase). Advancing the machine to the
next initialization phase would also be controllable via a QMP command.

For example, the machine configuration could look like this:
1) Run QEMU with existing -preconfig command line option (this will
   cause QEMU to wait before the machine is initialized)
Then, using QMP commands from a client:
2) Perform configuration that needs to be done before the machine
   is initialized
3) Advance machine initialization phase to the next (the
   'next-machine-phase' command to be added)
4) Perform configuration that needs to be done after the machine
   is initialized
5) 'next-machine-phase' (same as in 3), etc.

Available QMP commands will be specific to each phase, but the command
'next-machine-phase' will be common. In the implementation of the
'next-machine-phase' command, we will call qemu_machine_enter_phase
function introduced in this patch.

Function qemu_machine_enter_phase introduced here allows advancing
the machine to the target phase. For the single-stepping configuration
described above, the target phase would be the current machine
phase + 1 (assuming some sanity checks on top).
When this function is called for the PHASE_MACHINE_READY target phase
(the final phase) it implements the same functionality as
qmp_x_exit_preconfig before this patch. In other words, the body of
this function implements the same initialization steps as before, but
just groups them into chunks (if branches) and allows stepping through
machine init phases.

For now, the relevant target machine phases are only
PHASE_MACHINE_INITIALIZED and PHASE_MACHINE_READY, but the approach
allows to easily add more or split existing phases if needed.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 include/hw/qdev-core.h |  1 +
 hw/core/qdev.c         |  5 +++
 softmmu/vl.c           | 87 ++++++++++++++++++++++++++++--------------
 3 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa..6e52240d92 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -841,5 +841,6 @@ typedef enum MachineInitPhase {
 
 extern bool phase_check(MachineInitPhase phase);
 extern void phase_advance(MachineInitPhase phase);
+extern MachineInitPhase phase_get(void);
 
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a..4a4a4d8c52 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1150,6 +1150,11 @@ void phase_advance(MachineInitPhase phase)
     machine_phase = phase;
 }
 
+MachineInitPhase phase_get(void)
+{
+    return machine_phase;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aadb526138..cbf62abeb4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2578,6 +2578,62 @@ static void qemu_machine_creation_done(void)
     }
 }
 
+static void qemu_machine_enter_phase(MachineInitPhase target_phase,
+                                     Error **errp)
+{
+    /* target phases before initialization are not handled here */
+    if (target_phase < PHASE_MACHINE_INITIALIZED) {
+        error_setg(errp, "Target machine phase too early to enter this way");
+        return;
+    }
+
+    /* check if machine has already passed through the target phase */
+    if (phase_check(target_phase)) {
+        error_setg(errp, "Target machine phase already entered");
+        return;
+    }
+
+    /*
+     * if machine has not yet passed 'initialized' phase and according to the
+     * target_phase it should
+     */
+    if (target_phase >= PHASE_MACHINE_INITIALIZED &&
+        phase_get() < PHASE_MACHINE_INITIALIZED) {
+        qemu_init_board();
+        qemu_create_cli_devices();
+    }
+
+    if (target_phase >= PHASE_MACHINE_READY &&
+        phase_get() < PHASE_MACHINE_READY) {
+        qemu_machine_creation_done();
+
+        if (loadvm) {
+            Error *local_err = NULL;
+            if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
+                error_report_err(local_err);
+                autostart = 0;
+                exit(1);
+            }
+        }
+        if (replay_mode != REPLAY_MODE_NONE) {
+            replay_vmstate_init();
+        }
+
+        if (incoming) {
+            Error *local_err = NULL;
+            if (strcmp(incoming, "defer") != 0) {
+                qmp_migrate_incoming(incoming, &local_err);
+                if (local_err) {
+                    error_reportf_err(local_err, "-incoming %s: ", incoming);
+                    exit(1);
+                }
+            }
+        } else if (autostart) {
+            qmp_cont(NULL);
+        }
+    }
+}
+
 void qmp_x_exit_preconfig(Error **errp)
 {
     if (phase_check(PHASE_MACHINE_INITIALIZED)) {
@@ -2585,34 +2641,7 @@ void qmp_x_exit_preconfig(Error **errp)
         return;
     }
 
-    qemu_init_board();
-    qemu_create_cli_devices();
-    qemu_machine_creation_done();
-
-    if (loadvm) {
-        Error *local_err = NULL;
-        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
-            error_report_err(local_err);
-            autostart = 0;
-            exit(1);
-        }
-    }
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
+    qemu_machine_enter_phase(PHASE_MACHINE_READY, errp);
 }
 
 void qemu_init(int argc, char **argv, char **envp)
@@ -3608,7 +3637,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (!preconfig_requested) {
-        qmp_x_exit_preconfig(&error_fatal);
+        qemu_machine_enter_phase(PHASE_MACHINE_READY, &error_fatal);
     }
     qemu_init_displays();
     accel_setup_post(current_machine);
-- 
2.25.1


