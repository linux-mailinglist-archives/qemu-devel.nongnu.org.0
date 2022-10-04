Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7085F4C57
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 01:04:12 +0200 (CEST)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofqxP-00089B-Gm
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 19:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1ofqqR-00039B-6V
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:57:02 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51102 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1ofqqO-0000HM-Je
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 18:56:57 -0400
Received: from localhost.localdomain
 (dynamic-095-117-005-115.95.117.pool.telefonica.de [95.117.5.115])
 by csgraf.de (Postfix) with ESMTPSA id 8AB776080FDE;
 Wed,  5 Oct 2022 00:56:47 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH 3/3] KVM: x86: Implement MSR_CORE_THREAD_COUNT MSR
Date: Wed,  5 Oct 2022 00:56:43 +0200
Message-Id: <20221004225643.65036-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
In-Reply-To: <20221004225643.65036-1-agraf@csgraf.de>
References: <20221004225643.65036-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MSR_CORE_THREAD_COUNT MSR describes CPU package topology, such as number
of threads and cores for a given package. This is information that QEMU has
readily available and can provide through the new user space MSR deflection
interface.

This patch propagates the existing hvf logic from patch 027ac0cb516
("target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT") to KVM.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/i386/kvm/kvm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ea53092dd0..791e995389 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2403,6 +2403,17 @@ static int kvm_get_supported_msrs(KVMState *s)
     return ret;
 }
 
+static bool kvm_rdmsr_core_thread_count(X86CPU *cpu, uint32_t msr,
+                                        uint64_t *val)
+{
+    CPUState *cs = CPU(cpu);
+
+    *val = cs->nr_threads * cs->nr_cores; /* thread count, bits 15..0 */
+    *val |= ((uint32_t)cs->nr_cores << 16); /* core count, bits 31..16 */
+
+    return true;
+}
+
 static Notifier smram_machine_done;
 static KVMMemoryListener smram_listener;
 static AddressSpace smram_address_space;
@@ -2591,6 +2602,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+        bool r;
+
         ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,
                                 KVM_MSR_EXIT_REASON_FILTER);
         if (ret) {
@@ -2598,6 +2611,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
                          strerror(-ret));
             exit(1);
         }
+
+        r = kvm_filter_msr(s, MSR_CORE_THREAD_COUNT,
+                           kvm_rdmsr_core_thread_count, NULL);
+        if (!r) {
+            error_report("Could not install MSR_CORE_THREAD_COUNT handler: %s",
+                         strerror(-ret));
+            exit(1);
+        }
     }
 
     return 0;
-- 
2.37.0 (Apple Git-136)


