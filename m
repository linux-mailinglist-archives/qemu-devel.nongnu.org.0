Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE1F41FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 10:50:41 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hayxs-0005WP-9x
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 04:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <like.xu@linux.intel.com>) id 1hayro-00038X-UH
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <like.xu@linux.intel.com>) id 1hayri-0006ER-VX
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:10698)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
 id 1hayri-0005un-Lf
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 04:44:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 01:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,363,1557212400"; d="scan'208";a="184175081"
Received: from likexu-e5-2699-v4.sh.intel.com ([10.239.48.178])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2019 01:43:29 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 12 Jun 2019 16:40:58 +0800
Message-Id: <20190612084104.34984-4-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612084104.34984-1-like.xu@linux.intel.com>
References: <20190612084104.34984-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v3 3/9] i386/cpu: Consolidate die-id validity
 in smp context
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, like.xu@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The field die_id (default as 0) and has_die_id are introduced to X86CPU.
Following the legacy smp check rules, the die_id validity is added to
the same contexts as leagcy smp variables such as hmp_hotpluggable_cpus(),
machine_set_cpu_numa_node(), cpu_slot_to_string() and pc_cpu_pre_plug().

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hmp.c                      |  3 +++
 hw/core/machine.c          | 12 ++++++++++++
 hw/i386/pc.c               | 14 ++++++++++++++
 include/hw/i386/topology.h |  2 ++
 qapi/misc.json             |  6 ++++--
 target/i386/cpu.c          |  2 ++
 target/i386/cpu.h          |  1 +
 7 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hmp.c b/hmp.c
index be5e345c6f..b567c86628 100644
--- a/hmp.c
+++ b/hmp.c
@@ -3113,6 +3113,9 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
         if (c->has_socket_id) {
             monitor_printf(mon, "    socket-id: \"%" PRIu64 "\"\n", c->socket_id);
         }
+        if (c->has_die_id) {
+            monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f1a0f45f9c..9eeba448ed 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -679,6 +679,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_die_id && !slot->props.has_die_id) {
+            error_setg(errp, "die-id is not supported");
+            return;
+        }
+
         /* skip slots with explicit mismatch */
         if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
                 continue;
@@ -688,6 +693,10 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_die_id && props->die_id != slot->props.die_id) {
+                continue;
+        }
+
         if (props->has_socket_id && props->socket_id != slot->props.socket_id) {
                 continue;
         }
@@ -945,6 +954,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     if (cpu->props.has_socket_id) {
         g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
     }
+    if (cpu->props.has_die_id) {
+        g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
+    }
     if (cpu->props.has_core_id) {
         if (s->len) {
             g_string_append_printf(s, ", ");
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index af2e95a1b9..6e774c6c8e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2329,6 +2329,10 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
             error_setg(errp, "Invalid CPU socket-id: %u must be in range 0:%u",
                        cpu->socket_id, max_socket);
             return;
+        } else if (cpu->die_id > pcms->smp_dies - 1) {
+            error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
+                       cpu->die_id, max_socket);
+            return;
         }
         if (cpu->core_id < 0) {
             error_setg(errp, "CPU core-id is not set");
@@ -2348,6 +2352,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
         }
 
         topo.pkg_id = cpu->socket_id;
+        topo.die_id = cpu->die_id;
         topo.core_id = cpu->core_id;
         topo.smt_id = cpu->thread_id;
         cpu->apic_id = apicid_from_topo_ids(smp_cores, smp_threads, &topo);
@@ -2385,6 +2390,13 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
     }
     cpu->socket_id = topo.pkg_id;
 
+    if (cpu->die_id != -1 && cpu->die_id != topo.die_id) {
+        error_setg(errp, "property die-id: %u doesn't match set apic-id:"
+            " 0x%x (die-id: %u)", cpu->die_id, cpu->apic_id, topo.die_id);
+        return;
+    }
+    cpu->die_id = topo.die_id;
+
     if (cpu->core_id != -1 && cpu->core_id != topo.core_id) {
         error_setg(errp, "property core-id: %u doesn't match set apic-id:"
             " 0x%x (core-id: %u)", cpu->core_id, cpu->apic_id, topo.core_id);
@@ -2701,6 +2713,8 @@ static const CPUArchIdList *pc_possible_cpu_arch_ids(MachineState *ms)
                                  ms->smp.cores, ms->smp.threads, &topo);
         ms->possible_cpus->cpus[i].props.has_socket_id = true;
         ms->possible_cpus->cpus[i].props.socket_id = topo.pkg_id;
+        ms->possible_cpus->cpus[i].props.has_die_id = true;
+        ms->possible_cpus->cpus[i].props.die_id = topo.die_id;
         ms->possible_cpus->cpus[i].props.has_core_id = true;
         ms->possible_cpus->cpus[i].props.core_id = topo.core_id;
         ms->possible_cpus->cpus[i].props.has_thread_id = true;
diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 1ebaee0f76..c9fb41588e 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -47,6 +47,7 @@ typedef uint32_t apic_id_t;
 
 typedef struct X86CPUTopoInfo {
     unsigned pkg_id;
+    unsigned die_id;
     unsigned core_id;
     unsigned smt_id;
 } X86CPUTopoInfo;
@@ -130,6 +131,7 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
     topo->core_id = (apicid >> apicid_core_offset(nr_cores, nr_threads)) &
                    ~(0xFFFFFFFFUL << apicid_core_width(nr_cores, nr_threads));
     topo->pkg_id = apicid >> apicid_pkg_offset(nr_cores, nr_threads);
+    topo->die_id = 0;
 }
 
 /* Make APIC ID for the CPU 'cpu_index'
diff --git a/qapi/misc.json b/qapi/misc.json
index 8b3ca4fdd3..cd236c89b3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2924,10 +2924,11 @@
 #
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
-# @core-id: core number within socket the CPU belongs to
+# @die-id: die number within node/board the CPU belongs to (Since 4.1)
+# @core-id: core number within die the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-# Note: currently there are 4 properties that could be present
+# Note: currently there are 5 properties that could be present
 # but management should be prepared to pass through other
 # properties with device_add command to allow for future
 # interface extension. This also requires the filed names to be kept in
@@ -2938,6 +2939,7 @@
 { 'struct': 'CpuInstanceProperties',
   'data': { '*node-id': 'int',
             '*socket-id': 'int',
+            '*die-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a16be205fe..0fc543096f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5845,11 +5845,13 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_UINT32("apic-id", X86CPU, apic_id, 0),
     DEFINE_PROP_INT32("thread-id", X86CPU, thread_id, 0),
     DEFINE_PROP_INT32("core-id", X86CPU, core_id, 0),
+    DEFINE_PROP_INT32("die-id", X86CPU, die_id, 0),
     DEFINE_PROP_INT32("socket-id", X86CPU, socket_id, 0),
 #else
     DEFINE_PROP_UINT32("apic-id", X86CPU, apic_id, UNASSIGNED_APIC_ID),
     DEFINE_PROP_INT32("thread-id", X86CPU, thread_id, -1),
     DEFINE_PROP_INT32("core-id", X86CPU, core_id, -1),
+    DEFINE_PROP_INT32("die-id", X86CPU, die_id, -1),
     DEFINE_PROP_INT32("socket-id", X86CPU, socket_id, -1),
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5daa2eeafa..69495f0a8a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1475,6 +1475,7 @@ struct X86CPU {
 
     int32_t node_id; /* NUMA node this CPU belongs to */
     int32_t socket_id;
+    int32_t die_id;
     int32_t core_id;
     int32_t thread_id;
 
-- 
2.21.0


