Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A804ED91A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:02:06 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtV7-0003zW-BG
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:02:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMk-00062E-3j
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMe-00005n-24
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:25 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 5CF0921C47;
 Thu, 31 Mar 2022 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648727593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PfgWdlVUGs+KjbjO0RYJ3uN1s2MNL9Ymdw+vwjWH7w=;
 b=mnp16i6izQuAXpJu/HDa1a3EiIv6FgGtLax1ulWYpNBs2vjX6svzE/Zd7e0KX393YktT21
 i6hDKqH7A0/SAVqVxoR/He4nMVnpmIzeAVqvQP4pkwrHs6AXRqADkinrNvco6fOy5eAcVf
 GEU6MsUm1QiKIv2Kv8cdLhB0iP1OFhI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] machine: update machine allowed list related
 functions/fields
Date: Thu, 31 Mar 2022 13:53:09 +0200
Message-Id: <20220331115312.30018-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331115312.30018-1-damien.hedde@greensocs.com>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list will now accept any device (not only sysbus devices) so
we rename the related code and documentation.

Create some temporary inline functions with old names until
we've udpated callsites as well.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/boards.h | 50 +++++++++++++++++++++++++++------------------
 hw/core/machine.c   | 10 ++++-----
 2 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index c92ac8815c..1814793175 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -38,35 +38,45 @@ void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
 
 /**
- * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
+ * machine_class_allow_dynamic_device: Add type to list of valid devices
  * @mc: Machine class
- * @type: type to allow (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ * @type: type to allow (should be a subtype of TYPE_DEVICE having the
+ *        uc_requires_machine_allowance flag)
  *
  * Add the QOM type @type to the list of devices of which are subtypes
- * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
- * created (eg by the user on the command line with -device).
- * By default if the user tries to create any devices on the command line
- * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
- * for the special cases which are permitted for this machine model, the
- * machine model class init code must call this function to add them
- * to the list of specifically permitted devices.
+ * of TYPE_DEVICE but which are only permitted to be dynamically
+ * created (eg by the user on the command line with -device) if the
+ * machine allowed it.
+ *
+ * Otherwise if the user tries to create such a device on the command line,
+ * it will get an error message.
  */
-void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
+void machine_class_allow_dynamic_device(MachineClass *mc, const char *type);
+static inline void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc,
+                                                          const char *type)
+{
+    machine_class_allow_dynamic_device(mc, type);
+}
 
 /**
- * device_type_is_dynamic_sysbus: Check if type is an allowed sysbus device
+ * device_type_is_dynamic_allowed: Check if type is an allowed device
  * type for the machine class.
  * @mc: Machine class
- * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ * @type: type to check (should be a subtype of TYPE_DEVICE)
  *
  * Returns: true if @type is a type in the machine's list of
- * dynamically pluggable sysbus devices; otherwise false.
+ * dynamically pluggable devices; otherwise false.
  *
- * Check if the QOM type @type is in the list of allowed sysbus device
- * types (see machine_class_allowed_dynamic_sysbus_dev()).
+ * Check if the QOM type @type is in the list of allowed device
+ * types (see machine_class_allowed_dynamic_device()).
  * Note that if @type has a parent type in the list, it is allowed too.
  */
-bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
+bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type);
+static inline bool device_type_is_dynamic_sysbus(MachineClass *mc,
+                                                 const char *type)
+{
+    return device_type_is_dynamic_allowed(mc, type);
+}
 
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
@@ -74,12 +84,12 @@ bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
  * @dev: device to check
  *
  * Returns: true if @dev is a sysbus device on the machine's list
- * of dynamically pluggable sysbus devices; otherwise false.
+ * of dynamically pluggable devices; otherwise false.
  *
  * This function checks whether @dev is a valid dynamic sysbus device,
  * by first confirming that it is a sysbus device and then checking it
- * against the list of permitted dynamic sysbus devices which has been
- * set up by the machine using machine_class_allow_dynamic_sysbus_dev().
+ * against the list of permitted dynamic devices which has been
+ * set up by the machine using machine_class_allow_dynamic_device().
  *
  * It is valid to call this with something that is not a subclass of
  * TYPE_SYS_BUS_DEVICE; the function will return false in this case.
@@ -263,7 +273,7 @@ struct MachineClass {
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
     const char **valid_cpu_types;
-    strList *allowed_dynamic_sysbus_devices;
+    strList *allowed_dynamic_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
     bool ignore_boot_device_suffixes;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..fb1f7c8e5a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -545,9 +545,9 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
-void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
+void machine_class_allow_dynamic_device(MachineClass *mc, const char *type)
 {
-    QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
+    QAPI_LIST_PREPEND(mc->allowed_dynamic_devices, g_strdup(type));
 }
 
 bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
@@ -558,16 +558,16 @@ bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
         return false;
     }
 
-    return device_type_is_dynamic_sysbus(mc, object_get_typename(obj));
+    return device_type_is_dynamic_allowed(mc, object_get_typename(obj));
 }
 
-bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
+bool device_type_is_dynamic_allowed(MachineClass *mc, const char *type)
 {
     bool allowed = false;
     strList *wl;
     ObjectClass *klass = object_class_by_name(type);
 
-    for (wl = mc->allowed_dynamic_sysbus_devices;
+    for (wl = mc->allowed_dynamic_devices;
          !allowed && wl;
          wl = wl->next) {
         allowed |= !!object_class_dynamic_cast(klass, wl->value);
-- 
2.35.1


