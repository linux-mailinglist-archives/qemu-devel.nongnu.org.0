Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F42FA6EE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:02:18 +0100 (CET)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Xuz-0002z4-4F
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRX-0002Zl-W1
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRQ-0001Wu-Qu
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8E+RRMhRhbIYkvph+TjcQ2hT43RCYgnyRS8Fb3iimA=;
 b=OJ56FWzIY6YmEQXvbRZGrFrOIcCeGo91HlX1Sav9j5deXiVDoKZrqjpAWBtfy2d8HpnqTB
 4Bt/rr4tk4rzU/bo/t9hmp/Rt4Yf2zpASvra9QHcozhgHH55LPKkZGCjA9eXJQictC4O8S
 qXNuOj5aIi5wj8XZy5Q/nj9FEI/uXPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-2mNlWSpQMA2as8Iq-mSnFQ-1; Mon, 18 Jan 2021 11:31:40 -0500
X-MC-Unique: 2mNlWSpQMA2as8Iq-mSnFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A8E190B2A0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49A4719C66;
 Mon, 18 Jan 2021 16:31:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/25] vl: switch -M parsing to keyval
Date: Mon, 18 Jan 2021 11:31:11 -0500
Message-Id: <20210118163113.780171-24-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch from QemuOpts to keyval.  This enables non-scalar
machine properties.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 296 +++++++++++++++++++++++----------------------------
 1 file changed, 132 insertions(+), 164 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f8b28618c9..ff906d541d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -136,6 +136,8 @@ static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
 static const char *loadvm;
+static const char *accelerators;
+static QDict *machine_opts_dict;
 static GSList *object_opts_list = NULL;
 static ram_addr_t maxram_size;
 static uint64_t ram_slots;
@@ -227,21 +229,6 @@ static QemuOptsList qemu_option_rom_opts = {
     },
 };
 
-static QemuOptsList qemu_machine_opts = {
-    .name = "machine",
-    .implied_opt_name = "type",
-    .merge_lists = true,
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_machine_opts.head),
-    .desc = {
-        /*
-         * no elements => accept any
-         * sanity checking will happen later
-         * when setting machine properties
-         */
-        { }
-    },
-};
-
 static QemuOptsList qemu_accel_opts = {
     .name = "accel",
     .implied_opt_name = "accel",
@@ -481,16 +468,6 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
-/**
- * Get machine options
- *
- * Returns: machine options (never null).
- */
-static QemuOpts *qemu_get_machine_opts(void)
-{
-    return qemu_find_opts_singleton("machine");
-}
-
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
@@ -798,33 +775,6 @@ static MachineClass *find_default_machine(GSList *machines)
     return default_machineclass;
 }
 
-static int machine_help_func(QemuOpts *opts, MachineState *machine)
-{
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-
-    if (!qemu_opt_has_help_opt(opts)) {
-        return 0;
-    }
-
-    object_property_iter_init(&iter, OBJECT(machine));
-    while ((prop = object_property_iter_next(&iter))) {
-        if (!prop->set) {
-            continue;
-        }
-
-        printf("%s.%s=%s", MACHINE_GET_CLASS(machine)->name,
-               prop->name, prop->type);
-        if (prop->description) {
-            printf(" (%s)\n", prop->description);
-        } else {
-            printf("\n");
-        }
-    }
-
-    return 1;
-}
-
 static void version(void)
 {
     printf("QEMU emulator version " QEMU_FULL_VERSION "\n"
@@ -1515,33 +1465,28 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b)
                   object_class_get_name(OBJECT_CLASS(mc1)));
 }
 
-static MachineClass *machine_parse(const char *name, GSList *machines)
+static void machine_help_func(const QDict *qdict)
 {
-    MachineClass *mc;
-    GSList *el;
+    GSList *machines, *el;
+    const char *type = qdict_get_try_str(qdict, "type");
 
-    if (is_help_option(name)) {
-        printf("Supported machines are:\n");
-        machines = g_slist_sort(machines, machine_class_cmp);
-        for (el = machines; el; el = el->next) {
-            MachineClass *mc = el->data;
-            if (mc->alias) {
-                printf("%-20s %s (alias of %s)\n", mc->alias, mc->desc, mc->name);
-            }
-            printf("%-20s %s%s%s\n", mc->name, mc->desc,
-                   mc->is_default ? " (default)" : "",
-                   mc->deprecation_reason ? " (deprecated)" : "");
-        }
-        exit(0);
+    if (type) {
+        type_print_class_properties(type);
+        return;
     }
 
-    mc = find_machine(name, machines);
-    if (!mc) {
-        error_report("unsupported machine type");
-        error_printf("Use -machine help to list supported machines\n");
-        exit(1);
+    printf("Supported machines are:\n");
+    machines = object_class_get_list(TYPE_MACHINE, false);
+    machines = g_slist_sort(machines, machine_class_cmp);
+    for (el = machines; el; el = el->next) {
+        MachineClass *mc = el->data;
+        if (mc->alias) {
+            printf("%-20s %s (alias of %s)\n", mc->alias, mc->desc, mc->name);
+        }
+        printf("%-20s %s%s%s\n", mc->name, mc->desc,
+               mc->is_default ? " (default)" : "",
+               mc->deprecation_reason ? " (deprecated)" : "");
     }
-    return mc;
 }
 
 static const char *pid_file;
@@ -1594,32 +1539,31 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
     return popt;
 }
 
-static MachineClass *select_machine(void)
+static MachineClass *select_machine(QDict *qdict, Error **errp)
 {
+    const char *optarg = qdict_get_try_str(qdict, "type");
     GSList *machines = object_class_get_list(TYPE_MACHINE, false);
-    MachineClass *machine_class = find_default_machine(machines);
-    const char *optarg;
-    QemuOpts *opts;
-    Location loc;
-
-    loc_push_none(&loc);
-
-    opts = qemu_get_machine_opts();
-    qemu_opts_loc_restore(opts);
+    MachineClass *machine_class;
+    Error *local_err = NULL;
 
-    optarg = qemu_opt_get(opts, "type");
     if (optarg) {
-        machine_class = machine_parse(optarg, machines);
-    }
-
-    if (!machine_class) {
-        error_report("No machine specified, and there is no default");
-        error_printf("Use -machine help to list supported machines\n");
-        exit(1);
+        machine_class = find_machine(optarg, machines);
+        qdict_del(qdict, "type");
+        if (!machine_class) {
+            error_setg(&local_err, "unsupported machine type");
+        }
+    } else {
+        machine_class = find_default_machine(machines);
+        if (!machine_class) {
+            error_setg(&local_err, "No machine specified, and there is no default");
+        }
     }
 
-    loc_pop(&loc);
     g_slist_free(machines);
+    if (local_err) {
+        error_append_hint(&local_err, "Use -machine help to list supported machines\n");
+        error_propagate(errp, local_err);
+    }
     return machine_class;
 }
 
@@ -1638,38 +1582,66 @@ static int object_parse_property_opt(Object *obj,
     return 0;
 }
 
-static int machine_set_property(void *opaque,
-                                const char *name, const char *value,
-                                Error **errp)
+/* *Non*recursively replace underscores with dashes in QDict keys.  */
+static void keyval_dashify(QDict *qdict, Error **errp)
 {
-    g_autofree char *qom_name = g_strdup(name);
+    const QDictEntry *ent, *next;
     char *p;
 
-    for (p = qom_name; *p; p++) {
-        if (*p == '_') {
-            *p = '-';
+    for (ent = qdict_first(qdict); ent; ent = next) {
+        g_autofree char *new_key = NULL;
+
+        next = qdict_next(qdict, ent);
+        if (!strchr(ent->key, '_')) {
+            continue;
+        }
+        new_key = g_strdup(ent->key);
+        for (p = new_key; *p; p++) {
+            if (*p == '_') {
+                *p = '-';
+            }
         }
+        if (qdict_haskey(qdict, new_key)) {
+            error_setg(errp, "Conflict between '%s' and '%s'", ent->key, new_key);
+            return;
+        }
+        qobject_ref(ent->value);
+        qdict_put_obj(qdict, new_key, ent->value);
+        qdict_del(qdict, ent->key);
     }
+}
+
+static void qemu_apply_legacy_machine_options(QDict *qdict)
+{
+    const char *value;
+
+    keyval_dashify(qdict, &error_fatal);
 
     /* Legacy options do not correspond to MachineState properties.  */
-    if (g_str_equal(qom_name, "accel")) {
-        return 0;
-    }
-    if (g_str_equal(qom_name, "igd-passthru")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
-        return 0;
+    value = qdict_get_try_str(qdict, "accel");
+    if (value) {
+        accelerators = g_strdup(value);
+        qdict_del(qdict, "accel");
     }
-    if (g_str_equal(qom_name, "kvm-shadow-mem")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
-        return 0;
+
+    value = qdict_get_try_str(qdict, "igd-passthru");
+    if (value) {
+        object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), "igd-passthru", value);
+        qdict_del(qdict, "igd-passthru");
     }
-    if (g_str_equal(qom_name, "kernel-irqchip")) {
-        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
-        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), qom_name, value);
-        return 0;
+
+    value = qdict_get_try_str(qdict, "kvm-shadow-mem");
+    if (value) {
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kvm-shadow-mem", value);
+        qdict_del(qdict, "kvm-shadow-mem");
     }
 
-    return object_parse_property_opt(opaque, name, value, "type", errp);
+    value = qdict_get_try_str(qdict, "kernel-irqchip");
+    if (value) {
+        object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), "kernel-irqchip", value);
+        object_register_sugar_prop(ACCEL_CLASS_NAME("whpx"), "kernel-irqchip", value);
+        qdict_del(qdict, "kernel-irqchip");
+    }
 }
 
 /*
@@ -1727,16 +1699,14 @@ static bool object_create_early(const char *type)
     return true;
 }
 
-static void qemu_apply_machine_options(void)
+static void qemu_apply_machine_options(QDict *qdict)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
-    QemuOpts *machine_opts = qemu_get_machine_opts();
     const char *boot_order = NULL;
     const char *boot_once = NULL;
     QemuOpts *opts;
 
-    qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
-                     &error_fatal);
+    object_set_properties_from_keyval(OBJECT(current_machine), qdict, &error_fatal);
     current_machine->ram_size = ram_size;
     current_machine->maxram_size = maxram_size;
     current_machine->ram_slots = ram_slots;
@@ -1765,10 +1735,8 @@ static void qemu_apply_machine_options(void)
     current_machine->boot_once = boot_once;
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
-        const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
-        const char *kernel_cmdline = qemu_opt_get(machine_opts, "append") ?: "";
         /* fall back to the -kernel/-append */
-        semihosting_arg_fallback(kernel_filename, kernel_cmdline);
+        semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
     }
 }
 
@@ -1833,8 +1801,7 @@ static void qemu_create_early_backends(void)
 
     /*
      * Note: we need to create audio and block backends before
-     * machine_set_property(), so machine properties can refer to
-     * them.
+     * setting machine properties, so they can be referred to.
      */
     configure_blockdev(&bdo_queue, machine_class, snapshot);
     audio_init_audiodevs();
@@ -2004,16 +1971,14 @@ static void set_memory_options(MachineClass *mc)
     loc_pop(&loc);
 }
 
-static void qemu_create_machine(MachineClass *machine_class)
+static void qemu_create_machine(QDict *qdict)
 {
+    MachineClass *machine_class = select_machine(qdict, &error_fatal);
     object_set_machine_compat_props(machine_class->compat_props);
 
     set_memory_options(machine_class);
 
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
-    if (machine_help_func(qemu_get_machine_opts(), current_machine)) {
-        exit(0);
-    }
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine));
     object_property_add_child(container_get(OBJECT(current_machine),
@@ -2044,8 +2009,11 @@ static void qemu_create_machine(MachineClass *machine_class)
      * specified either by the configuration file or by the command line.
      */
     if (machine_class->default_machine_opts) {
-        qemu_opts_set_defaults(qemu_find_opts("machine"),
-                               machine_class->default_machine_opts, 0);
+        QDict *default_opts =
+            keyval_parse(machine_class->default_machine_opts, NULL, NULL,
+                         &error_abort);
+        object_set_properties_from_keyval(OBJECT(current_machine), default_opts, &error_abort);
+        qobject_unref(default_opts);
     }
 }
 
@@ -2067,7 +2035,8 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
-    if (g_str_equal(group, "object")) {
+    if (g_str_equal(group, "object") ||
+        g_str_equal(group, "machine")) {
         return false;
     }
     return true;
@@ -2109,6 +2078,8 @@ static void qemu_record_config_group(const char *group, QDict *dict, Error **err
     p_head = qemu_config_list(group);
     if (p_head) {
         *p_head = g_slist_prepend(*p_head, dict);
+    } else if (g_str_equal(group, "machine")) {
+        keyval_merge(machine_opts_dict, dict, errp);
     } else {
         abort();
     }
@@ -2262,13 +2233,11 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
 
 static void configure_accelerators(const char *progname)
 {
-    const char *accelerators;
     bool init_failed = false;
 
     qemu_opts_foreach(qemu_find_opts("icount"),
                       do_configure_icount, NULL, &error_fatal);
 
-    accelerators = qemu_opt_get(qemu_get_machine_opts(), "accel");
     if (QTAILQ_EMPTY(&qemu_accel_opts.head)) {
         char **accel_list, **tmp;
 
@@ -2356,12 +2325,11 @@ static void create_default_memdev(MachineState *ms, const char *path)
                             &error_fatal);
 }
 
-static void qemu_validate_options(void)
+static void qemu_validate_options(const QDict *machine_opts)
 {
-    QemuOpts *machine_opts = qemu_get_machine_opts();
-    const char *kernel_filename = qemu_opt_get(machine_opts, "kernel");
-    const char *initrd_filename = qemu_opt_get(machine_opts, "initrd");
-    const char *kernel_cmdline = qemu_opt_get(machine_opts, "append");
+    const char *kernel_filename = qdict_get_try_str(machine_opts, "kernel");
+    const char *initrd_filename = qdict_get_try_str(machine_opts, "initrd");
+    const char *kernel_cmdline = qdict_get_try_str(machine_opts, "append");
 
     if (kernel_filename == NULL) {
          if (kernel_cmdline != NULL) {
@@ -2683,7 +2651,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_trace_opts);
     qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
-    qemu_add_opts(&qemu_machine_opts);
     qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
     qemu_add_opts(&qemu_smp_opts);
@@ -2723,6 +2690,7 @@ void qemu_init(int argc, char **argv, char **envp)
         }
     }
 
+    machine_opts_dict = qdict_new();
     if (userconfig) {
         qemu_read_default_config_file(&error_fatal);
     }
@@ -2812,8 +2780,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 parse_display(optarg);
                 break;
             case QEMU_OPTION_nographic:
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "graphics=off", false);
+                qdict_put_str(machine_opts_dict, "graphics", "off");
                 nographic = true;
                 dpy.type = DISPLAY_TYPE_NONE;
                 break;
@@ -2837,16 +2804,16 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_kernel:
-                qemu_opts_set(qemu_find_opts("machine"), "kernel", optarg, &error_abort);
+                qdict_put_str(machine_opts_dict, "kernel", optarg);
                 break;
             case QEMU_OPTION_initrd:
-                qemu_opts_set(qemu_find_opts("machine"), "initrd", optarg, &error_abort);
+                qdict_put_str(machine_opts_dict, "initrd", optarg);
                 break;
             case QEMU_OPTION_append:
-                qemu_opts_set(qemu_find_opts("machine"), "append", optarg, &error_abort);
+                qdict_put_str(machine_opts_dict, "append", optarg);
                 break;
             case QEMU_OPTION_dtb:
-                qemu_opts_set(qemu_find_opts("machine"), "dtb", optarg, &error_abort);
+                qdict_put_str(machine_opts_dict, "dtb", optarg);
                 break;
             case QEMU_OPTION_cdrom:
                 drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
@@ -2956,7 +2923,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_bios:
-                qemu_opts_set(qemu_find_opts("machine"), "firmware", optarg, &error_abort);
+                qdict_put_str(machine_opts_dict, "firmware", optarg);
                 break;
             case QEMU_OPTION_singlestep:
                 singlestep = 1;
@@ -3225,17 +3192,20 @@ void qemu_init(int argc, char **argv, char **envp)
                 preconfig_requested = true;
                 break;
             case QEMU_OPTION_enable_kvm:
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "accel=kvm", false);
+                qdict_put_str(machine_opts_dict, "accel", "kvm");
                 break;
             case QEMU_OPTION_M:
             case QEMU_OPTION_machine:
-                olist = qemu_find_opts("machine");
-                opts = qemu_opts_parse_noisily(olist, optarg, true);
-                if (!opts) {
-                    exit(1);
+                {
+                    bool help;
+
+                    keyval_parse_into(machine_opts_dict, optarg, "type", &help, &error_fatal);
+                    if (help) {
+                        machine_help_func(machine_opts_dict);
+                        exit(EXIT_SUCCESS);
+                    }
+                    break;
                 }
-                break;
             case QEMU_OPTION_accel:
                 accel_opts = qemu_opts_parse_noisily(qemu_find_opts("accel"),
                                                      optarg, true);
@@ -3262,14 +3232,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_usb:
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "usb=on", false);
+                qdict_put_str(machine_opts_dict, "usb", "on");
                 break;
             case QEMU_OPTION_usbdevice:
                 error_report("'-usbdevice' is deprecated, please use "
                              "'-device usb-...' instead");
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "usb=on", false);
+                qdict_put_str(machine_opts_dict, "usb", "on");
                 add_device_config(DEV_USB, optarg);
                 break;
             case QEMU_OPTION_device:
@@ -3288,12 +3256,10 @@ void qemu_init(int argc, char **argv, char **envp)
                 vnc_parse(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_no_acpi:
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "acpi=off", false);
+                qdict_put_str(machine_opts_dict, "acpi", "off");
                 break;
             case QEMU_OPTION_no_hpet:
-                olist = qemu_find_opts("machine");
-                qemu_opts_parse_noisily(olist, "hpet=off", false);
+                qdict_put_str(machine_opts_dict, "hpet", "off");
                 break;
             case QEMU_OPTION_no_reboot:
                 olist = qemu_find_opts("action");
@@ -3529,7 +3495,7 @@ void qemu_init(int argc, char **argv, char **envp)
      */
     loc_set_none();
 
-    qemu_validate_options();
+    qemu_validate_options(machine_opts_dict);
     qemu_process_sugar_options();
 
     /*
@@ -3549,7 +3515,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     configure_rtc(qemu_find_opts_singleton("rtc"));
 
-    qemu_create_machine(select_machine());
+    qemu_create_machine(machine_opts_dict);
 
     suspend_mux_open();
 
@@ -3557,12 +3523,14 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-    qemu_apply_machine_options();
+    qemu_apply_legacy_machine_options(machine_opts_dict);
+    qemu_apply_machine_options(machine_opts_dict);
+    qobject_unref(machine_opts_dict);
     phase_advance(PHASE_MACHINE_CREATED);
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
-     * after machine_set_property().
+     * after qemu_apply_machine_options.
      */
     configure_accelerators(argv[0]);
     phase_advance(PHASE_ACCEL_CREATED);
-- 
2.26.2



