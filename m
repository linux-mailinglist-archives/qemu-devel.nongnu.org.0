Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673F416EBC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:17:34 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThKn-0005sQ-FB
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAY-00060w-QC
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAV-0003wA-Um
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+aoIqWAHmOAumQFA38+fhhk4UIxPgmsLdA5N3QEqqE=;
 b=OjCT6zdGgb2gXw794weAS6S/7UDH6nDkCLBERApo1BjeK0+8FlYAb+KhAMfI1sPTpYanYI
 T+qCXymGE28QEzmnmpGnn3uu6vkldQr3w65VXgTsFw0qSi5N2vN1xs9dMbdYTjYPwzu7pJ
 /Z2n69PkLvCnUH9n5pRsVFPFO7bKc/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-Pe4VjH5kMKyRRYXV6zEYzw-1; Fri, 24 Sep 2021 05:06:52 -0400
X-MC-Unique: Pe4VjH5kMKyRRYXV6zEYzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B93D80D686;
 Fri, 24 Sep 2021 09:06:51 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 156EA5D9DC;
 Fri, 24 Sep 2021 09:06:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] vl: Enable JSON syntax for -device
Date: Fri, 24 Sep 2021 11:04:26 +0200
Message-Id: <20210924090427.9218-11-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like we already do for -object, introduce support for JSON syntax in
-device, which can be kept stable in the long term and guarantees that a
single code path with identical behaviour is used for both QMP and the
command line. Compared to the QemuOpts based code, the parser contains
less surprises and has support for non-scalar options (lists and
structs). Switching management tools to JSON means that we can more
easily change the "human" CLI syntax from QemuOpts to the keyval parser
later.

In the QAPI schema, a feature flag is added to the device-add command to
allow management tools to detect support for this.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qdev.json | 15 +++++++++----
 softmmu/vl.c   | 58 ++++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 62 insertions(+), 11 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..cdc8f911b5 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -32,17 +32,23 @@
 ##
 # @device_add:
 #
+# Add a device.
+#
 # @driver: the name of the new device's driver
 #
 # @bus: the device's parent bus (device tree path)
 #
 # @id: the device's ID, must be unique
 #
-# Additional arguments depend on the type.
-#
-# Add a device.
+# Features:
+# @json-cli: If present, the "-device" command line option supports JSON
+#            syntax with a structure identical to the arguments of this
+#            command.
 #
 # Notes:
+#
+# Additional arguments depend on the type.
+#
 # 1. For detailed information about this command, please refer to the
 #    'docs/qdev-device-use.txt' file.
 #
@@ -67,7 +73,8 @@
 ##
 { 'command': 'device_add',
   'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
-  'gen': false } # so we can get the additional arguments
+  'gen': false, # so we can get the additional arguments
+  'features': ['json-cli'] }
 
 ##
 # @device_del:
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..7596d9da06 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -144,6 +144,12 @@ typedef struct ObjectOption {
     QTAILQ_ENTRY(ObjectOption) next;
 } ObjectOption;
 
+typedef struct DeviceOption {
+    QDict *opts;
+    Location loc;
+    QTAILQ_ENTRY(DeviceOption) next;
+} DeviceOption;
+
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
@@ -151,6 +157,7 @@ static const char *loadvm;
 static const char *accelerators;
 static QDict *machine_opts_dict;
 static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
+static QTAILQ_HEAD(, DeviceOption) device_opts = QTAILQ_HEAD_INITIALIZER(device_opts);
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
 static int display_remote;
@@ -494,21 +501,39 @@ const char *qemu_get_vm_name(void)
     return qemu_name;
 }
 
-static int default_driver_check(void *opaque, QemuOpts *opts, Error **errp)
+static void default_driver_disable(const char *driver)
 {
-    const char *driver = qemu_opt_get(opts, "driver");
     int i;
 
-    if (!driver)
-        return 0;
+    if (!driver) {
+        return;
+    }
+
     for (i = 0; i < ARRAY_SIZE(default_list); i++) {
         if (strcmp(default_list[i].driver, driver) != 0)
             continue;
         *(default_list[i].flag) = 0;
     }
+}
+
+static int default_driver_check(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *driver = qemu_opt_get(opts, "driver");
+
+    default_driver_disable(driver);
     return 0;
 }
 
+static void default_driver_check_json(void)
+{
+    DeviceOption *opt;
+
+    QTAILQ_FOREACH(opt, &device_opts, next) {
+        const char *driver = qdict_get_try_str(opt->opts, "driver");
+        default_driver_disable(driver);
+    }
+}
+
 static int parse_name(void *opaque, QemuOpts *opts, Error **errp)
 {
     const char *proc_name;
@@ -1311,6 +1336,7 @@ static void qemu_disable_default_devices(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
 
+    default_driver_check_json();
     qemu_opts_foreach(qemu_find_opts("device"),
                       default_driver_check, NULL, NULL);
     qemu_opts_foreach(qemu_find_opts("global"),
@@ -2637,6 +2663,8 @@ static void qemu_init_board(void)
 
 static void qemu_create_cli_devices(void)
 {
+    DeviceOption *opt;
+
     soundhw_init();
 
     qemu_opts_foreach(qemu_find_opts("fw_cfg"),
@@ -2652,6 +2680,13 @@ static void qemu_create_cli_devices(void)
     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
     qemu_opts_foreach(qemu_find_opts("device"),
                       device_init_func, NULL, &error_fatal);
+    QTAILQ_FOREACH(opt, &device_opts, next) {
+        QObject *ret_data;
+
+        loc_push_restore(&opt->loc);
+        qmp_device_add(opt->opts, &ret_data, &error_fatal);
+        loc_pop(&opt->loc);
+    }
     rom_reset_order_override();
 }
 
@@ -3352,9 +3387,18 @@ void qemu_init(int argc, char **argv, char **envp)
                 add_device_config(DEV_USB, optarg);
                 break;
             case QEMU_OPTION_device:
-                if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
-                                             optarg, true)) {
-                    exit(1);
+                if (optarg[0] == '{') {
+                    QObject *obj = qobject_from_json(optarg, &error_fatal);
+                    DeviceOption *opt = g_new0(DeviceOption, 1);
+                    opt->opts = qobject_to(QDict, obj);
+                    loc_save(&opt->loc);
+                    assert(opt->opts != NULL);
+                    QTAILQ_INSERT_TAIL(&device_opts, opt, next);
+                } else {
+                    if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
+                                                 optarg, true)) {
+                        exit(1);
+                    }
                 }
                 break;
             case QEMU_OPTION_smp:
-- 
2.31.1


