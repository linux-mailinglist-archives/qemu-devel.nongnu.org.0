Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC48687967
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW8c-0007Op-GX; Thu, 02 Feb 2023 04:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8Y-0007Ft-7i
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:44:10 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8W-0006ND-Gc
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:44:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675331048; x=1706867048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2l32Mxk3IIptSYvwOMjSG7Mq4ltZJOLf/uBlKfJWe8=;
 b=ekTLezDOi1ylxPQ0Cogp/U5t+W6fftRy2AUjupN68nKZ1aYeQt7d2khh
 dLxx7FgehJ4Kq89B8i4r9Va2JsAjx9sqIVTvAk0eZrHwUQaaTbJY72WKe
 SaxAqPkfhjucAI5gVbQRr86E2wv+jT+Dmb4gurVZU9dVSX5OLHxBaM5JW
 nLlzZvhuBMf47XItIHQAcOM+4S8DEUJpyNW8L79OtLD6yyXV0B/W+GnHs
 cXmil9HBZ7K33NWxsJ4f2ntKvNw1JB6ZWDFFxjqKrQOP//9LVVaOsqzLo
 dz3bXyGYT3oPCvFTjMWSm8S1SR722Br/97t3hy3fhZ4h8qzRo22I9DAAD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316402185"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316402185"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807909505"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807909505"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:42:43 -0800
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
Subject: [PATCH 18/18] i386: Add new property to control L2 cache topo in
 CPUID.04H
Date: Thu,  2 Feb 2023 17:49:29 +0800
Message-Id: <20230202094929.343799-19-zhao1.liu@linux.intel.com>
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

The property x-l2-cache-topo will be used to change the L2 cache
topology in CPUID.04H.

Now it allows user to set the L2 cache is shared in core level or
cluster level.

If user passes "-cpu x-l2-cache-topo=[core|cluster]" then older L2 cache
topology will be overrided by the new topology setting.

Here we expose to user "cluster" instead of "module", to be consistent
with "cluster-id" naming.

Since CPUID.04H is used by intel CPUs, this property is available on
intel CPUs as for now.

When necessary, it can be extended to CPUID.8000001DH for amd CPUs.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 33 ++++++++++++++++++++++++++++++++-
 target/i386/cpu.h |  2 ++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5816dc99b1d4..cf84c720a431 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -240,12 +240,15 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
     case CORE:
         num_ids = 1 << apicid_core_offset(topo_info);
         break;
+    case MODULE:
+        num_ids = 1 << apicid_module_offset(topo_info);
+        break;
     case DIE:
         num_ids = 1 << apicid_die_offset(topo_info);
         break;
     default:
         /*
-         * Currently there is no use case for SMT, MODULE and PACKAGE, so use
+         * Currently there is no use case for SMT and PACKAGE, so use
          * assert directly to facilitate debugging.
          */
         g_assert_not_reached();
@@ -6633,6 +6636,33 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         env->cache_info_amd.l3_cache = &legacy_l3_cache;
     }
 
+    if (cpu->l2_cache_topo_level) {
+        /*
+         * FIXME: Currently only supports changing CPUID[4] (for intel), and
+         * will support changing CPUID[0x8000001D] when necessary.
+         */
+        if (!IS_INTEL_CPU(env)) {
+            error_setg(errp, "only intel cpus supports x-l2-cache-topo");
+            return;
+        }
+
+        if (!strcmp(cpu->l2_cache_topo_level, "core")) {
+            env->cache_info_cpuid4.l2_cache->share_level = CORE;
+        } else if (!strcmp(cpu->l2_cache_topo_level, "cluster")) {
+            /*
+             * We expose to users "cluster" instead of "module", to be
+             * consistent with "cluster-id" naming.
+             */
+            env->cache_info_cpuid4.l2_cache->share_level = MODULE;
+        } else {
+            error_setg(errp,
+                       "x-l2-cache-topo doesn't support '%s', "
+                       "and it only supports 'core' or 'cluster'",
+                       cpu->l2_cache_topo_level);
+            return;
+        }
+    }
+
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
@@ -7135,6 +7165,7 @@ static Property x86_cpu_properties[] = {
                      false),
     DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
                      true),
+    DEFINE_PROP_STRING("x-l2-cache-topo", X86CPU, l2_cache_topo_level),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5a955431f759..aa7e96c586c7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1987,6 +1987,8 @@ struct ArchCPU {
     int32_t thread_id;
 
     int32_t hv_max_vps;
+
+    char *l2_cache_topo_level;
 };
 
 
-- 
2.34.1


