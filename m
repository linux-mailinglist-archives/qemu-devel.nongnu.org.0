Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D917137FB8F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:34:44 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEIN-0002Jm-T7
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED9-0002KQ-R1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED5-0003Tq-Cd
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTq3RNnTC+qZyVHsj9aAv/eM72lcMaCSvJhdqRSdrFU=;
 b=SfwJCCVRIk9zltMVCQXgeoq5i21kjkobMi+tVPGKUL9xSK6/DHCI1lCu1FSEm4qeg7u79F
 TEoJshXRyzVIfurZ5siQRgI1b+9+e6RncFDY/OuJwfA8u89WwhoT2ZVQ55DFuygU/lcn6U
 29sv9+Q+vVko/IHdjhN8oHA4UYeq0VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-7RcoFBsMPEST7ncOymhZGA-1; Thu, 13 May 2021 12:29:12 -0400
X-MC-Unique: 7RcoFBsMPEST7ncOymhZGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530548015F7;
 Thu, 13 May 2021 16:29:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9445687C6;
 Thu, 13 May 2021 16:29:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] machine: move dies from X86MachineState to CpuTopology
Date: Thu, 13 May 2021 12:28:56 -0400
Message-Id: <20210513162901.1310239-10-pbonzini@redhat.com>
In-Reply-To: <20210513162901.1310239-1-pbonzini@redhat.com>
References: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to make SMP configuration a Machine property, we need a getter as
well as a setter.  To simplify the implementation put everything that the
getter needs in the CpuTopology struct.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c     |  1 +
 hw/i386/pc.c          |  4 +---
 hw/i386/x86.c         | 15 +++++++--------
 include/hw/boards.h   |  1 +
 include/hw/i386/pc.h  |  1 -
 include/hw/i386/x86.h |  1 -
 6 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1bf0e687b9..79efae89ce 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -969,6 +969,7 @@ static void machine_initfn(Object *obj)
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
     ms->smp.cores = 1;
+    ms->smp.dies = 1;
     ms->smp.threads = 1;
     ms->smp.sockets = 1;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8cfaf216e7..466e57acbe 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -708,8 +708,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 {
-    X86MachineState *x86ms = X86_MACHINE(ms);
-
     if (opts) {
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -765,7 +763,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
-        x86ms->smp_dies = dies;
+        ms->smp.dies = dies;
     }
 
     if (ms->smp.cpus > 1) {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed796fe6ba..2a99942016 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -64,7 +64,7 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
 {
     MachineState *ms = MACHINE(x86ms);
 
-    topo_info->dies_per_pkg = x86ms->smp_dies;
+    topo_info->dies_per_pkg = ms->smp.dies;
     topo_info->cores_per_die = ms->smp.cores;
     topo_info->threads_per_core = ms->smp.threads;
 }
@@ -293,7 +293,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
 
     init_topo_info(&topo_info, x86ms);
 
-    env->nr_dies = x86ms->smp_dies;
+    env->nr_dies = ms->smp.dies;
 
     /*
      * If APIC ID is not set,
@@ -301,13 +301,13 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
      */
     if (cpu->apic_id == UNASSIGNED_APIC_ID) {
         int max_socket = (ms->smp.max_cpus - 1) /
-                                smp_threads / smp_cores / x86ms->smp_dies;
+                                smp_threads / smp_cores / ms->smp.dies;
 
         /*
          * die-id was optional in QEMU 4.0 and older, so keep it optional
          * if there's only one die per socket.
          */
-        if (cpu->die_id < 0 && x86ms->smp_dies == 1) {
+        if (cpu->die_id < 0 && ms->smp.dies == 1) {
             cpu->die_id = 0;
         }
 
@@ -322,9 +322,9 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         if (cpu->die_id < 0) {
             error_setg(errp, "CPU die-id is not set");
             return;
-        } else if (cpu->die_id > x86ms->smp_dies - 1) {
+        } else if (cpu->die_id > ms->smp.dies - 1) {
             error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
-                       cpu->die_id, x86ms->smp_dies - 1);
+                       cpu->die_id, ms->smp.dies - 1);
             return;
         }
         if (cpu->core_id < 0) {
@@ -477,7 +477,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
                                  &topo_info, &topo_ids);
         ms->possible_cpus->cpus[i].props.has_socket_id = true;
         ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
-        if (x86ms->smp_dies > 1) {
+        if (ms->smp.dies > 1) {
             ms->possible_cpus->cpus[i].props.has_die_id = true;
             ms->possible_cpus->cpus[i].props.die_id = topo_ids.die_id;
         }
@@ -1252,7 +1252,6 @@ static void x86_machine_initfn(Object *obj)
 
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
-    x86ms->smp_dies = 1;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3d55d2bd62..87ae5cc300 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -282,6 +282,7 @@ typedef struct DeviceMemoryState {
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int dies;
     unsigned int cores;
     unsigned int threads;
     unsigned int sockets;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1522a3359a..4c2ca6d36a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -19,7 +19,6 @@
  * PCMachineState:
  * @acpi_dev: link to ACPI PM device that performs ACPI hotplug handling
  * @boot_cpus: number of present VCPUs
- * @smp_dies: number of dies per one package
  */
 typedef struct PCMachineState {
     /*< private >*/
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index c09b648dff..a6ffd94562 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -62,7 +62,6 @@ struct X86MachineState {
     unsigned pci_irq_mask;
     unsigned apic_id_limit;
     uint16_t boot_cpus;
-    unsigned smp_dies;
 
     OnOffAuto smm;
     OnOffAuto acpi;
-- 
2.26.2



