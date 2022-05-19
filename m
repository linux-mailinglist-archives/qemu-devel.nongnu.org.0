Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789852D878
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:45:57 +0200 (CEST)
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriLc-0004iE-13
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAe-0001am-58
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:38 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAY-0007oc-9p
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:34 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9913B21C28;
 Thu, 19 May 2022 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ/khheqxpn81zoPkGuli+zXHzcGpEanrhJLq6OMKhA=;
 b=daXCasdc4462yel6zpxEpT88oBO9c1A53/J2PU2feIkkXSH8hsYXJ/pqaK1+lqNNUd8Pqd
 wrRwZu1a8k90+/FPWtCk1WVOJux99FJ51I6mopyjkNP7l2dsSlWzRTrZBdY7GkAKP9ib/0
 Q3Ksyz7AVMdEyX+pPazVWIvgLhAQ1lU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 2/6] machine&vl: introduce phase_until() to handle phase
 transitions
Date: Thu, 19 May 2022 17:33:58 +0200
Message-Id: <20220519153402.41540-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519153402.41540-1-damien.hedde@greensocs.com>
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
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

v5:
  + refactor to avoid indentation change
---
 include/hw/qdev-core.h | 14 +++++++++++++
 softmmu/vl.c           | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index 84a31eba76..7f8d15b5b8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2702,11 +2702,17 @@ void qmp_x_exit_preconfig(Error **errp)
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
+    phase_until(PHASE_MACHINE_READY, errp);
+}
 
+static void qemu_phase_ready(Error **errp)
+{
     qemu_init_board();
+    /* phase is now PHASE_MACHINE_INITIALIZED. */
     qemu_create_cli_devices();
     cxl_fixed_memory_window_link_targets(errp);
     qemu_machine_creation_done();
+    /* Phase is now PHASE_MACHINE_READY. */
 
     if (loadvm) {
         load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
@@ -2729,6 +2735,46 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+bool phase_until(MachineInitPhase phase, Error **errp)
+{
+    ERRP_GUARD();
+    if (!phase_check(PHASE_ACCEL_CREATED)) {
+        error_setg(errp, "Phase transition is not supported until accelerator"
+                   " is created");
+        return false;
+    }
+
+    while (!phase_check(phase)) {
+        MachineInitPhase cur_phase = phase_get();
+
+        switch (cur_phase) {
+        case PHASE_ACCEL_CREATED:
+            qemu_phase_ready(errp);
+            break;
+
+        default:
+            /*
+             * If we end up here, it is because we miss a case above.
+             */
+            error_setg(&error_abort, "Requested phase transition is not"
+                       " implemented");
+            return false;
+        }
+
+        if (*errp) {
+            return false;
+        }
+
+        /*
+         * Ensure we made some progress.
+         * With the default case above, it should be enough to prevent
+         * any infinite loop.
+         */
+        assert(cur_phase < phase_get());
+    }
+    return true;
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
-- 
2.36.1


