Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5516F85D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:32:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puxOw-00080P-Qt; Fri, 05 May 2023 11:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puxG3-0003Ek-LQ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:22:07 -0400
Received: from smtp-8faf.mail.infomaniak.ch ([83.166.143.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puxG0-0003jI-OP
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:22:07 -0400
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QCZDB3g0SzMqb46;
 Fri,  5 May 2023 17:22:02 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QCZD96vnsz1jJ; Fri,  5 May 2023 17:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
 s=20191114; t=1683300122;
 bh=ZzOynGNQaPpNtiJ0zd91Lcwn9zW2+9ulyf1drBQ/Prg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vaA3xKDBfcFF3nZ5ibwAf9TNvpVjn95vBk3M+IQ75Zbj+yeoIWJoXq+IK2rjSvz6J
 Ek6QJhVl0QOgjeidTZl8FeFQNrpxRWC0pFUxavnSrBqF5C1GDY1DYBVA7I141lj7uP
 nCrFgP2JPKXF3ssC9wKq84oe+CDtv4db+Lpg7rcs=
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
Subject: [PATCH v1 5/9] KVM: x86: Add new hypercall to lock control registers
Date: Fri,  5 May 2023 17:20:42 +0200
Message-Id: <20230505152046.6575-6-mic@digikod.net>
In-Reply-To: <20230505152046.6575-1-mic@digikod.net>
References: <20230505152046.6575-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=83.166.143.175; envelope-from=mic@digikod.net;
 helo=smtp-8faf.mail.infomaniak.ch
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This enables guests to lock their CR0 and CR4 registers with a subset of
X86_CR0_WP, X86_CR4_SMEP, X86_CR4_SMAP, X86_CR4_UMIP, X86_CR4_FSGSBASE
and X86_CR4_CET flags.

The new KVM_HC_LOCK_CR_UPDATE hypercall takes two arguments.  The first
is to identify the control register, and the second is a bit mask to
pin (i.e. mark as read-only).

These register flags should already be pinned by Linux guests, but once
compromised, this self-protection mechanism could be disabled, which is
not the case with this dedicated hypercall.

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
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20230505152046.6575-6-mic@digikod.net
---
 Documentation/virt/kvm/x86/hypercalls.rst | 15 +++++
 arch/x86/kernel/cpu/common.c              |  2 +-
 arch/x86/kvm/vmx/vmx.c                    | 10 ++++
 arch/x86/kvm/x86.c                        | 72 +++++++++++++++++++++++
 arch/x86/kvm/x86.h                        | 16 +++++
 include/linux/kvm_host.h                  |  3 +
 include/uapi/linux/kvm_para.h             |  1 +
 7 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/x86/hypercalls.rst b/Documentation/virt/kvm/x86/hypercalls.rst
index 0ec79cc77f53..8aa5d28986e3 100644
--- a/Documentation/virt/kvm/x86/hypercalls.rst
+++ b/Documentation/virt/kvm/x86/hypercalls.rst
@@ -207,3 +207,18 @@ identified with set of physical page ranges (GFNs).  The HEKI_ATTR_MEM_NOWRITE
 memory page range attribute forbids related modification to the guest.
 
 Returns 0 on success or a KVM error code otherwise.
+
+10. KVM_HC_LOCK_CR_UPDATE
+-------------------------
+
+:Architecture: x86
+:Status: active
+:Purpose: Request some control registers to be restricted.
+
+- a0: identify a control register
+- a1: bit mask to make some flags read-only
+
+The hypercall lets a guest request control register flags to be pinned for
+itself.
+
+Returns 0 on success or a KVM error code otherwise.
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f3cc7699e1e1..dd89379fe5ac 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -413,7 +413,7 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
 }
 
 /* These bits should not change their value after CPU init is finished. */
-static const unsigned long cr4_pinned_mask =
+const unsigned long cr4_pinned_mask =
 	X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_UMIP |
 	X86_CR4_FSGSBASE | X86_CR4_CET;
 static DEFINE_STATIC_KEY_FALSE_RO(cr_pinning);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9870db887a62..931688edc8eb 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3162,6 +3162,11 @@ void vmx_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0)
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	unsigned long hw_cr0, old_cr0_pg;
 	u32 tmp;
+	int res;
+
+	res = heki_check_cr(vcpu->kvm, 0, cr0);
+	if (res)
+		return;
 
 	old_cr0_pg = kvm_read_cr0_bits(vcpu, X86_CR0_PG);
 
@@ -3323,6 +3328,11 @@ void vmx_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	 * this bit, even if host CR4.MCE == 0.
 	 */
 	unsigned long hw_cr4;
+	int res;
+
+	res = heki_check_cr(vcpu->kvm, 4, cr4);
+	if (res)
+		return;
 
 	hw_cr4 = (cr4_read_shadow() & X86_CR4_MCE) | (cr4 & ~X86_CR4_MCE);
 	if (is_unrestricted_guest(vcpu))
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ffab64d08de3..a529455359ac 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7927,11 +7927,77 @@ static unsigned long emulator_get_cr(struct x86_emulate_ctxt *ctxt, int cr)
 	return value;
 }
 
+#ifdef CONFIG_HEKI
+
+extern unsigned long cr4_pinned_mask;
+
+static int heki_lock_cr(struct kvm *const kvm, const unsigned long cr,
+			unsigned long pin)
+{
+	if (!pin)
+		return -KVM_EINVAL;
+
+	switch (cr) {
+	case 0:
+		/* Cf. arch/x86/kernel/cpu/common.c */
+		if (!(pin & X86_CR0_WP))
+			return -KVM_EINVAL;
+
+		if ((read_cr0() & pin) != pin)
+			return -KVM_EINVAL;
+
+		atomic_long_or(pin, &kvm->heki_pinned_cr0);
+		return 0;
+	case 4:
+		/* Checks for irrelevant bits. */
+		if ((pin & cr4_pinned_mask) != pin)
+			return -KVM_EINVAL;
+
+		/* Ignores bits not present in host. */
+		pin &= __read_cr4();
+		atomic_long_or(pin, &kvm->heki_pinned_cr4);
+		return 0;
+	}
+	return -KVM_EINVAL;
+}
+
+int heki_check_cr(const struct kvm *const kvm, const unsigned long cr,
+		  const unsigned long val)
+{
+	unsigned long pinned;
+
+	switch (cr) {
+	case 0:
+		pinned = atomic_long_read(&kvm->heki_pinned_cr0);
+		if ((val & pinned) != pinned) {
+			pr_warn_ratelimited(
+				"heki-kvm: Blocked CR0 update: 0x%lx\n", val);
+			return -KVM_EPERM;
+		}
+		return 0;
+	case 4:
+		pinned = atomic_long_read(&kvm->heki_pinned_cr4);
+		if ((val & pinned) != pinned) {
+			pr_warn_ratelimited(
+				"heki-kvm: Blocked CR4 update: 0x%lx\n", val);
+			return -KVM_EPERM;
+		}
+		return 0;
+	}
+	return 0;
+}
+
+#endif /* CONFIG_HEKI */
+
 static int emulator_set_cr(struct x86_emulate_ctxt *ctxt, int cr, ulong val)
 {
 	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
 	int res = 0;
 
+	res = heki_check_cr(vcpu->kvm, cr, val);
+	if (res)
+		return res;
+
 	switch (cr) {
 	case 0:
 		res = kvm_set_cr0(vcpu, mk_cr_64(kvm_read_cr0(vcpu), val));
@@ -9858,6 +9924,12 @@ int kvm_emulate_hypercall(struct kvm_vcpu *vcpu)
 		else
 			ret = heki_lock_mem_page_ranges(vcpu->kvm, a0, a1);
 		break;
+	case KVM_HC_LOCK_CR_UPDATE:
+		if (a0 > U32_MAX)
+			ret = -KVM_EINVAL;
+		else
+			ret = heki_lock_cr(vcpu->kvm, a0, a1);
+		break;
 #endif /* CONFIG_HEKI */
 	default:
 		ret = -KVM_ENOSYS;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 9de72586f406..3e80a60ecbd8 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -276,6 +276,22 @@ static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
 	return !(kvm->arch.disabled_quirks & quirk);
 }
 
+#ifdef CONFIG_HEKI
+
+int heki_check_cr(const struct kvm *kvm, unsigned long cr, unsigned long val);
+
+bool kvm_heki_is_exec_allowed(struct kvm_vcpu *vcpu, gpa_t gpa);
+
+#else /* CONFIG_HEKI */
+
+static inline int heki_check_cr(const struct kvm *const kvm,
+				const unsigned long cr, const unsigned long val)
+{
+	return 0;
+}
+
+#endif /* CONFIG_HEKI */
+
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 39a1bdc2ba42..ab9dc723bc89 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -812,6 +812,9 @@ struct kvm {
 #define HEKI_GFN_MAX 16
 	atomic_t heki_gfn_no_write_num;
 	struct heki_gfn_range heki_gfn_no_write[HEKI_GFN_MAX];
+
+	atomic_long_t heki_pinned_cr0;
+	atomic_long_t heki_pinned_cr4;
 #endif /* CONFIG_HEKI */
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
diff --git a/include/uapi/linux/kvm_para.h b/include/uapi/linux/kvm_para.h
index d7512a10880e..9f68d4ba646b 100644
--- a/include/uapi/linux/kvm_para.h
+++ b/include/uapi/linux/kvm_para.h
@@ -31,6 +31,7 @@
 #define KVM_HC_SCHED_YIELD		11
 #define KVM_HC_MAP_GPA_RANGE		12
 #define KVM_HC_LOCK_MEM_PAGE_RANGES	13
+#define KVM_HC_LOCK_CR_UPDATE		14
 
 /*
  * hypercalls use architecture specific
-- 
2.40.1


