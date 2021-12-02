Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1F465ED3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:43:06 +0100 (CET)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgkC-0001Fz-Va
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9P-0005Up-2N
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9K-0006Et-T4
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4H0EK/DFvnglkelsvoL1QWxYWVVkAcCNhdQKrlzSVwk=;
 b=W5KinNEajN1pEolngAUBE8gqd6a7ziBzVgkJUD9Nljayh26BLOtT6RH1+jUPYqCBXUy8ub
 JkqP7LrA+rgWsP2hnMS1TtGf2ogP1l3r9A88s6YeIOjoViODhyIh4cJNkvmRZUAupFWVZo
 tUCF+p9gHZenC9CvW/bnt+CPF4SK2Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-AsqBncYWN_OnPIh3mc1Bww-1; Thu, 02 Dec 2021 02:04:55 -0500
X-MC-Unique: AsqBncYWN_OnPIh3mc1Bww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD9B51023F50;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8AA5F4E7;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2EBC81138222; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/11] vl: New QMP command until-phase
Date: Thu,  2 Dec 2021 08:04:48 +0100
Message-Id: <20211202070450.264743-10-armbru@redhat.com>
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

This is a straightforward QMP wrapper around qemu_until_phase().
Useless right now, because by the time you can execute QMP, we're
already in phase @machine-ready, and all you can do with the command
is "advance" to that same phase.

Its error message is RFC-qwality.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/phase.json            | 31 +++++++++++++++++++++++++++++++
 qapi/qapi-schema.json      |  1 +
 include/hw/qdev-core.h     | 32 --------------------------------
 hw/core/machine-qmp-cmds.c |  1 +
 hw/core/machine.c          |  1 +
 hw/core/qdev.c             |  2 ++
 hw/pci/pci.c               |  1 +
 hw/usb/core.c              |  1 +
 hw/virtio/virtio-iommu.c   |  1 +
 monitor/hmp.c              |  1 +
 softmmu/qdev-monitor.c     |  1 +
 softmmu/vl.c               | 15 +++++++++++++++
 ui/console.c               |  1 +
 MAINTAINERS                |  1 +
 qapi/meson.build           |  1 +
 15 files changed, 59 insertions(+), 32 deletions(-)
 create mode 100644 qapi/phase.json

diff --git a/qapi/phase.json b/qapi/phase.json
new file mode 100644
index 0000000000..3f0492692b
--- /dev/null
+++ b/qapi/phase.json
@@ -0,0 +1,31 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = VM initialization phase
+##
+
+##
+# @MachineInitPhase:
+#
+# Since 7.0
+##
+{ 'enum': 'MachineInitPhase',
+  'prefix': 'PHASE',
+  'data': [ 'no-machine', 'machine-created', 'accel-created',
+            'machine-initialized', 'machine-ready' ] }
+
+##
+# @until-phase:
+#
+# Features:
+# @unstable: This command is experimental.
+#
+# Since 7.0
+#
+# Returns: nothing
+##
+{ 'command': 'until-phase', 'allow-preconfig': true,
+  'data': { 'phase': 'MachineInitPhase' },
+  'features': [ 'unstable' ] }
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..f3c4c01393 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -64,6 +64,7 @@
 { 'include': 'common.json' }
 { 'include': 'sockets.json' }
 { 'include': 'run-state.json' }
+{ 'include': 'phase.json' }
 { 'include': 'crypto.json' }
 { 'include': 'block.json' }
 { 'include': 'block-export.json' }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 2a3a3b0118..167b43102d 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -847,36 +847,4 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp);
 
-typedef enum MachineInitPhase {
-    /* current_machine is NULL.  */
-    PHASE_NO_MACHINE,
-
-    /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    PHASE_MACHINE_CREATED,
-
-    /*
-     * current_machine->accel is not NULL, but the machine properties have
-     * not been validated and machine_class->init has not yet been called.
-     */
-    PHASE_ACCEL_CREATED,
-
-    /*
-     * machine_class->init has been called, thus creating any embedded
-     * devices and validating machine properties.  Devices created at
-     * this time are considered to be cold-plugged.
-     */
-    PHASE_MACHINE_INITIALIZED,
-
-    /*
-     * QEMU is ready to start CPUs and devices created at this time
-     * are considered to be hot-plugged.  The monitor is not restricted
-     * to "preconfig" commands.
-     */
-    PHASE_MACHINE_READY,
-} MachineInitPhase;
-
-extern bool phase_check(MachineInitPhase phase);
-extern MachineInitPhase phase_get(void);
-extern void phase_advance(MachineInitPhase phase);
-
 #endif
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 4f4ab30f8c..664cef364a 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -21,6 +21,7 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/numa.h"
+#include "sysemu/phase.h"
 #include "sysemu/runstate.h"
 
 static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc56..28793d36c8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -24,6 +24,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/phase.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/numa.h"
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 287eb81ff8..4d592eb7f1 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -27,6 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-types-phase.h"
 #include "qapi/qapi-events-qdev.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -39,6 +40,7 @@
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
 #include "migration/vmstate.h"
+#include "sysemu/phase.h"
 #include "trace.h"
 
 static bool qdev_hot_added = false;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef5..02169fb728 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -38,6 +38,7 @@
 #include "monitor/monitor.h"
 #include "net/net.h"
 #include "sysemu/numa.h"
+#include "sysemu/phase.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..e836138add 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "hw/usb.h"
 #include "qemu/iov.h"
+#include "sysemu/phase.h"
 #include "trace.h"
 
 void usb_pick_speed(USBPort *port)
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c..d297e5a38c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,7 @@
 #include "qemu-common.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
+#include "sysemu/phase.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/monitor/hmp.c b/monitor/hmp.c
index b20737e63c..a6345ec8d6 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -37,6 +37,7 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/phase.h"
 #include "sysemu/runstate.h"
 #include "trace.h"
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..067f6cdeab 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -37,6 +37,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/option_int.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/phase.h"
 #include "migration/misc.h"
 #include "migration/migration.h"
 #include "qemu/cutils.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 148c39e22c..9406368338 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -37,6 +37,7 @@
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
 #include "qemu/uuid.h"
+#include "sysemu/phase.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
@@ -120,6 +121,7 @@
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-phase.h"
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qdict.h"
@@ -1182,5 +1184,18 @@ void qemu_until_phase(MachineInitPhase phase)
 
     case PHASE_MACHINE_READY:
         break;
+
+    default:
+        assert(0);
     }
 }
+
+void qmp_until_phase(MachineInitPhase phase, Error **errp)
+{
+    if (phase < phase_get()) {
+        error_setg(errp, "too late");
+        return;
+    }
+
+    qemu_until_phase(phase);
+}
diff --git a/ui/console.c b/ui/console.c
index 29a3e3f0f5..e080873534 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -33,6 +33,7 @@
 #include "qemu/option.h"
 #include "qemu/timer.h"
 #include "chardev/char.h"
+#include "sysemu/phase.h"
 #include "trace.h"
 #include "exec/memory.h"
 #include "io/channel-file.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 006a2293ba..9b7e6de6a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2591,6 +2591,7 @@ F: softmmu/cpu-timers.c
 F: softmmu/icount.c
 F: softmmu/runstate-action.c
 F: qapi/run-state.json
+F: qapi/phase.json
 
 Read, Copy, Update (RCU)
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..9d141a517a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -41,6 +41,7 @@ qapi_all_modules = [
   'misc',
   'misc-target',
   'net',
+  'phase',
   'pragma',
   'qom',
   'replay',
-- 
2.31.1


