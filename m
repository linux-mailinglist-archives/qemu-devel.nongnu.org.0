Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BB56B26E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 07:52:52 +0200 (CEST)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9gv5-0007bT-8k
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 01:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9gsC-0004K4-C4
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 01:49:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:10706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o9gs7-0003nV-0C
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 01:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657259387; x=1688795387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NdUhA1O6O1Z2RaZYimsQNzqQner3jQzdbsCVIT6Dhrk=;
 b=StKZIuIw0WEH7vuE8MCBV/2iQQXffcgEDDC5u8aygvSMHGAdWdgx6UFH
 ZqHy1hamonX++/qrVZn65/rDMe2lecbmEBIOVL9jvwvmfPbC6T6Acrtm0
 4kxXXvO3hnSdescMTDBv9p9066drxUYM0rbTZivFwHsMHC1z1oBnYeo4y
 F7kUyQAKn0QkT/gUq5ioquAGTUFVo8HCCsJdgyGmN4Ajt3tRWIO7di1zT
 LcMvVvVKJiRyV87b4SheR2W8iutd6gosDLhI39iyYeoUCmFs+c7S3/q7D
 ONpF42OGcRaieTIwJ0idtsCBaEEPpwvx0G6MOqIlgm01814ckbAco9z7L g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="370511158"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="370511158"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 22:49:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="651432904"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 22:49:27 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH] target/i386: Fix CPU feature dependency check
Date: Fri,  8 Jul 2022 13:42:27 +0800
Message-Id: <20220708054227.195038-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=zhenzhong.duan@intel.com; helo=mga05.intel.com
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

While in other call site "x-force-features" takes effect to keep
the CPU feature even though not supported for any reason.

This isn't consistent while expanding features, Fixed to keep user
explicitly enabled features if "x-force-features" is specified.

Fixes: 99e24dbdaa682 ("target/i386: introduce generic feature dependency mechanism")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 target/i386/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af86..b64c0b37f0cb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6206,6 +6206,9 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
                                       unavailable_features & env->user_features[d->to.index],
                                       "This feature depends on other features that were not requested");
 
+            if (cpu->force_features) {
+                unavailable_features &= ~env->user_features[d->to.index];
+            }
             env->features[d->to.index] &= ~unavailable_features;
         }
     }
-- 
2.25.1


