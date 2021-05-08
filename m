Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75337376FE3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 07:55:11 +0200 (CEST)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfFvi-0003Qo-JT
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 01:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lfFuc-00024P-4t
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:54:02 -0400
Received: from mga18.intel.com ([134.134.136.126]:46725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <like.xu@linux.intel.com>)
 id 1lfFuX-0004pl-PM
 for qemu-devel@nongnu.org; Sat, 08 May 2021 01:54:01 -0400
IronPort-SDR: ThJLIgX2Usr1mmFOHp8lXbfc9AVuZguBCOhE+Ito8WA7GArCkvGMXSQ2hNRmMQ85i9Nax7bKRh
 v7aOOkLDRuVg==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="186322598"
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="186322598"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 22:53:47 -0700
IronPort-SDR: vVelElTdnM3bN41kqDDjd6LPFw07n9vLjXblRfZmwyjL8beM+gddm7nnZQNaJ6akqyS1bJ1Tsj
 tqEs90OLN7PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,282,1613462400"; d="scan'208";a="466375873"
Received: from clx-ap-likexu.sh.intel.com ([10.239.48.108])
 by fmsmga002.fm.intel.com with ESMTP; 07 May 2021 22:53:45 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v3 2/2] target/i386: add "-cpu,
 lbr-fmt=*" support to enable guest LBR
Date: Sat,  8 May 2021 13:52:59 +0800
Message-Id: <20210508055259.128025-2-like.xu@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508055259.128025-1-like.xu@linux.intel.com>
References: <20210508055259.128025-1-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=like.xu@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9=3F?= <berrange@redhat.com>,
 Like Xu <like.xu@linux.intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, weijiang.yang@intel.com,
 wei.w.wang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last branch recording (LBR) is a performance monitor unit (PMU)
feature on Intel processors that records a running trace of the most
recent branches taken by the processor in the LBR stack. The QEMU
could configure whether it's enabled or not for each guest via CLI.

The LBR feature would be enabled on the guest if:
- the KVM is enabled and the PMU is enabled and,
- the msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM and,
- the supported returned value for lbr_fmt from this msr is not zero and,
- the requested guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM,
- the user-provided lbr-fmt value should not violate its bitmask (0x3f)
  and it should be the same as the host lbr_fmt value or just use the
  QEMU option "-cpu host,migratable=no" to enable guest LBR.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
v2-v3 Changelog:
- Add a new generic property macro to validate its bitmask;
- Differentiate "lbr-fmt=0" from "lbr-fmt not set";
- Do what the user asked for whenever possible;
- Treat mismatch or violatation as an error rather than warning;

Testcases for a lbr-fmt=5 host:

 "-cpu host" --> "Disable LBR"
 "-cpu host,lbr-fmt=0" --> "Disable LBR"
 "-cpu host,lbr-fmt=5" --> "Enable LBR"
 "-cpu host,lbr-fmt=6" --> "Error out, lbr mismatch"
 "-cpu host,lbr-fmt=0xff" --> "Error out, bitmask violatation"
 "-cpu host,migratable=no" --> "Enable LBR"
 "-cpu host,migratable=no,lbr-fmt=0" --> "Disable LBR"
 "-cpu host,migratable=no,lbr-fmt=5" --> "Enable LBR"
 "-cpu host,migratable=no,lbr-fmt=6" --> "Error out, lbr mismatch"
 "-cpu host,migratable=no,lbr-fmt=0xff" --> "Error out, bitmask violatation"

 target/i386/cpu.c | 39 +++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h | 10 ++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..d03306179a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6748,6 +6748,41 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         goto out;
     }
 
+    /*
+     * Override env->features[FEAT_PERF_CAPABILITIES]
+     * with explicit user-provided settings.
+     */
+    if (cpu->lbr_fmt != ~PERF_CAP_LBR_FMT) {
+        if ((cpu->lbr_fmt & PERF_CAP_LBR_FMT) != cpu->lbr_fmt) {
+            error_setg(errp, "invalid lbr-fmt");
+            return;
+        }
+        env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
+        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
+    }
+
+    /*
+     * We can always validate env->features[FEAT_PERF_CAPABILITIES],
+     * no matter how it was initialized:
+     */
+    uint64_t requested_lbr_fmt =
+        env->features[FEAT_PERF_CAPABILITIES] & PERF_CAP_LBR_FMT;
+    if (requested_lbr_fmt && kvm_enabled()) {
+        uint64_t host_perf_cap =
+            x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
+        uint64_t host_lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;
+        if (!cpu->enable_pmu) {
+            error_setg(errp, "vPMU: LBR is unsupported without pmu=on");
+            return;
+        }
+        if (requested_lbr_fmt != host_lbr_fmt) {
+            error_setg(errp, "vPMU: the lbr-fmt value (0x%lx) mismatches "
+                        "the host supported value (0x%lx).",
+                        requested_lbr_fmt, host_lbr_fmt);
+            return;
+        }
+    }
+
     x86_cpu_filter_features(cpu, cpu->check_cpuid || cpu->enforce_cpuid);
 
     if (cpu->enforce_cpuid && x86_cpu_have_filtered_features(cpu)) {
@@ -7150,6 +7185,9 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
+    cpu->lbr_fmt = ~PERF_CAP_LBR_FMT;
+    object_property_add_alias(obj, "lbr_fmt", obj, "lbr-fmt");
+
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
@@ -7300,6 +7338,7 @@ static Property x86_cpu_properties[] = {
 #endif
     DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
     DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
+    DEFINE_PROP_BITMASK_UINT64("lbr-fmt", X86CPU, lbr_fmt, PERF_CAP_LBR_FMT),
 
     DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
                        HYPERV_SPINLOCK_NEVER_NOTIFY),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1bc300ce85..bab394e18e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -354,6 +354,7 @@ typedef enum X86Seg {
 #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
 
 #define MSR_IA32_PERF_CAPABILITIES      0x345
+#define PERF_CAP_LBR_FMT                0x3f
 
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
@@ -1726,6 +1727,15 @@ struct X86CPU {
      */
     bool enable_pmu;
 
+    /*
+     * Configure LBR_FMT bits on IA32_PERF_CAPABILITIES MSR.
+     * This can't be enabled by default yet because it doesn't have
+     * ABI stability guarantees, as it is only allowed to pass all
+     * LBR_FMT bits returned by kvm_arch_get_supported_msr_feature()
+     * (that depends on host CPU and kernel capabilities) to the guest.
+     */
+    uint64_t lbr_fmt;
+
     /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
      * disabled by default to avoid breaking migration between QEMU with
      * different LMCE configurations.
-- 
2.30.2


