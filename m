Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC3221E1E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 10:22:18 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvz9k-0004UY-Hv
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 04:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jvz85-0002p3-L0
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:20:33 -0400
Received: from mga06.intel.com ([134.134.136.31]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jvz83-0000Hh-Nx
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 04:20:33 -0400
IronPort-SDR: 1ObO1bXvFmHof383yI7zaM/A7YuqvqP1dPszPftm7YYAArmU0ARQF50zfICIQ4KK6pkjX0S/pP
 9afJFoa+gY0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="210871089"
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="210871089"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 01:20:27 -0700
IronPort-SDR: 1N7LCXM+bfDWOvADM/qwYmGdTkP85zTcUZLCxuo/Ro/+ZplEJPB06VIN/s3O8sYhk1aXnvefUU
 bwKiIM+/ubVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,358,1589266800"; d="scan'208";a="286403894"
Received: from lxy-dell.sh.intel.com ([10.239.159.21])
 by orsmga006.jf.intel.com with ESMTP; 16 Jul 2020 01:20:23 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 1/2] i386/cpu: Clear FEAT_XSAVE_COMP_{LO,
 HI} when XSAVE is not available
Date: Thu, 16 Jul 2020 16:20:18 +0800
Message-Id: <20200716082019.215316-2-xiaoyao.li@intel.com>
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

Per Intel SDM vol 1, 13.2, if CPUID.1:ECX.XSAVE[bit 26] is 0, the
processor provides no further enumeration through CPUID function 0DH.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1e5123251d74..f5f11603e805 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6261,6 +6261,8 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
     uint64_t mask;
 
     if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
+        env->features[FEAT_XSAVE_COMP_LO] = 0;
+        env->features[FEAT_XSAVE_COMP_HI] = 0;
         return;
     }
 
-- 
2.18.4


