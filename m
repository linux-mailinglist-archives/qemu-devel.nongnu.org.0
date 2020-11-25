Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779A2C3F61
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 12:56:03 +0100 (CET)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khtP0-0002yw-0U
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 06:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1khtNx-0002YF-0u
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 06:54:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1khtNu-00015z-16
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 06:54:56 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cgznb0tj2zkfkh;
 Wed, 25 Nov 2020 19:54:11 +0800 (CST)
Received: from [10.174.186.190] (10.174.186.190) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 19:54:29 +0800
From: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: [RFC PATCH v1] x86/cpu: initialize the CPU concurrently
To: "S. Tsirkin, Michael" <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, <richard.henderson@linaro.org>,
 <ehabkost@redhat.com>
Message-ID: <26a765fb-dae1-db33-a406-cef79d5c1d58@huawei.com>
Date: Wed, 25 Nov 2020 19:54:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.190]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yezhenyu2@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yebiaoxiang <yebiaoxiang@huawei.com>, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>, yezhenyu2@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 0b4318c9dbf6fa152ec14eab29837ea06e2d78e5 Mon Sep 17 00:00:00 2001
From: eillon <yezhenyu2@huawei.com>
Date: Wed, 25 Nov 2020 19:17:03 +0800
Subject: [PATCH] x86/cpu: initialize the CPU concurrently

Currently we initialize cpu one by one in qemu_init_vcpu(), every cpu
should have to wait util cpu->created = true.  When cpus_accel->create_vcpu_thread
costs too long time or the number of CPUs is too large, this will prolong
the boot time.

This patch initializes the CPU concurrently.

Signed-off-by: eillon <yezhenyu2@huawei.com>
---
 hw/i386/x86.c         | 7 +++++--
 include/hw/core/cpu.h | 3 +++
 include/hw/i386/x86.h | 3 ++-
 softmmu/cpus.c        | 9 +++++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 5944fc44ed..a98f68b220 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -101,9 +101,11 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 }


-void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
+void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
+                 bool last_cpu, Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
+    ((CPUState *)cpu)->last_cpu = last_cpu;

     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
@@ -135,7 +137,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
                                                       ms->smp.max_cpus - 1) + 1;
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
+        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                    i == ms->smp.cpus - 1, &error_fatal);
     }
 }

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3d92c967ff..b7e05e2d58 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -467,6 +467,9 @@ struct CPUState {

     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
+
+    /* The last cpu to init. */
+    bool last_cpu;
 };

 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 739fac5087..0f7a6e5d16 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -84,7 +84,8 @@ void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);

-void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, Error **errp);
+void x86_cpu_new(X86MachineState *pcms, int64_t apic_id,
+                 bool last_cpu, Error **errp);
 void x86_cpus_init(X86MachineState *pcms, int default_cpu_version);
 CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
                                              unsigned cpu_index);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e46ac68ad0..5a8eae28ab 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -621,8 +621,13 @@ void qemu_init_vcpu(CPUState *cpu)
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
     cpus_accel->create_vcpu_thread(cpu);

-    while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+    if (cpu->last_cpu) {
+        CPUState *cs = first_cpu;
+        CPU_FOREACH(cs) {
+            while (!cs->created) {
+                qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+            }
+        }
     }
 }

-- 
2.22.0.windows.1


