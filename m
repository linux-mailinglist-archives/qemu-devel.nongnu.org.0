Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A11501956
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:58:46 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2nt-0001Z5-PC
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iS-0002hV-Oe
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-00047r-9t
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKRQRyipDkYHVePAF27aNBDPbP60W9gShxjcX6v2J3A=;
 b=XmLWe8V4WhdZn8SdvE4kIjMHzU/UVX/hfZWvUEItLKpRrdMip78bdbAOWSbC8JdzOVCYYE
 a5NsOJxZQolyD9lOMSgQOUaoEb5kRMgXNlXRdZ+D83vCdZ7l6v3fXNjk8ECJKDY6vomtTS
 dWXxtMMwfFZWbOMuxegYdOWt+KV/xhM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-OipfeEaNOcOCkp9ixmJGmA-1; Thu, 14 Apr 2022 12:53:02 -0400
X-MC-Unique: OipfeEaNOcOCkp9ixmJGmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9425800B21
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6A1B14583C1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 3/5] machine: add mem compound property
Date: Thu, 14 Apr 2022 12:52:58 -0400
Message-Id: <20220414165300.555321-4-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Make -m syntactic sugar for a compound property "-machine
mem.{size,max-size,slots}".  The new property does not have
the magic conversion to megabytes of unsuffixed arguments,
and also does not understand that "0" means the default size
(you have to leave it out to get the default).  This means
that we need to convert the QemuOpts by hand to a QDict.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c |  80 ++++++++++++++++++++++++++++++
 qapi/machine.json |  18 +++++++
 softmmu/vl.c      | 123 +++++++++++++++-------------------------------
 3 files changed, 138 insertions(+), 83 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 710dfbd982..d5cfffe8a0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -520,6 +520,78 @@ static void machine_set_hmat(Object *obj, bool value, Error **errp)
     ms->numa_state->hmat_enabled = value;
 }
 
+static void machine_get_mem(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    MemorySizeConfiguration mem = {
+        .has_size = true,
+        .size = ms->ram_size,
+        .has_max_size = !!ms->ram_slots,
+        .max_size = ms->maxram_size,
+        .has_slots = !!ms->ram_slots,
+        .slots = ms->ram_slots,
+    };
+    MemorySizeConfiguration *p_mem = &mem;
+
+    visit_type_MemorySizeConfiguration(v, name, &p_mem, &error_abort);
+}
+
+static void machine_set_mem(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    MemorySizeConfiguration *mem;
+
+    ERRP_GUARD();
+
+    if (!visit_type_MemorySizeConfiguration(v, name, &mem, errp)) {
+        return;
+    }
+
+    if (!mem->has_size) {
+        mem->has_size = true;
+        mem->size = mc->default_ram_size;
+    }
+    mem->size = QEMU_ALIGN_UP(mem->size, 8192);
+    if (mc->fixup_ram_size) {
+        mem->size = mc->fixup_ram_size(mem->size);
+    }
+    if ((ram_addr_t)mem->size != mem->size) {
+        error_setg(errp, "ram size too large");
+        goto out_free;
+    }
+
+    if (mem->has_max_size) {
+        if (mem->max_size < mem->size) {
+            error_setg(errp, "invalid value of maxmem: "
+                       "maximum memory size (0x%" PRIx64 ") must be at least "
+                       "the initial memory size (0x%" PRIx64 ")",
+                       mem->max_size, mem->size);
+            goto out_free;
+        }
+        if (mem->has_slots && mem->slots && mem->max_size == mem->size) {
+            error_setg(errp, "invalid value of maxmem: "
+                       "memory slots were specified but maximum memory size "
+                       "(0x%" PRIx64 ") is equal to the initial memory size "
+                       "(0x%" PRIx64 ")", mem->max_size, mem->size);
+            goto out_free;
+        }
+        ms->maxram_size = mem->max_size;
+    } else {
+        if (mem->has_slots) {
+            error_setg(errp, "slots specified but no max-size");
+            goto out_free;
+        }
+        ms->maxram_size = mem->size;
+    }
+    ms->ram_size = mem->size;
+    ms->ram_slots = mem->has_slots ? mem->slots : 0;
+out_free:
+    qapi_free_MemorySizeConfiguration(mem);
+}
+
 static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -940,6 +1012,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "memory-backend",
                                           "Set RAM backend"
                                           "Valid value is ID of hostmem based backend");
+
+    object_class_property_add(oc, "memory", "MemorySizeConfiguration",
+        machine_get_mem, machine_set_mem,
+        NULL, NULL);
+    object_class_property_set_description(oc, "memory",
+        "Memory size configuration");
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
@@ -970,6 +1048,8 @@ static void machine_initfn(Object *obj)
     ms->mem_merge = true;
     ms->enable_graphics = true;
     ms->kernel_cmdline = g_strdup("");
+    ms->ram_size = mc->default_ram_size;
+    ms->maxram_size = mc->default_ram_size;
 
     if (mc->nvdimm_supported) {
         Object *obj = OBJECT(ms);
diff --git a/qapi/machine.json b/qapi/machine.json
index fb06f02ed1..ca6b854670 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1612,3 +1612,21 @@
 ##
 { 'enum': 'SmbiosEntryPointType',
   'data': [ '32', '64' ] }
+
+##
+# @MemorySizeConfiguration:
+#
+# Schema for memory size configuration.
+#
+# @size: memory size in bytes
+#
+# @max-size: maximum hotpluggable memory size in bytes
+#
+# @slots: number of available memory slots for hotplug
+#
+# Since: 6.1
+##
+{ 'struct': 'MemorySizeConfiguration', 'data': {
+     '*size': 'size',
+     '*max-size': 'size',
+     '*slots': 'uint64' } }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 80936e595f..c908c3af95 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -156,11 +156,10 @@ static const char *mem_path;
 static const char *incoming;
 static const char *loadvm;
 static const char *accelerators;
+static bool have_custom_ram_size;
 static QDict *machine_opts_dict;
 static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
 static QTAILQ_HEAD(, DeviceOption) device_opts = QTAILQ_HEAD_INITIALIZER(device_opts);
-static ram_addr_t maxram_size;
-static uint64_t ram_slots;
 static int display_remote;
 static int snapshot;
 static bool preconfig_requested;
@@ -168,7 +167,6 @@ static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
 static int mem_prealloc; /* force preallocation of physical target memory */
-static ram_addr_t ram_size;
 static const char *vga_model = NULL;
 static DisplayOptions dpy;
 static int num_serial_hds;
@@ -1730,6 +1728,7 @@ static void keyval_dashify(QDict *qdict, Error **errp)
 static void qemu_apply_legacy_machine_options(QDict *qdict)
 {
     const char *value;
+    QObject *prop;
 
     keyval_dashify(qdict, &error_fatal);
 
@@ -1762,6 +1761,13 @@ static void qemu_apply_legacy_machine_options(QDict *qdict)
                                    false);
         qdict_del(qdict, "kernel-irqchip");
     }
+
+    prop = qdict_get(qdict, "memory");
+    if (prop) {
+        have_custom_ram_size =
+            qobject_type(prop) == QTYPE_QDICT &&
+            qdict_haskey(qobject_to(QDict, prop), "size");
+    }
 }
 
 static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
@@ -1879,9 +1885,6 @@ static bool object_create_early(const char *type)
 static void qemu_apply_machine_options(QDict *qdict)
 {
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
-    current_machine->ram_size = ram_size;
-    current_machine->maxram_size = maxram_size;
-    current_machine->ram_slots = ram_slots;
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
@@ -1992,12 +1995,6 @@ static void qemu_create_late_backends(void)
     qemu_semihosting_console_init();
 }
 
-static bool have_custom_ram_size(void)
-{
-    QemuOpts *opts = qemu_find_opts_singleton("memory");
-    return !!qemu_opt_get_size(opts, "size", 0);
-}
-
 static void qemu_resolve_machine_memdev(void)
 {
     if (current_machine->ram_memdev_id) {
@@ -2012,7 +2009,7 @@ static void qemu_resolve_machine_memdev(void)
             exit(EXIT_FAILURE);
         }
         backend_size = object_property_get_uint(backend, "size",  &error_abort);
-        if (have_custom_ram_size() && backend_size != ram_size) {
+        if (have_custom_ram_size && backend_size != current_machine->ram_size) {
                 error_report("Size specified by -m option must match size of "
                              "explicitly specified 'memory-backend' property");
                 exit(EXIT_FAILURE);
@@ -2022,95 +2019,58 @@ static void qemu_resolve_machine_memdev(void)
                          "'-machine memory-backend'");
             exit(EXIT_FAILURE);
         }
-        ram_size = backend_size;
+        current_machine->ram_size = backend_size;
     }
 
     if (!xen_enabled()) {
         /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
+        if (current_machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
             error_report("at most 2047 MB RAM can be simulated");
             exit(1);
         }
     }
 }
 
-static void set_memory_options(MachineClass *mc)
+static void parse_memory_options(const char *arg)
 {
-    uint64_t sz;
+    QemuOpts *opts;
+    QDict *dict, *prop;
     const char *mem_str;
-    const ram_addr_t default_ram_size = mc->default_ram_size;
-    QemuOpts *opts = qemu_find_opts_singleton("memory");
-    Location loc;
 
-    loc_push_none(&loc);
-    qemu_opts_loc_restore(opts);
+    opts = qemu_opts_parse_noisily(qemu_find_opts("memory"), arg, true);
+    if (!opts) {
+        exit(EXIT_FAILURE);
+    }
+
+    prop = qdict_new();
 
-    sz = 0;
-    mem_str = qemu_opt_get(opts, "size");
-    if (mem_str) {
+    if (qemu_opt_get_size(opts, "size", 0) != 0) {
+        mem_str = qemu_opt_get(opts, "size");
         if (!*mem_str) {
             error_report("missing 'size' option value");
             exit(EXIT_FAILURE);
         }
 
-        sz = qemu_opt_get_size(opts, "size", ram_size);
-
         /* Fix up legacy suffix-less format */
         if (g_ascii_isdigit(mem_str[strlen(mem_str) - 1])) {
-            uint64_t overflow_check = sz;
-
-            sz *= MiB;
-            if (sz / MiB != overflow_check) {
-                error_report("too large 'size' option value");
-                exit(EXIT_FAILURE);
-            }
+            g_autofree char *mib_str = g_strdup_printf("%sM", mem_str);
+            qdict_put_str(prop, "size", mib_str);
+        } else {
+            qdict_put_str(prop, "size", mem_str);
         }
     }
 
-    /* backward compatibility behaviour for case "-m 0" */
-    if (sz == 0) {
-        sz = default_ram_size;
-    }
-
-    sz = QEMU_ALIGN_UP(sz, 8192);
-    if (mc->fixup_ram_size) {
-        sz = mc->fixup_ram_size(sz);
-    }
-    ram_size = sz;
-    if (ram_size != sz) {
-        error_report("ram size too large");
-        exit(EXIT_FAILURE);
-    }
-
-    maxram_size = ram_size;
-
     if (qemu_opt_get(opts, "maxmem")) {
-        uint64_t slots;
-
-        sz = qemu_opt_get_size(opts, "maxmem", 0);
-        slots = qemu_opt_get_number(opts, "slots", 0);
-        if (sz < ram_size) {
-            error_report("invalid value of -m option maxmem: "
-                         "maximum memory size (0x%" PRIx64 ") must be at least "
-                         "the initial memory size (0x" RAM_ADDR_FMT ")",
-                         sz, ram_size);
-            exit(EXIT_FAILURE);
-        } else if (slots && sz == ram_size) {
-            error_report("invalid value of -m option maxmem: "
-                         "memory slots were specified but maximum memory size "
-                         "(0x%" PRIx64 ") is equal to the initial memory size "
-                         "(0x" RAM_ADDR_FMT ")", sz, ram_size);
-            exit(EXIT_FAILURE);
-        }
-
-        maxram_size = sz;
-        ram_slots = slots;
-    } else if (qemu_opt_get(opts, "slots")) {
-        error_report("invalid -m option value: missing 'maxmem' option");
-        exit(EXIT_FAILURE);
+        qdict_put_str(prop, "max-size", qemu_opt_get(opts, "maxmem"));
+    }
+    if (qemu_opt_get(opts, "slots")) {
+        qdict_put_str(prop, "slots", qemu_opt_get(opts, "slots"));
     }
 
-    loc_pop(&loc);
+    dict = qdict_new();
+    qdict_put(dict, "memory", prop);
+    keyval_merge(machine_opts_dict, dict, &error_fatal);
+    qobject_unref(dict);
 }
 
 static void qemu_create_machine(QDict *qdict)
@@ -2118,8 +2078,6 @@ static void qemu_create_machine(QDict *qdict)
     MachineClass *machine_class = select_machine(qdict, &error_fatal);
     object_set_machine_compat_props(machine_class->compat_props);
 
-    set_memory_options(machine_class);
-
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine));
@@ -2179,7 +2137,8 @@ static bool is_qemuopts_group(const char *group)
     if (g_str_equal(group, "object") ||
         g_str_equal(group, "machine") ||
         g_str_equal(group, "smp-opts") ||
-        g_str_equal(group, "boot-opts")) {
+        g_str_equal(group, "boot-opts") ||
+        g_str_equal(group, "memory")) {
         return false;
     }
     return true;
@@ -2203,6 +2162,8 @@ static void qemu_record_config_group(const char *group, QDict *dict,
         machine_merge_property("smp", dict, &error_fatal);
     } else if (g_str_equal(group, "boot-opts")) {
         machine_merge_property("boot", dict, &error_fatal);
+    } else if (g_str_equal(group, "memory")) {
+        machine_merge_property("memory", dict, &error_fatal);
     } else {
         abort();
     }
@@ -3000,11 +2961,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 exit(0);
                 break;
             case QEMU_OPTION_m:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("memory"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(EXIT_FAILURE);
-                }
+                parse_memory_options(optarg);
                 break;
 #ifdef CONFIG_TPM
             case QEMU_OPTION_tpmdev:
-- 
2.31.1



