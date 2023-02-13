Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E41694217
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQA-0002cr-E8; Mon, 13 Feb 2023 04:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPk-0001l1-Ia
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:31 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPf-0002kj-PC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281579; x=1707817579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5+JkmJpYyAZqtdH+tgxoCBevOh3N4l65uAIL4mUOyM=;
 b=cP9qFmYD6zVwYSAFps5rkqzvsIfO+5M0iU1v26BAfcQCVShMqvo+z02y
 BDwWgABKgRJKoM3qn2B//2cWGUgTFloVBP13FXuwrI6NahiuAfw39XMAv
 d++WOhGuWlTdiIzrzjH44pgnI1DMh1p2QoilK/SF1vYnxVCOFG6Ov6YGu
 10k5e3cN8mzufvYs5Sj+cfkVULmZvlIjepTTFbCYtj3prmYkqs4a5m2vF
 xVJVNIMxVrM/Ts1ritNrD5k9Z3+toDvqNmsMs1x2obgWb9fqpGhp4TVwz
 n2oNhGr3wvHDQl1Z6BAPvtsXwwbUJ+fPGP4jJiFDvsCjEtsmgRuU+BLlO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487099"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487099"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760638"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760638"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:34 -0800
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
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 39/52] i386/cpu: Add Intel hybrid related CPUID support
Date: Mon, 13 Feb 2023 17:50:22 +0800
Message-Id: <20230213095035.158240-40-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

For hybrid cpu topology, Intel exposes these CPUIDs [1]:
1. Set CPUID.07H.0H:EDX.Hybrid[bit 15]. With setting as 1, the processor
   is identified as a hybrid part.
2. Have CPUID.1AH leaf. Set core type and native model ID in
   CPUID.1AH:EAX. Because the native model ID is currently useless for
   the software, no need to emulate.

For hybrid related CPUIDs, especially CPUID.07H.0H:EDX.Hybrid[bit 15],
there's no need to expose this feature in feature_word_info[] to allow
user to set directly, because hybrid features depend on the specific
core type information, and this information needs to be gathered
together with hybrid cpu topology.

[1]: SDM, vol.2, Ch.3, 3.2 Instructions (A-L), CPUID-CPU Identification

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 266e981b79e2..a0aaaf996222 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -620,6 +620,10 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_AMX_TMUL_MAX_K           0x10
 #define INTEL_AMX_TMUL_MAX_N           0x40
 
+/* CPUID Leaf 0x1A constants: */
+#define INTEL_HYBRID_TYPE_ATOM         0x20
+#define INTEL_HYBRID_TYPE_CORE         0x40
+
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
 {
@@ -5416,6 +5420,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             }
             *edx = env->features[FEAT_7_0_EDX]; /* Feature flags */
 
+            if (env->hybrid_core_type != INVALID_HYBRID_TYPE &&
+                (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+                *edx |= CPUID_7_0_EDX_HYBRID;
+            }
+
             /*
              * SGX cannot be emulated in software.  If hardware does not
              * support enabling SGX and/or SGX flexible launch control,
@@ -5671,6 +5680,31 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         break;
     }
+    case 0x1A:
+        /* Hybrid Information Enumeration */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (env->hybrid_core_type != INVALID_HYBRID_TYPE &&
+            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+            /*
+             * CPUID.1AH:EAX.[bits 23-0] indicates "native model ID of the
+             * core". Since this field currently is useless for software,
+             * no need to emulate.
+             */
+            switch (env->hybrid_core_type) {
+            case INTEL_ATOM_TYPE:
+                *eax = INTEL_HYBRID_TYPE_ATOM << 24;
+                break;
+            case INTEL_CORE_TYPE:
+                *eax = INTEL_HYBRID_TYPE_CORE << 24;
+                break;
+            default:
+                abort();
+            }
+        }
+        break;
     case 0x1D: {
         /* AMX TILE */
         *eax = 0;
@@ -6314,6 +6348,15 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             }
         }
 
+        /*
+         * Intel CPU topology with hybrid cores support requires CPUID.1AH.
+         * And CPUID.07H.0H:EDX.Hybrid[bit 15] is also required.
+         */
+        if (env->hybrid_core_type != INVALID_HYBRID_TYPE &&
+            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1A);
+        }
+
         /*
          * Intel CPU topology with multi-dies support requires CPUID[0x1F].
          * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should detect
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bb4e370f9768..8fd7b0c55ae8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -877,6 +877,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_0_EDX_AVX512_VP2INTERSECT (1U << 8)
 /* SERIALIZE instruction */
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
+/* Hybrid */
+#define CPUID_7_0_EDX_HYBRID            (1U << 15)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* Architectural LBRs */
-- 
2.34.1


