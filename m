Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD01EFD38
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 18:05:43 +0200 (CEST)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhEqj-0003uU-Ti
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhEol-000224-1c
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:03:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48732
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhEoi-0006lg-Jw
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 12:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591373015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qhQudXyXHkRHqHT57DM34EJ/bv4fztr+y7+XVS4wD5I=;
 b=Kmil5aVF0+ElSqixx/kIA26h6TuhaYmWjJzfEDUwfro5KwrwkhqjgPvfOKGtR1VsQXbCXc
 oIfoyK9CsJTABC2flQZLIbW9cgvja0AIBQHFFUkKCGGxvtwUZWXukud8Xc6IMlPgMAscti
 b5NA/fhd3R5sUvbUjIIWDgnr8R4BT+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-E62wNAGkMfqEkJlzTwR-Qg-1; Fri, 05 Jun 2020 12:03:33 -0400
X-MC-Unique: E62wNAGkMfqEkJlzTwR-Qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D23E80B71F;
 Fri,  5 Jun 2020 16:03:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6767B601;
 Fri,  5 Jun 2020 16:03:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] numa: forbid '-numa node,
 mem' for 5.1 and newer machine types
Date: Fri,  5 Jun 2020 12:03:21 -0400
Message-Id: <20200605160321.671964-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Deprecation period is run out and it's a time to flip the switch
introduced by cd5ff8333a.  Disable legacy option for new machine
types (since 5.1) and amend documentation.

'-numa node,memdev' shall be used instead of disabled option
with new machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
---
v1:
 - rebased on top of current master
 - move compat mode from 4.2 to 5.0
v2:
 - move deprection text to recently removed section
v3:
 - increase title line length for (deprecated.rst)
     '``-numa node,mem=``\ *size* (removed in 5.1)'

CC: peter.maydell@linaro.org
CC: ehabkost@redhat.com
CC: marcel.apfelbaum@gmail.com
CC: mst@redhat.com
CC: pbonzini@redhat.com
CC: rth@twiddle.net
CC: david@gibson.dropbear.id.au
CC: libvir-list@redhat.com
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
---
 docs/system/deprecated.rst | 37 ++++++++++++++++++++-----------------
 hw/arm/virt.c              |  2 +-
 hw/core/numa.c             |  6 ++++++
 hw/i386/pc.c               |  1 -
 hw/i386/pc_piix.c          |  1 +
 hw/i386/pc_q35.c           |  1 +
 hw/ppc/spapr.c             |  2 +-
 qemu-options.hx            |  9 +++++----
 8 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index f0061f94aa..502e41ff35 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -101,23 +101,6 @@ error in the future.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
-``-numa node,mem=``\ *size* (since 4.1)
-'''''''''''''''''''''''''''''''''''''''
-
-The parameter ``mem`` of ``-numa node`` is used to assign a part of
-guest RAM to a NUMA node. But when using it, it's impossible to manage specified
-RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
-so guest end-ups with the fake NUMA configuration with suboptiomal performance.
-However since 2014 there is an alternative way to assign RAM to a NUMA node
-using parameter ``memdev``, which does the same as ``mem`` and adds
-means to actualy manage node RAM on the host side. Use parameter ``memdev``
-with *memory-backend-ram* backend as an replacement for parameter ``mem``
-to achieve the same fake NUMA effect or a properly configured
-*memory-backend-file* backend to actually benefit from NUMA configuration.
-In future new machine versions will not accept the option but it will still
-work with old machine types. User can check QAPI schema to see if the legacy
-option is supported by looking at MachineInfo::numa-mem-supported property.
-
 ``-numa`` node (without memory specified) (since 4.1)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -512,3 +495,23 @@ long starting at 1MiB, the old command::
 can be rewritten as::
 
   qemu-nbd -t --image-opts driver=raw,offset=1M,size=100M,file.driver=qcow2,file.file.driver=file,file.file.filename=file.qcow2
+
+Command line options
+--------------------
+
+``-numa node,mem=``\ *size* (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''
+
+The parameter ``mem`` of ``-numa node`` is used to assign a part of
+guest RAM to a NUMA node. But when using it, it's impossible to manage specified
+RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
+so guest end-ups with the fake NUMA configuration with suboptiomal performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter ``memdev``, which does the same as ``mem`` and adds
+means to actualy manage node RAM on the host side. Use parameter ``memdev``
+with *memory-backend-ram* backend as an replacement for parameter ``mem``
+to achieve the same fake NUMA effect or a properly configured
+*memory-backend-file* backend to actually benefit from NUMA configuration.
+In future new machine versions will not accept the option but it will still
+work with old machine types. User can check QAPI schema to see if the legacy
+option is supported by looking at MachineInfo::numa-mem-supported property.
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 37462a6f78..063d4703f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2262,7 +2262,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
     hc->unplug_request = virt_machine_device_unplug_request_cb;
-    mc->numa_mem_supported = true;
     mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->default_ram_id = "mach-virt.ram";
@@ -2375,6 +2374,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
 static void virt_machine_5_0_options(MachineClass *mc)
 {
     virt_machine_5_1_options(mc);
+    mc->numa_mem_supported = true;
 }
 DEFINE_VIRT_MACHINE(5, 0)
 
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 316bc50d75..05be412e59 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -117,6 +117,12 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
     }
 
     if (node->has_mem) {
+        if (!mc->numa_mem_supported) {
+            error_setg(errp, "Parameter -numa node,mem is not supported by this"
+                      " machine type. Use -numa node,memdev instead");
+            return;
+        }
+
         numa_info[nodenr].node_mem = node->mem;
         if (!qtest_enabled()) {
             warn_report("Parameter -numa node,mem is deprecated,"
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2128f3d6fe..a86136069c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1960,7 +1960,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
-    mc->numa_mem_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f66e1d73ce..8955436efa 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -438,6 +438,7 @@ static void pc_i440fx_5_0_machine_options(MachineClass *m)
     pc_i440fx_5_1_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4ba8ac8774..af6b32adb7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -366,6 +366,7 @@ static void pc_q35_5_0_machine_options(MachineClass *m)
 {
     pc_q35_5_1_machine_options(m);
     m->alias = NULL;
+    m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
 }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b1a5ed865..210d61d1b3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4511,7 +4511,6 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
      * in which LMBs are represented and hot-added
      */
     mc->numa_mem_align_shift = 28;
-    mc->numa_mem_supported = true;
     mc->auto_enable_numa = true;
 
     smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
@@ -4599,6 +4598,7 @@ static void spapr_machine_5_0_class_options(MachineClass *mc)
 {
     spapr_machine_5_1_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
+    mc->numa_mem_supported = true;
 }
 
 DEFINE_SPAPR_MACHINE(5_0, "5.0", false);
diff --git a/qemu-options.hx b/qemu-options.hx
index 93bde2bbc8..196f468786 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -239,10 +239,11 @@ SRST
         -numa node,nodeid=0 -numa node,nodeid=1 \
         -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
 
-    '\ ``mem``\ ' assigns a given RAM amount to a node. '\ ``memdev``\ '
-    assigns RAM from a given memory backend device to a node. If
-    '\ ``mem``\ ' and '\ ``memdev``\ ' are omitted in all nodes, RAM is
-    split equally between them.
+    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
+    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
+    a given memory backend device to a node. If '\ ``mem``\ ' and
+    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
+
 
     '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
     Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
-- 
2.26.2


