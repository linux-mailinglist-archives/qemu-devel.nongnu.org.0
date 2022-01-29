Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD54A3620
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 13:10:16 +0100 (CET)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE927-00042z-8I
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 07:10:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nE90E-0003H6-Mt
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 07:08:18 -0500
Received: from mga09.intel.com ([134.134.136.24]:4348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nE90C-0000Pm-0x
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 07:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643544496; x=1675080496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5rPDaChi9iXYfc/A9xVEnCdOdPbJzUxagATDrSSuYDA=;
 b=jjK8uvqjIaLb2TPD/3ZTCJ9iwxExMK16k8XzPAs08jno1/buk8ZS3N07
 50m8DcIAD0CYkNtIRZPnRgVLFG+HcZXysOCeMUyp9ZmqBrOiDuLnN7KzH
 yCt+8AiprpBzgY4sy9bIz0/+hjrvjXRwpTJwADDK7Tv6T9vrHMU8Gw53a
 FaI56oZTWytSOtu4zp9ZDVjNj/sZn/LFGM2ER6y+auvfHyENbelWkcaI8
 7KdaE5J1y1ImbPoq4gYJVKOA5Ok+gY9N1Ru9/rmJgW3V8X8fMvgxgHs87
 wh68two0teb06PBurA0G42hjgWaMqb4+dyyNVzb2IA2FIsQBPehRRk/LU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247113805"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; d="scan'208";a="247113805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 04:08:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; d="scan'208";a="619137088"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 04:08:11 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com,
	ehabkost@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: Add kvm_get_one_msr helper
Date: Sat, 29 Jan 2022 18:07:19 -0500
Message-Id: <20220129230719.111339-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=weijiang.yang@intel.com; helo=mga09.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.098, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: weijiang.yang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When try to get one msr from KVM, I found there's no such kind of
existing interface while kvm_put_one_msr() is there. So here comes
the patch. It'll remove redundant preparation code before finally
call KVM_GET_MSRS IOCTL.

No functional change intended.

v2:
 Per Paolo's suggestion, move the helper before uses to eliminate
 a forward declaration.

base-commit: 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/kvm/kvm.c | 48 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f..627535395a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -201,32 +201,45 @@ bool kvm_hv_vpindex_settable(void)
     return hv_vpindex_settable;
 }
 
-static int kvm_get_tsc(CPUState *cs)
+static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    int ret;
     struct {
         struct kvm_msrs info;
         struct kvm_msr_entry entries[1];
-    } msr_data = {};
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
+
+static int kvm_get_tsc(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
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
 
@@ -1478,21 +1491,14 @@ static int hyperv_init_vcpu(X86CPU *cpu)
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
-- 
2.27.0


