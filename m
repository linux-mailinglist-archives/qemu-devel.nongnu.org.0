Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9911E646920
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ALl-0000iZ-L0; Thu, 08 Dec 2022 01:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALX-0000hZ-9m
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:28 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p3ALU-0005MN-S6
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670480724; x=1702016724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8LA9vVA0WKBbYhT4If4VLWUJUlVJA5e/5pnoBEZ5hY=;
 b=cxymbuI3j80vY6C1hxklR50twxI+HIWtW+zwy1yhVefVQXGKnXIYpzt3
 cuIQN3CWryJrc6qzVF+iOjHLWIUlyOnixJETqS/632qaH/0bJzZ+zkIYA
 VKAVPLPe16TQ+vos5nq72UeoYDomT3pIL08ZwVIRjA2nqLuj+t34un6yb
 wIoLMB7HTgkMNLEIYftHEEFF1tqyirFi3qbrkB3yT8QWCJZm+Je60G9T0
 /sr4+gjWyOjwSgtQABZ4GxxnfEPsvpmmUGw7Rna61KFUQtEkMQZ/YpYEL
 OVWvHyRdnm7d33h8cXpUMSW0u8uRE20KQsgCbf470zsYJtUMzXDLvUJyZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297444445"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="297444445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 22:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="679413383"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="679413383"
Received: from lxy-dell.sh.intel.com ([10.239.48.100])
 by orsmga001.jf.intel.com with ESMTP; 07 Dec 2022 22:25:15 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	xiaoyao.li@intel.com
Subject: [PATCH v3 1/8] target/i386: Print CPUID subleaf info for unsupported
 feature
Date: Thu,  8 Dec 2022 14:25:06 +0800
Message-Id: <20221208062513.2589476-2-xiaoyao.li@intel.com>
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

Some CPUID leaves have meaningful subleaf index. Print the subleaf info
in feature_word_description for CPUID features.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37dd..8d95202f6a42 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4244,8 +4244,9 @@ static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
         {
             const char *reg = get_register_name_32(f->cpuid.reg);
             assert(reg);
-            return g_strdup_printf("CPUID.%02XH:%s",
-                                   f->cpuid.eax, reg);
+            return g_strdup_printf("CPUID.%02XH_%02XH:%s",
+                                   f->cpuid.eax,
+                                   f->cpuid.needs_ecx ? f->cpuid.ecx : 0, reg);
         }
     case MSR_FEATURE_WORD:
         return g_strdup_printf("MSR(%02XH)",
-- 
2.27.0


