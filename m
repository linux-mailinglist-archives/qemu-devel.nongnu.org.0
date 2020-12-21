Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAFD2DFB99
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:37:54 +0100 (CET)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJVh-0006tK-4d
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJUW-0006Q7-UE
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:36:40 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1krJUP-0007wY-Kp
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:36:38 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Czy8J6z05z15grZ;
 Mon, 21 Dec 2020 19:35:44 +0800 (CST)
Received: from [10.174.186.6] (10.174.186.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0;
 Mon, 21 Dec 2020 19:36:19 +0800
To: "S. Tsirkin, Michael" <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, <richard.henderson@linaro.org>,
 "Eduardo Habkost" <ehabkost@redhat.com>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: [RFC PATCH v2] x86/cpu: initialize the CPU concurrently
Message-ID: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
Date: Mon, 21 Dec 2020 19:36:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yezhenyu2@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: yebiaoxiang <yebiaoxiang@huawei.com>, yezhenyu2@huawei.com,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Providing a optional mechanism to wait for all VCPU threads be
created out of qemu_init_vcpu(), then we can initialize the cpu
concurrently on the x86 architecture.

This reduces the time of creating virtual machines. For example, when
the haxm is used as the accelerator, cpus_accel->create_vcpu_thread()
will cause at least 200ms for each cpu, extremely prolong the boot
time.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: eillon <yezhenyu2@huawei.com>
---
 hw/i386/x86.c         |  3 +++
 include/hw/core/cpu.h | 13 +++++++++++++
 softmmu/cpus.c        | 21 +++++++++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef9..09afff724a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -108,6 +108,8 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
+
+    CPU(cpu)->async_init = true;
     qdev_realize(DEVICE(cpu), NULL, errp);

 out:
@@ -137,6 +139,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
     }
+    qemu_wait_all_vcpu_threads_init();
 }

 void x86_rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count)
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8e7552910d..55c2c17d93 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -467,6 +467,12 @@ struct CPUState {

     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
+
+    /*
+     * If true, qemu_init_vcpu() will not wait for the VCPU thread to be created
+     * before returning.
+     */
+    bool async_init;
 };

 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
@@ -977,6 +983,13 @@ void start_exclusive(void);
  */
 void end_exclusive(void);

+/**
+ * qemu_wait_all_vcpu_threads_init:
+ *
+ * Wait for all VCPU threads to be created.
+ */
+void qemu_wait_all_vcpu_threads_init(void);
+
 /**
  * qemu_init_vcpu:
  * @cpu: The vCPU to initialize.
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1dc20b9dc3..d76853d356 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -601,6 +601,23 @@ void cpus_register_accel(const CpusAccel *ca)
     cpus_accel = ca;
 }

+static void qemu_wait_vcpu_thread_init(CPUState *cpu)
+{
+    while (!cpu->created) {
+        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+    }
+}
+
+void qemu_wait_all_vcpu_threads_init(void)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        printf("***** cpuid: %d\n", cpu->cpu_index);
+        qemu_wait_vcpu_thread_init(cpu);
+    }
+}
+
 void qemu_init_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -622,8 +639,8 @@ void qemu_init_vcpu(CPUState *cpu)
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
     cpus_accel->create_vcpu_thread(cpu);

-    while (!cpu->created) {
-        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
+    if (!cpu->async_init) {
+        qemu_wait_vcpu_thread_init(cpu);
     }
 }

-- 
2.22.0.windows.1


