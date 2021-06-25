Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D43B4610
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:47:54 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwn7Z-0007oT-7y
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfR-0003jP-Qu
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:49 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfQ-0003Jk-0n
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:49 -0400
Received: by mail-ed1-x52c.google.com with SMTP id df12so13654703edb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGL0PM6rhXFoTSl/VhJ0skxnKohdr8LQl81X8lWdfZU=;
 b=ZMPkjXvAqSEcyrrRYNIEKnA8Tsu9UFYF251+0mJpGKfvui1af6KmzUIAn7UPZpR1L/
 3cKSod5YB6sBie5ccCOiOsTXJix8XqakMjdMMAnenG3WCGchQW4Kh1c9+j4ZP8c2L5Kd
 t1j1eZW3EIsKXYMpWAnvL4i3phrEkRAVLnlMu4elrwvhPcAdTpw7Bs494bgFSwOn7DH8
 mQ+KqW7SgRQx+AlfH8SByFyLUCIt8deJIxms0qxEoq9We8hj+Wx5nDzg0gook9HahgA+
 DQmBYGoqkzuyhUwSEQQ5AqoTefNy1ESiOQgMbZoQbSUnEzqH/WDStqbCvAaMJotQ05DR
 GDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QGL0PM6rhXFoTSl/VhJ0skxnKohdr8LQl81X8lWdfZU=;
 b=Ce5rctstgJYoXWhY/GHgriFqc2st3Yw8CjXj/ZHeiIC7RiDXQSHyGtOFFOOC0e9DPQ
 KvbQCk3X0uHTa1vM9+jUNVIZs9FRYjyAiULxIJdDlvFwwm7AD1J23/K74DxuWqHuueWl
 rQ8mAWpTv+j5xDrYukmXNla6P5f73GKAbbI6MYy2S7mKQlP9tL+OjEvGP3Z8MPgcYGxV
 e4ZyhQMl4ZuAmOZHEAC6eoDon68Hp1buBTvBsX2VgiCchAWlUwMjbh/yxI2+cQXzJF+C
 29HyV6OWjFaT3JyIy2tXKTFLIDCcApAlXAmCme6bFzJU9iDLC3FhxazqbhM2HDOUZls+
 Dn4g==
X-Gm-Message-State: AOAM532A4o9JYu25b7F8y24jW5JcZH6+FaaJk6KHGj4T+Eh6RiOaX4FT
 cFTHvlDa6L4vgpMklPkRJ1tYX1YTcPE=
X-Google-Smtp-Source: ABdhPJxRYnx/MjN2B22rbtW9wooDmNI81PRTQjXEB9DJiAJ5v8c89jydqOJTGLKGbJMFy+mMJksNzg==
X-Received: by 2002:a05:6402:220d:: with SMTP id
 cq13mr14710228edb.214.1624630726582; 
 Fri, 25 Jun 2021 07:18:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] machine: move dies from X86MachineState to CpuTopology
Date: Fri, 25 Jun 2021 16:18:18 +0200
Message-Id: <20210625141822.1368639-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to make SMP configuration a Machine property, we need a getter as
well as a setter.  To simplify the implementation put everything that the
getter needs in the CpuTopology struct.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210617155308.928754-7-pbonzini@redhat.com>
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
index 55b9bc7817..d776c8cf20 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -970,6 +970,7 @@ static void machine_initfn(Object *obj)
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
     ms->smp.cores = 1;
+    ms->smp.dies = 1;
     ms->smp.threads = 1;
     ms->smp.sockets = 1;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c6d8d0d84d..92958e9ad7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -712,8 +712,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 {
-    X86MachineState *x86ms = X86_MACHINE(ms);
-
     if (opts) {
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
@@ -769,7 +767,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
-        x86ms->smp_dies = dies;
+        ms->smp.dies = dies;
     }
 
     if (ms->smp.cpus > 1) {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index d30cf27e29..00448ed55a 100644
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
@@ -1269,7 +1269,6 @@ static void x86_machine_initfn(Object *obj)
 
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
index 25a1f16f01..6e9244a82c 100644
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
2.31.1



