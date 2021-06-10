Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932A3A2D4E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:43:17 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKxo-0000o3-2y
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqf-0001gK-7z
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqY-0005fp-MW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q5so2372433wrm.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFaVv/jz4lgF0mz802si5sGlUrBseoogQ4/SE+k7/4A=;
 b=uWd4xdQyCWr6eTrC4qnK2dR+CCCkNTdmoTaptY/2TL3nMNfMS5clQpIU2LPdblFACw
 ynpGdPkVwHsgD7ESHpQVD6qMXk7GXxA/qd9h6LhEG/bRIWZ3zle6aS2EZBv90n1s6z5o
 ls6fimIZV0W8OmWHlIhqWsC07Inlk45Bw1TZFmItpeKFRIynBxGpkfxetuwb8d2wpRxw
 WcFH72xvKx5cVa8h4SmCNpdameGD5IiXdZqrvAIkJO7xvKfCTLqeEHlPHjDqXw9o2Xrc
 qDJSg0W8gaHmXZThp2K/dzVRZGTXnZEu2TwTnhXdJr64szxGgCWlt5wgWj5rAn5cNpwE
 lJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TFaVv/jz4lgF0mz802si5sGlUrBseoogQ4/SE+k7/4A=;
 b=ToPvWTRvX2VuvSkv0uEJD5USY3eE6hWIYPs01B3J0xdy9ajgZ4sgFn13GRUeo6NoiU
 xzxN7fe25EGqSCZVdb5NVwpBwkEVTAUCSferk8w8s8z617B42/AD2zHKu8YQl8C8R/gT
 vkigy0ZUAAoUwp76Cz80tcn6Isf/KIZw8c1K8QNornWW0S6+Zvzp1s2UahelA/1hkg44
 nvCl5tJdJLmCdRMeEgtXnJuqRKz2+kufbt5WHL/t081wMHuRD4Bnx41faMqFHRflcIrQ
 BLwobQzv1WyCzSwydQc+4EWo59FTJtxBow/mRzVJExUbenw0nfMYw/uKGYMpXJnJarWL
 1GGw==
X-Gm-Message-State: AOAM532sIE2f2h7IGGH8cTaMRGTT7JUIJRpwvmiN2hiS+HMd+iGTq1al
 cP/N3q/Dz0IGg843CpuQ1aCZt0stjuNNVA==
X-Google-Smtp-Source: ABdhPJzD02IH73A/RArb90amZD3+BBa65pE4aw+5xxQZsDyaHUTCZj4qHAPsZitoqGqpgmw+u5jMgQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr5632868wrs.298.1623332145391; 
 Thu, 10 Jun 2021 06:35:45 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] machine: move dies from X86MachineState to CpuTopology
Date: Thu, 10 Jun 2021 15:35:33 +0200
Message-Id: <20210610133538.608390-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: berrange@redhat.com, armbru@redhat.com
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
2.31.1



