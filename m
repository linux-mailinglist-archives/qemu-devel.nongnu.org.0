Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7A687968
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW8O-0006tR-AY; Thu, 02 Feb 2023 04:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8L-0006oP-Vr
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:58 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8K-0006Pg-9B
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675331036; x=1706867036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wy/HB9PCBo5jKGh1Soirwp+UxznN/hgvoS723fwEbJU=;
 b=mXEve/jgnUrWFxbAcpXOKhxEmMIewXvou2uVJH76dujlv6NEO0yY09OW
 76D5kvCjkx2ucU4mysR45dy8lYTqE6uMjb+pNGjZ2Md8D3kc17KxKFz8/
 DpTe3igxE7YvFFM0EzHYwnk3FRR5kqJruzR9vD3MfdRAGBUogXD3rGrZw
 gfLKccpo6WcZnLJrtyLGXDdnJOe/9MN6Ry4Wtmfz1F6/awguTVTU/v54u
 xPr5UcimwWduhQpnGuf9ZbAPAgZr8bz+m6TecL3i7jGxlaeIRq38MmZZm
 UwzkrSgZVPsMLuNgN5xBj+qeH/GN1qmqTjHN2CXaWt0B0Wpet8jcCHfBc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316402146"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316402146"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807909486"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807909486"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:42:36 -0800
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
Subject: [PATCH 15/18] i386: Use CPUCacheInfo.share_level to encode
 CPUID[4].EAX[bits 25:14]
Date: Thu,  2 Feb 2023 17:49:26 +0800
Message-Id: <20230202094929.343799-16-zhao1.liu@linux.intel.com>
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

CPUID[4].EAX[bits 25:14] is used to represent the cache topology for
intel CPUs.

After cache models have topology information, we can use
CPUCacheInfo.share_level to decide which topology level to be encoded
into CPUID[4].EAX[bits 25:14].

Additionally, since maximum_processor_id (original "num_apic_ids") is
parsed based on cpu topology levels, which are verified when parsing
smp, it's no need to check this value by "assert(num_apic_ids > 0)"
again, so remove this assert.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 55 +++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 19 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 364534e84b1b..96ef96860604 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -231,22 +231,50 @@ static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
                        ((t) == UNIFIED_CACHE) ? CACHE_TYPE_UNIFIED : \
                        0 /* Invalid value */)
 
+static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
+                                            X86CPUTopoInfo *topo_info)
+{
+    uint32_t num_ids = 0;
+
+    switch (cache->share_level) {
+    case CORE:
+        num_ids = 1 << apicid_core_offset(topo_info);
+        break;
+    case DIE:
+        num_ids = 1 << apicid_die_offset(topo_info);
+        break;
+    default:
+        /*
+         * Currently there is no use case for SMT, MODULE and PACKAGE, so use
+         * assert directly to facilitate debugging.
+         */
+        g_assert_not_reached();
+    }
+
+    return num_ids - 1;
+}
+
+static uint32_t max_core_ids_in_package(X86CPUTopoInfo *topo_info)
+{
+    uint32_t num_cores = 1 << (apicid_pkg_offset(topo_info) -
+                               apicid_core_offset(topo_info));
+    return num_cores - 1;
+}
 
 /* Encode cache info for CPUID[4] */
 static void encode_cache_cpuid4(CPUCacheInfo *cache,
-                                int num_apic_ids, int num_cores,
+                                X86CPUTopoInfo *topo_info,
                                 uint32_t *eax, uint32_t *ebx,
                                 uint32_t *ecx, uint32_t *edx)
 {
     assert(cache->size == cache->line_size * cache->associativity *
                           cache->partitions * cache->sets);
 
-    assert(num_apic_ids > 0);
     *eax = CACHE_TYPE(cache->type) |
            CACHE_LEVEL(cache->level) |
            (cache->self_init ? CACHE_SELF_INIT_LEVEL : 0) |
-           ((num_cores - 1) << 26) |
-           ((num_apic_ids - 1) << 14);
+           (max_core_ids_in_package(topo_info) << 26) |
+           (max_processor_ids_for_cache(cache, topo_info) << 14);
 
     assert(cache->line_size > 0);
     assert(cache->partitions > 0);
@@ -5335,38 +5363,27 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = *ebx = *ecx = *edx = 0;
         } else {
             *eax = 0;
-            int addressable_cores_offset = apicid_pkg_offset(&topo_info) -
-                                           apicid_core_offset(&topo_info);
-            int core_offset, die_offset;
 
             switch (count) {
             case 0: /* L1 dcache info */
-                core_offset = apicid_core_offset(&topo_info);
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
-                                    (1 << core_offset),
-                                    (1 << addressable_cores_offset),
+                                    &topo_info,
                                     eax, ebx, ecx, edx);
                 break;
             case 1: /* L1 icache info */
-                core_offset = apicid_core_offset(&topo_info);
                 encode_cache_cpuid4(env->cache_info_cpuid4.l1i_cache,
-                                    (1 << core_offset),
-                                    (1 << addressable_cores_offset),
+                                    &topo_info,
                                     eax, ebx, ecx, edx);
                 break;
             case 2: /* L2 cache info */
-                core_offset = apicid_core_offset(&topo_info);
                 encode_cache_cpuid4(env->cache_info_cpuid4.l2_cache,
-                                    (1 << core_offset),
-                                    (1 << addressable_cores_offset),
+                                    &topo_info,
                                     eax, ebx, ecx, edx);
                 break;
             case 3: /* L3 cache info */
-                die_offset = apicid_die_offset(&topo_info);
                 if (cpu->enable_l3_cache) {
                     encode_cache_cpuid4(env->cache_info_cpuid4.l3_cache,
-                                        (1 << die_offset),
-                                        (1 << addressable_cores_offset),
+                                        &topo_info,
                                         eax, ebx, ecx, edx);
                     break;
                 }
-- 
2.34.1


