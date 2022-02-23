Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB24C0F1D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:22:56 +0100 (CET)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnrL-0006jw-Oe
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnci-0001UG-0J
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022s-PE
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:47 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 11D3D21EB9;
 Wed, 23 Feb 2022 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tsth2S0QxzZ6akvNQ6dnRjZtK+bdfneUMgsqCFymbWM=;
 b=VR8E/ErgXlnmVgJPPX+fpDo6kUaM03AckYQoA7y9n4Mz8tZL0QdR8p3Uj4RLVDPuv+V071
 VF5y9cdGODSgPa2axybOSt1J+A84ksFQaOwnwIzT9c1zVWRQlgg2n/v2ThEph+pXQBncjs
 /s7fCBRWayKK/0ovgbPBbTFqPUyL6/M=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 05/14] qapi/device_add: handle the rom_order_override when
 cold-plugging
Date: Wed, 23 Feb 2022 10:06:57 +0100
Message-Id: <20220223090706.4888-6-damien.hedde@greensocs.com>
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

rom_set_order_override() and rom_reset_order_override() were called
in qemu_create_cli_devices() to set the rom_order_override value
once and for all when creating the devices added on CLI.

Unfortunately this won't work with qapi commands.

Move the calls inside device_add so that it will be done in every
case:
+ CLI option: -device
+ QAPI command: device_add

rom_[set|reset]_order_override() are implemented in hw/core/loader.c
They either do nothing or call fw_cfg_[set|reset]_order_override().
The later functions are implemented in hw/nvram/fw_cfg.c and only
change an integer value of a "global" variable.
In consequence, there are no complex side effects involved and we can
safely move them from outside the -device option loop to the inner
function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 softmmu/vl.c           |  2 --
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 47a89aee20..9ec3e0ebff 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -43,6 +43,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
 #include "hw/boards.h"
+#include "hw/loader.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -671,6 +672,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
+    if (!is_hotplug) {
+        rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
+    }
+
     /* create device */
     dev = qdev_new(driver);
 
@@ -712,6 +717,9 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
     if (!qdev_realize(DEVICE(dev), bus, errp)) {
         goto err_del_dev;
     }
+    if (!is_hotplug) {
+        rom_reset_order_override();
+    }
     return dev;
 
 err_del_dev:
@@ -719,6 +727,9 @@ err_del_dev:
         object_unparent(OBJECT(dev));
         object_unref(OBJECT(dev));
     }
+    if (!is_hotplug) {
+        rom_reset_order_override();
+    }
     return NULL;
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 50337d68b9..b91ae1b8ae 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2680,7 +2680,6 @@ static void qemu_create_cli_devices(void)
     }
 
     /* init generic devices */
-    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
                       device_init_func, NULL, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
@@ -2697,7 +2696,6 @@ static void qemu_create_cli_devices(void)
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
-    rom_reset_order_override();
 }
 
 static void qemu_machine_creation_done(void)
-- 
2.35.1


