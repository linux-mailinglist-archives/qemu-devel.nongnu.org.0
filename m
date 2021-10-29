Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183343FE74
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:30:59 +0200 (CEST)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSuH-0000Au-IU
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpY-0006Pe-Mx
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpV-0003g5-Tq
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:04 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id D7D0821A8F;
 Fri, 29 Oct 2021 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635517557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=huBxGOz5zinexbYxgB4BKQGsLdO/Z+xWnjghER1WKR8=;
 b=CZlgbQ3QqpDMIShJ7Wn3SMnKgamtstYMfx7Y0m3erTn0SLs3dUG83ZSre4TLF8h4JcatZ4
 Bmx0WDKtM1X+i0jvpJsHzOxwKpTs5Eth3RgrDeQ5XHkTHiqzb8DZHOEjvjdr4q61/Pjo+E
 8GlqbmzA5gIsinHR4jouImWtPyvoHJ8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] machine: add device_type_is_dynamic_sysbus function
Date: Fri, 29 Oct 2021 16:22:56 +0200
Message-Id: <20211029142258.484907-2-damien.hedde@greensocs.com>
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

Right now the allowance check for adding a sysbus device using
-device cli option (or device_add qmp command) is done well after
the device has been created. It is done during the machine init done
notifier: machine_init_notify() in hw/core/machine.c

This new function will allow us to do the check at the right time and
issue an error if it fails.

Also make device_is_dynamic_sysbus() use the new function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Ani Sinha <ani@anisinha.ca>

v3: change the function name (Ani)
---
 include/hw/boards.h | 15 +++++++++++++++
 hw/core/machine.c   | 13 ++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5adbcbb99b..85adf660c1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * device_type_is_dynamic_sysbus: Check if type is an allowed sysbus device
+ * type for the machine class.
+ * @mc: Machine class
+ * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Returns: true if @type is a type in the machine's list of
+ * dynamically pluggable sysbus devices; otherwise false.
+ *
+ * Check if the QOM type @type is in the list of allowed sysbus device
+ * types (see machine_class_allowed_dynamic_sysbus_dev()).
+ * Note that if @type has a parent type in the list, it is allowed too.
+ */
+bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
+
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
  * @mc: Machine class
diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32..0d20104796 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -548,18 +548,25 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 
 bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    bool allowed = false;
-    strList *wl;
     Object *obj = OBJECT(dev);
 
     if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
         return false;
     }
 
+    return device_type_is_dynamic_sysbus(mc, object_get_typename(obj));
+}
+
+bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
+{
+    bool allowed = false;
+    strList *wl;
+    ObjectClass *klass = object_class_by_name(type);
+
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(obj, wl->value);
+        allowed |= !!object_class_dynamic_cast(klass, wl->value);
     }
 
     return allowed;
-- 
2.33.0


