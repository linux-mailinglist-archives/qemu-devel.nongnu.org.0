Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D262C43FE76
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:31:00 +0200 (CEST)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSuJ-0000Av-P3
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpY-0006Pd-Mv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpU-0003gH-TB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:03 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id DEB0521C38;
 Fri, 29 Oct 2021 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635517558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIss5qx/DSNm3c9ezG/rlYMAgoQW6tmNSpzgm8XKg/4=;
 b=VJehLvC6Xf8xKc7MqT2convbXgYuiEt6mWLk289p+gbRD6Iip3jIbkjsp7Hy7PpCUXWIpa
 KkRgMkHsfq4xbDhj2yJs63GgqE5Wu94MGvuZ9vsyf09AakNnaIzvKRVeoX1ZsD4xoEnDet
 vz4FcDyeAVhPar1VOLMHZzbZ7XFMSa4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] qdev-monitor: Check sysbus device type before creating
 it
Date: Fri, 29 Oct 2021 16:22:57 +0200
Message-Id: <20211029142258.484907-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029142258.484907-1-damien.hedde@greensocs.com>
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an early check to test if the requested sysbus device type
is allowed by the current machine before creating the device. This
impacts both -device cli option and device_add qmp command.

Before this patch, the check was done well after the device has
been created (in a machine init done notifier). We can now report
the error right away.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

v3: update error message
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4851de51a5..e49d9773d2 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -42,6 +42,7 @@
 #include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
+#include "hw/boards.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -254,6 +255,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
+        /* sysbus devices need to be allowed by the machine */
+        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
+        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
+                       "a dynamic sysbus device type for the machine");
+            return NULL;
+        }
+    }
+
     return dc;
 }
 
-- 
2.33.0


