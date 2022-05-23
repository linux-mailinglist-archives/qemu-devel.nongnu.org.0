Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D454D530C67
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:51:28 +0200 (CEST)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4il-0001wK-LG
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1nt4cU-00073H-E5
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:44:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:41124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1nt4cR-0000D5-Vh
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653299096; x=1684835096;
 h=from:to:cc:subject:date:message-id;
 bh=g+69TL0yWtedPp0wWzH3au9MmScHvimfXrzMzJNXrWI=;
 b=HdPx4fJ3d8CwIfPXveZXhtTcFiuwQDOW1PndzIB6NKEa2ZZUfOOEC9Rt
 fgEke0CCzNk01exBGwgf8v4HmOzoal1IfGLM3PqiBXCPNefYr8jaPtgAq
 L0IvgPOcCZPY7NtUmBNBP8DLavvuR3u/RgWdnEmKcrSUFPSkE2DFoj5KB
 Ngcbps9MOAfuJP2eU+SRKn5GqkLP0nIthjhZ1hlA/5ZL/Dh5I5sUlotLo
 0fBLWGtqakBlUbI2CtvWJuhsWjL0GYip+SRc+XjH2Z7gOZfFGeu+Xs2Uk
 +KEErGOtb2teVT0wSNckSW/pCnQIqx5vzDd2jBDX2vP25BMJJgnylKhPQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="271983400"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="271983400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 02:44:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600553709"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.13.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 02:44:49 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Gao Chao <chao.gao@intel.com>,
 Zeng Guang <guang.zeng@intel.com>
Subject: [QEMU PATCH v2] x86: Set maximum APIC ID to KVM prior to vCPU creation
Date: Mon, 23 May 2022 17:12:39 +0800
Message-Id: <20220523091239.7053-1-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.120; envelope-from=guang.zeng@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Specify maximum possible APIC ID assigned for current VM session to KVM
prior to the creation of vCPUs. By this setting, KVM can set up VM-scoped
data structure indexed by the APIC ID, e.g. Posted-Interrupt Descriptor
table to support Intel IPI virtualization, with the most optimal memory
footprint.

It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
capability once KVM has already enabled it. Ignoring the return error
if KVM doesn't support this capability yet.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 hw/i386/x86.c              | 5 +++++
 target/i386/kvm/kvm.c      | 5 +++++
 target/i386/kvm/kvm_i386.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea..a6ab406f85 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -123,6 +123,11 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
                                                       ms->smp.max_cpus - 1) + 1;
+
+    if (kvm_enabled()) {
+        kvm_set_max_apic_id(x86ms->apic_id_limit);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 9cf8e03669..cb2fe39365 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5251,3 +5251,8 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
         mask &= ~BIT_ULL(bit);
     }
 }
+
+void kvm_set_max_apic_id(uint32_t max_apic_id)
+{
+    kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID, 0, max_apic_id);
+}
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 4124912c20..c133b32a58 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -54,4 +54,5 @@ uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 bool kvm_enable_sgx_provisioning(KVMState *s);
 void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
 
+void kvm_set_max_apic_id(uint32_t max_apic_id);
 #endif
-- 
2.27.0


