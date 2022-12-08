Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F385646928
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ALv-0000kI-5T; Thu, 08 Dec 2022 01:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALc-0000iH-Tj
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:33 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALa-0005MN-JT
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480730; x=1702016730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOmR1JCdiaffCYVDbb1S5VJR9D6xo/R7Jt4fOToUMvU=;
 b=VATQWv6cyD/dP9GpXK3Ja+GrWu1gAkSXCigIL7BV2HZsEky4qjWkMLWO
 qBfdUPKlXsQGgBPts1EJHRBePEkEi5qnZpbukGNEtwZQwXA1GXdeu3l+/
 tZSBg18+WdFw72+O3/Cfws5zo/FsPXE6+rwVPthi6cZPRvuS7/XdKsVHU
 oe0jC8t3WYuliNaMiSC1uqzvN0cfdkjkAR1nhaXBnqlOyhJmANQGa12cp
 13H+wnoNuLeFgjb3LSWT/YP9tpXhzxcoL3dn7CcPA286z5+dSOctU3gq/
 XF8NoYZZ/kWP5wWfSlk+QRfcmDdvZhZqudChYffTolc9STGhgsMtWSNvA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444504"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444504"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413433"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413433"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:26 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 7/8] target/i386/intel-pt: Define specific PT feature set
 for IceLake-server and Snowridge
Date: Thu,  8 Dec 2022 14:25:12 +0800
Message-Id: <20221208062513.2589476-8-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221208062513.2589476-1-xiaoyao.li@intel.com>
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For IceLake-server, it's just the same as using the default PT
feature set since the default one is exact taken from ICX.

For Snowridge, define it according to real SNR silicon capabilities.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 24f3c7b06698..ef574c819671 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3458,6 +3458,14 @@ static const X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_6_EAX] =
             CPUID_6_EAX_ARAT,
         /* Missing: Mode-based execute control (XS/XU), processor tracing, TSC scaling */
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
@@ -3735,6 +3743,16 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             CPUID_XSAVE_XGETBV1,
         .features[FEAT_6_EAX] =
             CPUID_6_EAX_ARAT,
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


