Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE44B9902
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:13:41 +0100 (CET)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKa2u-0000gZ-Sc
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:13:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuL-0006lE-BC
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:2004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nKZuI-0005nn-Pz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645077887; x=1676613887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DE1c7xAPID2X9rpNoDJhfbDVc5fqEgsgHGq84vRArB4=;
 b=SmMuUKncEac28suPrSV+Jq1SDHbbAd6HDigqhd0uEUznws3Cv9dc4IiO
 bKJkrrZ+2TaoQtfDdD5/+/yj0Mt2NvzjjL0c3O4akbfcUdrgxUrFd4/NT
 sOLIv5lhs0+vz+21Z1uI3iBekm+QBCDqMluBAcslT7VdHCVkcXLBj2oDB
 7clGG+9OF2c6NxmiipRUFZpTQEUaGlRCfSIl8msR3uOckk2k3OwZJd7ad
 41lkgIk03OJqJYJ5tY+MBqmKA+IpsXj9NuLmpEosvp52bC53rTTXJeOGA
 iVtPem7PatKtAXTT6p9zUh34vfp5vZaw8m4zQnEf6nL4Xj6mgs6p8YMdQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234332903"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="234332903"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="634318728"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2022 22:04:36 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] x86: Support XFD and AMX xsave data migration
Date: Wed, 16 Feb 2022 22:04:33 -0800
Message-Id: <20220217060434.52460-8-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217060434.52460-1-yang.zhong@intel.com>
References: <20220217060434.52460-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yang.zhong@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zeng Guang <guang.zeng@intel.com>

XFD(eXtended Feature Disable) allows to enable a
feature on xsave state while preventing specific
user threads from using the feature.

Support save and restore XFD MSRs if CPUID.D.1.EAX[4]
enumerate to be valid. Likewise migrate the MSRs and
related xsave state necessarily.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h     |  9 +++++++++
 target/i386/kvm/kvm.c | 18 ++++++++++++++++++
 target/i386/machine.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index de9da38e42..509c16323a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -505,6 +505,9 @@ typedef enum X86Seg {
 
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
+#define MSR_IA32_XFD                    0x000001c4
+#define MSR_IA32_XFD_ERR                0x000001c5
+
 #define MSR_IA32_BNDCFGS                0x00000d90
 #define MSR_IA32_XSS                    0x00000da0
 #define MSR_IA32_UMWAIT_CONTROL         0xe1
@@ -873,6 +876,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* XFD Extend Feature Disabled */
+#define CPUID_D_1_EAX_XFD               (1U << 4)
 
 /* Packets which contain IP payload have LIP values */
 #define CPUID_14_0_ECX_LIP              (1U << 31)
@@ -1617,6 +1622,10 @@ typedef struct CPUX86State {
     uint64_t msr_rtit_cr3_match;
     uint64_t msr_rtit_addrs[MAX_RTIT_ADDRS];
 
+    /* Per-VCPU XFD MSRs */
+    uint64_t msr_xfd;
+    uint64_t msr_xfd_err;
+
     /* exception/interrupt handling */
     int error_code;
     int exception_is_int;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ff064e3d8f..3dd24b6b0e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3275,6 +3275,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                               env->msr_ia32_sgxlepubkeyhash[3]);
         }
 
+        if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
+            kvm_msr_entry_add(cpu, MSR_IA32_XFD,
+                              env->msr_xfd);
+            kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR,
+                              env->msr_xfd_err);
+        }
+
         /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
          *       kvm_put_msr_feature_control. */
     }
@@ -3667,6 +3674,11 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, MSR_IA32_SGXLEPUBKEYHASH3, 0);
     }
 
+    if (env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD) {
+        kvm_msr_entry_add(cpu, MSR_IA32_XFD, 0);
+        kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -3963,6 +3975,12 @@ static int kvm_get_msrs(X86CPU *cpu)
             env->msr_ia32_sgxlepubkeyhash[index - MSR_IA32_SGXLEPUBKEYHASH0] =
                            msrs[i].data;
             break;
+        case MSR_IA32_XFD:
+            env->msr_xfd = msrs[i].data;
+            break;
+        case MSR_IA32_XFD_ERR:
+            env->msr_xfd_err = msrs[i].data;
+            break;
         }
     }
 
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 6202f47793..1f9d0c46f1 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1483,6 +1483,46 @@ static const VMStateDescription vmstate_pdptrs = {
     }
 };
 
+static bool xfd_msrs_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_XSAVE] & CPUID_D_1_EAX_XFD);
+}
+
+static const VMStateDescription vmstate_msr_xfd = {
+    .name = "cpu/msr_xfd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = xfd_msrs_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.msr_xfd, X86CPU),
+        VMSTATE_UINT64(env.msr_xfd_err, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool amx_xtile_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return !!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE);
+}
+
+static const VMStateDescription vmstate_amx_xtile = {
+    .name = "cpu/intel_amx_xtile",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = amx_xtile_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(env.xtilecfg, X86CPU, 64),
+        VMSTATE_UINT8_ARRAY(env.xtiledata, X86CPU, 8192),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1622,6 +1662,8 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
         &vmstate_pdptrs,
+        &vmstate_msr_xfd,
+        &vmstate_amx_xtile,
         NULL
     }
 };

