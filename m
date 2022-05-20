Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572E52E640
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 09:28:28 +0200 (CEST)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrx3j-0002sJ-Lp
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 03:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1nrwna-0001hh-Nt
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:8077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1nrwnY-0002pv-CH
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653030704; x=1684566704;
 h=from:to:cc:subject:date:message-id;
 bh=uf7bQKdvNgjIJ75NdNzkRfUPgeKm6dafbA5aTQIT7TA=;
 b=K5Pks6gxoQlWLTjuj0OZiYRZ5XK6uXTVBRV3d2Na+1QT6P0zAyyNkrkv
 PMQm9onMd7ISCValCmLIlxFFwxAL2bs76ZFRQbfWnConj7fqZ5TXr24Q9
 6vEZef0FSFX4cL0sX0Gr7dob9WhCQn+u4L/CBJ7zkIWMFv/SY/xy80Pt8
 bvJy6PP12aC1ab3np8OjH6osgj7yOvOtSJi8PnjhIrbQnELfx+s1nyQut
 GrJd6aCcBQRHKwtRQX3fNKh/BcDpMGFGaST/os7+wKUf8c/rf0q5IyFFd
 ey/976ef4YKUDFSy8oPLlV6Urf8sjWl18ZUccPzKroO1SOOh+QmpZdOBe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="358923642"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="358923642"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 00:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="599062888"
Received: from arthur-vostro-3668.sh.intel.com ([10.239.13.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 00:11:32 -0700
From: Zeng Guang <guang.zeng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, Gao Chao <chao.gao@intel.com>,
 Zeng Guang <guang.zeng@intel.com>
Subject: [QEMU PATCH] x86: Set maximum APIC ID to KVM prior to vCPU creation
Date: Fri, 20 May 2022 14:39:28 +0800
Message-Id: <20220520063928.23645-1-guang.zeng@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.43; envelope-from=guang.zeng@intel.com;
 helo=mga05.intel.com
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

Specify maximum possible APIC ID assigned for current VM session prior to
the creation of vCPUs. KVM need set up VM-scoped data structure indexed by
the APIC ID, e.g. Posted-Interrupt Descriptor table to support Intel IPI
virtualization.

It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
capability once KVM has already enabled it. Otherwise, simply prompts
that KVM doesn't support this capability yet.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 hw/i386/x86.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea..ff74492325 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -106,7 +106,7 @@ out:
 
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 {
-    int i;
+    int i, ret;
     const CPUArchIdList *possible_cpus;
     MachineState *ms = MACHINE(x86ms);
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
@@ -123,6 +123,13 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
                                                       ms->smp.max_cpus - 1) + 1;
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID,
+                            0, x86ms->apic_id_limit);
+    if (ret < 0) {
+        error_report("kvm: Set max vcpu id not supported: %s", strerror(-ret));
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
-- 
2.27.0


