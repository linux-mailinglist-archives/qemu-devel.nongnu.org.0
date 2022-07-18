Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FC45779C3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 05:32:37 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDHUq-0001ig-Eg
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 23:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDHTB-0000Jz-Bw
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:30:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:6865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDHT7-0007jh-0E
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658115048; x=1689651048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6/iZYgjKEG8lUCeO6lzTlpv+oegO9YHJu3SWbK8Gz2w=;
 b=FfRYKEZJtaU5hPc4WnOjeSsfpSZVQV9wccCGXkSagkZnMnPeMB+1/cUH
 My7tIgKyDobEpqK/r/JmV6sKRe7FMmfearRbb7l6iIEtukROjF4w68aoU
 vLpqTF/dS9kkjB+6440Wxt6vh0LQrdDJid4ZOqElXLmmxgAVpGBjBM8mI
 UwyXIy3n3azpi/xvIvJ3anQxokWrWKTwH8aSpGBG0OhdoJeQVuIo2Crls
 eTtkjuow38VbeBV+q4ySpSUNda64AiobIZccIMgxU7Rxc6xTHzvjvANfq
 vSYUKw7+IJKcjL1rsWAF3e+WG8LI3W9VRoKRM7BLhHZUiPablbFjAAz3M Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="311801443"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="311801443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 20:30:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="624549143"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 20:30:03 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 likexu@tencent.com, xiangfeix.ma@intel.com
Subject: [PATCH] i386: Disable BTS and PEBS
Date: Mon, 18 Jul 2022 11:22:06 +0800
Message-Id: <20220718032206.34488-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=zhenzhong.duan@intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since below KVM commit, KVM hided BTS as it's not supported yet.
b9181c8ef356 ("KVM: x86/pmu: Avoid exposing Intel BTS feature")

After below KVM commit, it gave control of MSR_IA32_MISC_ENABLES to userspace.
9fc222967a39 ("KVM: x86: Give host userspace full control of MSR_IA32_MISC_ENABLES")

So qemu takes the responsibility to hide BTS.
Without fix, we get below warning in guest kernel:

[] unchecked MSR access error: WRMSR to 0x1d9 (tried to write 0x00000000000001c0) at rIP: 0xffffffffaa070644 (native_write_msr+0x4/0x20)
[] Call Trace:
[]  <TASK>
[]  intel_pmu_enable_bts+0x5d/0x70
[]  bts_event_add+0x77/0x90
[]  event_sched_in.isra.135+0x99/0x1e0

Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 target/i386/cpu.h     | 6 ++++--
 target/i386/kvm/kvm.c | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b944..8a83d0995c66 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -434,8 +434,10 @@ typedef enum X86Seg {
 
 #define MSR_IA32_MISC_ENABLE            0x1a0
 /* Indicates good rep/movs microcode on some processors: */
-#define MSR_IA32_MISC_ENABLE_DEFAULT    1
-#define MSR_IA32_MISC_ENABLE_MWAIT      (1ULL << 18)
+#define MSR_IA32_MISC_ENABLE_DEFAULT      1
+#define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1ULL << 11)
+#define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1ULL << 12)
+#define MSR_IA32_MISC_ENABLE_MWAIT        (1ULL << 18)
 
 #define MSR_MTRRphysBase(reg)           (0x200 + 2 * (reg))
 #define MSR_MTRRphysMask(reg)           (0x200 + 2 * (reg) + 1)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52fa4..002e0520dd76 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2180,6 +2180,10 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
 
+    /* Disable BTS feature which is unsupported on KVM */
+    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL;
+    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
+
     env->xcr0 = 1;
     if (kvm_irqchip_in_kernel()) {
         env->mp_state = cpu_is_bsp(cpu) ? KVM_MP_STATE_RUNNABLE :
-- 
2.25.1


