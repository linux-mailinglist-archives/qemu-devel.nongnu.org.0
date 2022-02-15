Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717A4B8399
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:07:01 +0100 (CET)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGH6-0002Wq-5U
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5d-0005LU-SU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:09 -0500
Received: from mga17.intel.com ([192.55.52.151]:19074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nKG5b-0002n5-4k
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001707; x=1676537707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHSwigx+fEOjTfkwt5vUqTNa2cOrqiOLC5/yaTKJ80E=;
 b=iNXxQf0hT5Hwy3LC1aiyXCXDFo9CrzbFyxjTfKl1tpJQ5XBLn7h3wMJU
 rxTg5bsHNkQOmJJ5CJiWA3e6Df4isgdQWNmMO3ZilIUVzty0JrLfGZCkm
 3OLouRnerHmnXSyrP7zYs+L/24bOxqcvT1ZZTZimHJLUyRCUpYUWjypj/
 OP/mc7QH/bcGdGqC2+PCYa7/Eye3D+x28aCbZNVEBTbLQU8DXq7rzkUVV
 wStZ4vJfoPwANWoq//XINkMNxPDfd+xDKCcFGC2zQn4BfqRRlfC/v9aG2
 6l4/iHhftr+SNOHq2Nd4pQ6y3CVe7RYd1CW+IVtVVUKTLTpqTbQAnE9ND g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="231182079"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="231182079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="633418276"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:54:05 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, ehabkost@redhat.com, mtosatti@redhat.com,
 seanjc@google.com, richard.henderson@linaro.org, like.xu.linux@gmail.com,
 wei.w.wang@intel.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 3/8] target/i386: Add kvm_get_one_msr helper
Date: Tue, 15 Feb 2022 14:52:53 -0500
Message-Id: <20220215195258.29149-4-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215195258.29149-1-weijiang.yang@intel.com>
References: <20220215195258.29149-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
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
index 8dbda2420d..764d110e0f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -136,6 +136,7 @@ static struct kvm_msr_list *kvm_feature_msrs;
 
 #define BUS_LOCK_SLICE_TIME 1000000000ULL /* ns */
 static RateLimit bus_lock_ratelimit_ctrl;
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value);
 
 int kvm_has_pit_state2(void)
 {
@@ -206,28 +207,21 @@ static int kvm_get_tsc(CPUState *cs)
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
 
@@ -1485,21 +1479,14 @@ static int hyperv_init_vcpu(X86CPU *cpu)
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
@@ -2752,6 +2739,25 @@ static int kvm_put_one_msr(X86CPU *cpu, int index, uint64_t value)
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


