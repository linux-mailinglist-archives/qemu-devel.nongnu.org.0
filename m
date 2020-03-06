Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D24217B46E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 03:24:53 +0100 (CET)
Received: from localhost ([::1]:58722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA2ep-0000fj-Tb
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 21:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luwei.kang@intel.com>) id 1jA2cc-0005RE-59
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luwei.kang@intel.com>) id 1jA2ca-0003dm-TV
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:21:54 -0500
Received: from mga05.intel.com ([192.55.52.43]:61181)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luwei.kang@intel.com>)
 id 1jA2ca-0003ak-Ju
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 21:21:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 18:21:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; d="scan'208";a="413742217"
Received: from snr.bj.intel.com ([10.240.193.90])
 by orsmga005.jf.intel.com with ESMTP; 05 Mar 2020 18:21:48 -0800
From: Luwei Kang <luwei.kang@intel.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v1 3/3] i386: Add support for save/load IA32_PEBS_DATA_CFG MSR
Date: Fri,  6 Mar 2020 18:20:05 +0800
Message-Id: <1583490005-27761-4-git-send-email-luwei.kang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583490005-27761-1-git-send-email-luwei.kang@intel.com>
References: <1583490005-27761-1-git-send-email-luwei.kang@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: Luwei Kang <luwei.kang@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for save/load PEBS baseline feature
IA32_PEBS_DATA_CFG MSR.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
---
 target/i386/cpu.h     |  2 ++
 target/i386/kvm.c     | 14 ++++++++++++++
 target/i386/machine.c | 24 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 872a495..a9a7b3f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -413,6 +413,7 @@ typedef enum X86Seg {
 #define MSR_CORE_PERF_GLOBAL_OVF_CTRL   0x390
 
 #define MSR_IA32_PEBS_ENABLE            0x3f1
+#define MSR_IA32_PEBS_DATA_CFG          0x3f2
 #define MSR_IA32_DS_AREA                0x600
 
 #define MSR_MC0_CTL                     0x400
@@ -1449,6 +1450,7 @@ typedef struct CPUX86State {
 
     uint64_t msr_pebs_enable;
     uint64_t msr_ds_area;
+    uint64_t msr_pebs_data_cfg;
 
     uint64_t pat;
     uint32_t smbase;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 1043961..ab4e7bb 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -104,6 +104,7 @@ static bool has_msr_core_capabs;
 static bool has_msr_vmx_vmfunc;
 static bool has_msr_pebs_enable;
 static bool has_msr_ds_area;
+static bool has_msr_pebs_data_cfg;
 
 static uint32_t has_architectural_pmu_version;
 static uint32_t num_architectural_pmu_gp_counters;
@@ -2056,6 +2057,9 @@ static int kvm_get_supported_msrs(KVMState *s)
             case MSR_IA32_DS_AREA:
                 has_msr_ds_area = true;
                 break;
+            case MSR_IA32_PEBS_DATA_CFG:
+                has_msr_pebs_data_cfg = true;
+                break;
             }
         }
     }
@@ -2786,6 +2790,10 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                 kvm_msr_entry_add(cpu, MSR_IA32_DS_AREA,
                                   env->msr_ds_area);
             }
+            if (has_msr_pebs_data_cfg) {
+                kvm_msr_entry_add(cpu, MSR_IA32_PEBS_DATA_CFG,
+                                  env->msr_pebs_data_cfg);
+            }
         }
 
         /*
@@ -3177,6 +3185,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         if (has_msr_ds_area) {
             kvm_msr_entry_add(cpu, MSR_IA32_DS_AREA, 0);
         }
+        if (has_msr_pebs_data_cfg) {
+            kvm_msr_entry_add(cpu, MSR_IA32_PEBS_DATA_CFG, 0);
+        }
     }
 
     if (env->mcg_cap) {
@@ -3431,6 +3442,9 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_DS_AREA:
             env->msr_ds_area = msrs[i].data;
             break;
+        case MSR_IA32_PEBS_DATA_CFG:
+            env->msr_pebs_data_cfg = msrs[i].data;
+            break;
         case HV_X64_MSR_HYPERCALL:
             env->msr_hv_hypercall = msrs[i].data;
             break;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 82a2101..58b786d 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -670,6 +670,29 @@ static const VMStateDescription vmstate_msr_pebs_via_ds = {
     }
 };
 
+static bool pebs_baseline_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    if (env->msr_pebs_data_cfg) {
+        return true;
+    }
+
+    return false;
+}
+
+static const VMStateDescription vmstate_msr_pebs_baseline = {
+    .name = "cpu/msr_pebs_baseline",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pebs_baseline_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.msr_pebs_data_cfg, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool mpx_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -1424,6 +1447,7 @@ VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_ia32_feature_control,
         &vmstate_msr_architectural_pmu,
         &vmstate_msr_pebs_via_ds,
+        &vmstate_msr_pebs_baseline,
         &vmstate_mpx,
         &vmstate_msr_hypercall_hypercall,
         &vmstate_msr_hyperv_vapic,
-- 
1.8.3.1


