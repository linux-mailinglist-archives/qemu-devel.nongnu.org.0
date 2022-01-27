Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC749F2BB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 06:04:29 +0100 (CET)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDJQx-00066c-Jt
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 00:04:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nDJMV-0005Hv-FJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 23:59:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:61446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nDJMO-0003hZ-V2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 23:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643345984; x=1674881984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BIg7+W4rXtl2o8dOplTMWQLDEeIAIZl1xrcS07snmqQ=;
 b=bH4KTJY4UMhiMucffYwFGKlv+KyRlPsDr+MaGFdPDLiNspoOWPD6WaZx
 etnaiXJz6ha9W5UBMRfLsIzEfkqyfNEfxWMpeQZHYOjNQesiWkwDUvtsN
 AezbReFJ4SzelfSh1NnKjuyBtIVzbNmw7yGu+bcKNbSbV5O2WXjDRFYSR
 m3DQWEVeoVJTMn1JK9OqiXrpoWnp3d1orawyJpvm/RsrMkfNLLqgwiGfp
 cu7lUMdMre8EepVAnMXM5zoHrc/RKHyMdXiUWaOM6UNCyKFSk6fW1J1mI
 CGT/s/chz7VuvibJbLDfwIido/2WhRSQZfkDfClqBuvPVBY8g4GtohwhA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244648544"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="244648544"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 20:59:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="521548291"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 20:59:41 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com,
	ehabkost@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Add kvm_get_one_msr helper
Date: Thu, 27 Jan 2022 10:58:45 -0500
Message-Id: <20220127155845.95594-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=weijiang.yang@intel.com; helo=mga11.intel.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.159, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: weijiang.yang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When try to get one msr from KVM, I found there's no such kind of
existing interface while kvm_put_one_msr() is there. So here comes
the patch. It'll remove redundant preparation code before finally
call KVM_GET_MSRS IOCTL.

No functional change intended.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/kvm/kvm.c | 48 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..c897dbaf60 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -135,6 +135,7 @@ static struct kvm_msr_list *kvm_feature_msrs;
 
 #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
 static RateLimit bus_lock_ratelimit_ctrl;
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
 
 int kvm_has_pit_state2(void)
 {
@@ -205,28 +206,21 @@ static int kvm_get_tsc(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    struct {
-        struct kvm_msrs info;
-        struct kvm_msr_entry entries[1];
-    } msr_data = {};
+    uint64_t value;
     int ret;
 
     if (env->tsc_valid) {
         return 0;
     }
 
-    memset(&msr_data, 0, sizeof(msr_data));
-    msr_data.info.nmsrs = 1;
-    msr_data.entries[0].index = MSR_IA32_TSC;
     env->tsc_valid = !runstate_is_running();
 
-    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
+    ret = kvm_get_one_msr(cpu, MSR_IA32_TSC, &value);
     if (ret < 0) {
         return ret;
     }
 
-    assert(ret == 1);
-    env->tsc = msr_data.entries[0].data;
+    env->tsc = value;
     return 0;
 }
 
@@ -1478,21 +1472,14 @@ static int hyperv_init_vcpu(X86CPU *cpu)
          * the kernel doesn't support setting vp_index; assert that its value
          * is in sync
          */
-        struct {
-            struct kvm_msrs info;
-            struct kvm_msr_entry entries[1];
-        } msr_data = {
-            .info.nmsrs = 1,
-            .entries[0].index = HV_X64_MSR_VP_INDEX,
-        };
-
-        ret = kvm_vcpu_ioctl(cs, KVM_GET_MSRS, &msr_data);
+        uint64_t value;
+
+        ret = kvm_get_one_msr(cpu, HV_X64_MSR_VP_INDEX, &value);
         if (ret < 0) {
             return ret;
         }
-        assert(ret == 1);
 
-        if (msr_data.entries[0].data != hyperv_vp_index(CPU(cpu))) {
+        if (value != hyperv_vp_index(CPU(cpu))) {
             error_report("kernel's vp_index != QEMU's vp_index");
             return -ENXIO;
         }
@@ -2734,6 +2721,25 @@ static int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MSRS, cpu->kvm_msr_buf);
 }
 
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
+{
+    int ret;
+    struct {
+        struct kvm_msrs info;
+        struct kvm_msr_entry entries[1];
+    } msr_data = {
+        .info.nmsrs = 1,
+        .entries[0].index = index,
+    };
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
+    if (ret < 0) {
+        return ret;
+    }
+    assert(ret == 1);
+    *value = msr_data.entries[0].data;
+    return ret;
+}
 void kvm_put_apicbase(X86CPU *cpu, uint64_t value)
 {
     int ret;
-- 
2.27.0


