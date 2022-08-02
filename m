Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F175878D5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:17:10 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIn5R-0002Pf-K1
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIme8-0004vb-Cs
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:8273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdv-0005iP-GQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426523; x=1690962523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIrbt0K0dZjL5+1k1Whs2xRyo3TLN6tC8REasyeLtk0=;
 b=X6ZkOx/tqxJ5r0J0tH8Tan+bO1i7RmpBHxsjl11bbEN7g58OraZ76NsY
 1dDMVSWdXlB1wcrUjbXCBmXabvaRRhsf+zj3JF78pXj7u4+fbO1B9Qu5w
 B1PUO8UcSX3z0FNFGN/GVJ5zd5BohP/w2JdjKVxabEoIOeUvgjACz6NF8
 YY33goR+qbRuB7u2S0sXFMalnr/QLjAgtxX+cmF1dL7qhk6eYdV4DDxH3
 EDfrfyOcupmPf/tRnPryE4vculW9CFafhRGXxT32oMdsgTgfsAbRDcnxI
 DCP2aRNXx1GvMOqxClK8G5O9F+1bCmu2ikNm4KXLw/v6SI6txLX62gMQs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908533"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908533"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603942"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:38 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [PATCH v1 11/40] i386/tdx: Integrate tdx_caps->attrs_fixed0/1 to
 tdx_cpuid_lookup
Date: Tue,  2 Aug 2022 15:47:21 +0800
Message-Id: <20220802074750.2581308-12-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some bits in TD attributes have corresponding CPUID feature bits. Reflect
the fixed0/1 restriction on TD attributes to their corresponding CPUID
bits in tdx_cpuid_lookup[] as well.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/cpu-internal.h |  9 +++++++++
 target/i386/cpu.c          |  9 ---------
 target/i386/cpu.h          |  2 ++
 target/i386/kvm/tdx.c      | 21 +++++++++++++++++++++
 4 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 9baac5c0b450..e980f6e3147f 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -20,6 +20,15 @@
 #ifndef I386_CPU_INTERNAL_H
 #define I386_CPU_INTERNAL_H
 
+typedef struct FeatureMask {
+    FeatureWord index;
+    uint64_t mask;
+} FeatureMask;
+
+typedef struct FeatureDep {
+    FeatureMask from, to;
+} FeatureDep;
+
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
    MSR_FEATURE_WORD,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 45652bb2fd7c..e5c1ffcb138a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1289,15 +1289,6 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     },
 };
 
-typedef struct FeatureMask {
-    FeatureWord index;
-    uint64_t mask;
-} FeatureMask;
-
-typedef struct FeatureDep {
-    FeatureMask from, to;
-} FeatureDep;
-
 static FeatureDep feature_dependencies[] = {
     {
         .from = { FEAT_7_0_EDX,             CPUID_7_0_EDX_ARCH_CAPABILITIES },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 90f403aecd8b..8f4de62b02e9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -867,6 +867,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_0_ECX_MAWAU             (31U << 17)
 /* Read Processor ID */
 #define CPUID_7_0_ECX_RDPID             (1U << 22)
+/* KeyLocker */
+#define CPUID_7_0_ECX_KeyLocker         (1U << 23)
 /* Bus Lock Debug Exception */
 #define CPUID_7_0_ECX_BUS_LOCK_DETECT   (1U << 24)
 /* Cache Line Demote Instruction */
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index dffaa533f899..6fe47cf4e29e 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -30,6 +30,13 @@
                                      (1U << KVM_FEATURE_PV_SCHED_YIELD) | \
                                      (1U << KVM_FEATURE_MSI_EXT_DEST_ID))
 
+#define TDX_ATTRIBUTES_MAX_BITS      64
+
+static FeatureMask tdx_attrs_ctrl_fields[TDX_ATTRIBUTES_MAX_BITS] = {
+    [30] = { .index = FEAT_7_0_ECX, .mask = CPUID_7_0_ECX_PKS },
+    [31] = { .index = FEAT_7_0_ECX, .mask = CPUID_7_0_ECX_KeyLocker},
+};
+
 typedef struct KvmTdxCpuidLookup {
     uint32_t tdx_fixed0;
     uint32_t tdx_fixed1;
@@ -375,6 +382,8 @@ static void update_tdx_cpuid_lookup_by_tdx_caps(void)
     FeatureWordInfo *fi;
     uint32_t config;
     FeatureWord w;
+    FeatureMask *fm;
+    int i;
 
     /*
      * Patch tdx_fixed0/1 by tdx_caps that what TDX module reports as
@@ -396,6 +405,18 @@ static void update_tdx_cpuid_lookup_by_tdx_caps(void)
         entry->tdx_fixed1 &= ~config;
     }
 
+    for (i = 0; i < ARRAY_SIZE(tdx_attrs_ctrl_fields); i++) {
+        fm = &tdx_attrs_ctrl_fields[i];
+
+        if (tdx_caps->attrs_fixed0 & (1ULL << i)) {
+            tdx_cpuid_lookup[fm->index].tdx_fixed0 |= fm->mask;
+        }
+
+        if (tdx_caps->attrs_fixed1 & (1ULL << i)) {
+            tdx_cpuid_lookup[fm->index].tdx_fixed1 |= fm->mask;
+        }
+    }
+
     /*
      * Because KVM gets XFAM settings via CPUID leaves 0xD,  map
      * tdx_caps->xfam_fixed{0, 1} into tdx_cpuid_lookup[].tdx_fixed{0, 1}.
-- 
2.27.0


