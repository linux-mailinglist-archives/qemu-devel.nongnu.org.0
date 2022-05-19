Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B852D93E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:51:03 +0200 (CEST)
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriQX-000511-Ic
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAp-0001cc-9h
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:54 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAf-0007pq-3l
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:45 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id BFD9021EB6;
 Thu, 19 May 2022 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMp/HqUEwGgcbMpnHPrC2IOeZfv+if927mN1x1VBfxg=;
 b=Mk3KF1Ge8bnQbwVh3ms3i7mPwyCPqsOFT0C/sBp3mvJZNgSwRTfS+7sAJH/4Vodu8q0rO/
 Y+yrqnuPFDUziO0H3cZatDG395fca1r0bSyk+1ZHJayjKuFkMK+jk6KbIjRb4XJVKdCfaW
 mJKwhAATv8jAcQcfN27BGEk+YxI//7U=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 5/6] RFC qapi/device_add: handle the rom_order_override
 when cold-plugging
Date: Thu, 19 May 2022 17:34:01 +0200
Message-Id: <20220519153402.41540-6-damien.hedde@greensocs.com>
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

I see 2 other ways to handle this:

1. Adding a new option to device_add.

We could add a new boolean (_rom_order_override_ for example) option
tot he qapi command. This flag would then be forced to "true" when
handling "-device" parameter from CLI.
The flag default could be:
- always false
- false on hot-plug, true on cold-plug.

2. Adding a new qapi command
We could add one or two commands to do the
rom_[set|reset]_order_override() operation.
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 softmmu/vl.c           |  2 --
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index d68ef883b5..7cbee2b0d8 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -43,6 +43,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
 #include "hw/boards.h"
+#include "hw/loader.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -673,6 +674,10 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         return NULL;
     }
 
+    if (!is_hotplug) {
+        rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
+    }
+
     /* create device */
     dev = qdev_new(driver);
 
@@ -714,6 +719,9 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
     if (!qdev_realize(DEVICE(dev), bus, errp)) {
         goto err_del_dev;
     }
+    if (!is_hotplug) {
+        rom_reset_order_override();
+    }
     return dev;
 
 err_del_dev:
@@ -721,6 +729,9 @@ err_del_dev:
         object_unparent(OBJECT(dev));
         object_unref(OBJECT(dev));
     }
+    if (!is_hotplug) {
+        rom_reset_order_override();
+    }
     return NULL;
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea15e37973..5a0d54b595 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2635,7 +2635,6 @@ static void qemu_create_cli_devices(void)
     }
 
     /* init generic devices */
-    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
                       device_init_func, NULL, &error_fatal);
     QTAILQ_FOREACH(opt, &device_opts, next) {
@@ -2652,7 +2651,6 @@ static void qemu_create_cli_devices(void)
         object_unref(OBJECT(dev));
         loc_pop(&opt->loc);
     }
-    rom_reset_order_override();
 }
 
 static void qemu_machine_creation_done(void)
-- 
2.36.1


