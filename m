Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56731C57D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:25:41 +0100 (CET)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq3Y-0001Vo-Gg
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptH-00065W-TC
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:03 -0500
Received: from mga17.intel.com ([192.55.52.151]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptE-0001ZH-Q2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:03 -0500
IronPort-SDR: DU8o4fwwipfn1L/wDgBZPPls6AG7XocW6qynuO18VbHYQ8/aKFNs4rn3EjCikaUIv6eVfnrXl5
 /RjsWKgIKSUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558744"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558744"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:50 -0800
IronPort-SDR: BJ3gNTgiWLJnlFPV3wYnA31/SdKC5ZlJvs2lJHh+FIN+u4RmZgSORWxYKOdFF/KvHziTN38xa7
 fSJ9YSdH/zJg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705383"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:50 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 01/23] target/i386: Expose
 x86_cpu_get_supported_feature_word() for TDX
Date: Mon, 15 Feb 2021 18:12:57 -0800
Message-Id: <c77664a9e03d53ed870635064551caa663b3dfc4.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Expose x86_cpu_get_supported_feature_word() outside of cpu.c so that it
can be used by TDX to setup the VM-wide CPUID configuration.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c3d2d60b7..578e1fe25f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5043,8 +5043,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     return cpu_list;
 }
 
-static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
-                                                   bool migratable_only)
+uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
+                                            bool migratable_only)
 {
     FeatureWordInfo *wi = &feature_word_info[w];
     uint64_t r = 0;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8d599bb5b8..7274e8d1b4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1815,6 +1815,9 @@ void cpu_set_ignne(void);
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
 
+uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
+                                            bool migratable_only);
+
 /* this function must always be used to load data in the segment
    cache: it synchronizes the hflags with the segment cache values */
 static inline void cpu_x86_load_seg_cache(CPUX86State *env,
-- 
2.17.1


