Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6213BF33D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:04:36 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ISx-0000Nl-H1
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0001zD-82
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0007Kq-OC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="270534894"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="270534894"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770024"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:54 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 11/44] i386/tdx: Implement user specified tsc frequency
Date: Wed,  7 Jul 2021 17:54:41 -0700
Message-Id: <564e6ae089c30aaba9443294ecca72da9ee7b7c4.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Reuse -cpu,tsc-frequency= to get user wanted tsc frequency and pass it
to KVM_TDX_INIT_VM.

Besides, sanity check the tsc frequency to be in the legal range and
legal granularity (required by SEAM module).

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c |  8 ++++++++
 target/i386/kvm/tdx.c | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ecb1714920..be0b96b120 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -763,6 +763,14 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
     int r, cur_freq;
     bool set_ioctl = false;
 
+    /*
+     * TD guest's TSC is immutable, it cannot be set/changed via
+     * KVM_SET_TSC_KHZ, but only be initialized via KVM_TDX_INIT_VM
+     */
+    if (vm_type == KVM_X86_TDX_VM) {
+        return 0;
+    }
+
     if (!env->tsc_khz) {
         return 0;
     }
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index e8c70f241d..c50a0dcf11 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -29,6 +29,8 @@
 
 #define TDX1_TD_ATTRIBUTE_DEBUG BIT_ULL(0)
 #define TDX1_TD_ATTRIBUTE_PERFMON BIT_ULL(63)
+#define TDX1_MIN_TSC_FREQUENCY_KHZ (100 * 1000)
+#define TDX1_MAX_TSC_FREQUENCY_KHZ (10 * 1000 * 1000)
 
 bool kvm_has_tdx(KVMState *s)
 {
@@ -91,6 +93,19 @@ void tdx_pre_create_vcpu(CPUState *cpu)
         exit(1);
     }
 
+    if (env->tsc_khz && (env->tsc_khz < TDX1_MIN_TSC_FREQUENCY_KHZ ||
+                         env->tsc_khz > TDX1_MAX_TSC_FREQUENCY_KHZ)) {
+        error_report("Invalid TSC %ld KHz, must specify cpu_frequecy between [%d, %d] kHz\n",
+                      env->tsc_khz, TDX1_MIN_TSC_FREQUENCY_KHZ,
+                      TDX1_MAX_TSC_FREQUENCY_KHZ);
+        exit(1);
+    }
+
+    if (env->tsc_khz % (25 * 1000)) {
+        error_report("Invalid TSC %ld KHz, it must be multiple of 25MHz\n", env->tsc_khz);
+        exit(1);
+    }
+
     qemu_mutex_lock(&tdx->lock);
     if (tdx->initialized) {
         goto out;
@@ -103,6 +118,7 @@ void tdx_pre_create_vcpu(CPUState *cpu)
     cpuid_data.cpuid.padding = 0;
 
     init_vm.max_vcpus = ms->smp.cpus;
+    init_vm.tsc_khz = env->tsc_khz;
     init_vm.attributes = 0;
     init_vm.attributes |= tdx->debug ? TDX1_TD_ATTRIBUTE_DEBUG : 0;
     init_vm.attributes |= x86cpu->enable_pmu ? TDX1_TD_ATTRIBUTE_PERFMON : 0;
-- 
2.25.1


