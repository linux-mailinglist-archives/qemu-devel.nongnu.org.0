Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7D5793D0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:06:26 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhJJ-0005Fn-C4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDhH0-0001Xs-PG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:02 -0400
Received: from mga04.intel.com ([192.55.52.120]:24290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oDhGy-0002w6-C7
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658214240; x=1689750240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y9mfgXSJqMSu9tc8S8p1kN2tQ97dzjNGCv9vlRI8d6s=;
 b=Z6wDoMIWhsVj+jqG7HMm9FioVbi0OfaKJs4eMew/5EmtDAoL++a12140
 imA/PDIATpWPjVwjZXpXDIn3fDxOJ5KE7/9KN0yNpZvChfgbVP5GJxXn/
 nkSrzuE9sN0FGDC2Qk6zV4CDOm4+mG7yh6ww13ZKXyZU6+59U46t2IAu9
 CSXfWBJ5tdBjXs8d3VZMZPEWxNPPk1BuPfePHThtDXQBfoZood7f5Fdgz
 qLIle7OZsaYTst2MSwAJzdSFs9MVH0CWVeLI4F6+WiVuUtj80+SS96fx0
 yX7A7G2BAg58fmx2EyixRSVrgo0PnfUerrmMVwkNW9SYnpaMcED5aIBlT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285168765"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="285168765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:03:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; d="scan'208";a="655627069"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:03:32 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 likexu@tencent.com, xiangfeix.ma@intel.com
Subject: [PATCH v2] i386: Disable BTS
Date: Tue, 19 Jul 2022 14:56:20 +0800
Message-Id: <20220719065620.82128-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=zhenzhong.duan@intel.com; helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Without fix, we get below error in guest kernel:

[] unchecked MSR access error: WRMSR to 0x1d9 (tried to write 0x00000000000001c0) at rIP: 0xffffffffaa070644 (native_write_msr+0x4/0x20)
[] Call Trace:
[]  <TASK>
[]  intel_pmu_enable_bts+0x5d/0x70
[]  bts_event_add+0x77/0x90
[]  event_sched_in.isra.135+0x99/0x1e0

Also setup MISC_ENABLE_EMON bit based on pmu property for consistency.

Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
v2: Some changes based on Like's comments

 target/i386/cpu.c | 7 ++++++-
 target/i386/cpu.h | 6 ++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af86..16cf72f992a3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5955,7 +5955,12 @@ static void x86_cpu_reset(DeviceState *dev)
         env->tsc = 0;
     }
 
-    env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
+    /* Disable BTS feature which is unsupported on KVM */
+    env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT |
+                                MSR_IA32_MISC_ENABLE_BTS_UNAVAIL;
+    if (cpu->enable_pmu) {
+        env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_EMON;
+    }
     if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
         env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
     }
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b944..7221488f84bc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -434,8 +434,10 @@ typedef enum X86Seg {
 
 #define MSR_IA32_MISC_ENABLE            0x1a0
 /* Indicates good rep/movs microcode on some processors: */
-#define MSR_IA32_MISC_ENABLE_DEFAULT    1
-#define MSR_IA32_MISC_ENABLE_MWAIT      (1ULL << 18)
+#define MSR_IA32_MISC_ENABLE_DEFAULT     (1ULL << 0)
+#define MSR_IA32_MISC_ENABLE_EMON        (1ULL << 7)
+#define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL (1ULL << 11)
+#define MSR_IA32_MISC_ENABLE_MWAIT       (1ULL << 18)
 
 #define MSR_MTRRphysBase(reg)           (0x200 + 2 * (reg))
 #define MSR_MTRRphysMask(reg)           (0x200 + 2 * (reg) + 1)
-- 
2.25.1


