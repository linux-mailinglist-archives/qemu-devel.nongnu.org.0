Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA837F441
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:38:06 +0200 (CEST)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6r7-0005WF-MD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gQ-0004xh-1z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mirela.grujic@greensocs.com>)
 id 1lh6gO-0001Jf-10
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:27:01 -0400
Received: from localhost.localdomain (cable-24-135-22-90.dynamic.sbb.rs
 [24.135.22.90])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 23DCB21EB6;
 Thu, 13 May 2021 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620894418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJftWLtMFuO0oVdmPhys0x3dDmhseEKSmj/mwIWLtEk=;
 b=2r2d4EMvtVxrWXRdo90VgH8FN/injYxppccquadCd1gNh+o6PRcfhZP8M32lAjroDddaNM
 rmlmtoqc0+9ALrsL0V51xkcv0XmKkhypsdf0+AGP3V9+Ol3YT79U6vuxc1HaSA97LQ3OJF
 d8NhGU/bYh52TetMuHYJgcPtEjSK04w=
From: Mirela Grujic <mirela.grujic@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/9] qapi: Implement 'query-machine-phase' command
Date: Thu, 13 May 2021 10:25:44 +0200
Message-Id: <20210513082549.114275-5-mirela.grujic@greensocs.com>
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command returns current machine initialization phase.
From now on, the MachineInitPhase enum is generated.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json          | 54 ++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h     | 29 +-------------------
 hw/core/machine-qmp-cmds.c |  9 +++++++
 3 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 6e90d463fc..47bdbec817 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1274,3 +1274,57 @@
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
   'data': { 'device': 'str', 'msg': 'str' } }
+
+##
+# @MachineInitPhase:
+#
+# Enumeration of machine initialization phases.
+#
+# @no-machine: machine does not exist
+#
+# @machine-created: machine is created, but its accelerator is not
+#
+# @accel-created: accelerator is created, but the machine properties have not
+#                 been validated and machine initialization is not done yet
+#
+# @initialized: machine is initialized, thus creating any embedded devices and
+#               validating machine properties. Devices created at this time are
+#               considered to be cold-plugged.
+#
+# @ready: QEMU is ready to start CPUs and devices created at this time are
+#         considered to be hot-plugged. The monitor is not restricted to
+#         "preconfig" commands.
+##
+{ 'enum': 'MachineInitPhase',
+  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
+            'ready' ] }
+
+##
+# @MachineInitPhaseStatus:
+#
+# Information about machine initialization phase
+#
+# @phase: the machine initialization phase
+#
+# Since:  #FIXME
+##
+{ 'struct': 'MachineInitPhaseStatus',
+  'data': { 'phase': 'MachineInitPhase' } }
+
+##
+# @query-machine-phase:
+#
+# Return machine initialization phase
+#
+# Since: #FIXME
+#
+# Returns: MachineInitPhaseStatus
+#
+# Example:
+#
+# -> { "execute": "query-machine-phase" }
+# <- { "return": { "phase": "initialized" } }
+#
+##
+{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
+             'allow-preconfig': true }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index dc2f63478b..ca39b77ae6 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qapi/qapi-types-machine.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -811,34 +812,6 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
-typedef enum MachineInitPhase {
-    /* current_machine is NULL.  */
-    MACHINE_INIT_PHASE_NO_MACHINE,
-
-    /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    MACHINE_INIT_PHASE_MACHINE_CREATED,
-
-    /*
-     * current_machine->accel is not NULL, but the machine properties have
-     * not been validated and machine_class->init has not yet been called.
-     */
-    MACHINE_INIT_PHASE_ACCEL_CREATED,
-
-    /*
-     * machine_class->init has been called, thus creating any embedded
-     * devices and validating machine properties.  Devices created at
-     * this time are considered to be cold-plugged.
-     */
-    MACHINE_INIT_PHASE_INITIALIZED,
-
-    /*
-     * QEMU is ready to start CPUs and devices created at this time
-     * are considered to be hot-plugged.  The monitor is not restricted
-     * to "preconfig" commands.
-     */
-    MACHINE_INIT_PHASE_READY,
-} MachineInitPhase;
-
 extern bool phase_check(MachineInitPhase phase);
 extern void phase_advance(MachineInitPhase phase);
 extern MachineInitPhase phase_get(void);
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index be286882cc..23f837dadb 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -198,3 +198,12 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
+{
+    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
+
+    status->phase = phase_get();
+
+    return status;
+}
-- 
2.25.1


