Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E30537C08
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:30:23 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfTS-0004oO-9l
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nvfIH-0001FS-UQ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:18:50 -0400
Received: from mga06b.intel.com ([134.134.136.31]:40559 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nvfIF-00020B-6F
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653916727; x=1685452727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bUzFfuW7PI/iZG3TricEnJCJWSwKo7DQcGwE0jHqr0=;
 b=hYruMOy50Lo2qcAMhmSO6ij48OH75VIFmfZOkKxuuFMxv+F8hwSHbTlS
 kSJ4gCeJcgOgYKyZhzMQ1PaJF2KKDwkZyJ5d3jxI/kOv3tkdAOSmczn6K
 mLXKP/QS79ZGTwJrKl5HM1wS2vgH59OIoljuHwl/7ky/v5FmpfOtDfM7Y
 Yet81r5zvs2BOy7tFV3qYCl4LsVFFbTj88GEZrv/XWnwSfO/bfbYw2t2U
 6ol7YcOap/1zQW5mjYFHkbamhS5j9A/0M3ZP6xg2+w0xLfN1FpEy4TWDz
 YlXbCiQ4uiEd33F4SXnEiNZMUcgLPjA7yD+Km93bZCDBDX5XoT8eRj+hQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="335647723"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="335647723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 06:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="605187101"
Received: from icx.bj.intel.com ([10.240.192.117])
 by orsmga008.jf.intel.com with ESMTP; 30 May 2022 06:18:41 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	yang.zhong@intel.com
Subject: [PATCH] target/i386: Fix wrong count setting
Date: Mon, 30 May 2022 09:18:34 -0400
Message-Id: <20220530131834.1222801-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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

The previous patch used wrong count setting with index value, which got wrong
value from CPUID(EAX=12,ECX=0):EAX. So the SGX1 instruction can't be exposed
to VM and the SGX decice can't work in VM.

Fixes: d19d6ffa0710 ("target/i386: introduce helper to access supported CPUID")

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index bb6a5dd498..9fdfec9d8b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5559,7 +5559,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
          * supports.  Features can be further restricted by userspace, but not
          * made more permissive.
          */
-        x86_cpu_get_supported_cpuid(0x12, index, eax, ebx, ecx, edx);
+        x86_cpu_get_supported_cpuid(0x12, count, eax, ebx, ecx, edx);
 
         if (count == 0) {
             *eax &= env->features[FEAT_SGX_12_0_EAX];
-- 
2.30.2


