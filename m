Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652C36F5D5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:44:16 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMsp-0003YR-9w
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMeS-0004jo-BI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:29:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:63436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMeD-00015T-H7
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:29:23 -0400
IronPort-SDR: J5a1YhP7piI8eKCdzQGbgqJdiseBni0DW/ZhVxiBUWC6hD3vmEUraOTcl4phFMIWWZBRJ88rVJ
 KZc1eM23Qogg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023081"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023081"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:42 -0700
IronPort-SDR: wLMUSFWh3HJU7TZ7ZHk8GTp95KKPWI+OZE6QMfTTwUkIOLSsMgSZC1Y6BsXZM56ImOICKUe+Ia
 PDsbBdmEGnEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258526"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:40 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 16/32] Adjust min CPUID level to 0x12 when SGX is
 enabled
Date: Fri, 30 Apr 2021 14:24:39 +0800
Message-Id: <20210430062455.8117-17-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

SGX capabilities are enumerated through CPUID_0x12.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 63253bf606..41050960c5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6741,6 +6741,11 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
         if (sev_enabled()) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
         }
+
+        /* SGX requires CPUID[0x12] for EPC enumeration */
+        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
+        }
     }
 
     /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly set */
-- 
2.29.2.334.gfaefdd61ec


