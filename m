Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF32E225B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:14:55 +0100 (CET)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCPG-0006kU-CC
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCMB-0004iU-Fb
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCM5-0001x7-Qo
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xmHO5fyVoINQziFIJJPHdUlbh8oTjbOt4cQUUkqO0w=;
 b=Tydpcg2hWvcUXndBS8GSljifLeg/r4hV1AXcoqdXjHcZYTRZt/2MiapC20P7SXoB1mA7l5
 PmFAj02Ulsf+853RuifPXZtvScMiJe7xzLO6zedK0KEpbaF/UwgR6hioogmh5t2HoIKLrx
 vMWtC2su8PVbxupPeNWey2P4HZOG7P8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-lm0dT7EEN2KhpxraZXXJzg-1; Wed, 23 Dec 2020 17:11:34 -0500
X-MC-Unique: lm0dT7EEN2KhpxraZXXJzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20D56803622;
 Wed, 23 Dec 2020 22:11:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0D5C5D74C;
 Wed, 23 Dec 2020 22:11:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] qapi: More complex uses of QAPI_LIST_APPEND
Date: Wed, 23 Dec 2020 16:11:02 -0600
Message-Id: <20201223221102.390740-8-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:GLUSTER" <integration@gluster.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These cases require a bit more thought to review; in each case, the
code was appending to a list, but not with a FOOList **tail variable.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/gluster.c            | 13 ++----
 block/qapi.c               | 14 +-----
 dump/dump.c                | 22 +++------
 hw/core/machine-qmp-cmds.c | 93 ++++++++++++++++---------------------
 hw/mem/memory-device.c     | 12 +----
 hw/pci/pci.c               | 60 ++++++++----------------
 migration/migration.c      | 20 +++-----
 monitor/hmp-cmds.c         | 25 ++++------
 net/net.c                  | 13 +-----
 qga/commands-posix.c       | 94 ++++++++++++++------------------------
 qga/commands-win32.c       | 88 ++++++++++++-----------------------
 softmmu/tpm.c              | 38 +++------------
 ui/spice-core.c            | 27 ++++-------
 13 files changed, 170 insertions(+), 349 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 1f8699b93835..e8ee14c8e9bf 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -514,7 +514,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
 {
     QemuOpts *opts;
     SocketAddress *gsconf = NULL;
-    SocketAddressList *curr = NULL;
+    SocketAddressList **tail;
     QDict *backing_options = NULL;
     Error *local_err = NULL;
     char *str = NULL;
@@ -547,6 +547,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
     }
     gconf->path = g_strdup(ptr);
     qemu_opts_del(opts);
+    tail = &gconf->server;

     for (i = 0; i < num_servers; i++) {
         str = g_strdup_printf(GLUSTER_OPT_SERVER_PATTERN"%d.", i);
@@ -655,15 +656,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
             qemu_opts_del(opts);
         }

-        if (gconf->server == NULL) {
-            gconf->server = g_new0(SocketAddressList, 1);
-            gconf->server->value = gsconf;
-            curr = gconf->server;
-        } else {
-            curr->next = g_new0(SocketAddressList, 1);
-            curr->next->value = gsconf;
-            curr = curr->next;
-        }
+        QAPI_LIST_APPEND(tail, gsconf);
         gsconf = NULL;

         qobject_unref(backing_options);
diff --git a/block/qapi.c b/block/qapi.c
index 3a1186fdccf5..0a96099e36e2 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -198,7 +198,7 @@ int bdrv_query_snapshot_info_list(BlockDriverState *bs,
 {
     int i, sn_count;
     QEMUSnapshotInfo *sn_tab = NULL;
-    SnapshotInfoList *info_list, *cur_item = NULL, *head = NULL;
+    SnapshotInfoList *head = NULL, **tail = &head;
     SnapshotInfo *info;

     sn_count = bdrv_snapshot_list(bs, &sn_tab);
@@ -233,17 +233,7 @@ int bdrv_query_snapshot_info_list(BlockDriverState *bs,
         info->icount        = sn_tab[i].icount;
         info->has_icount    = sn_tab[i].icount != -1ULL;

-        info_list = g_new0(SnapshotInfoList, 1);
-        info_list->value = info;
-
-        /* XXX: waiting for the qapi to support qemu-queue.h types */
-        if (!cur_item) {
-            head = cur_item = info_list;
-        } else {
-            cur_item->next = info_list;
-            cur_item = info_list;
-        }
-
+        QAPI_LIST_APPEND(tail, info);
     }

     g_free(sn_tab);
diff --git a/dump/dump.c b/dump/dump.c
index dec32468d98c..929138e91d08 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2030,39 +2030,29 @@ void qmp_dump_guest_memory(bool paging, const char *file,

 DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
 {
-    DumpGuestMemoryFormatList *item;
     DumpGuestMemoryCapability *cap =
                                   g_malloc0(sizeof(DumpGuestMemoryCapability));
+    DumpGuestMemoryFormatList **tail = &cap->formats;

     /* elf is always available */
-    item = g_malloc0(sizeof(DumpGuestMemoryFormatList));
-    cap->formats = item;
-    item->value = DUMP_GUEST_MEMORY_FORMAT_ELF;
+    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_ELF);

     /* kdump-zlib is always available */
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
-    item = item->next;
-    item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_ZLIB;
+    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_ZLIB);

     /* add new item if kdump-lzo is available */
 #ifdef CONFIG_LZO
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
-    item = item->next;
-    item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_LZO;
+    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_LZO);
 #endif

     /* add new item if kdump-snappy is available */
 #ifdef CONFIG_SNAPPY
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
-    item = item->next;
-    item->value = DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY;
+    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY);
 #endif

     /* Windows dump is available only if target is x86_64 */
 #ifdef TARGET_X86_64
-    item->next = g_malloc0(sizeof(DumpGuestMemoryFormatList));
-    item = item->next;
-    item->value = DUMP_GUEST_MEMORY_FORMAT_WIN_DMP;
+    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
 #endif

     return cap;
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 156223a344ed..44e979e503b1 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -28,11 +28,11 @@ CpuInfoList *qmp_query_cpus(Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     MachineClass *mc = MACHINE_GET_CLASS(ms);
-    CpuInfoList *head = NULL, *cur_item = NULL;
+    CpuInfoList *head = NULL, **tail = &head;
     CPUState *cpu;

     CPU_FOREACH(cpu) {
-        CpuInfoList *info;
+        CpuInfo *value;
 #if defined(TARGET_I386)
         X86CPU *x86_cpu = X86_CPU(cpu);
         CPUX86State *env = &x86_cpu->env;
@@ -58,53 +58,46 @@ CpuInfoList *qmp_query_cpus(Error **errp)

         cpu_synchronize_state(cpu);

-        info = g_malloc0(sizeof(*info));
-        info->value = g_malloc0(sizeof(*info->value));
-        info->value->CPU = cpu->cpu_index;
-        info->value->current = (cpu == first_cpu);
-        info->value->halted = cpu->halted;
-        info->value->qom_path = object_get_canonical_path(OBJECT(cpu));
-        info->value->thread_id = cpu->thread_id;
+        value = g_malloc0(sizeof(*value));
+        value->CPU = cpu->cpu_index;
+        value->current = (cpu == first_cpu);
+        value->halted = cpu->halted;
+        value->qom_path = object_get_canonical_path(OBJECT(cpu));
+        value->thread_id = cpu->thread_id;
 #if defined(TARGET_I386)
-        info->value->arch = CPU_INFO_ARCH_X86;
-        info->value->u.x86.pc = env->eip + env->segs[R_CS].base;
+        value->arch = CPU_INFO_ARCH_X86;
+        value->u.x86.pc = env->eip + env->segs[R_CS].base;
 #elif defined(TARGET_PPC)
-        info->value->arch = CPU_INFO_ARCH_PPC;
-        info->value->u.ppc.nip = env->nip;
+        value->arch = CPU_INFO_ARCH_PPC;
+        value->u.ppc.nip = env->nip;
 #elif defined(TARGET_SPARC)
-        info->value->arch = CPU_INFO_ARCH_SPARC;
-        info->value->u.q_sparc.pc = env->pc;
-        info->value->u.q_sparc.npc = env->npc;
+        value->arch = CPU_INFO_ARCH_SPARC;
+        value->u.q_sparc.pc = env->pc;
+        value->u.q_sparc.npc = env->npc;
 #elif defined(TARGET_MIPS)
-        info->value->arch = CPU_INFO_ARCH_MIPS;
-        info->value->u.q_mips.PC = env->active_tc.PC;
+        value->arch = CPU_INFO_ARCH_MIPS;
+        value->u.q_mips.PC = env->active_tc.PC;
 #elif defined(TARGET_TRICORE)
-        info->value->arch = CPU_INFO_ARCH_TRICORE;
-        info->value->u.tricore.PC = env->PC;
+        value->arch = CPU_INFO_ARCH_TRICORE;
+        value->u.tricore.PC = env->PC;
 #elif defined(TARGET_S390X)
-        info->value->arch = CPU_INFO_ARCH_S390;
-        info->value->u.s390.cpu_state = env->cpu_state;
+        value->arch = CPU_INFO_ARCH_S390;
+        value->u.s390.cpu_state = env->cpu_state;
 #elif defined(TARGET_RISCV)
-        info->value->arch = CPU_INFO_ARCH_RISCV;
-        info->value->u.riscv.pc = env->pc;
+        value->arch = CPU_INFO_ARCH_RISCV;
+        value->u.riscv.pc = env->pc;
 #else
-        info->value->arch = CPU_INFO_ARCH_OTHER;
+        value->arch = CPU_INFO_ARCH_OTHER;
 #endif
-        info->value->has_props = !!mc->cpu_index_to_instance_props;
-        if (info->value->has_props) {
+        value->has_props = !!mc->cpu_index_to_instance_props;
+        if (value->has_props) {
             CpuInstanceProperties *props;
             props = g_malloc0(sizeof(*props));
             *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
-            info->value->props = props;
+            value->props = props;
         }

-        /* XXX: waiting for the qapi to support GSList */
-        if (!cur_item) {
-            head = cur_item = info;
-        } else {
-            cur_item->next = info;
-            cur_item = info;
-        }
+        QAPI_LIST_APPEND(tail, value);
     }

     return head;
@@ -170,39 +163,33 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     MachineClass *mc = MACHINE_GET_CLASS(ms);
-    CpuInfoFastList *head = NULL, *cur_item = NULL;
+    CpuInfoFastList *head = NULL, **tail = &head;
     SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
                                           -1, &error_abort);
     CPUState *cpu;

     CPU_FOREACH(cpu) {
-        CpuInfoFastList *info = g_malloc0(sizeof(*info));
-        info->value = g_malloc0(sizeof(*info->value));
+        CpuInfoFast *value = g_malloc0(sizeof(*value));

-        info->value->cpu_index = cpu->cpu_index;
-        info->value->qom_path = object_get_canonical_path(OBJECT(cpu));
-        info->value->thread_id = cpu->thread_id;
+        value->cpu_index = cpu->cpu_index;
+        value->qom_path = object_get_canonical_path(OBJECT(cpu));
+        value->thread_id = cpu->thread_id;

-        info->value->has_props = !!mc->cpu_index_to_instance_props;
-        if (info->value->has_props) {
+        value->has_props = !!mc->cpu_index_to_instance_props;
+        if (value->has_props) {
             CpuInstanceProperties *props;
             props = g_malloc0(sizeof(*props));
             *props = mc->cpu_index_to_instance_props(ms, cpu->cpu_index);
-            info->value->props = props;
+            value->props = props;
         }

-        info->value->arch = sysemu_target_to_cpuinfo_arch(target);
-        info->value->target = target;
+        value->arch = sysemu_target_to_cpuinfo_arch(target);
+        value->target = target;
         if (target == SYS_EMU_TARGET_S390X) {
-            cpustate_to_cpuinfo_s390(&info->value->u.s390x, cpu);
+            cpustate_to_cpuinfo_s390(&value->u.s390x, cpu);
         }

-        if (!cur_item) {
-            head = cur_item = info;
-        } else {
-            cur_item->next = info;
-            cur_item = info;
-        }
+        QAPI_LIST_APPEND(tail, value);
     }

     return head;
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index cf0627fd01c1..d9f8301711e2 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -199,7 +199,7 @@ out:
 MemoryDeviceInfoList *qmp_memory_device_list(void)
 {
     GSList *devices = NULL, *item;
-    MemoryDeviceInfoList *list = NULL, *prev = NULL;
+    MemoryDeviceInfoList *list = NULL, **tail = &list;

     object_child_foreach(qdev_get_machine(), memory_device_build_list,
                          &devices);
@@ -207,19 +207,11 @@ MemoryDeviceInfoList *qmp_memory_device_list(void)
     for (item = devices; item; item = g_slist_next(item)) {
         const MemoryDeviceState *md = MEMORY_DEVICE(item->data);
         const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(item->data);
-        MemoryDeviceInfoList *elem = g_new0(MemoryDeviceInfoList, 1);
         MemoryDeviceInfo *info = g_new0(MemoryDeviceInfo, 1);

         mdc->fill_device_info(md, info);

-        elem->value = info;
-        elem->next = NULL;
-        if (prev) {
-            prev->next = elem;
-        } else {
-            list = elem;
-        }
-        prev = elem;
+        QAPI_LIST_APPEND(tail, info);
     }

     g_slist_free(devices);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index d4349ea57765..0d99fe03b98b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1682,41 +1682,34 @@ static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num);

 static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
 {
-    PciMemoryRegionList *head = NULL, *cur_item = NULL;
+    PciMemoryRegionList *head = NULL, **tail = &head;
     int i;

     for (i = 0; i < PCI_NUM_REGIONS; i++) {
         const PCIIORegion *r = &dev->io_regions[i];
-        PciMemoryRegionList *region;
+        PciMemoryRegion *region;

         if (!r->size) {
             continue;
         }

         region = g_malloc0(sizeof(*region));
-        region->value = g_malloc0(sizeof(*region->value));

         if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
-            region->value->type = g_strdup("io");
+            region->type = g_strdup("io");
         } else {
-            region->value->type = g_strdup("memory");
-            region->value->has_prefetch = true;
-            region->value->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
-            region->value->has_mem_type_64 = true;
-            region->value->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
+            region->type = g_strdup("memory");
+            region->has_prefetch = true;
+            region->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
+            region->has_mem_type_64 = true;
+            region->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
         }

-        region->value->bar = i;
-        region->value->address = r->addr;
-        region->value->size = r->size;
+        region->bar = i;
+        region->address = r->addr;
+        region->size = r->size;

-        /* XXX: waiting for the qapi to support GSList */
-        if (!cur_item) {
-            head = cur_item = region;
-        } else {
-            cur_item->next = region;
-            cur_item = region;
-        }
+        QAPI_LIST_APPEND(tail, region);
     }

     return head;
@@ -1813,23 +1806,14 @@ static PciDeviceInfo *qmp_query_pci_device(PCIDevice *dev, PCIBus *bus,

 static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num)
 {
-    PciDeviceInfoList *info, *head = NULL, *cur_item = NULL;
+    PciDeviceInfoList *head = NULL, **tail = &head;
     PCIDevice *dev;
     int devfn;

     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         dev = bus->devices[devfn];
         if (dev) {
-            info = g_malloc0(sizeof(*info));
-            info->value = qmp_query_pci_device(dev, bus, bus_num);
-
-            /* XXX: waiting for the qapi to support GSList */
-            if (!cur_item) {
-                head = cur_item = info;
-            } else {
-                cur_item->next = info;
-                cur_item = info;
-            }
+            QAPI_LIST_APPEND(tail, qmp_query_pci_device(dev, bus, bus_num));
         }
     }

@@ -1852,21 +1836,13 @@ static PciInfo *qmp_query_pci_bus(PCIBus *bus, int bus_num)

 PciInfoList *qmp_query_pci(Error **errp)
 {
-    PciInfoList *info, *head = NULL, *cur_item = NULL;
+    PciInfoList *head = NULL, **tail = &head;
     PCIHostState *host_bridge;

     QLIST_FOREACH(host_bridge, &pci_host_bridges, next) {
-        info = g_malloc0(sizeof(*info));
-        info->value = qmp_query_pci_bus(host_bridge->bus,
-                                        pci_bus_num(host_bridge->bus));
-
-        /* XXX: waiting for the qapi to support GSList */
-        if (!cur_item) {
-            head = cur_item = info;
-        } else {
-            cur_item->next = info;
-            cur_item = info;
-        }
+        QAPI_LIST_APPEND(tail,
+                         qmp_query_pci_bus(host_bridge->bus,
+                                           pci_bus_num(host_bridge->bus)));
     }

     return head;
diff --git a/migration/migration.c b/migration/migration.c
index 805712488e4d..a676405019d1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -784,29 +784,21 @@ void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value)

 MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 {
-    MigrationCapabilityStatusList *head = NULL;
-    MigrationCapabilityStatusList *caps;
+    MigrationCapabilityStatusList *head = NULL, **tail = &head;
+    MigrationCapabilityStatus *caps;
     MigrationState *s = migrate_get_current();
     int i;

-    caps = NULL; /* silence compiler warning */
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
 #ifndef CONFIG_LIVE_BLOCK_MIGRATION
         if (i == MIGRATION_CAPABILITY_BLOCK) {
             continue;
         }
 #endif
-        if (head == NULL) {
-            head = g_malloc0(sizeof(*caps));
-            caps = head;
-        } else {
-            caps->next = g_malloc0(sizeof(*caps));
-            caps = caps->next;
-        }
-        caps->value =
-            g_malloc(sizeof(*caps->value));
-        caps->value->capability = i;
-        caps->value->state = s->enabled_capabilities[i];
+        caps = g_malloc(sizeof(*caps));
+        caps->capability = i;
+        caps->state = s->enabled_capabilities[i];
+        QAPI_LIST_APPEND(tail, caps);
     }

     return head;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ed4131efbca6..a9643ff41961 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1705,7 +1705,8 @@ void hmp_closefd(Monitor *mon, const QDict *qdict)
 void hmp_sendkey(Monitor *mon, const QDict *qdict)
 {
     const char *keys = qdict_get_str(qdict, "keys");
-    KeyValueList *keylist, *head = NULL, *tmp = NULL;
+    KeyValue *v = NULL;
+    KeyValueList *head = NULL, **tail = &head;
     int has_hold_time = qdict_haskey(qdict, "hold-time");
     int hold_time = qdict_get_try_int(qdict, "hold-time", -1);
     Error *err = NULL;
@@ -1722,16 +1723,7 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
             keyname_len = 4;
         }

-        keylist = g_malloc0(sizeof(*keylist));
-        keylist->value = g_malloc0(sizeof(*keylist->value));
-
-        if (!head) {
-            head = keylist;
-        }
-        if (tmp) {
-            tmp->next = keylist;
-        }
-        tmp = keylist;
+        v = g_malloc0(sizeof(*v));

         if (strstart(keys, "0x", NULL)) {
             char *endp;
@@ -1740,16 +1732,18 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
             if (endp != keys + keyname_len) {
                 goto err_out;
             }
-            keylist->value->type = KEY_VALUE_KIND_NUMBER;
-            keylist->value->u.number.data = value;
+            v->type = KEY_VALUE_KIND_NUMBER;
+            v->u.number.data = value;
         } else {
             int idx = index_from_key(keys, keyname_len);
             if (idx == Q_KEY_CODE__MAX) {
                 goto err_out;
             }
-            keylist->value->type = KEY_VALUE_KIND_QCODE;
-            keylist->value->u.qcode.data = idx;
+            v->type = KEY_VALUE_KIND_QCODE;
+            v->u.qcode.data = idx;
         }
+        QAPI_LIST_APPEND(tail, v);
+        v = NULL;

         if (!*separator) {
             break;
@@ -1761,6 +1755,7 @@ void hmp_sendkey(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);

 out:
+    qapi_free_KeyValue(v);
     qapi_free_KeyValueList(head);
     return;

diff --git a/net/net.c b/net/net.c
index e581c8a26868..c7e8f4bc403c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1197,10 +1197,9 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
                                       Error **errp)
 {
     NetClientState *nc;
-    RxFilterInfoList *filter_list = NULL, *last_entry = NULL;
+    RxFilterInfoList *filter_list = NULL, **tail = &filter_list;

     QTAILQ_FOREACH(nc, &net_clients, next) {
-        RxFilterInfoList *entry;
         RxFilterInfo *info;

         if (has_name && strcmp(nc->name, name) != 0) {
@@ -1225,15 +1224,7 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,

         if (nc->info->query_rx_filter) {
             info = nc->info->query_rx_filter(nc);
-            entry = g_malloc0(sizeof(*entry));
-            entry->value = info;
-
-            if (!filter_list) {
-                filter_list = entry;
-            } else {
-                last_entry->next = entry;
-            }
-            last_entry = entry;
+            QAPI_LIST_APPEND(tail, info);
         } else if (has_name) {
             error_setg(errp, "net client(%s) doesn't support"
                        " rx-filter querying", name);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index a5058a3bd15e..10ee740eee1b 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2119,17 +2119,17 @@ void qmp_guest_suspend_hybrid(Error **errp)
     guest_suspend(SUSPEND_MODE_HYBRID, errp);
 }

-static GuestNetworkInterfaceList *
+static GuestNetworkInterface *
 guest_find_interface(GuestNetworkInterfaceList *head,
                      const char *name)
 {
     for (; head; head = head->next) {
         if (strcmp(head->value->name, name) == 0) {
-            break;
+            return head->value;
         }
     }

-    return head;
+    return NULL;
 }

 static int guest_get_network_stats(const char *name,
@@ -2198,7 +2198,7 @@ static int guest_get_network_stats(const char *name,
  */
 GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
-    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
+    GuestNetworkInterfaceList *head = NULL, **tail = &head;
     struct ifaddrs *ifap, *ifa;

     if (getifaddrs(&ifap) < 0) {
@@ -2207,9 +2207,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
     }

     for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
-        GuestNetworkInterfaceList *info;
-        GuestIpAddressList **address_list = NULL, *address_item = NULL;
-        GuestNetworkInterfaceStat  *interface_stat = NULL;
+        GuestNetworkInterface *info;
+        GuestIpAddressList **address_tail;
+        GuestIpAddress *address_item = NULL;
+        GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
         int sock;
@@ -2223,19 +2224,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)

         if (!info) {
             info = g_malloc0(sizeof(*info));
-            info->value = g_malloc0(sizeof(*info->value));
-            info->value->name = g_strdup(ifa->ifa_name);
+            info->name = g_strdup(ifa->ifa_name);

-            if (!cur_item) {
-                head = cur_item = info;
-            } else {
-                cur_item->next = info;
-                cur_item = info;
-            }
+            QAPI_LIST_APPEND(tail, info);
         }

-        if (!info->value->has_hardware_address &&
-            ifa->ifa_flags & SIOCGIFHWADDR) {
+        address_tail = &info->ip_addresses;
+
+        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
             /* we haven't obtained HW address yet */
             sock = socket(PF_INET, SOCK_STREAM, 0);
             if (sock == -1) {
@@ -2244,7 +2240,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->value->name);
+            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
             if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
                 error_setg_errno(errp, errno,
                                  "failed to get MAC address of %s",
@@ -2256,13 +2252,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             close(sock);
             mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;

-            info->value->hardware_address =
+            info->hardware_address =
                 g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                 (int) mac_addr[0], (int) mac_addr[1],
                                 (int) mac_addr[2], (int) mac_addr[3],
                                 (int) mac_addr[4], (int) mac_addr[5]);

-            info->value->has_hardware_address = true;
+            info->has_hardware_address = true;
         }

         if (ifa->ifa_addr &&
@@ -2275,15 +2271,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             address_item = g_malloc0(sizeof(*address_item));
-            address_item->value = g_malloc0(sizeof(*address_item->value));
-            address_item->value->ip_address = g_strdup(addr4);
-            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
+            address_item->ip_address = g_strdup(addr4);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;

             if (ifa->ifa_netmask) {
                 /* Count the number of set bits in netmask.
                  * This is safe as '1' and '0' cannot be shuffled in netmask. */
                 p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
-                address_item->value->prefix = ctpop32(((uint32_t *) p)[0]);
+                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
             }
         } else if (ifa->ifa_addr &&
                    ifa->ifa_addr->sa_family == AF_INET6) {
@@ -2295,15 +2290,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             address_item = g_malloc0(sizeof(*address_item));
-            address_item->value = g_malloc0(sizeof(*address_item->value));
-            address_item->value->ip_address = g_strdup(addr6);
-            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
+            address_item->ip_address = g_strdup(addr6);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;

             if (ifa->ifa_netmask) {
                 /* Count the number of set bits in netmask.
                  * This is safe as '1' and '0' cannot be shuffled in netmask. */
                 p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
-                address_item->value->prefix =
+                address_item->prefix =
                     ctpop32(((uint32_t *) p)[0]) +
                     ctpop32(((uint32_t *) p)[1]) +
                     ctpop32(((uint32_t *) p)[2]) +
@@ -2315,29 +2309,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             continue;
         }

-        address_list = &info->value->ip_addresses;
+        QAPI_LIST_APPEND(address_tail, address_item);

-        while (*address_list && (*address_list)->next) {
-            address_list = &(*address_list)->next;
-        }
+        info->has_ip_addresses = true;

-        if (!*address_list) {
-            *address_list = address_item;
-        } else {
-            (*address_list)->next = address_item;
-        }
-
-        info->value->has_ip_addresses = true;
-
-        if (!info->value->has_statistics) {
+        if (!info->has_statistics) {
             interface_stat = g_malloc0(sizeof(*interface_stat));
-            if (guest_get_network_stats(info->value->name,
-                interface_stat) == -1) {
-                info->value->has_statistics = false;
+            if (guest_get_network_stats(info->name, interface_stat) == -1) {
+                info->has_statistics = false;
                 g_free(interface_stat);
             } else {
-                info->value->statistics = interface_stat;
-                info->value->has_statistics = true;
+                info->statistics = interface_stat;
+                info->has_statistics = true;
             }
         }
     }
@@ -3104,11 +3087,10 @@ static double ga_get_login_time(struct utmpx *user_info)
 GuestUserList *qmp_guest_get_users(Error **errp)
 {
     GHashTable *cache = NULL;
-    GuestUserList *head = NULL, *cur_item = NULL;
+    GuestUserList *head = NULL, **tail = &head;
     struct utmpx *user_info = NULL;
     gpointer value = NULL;
     GuestUser *user = NULL;
-    GuestUserList *item = NULL;
     double login_time = 0;

     cache = g_hash_table_new(g_str_hash, g_str_equal);
@@ -3131,19 +3113,13 @@ GuestUserList *qmp_guest_get_users(Error **errp)
             continue;
         }

-        item = g_new0(GuestUserList, 1);
-        item->value = g_new0(GuestUser, 1);
-        item->value->user = g_strdup(user_info->ut_user);
-        item->value->login_time = ga_get_login_time(user_info);
+        user = g_new0(GuestUser, 1);
+        user->user = g_strdup(user_info->ut_user);
+        user->login_time = ga_get_login_time(user_info);

-        g_hash_table_insert(cache, item->value->user, item->value);
+        g_hash_table_insert(cache, user->user, user);

-        if (!cur_item) {
-            head = cur_item = item;
-        } else {
-            cur_item->next = item;
-            cur_item = item;
-        }
+        QAPI_LIST_APPEND(tail, user);
     }
     endutxent();
     g_hash_table_destroy(cache);
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a6cc481bc356..a00e6cb16557 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1624,11 +1624,11 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
     IP_ADAPTER_ADDRESSES *adptr_addrs, *addr;
     IP_ADAPTER_UNICAST_ADDRESS *ip_addr = NULL;
-    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
-    GuestIpAddressList *head_addr, *cur_addr;
-    GuestNetworkInterfaceList *info;
+    GuestNetworkInterfaceList *head = NULL, **tail = &head;
+    GuestIpAddressList *head_addr, **tail_addr;
+    GuestNetworkInterface *info;
     GuestNetworkInterfaceStat *interface_stat = NULL;
-    GuestIpAddressList *address_item = NULL;
+    GuestIpAddress *address_item = NULL;
     unsigned char *mac_addr;
     char *addr_str;
     WORD wsa_version;
@@ -1651,30 +1651,24 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
     for (addr = adptr_addrs; addr; addr = addr->Next) {
         info = g_malloc0(sizeof(*info));

-        if (cur_item == NULL) {
-            head = cur_item = info;
-        } else {
-            cur_item->next = info;
-            cur_item = info;
-        }
+        QAPI_LIST_APPEND(tail, info);

-        info->value = g_malloc0(sizeof(*info->value));
-        info->value->name = guest_wctomb_dup(addr->FriendlyName);
+        info->name = guest_wctomb_dup(addr->FriendlyName);

         if (addr->PhysicalAddressLength != 0) {
             mac_addr = addr->PhysicalAddress;

-            info->value->hardware_address =
+            info->hardware_address =
                 g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                 (int) mac_addr[0], (int) mac_addr[1],
                                 (int) mac_addr[2], (int) mac_addr[3],
                                 (int) mac_addr[4], (int) mac_addr[5]);

-            info->value->has_hardware_address = true;
+            info->has_hardware_address = true;
         }

         head_addr = NULL;
-        cur_addr = NULL;
+        tail_addr = &head_addr;
         for (ip_addr = addr->FirstUnicastAddress;
                 ip_addr;
                 ip_addr = ip_addr->Next) {
@@ -1685,37 +1679,29 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)

             address_item = g_malloc0(sizeof(*address_item));

-            if (!cur_addr) {
-                head_addr = cur_addr = address_item;
-            } else {
-                cur_addr->next = address_item;
-                cur_addr = address_item;
-            }
+            QAPI_LIST_APPEND(tail_addr, address_item);

-            address_item->value = g_malloc0(sizeof(*address_item->value));
-            address_item->value->ip_address = addr_str;
-            address_item->value->prefix = guest_ip_prefix(ip_addr);
+            address_item->ip_address = addr_str;
+            address_item->prefix = guest_ip_prefix(ip_addr);
             if (ip_addr->Address.lpSockaddr->sa_family == AF_INET) {
-                address_item->value->ip_address_type =
-                    GUEST_IP_ADDRESS_TYPE_IPV4;
+                address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
             } else if (ip_addr->Address.lpSockaddr->sa_family == AF_INET6) {
-                address_item->value->ip_address_type =
-                    GUEST_IP_ADDRESS_TYPE_IPV6;
+                address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
             }
         }
         if (head_addr) {
-            info->value->has_ip_addresses = true;
-            info->value->ip_addresses = head_addr;
+            info->has_ip_addresses = true;
+            info->ip_addresses = head_addr;
         }
-        if (!info->value->has_statistics) {
+        if (!info->has_statistics) {
             interface_stat = g_malloc0(sizeof(*interface_stat));
             if (guest_get_network_stats(addr->AdapterName,
                 interface_stat) == -1) {
-                info->value->has_statistics = false;
+                info->has_statistics = false;
                 g_free(interface_stat);
             } else {
-                info->value->statistics = interface_stat;
-                info->value->has_statistics = true;
+                info->statistics = interface_stat;
+                info->has_statistics = true;
             }
         }
     }
@@ -2082,12 +2068,11 @@ GuestUserList *qmp_guest_get_users(Error **errp)
 #define QGA_NANOSECONDS 10000000

     GHashTable *cache = NULL;
-    GuestUserList *head = NULL, *cur_item = NULL;
+    GuestUserList *head = NULL, **tail = &head;

     DWORD buffer_size = 0, count = 0, i = 0;
     GA_WTSINFOA *info = NULL;
     WTS_SESSION_INFOA *entries = NULL;
-    GuestUserList *item = NULL;
     GuestUser *user = NULL;
     gpointer value = NULL;
     INT64 login = 0;
@@ -2123,23 +2108,17 @@ GuestUserList *qmp_guest_get_users(Error **errp)
                         user->login_time = login_time;
                     }
                 } else {
-                    item = g_new0(GuestUserList, 1);
-                    item->value = g_new0(GuestUser, 1);
+                    user = g_new0(GuestUser, 1);

-                    item->value->user = g_strdup(info->UserName);
-                    item->value->domain = g_strdup(info->Domain);
-                    item->value->has_domain = true;
+                    user->user = g_strdup(info->UserName);
+                    user->domain = g_strdup(info->Domain);
+                    user->has_domain = true;

-                    item->value->login_time = login_time;
+                    user->login_time = login_time;

-                    g_hash_table_add(cache, item->value->user);
+                    g_hash_table_add(cache, user->user);

-                    if (!cur_item) {
-                        head = cur_item = item;
-                    } else {
-                        cur_item->next = item;
-                        cur_item = item;
-                    }
+                    QAPI_LIST_APPEND(tail, user);
                 }
             }
             WTSFreeMemory(info);
@@ -2424,7 +2403,7 @@ static GStrv ga_get_hardware_ids(DEVINST devInstance)

 GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
 {
-    GuestDeviceInfoList *head = NULL, *cur_item = NULL, *item = NULL;
+    GuestDeviceInfoList *head = NULL, **tail = &head;
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
     SP_DEVINFO_DATA dev_info_data;
     int i, j;
@@ -2522,14 +2501,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
         slog("driver: %s\ndriver version: %" PRId64 ",%s\n",
              device->driver_name, device->driver_date,
              device->driver_version);
-        item = g_new0(GuestDeviceInfoList, 1);
-        item->value = g_steal_pointer(&device);
-        if (!cur_item) {
-            head = cur_item = item;
-        } else {
-            cur_item->next = item;
-            cur_item = item;
-        }
+        QAPI_LIST_APPEND(tail, g_steal_pointer(&device));
     }

     if (dev_info != INVALID_HANDLE_VALUE) {
diff --git a/softmmu/tpm.c b/softmmu/tpm.c
index cab206355afd..578563f05a7b 100644
--- a/softmmu/tpm.c
+++ b/softmmu/tpm.c
@@ -196,22 +196,14 @@ int tpm_config_parse(QemuOptsList *opts_list, const char *optarg)
 TPMInfoList *qmp_query_tpm(Error **errp)
 {
     TPMBackend *drv;
-    TPMInfoList *info, *head = NULL, *cur_item = NULL;
+    TPMInfoList *head = NULL, **tail = &head;

     QLIST_FOREACH(drv, &tpm_backends, list) {
         if (!drv->tpmif) {
             continue;
         }

-        info = g_new0(TPMInfoList, 1);
-        info->value = tpm_backend_query_tpm(drv);
-
-        if (!cur_item) {
-            head = cur_item = info;
-        } else {
-            cur_item->next = info;
-            cur_item = info;
-        }
+        QAPI_LIST_APPEND(tail, tpm_backend_query_tpm(drv));
     }

     return head;
@@ -220,44 +212,26 @@ TPMInfoList *qmp_query_tpm(Error **errp)
 TpmTypeList *qmp_query_tpm_types(Error **errp)
 {
     unsigned int i = 0;
-    TpmTypeList *head = NULL, *prev = NULL, *cur_item;
+    TpmTypeList *head = NULL, **tail = &head;

     for (i = 0; i < TPM_TYPE__MAX; i++) {
         if (!tpm_be_find_by_type(i)) {
             continue;
         }
-        cur_item = g_new0(TpmTypeList, 1);
-        cur_item->value = i;
-
-        if (prev) {
-            prev->next = cur_item;
-        }
-        if (!head) {
-            head = cur_item;
-        }
-        prev = cur_item;
+        QAPI_LIST_APPEND(tail, i);
     }

     return head;
 }
 TpmModelList *qmp_query_tpm_models(Error **errp)
 {
-    TpmModelList *head = NULL, *prev = NULL, *cur_item;
+    TpmModelList *head = NULL, **tail = &head;
     GSList *e, *l = object_class_get_list(TYPE_TPM_IF, false);

     for (e = l; e; e = e->next) {
         TPMIfClass *c = TPM_IF_CLASS(e->data);

-        cur_item = g_new0(TpmModelList, 1);
-        cur_item->value = c->model;
-
-        if (prev) {
-            prev->next = cur_item;
-        }
-        if (!head) {
-            head = cur_item;
-        }
-        prev = cur_item;
+        QAPI_LIST_APPEND(tail, c->model);
     }
     g_slist_free(l);

diff --git a/ui/spice-core.c b/ui/spice-core.c
index eea52f538999..58232b649e60 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -355,11 +355,11 @@ static const char *wan_compression_names[] = {

 static SpiceChannelList *qmp_query_spice_channels(void)
 {
-    SpiceChannelList *cur_item = NULL, *head = NULL;
+    SpiceChannelList *head = NULL, **tail = &head;
     ChannelList *item;

     QTAILQ_FOREACH(item, &channel_list, link) {
-        SpiceChannelList *chan;
+        SpiceChannel *chan;
         char host[NI_MAXHOST], port[NI_MAXSERV];
         struct sockaddr *paddr;
         socklen_t plen;
@@ -367,29 +367,22 @@ static SpiceChannelList *qmp_query_spice_channels(void)
         assert(item->info->flags & SPICE_CHANNEL_EVENT_FLAG_ADDR_EXT);

         chan = g_malloc0(sizeof(*chan));
-        chan->value = g_malloc0(sizeof(*chan->value));

         paddr = (struct sockaddr *)&item->info->paddr_ext;
         plen = item->info->plen_ext;
         getnameinfo(paddr, plen,
                     host, sizeof(host), port, sizeof(port),
                     NI_NUMERICHOST | NI_NUMERICSERV);
-        chan->value->host = g_strdup(host);
-        chan->value->port = g_strdup(port);
-        chan->value->family = inet_netfamily(paddr->sa_family);
+        chan->host = g_strdup(host);
+        chan->port = g_strdup(port);
+        chan->family = inet_netfamily(paddr->sa_family);

-        chan->value->connection_id = item->info->connection_id;
-        chan->value->channel_type = item->info->type;
-        chan->value->channel_id = item->info->id;
-        chan->value->tls = item->info->flags & SPICE_CHANNEL_EVENT_FLAG_TLS;
+        chan->connection_id = item->info->connection_id;
+        chan->channel_type = item->info->type;
+        chan->channel_id = item->info->id;
+        chan->tls = item->info->flags & SPICE_CHANNEL_EVENT_FLAG_TLS;

-       /* XXX: waiting for the qapi to support GSList */
-        if (!cur_item) {
-            head = cur_item = chan;
-        } else {
-            cur_item->next = chan;
-            cur_item = chan;
-        }
+        QAPI_LIST_APPEND(tail, chan);
     }

     return head;
-- 
2.29.2


