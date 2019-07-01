Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928154C242
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 22:19:33 +0200 (CEST)
Received: from localhost ([::1]:41702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdh3M-0001oA-OW
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 16:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hdgv9-0004K4-RW
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hdgv5-00017g-Mz
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:11:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46554)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hdgv4-00012k-5P
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 16:10:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 737B6C04BD4A;
 Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-85.ams2.redhat.com
 [10.36.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C23181001DD1;
 Wed, 19 Jun 2019 20:10:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF45E11384D2; Wed, 19 Jun 2019 22:10:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 22:10:44 +0200
Message-Id: <20190619201050.19040-12-armbru@redhat.com>
In-Reply-To: <20190619201050.19040-1-armbru@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 19 Jun 2019 20:10:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 11/17] hw/core: Collect HMP command handlers in
 hw/core/
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
Cc: kwolf@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the HMP handlers related to qapi/machine.json to
hw/core/machine-hmp-cmds.c, where they are covered by MAINTAINERS
section "Machine core", just like qapi/machine.json.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/Makefile.objs      |   1 +
 hw/core/machine-hmp-cmds.c | 164 +++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h      |   1 +
 monitor/hmp-cmds.c         | 111 -------------------------
 monitor/misc.c             |  32 +-------
 5 files changed, 168 insertions(+), 141 deletions(-)
 create mode 100644 hw/core/machine-hmp-cmds.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 99e7abe982..585b734358 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -25,3 +25,4 @@ common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D machine-qmp-cmds.o
 obj-$(CONFIG_SOFTMMU) +=3D numa.o
+common-obj-$(CONFIG_SOFTMMU) +=3D machine-hmp-cmds.o
diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
new file mode 100644
index 0000000000..7fa6075f1e
--- /dev/null
+++ b/hw/core/machine-hmp-cmds.c
@@ -0,0 +1,164 @@
+/*
+ * HMP commands related to machines and CPUs
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/error.h"
+#include "qapi/qapi-builtin-visit.h"
+#include "qapi/qapi-commands-machine.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/string-output-visitor.h"
+#include "qemu/error-report.h"
+#include "sysemu/numa.h"
+
+void hmp_info_cpus(Monitor *mon, const QDict *qdict)
+{
+    CpuInfoFastList *cpu_list, *cpu;
+
+    cpu_list =3D qmp_query_cpus_fast(NULL);
+
+    for (cpu =3D cpu_list; cpu; cpu =3D cpu->next) {
+        int active =3D ' ';
+
+        if (cpu->value->cpu_index =3D=3D monitor_get_cpu_index()) {
+            active =3D '*';
+        }
+
+        monitor_printf(mon, "%c CPU #%" PRId64 ":", active,
+                       cpu->value->cpu_index);
+        monitor_printf(mon, " thread_id=3D%" PRId64 "\n", cpu->value->th=
read_id);
+    }
+
+    qapi_free_CpuInfoFastList(cpu_list);
+}
+
+void hmp_cpu_add(Monitor *mon, const QDict *qdict)
+{
+    int cpuid;
+    Error *err =3D NULL;
+
+    error_report("cpu_add is deprecated, please use device_add instead")=
;
+
+    cpuid =3D qdict_get_int(qdict, "id");
+    qmp_cpu_add(cpuid, &err);
+    hmp_handle_error(mon, &err);
+}
+
+void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
+{
+    Error *err =3D NULL;
+    HotpluggableCPUList *l =3D qmp_query_hotpluggable_cpus(&err);
+    HotpluggableCPUList *saved =3D l;
+    CpuInstanceProperties *c;
+
+    if (err !=3D NULL) {
+        hmp_handle_error(mon, &err);
+        return;
+    }
+
+    monitor_printf(mon, "Hotpluggable CPUs:\n");
+    while (l) {
+        monitor_printf(mon, "  type: \"%s\"\n", l->value->type);
+        monitor_printf(mon, "  vcpus_count: \"%" PRIu64 "\"\n",
+                       l->value->vcpus_count);
+        if (l->value->has_qom_path) {
+            monitor_printf(mon, "  qom_path: \"%s\"\n", l->value->qom_pa=
th);
+        }
+
+        c =3D l->value->props;
+        monitor_printf(mon, "  CPUInstance Properties:\n");
+        if (c->has_node_id) {
+            monitor_printf(mon, "    node-id: \"%" PRIu64 "\"\n", c->nod=
e_id);
+        }
+        if (c->has_socket_id) {
+            monitor_printf(mon, "    socket-id: \"%" PRIu64 "\"\n", c->s=
ocket_id);
+        }
+        if (c->has_core_id) {
+            monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->cor=
e_id);
+        }
+        if (c->has_thread_id) {
+            monitor_printf(mon, "    thread-id: \"%" PRIu64 "\"\n", c->t=
hread_id);
+        }
+
+        l =3D l->next;
+    }
+
+    qapi_free_HotpluggableCPUList(saved);
+}
+
+void hmp_info_memdev(Monitor *mon, const QDict *qdict)
+{
+    Error *err =3D NULL;
+    MemdevList *memdev_list =3D qmp_query_memdev(&err);
+    MemdevList *m =3D memdev_list;
+    Visitor *v;
+    char *str;
+
+    while (m) {
+        v =3D string_output_visitor_new(false, &str);
+        visit_type_uint16List(v, NULL, &m->value->host_nodes, NULL);
+        monitor_printf(mon, "memory backend: %s\n", m->value->id);
+        monitor_printf(mon, "  size:  %" PRId64 "\n", m->value->size);
+        monitor_printf(mon, "  merge: %s\n",
+                       m->value->merge ? "true" : "false");
+        monitor_printf(mon, "  dump: %s\n",
+                       m->value->dump ? "true" : "false");
+        monitor_printf(mon, "  prealloc: %s\n",
+                       m->value->prealloc ? "true" : "false");
+        monitor_printf(mon, "  policy: %s\n",
+                       HostMemPolicy_str(m->value->policy));
+        visit_complete(v, &str);
+        monitor_printf(mon, "  host nodes: %s\n", str);
+
+        g_free(str);
+        visit_free(v);
+        m =3D m->next;
+    }
+
+    monitor_printf(mon, "\n");
+
+    qapi_free_MemdevList(memdev_list);
+    hmp_handle_error(mon, &err);
+}
+
+void hmp_info_numa(Monitor *mon, const QDict *qdict)
+{
+    int i;
+    NumaNodeMem *node_mem;
+    CpuInfoList *cpu_list, *cpu;
+
+    cpu_list =3D qmp_query_cpus(&error_abort);
+    node_mem =3D g_new0(NumaNodeMem, nb_numa_nodes);
+
+    query_numa_node_mem(node_mem);
+    monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
+    for (i =3D 0; i < nb_numa_nodes; i++) {
+        monitor_printf(mon, "node %d cpus:", i);
+        for (cpu =3D cpu_list; cpu; cpu =3D cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id =
&&
+                cpu->value->props->node_id =3D=3D i) {
+                monitor_printf(mon, " %" PRIi64, cpu->value->CPU);
+            }
+        }
+        monitor_printf(mon, "\n");
+        monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
+                       node_mem[i].node_mem >> 20);
+        monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
+                       node_mem[i].node_plugged_mem >> 20);
+    }
+    qapi_free_CpuInfoList(cpu_list);
+    g_free(node_mem);
+}
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index f46ccdaa35..9d558e9d78 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -117,6 +117,7 @@ void hmp_cpu_add(Monitor *mon, const QDict *qdict);
 void hmp_object_add(Monitor *mon, const QDict *qdict);
 void hmp_object_del(Monitor *mon, const QDict *qdict);
 void hmp_info_memdev(Monitor *mon, const QDict *qdict);
+void hmp_info_numa(Monitor *mon, const QDict *qdict);
 void hmp_info_memory_devices(Monitor *mon, const QDict *qdict);
 void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 789f763938..ea8ae2966e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -31,7 +31,6 @@
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
-#include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-net.h"
@@ -457,27 +456,6 @@ void hmp_info_migrate_cache_size(Monitor *mon, const=
 QDict *qdict)
                    qmp_query_migrate_cache_size(NULL) >> 10);
 }
=20
-void hmp_info_cpus(Monitor *mon, const QDict *qdict)
-{
-    CpuInfoFastList *cpu_list, *cpu;
-
-    cpu_list =3D qmp_query_cpus_fast(NULL);
-
-    for (cpu =3D cpu_list; cpu; cpu =3D cpu->next) {
-        int active =3D ' ';
-
-        if (cpu->value->cpu_index =3D=3D monitor_get_cpu_index()) {
-            active =3D '*';
-        }
-
-        monitor_printf(mon, "%c CPU #%" PRId64 ":", active,
-                       cpu->value->cpu_index);
-        monitor_printf(mon, " thread_id=3D%" PRId64 "\n", cpu->value->th=
read_id);
-    }
-
-    qapi_free_CpuInfoFastList(cpu_list);
-}
-
 static void print_block_info(Monitor *mon, BlockInfo *info,
                              BlockDeviceInfo *inserted, bool verbose)
 {
@@ -2472,18 +2450,6 @@ void hmp_nbd_server_stop(Monitor *mon, const QDict=
 *qdict)
     hmp_handle_error(mon, &err);
 }
=20
-void hmp_cpu_add(Monitor *mon, const QDict *qdict)
-{
-    int cpuid;
-    Error *err =3D NULL;
-
-    error_report("cpu_add is deprecated, please use device_add instead")=
;
-
-    cpuid =3D qdict_get_int(qdict, "id");
-    qmp_cpu_add(cpuid, &err);
-    hmp_handle_error(mon, &err);
-}
-
 void hmp_chardev_add(Monitor *mon, const QDict *qdict)
 {
     const char *args =3D qdict_get_str(qdict, "args");
@@ -2615,41 +2581,6 @@ void hmp_object_del(Monitor *mon, const QDict *qdi=
ct)
     hmp_handle_error(mon, &err);
 }
=20
-void hmp_info_memdev(Monitor *mon, const QDict *qdict)
-{
-    Error *err =3D NULL;
-    MemdevList *memdev_list =3D qmp_query_memdev(&err);
-    MemdevList *m =3D memdev_list;
-    Visitor *v;
-    char *str;
-
-    while (m) {
-        v =3D string_output_visitor_new(false, &str);
-        visit_type_uint16List(v, NULL, &m->value->host_nodes, NULL);
-        monitor_printf(mon, "memory backend: %s\n", m->value->id);
-        monitor_printf(mon, "  size:  %" PRId64 "\n", m->value->size);
-        monitor_printf(mon, "  merge: %s\n",
-                       m->value->merge ? "true" : "false");
-        monitor_printf(mon, "  dump: %s\n",
-                       m->value->dump ? "true" : "false");
-        monitor_printf(mon, "  prealloc: %s\n",
-                       m->value->prealloc ? "true" : "false");
-        monitor_printf(mon, "  policy: %s\n",
-                       HostMemPolicy_str(m->value->policy));
-        visit_complete(v, &str);
-        monitor_printf(mon, "  host nodes: %s\n", str);
-
-        g_free(str);
-        visit_free(v);
-        m =3D m->next;
-    }
-
-    monitor_printf(mon, "\n");
-
-    qapi_free_MemdevList(memdev_list);
-    hmp_handle_error(mon, &err);
-}
-
 void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
 {
     Error *err =3D NULL;
@@ -3039,48 +2970,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict *=
qdict)
     ram_block_dump(mon);
 }
=20
-void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
-{
-    Error *err =3D NULL;
-    HotpluggableCPUList *l =3D qmp_query_hotpluggable_cpus(&err);
-    HotpluggableCPUList *saved =3D l;
-    CpuInstanceProperties *c;
-
-    if (err !=3D NULL) {
-        hmp_handle_error(mon, &err);
-        return;
-    }
-
-    monitor_printf(mon, "Hotpluggable CPUs:\n");
-    while (l) {
-        monitor_printf(mon, "  type: \"%s\"\n", l->value->type);
-        monitor_printf(mon, "  vcpus_count: \"%" PRIu64 "\"\n",
-                       l->value->vcpus_count);
-        if (l->value->has_qom_path) {
-            monitor_printf(mon, "  qom_path: \"%s\"\n", l->value->qom_pa=
th);
-        }
-
-        c =3D l->value->props;
-        monitor_printf(mon, "  CPUInstance Properties:\n");
-        if (c->has_node_id) {
-            monitor_printf(mon, "    node-id: \"%" PRIu64 "\"\n", c->nod=
e_id);
-        }
-        if (c->has_socket_id) {
-            monitor_printf(mon, "    socket-id: \"%" PRIu64 "\"\n", c->s=
ocket_id);
-        }
-        if (c->has_core_id) {
-            monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->cor=
e_id);
-        }
-        if (c->has_thread_id) {
-            monitor_printf(mon, "    thread-id: \"%" PRIu64 "\"\n", c->t=
hread_id);
-        }
-
-        l =3D l->next;
-    }
-
-    qapi_free_HotpluggableCPUList(saved);
-}
-
 void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
 {
     Error *err =3D NULL;
diff --git a/monitor/misc.c b/monitor/misc.c
index 45f3f55a4d..00338c002a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -36,7 +36,6 @@
 #include "net/slirp.h"
 #include "chardev/char-mux.h"
 #include "ui/qemu-spice.h"
-#include "sysemu/numa.h"
 #include "qemu/config-file.h"
 #include "qemu/ctype.h"
 #include "ui/console.h"
@@ -48,6 +47,8 @@
 #include "sysemu/hw_accel.h"
 #include "authz/list.h"
 #include "qapi/util.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/tpm.h"
 #include "qapi/qmp/qdict.h"
@@ -1081,35 +1082,6 @@ static void hmp_info_mtree(Monitor *mon, const QDi=
ct *qdict)
     mtree_info(flatview, dispatch_tree, owner);
 }
=20
-static void hmp_info_numa(Monitor *mon, const QDict *qdict)
-{
-    int i;
-    NumaNodeMem *node_mem;
-    CpuInfoList *cpu_list, *cpu;
-
-    cpu_list =3D qmp_query_cpus(&error_abort);
-    node_mem =3D g_new0(NumaNodeMem, nb_numa_nodes);
-
-    query_numa_node_mem(node_mem);
-    monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
-    for (i =3D 0; i < nb_numa_nodes; i++) {
-        monitor_printf(mon, "node %d cpus:", i);
-        for (cpu =3D cpu_list; cpu; cpu =3D cpu->next) {
-            if (cpu->value->has_props && cpu->value->props->has_node_id =
&&
-                cpu->value->props->node_id =3D=3D i) {
-                monitor_printf(mon, " %" PRIi64, cpu->value->CPU);
-            }
-        }
-        monitor_printf(mon, "\n");
-        monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
-                       node_mem[i].node_mem >> 20);
-        monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
-                       node_mem[i].node_plugged_mem >> 20);
-    }
-    qapi_free_CpuInfoList(cpu_list);
-    g_free(node_mem);
-}
-
 #ifdef CONFIG_PROFILER
=20
 int64_t dev_time;
--=20
2.21.0


