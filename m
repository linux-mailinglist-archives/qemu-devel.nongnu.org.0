Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37A02DB324
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:59:11 +0100 (CET)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEbO-00007s-PY
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXH-0002wX-8a
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXD-0001S6-HO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/01VFQlJeGFZa3Pj2/QF4v5bQFpFVnfba06Gl7ReWqs=;
 b=YlXtoeB8x2Ane53U88g6FGVPeBCVcJ18hpIE4mZCZWVkK58tarCwkwmEe7LWFLiBBm6poh
 0ElMZkXOGa0ykMWG54mKKojSWAhoiZLlgpwijEygqMcWk+YfeR4vk3lNhCuWx4MDhHizrD
 AQlhWvs74O0XwOUOZRnWcTZcNNgmEpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-01zcjYGjPRm6QGkWM1Y3fQ-1; Tue, 15 Dec 2020 12:54:49 -0500
X-MC-Unique: 01zcjYGjPRm6QGkWM1Y3fQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 596B3107ACE3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17B6D60C15;
 Tue, 15 Dec 2020 17:54:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/45] vl: move all generic initialization out of vl.c
Date: Tue, 15 Dec 2020 12:54:06 -0500
Message-Id: <20201215175445.1272776-7-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_machine_creation_done is only setting a flag now.  Extend it to
move more code out of vl.c.  Leave only consistency checks and gdbserver
processing in qemu_machine_creation_done.

gdbserver_start can be moved after qdev_machine_creation_done because
it only does listen on the socket and creates some internal data
structures; it does not send any data (e.g. guest state) over the socket.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c      | 47 +++++++++++++++++++++++++++++++++++++++++-
 hw/core/qdev.c         | 12 +++--------
 include/hw/qdev-core.h |  1 +
 softmmu/vl.c           | 37 +--------------------------------
 4 files changed, 51 insertions(+), 46 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 26cfd87b5c..036609d9f3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -16,16 +16,21 @@
 #include "sysemu/replay.h"
 #include "qemu/units.h"
 #include "hw/boards.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
 #include "hw/sysbus.h"
+#include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
+#include "migration/global_state.h"
 #include "migration/vmstate.h"
 
 GlobalProperty hw_compat_5_2[] = {};
@@ -1189,10 +1194,50 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
     notifier_remove(notify);
 }
 
-void qemu_run_machine_init_done_notifiers(void)
+void qdev_machine_creation_done(void)
 {
+    cpu_synchronize_all_post_init();
+
+    if (current_machine->boot_once) {
+        qemu_boot_set(current_machine->boot_once, &error_fatal);
+        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
+    }
+
+    /*
+     * ok, initial machine setup is done, starting from now we can
+     * only create hotpluggable devices
+     */
+    qdev_hotplug = true;
+    qdev_assert_realized_properly();
+
+    /* TODO: once all bus devices are qdevified, this should be done
+     * when bus is created by qdev.c */
+    /*
+     * TODO: If we had a main 'reset container' that the whole system
+     * lived in, we could reset that using the multi-phase reset
+     * APIs. For the moment, we just reset the sysbus, which will cause
+     * all devices hanging off it (and all their child buses, recursively)
+     * to be reset. Note that this will *not* reset any Device objects
+     * which are not attached to some part of the qbus tree!
+     */
+    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
+
     machine_init_done = true;
     notifier_list_notify(&machine_init_done_notifiers, NULL);
+
+    if (rom_check_and_register_reset() != 0) {
+        error_report("rom check and register reset failed");
+        exit(1);
+    }
+
+    replay_start();
+
+    /* This checkpoint is required by replay to separate prior clock
+       reading from the other reads, because timer polling functions query
+       clock values from the log. */
+    replay_checkpoint(CHECKPOINT_RESET);
+    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    register_global_state();
 }
 
 static const TypeInfo machine_info = {
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d3611e7c03..dddb0b2d69 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -404,7 +404,7 @@ void qdev_unrealize(DeviceState *dev)
     object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
 }
 
-static int qdev_assert_realized_properly(Object *obj, void *opaque)
+static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
 {
     DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
     DeviceClass *dc;
@@ -417,16 +417,10 @@ static int qdev_assert_realized_properly(Object *obj, void *opaque)
     return 0;
 }
 
-void qdev_machine_creation_done(void)
+void qdev_assert_realized_properly(void)
 {
-    /*
-     * ok, initial machine setup is done, starting from now we can
-     * only create hotpluggable devices
-     */
-    qdev_hotplug = true;
-
     object_child_foreach_recursive(object_get_root(),
-                                   qdev_assert_realized_properly, NULL);
+                                   qdev_assert_realized_properly_cb, NULL);
 }
 
 bool qdev_machine_modified(void)
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 8f91faebc3..3dab50cd87 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -780,6 +780,7 @@ const VMStateDescription *qdev_get_vmsd(DeviceState *dev);
 
 const char *qdev_fw_name(DeviceState *dev);
 
+void qdev_assert_realized_properly(void);
 Object *qdev_get_machine(void);
 
 /* FIXME: make this a link<> */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 685d92df5d..d8af26c281 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -72,7 +72,6 @@
 #include "hw/i386/pc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
-#include "migration/global_state.h"
 #include "sysemu/tpm.h"
 #include "sysemu/dma.h"
 #include "hw/audio/soundhw.h"
@@ -2465,8 +2464,6 @@ static void qemu_create_cli_devices(void)
 
 static void qemu_machine_creation_done(void)
 {
-    cpu_synchronize_all_post_init();
-
     /* Did we create any drives that we failed to create a device for? */
     drive_check_orphaned();
 
@@ -2484,43 +2481,11 @@ static void qemu_machine_creation_done(void)
 
     qdev_prop_check_globals();
 
-    if (current_machine->boot_once) {
-        qemu_boot_set(current_machine->boot_once, &error_fatal);
-        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
-    }
-
-    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
-        exit(1);
-    }
-
     qdev_machine_creation_done();
 
-    /* TODO: once all bus devices are qdevified, this should be done
-     * when bus is created by qdev.c */
-    /*
-     * TODO: If we had a main 'reset container' that the whole system
-     * lived in, we could reset that using the multi-phase reset
-     * APIs. For the moment, we just reset the sysbus, which will cause
-     * all devices hanging off it (and all their child buses, recursively)
-     * to be reset. Note that this will *not* reset any Device objects
-     * which are not attached to some part of the qbus tree!
-     */
-    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
-    qemu_run_machine_init_done_notifiers();
-
-    if (rom_check_and_register_reset() != 0) {
-        error_report("rom check and register reset failed");
+    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
-
-    replay_start();
-
-    /* This checkpoint is required by replay to separate prior clock
-       reading from the other reads, because timer polling functions query
-       clock values from the log. */
-    replay_checkpoint(CHECKPOINT_RESET);
-    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
-    register_global_state();
 }
 
 void qmp_x_exit_preconfig(Error **errp)
-- 
2.26.2



