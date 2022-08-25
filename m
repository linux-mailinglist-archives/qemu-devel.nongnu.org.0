Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8DC5A079C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:27:15 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3WU-0001oc-JS
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1oR3VR-00085q-4E
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:26:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:1877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1oR3VN-00076v-5p
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661397965; x=1692933965;
 h=from:to:cc:subject:date:message-id;
 bh=QfU5n0LNLrsAsHbr2o9JAswWSZVSgNUI7m3XVlMIrJw=;
 b=Bjuuxq8C5K9IQpDuuS/T2RAqt+uI5kdi4jdxuF+UVJ6jOoWsR0scvl2O
 QaPWV46yOcbuSAeKhoWV46Le/FBawR78XExo6MHvaom6GsJ6zoII2pAQo
 +xYmokyBkmyoot/IQc+TB8OcX52C8/sFtSBqa2D+cYrcxbVGrVMHt1x82
 jWbELqdjK6Tlotv4aj0LYVbJSSox9+RcJHkKcrTnB/AG4YkT9skJCgahf
 Niywr9WJH33ayuplVfDr3VVZJr2RHat5uslvqw/WvXvmAjrbyIOlW2yvl
 PUmbi1RT+jN8hqj5z9wYZ472nWTk1/FPlvP8jghNhyypg4TxWTL9W43Bj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="380425950"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="380425950"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 20:26:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="670792058"
Received: from arthur-vostro-3668.sh.intel.com ([10.238.200.53])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 20:25:50 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Gao Chao <chao.gao@intel.com>,
 Zeng Guang <guang.zeng@intel.com>
Subject: [PATCH v3] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Date: Thu, 25 Aug 2022 10:52:46 +0800
Message-Id: <20220825025246.26618-1-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.43; envelope-from=guang.zeng@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
pointer table to support Intel IPI virtualization, with the most optimal
memory footprint.

It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
capability once KVM has enabled it. Ignoring the return error if KVM
doesn't support this capability yet.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 hw/i386/x86.c              | 4 ++++
 target/i386/kvm/kvm-stub.c | 5 +++++
 target/i386/kvm/kvm.c      | 5 +++++
 target/i386/kvm/kvm_i386.h | 1 +
 4 files changed, 15 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 050eedc0c8..4831193c86 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -139,6 +139,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
         exit(EXIT_FAILURE);
     }
 
+    if (kvm_enabled()) {
+        kvm_set_max_apic_id(x86ms->apic_id_limit);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
index f6e7e4466e..e052f1c7b0 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -44,3 +44,8 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
 {
     abort();
 }
+
+void kvm_set_max_apic_id(uint32_t max_apic_id)
+{
+    return;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52f..af4ef1e8f0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5428,3 +5428,8 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
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


