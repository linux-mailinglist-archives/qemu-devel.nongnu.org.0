Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6B50193B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:56:05 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2lI-0005M0-Ue
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iR-0002gx-3K
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-00047m-Cu
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zQ1aJt93nFCv5iYcBQWQHXF42AI9uk1BQKuJmyq6Xg=;
 b=T5T5DB/HROPr5xlFLBljiavVAT4U3A775Z8YVQQZ1kvjIunXVTM3fez4lHG/+Q8FljWHQw
 R4YYf69Q+xALlIf0CVvhzvdtaYzCrOCDINfwrWqp7O5A75ET/o+Xh8ZIQzq1zFrM5SwsqI
 52Ha2oGhZMTJC5vUQAMacG8MBlH768c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-nmSMSBJvM0GSu3anEXYePA-1; Thu, 14 Apr 2022 12:53:02 -0400
X-MC-Unique: nmSMSBJvM0GSu3anEXYePA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE586805F7C
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB3AB14583C1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 2/5] machine: add boot compound property
Date: Thu, 14 Apr 2022 12:52:57 -0400
Message-Id: <20220414165300.555321-3-pbonzini@redhat.com>
In-Reply-To: <20220414165300.555321-1-pbonzini@redhat.com>
References: <20220414165300.555321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Make -boot syntactic sugar for a compound property "-machine boot.{order,menu,...}".
machine_boot_parse is replaced by the setter for the property.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 99 ++++++++++++++++++++++++---------------------
 include/hw/boards.h |  1 -
 softmmu/vl.c        | 16 +++-----
 3 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index dc059cfab5..710dfbd982 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -771,66 +771,63 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
-void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+static void machine_get_boot(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    BootConfiguration *config = &ms->boot_config;
+    visit_type_BootConfiguration(v, name, &config, &error_abort);
+}
+
+static void machine_free_boot_config(MachineState *ms)
+{
+    g_free(ms->boot_config.order);
+    g_free(ms->boot_config.once);
+    g_free(ms->boot_config.splash);
+}
+
+static void machine_copy_boot_config(MachineState *ms, BootConfiguration *config)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(ms);
-    const char *s;
+
+    machine_free_boot_config(ms);
+    ms->boot_config = *config;
+    if (!config->has_order) {
+        ms->boot_config.has_order = true;
+        ms->boot_config.order = g_strdup(machine_class->default_boot_order);
+    }
+}
+
+static void machine_set_boot(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
     ERRP_GUARD();
+    MachineState *ms = MACHINE(obj);
+    BootConfiguration *config = NULL;
 
-    ms->boot_config = (BootConfiguration) {
-        .has_order = true,
-        .order = (char *)machine_class->default_boot_order,
-        .has_strict = true,
-        .strict = false,
-    };
-    if (!opts) {
+    if (!visit_type_BootConfiguration(v, name, &config, errp)) {
         return;
     }
-
-    s = qemu_opt_get(opts, "order");
-    if (s) {
-        validate_bootdevices(s, errp);
+    if (config->has_order) {
+        validate_bootdevices(config->order, errp);
         if (*errp) {
-            return;
+            goto out_free;
         }
-        ms->boot_config.order = (char *)s;
     }
-
-    s = qemu_opt_get(opts, "once");
-    if (s) {
-        validate_bootdevices(s, errp);
+    if (config->has_once) {
+        validate_bootdevices(config->once, errp);
         if (*errp) {
-            return;
+            goto out_free;
         }
-        ms->boot_config.has_once = true;
-        ms->boot_config.once = (char *)s;
     }
 
-    s = qemu_opt_get(opts, "splash");
-    if (s) {
-        ms->boot_config.has_splash = true;
-        ms->boot_config.splash = (char *)s;
-    }
-
-    s = qemu_opt_get(opts, "splash-time");
-    if (s) {
-        ms->boot_config.has_splash_time = true;
-        ms->boot_config.splash_time = qemu_opt_get_number(opts, "splash-time", -1);
-    }
+    machine_copy_boot_config(ms, config);
+    /* Strings live in ms->boot_config.  */
+    free(config);
+    return;
 
-    s = qemu_opt_get(opts, "reboot-timeout");
-    if (s) {
-        ms->boot_config.has_reboot_timeout = true;
-        ms->boot_config.reboot_timeout = qemu_opt_get_number(opts, "reboot-timeout", -1);
-    }
-
-    s = qemu_opt_get(opts, "menu");
-    if (s) {
-        ms->boot_config.has_menu = true;
-        ms->boot_config.menu = qemu_opt_get_bool(opts, "menu", false);
-    }
-
-    ms->boot_config.strict = qemu_opt_get_bool(opts, "strict", false);
+out_free:
+    qapi_free_BootConfiguration(config);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
@@ -871,6 +868,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "dumpdtb",
         "Dump current dtb to a file and quit");
 
+    object_class_property_add(oc, "boot", "BootConfiguration",
+        machine_get_boot, machine_set_boot,
+        NULL, NULL);
+    object_class_property_set_description(oc, "boot",
+        "Boot configuration");
+
     object_class_property_add(oc, "smp", "SMPConfiguration",
         machine_get_smp, machine_set_smp,
         NULL, NULL);
@@ -1004,12 +1007,16 @@ static void machine_initfn(Object *obj)
     ms->smp.clusters = 1;
     ms->smp.cores = 1;
     ms->smp.threads = 1;
+    ms->smp.sockets = 1;
+
+    machine_copy_boot_config(ms, &(BootConfiguration){ 0 });
 }
 
 static void machine_finalize(Object *obj)
 {
     MachineState *ms = MACHINE(obj);
 
+    machine_free_boot_config(ms);
     g_free(ms->kernel_filename);
     g_free(ms->initrd_filename);
     g_free(ms->kernel_cmdline);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4b4e8d6991..8994f6c93b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,7 +26,6 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
-void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5759df3664..80936e595f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1878,16 +1878,11 @@ static bool object_create_early(const char *type)
 
 static void qemu_apply_machine_options(QDict *qdict)
 {
-    QemuOpts *opts;
-
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
     current_machine->ram_size = ram_size;
     current_machine->maxram_size = maxram_size;
     current_machine->ram_slots = ram_slots;
 
-    opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
-    machine_boot_parse(current_machine, opts, &error_fatal);
-
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
@@ -2183,7 +2178,8 @@ static bool is_qemuopts_group(const char *group)
 {
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
-        g_str_equal(group, "smp-opts")) {
+        g_str_equal(group, "smp-opts") ||
+        g_str_equal(group, "boot-opts")) {
         return false;
     }
     return true;
@@ -2205,6 +2201,8 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         keyval_merge(machine_opts_dict, dict, errp);
     } else if (g_str_equal(group, "smp-opts")) {
         machine_merge_property("smp", dict, &error_fatal);
+    } else if (g_str_equal(group, "boot-opts")) {
+        machine_merge_property("boot", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2947,11 +2945,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
                 break;
             case QEMU_OPTION_boot:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("boot-opts"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(1);
-                }
+                machine_parse_property_opt(qemu_find_opts("boot-opts"), "boot", optarg);
                 break;
             case QEMU_OPTION_fda:
             case QEMU_OPTION_fdb:
-- 
2.31.1



