Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D87E21DEF8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 19:46:09 +0200 (CEST)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv2Wm-0008Vu-Dc
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 13:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jv2Vb-0007Xi-6L
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:44:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:22540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jv2VZ-0006H5-L6
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:44:54 -0400
IronPort-SDR: VdpbSh94qc86LbhMnGPOwSi8LVbLxH+WtF9BXXuM6RAagJwC+Zz6+fiZuzhViVjOc9JkDuDcdc
 ihCqTboeAwBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="128255221"
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="128255221"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 10:44:42 -0700
IronPort-SDR: Mid/vTm4r0/SC53IQ1ely7ARftn2DMgoMt9gdDmXy0Up1EKiHsMBweBNsb8aKim1iC9jIVH352
 IBkCPiOhz90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="317450488"
Received: from lxy-dell.sh.intel.com ([10.239.159.21])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2020 10:44:40 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/2] i368/cpu: Clear env->user_features after loading
 versioned CPU model
Date: Tue, 14 Jul 2020 01:44:35 +0800
Message-Id: <20200713174436.41070-2-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200713174436.41070-1-xiaoyao.li@intel.com>
References: <20200713174436.41070-1-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 13:44:48
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Chenyi Qiang <chenyi.qiang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Features defined in versioned CPU model are recorded in env->user_features
since they are updated as property. It's unwated because they are not
user specified.

Simply clear env->user_features as a fix. It won't clear user specified
features because user specified features are filled to
env->user_features later in x86_cpu_expand_features().

Cc: Chenyi Qiang <chenyi.qiang@intel.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1e5123251d74..9812d5747f35 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5159,6 +5159,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
 
     x86_cpu_apply_version_props(cpu, model);
+
+    /* Properties in versioned CPU model are not user specified features.
+     * We can simply clear env->user_features here since it will be filled later
+     * in x86_cpu_expand_features() based on plus_features and minus_features.
+     */
+    memset(&env->user_features, 0, sizeof(env->user_features));
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.18.4


