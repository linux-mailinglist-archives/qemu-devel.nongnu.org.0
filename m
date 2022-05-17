Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E052A760
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:52:31 +0200 (CEST)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzUr-0001JI-LS
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nqzTg-0000Zu-SL
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:51:16 -0400
Received: from mga06b.intel.com ([134.134.136.31]:33764 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nqzTe-0005dD-9u
 for qemu-devel@nongnu.org; Tue, 17 May 2022 11:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652802674; x=1684338674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cHiPt+XcZXdU5PMPxLMx8JlJCddH7PwTNkDv1IBDh/g=;
 b=FjpkPEf62wchEQaiCxUPQOu+GcbWL5qS6DX6hbe8xbUD+LTaNS9mLDZw
 awa3CHnMf6YmQtRS43zO1y1577kRv4Wv4bthSBEg+j/iHC7+wb4z4S4YI
 PdduPeB7bfMa0nGEtpLSVJb5jv6SObGO+63/Y2I+uWMjSK0p1w7nSFTD3
 e2Y5GDkJH25mfyO4jM9D4gpVpWCw1jgGZ3jUfdfY7eOKUwvy4OChYF/ss
 RzKrgp47E/DyqJp1S2ugakb34PTo+DWvamuHzHrNG2eMZZKZt7wQIsGyr
 N9ZFXyqFEyNkaJVHU8dwd5jQaTyYsNPefGGlD9SvukrlxPlqAXtFcs02V g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="331842833"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="331842833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 08:51:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="597199913"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 08:51:08 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PATCH] target/i386: Remove LBREn bit check when access Arch LBR MSRs
Date: Tue, 17 May 2022 11:50:24 -0400
Message-Id: <20220517155024.33270-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=weijiang.yang@intel.com; helo=mga06.intel.com
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

Live migration can happen when Arch LBR LBREn bit is cleared,
e.g., when migration happens after guest entered SMM mode.
In this case, we still need to migrate Arch LBR MSRs.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/kvm/kvm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a9ee8eebd7..e2d675115b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3373,15 +3373,14 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
             int i, ret;
 
             /*
-             * Only migrate Arch LBR states when: 1) Arch LBR is enabled
-             * for migrated vcpu. 2) the host Arch LBR depth equals that
-             * of source guest's, this is to avoid mismatch of guest/host
-             * config for the msr hence avoid unexpected misbehavior.
+             * Only migrate Arch LBR states when the host Arch LBR depth
+             * equals that of source guest's, this is to avoid mismatch
+             * of guest/host config for the msr hence avoid unexpected
+             * misbehavior.
              */
             ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
 
-            if (ret == 1 && (env->msr_lbr_ctl & 0x1) && !!depth &&
-                depth == env->msr_lbr_depth) {
+            if (ret == 1 && !!depth && depth == env->msr_lbr_depth) {
                 kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, env->msr_lbr_ctl);
                 kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, env->msr_lbr_depth);
 
@@ -3801,13 +3800,11 @@ static int kvm_get_msrs(X86CPU *cpu)
 
     if (kvm_enabled() && cpu->enable_pmu &&
         (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
-        uint64_t ctl, depth;
-        int i, ret2;
+        uint64_t depth;
+        int i, ret;
 
-        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_CTL, &ctl);
-        ret2 = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
-        if (ret == 1 && ret2 == 1 && (ctl & 0x1) &&
-            depth == ARCH_LBR_NR_ENTRIES) {
+        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+        if (ret == 1 && depth == ARCH_LBR_NR_ENTRIES) {
             kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, 0);
             kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, 0);
 

base-commit: 8eccdb9eb84615291faef1257d5779ebfef7a0d0
-- 
2.27.0


