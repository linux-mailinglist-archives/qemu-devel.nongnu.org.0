Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4077350193C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:56:07 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2lK-0005Te-4Z
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iU-0002he-74
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-000482-AY
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjzHbo/x3OYy4t2hYx0utDmUA9Po6wcLkDqSpAtS58s=;
 b=H8P0hB+ORaGabL1tAFHuagU3+fhdV1GajREzG+jCt6RNaT9fZpvkOJXvNI3PROawNETEe9
 eGy2a43hZbigLhHChd5YbjlyBkzKJO5EsRq5xCdJmWOKUFohc6/dsVhwbB4meSReozfxdP
 IJS07RnC6wh6ZALAdAVN2NkavmpSy/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-XIbm9pjuM1KXtjPNJwLExQ-1; Thu, 14 Apr 2022 12:53:02 -0400
X-MC-Unique: XIbm9pjuM1KXtjPNJwLExQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10CF43838C8B
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F234E14583C1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 4/5] machine: make memory-backend a link property
Date: Thu, 14 Apr 2022 12:52:59 -0400
Message-Id: <20220414165300.555321-5-pbonzini@redhat.com>
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

Handle HostMemoryBackend creation and setting of ms->ram entirely in
machine_run_board_init.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c   | 70 ++++++++++++++++++++++++++++++---------------
 hw/core/numa.c      |  2 +-
 hw/sparc/sun4m.c    |  5 ++--
 include/hw/boards.h |  4 +--
 softmmu/vl.c        | 62 ++++++++++++++-------------------------
 5 files changed, 74 insertions(+), 69 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d5cfffe8a0..3dca927e3f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,6 +36,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
+#include "qom/object_interfaces.h"
 
 GlobalProperty hw_compat_6_2[] = {
     { "PIIX4_PM", "x-not-migrate-acpi-index", "on"},
@@ -650,21 +651,6 @@ bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
     return allowed;
 }
 
-static char *machine_get_memdev(Object *obj, Error **errp)
-{
-    MachineState *ms = MACHINE(obj);
-
-    return g_strdup(ms->ram_memdev_id);
-}
-
-static void machine_set_memdev(Object *obj, const char *value, Error **errp)
-{
-    MachineState *ms = MACHINE(obj);
-
-    g_free(ms->ram_memdev_id);
-    ms->ram_memdev_id = g_strdup(value);
-}
-
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -1007,8 +993,9 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "memory-encryption",
         "Set memory encryption object to use");
 
-    object_class_property_add_str(oc, "memory-backend",
-                                  machine_get_memdev, machine_set_memdev);
+    object_class_property_add_link(oc, "memory-backend", TYPE_MEMORY_BACKEND,
+                                   offsetof(MachineState, memdev), object_property_allow_set_link,
+                                   OBJ_PROP_LINK_STRONG);
     object_class_property_set_description(oc, "memory-backend",
                                           "Set RAM backend"
                                           "Valid value is ID of hostmem based backend");
@@ -1252,7 +1239,40 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
     return ret;
 }
 
-void machine_run_board_init(MachineState *machine)
+static bool create_default_memdev(MachineState *ms, const char *path, Error **errp)
+{
+    Object *obj;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    bool r = false;
+
+    obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
+    if (path) {
+        if (!object_property_set_str(obj, "mem-path", path, errp)) {
+            goto out;
+        }
+    }
+    if (!object_property_set_int(obj, "size", ms->ram_size, errp)) {
+        goto out;
+    }
+    object_property_add_child(object_get_objects_root(), mc->default_ram_id,
+                              obj);
+    /* Ensure backend's memory region name is equal to mc->default_ram_id */
+    if (!object_property_set_bool(obj, "x-use-canonical-path-for-ramblock-id",
+                             false, errp)) {
+        goto out;
+    }
+    if (!user_creatable_complete(USER_CREATABLE(obj), errp)) {
+        goto out;
+    }
+    r = object_property_set_link(OBJECT(ms), "memory-backend", obj, errp);
+
+out:
+    object_unref(obj);
+    return r;
+}
+
+
+void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
@@ -1263,11 +1283,11 @@ void machine_run_board_init(MachineState *machine)
        clock values from the log. */
     replay_checkpoint(CHECKPOINT_INIT);
 
-    if (machine->ram_memdev_id) {
-        Object *o;
-        o = object_resolve_path_type(machine->ram_memdev_id,
-                                     TYPE_MEMORY_BACKEND, NULL);
-        machine->ram = machine_consume_memdev(machine, MEMORY_BACKEND(o));
+    if (machine_class->default_ram_id && machine->ram_size &&
+        numa_uses_legacy_mem() && !machine->memdev) {
+        if (!create_default_memdev(current_machine, mem_path, errp)) {
+            return;
+        }
     }
 
     if (machine->numa_state) {
@@ -1277,6 +1297,10 @@ void machine_run_board_init(MachineState *machine)
         }
     }
 
+    if (!machine->ram && machine->memdev) {
+        machine->ram = machine_consume_memdev(machine, machine->memdev);
+    }
+
     /* If the machine supports the valid_cpu_types check and the user
      * specified a CPU with -cpu check here that the user CPU is supported.
      */
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1aa05dcf42..26d8e5f616 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -695,7 +695,7 @@ void numa_complete_configuration(MachineState *ms)
         }
 
         if (!numa_uses_legacy_mem() && mc->default_ram_id) {
-            if (ms->ram_memdev_id) {
+            if (ms->memdev) {
                 error_report("'-machine memory-backend' and '-numa memdev'"
                              " properties are mutually exclusive");
                 exit(1);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index fb58e19e4b..98a94a87d5 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -832,8 +832,7 @@ static void sun4m_hw_init(MachineState *machine)
     SysBusDevice *s;
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
-    Object *ram_memdev = object_resolve_path_type(machine->ram_memdev_id,
-                                                  TYPE_MEMORY_BACKEND, NULL);
+    HostMemoryBackend *ram_memdev = machine->memdev;
     NICInfo *nd = &nd_table[0];
 
     if (machine->ram_size > hwdef->max_mem) {
@@ -853,7 +852,7 @@ static void sun4m_hw_init(MachineState *machine)
 
     /* Create and map RAM frontend */
     dev = qdev_new("memory");
-    object_property_set_link(OBJECT(dev), "memdev", ram_memdev, &error_fatal);
+    object_property_set_link(OBJECT(dev), "memdev", OBJECT(ram_memdev), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 8994f6c93b..3390de80ff 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -25,7 +25,7 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 
 extern MachineState *current_machine;
 
-void machine_run_board_init(MachineState *machine);
+void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
@@ -339,7 +339,7 @@ struct MachineState {
     bool suppress_vmdesc;
     bool enable_graphics;
     ConfidentialGuestSupport *cgs;
-    char *ram_memdev_id;
+    HostMemoryBackend *memdev;
     /*
      * convenience alias to ram_memdev_id backend memory region
      * or to numa container memory region
diff --git a/softmmu/vl.c b/softmmu/vl.c
index c908c3af95..03494760d5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -157,6 +157,7 @@ static const char *incoming;
 static const char *loadvm;
 static const char *accelerators;
 static bool have_custom_ram_size;
+static const char *ram_memdev_id;
 static QDict *machine_opts_dict;
 static QTAILQ_HEAD(, ObjectOption) object_opts = QTAILQ_HEAD_INITIALIZER(object_opts);
 static QTAILQ_HEAD(, DeviceOption) device_opts = QTAILQ_HEAD_INITIALIZER(device_opts);
@@ -1762,6 +1763,19 @@ static void qemu_apply_legacy_machine_options(QDict *qdict)
         qdict_del(qdict, "kernel-irqchip");
     }
 
+    value = qdict_get_try_str(qdict, "memory-backend");
+    if (value) {
+        if (mem_path) {
+            error_report("'-mem-path' can't be used together with"
+                         "'-machine memory-backend'");
+            exit(EXIT_FAILURE);
+        }
+
+        /* Resolved later.  */
+        ram_memdev_id = g_strdup(value);
+        qdict_del(qdict, "memory-backend");
+    }
+
     prop = qdict_get(qdict, "memory");
     if (prop) {
         have_custom_ram_size =
@@ -1997,29 +2011,25 @@ static void qemu_create_late_backends(void)
 
 static void qemu_resolve_machine_memdev(void)
 {
-    if (current_machine->ram_memdev_id) {
+    if (ram_memdev_id) {
         Object *backend;
         ram_addr_t backend_size;
 
-        backend = object_resolve_path_type(current_machine->ram_memdev_id,
+        backend = object_resolve_path_type(ram_memdev_id,
                                            TYPE_MEMORY_BACKEND, NULL);
         if (!backend) {
-            error_report("Memory backend '%s' not found",
-                         current_machine->ram_memdev_id);
+            error_report("Memory backend '%s' not found", ram_memdev_id);
             exit(EXIT_FAILURE);
         }
         backend_size = object_property_get_uint(backend, "size",  &error_abort);
         if (have_custom_ram_size && backend_size != current_machine->ram_size) {
-                error_report("Size specified by -m option must match size of "
-                             "explicitly specified 'memory-backend' property");
-                exit(EXIT_FAILURE);
-        }
-        if (mem_path) {
-            error_report("'-mem-path' can't be used together with"
-                         "'-machine memory-backend'");
+            error_report("Size specified by -m option must match size of "
+                         "explicitly specified 'memory-backend' property");
             exit(EXIT_FAILURE);
         }
         current_machine->ram_size = backend_size;
+        object_property_set_link(OBJECT(current_machine),
+                                 "memory-backend", backend, &error_fatal);
     }
 
     if (!xen_enabled()) {
@@ -2370,27 +2380,6 @@ static void configure_accelerators(const char *progname)
     }
 }
 
-static void create_default_memdev(MachineState *ms, const char *path)
-{
-    Object *obj;
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-
-    obj = object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKEND_RAM);
-    if (path) {
-        object_property_set_str(obj, "mem-path", path, &error_fatal);
-    }
-    object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
-    object_property_add_child(object_get_objects_root(), mc->default_ram_id,
-                              obj);
-    /* Ensure backend's memory region name is equal to mc->default_ram_id */
-    object_property_set_bool(obj, "x-use-canonical-path-for-ramblock-id",
-                             false, &error_fatal);
-    user_creatable_complete(USER_CREATABLE(obj), &error_fatal);
-    object_unref(obj);
-    object_property_set_str(OBJECT(ms), "memory-backend", mc->default_ram_id,
-                            &error_fatal);
-}
-
 static void qemu_validate_options(const QDict *machine_opts)
 {
     const char *kernel_filename = qdict_get_try_str(machine_opts, "kernel");
@@ -2578,18 +2567,11 @@ static void qemu_init_displays(void)
 
 static void qemu_init_board(void)
 {
-    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
-
-    if (machine_class->default_ram_id && current_machine->ram_size &&
-        numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
-        create_default_memdev(current_machine, mem_path);
-    }
-
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
-    machine_run_board_init(current_machine);
+    machine_run_board_init(current_machine, mem_path, &error_fatal);
 
     drive_check_orphaned();
 
-- 
2.31.1



