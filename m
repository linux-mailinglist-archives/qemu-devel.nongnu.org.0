Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8D60E02E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 14:05:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onf35-0002Im-6l; Wed, 26 Oct 2022 07:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1onf32-0002IE-FQ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 07:58:16 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1onf2z-0006OX-Om
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 07:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666785493; x=1698321493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qpe+uYYSF2ldwKkB0xjCpu/yX9aDBsOtvWK3n9gT+k4=;
 b=VMozqZ/Pe/Euf39KCpHJ0Ywt++aoNJAu1AnKGz9ajKNQ7YryCnrmGmpg
 v2lCqsy1Y5o8gosZ7gy74LRxRNCMXdKHCWNj4NR/B3Bn+5LnUWaLRDLb9
 5MlZW6GX9SlNS27K7QzjQyq2H/AcfLc2PV3U8D8wKCR+fEVG7DCTo05H1
 R5kFKXhmRBqswqgjegTvraxLWqodVBVS8XymTp/51fS9w8Rz0ySXrrJG6
 qR5Knan0/oDRPwA+9tnYIqA7NLlxKJlx3LqiFnaHf3j2Ss0qwTqfoUVEr
 7sM3NAad/5Jd8TsO0D9qdfGzyc7VSW73Am4kMmcx0xMN06SSkbI6vkXDz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="369992925"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="369992925"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 04:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="737208966"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="737208966"
Received: from icx.bj.intel.com ([10.240.192.136])
 by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2022 04:57:48 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, weijiang.yang@intel.com, yang.zhong@linux.intel.com,
 Yang Zhong <yang.zhong@intel.com>
Subject: [RESEND PATCH v2] target/i386: Switch back XFRM value
Date: Wed, 26 Oct 2022 07:57:45 -0400
Message-Id: <20221026115745.528314-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
SGX enclave only supported SSE and x87 feature(xfrm=0x3).

Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")

Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad623d91e4..19aaed877b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5584,8 +5584,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         } else {
             *eax &= env->features[FEAT_SGX_12_1_EAX];
             *ebx &= 0; /* ebx reserve */
-            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
-            *edx &= env->features[FEAT_XSAVE_XSS_HI];
+            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
+            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
 
             /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
             *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;
-- 
2.30.2


