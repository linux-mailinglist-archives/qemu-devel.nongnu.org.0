Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402764C0EFE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:19:06 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnnc-0005A5-4O
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncc-0001Tz-EI
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncP-0001zQ-Qd
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 996BB21C38;
 Wed, 23 Feb 2022 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+m1uLGIgItw9aGthsOYxemQYeg02WFewRFIsl1QPD3o=;
 b=mxrDsNA+uZNHClQjMbaUgXzMbe+zqM7XPLnp3xA+9uGZalO5wa5GfwRUpRBzGhTIUTUYYD
 uGwH4w2/awJPKbBjDTpjvyU6smDges59ybfAnRZaHosaWttXr3C9R+WW2bh45SeECR5p2H
 EuBLKoFmM9mjxZfXKZlhQkE7sICM96Q=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 02/14] machine&vl: introduce phase_until() to handle phase
 transitions
Date: Wed, 23 Feb 2022 10:06:54 +0100
Message-Id: <20220223090706.4888-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

phase_until() is implemented in vl.c and is meant to be used
to make startup progress up to a specified phase being reached().
At this point, no behavior change is introduced: phase_until()
only supports a single double transition corresponding
to the functionality of qmp_exit_preconfig():
+ accel-created -> machine-initialized -> machine-ready

As a result qmp_exit_preconfig() now uses phase_until().

This commit is a preparation to support cold plugging a device
using qapi command (which will be introduced in a following commit).
For this we need fine grain control of the phase.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/qdev-core.h | 14 ++++++++
 softmmu/vl.c           | 78 ++++++++++++++++++++++++++++++++----------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index e29c705b74..5f73d06408 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -909,4 +909,18 @@ extern bool phase_check(MachineInitPhase phase);
  */
 extern void phase_advance(MachineInitPhase phase);
 
+/**
+ * @phase_until:
+ * @phase: the target phase
+ * @errp: error report
+ *
+ * Make the machine init progress until the target phase is reached.
+ *
+ * Its is a no-op is the target phase is the current or an earlier
+ * phase.
+ *
+ * Returns true in case of success.
+ */
+extern bool phase_until(MachineInitPhase phase, Error **errp);
+
 #endif
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..5689d0be88 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2741,30 +2741,72 @@ void qmp_x_exit_preconfig(Error **errp)
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
+    phase_until(PHASE_MACHINE_READY, errp);
+}
 
-    qemu_init_board();
-    qemu_create_cli_devices();
-    qemu_machine_creation_done();
-
-    if (loadvm) {
-        load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
-    }
-    if (replay_mode != REPLAY_MODE_NONE) {
-        replay_vmstate_init();
+bool phase_until(MachineInitPhase phase, Error **errp)
+{
+    if (!phase_check(PHASE_ACCEL_CREATED)) {
+        error_setg(errp, "Phase transition is not supported until accelerator"
+                   " is created");
+        return false;
     }
 
-    if (incoming) {
-        Error *local_err = NULL;
-        if (strcmp(incoming, "defer") != 0) {
-            qmp_migrate_incoming(incoming, &local_err);
-            if (local_err) {
-                error_reportf_err(local_err, "-incoming %s: ", incoming);
-                exit(1);
+    while (!phase_check(phase)) {
+        MachineInitPhase cur_phase = phase_get();
+
+        switch (cur_phase) {
+        case PHASE_ACCEL_CREATED:
+            qemu_init_board();
+            /* We are now in PHASE_MACHINE_INITIALIZED. */
+            qemu_create_cli_devices();
+            /*
+             * At this point all CLI options are handled apart:
+             * + -S (autostart)
+             * + -incoming
+             */
+            qemu_machine_creation_done();
+            /* We are now in PHASE_MACHINE_READY. */
+
+            if (loadvm) {
+                load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
             }
+            if (replay_mode != REPLAY_MODE_NONE) {
+                replay_vmstate_init();
+            }
+
+            if (incoming) {
+                Error *local_err = NULL;
+                if (strcmp(incoming, "defer") != 0) {
+                    qmp_migrate_incoming(incoming, &local_err);
+                    if (local_err) {
+                        error_reportf_err(local_err, "-incoming %s: ",
+                                          incoming);
+                        exit(1);
+                    }
+                }
+            } else if (autostart) {
+                qmp_cont(NULL);
+            }
+            break;
+
+        default:
+            /*
+             * If we end up here, it is because we miss a case above.
+             */
+            error_setg(&error_abort, "Requested phase transition is not"
+                       " implemented");
+            return false;
         }
-    } else if (autostart) {
-        qmp_cont(NULL);
+
+        /*
+         * Ensure we made some progress.
+         * With the default case above, it should be enough to prevent
+         * any infinite loop.
+         */
+        assert(cur_phase < phase_get());
     }
+    return true;
 }
 
 void qemu_init(int argc, char **argv, char **envp)
-- 
2.35.1


