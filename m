Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70957100C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:16:52 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5SF-00051Y-DU
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oB5Oj-00086E-Dw
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:13:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:21787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oB5Oc-0007r4-Pl
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657591986; x=1689127986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sW48LhJtFySdFOipzLcNWF35NfAbhYk3bcFRIsTzh+g=;
 b=N7xLfN2L3nDdq1AqUyk2x9o3hZy/abDNigqskR7j/Aw+CVN1RrSaJLgC
 mre2rVIN0hBFJbhL7wydtWJi5HqvxSAs+YZynJzhRcyvx+7LVSE/Pexwe
 3oNOGWWEn6FHLRiW+tlWr9teBODEOMW4bT9asl5/7QBOADB0Ly2vegpDr
 6zAWpjZHL3t8pJqZATj+0kfHn3S3Dze+94BHduA6MOP4uNb8Tdet+lLY6
 qkjBYaEdAJZ2Lmb71bkwIJhmSEbPIMVV5+ldMawwZRotk07q0z/+QxyKV
 Ki43wods9wdKHtQOyXMGPFkSMPdS5v7+Ar7k5/CYUDYzAvVnA49X7gUOw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="310429703"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="310429703"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 19:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="622320257"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 Jul 2022 19:12:53 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	xiaoyao.li@intel.com
Subject: [PATCH 2/2] i386/cpuid: Remove subleaf constraint on CPUID leaf 1F
Date: Tue, 12 Jul 2022 10:12:49 +0800
Message-Id: <20220712021249.3227256-3-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220712021249.3227256-1-xiaoyao.li@intel.com>
References: <20220712021249.3227256-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=xiaoyao.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

No such constraint that subleaf index needs to be less than 64.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a0b412a1129f..3efa524b4b93 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1843,10 +1843,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
                     break;
                 }
 
-                if (i == 0x1f && j == 64) {
-                    break;
-                }
-
                 c->function = i;
                 c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
                 c->index = j;
-- 
2.27.0


