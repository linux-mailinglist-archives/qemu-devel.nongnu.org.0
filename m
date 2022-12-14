Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33064C4BA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:11:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUW-0003Zo-Qf; Wed, 14 Dec 2022 02:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUR-0003Xs-Fa
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUL-0003h7-LE
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISvEREfX79HaPE+apjAaDwd03P8J7YN5/7Tf0vMWRjQ=;
 b=eWAnq2kdFabXD3GN3xjT99XZTr1mVEPWh6cz5i/sFHel5FRpEk2ze0pk29n2CaXyD7+uGQ
 rODgRexg/ua1CTUn2/fknmANLtTCFhWQSHRMmO7wfrNF3IFplfxWdrLMN91E5y4nTiL4R+
 TnV1xBRMrlRZY9NcCU/mV8SHAUBE+pE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-BNXaZTNVNtqBlsE3aHJoeQ-1; Wed, 14 Dec 2022 02:47:32 -0500
X-MC-Unique: BNXaZTNVNtqBlsE3aHJoeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7FC8030D1;
 Wed, 14 Dec 2022 07:47:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3C414171C3;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7448421E64A5; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 15/30] qapi machine: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:06 +0100
Message-Id: <20221214074721.731441-18-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/machine*.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221104160712.3005652-16-armbru@redhat.com>
---
 hw/core/machine-hmp-cmds.c       |  2 +-
 hw/core/machine-qmp-cmds.c       |  9 ++-------
 hw/core/machine.c                | 10 ++++------
 hw/core/numa.c                   |  8 ++++----
 hw/mem/pc-dimm.c                 |  1 -
 hw/nvram/fw_cfg.c                |  2 +-
 hw/virtio/virtio-mem-pci.c       |  4 +---
 hw/virtio/virtio-pmem-pci.c      |  1 -
 target/arm/monitor.c             |  1 -
 target/i386/cpu-sysemu.c         |  7 ++-----
 target/i386/cpu.c                |  1 -
 target/s390x/cpu_models_sysemu.c |  1 -
 scripts/qapi/schema.py           |  2 --
 13 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 5cb5eecbfc..a1a51e9778 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -62,7 +62,7 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "  type: \"%s\"\n", l->value->type);
         monitor_printf(mon, "  vcpus_count: \"%" PRIu64 "\"\n",
                        l->value->vcpus_count);
-        if (l->value->has_qom_path) {
+        if (l->value->qom_path) {
             monitor_printf(mon, "  qom_path: \"%s\"\n", l->value->qom_path);
         }
 
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 4f4ab30f8c..80d5e59651 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -55,8 +55,7 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
         value->qom_path = object_get_canonical_path(OBJECT(cpu));
         value->thread_id = cpu->thread_id;
 
-        value->has_props = !!mc->cpu_index_to_instance_props;
-        if (value->has_props) {
+        if (mc->cpu_index_to_instance_props) {
             CpuInstanceProperties *props;
             props = g_malloc0(sizeof(*props));
             *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
@@ -90,7 +89,6 @@ MachineInfoList *qmp_query_machines(Error **errp)
         }
 
         if (mc->alias) {
-            info->has_alias = true;
             info->alias = g_strdup(mc->alias);
         }
 
@@ -101,11 +99,9 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->deprecated = !!mc->deprecation_reason;
         if (mc->default_cpu_type) {
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
-            info->has_default_cpu_type = true;
         }
         if (mc->default_ram_id) {
             info->default_ram_id = g_strdup(mc->default_ram_id);
-            info->has_default_ram_id = true;
         }
 
         QAPI_LIST_PREPEND(mach_list, info);
@@ -168,7 +164,6 @@ static int query_memdev(Object *obj, void *opaque)
         m = g_malloc0(sizeof(*m));
 
         m->id = g_strdup(object_get_canonical_path_component(obj));
-        m->has_id = !!m->id;
 
         m->size = object_property_get_uint(obj, "size", &error_abort);
         m->merge = object_property_get_bool(obj, "merge", &error_abort);
@@ -227,7 +222,7 @@ HumanReadableText *qmp_x_query_numa(Error **errp)
     for (i = 0; i < nb_numa_nodes; i++) {
         g_string_append_printf(buf, "node %d cpus:", i);
         for (cpu = cpu_list; cpu; cpu = cpu->next) {
-            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+            if (cpu->value->props && cpu->value->props->has_node_id &&
                 cpu->value->props->node_id == i) {
                 g_string_append_printf(buf, " %" PRIi64, cpu->value->cpu_index);
             }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d34caa31d..c76e402bbf 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -684,7 +684,6 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 
         cpu = machine->possible_cpus->cpus[i].cpu;
         if (cpu) {
-            cpu_item->has_qom_path = true;
             cpu_item->qom_path = object_get_canonical_path(cpu);
         }
         QAPI_LIST_PREPEND(head, cpu_item);
@@ -873,8 +872,7 @@ static void machine_copy_boot_config(MachineState *ms, BootConfiguration *config
 
     machine_free_boot_config(ms);
     ms->boot_config = *config;
-    if (!config->has_order) {
-        ms->boot_config.has_order = true;
+    if (!config->order) {
         ms->boot_config.order = g_strdup(machine_class->default_boot_order);
     }
 }
@@ -889,13 +887,13 @@ static void machine_set_boot(Object *obj, Visitor *v, const char *name,
     if (!visit_type_BootConfiguration(v, name, &config, errp)) {
         return;
     }
-    if (config->has_order) {
+    if (config->order) {
         validate_bootdevices(config->order, errp);
         if (*errp) {
             goto out_free;
         }
     }
-    if (config->has_once) {
+    if (config->once) {
         validate_bootdevices(config->once, errp);
         if (*errp) {
             goto out_free;
@@ -1424,7 +1422,7 @@ void qdev_machine_creation_done(void)
 {
     cpu_synchronize_all_post_init();
 
-    if (current_machine->boot_config.has_once) {
+    if (current_machine->boot_config.once) {
         qemu_boot_set(current_machine->boot_config.once, &error_fatal);
         qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_config.order));
     }
diff --git a/hw/core/numa.c b/hw/core/numa.c
index ea24a5fa8c..d8d36b16d8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -130,9 +130,9 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         }
     }
 
-    have_memdevs = have_memdevs ? : node->has_memdev;
-    have_mem = have_mem ? : node->has_mem;
-    if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
+    have_memdevs = have_memdevs || node->memdev;
+    have_mem = have_mem || node->has_mem;
+    if ((node->has_mem && have_memdevs) || (node->memdev && have_mem)) {
         error_setg(errp, "numa configuration should use either mem= or memdev=,"
                    "mixing both is not allowed");
         return;
@@ -152,7 +152,7 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
                         " use -numa node,memdev instead");
         }
     }
-    if (node->has_memdev) {
+    if (node->memdev) {
         Object *o;
         o = object_resolve_path_type(node->memdev, TYPE_MEMORY_BACKEND, NULL);
         if (!o) {
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index f27e1a11ba..50ef83215c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -252,7 +252,6 @@ static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
     const DeviceState *dev = DEVICE(md);
 
     if (dev->id) {
-        di->has_id = true;
         di->id = g_strdup(dev->id);
     }
     di->hotplugged = dev->hotplugged;
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 6edf5ea3e9..a00881bc64 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -201,7 +201,7 @@ static void fw_cfg_bootsplash(FWCfgState *s)
     }
 
     /* insert splash file if user configurated */
-    if (current_machine->boot_config.has_splash) {
+    if (current_machine->boot_config.splash) {
         const char *boot_splash_filename = current_machine->boot_config.splash;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, boot_splash_filename);
         if (filename == NULL) {
diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index 5c5c1e3ae3..e8c338c5d9 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -65,7 +65,6 @@ static void virtio_mem_pci_fill_device_info(const MemoryDeviceState *md,
     DeviceState *dev = DEVICE(md);
 
     if (dev->id) {
-        vi->has_id = true;
         vi->id = g_strdup(dev->id);
     }
 
@@ -90,8 +89,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
     char *qom_path = object_get_canonical_path(OBJECT(dev));
     const uint64_t * const size_p = data;
 
-    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p,
-                                              qom_path);
+    qapi_event_send_memory_device_size_change(dev->id, *size_p, qom_path);
     g_free(qom_path);
 }
 
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index 7d9f4ec189..1b89ade9d1 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -70,7 +70,6 @@ static void virtio_pmem_pci_fill_device_info(const MemoryDeviceState *md,
     DeviceState *dev = DEVICE(md);
 
     if (dev->id) {
-        vi->has_id = true;
         vi->id = g_strdup(dev->id);
     }
 
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..ecdd5ee817 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -221,7 +221,6 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         qobject_unref(qdict_out);
     } else {
         expansion_info->model->props = QOBJECT(qdict_out);
-        expansion_info->model->has_props = true;
     }
 
     object_unref(obj);
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index a6f47b7d11..fc97213a73 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -187,10 +187,8 @@ qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     QDict *props = NULL;
     const char *base_name;
 
-    xc = x86_cpu_from_model(model->name,
-                            model->has_props ?
-                                qobject_to(QDict, model->props) :
-                                NULL, &err);
+    xc = x86_cpu_from_model(model->name, qobject_to(QDict, model->props),
+                            &err);
     if (err) {
         goto out;
     }
@@ -198,7 +196,6 @@ qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     props = qdict_new();
     ret->model = g_new0(CpuModelInfo, 1);
     ret->model->props = QOBJECT(props);
-    ret->model->has_props = true;
 
     switch (type) {
     case CPU_MODEL_EXPANSION_TYPE_STATIC:
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..ae502f0bfe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4901,7 +4901,6 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
      */
     if (default_cpu_version != CPU_VERSION_LEGACY) {
         info->alias_of = x86_cpu_class_get_alias_of(cc);
-        info->has_alias_of = !!info->alias_of;
     }
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index d8a141a023..63981bf36b 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -210,7 +210,6 @@ static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *model,
         qobject_unref(qdict);
     } else {
         info->props = QOBJECT(qdict);
-        info->has_props = true;
     }
 }
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ff73fdb0b3..9d729468b5 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,8 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/machine.json',
-            'qapi/machine-target.json',
             'qapi/migration.json',
             'qapi/misc.json',
             'qapi/net.json',
-- 
2.37.3


