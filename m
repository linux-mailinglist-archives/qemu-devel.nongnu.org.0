Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E15EEE7D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:08:46 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odnex-0008A3-QG
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTZ-0001Wy-5O
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:56:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1odnTW-0001Gt-Jb
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 02:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664434610; x=1695970610;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=uQGTvFkRu2suvO/BBfMCi7VX8taOodq9QWl6FH4+5vk=;
 b=RACXLTX1xRgqkcLdv9RHxqvrM8mW65JWNJsSiP86cLZoKB9WHF+MaM5+
 XjmqWg+J0SbOvIVYqotxP0u9lIoxSSdtfomkBWoMLFgoereJgSax87+p9
 5FOzCdKluSHw+FKCZZaCIqRIWEYGBlde87nGOD6/MF76Hnkdbh3qVSDAT
 OTlzSuk+gc0DpuTDd2mNGtACZvdHl5TQ8+9NJ92s2gWlCcIFSFIdjE0zD
 InJSV0196vpwOlMCeEp8GK9RTvRBKGRhsekdAAZnu5lxywpkkla5etO1r
 VvIdigtYy17NhdOLPQnTmQ8YNkiOLcwLf6rklIJZBYQed1Jrbl3Ksarkl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="282178266"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="282178266"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="711268512"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="711268512"
Received: from chenyi-pc.sh.intel.com ([10.239.159.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 23:56:47 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v8 2/4] kvm: allow target-specific accelerator properties
Date: Thu, 29 Sep 2022 15:03:39 +0800
Message-Id: <20220929070341.4846-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929070341.4846-1-chenyi.qiang@intel.com>
References: <20220929070341.4846-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=chenyi.qiang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Several hypervisor capabilities in KVM are target-specific.  When exposed
to QEMU users as accelerator properties (i.e. -accel kvm,prop=value), they
should not be available for all targets.

Add a hook for targets to add their own properties to -accel kvm, for
now no such property is defined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c    | 2 ++
 include/sysemu/kvm.h   | 2 ++
 target/arm/kvm.c       | 4 ++++
 target/i386/kvm/kvm.c  | 4 ++++
 target/mips/kvm.c      | 4 ++++
 target/ppc/kvm.c       | 4 ++++
 target/riscv/kvm.c     | 4 ++++
 target/s390x/kvm/kvm.c | 4 ++++
 8 files changed, 28 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5acab1767f..f90c5cb285 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3737,6 +3737,8 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "dirty-ring-size",
         "Size of KVM dirty page ring buffer (default: 0, i.e. use bitmap)");
+
+    kvm_arch_accel_class_init(oc);
 }
 
 static const TypeInfo kvm_accel_type = {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index efd6dee818..50868ebf60 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -353,6 +353,8 @@ bool kvm_device_supported(int vmfd, uint64_t type);
 
 extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
 
+void kvm_arch_accel_class_init(ObjectClass *oc);
+
 void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..d21603cf28 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1056,3 +1056,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 3838827134..eab09833f9 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5472,3 +5472,7 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
         mask &= ~BIT_ULL(bit);
     }
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index caf70decd2..bcb8e06b2c 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1294,3 +1294,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 466d0d2f4c..7c25348b7b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2966,3 +2966,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 70b4cff06f..30f21453d6 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -532,3 +532,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6a8dbadf7e..508c24cfec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2581,3 +2581,7 @@ int kvm_s390_get_zpci_op(void)
 {
     return cap_zpci_op;
 }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
-- 
2.17.1


