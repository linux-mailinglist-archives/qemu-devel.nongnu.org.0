Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D2687957
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW8P-0006uX-12; Thu, 02 Feb 2023 04:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8N-0006qw-7x
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:59 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8L-0006Of-0q
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675331037; x=1706867037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cy4+98KPu3JM0FYdIqdy+k8SAFPj3EZM5g5RLHeoHLc=;
 b=nvrsZyW6KyDadE6x88bXiMbMpP26OqqAzJhAp40OcTaJfhYV5ygU72/7
 3s9pMe1TZaHrEJHjyOaYIM3o0RKjSkEwKc+TKsakq3i/wwnqhtqxzv+Rc
 nhJqg4/4Z/UMqgDi2WpIOtKkFaaItrT1UWEg8yt6u0cFWYxGmsK9JjacW
 xMe7adfq2UPDlNUIwnsjjjMqOdQQc7PWH6TKtubZRjd0TYtSvM0vHFT4S
 6SLyhcbLTwmtsGoAHsA8kwbjuylcPBXlpRrFDuZCHU2Npnt1dQaasIXOZ
 1L01V/QSU+LGqamsrNo0Guhaur8ggW++9OsHGMhLi1dIXpfXiQNCINk9M w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316402155"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316402155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807909495"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807909495"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:42:38 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 16/18] i386: Fix NumSharingCache for
 CPUID[0x8000001D].EAX[bits 25:14]
Date: Thu,  2 Feb 2023 17:49:27 +0800
Message-Id: <20230202094929.343799-17-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202094929.343799-1-zhao1.liu@linux.intel.com>
References: <20230202094929.343799-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


