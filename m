Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E97265BE1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 10:47:01 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGehw-0001Dl-7X
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 04:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kGefa-00059u-1A
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 04:44:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59079
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kGefX-0002iJ-40
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 04:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599813870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBd0C8LuolAhad1lykaPUtrv9y0Jq8U8K1UY+QjAydE=;
 b=clVYGwlUrYxtOfzCtDq+jUxI7CKJe3MIBhBTUWyjh0tDNGcYOpxGhJkkaXdUtAsmoEOo6z
 7QMQntCQn74z2FWH0b/Lx9TJVObazRQdQiSQUSyHpCfjrh5kALZ2l9zdVSHFWlAglo6SIz
 ZAAx2fx8dvYtkBzm4ScaR0B3Kjcjgzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-3iCyNqvQMNCGgbIpWYh8ew-1; Fri, 11 Sep 2020 04:44:26 -0400
X-MC-Unique: 3iCyNqvQMNCGgbIpWYh8ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38946108E8A3;
 Fri, 11 Sep 2020 08:44:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC6481C44;
 Fri, 11 Sep 2020 08:44:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] numa: drop support for '-numa node' (without memory
 specified)
Date: Fri, 11 Sep 2020 04:44:08 -0400
Message-Id: <20200911084410.788171-2-imammedo@redhat.com>
In-Reply-To: <20200911084410.788171-1-imammedo@redhat.com>
References: <20200911084410.788171-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, libvir-list@redhat.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com, david@gibson.dropbear.id.au,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it was deprecated since 4.1
commit 4bb4a2732e (numa: deprecate implict memory distribution between nodes)

Users of existing VMs, wishing to preserve the same RAM distribution,
should configure it explicitly using ``-numa node,memdev`` options.
Current RAM distribution can be retrieved using HMP command
`info numa` and if separate memory devices (pc|nv-dimm) are present
use `info memory-device` and subtract device memory from output of
`info numa`.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---

 include/hw/boards.h        |  2 --
 include/sysemu/numa.h      |  4 ---
 docs/system/deprecated.rst | 23 +++++++++-------
 hw/core/machine.c          |  1 -
 hw/core/numa.c             | 55 --------------------------------------
 hw/i386/pc_piix.c          |  1 -
 hw/i386/pc_q35.c           |  1 -
 hw/ppc/spapr.c             |  1 -
 8 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index bc5b82ad20..15fc1a2bac 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -208,8 +208,6 @@ struct MachineClass {
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
-    void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
-                                 int nb_nodes, ram_addr_t size);
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index ad58ee88f7..4173ef2afa 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -106,10 +106,6 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
 extern QemuOptsList qemu_numa_opts;
-void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
-                                 int nb_nodes, ram_addr_t size);
-void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
-                                  int nb_nodes, ram_addr_t size);
 void numa_cpu_pre_plug(const struct CPUArchId *slot, DeviceState *dev,
                        Error **errp);
 bool numa_uses_legacy_mem(void);
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 851dbdeb8a..6f9441005a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -104,15 +104,6 @@ error in the future.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
-``-numa`` node (without memory specified) (since 4.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Splitting RAM by default between NUMA nodes has the same issues as ``mem``
-parameter described above with the difference that the role of the user plays
-QEMU using implicit generic or board specific splitting rule.
-Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
-it's supported by used machine type) to define mapping explictly instead.
-
 ``-mem-path`` fallback to RAM (since 4.1)
 '''''''''''''''''''''''''''''''''''''''''
 
@@ -602,6 +593,20 @@ error when ``-u`` is not used.
 Command line options
 --------------------
 
+``-numa`` node (without memory specified) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Splitting RAM by default between NUMA nodes had the same issues as ``mem``
+parameter with the difference that the role of the user plays QEMU using
+implicit generic or board specific splitting rule.
+Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
+it's supported by used machine type) to define mapping explictly instead.
+Users of existing VMs, wishing to preserve the same RAM distribution, should
+configure it explicitly using ``-numa node,memdev`` options. Current RAM
+distribution can be retrieved using HMP command ``info numa`` and if separate
+memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
+device memory from output of ``info numa``.
+
 ``-numa node,mem=``\ *size* (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ea26d61237..f70d388e86 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -797,7 +797,6 @@ static void machine_class_init(ObjectClass *oc, void *data)
      * On Linux, each node's border has to be 8MB aligned
      */
     mc->numa_mem_align_shift = 23;
-    mc->numa_auto_assign_ram = numa_default_auto_assign_ram;
 
     object_class_property_add_str(oc, "kernel",
         machine_get_kernel, machine_set_kernel);
diff --git a/hw/core/numa.c b/hw/core/numa.c
index f9593ec716..706c1e84c6 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -611,42 +611,6 @@ static void complete_init_numa_distance(MachineState *ms)
     }
 }
 
-void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
-                                 int nb_nodes, ram_addr_t size)
-{
-    int i;
-    uint64_t usedmem = 0;
-
-    /* Align each node according to the alignment
-     * requirements of the machine class
-     */
-
-    for (i = 0; i < nb_nodes - 1; i++) {
-        nodes[i].node_mem = (size / nb_nodes) &
-                            ~((1 << mc->numa_mem_align_shift) - 1);
-        usedmem += nodes[i].node_mem;
-    }
-    nodes[i].node_mem = size - usedmem;
-}
-
-void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
-                                  int nb_nodes, ram_addr_t size)
-{
-    int i;
-    uint64_t usedmem = 0, node_mem;
-    uint64_t granularity = size / nb_nodes;
-    uint64_t propagate = 0;
-
-    for (i = 0; i < nb_nodes - 1; i++) {
-        node_mem = (granularity + propagate) &
-                   ~((1 << mc->numa_mem_align_shift) - 1);
-        propagate = granularity + propagate - node_mem;
-        nodes[i].node_mem = node_mem;
-        usedmem += node_mem;
-    }
-    nodes[i].node_mem = size - usedmem;
-}
-
 static void numa_init_memdev_container(MachineState *ms, MemoryRegion *ram)
 {
     int i;
@@ -717,25 +681,6 @@ void numa_complete_configuration(MachineState *ms)
             ms->numa_state->num_nodes = MAX_NODES;
         }
 
-        /* If no memory size is given for any node, assume the default case
-         * and distribute the available memory equally across all nodes
-         */
-        for (i = 0; i < ms->numa_state->num_nodes; i++) {
-            if (numa_info[i].node_mem != 0) {
-                break;
-            }
-        }
-        if (i == ms->numa_state->num_nodes) {
-            assert(mc->numa_auto_assign_ram);
-            mc->numa_auto_assign_ram(mc, numa_info,
-                                     ms->numa_state->num_nodes, ram_size);
-            if (!qtest_enabled()) {
-                warn_report("Default splitting of RAM between nodes is deprecated,"
-                            " Use '-numa node,memdev' to explictly define RAM"
-                            " allocation per node");
-            }
-        }
-
         numa_total = 0;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             numa_total += numa_info[i].node_mem;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32b1453e6a..5507812c13 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -565,7 +565,6 @@ static void pc_i440fx_2_9_machine_options(MachineClass *m)
     pc_i440fx_2_10_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_2_9, hw_compat_2_9_len);
     compat_props_add(m->compat_props, pc_compat_2_9, pc_compat_2_9_len);
-    m->numa_auto_assign_ram = numa_legacy_auto_assign_ram;
 }
 
 DEFINE_I440FX_MACHINE(v2_9, "pc-i440fx-2.9", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0cb9c18cd4..4a37bc3e6d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -494,7 +494,6 @@ static void pc_q35_2_10_machine_options(MachineClass *m)
     pc_q35_2_11_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_2_10, hw_compat_2_10_len);
     compat_props_add(m->compat_props, pc_compat_2_10, pc_compat_2_10_len);
-    m->numa_auto_assign_ram = numa_legacy_auto_assign_ram;
     m->auto_enable_numa_with_memhp = false;
 }
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9bce1892b5..12fd92373d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4737,7 +4737,6 @@ static void spapr_machine_2_9_class_options(MachineClass *mc)
     spapr_machine_2_10_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_2_9, hw_compat_2_9_len);
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
-    mc->numa_auto_assign_ram = numa_legacy_auto_assign_ram;
     smc->pre_2_10_has_unused_icps = true;
     smc->resize_hpt_default = SPAPR_RESIZE_HPT_DISABLED;
 }
-- 
2.27.0


