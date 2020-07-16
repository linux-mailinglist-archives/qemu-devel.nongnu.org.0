Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A34221E1F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 10:22:19 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvz9m-0004U4-Gq
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 04:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jvz86-0002qM-BL
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:20:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jvz84-0000Ih-GS
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:20:34 -0400
IronPort-SDR: ZzWOrB/zrLjXgyJGQ7IXxCIqzgbbaWJzJ6ZBEpmSQWOB8mmYSSx0FTINohtd1Lx0mGo53TTicD
 qmgyZ4uxb3sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="210871090"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="210871090"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 01:20:30 -0700
IronPort-SDR: bkkLh9L8zpygOMsOm1BVjgDaNw0b1DwsKnkbtY8/miA8wcWibt0c4RT1C0gpVr96hgWigyj4mB
 qwZfs5vWvCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="286403906"
Received: from lxy-dell.sh.intel.com ([10.239.159.21])
 by orsmga006.jf.intel.com with ESMTP; 16 Jul 2020 01:20:27 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/2] i386/cpu: Mask off unsupported XSAVE components
Date: Thu, 16 Jul 2020 16:20:19 +0800
Message-Id: <20200716082019.215316-3-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200716082019.215316-1-xiaoyao.li@intel.com>
References: <20200716082019.215316-1-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 04:20:23
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When setting up XSAVE components, it needs to mask off those unsupported
by KVM.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f5f11603e805..efc92334b7b1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6274,8 +6274,10 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
         }
     }
 
-    env->features[FEAT_XSAVE_COMP_LO] = mask;
-    env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
+    env->features[FEAT_XSAVE_COMP_LO] = mask &
+        x86_cpu_get_supported_feature_word(FEAT_XSAVE_COMP_LO, cpu->migratable);
+    env->features[FEAT_XSAVE_COMP_HI] = (mask >> 32) &
+        x86_cpu_get_supported_feature_word(FEAT_XSAVE_COMP_HI, cpu->migratable);
 }
 
 /***** Steps involved on loading and filtering CPUID data
-- 
2.18.4


