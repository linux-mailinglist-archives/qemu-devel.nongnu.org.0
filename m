Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F84059A2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:47:44 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLL5-00042e-Dn
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFg-00043L-Bt
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:11393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mOLFd-0001Ru-L2
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:42:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284510194"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="284510194"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 07:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="696346363"
Received: from lxy-dell.sh.intel.com ([10.239.159.31])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 07:41:58 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [RFC PATCH 4/5] target/i386: Define specific PT feature set for
 IceLake-server and Snowridge
Date: Thu,  9 Sep 2021 22:41:49 +0800
Message-Id: <20210909144150.1728418-5-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210909144150.1728418-1-xiaoyao.li@intel.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For IceLake-server, it's just the same as using the default PT
feature set since the default one is exact taken from ICX.

For Snowridge, define it according to real SNR silicon capabilities.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 00c4ad23110d..2b50ccf79b92 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3383,6 +3383,15 @@ static const X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_6_EAX] =
             CPUID_6_EAX_ARAT,
         /* Missing: Mode-based execute control (XS/XU), processor tracing, TSC scaling */
+        .has_specific_intel_pt_feature_set = true,
+        .features[FEAT_14_0_EBX] =
+            CPUID_14_0_EBX_CR3_FILTER | CPUID_14_0_EBX_PSB |
+            CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC,
+        .features[FEAT_14_0_ECX] =
+            CPUID_14_0_ECX_TOPA | CPUID_14_0_ECX_MULTI_ENTRIES |
+            CPUID_14_0_ECX_SINGLE_RANGE,
+        .features[FEAT_14_1_EAX] = 0x249 << 16 | 0x2,
+        .features[FEAT_14_1_EBX] = 0x003f << 16 | 0x1fff,
         .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
              MSR_VMX_BASIC_TRUE_CTLS,
         .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
@@ -3652,6 +3661,17 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             CPUID_XSAVE_XGETBV1,
         .features[FEAT_6_EAX] =
             CPUID_6_EAX_ARAT,
+        .has_specific_intel_pt_feature_set = true,
+        .features[FEAT_14_0_EBX] =
+            CPUID_14_0_EBX_CR3_FILTER | CPUID_14_0_EBX_PSB |
+            CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC |
+            CPUID_14_0_EBX_PTWRITE | CPUID_14_0_EBX_POWER_EVENT |
+            CPUID_14_0_EBX_PSB_PMI_PRESERVATION,
+        .features[FEAT_14_0_ECX] =
+            CPUID_14_0_ECX_TOPA | CPUID_14_0_ECX_MULTI_ENTRIES |
+            CPUID_14_0_ECX_SINGLE_RANGE | CPUID_14_0_ECX_LIP,
+        .features[FEAT_14_1_EAX] = 0x249 << 16 | 0x2,
+        .features[FEAT_14_1_EBX] = 0x003f << 16 | 0xffff,
         .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
              MSR_VMX_BASIC_TRUE_CTLS,
         .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
-- 
2.27.0


