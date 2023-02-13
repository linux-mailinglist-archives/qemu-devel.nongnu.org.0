Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C956941B5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOi-0007da-Kv; Mon, 13 Feb 2023 04:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVO5-0007NW-01
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:41 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNz-0002n2-HU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281475; x=1707817475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12oXbKVm5hTOe5GoCs7pCpjNaSnJB23+o68haUtdI9w=;
 b=S+wSlaTCdche25H23zwS9FsbOryXpwp8UoqDqLIbNsILIy0mpKPqhyFH
 LJ3X4fk+onYMMM/vjV4sn/co8bpHOhMgd2j3YtAG8PoCptPcl/xP99spH
 DXkrFNCor1XSLa3h2UZUOC2c/sy5YgqnxSyRRwl91Ry28MQ30g0hK4sCv
 g+VlnF4c99QaJdSjz75kCAclvuLTEub+UDLj9C3xbZseJqKoeExxgDTqI
 jxhtPApAxljJZyJQkaKPfxJIyDse3KRGXq9tWywuIOWAW0uMc/eOHhkNr
 sV8/inX8ZIQgG1OofoSMrWMgWmvt+Td+/B6C3rytW2igjd2QfWdnu4JUR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486661"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486661"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760215"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760215"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:15 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC 20/52] s390x: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:03 +0800
Message-Id: <20230213095035.158240-21-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

When MachineState.topo is introduced, the topology related structures
become complicated. So we wrapped the access to topology fields of
MachineState.topo into some helpers, and we are using these helpers
to replace the use of MachineState.smp.

In hw/s390x/s390-virtio-ccw.c, s390_init_cpus() needs "threads per core".
Before s390x supports hybrid, here we use smp-specific interface to get
"threads per core".

For other cases, it's straightforward to replace topology access with
wrapped generic interfaces.

Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Eric Farman <farman@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/s390x/s390-virtio-ccw.c     |  6 +++---
 hw/s390x/sclp.c                |  3 ++-
 target/s390x/cpu-sysemu.c      |  2 +-
 target/s390x/kvm/kvm.c         | 15 +++++++++------
 target/s390x/tcg/excp_helper.c |  2 +-
 5 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f22f61b8b6ac..9b5020a0d395 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -88,7 +88,7 @@ static void s390_init_cpus(MachineState *machine)
     S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
     int i;
 
-    if (machine->smp.threads > s390mc->max_threads) {
+    if (machine_topo_get_smp_threads(machine) > s390mc->max_threads) {
         error_report("S390 does not support more than %d threads.",
                      s390mc->max_threads);
         exit(1);
@@ -97,7 +97,7 @@ static void s390_init_cpus(MachineState *machine)
     /* initialize possible_cpus */
     mc->possible_cpu_arch_ids(machine);
 
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(machine); i++) {
         s390x_new_cpu(machine->cpu_type, i, &error_fatal);
     }
 }
@@ -540,7 +540,7 @@ static CpuInstanceProperties s390_cpu_index_to_props(MachineState *ms,
 static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
 
     if (ms->possible_cpus) {
         g_assert(ms->possible_cpus && ms->possible_cpus->len == max_cpus);
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index eff74479f458..2aef1a57a591 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -127,7 +127,8 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
     prepare_cpu_entries(machine, entries_start, &cpu_count);
     read_info->entries_cpu = cpu_to_be16(cpu_count);
     read_info->offset_cpu = cpu_to_be16(offset_cpu);
-    read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);
+    read_info->highest_cpu =
+        cpu_to_be16(machine_topo_get_max_cpus(machine) - 1);
 
     read_info->ibc_val = cpu_to_be32(s390_get_ibc_val());
 
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
index 948e4bd3e09e..617f23b39913 100644
--- a/target/s390x/cpu-sysemu.c
+++ b/target/s390x/cpu-sysemu.c
@@ -125,7 +125,7 @@ bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
 {
     S390CPU *cpu = S390_CPU(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
 
     if (cpu->env.core_id >= max_cpus) {
         error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 3ac7ec9acf4e..d297daed1117 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -406,9 +406,11 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
 
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
+    unsigned int max_cpus;
     S390CPU *cpu = S390_CPU(cs);
+
     kvm_s390_set_cpu_state(cpu, cpu->env.cpu_state);
+    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
     cpu->irqstate = g_malloc0(VCPU_IRQ_BUF_SIZE(max_cpus));
     return 0;
 }
@@ -2097,14 +2099,15 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
 
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
 {
-    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
-    struct kvm_s390_irq_state irq_state = {
-        .buf = (uint64_t) cpu->irqstate,
-        .len = VCPU_IRQ_BUF_SIZE(max_cpus),
-    };
+    unsigned int max_cpus;
+    struct kvm_s390_irq_state irq_state;
     CPUState *cs = CPU(cpu);
     int32_t bytes;
 
+    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
+    irq_state.buf = (uint64_t) cpu->irqstate;
+    irq_state.len = VCPU_IRQ_BUF_SIZE(max_cpus);
+
     if (!kvm_check_extension(kvm_state, KVM_CAP_S390_IRQ_STATE)) {
         return;
     }
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index bc767f044381..e396a89d5540 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -321,7 +321,7 @@ static void do_ext_interrupt(CPUS390XState *env)
     if ((env->pending_int & INTERRUPT_EMERGENCY_SIGNAL) &&
         (env->cregs[0] & CR0_EMERGENCY_SIGNAL_SC)) {
         MachineState *ms = MACHINE(qdev_get_machine());
-        unsigned int max_cpus = ms->smp.max_cpus;
+        unsigned int max_cpus = machine_topo_get_max_cpus(ms);
 
         lowcore->ext_int_code = cpu_to_be16(EXT_EMERGENCY);
         cpu_addr = find_first_bit(env->emergency_signals, S390_MAX_CPUS);
-- 
2.34.1


