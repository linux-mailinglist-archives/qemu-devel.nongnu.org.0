Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B7E3C22AF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:19:15 +0200 (CEST)
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1oXK-0006Lf-AD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTS-0007hp-1n
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:37176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTO-0005Av-N1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800810"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730228"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:42 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/33] hw/i386/fw_cfg: Set SGX bits in feature control
 fw_cfg accordingly
Date: Fri,  9 Jul 2021 19:09:38 +0800
Message-Id: <20210709110955.73256-17-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Request SGX an SGX Launch Control to be enabled in FEATURE_CONTROL
when the features are exposed to the guest. Our design is the SGX
Launch Control bit will be unconditionally set in FEATURE_CONTROL,
which is unlike host bios.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/fw_cfg.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 4e68d5dea4..f6d036dfbe 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -159,7 +159,7 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
 {
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
     CPUX86State *env = &cpu->env;
-    uint32_t unused, ecx, edx;
+    uint32_t unused, ebx, ecx, edx;
     uint64_t feature_control_bits = 0;
     uint64_t *val;
 
@@ -174,6 +174,14 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
         feature_control_bits |= FEATURE_CONTROL_LMCE;
     }
 
+    cpu_x86_cpuid(env, 0x7, 0, &unused, &ebx, &ecx, &unused);
+    if (ebx & CPUID_7_0_EBX_SGX) {
+        feature_control_bits |= FEATURE_CONTROL_SGX;
+    }
+    if (ecx & CPUID_7_0_ECX_SGX_LC) {
+        feature_control_bits |= FEATURE_CONTROL_SGX_LC;
+    }
+
     if (!feature_control_bits) {
         return;
     }
-- 
2.29.2.334.gfaefdd61ec


