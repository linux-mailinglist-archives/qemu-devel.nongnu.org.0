Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCC6470D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 14:35:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3H28-0003Ew-GM; Thu, 08 Dec 2022 08:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaocheng.dong@intel.com>)
 id 1p36y4-0001wk-2X
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 21:49:01 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaocheng.dong@intel.com>)
 id 1p36y0-0000D9-7B
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 21:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670467736; x=1702003736;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GJNguiH2eElK3EFixhoecaOVAVDHn5dWWGUxDlkkVPA=;
 b=a6cza6qUWQCFylyqxCp1w7mMCCblwH9CIHkYWEH2mtShNNzE63nTTVbM
 wAL6FxNN8r35BHzH67QGHGeEVOLFw7KEBiALiAMMTrABoCnJRHsdYGVXT
 2zoozVXZ76a2xQ/fIVip8UduH8V//wYrE6pEI9+SBGezGOPL2STZ609IM
 rsdG5mjMM734WNN4gOQSlTSfgcdZ4ba9r5tedB62TjQTd45YXN7c7+t/p
 kkjcakE8IAGGQiLoRLDpnKD6MM49C+E7Ht1KPBiSBDPEtiGoKXD43IRgj
 Fzl5ORywSA5Eyxz9sbt/5ensps/zoZ2p1AsX3IBbB9OZmHsTvISr8R/hi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="296751503"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="296751503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 18:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="597186201"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="597186201"
Received: from cpio-sprac-prc4.sh.intel.com ([10.239.48.135])
 by orsmga003.jf.intel.com with ESMTP; 07 Dec 2022 18:48:40 -0800
From: Xiaocheng Dong <xiaocheng.dong@intel.com>
To: xiaocheng.dong@intel.com, weijiang.yang@intel.com, yang.zhong@intel.com,
 qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Fix wrong XSAVE feature names
Date: Wed,  7 Dec 2022 21:47:47 -0500
Message-Id: <20221208024747.509579-1-xiaocheng.dong@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=xiaocheng.dong@intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Dec 2022 08:33:50 -0500
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

The previous patch changes the name from FEAT_XSAVE_COMP_{LO|HI}
to FEAT_XSAVE_XCR0_{LO|HI}, the changes for CPUID.0x12.0x1 should be
FEAT_XSAVE_XCR0_{LO|HI}, the SGX can't work in VM if these are not right

Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")

Signed-off-by: Xiaocheng Dong <xiaocheng.dong@intel.com>
---
 target/i386/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..0f71ff9fea 100644
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
2.31.1


