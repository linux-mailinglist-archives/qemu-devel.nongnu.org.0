Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D54C0F59
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:40:28 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMo8J-0001rZ-A6
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:40:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnct-0001bg-Rw
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:59 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnco-00023L-QM
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:59 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 9D3EA21EC5;
 Wed, 23 Feb 2022 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsssQ08ielxMrdpKfjAGfaxN0aH2oCRXyf3fM7RTCcM=;
 b=D0o9NXufAaSroe65FoOzDEGepoT7H9Cp5l+PZtDrhEpa28h1S8nZ0mGOY9aig2JTccAXus
 v6Uo6ZFaOPJNbAzbmX6vl3spaYJdsbjEKduEyt2Zfi6Wkz9rFtqusp37R/7E72D/U2ofJv
 ziTzRVZqPIHECCtmLODNoDaBSVaUzAg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 12/14] add sysbus-mmio-map qapi command
Date: Wed, 23 Feb 2022 10:07:04 +0100
Message-Id: <20220223090706.4888-13-damien.hedde@greensocs.com>
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
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command allows to map an mmio region of sysbus device onto
the system memory. Its behavior mimics the sysbus_mmio_map()
function apart from the automatic unmap (the C function unmaps
the region if it is already mapped).
For the qapi function we consider it is an error to try to map
an already mapped function. If unmapping is required, it is
probably better to add a sysbus-mmip-unmap command.

This command is still experimental (hence the 'unstable' feature),
as it is related to the sysbus device creation through qapi commands.

This command is required to be able to dynamically build a machine
from scratch as there is no qapi-way of doing a memory mapping.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Alistair Francis <alistair.francis@wdc.com>

v4:
 + integrate priority parameter
 + use 'unstable' feature flag instead of 'x-' prefix
 + bump version to 7.0
 + dropped Alistair's reviewed-by as a consequence
---
 qapi/qdev.json   | 31 ++++++++++++++++++++++++++++++
 hw/core/sysbus.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2e2de41499..4830e87a90 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -160,3 +160,34 @@
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @sysbus-mmio-map:
+#
+# Map a sysbus device mmio onto the main system bus.
+#
+# @device: the device's QOM path
+#
+# @mmio: The mmio number to be mapped (defaults to 0).
+#
+# @addr: The base address for the mapping.
+#
+# @priority: The priority of the mapping (defaults to 0).
+#
+# Features:
+# @unstable: Command is meant to map sysbus devices
+#            while in preconfig mode.
+#
+# Since: 7.0
+#
+# Returns: Nothing on success
+#
+##
+
+{ 'command': 'sysbus-mmio-map',
+  'data': { 'device': 'str',
+            '*mmio': 'uint8',
+            'addr': 'uint64',
+            '*priority': 'int32' },
+  'features': ['unstable'],
+  'allow-preconfig' : true }
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..df1f1f43a5 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -23,6 +23,7 @@
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
+#include "qapi/qapi-commands-qdev.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
@@ -154,6 +155,54 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
     }
 }
 
+void qmp_sysbus_mmio_map(const char *device,
+                         bool has_mmio, uint8_t mmio,
+                         uint64_t addr,
+                         bool has_priority, int32_t priority,
+                         Error **errp)
+{
+    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE, NULL);
+    SysBusDevice *dev;
+
+    if (phase_get() != PHASE_MACHINE_INITIALIZED) {
+        error_setg(errp, "The command is permitted only when "
+                         "the machine is in initialized phase");
+        return;
+    }
+
+    if (obj == NULL) {
+        error_setg(errp, "Device '%s' not found", device);
+        return;
+    }
+    dev = SYS_BUS_DEVICE(obj);
+
+    if (!has_mmio) {
+        mmio = 0;
+    }
+    if (!has_priority) {
+        priority = 0;
+    }
+
+    if (mmio >= dev->num_mmio) {
+        error_setg(errp, "MMIO index '%u' does not exist in '%s'",
+                   mmio, device);
+        return;
+    }
+
+    if (dev->mmio[mmio].addr != (hwaddr)-1) {
+        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
+        return;
+    }
+
+    if (!memory_region_try_add_subregion(get_system_memory(), addr,
+                                         dev->mmio[mmio].memory, priority,
+                                         errp)) {
+        return;
+    }
+
+    dev->mmio[mmio].addr = addr;
+}
+
 void sysbus_mmio_unmap(SysBusDevice *dev, int n)
 {
     assert(n >= 0 && n < dev->num_mmio);
-- 
2.35.1


