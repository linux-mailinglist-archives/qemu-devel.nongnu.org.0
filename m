Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C266F85DB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:32:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxOx-00083G-6D; Fri, 05 May 2023 11:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puxG1-0003EH-Gk
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:22:06 -0400
Received: from smtp-42ab.mail.infomaniak.ch ([2001:1600:3:17::42ab])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puxFz-0003iu-90
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:22:05 -0400
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QCZD54cDqzMqZgk;
 Fri,  5 May 2023 17:21:57 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QCZD330PNz1j3; Fri,  5 May 2023 17:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
 s=20191114; t=1683300117;
 bh=Sck5/KPfNUhl8VtyERkRdjhXvgnFmYNWT4AHdC4aHDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xy2uQqu3d6UyYIRq1FHdiksjhJdSOrSuJr5w83oL1hRdMuCXet7azQy+AgpzQUfui
 mWmlvk+7HFvNzEiU9UANLTHxNmTdUoA1IlKd2pKbr/FKAIab/IQO57y70uUQT1Y0RN
 NjhO3YHPUfCPweoKfcyI2ayyvi0vzx4JsaOeBc24=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>,
 Liran Alon <liran.alon@oracle.com>,
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH v1 1/9] KVM: x86: Add kvm_x86_ops.fault_gva()
Date: Fri,  5 May 2023 17:20:38 +0200
Message-Id: <20230505152046.6575-2-mic@digikod.net>
In-Reply-To: <20230505152046.6575-1-mic@digikod.net>
References: <20230505152046.6575-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=2001:1600:3:17::42ab;
 envelope-from=mic@digikod.net; helo=smtp-42ab.mail.infomaniak.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 May 2023 11:31:05 -0400
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

This function is needed for kvm_mmu_page_fault() to create synthetic
page faults.

Code originally written by Mihai Donțu and Nicușor Cîțu:
https://lore.kernel.org/r/20211006173113.26445-18-alazar@bitdefender.com
Renamed fault_gla() to fault_gva() and use the new
EPT_VIOLATION_GVA_IS_VALID.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Wanpeng Li <wanpengli@tencent.com>
Co-developed-by: Mihai Donțu <mdontu@bitdefender.com>
Signed-off-by: Mihai Donțu <mdontu@bitdefender.com>
Co-developed-by: Nicușor Cîțu <nicu.citu@icloud.com>
Signed-off-by: Nicușor Cîțu <nicu.citu@icloud.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20230505152046.6575-2-mic@digikod.net
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 ++
 arch/x86/kvm/svm/svm.c             |  9 +++++++++
 arch/x86/kvm/vmx/vmx.c             | 10 ++++++++++
 4 files changed, 22 insertions(+)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index abccd51dcfca..b761182a9444 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -131,6 +131,7 @@ KVM_X86_OP(msr_filter_changed)
 KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
+KVM_X86_OP(fault_gva)
 
 #undef KVM_X86_OP
 #undef KVM_X86_OP_OPTIONAL
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6aaae18f1854..f319bcdeb8bd 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1706,6 +1706,8 @@ struct kvm_x86_ops {
 	 * Returns vCPU specific APICv inhibit reasons
 	 */
 	unsigned long (*vcpu_get_apicv_inhibit_reasons)(struct kvm_vcpu *vcpu);
+
+	u64 (*fault_gva)(struct kvm_vcpu *vcpu);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9a194aa1a75a..8b47b38aaf7f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4700,6 +4700,13 @@ static int svm_vm_init(struct kvm *kvm)
 	return 0;
 }
 
+static u64 svm_fault_gva(struct kvm_vcpu *vcpu)
+{
+	const struct vcpu_svm *svm = to_svm(vcpu);
+
+	return svm->vcpu.arch.cr2 ? svm->vcpu.arch.cr2 : ~0ull;
+}
+
 static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = "kvm_amd",
 
@@ -4826,6 +4833,8 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.vcpu_deliver_sipi_vector = svm_vcpu_deliver_sipi_vector,
 	.vcpu_get_apicv_inhibit_reasons = avic_vcpu_get_apicv_inhibit_reasons,
+
+	.fault_gva = svm_fault_gva,
 };
 
 /*
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 7eec0226d56a..9870db887a62 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8067,6 +8067,14 @@ static void vmx_vm_destroy(struct kvm *kvm)
 	free_pages((unsigned long)kvm_vmx->pid_table, vmx_get_pid_table_order(kvm));
 }
 
+static u64 vmx_fault_gva(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.exit_qualification & EPT_VIOLATION_GVA_IS_VALID)
+		return vmcs_readl(GUEST_LINEAR_ADDRESS);
+
+	return ~0ull;
+}
+
 static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.name = "kvm_intel",
 
@@ -8204,6 +8212,8 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.complete_emulated_msr = kvm_complete_insn_gp,
 
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
+
+	.fault_gva = vmx_fault_gva,
 };
 
 static unsigned int vmx_handle_intel_pt_intr(void)
-- 
2.40.1


