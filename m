Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94818454960
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:56:28 +0100 (CET)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMMN-0003y0-LJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnME1-0004hL-2R
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:49 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mnMDx-0000ne-Px
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:47:48 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 28A0121C47;
 Wed, 17 Nov 2021 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637160464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeXguXtnmsKuabKf3dHxd8zxTIKB7+ej5BXyrtvCVxY=;
 b=ZhmTjTFwFnHPa/3NqWcSmYwOi1UTEQ85Rb03gBJZEDjLVpo9deIiW6pXxxBKYiBuZbC0c3
 SjY59Ii5CC/MBFPg6iDCF1JGtT33QlLncGXQC30ZVNEGAA63K5sraMx90F4C/N6lTXCW5M
 3PTukulthcwsD4AMWM7sjThRCdHe4vI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 2/5] qapi: Implement query-machine-phase QMP command
Date: Wed, 17 Nov 2021 15:47:00 +0100
Message-Id: <20211117144703.16305-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117144703.16305-1-damien.hedde@greensocs.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The command returns current machine initialization phase.
From now on, the MachineInitPhase enum is generated from the
QAPI schema.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

v3:
 + add 'unstable' feature
 + bump to version 7.0
---
 qapi/machine.json          | 60 ++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h     | 30 ++-----------------
 hw/core/machine-qmp-cmds.c |  9 ++++++
 hw/core/qdev.c             |  5 ++++
 4 files changed, 76 insertions(+), 28 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 067e3f5378..8e9a8afb1d 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1557,3 +1557,63 @@
 { 'command': 'x-query-usb',
   'returns': 'HumanReadableText',
   'features': [ 'unstable' ] }
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
+#
+# Since: 7.0
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
+# Since: 7.0
+##
+{ 'struct': 'MachineInitPhaseStatus',
+  'data': { 'phase': 'MachineInitPhase' } }
+
+##
+# @query-machine-phase:
+#
+# Return machine initialization phase
+#
+# Features:
+# @unstable: This command is part of the experimental preconfig mode.
+#
+# Since: 7.0
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
+  'features' : ['unstable'],
+  'allow-preconfig': true }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ef2d612d39..ac856821ab 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qapi/qapi-types-machine.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -847,35 +848,8 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp);
 
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
+extern MachineInitPhase phase_get(void);
 
 #endif
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index ddbdc5212f..19f9da4c2d 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -244,3 +244,12 @@ HumanReadableText *qmp_x_query_numa(Error **errp)
  done:
     return human_readable_text_from_str(buf);
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
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index ccfd6f0dc4..f22c050c89 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -921,6 +921,11 @@ void phase_advance(MachineInitPhase phase)
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
-- 
2.33.0


