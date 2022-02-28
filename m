Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA2A4C64DA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:28:53 +0100 (CET)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObOm-0006Z5-Oy
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2E-0008J3-Qf
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:39 -0500
Received: from mga14.intel.com ([192.55.52.115]:50056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nOb2C-0005ZR-Mh
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646035532; x=1677571532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UX6bc6F75Y+jyQEf0pgvwOcIDrka3TrwKDsfRKtcvk=;
 b=ZvOEqqhlKPPeosS25iDhU2sLwAsZx706hJHIJdDR2XJpd/IBR9PNQOID
 62pzgyxTv5LaVwYC+fH6hImlxbp7xJXJQZFGdxpP/McrFP69v1Dt3qEQX
 Wo/y0edlRJho78P3cxYLAHhXS/3HuRKfaJMWCQMxW8BwIJhkCdfH6byNS
 N+UhGKJrq5c6Adgh4XJEKrA1JaPuDKZmjh8t9cuuISD7tK2r2FEw2+dwV
 G/trkdfg/KU3fyFNx4pw6o/X+GqsD9qqh38a1JpXUrDVBdqGdVOXPIgRP
 zy+F6t7eBeDAjETtKRA/C3aXqrCWWibcsi2LlXIL8NLLFN3RSn45VSEzg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="253021650"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="253021650"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 00:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="778014599"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2022 00:05:18 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] x86: Support XFD and AMX xsave data migration
Date: Mon, 28 Feb 2022 00:05:14 -0800
Message-Id: <20220228080515.42357-8-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228080515.42357-1-yang.zhong@intel.com>
References: <20220228080515.42357-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.h     |  9 +++++++++
 target/i386/kvm/kvm.c | 18 ++++++++++++++++++
 target/i386/machine.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8c850e74b8..efea2c78ec 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -507,6 +507,9 @@ typedef enum X86Seg {
 
 #define MSR_VM_HSAVE_PA                 0xc0010117
 
+#define MSR_IA32_XFD                    0x000001c4
+#define MSR_IA32_XFD_ERR                0x000001c5
+
 #define MSR_IA32_BNDCFGS                0x00000d90
 #define MSR_IA32_XSS                    0x00000da0
 #define MSR_IA32_UMWAIT_CONTROL         0xe1
@@ -872,6 +875,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* XFD Extend Feature Disabled */
+#define CPUID_D_1_EAX_XFD               (1U << 4)
 
 /* Packets which contain IP payload have LIP values */
 #define CPUID_14_0_ECX_LIP              (1U << 31)
@@ -1616,6 +1621,10 @@ typedef struct CPUX86State {
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
index e64c06d358..fe8e924846 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3276,6 +3276,13 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
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
@@ -3668,6 +3675,11 @@ static int kvm_get_msrs(X86CPU *cpu)
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
@@ -3964,6 +3976,12 @@ static int kvm_get_msrs(X86CPU *cpu)
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

