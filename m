Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E85D43C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 18:30:23 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiLfi-0005wK-Ro
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 12:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37455)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hiKpI-0007oG-LY
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hiKpH-0005ui-6K
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:36:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hiKpG-0005tn-U1
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:36:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3121830842CE;
 Tue,  2 Jul 2019 15:36:10 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33D119C6F;
 Tue,  2 Jul 2019 15:36:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Tue,  2 Jul 2019 12:35:09 -0300
Message-Id: <20190702153535.9851-17-ehabkost@redhat.com>
In-Reply-To: <20190702153535.9851-1-ehabkost@redhat.com>
References: <20190702153535.9851-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 15:36:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v3 16/42] machine: show if CLI option '-numa
 node, mem' is supported in QAPI schema
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Legacy '-numa node,mem' option has a number of issues and mgmt often
defaults to it. Unfortunately it's no possible to replace it with
an alternative '-numa memdev' without breaking migration compatibility.
What's possible though is to deprecate it, keeping option working with
old machine types only.

In order to help users to find out if being deprecated CLI option
'-numa node,mem' is still supported by particular machine type, add new
"numa-mem-supported" property to output of query-machines.

"numa-mem-supported" is set to 'true' for machines that currently support
NUMA, but it will be flipped to 'false' later on, once deprecation period
expires and kept 'true' only for old machine types that used to support
the legacy option so it won't break existing configuration that are using
it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1560172207-378962-1-git-send-email-imammedo@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/misc.json      | 5 ++++-
 include/hw/boards.h | 3 +++
 hw/arm/virt.c       | 1 +
 hw/i386/pc.c        | 1 +
 hw/ppc/spapr.c      | 1 +
 vl.c                | 1 +
 6 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 577f7166f4..ccd56c9191 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2014,12 +2014,15 @@
 #
 # @hotpluggable-cpus: cpu hotplug via -device is supported (since 2.7.0)
 #
+# @numa-mem-supported: true if '-numa node,mem' option is supported by
+#                      the machine type and false otherwise (since 4.1)
+#
 # Since: 1.2.0
 ##
 { 'struct': 'MachineInfo',
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
-            'hotpluggable-cpus': 'bool'} }
+            'hotpluggable-cpus': 'bool', 'numa-mem-supported': 'bool'} }
 
 ##
 # @query-machines:
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 843d82c77d..47cba6ce6c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -159,6 +159,8 @@ typedef struct {
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
+ * @numa_mem_supported:
+ *    true if '--numa node.mem' option is supported and false otherwise
  */
 struct MachineClass {
     /*< private >*/
@@ -211,6 +213,7 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
+    bool numa_mem_supported;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 20f191bc93..0b5138cb22 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1952,6 +1952,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->plug = virt_machine_device_plug_cb;
+    mc->numa_mem_supported = true;
 }
 
 static void virt_instance_init(Object *obj)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9b953eeeea..114fd5f8d4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2792,6 +2792,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = x86_nmi;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->numa_mem_supported = true;
 
     object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
         pc_machine_get_device_memory_region_size, NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 51256ac9ca..821f0d4a49 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4367,6 +4367,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
      * in which LMBs are represented and hot-added
      */
     mc->numa_mem_align_shift = 28;
+    mc->numa_mem_supported = true;
 
     smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_VSX] = SPAPR_CAP_ON;
diff --git a/vl.c b/vl.c
index 96f4dd828b..1729410e92 100644
--- a/vl.c
+++ b/vl.c
@@ -1430,6 +1430,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->name = g_strdup(mc->name);
         info->cpu_max = !mc->max_cpus ? 1 : mc->max_cpus;
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
+        info->numa_mem_supported = mc->numa_mem_supported;
 
         entry = g_malloc0(sizeof(*entry));
         entry->value = info;
-- 
2.18.0.rc1.1.g3f1ff2140


