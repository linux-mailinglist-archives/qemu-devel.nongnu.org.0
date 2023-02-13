Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17D7694149
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:34:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVBJ-0007h8-HM; Mon, 13 Feb 2023 04:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVAA-0006mD-8X
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:30:21 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVA0-0006ms-Sv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676280608; x=1707816608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cy4+98KPu3JM0FYdIqdy+k8SAFPj3EZM5g5RLHeoHLc=;
 b=ca3chaQElRUCuXy9kKSWIojixmed8AyzHlyaxHbUUeWQUEgVGPQTF5d0
 oWFhKAzNvThy+rVYXtn51M86nomkOhuWt8G6APN/yV0CAj46lWgoIxpW6
 jMO3DcjarYk9smRY53xARaE2bzTH4X+d4JXJIMTaw8V53s8Vj3I9jolPJ
 HwDMr+TWlB79dk5Odbqt61j1rWVvS8S5hii6mCI5vSIuCAcQDzGN4l42i
 IljcrW71TxPUT4Qz7yeKbtJn3iuYzMLz0rucgDq86CNXitNSsr/s970Ls
 OB19k+1PFBp6GY1mDm8sP11zUnHBORW/mVkmMQ/934zWS0Zc2Tcu2qldy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318875848"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="318875848"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:30:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792660439"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="792660439"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 01:30:00 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH RESEND 16/18] i386: Fix NumSharingCache for
 CPUID[0x8000001D].EAX[bits 25:14]
Date: Mon, 13 Feb 2023 17:36:23 +0800
Message-Id: <20230213093625.158170-17-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

From AMD's APM, NumSharingCache (CPUID[0x8000001D].EAX[bits 25:14])
means [1]:

The number of logical processors sharing this cache is the value of
this field incremented by 1. To determine which logical processors are
sharing a cache, determine a Share Id for each processor as follows:

ShareId = LocalApicId >> log2(NumSharingCache+1)

Logical processors with the same ShareId then share a cache. If
NumSharingCache+1 is not a power of two, round it up to the next power
of two.

From the description above, the caculation of this feild should be same
as CPUID[4].EAX[bits 25:14] for intel cpus. So also use the offsets of
APIC ID to caculate this field.

Note: I don't have the hardware available, hope someone can help me to
confirm whether this calculation is correct, thanks!

[1]: APM, vol.3, appendix.E.4.15 Function 8000_001Dh--Cache Topology
     Information

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 96ef96860604..d691c02e3c06 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -355,7 +355,7 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
                                        uint32_t *eax, uint32_t *ebx,
                                        uint32_t *ecx, uint32_t *edx)
 {
-    uint32_t l3_threads;
+    uint32_t sharing_apic_ids;
     assert(cache->size == cache->line_size * cache->associativity *
                           cache->partitions * cache->sets);
 
@@ -364,13 +364,11 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
 
     /* L3 is shared among multiple cores */
     if (cache->level == 3) {
-        l3_threads = topo_info->modules_per_die *
-                     topo_info->cores_per_module *
-                     topo_info->threads_per_core;
-        *eax |= (l3_threads - 1) << 14;
+        sharing_apic_ids = 1 << apicid_die_offset(topo_info);
     } else {
-        *eax |= ((topo_info->threads_per_core - 1) << 14);
+        sharing_apic_ids = 1 << apicid_core_offset(topo_info);
     }
+    *eax |= (sharing_apic_ids - 1) << 14;
 
     assert(cache->line_size > 0);
     assert(cache->partitions > 0);
-- 
2.34.1


