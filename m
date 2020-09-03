Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761A25BFD1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 13:03:59 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDn26-0006WO-7S
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 07:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmv3-0003O2-Og
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:49098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDmv2-0004Zq-1I
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:56:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FCF6B6B3;
 Thu,  3 Sep 2020 10:56:28 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v7 16/16] kvm: remove kvm specific functions from global
 includes
Date: Thu,  3 Sep 2020 12:56:14 +0200
Message-Id: <20200903105614.17772-17-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903105614.17772-1-cfontana@suse.de>
References: <20200903105614.17772-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-cpus.h   |  7 +++++++
 accel/stubs/kvm-stub.c | 22 ----------------------
 include/sysemu/kvm.h   |  7 -------
 3 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index 547fbee111..60c5a554c2 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -14,4 +14,11 @@
 
 extern const CpusAccel kvm_cpus;
 
+int kvm_init_vcpu(CPUState *cpu);
+int kvm_cpu_exec(CPUState *cpu);
+void kvm_destroy_vcpu(CPUState *cpu);
+void kvm_cpu_synchronize_post_reset(CPUState *cpu);
+void kvm_cpu_synchronize_post_init(CPUState *cpu);
+void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
+
 #endif /* KVM_CPUS_H */
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 69f8a842da..680e099463 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -32,15 +32,6 @@ bool kvm_readonly_mem_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
 
-void kvm_destroy_vcpu(CPUState *cpu)
-{
-}
-
-int kvm_init_vcpu(CPUState *cpu)
-{
-    return -ENOSYS;
-}
-
 void kvm_flush_coalesced_mmio_buffer(void)
 {
 }
@@ -49,19 +40,6 @@ void kvm_cpu_synchronize_state(CPUState *cpu)
 {
 }
 
-void kvm_cpu_synchronize_post_reset(CPUState *cpu)
-{
-}
-
-void kvm_cpu_synchronize_post_init(CPUState *cpu)
-{
-}
-
-int kvm_cpu_exec(CPUState *cpu)
-{
-    abort();
-}
-
 bool kvm_has_sync_mmu(void)
 {
     return false;
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index f166aa5260..5de1166a64 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -222,10 +222,6 @@ int kvm_has_many_ioeventfds(void);
 int kvm_has_gsi_routing(void);
 int kvm_has_intx_set_mask(void);
 
-int kvm_init_vcpu(CPUState *cpu);
-int kvm_cpu_exec(CPUState *cpu);
-void kvm_destroy_vcpu(CPUState *cpu);
-
 /**
  * kvm_arm_supports_user_irq
  *
@@ -485,9 +481,6 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
 #endif /* NEED_CPU_H */
 
 void kvm_cpu_synchronize_state(CPUState *cpu);
-void kvm_cpu_synchronize_post_reset(CPUState *cpu);
-void kvm_cpu_synchronize_post_init(CPUState *cpu);
-void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 
 void kvm_init_cpu_signals(CPUState *cpu);
 
-- 
2.26.2


