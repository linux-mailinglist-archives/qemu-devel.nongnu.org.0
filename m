Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D66D8FA0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:42:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJJM-0006TN-Bf; Thu, 06 Apr 2023 02:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkJJH-0006TC-S9
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:41:27 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@linux.intel.com>)
 id 1pkJJB-0001Ey-Kl
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680763281; x=1712299281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcCeNIlq4T8FY057+idL1UGOPgkJVbviAmX/bP7agjg=;
 b=ly1l4I9zmRw9fnLXSmRpufoVB6a7kC04mmZUMIN3XaFlqquM4Od09vIN
 I9mk/9h6tupr2otKhOQyPxQgYOIMb5d/GwmFZ36l0tI4SwdvtHjNRQzTp
 SUJ4dEgAP96sTtiyhduKofW3w23gIj4zqt49JP7o8dHkc2SuC3sYBP+eN
 HiSKykQTuECucjP2qRgigqNx7bJqBlMwAH/JRjRrFWLJ4BhxU1Wh0JQvk
 ED2txeG9ZW2hl2sE6Yg212nsArgrdtbKZXCQe44hX9c1mhbFDreMe3OD/
 iEfBFp0fvhFHxv4dlK/ivGR/njxx6uz/Raqbd4QKBu+5TKy2Duj5HuIm/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="331265041"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="331265041"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 23:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830637053"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="830637053"
Received: from icx.bj.intel.com ([10.240.193.41])
 by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 23:40:56 -0700
From: Yang Zhong <yang.zhong@linux.intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, seanjc@google.com, christian.ehrhardt@canonical.com,
 kai.huang@intel.com, weijiang.yang@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH v3] target/i386: Change wrong XFRM value
Date: Thu,  6 Apr 2023 02:40:41 -0400
Message-Id: <20230406064041.420039-1-yang.zhong@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=yang.zhong@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
SGX enclave only supported SSE and x87 feature(xfrm=0x3).

Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")

Signed-off-by: Yang Zhong <yang.zhong@linux.intel.com>
Reviewed-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6576287e5b..f083ff4335 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5718,8 +5718,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         } else {
             *eax &= env->features[FEAT_SGX_12_1_EAX];
             *ebx &= 0; /* ebx reserve */
-            *ecx &= env->features[FEAT_XSAVE_XSS_LO];
-            *edx &= env->features[FEAT_XSAVE_XSS_HI];
+            *ecx &= env->features[FEAT_XSAVE_XCR0_LO];
+            *edx &= env->features[FEAT_XSAVE_XCR0_HI];
 
             /* FP and SSE are always allowed regardless of XSAVE/XCR0. */
             *ecx |= XSTATE_FP_MASK | XSTATE_SSE_MASK;

