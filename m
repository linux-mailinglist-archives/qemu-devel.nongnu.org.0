Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A856D6EA485
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:18:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppl1H-00080u-Ux; Fri, 21 Apr 2023 03:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0t-0007oz-Ob
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:17:03 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0r-0004Zs-6A
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682061417; x=1713597417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TLq6UCCw6H2MXvktTy5ZqQ0ZM/+Ojum490E6zzwtrE0=;
 b=I8g7NFs7q/SW4NNirBRz3KDNl5LZ4BVg7Gq4KvtlxFDQBK51+HcuMIYX
 v8iVBo51ccRre8UvBXQfrMJiS9ggN52a35JEr5K1OZnLcrllkFfkHhi20
 qlaTbVz862zgIT2p8VlRQpum9Iilz6jeqkdQn+JlpgDOrLgetiIsbYhwj
 eSA3wZca9Pm0VMG/PmJNOR8lRjjqdI9q9847lTm+mBT921gaqcqz6HOv2
 t+I4Hjz1l2yjTmL1mC79UA5n0kiMma3Kb+scTpP3tw6q/fhxPcG1KXZBN
 TJh+37jX2Ua6F4iA2ROzKLDVC0PirdoW41xulpzabnk5sBaoPVFKBmuYx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326260539"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326260539"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938385328"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938385328"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:39 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	weijiang.yang@intel.com
Subject: [PATCH 3/4] target/i386: Enable CET states migration
Date: Fri, 21 Apr 2023 00:12:26 -0400
Message-Id: <20230421041227.90915-4-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230421041227.90915-1-weijiang.yang@intel.com>
References: <20230421041227.90915-1-weijiang.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add supported CET states in vmstate for VM migration.

Other MSRs, i.e., MSR_IA32_PL{0,1,2}_SSP and MSR_IA32_INTR_SSP_TBL
are for non-supported supervisor mode shadow stack, are ignored now.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/machine.c | 81 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index c7ac8084b2..904a7e9574 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1018,6 +1018,83 @@ static const VMStateDescription vmstate_umwait = {
     }
 };
 
+static bool u_cet_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->u_cet != 0;
+}
+
+static const VMStateDescription vmstate_u_cet = {
+    .name = "cpu/u_cet",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = u_cet_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.u_cet, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool s_cet_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->s_cet != 0;
+}
+
+static const VMStateDescription vmstate_s_cet = {
+    .name = "cpu/s_cet",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = s_cet_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.s_cet, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+
+static bool pl3_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->pl3_ssp != 0;
+}
+
+static const VMStateDescription vmstate_pl3_ssp = {
+    .name = "cpu/pl3_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl3_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.pl3_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool guest_ssp_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return env->guest_ssp != 0;
+}
+
+static const VMStateDescription vmstate_guest_ssp = {
+    .name = "cpu/guest_ssp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = guest_ssp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.guest_ssp, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool pkru_needed(void *opaque)
 {
     X86CPU *cpu = opaque;
@@ -1745,6 +1822,10 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
         &vmstate_pdptrs,
+        &vmstate_u_cet,
+        &vmstate_s_cet,
+        &vmstate_pl3_ssp,
+        &vmstate_guest_ssp,
         &vmstate_msr_xfd,
 #ifdef TARGET_X86_64
         &vmstate_amx_xtile,
-- 
2.27.0


