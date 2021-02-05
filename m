Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCA3106B6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:32:36 +0100 (CET)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wXb-0003sM-6z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVg-0002Ru-SB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:9788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1l7wVf-000213-1L
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:30:36 -0500
IronPort-SDR: dRPwWyohsCfYpUhmSuZ1jfG4at1clPEqSQwCgo49L+wW3yzB7MsDGETRJXDOkUTCp5IjLlDkNO
 ZSOaI2bXqqjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168518447"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="168518447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:24 -0800
IronPort-SDR: fAONsr0cR/4n0Oc67xrJwFKxJiteK2GLbzYEZmMBsbo9ZRhWIMKtAt4vy7wDB3C69vCRtekz2Z
 G8PA+SriKQyQ==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; d="scan'208";a="393760307"
Received: from chenyi-pc.sh.intel.com ([10.239.159.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 00:30:21 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH 2/2] target/i386: Expose VMX entry/exit load pkrs control bits
Date: Fri,  5 Feb 2021 16:33:25 +0800
Message-Id: <20210205083325.13880-3-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205083325.13880-1-chenyi.qiang@intel.com>
References: <20210205083325.13880-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=chenyi.qiang@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose the VMX exit/entry load pkrs control bits in
VMX_TRUE_EXIT_CTLS/VMX_TRUE_ENTRY_CTLS MSRs to guest, which supports the
PKS in nested VM.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 21136c61a8..0de67bbbb2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1215,7 +1215,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "vmx-exit-save-efer", "vmx-exit-load-efer",
                 "vmx-exit-save-preemption-timer", "vmx-exit-clear-bndcfgs",
             NULL, "vmx-exit-clear-rtit-ctl", NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "vmx-exit-load-pkrs", NULL, NULL,
         },
         .msr = {
             .index = MSR_IA32_VMX_TRUE_EXIT_CTLS,
@@ -1230,7 +1230,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, "vmx-entry-ia32e-mode", NULL, NULL,
             NULL, "vmx-entry-load-perf-global-ctrl", "vmx-entry-load-pat", "vmx-entry-load-efer",
             "vmx-entry-load-bndcfgs", NULL, "vmx-entry-load-rtit-ctl", NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "vmx-entry-load-pkrs", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d7f3ef99d1..fbf65db4db 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -969,6 +969,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define VMX_VM_EXIT_CLEAR_BNDCFGS                   0x00800000
 #define VMX_VM_EXIT_PT_CONCEAL_PIP                  0x01000000
 #define VMX_VM_EXIT_CLEAR_IA32_RTIT_CTL             0x02000000
+#define VMX_VM_EXIT_LOAD_IA32_PKRS                  0x20000000
 
 #define VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS            0x00000004
 #define VMX_VM_ENTRY_IA32E_MODE                     0x00000200
@@ -980,6 +981,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define VMX_VM_ENTRY_LOAD_BNDCFGS                   0x00010000
 #define VMX_VM_ENTRY_PT_CONCEAL_PIP                 0x00020000
 #define VMX_VM_ENTRY_LOAD_IA32_RTIT_CTL             0x00040000
+#define VMX_VM_ENTRY_LOAD_IA32_PKRS                 0x00400000
 
 /* Supported Hyper-V Enlightenments */
 #define HYPERV_FEAT_RELAXED             0
-- 
2.17.1


