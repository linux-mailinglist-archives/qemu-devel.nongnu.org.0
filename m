Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3E646923
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3AM7-0000t3-I1; Thu, 08 Dec 2022 01:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALX-0000ha-9k
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:29 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALU-0005NS-QS
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480724; x=1702016724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ANSGjufLLPoRfF/om6K+WGEXxzVfJiLQYuBjX7wdEwA=;
 b=M8kiNIDh0NRcjvb5CaOdBqgKj3Tfallw0E3KevImPFCvm/2IbglL6cT6
 ZddSYLTTtbgDCDDK1DRTLHbafqDKRhFIpjBax/SSt9Tz5VNXCzn/b7svH
 B1IOhmA0kvoUWK/A55WUYP6qlMwmADSoNDKKy4stSruatU8nOTOSj/ef0
 ZcjaO06fUfDLVJ3ZvrWivpDwBUsEkxieDJ2dgqEjtC5Y8Q23NsGXA6hYA
 SxBoNlaKqfqgbw5U+x9OkP/TsdOkCElid+WVL6DbH8hfLFHgls3xzFPkB
 0rbEwL2Jy0JHfNi019kH8WZbIebBszFoSp8pI0tQqb4QnJ4l+LBnTmVdU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444454"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444454"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413394"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413394"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:17 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 2/8] target/i386/intel-pt: Fix INTEL_PT_ADDR_RANGES_NUM_MASK
Date: Thu,  8 Dec 2022 14:25:07 +0800
Message-Id: <20221208062513.2589476-3-xiaoyao.li@intel.com>
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

Per Intel SDM, bits 2:0 of CPUID(0x14,0x1).EAX indicate the number of
address ranges for INTEL-PT.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8d95202f6a42..9ae36639d380 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -570,7 +570,7 @@ static CPUCacheInfo legacy_l3_cache = {
 /* generated packets which contain IP payloads have LIP values */
 #define INTEL_PT_IP_LIP          (1 << 31)
 #define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
-#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x3
+#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
 #define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
 #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
-- 
2.27.0


