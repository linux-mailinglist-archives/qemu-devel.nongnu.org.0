Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751E405967
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:44:28 +0200 (CEST)
Received: from localhost ([::1]:46912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLHv-0006jz-Ic
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFf-00041P-0I
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:07 -0400
Received: from mga07.intel.com ([134.134.136.100]:11389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFd-0001Q1-Cb
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284510200"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="284510200"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 07:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696346388"
Received: from lxy-dell.sh.intel.com ([10.239.159.31])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 07:41:59 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH 5/5] target/i386: Access MSR_IA32_RTIT_ADDRn based on
 guest CPUID configuration
Date: Thu,  9 Sep 2021 22:41:50 +0800
Message-Id: <20210909144150.1728418-6-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210909144150.1728418-1-xiaoyao.li@intel.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM only allows userspace to access legal number of MSR_IA32_RTIT_ADDRn,
which is enumrated by guest's CPUID(0x14,0x1):EAX[2:0], i.e.,
env->features[FEAT_14_1_EAX] & INTEL_PT_ADDR_RANGES_NUM_MASK

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c     | 1 -
 target/i386/cpu.h     | 2 ++
 target/i386/kvm/kvm.c | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2b50ccf79b92..5ff70a8cba54 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -545,7 +545,6 @@ static CPUCacheInfo legacy_l3_cache = {
 
 #define INTEL_PT_MAX_SUBLEAF                0x1
 #define INTEL_PT_DEFAULT_ADDR_RANGES_NUM    0x2
-#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
 /* Support ART(0,3,6,9) */
 #define INTEL_PT_DEFAULT_MTC_BITMAP         0x0249
 /* Support 0,2^(0~11) */
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6236c371c4f..20e579f147f8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -873,6 +873,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* Packets which contain IP payload have LIP values */
 #define CPUID_14_0_ECX_LIP                      (1U << 31)
 
+#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
+
 /* CLZERO instruction */
 #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
 /* Always save/restore FP error pointers */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 500d2e0e686f..a90115da9ee5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3088,8 +3088,8 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
             }
         }
         if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
-            int addr_num = kvm_arch_get_supported_cpuid(kvm_state,
-                                                    0x14, 1, R_EAX) & 0x7;
+            int addr_num = env->features[FEAT_14_1_EAX] &
+                           INTEL_PT_ADDR_RANGES_NUM_MASK;
 
             kvm_msr_entry_add(cpu, MSR_IA32_RTIT_CTL,
                             env->msr_rtit_ctrl);
@@ -3433,8 +3433,8 @@ static int kvm_get_msrs(X86CPU *cpu)
     }
 
     if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
-        int addr_num =
-            kvm_arch_get_supported_cpuid(kvm_state, 0x14, 1, R_EAX) & 0x7;
+        int addr_num = env->features[FEAT_14_1_EAX] &
+                       INTEL_PT_ADDR_RANGES_NUM_MASK;
 
         kvm_msr_entry_add(cpu, MSR_IA32_RTIT_CTL, 0);
         kvm_msr_entry_add(cpu, MSR_IA32_RTIT_STATUS, 0);
-- 
2.27.0


