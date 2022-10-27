Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74760EDC2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:06:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsCz-0001ej-F4; Wed, 26 Oct 2022 22:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCd-0001Xv-Q3
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:07 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCb-0004sz-MT
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836061; x=1698372061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r90dV8iF2ORg/n2SN9spjUCoFBK8wGi5ozVritK4IwE=;
 b=hNQknoUvHuV6BbCZpG6ffqXITX9HqrDI53x8FyePXt2AVp8Zm4Go+BUx
 B1x/4FAwVg04QCRkX2qmyd9obb+bRxRbABVdF3g/hRqHX8Y9688/DikGS
 i4Y8XzzCfO5zewlGXNxDVl0wnQDFF4ihTDuFTVwvHi5DVFO64nMukXBSA
 x2inF7ag+Z1shtrGFsAxUbCgeoQXnu5o+08u3c1ae2u/qOEOl97ytRvty
 FOmGWsbLvcmB0QTJZiS2YdBk1aUvswlIZ1U2NDxO90x7jpdI8cTVjOpaw
 csRJOYK5bc8U0pPUC8ztgL+EahRPxfAP8Jok+RIrmpjuGXff8eusI59WC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370174871"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370174871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877407935"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="877407935"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:37 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH 3/6] i386: Introduce new struct "MultiBitFeatureInfo" for
 multi-bit features
Date: Wed, 26 Oct 2022 19:00:33 -0700
Message-Id: <20221027020036.373140-4-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027020036.373140-1-lei4.wang@intel.com>
References: <20221027020036.373140-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some features use multiple CPUID bits to form a value to be used, e.g.,
CPUID(0x1E,0):EBX[23:08] is regarded as the tmul_maxn value for AMX.
Introduce a new struct "MultiBitFeatureInfo" to hold the information for
those features and create a corresponding member in struct FeatureWordInfo,
so that the infomation can be assigned for each item in feature_word_info
array and used in the future.

Signed-off-by: Wang, Lei <lei4.wang@intel.com>
---
 target/i386/cpu-internal.h |  9 +++++++
 target/i386/cpu.c          | 54 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 9baac5c0b4..66b3d66cb4 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -25,6 +25,13 @@ typedef enum FeatureWordType {
    MSR_FEATURE_WORD,
 } FeatureWordType;
 
+typedef struct MultiBitFeatureInfo {
+    const char *feat_name;
+    uint64_t mask;
+    unsigned high_bit_position;
+    unsigned low_bit_position;
+} MultiBitFeatureInfo;
+
 typedef struct FeatureWordInfo {
     FeatureWordType type;
     /* feature flags names are taken from "Intel Processor Identification and
@@ -51,6 +58,8 @@ typedef struct FeatureWordInfo {
     uint64_t migratable_flags; /* Feature flags known to be migratable */
     /* Features that shouldn't be auto-enabled by "-cpu host" */
     uint64_t no_autoenable_flags;
+    unsigned num_multi_bit_features;
+    MultiBitFeatureInfo *multi_bit_features;
 } FeatureWordInfo;
 
 extern FeatureWordInfo feature_word_info[];
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0083a2a7f7..7ae232ab18 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1011,6 +1011,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .migratable_flags = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK |
             CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
+        .num_multi_bit_features = 2,
+        .multi_bit_features = (MultiBitFeatureInfo[]){
+            {
+                .feat_name = "total_tile_bytes",
+                .mask = CPUID_AMX_PALETTE_1_TOTAL_TILE_BYTES_MASK,
+                .high_bit_position = 15,
+                .low_bit_position = 0,
+            },
+            {
+                .feat_name = "bytes_per_tile",
+                .mask = CPUID_AMX_PALETTE_1_BYTES_PER_TILE_MASK,
+                .high_bit_position = 31,
+                .low_bit_position = 16,
+            },
+        },
     },
     [FEAT_1D_1_EBX] = {
         .type = CPUID_FEATURE_WORD,
@@ -1021,6 +1036,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .migratable_flags = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK |
             CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
+        .num_multi_bit_features = 2,
+        .multi_bit_features = (MultiBitFeatureInfo[]){
+            {
+                .feat_name = "bytes_per_row",
+                .mask = CPUID_AMX_PALETTE_1_BYTES_PER_ROW_MASK,
+                .high_bit_position = 15,
+                .low_bit_position = 0,
+            },
+            {
+                .feat_name = "max_names",
+                .mask = CPUID_AMX_PALETTE_1_MAX_NAMES_MASK,
+                .high_bit_position = 31,
+                .low_bit_position = 16,
+            },
+        },
     },
     [FEAT_1D_1_ECX] = {
         .type = CPUID_FEATURE_WORD,
@@ -1030,6 +1060,15 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             .reg = R_ECX,
         },
         .migratable_flags = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
+        .num_multi_bit_features = 1,
+        .multi_bit_features = (MultiBitFeatureInfo[]){
+            {
+                .feat_name = "max_rows",
+                .mask = CPUID_AMX_PALETTE_1_MAX_ROWS_MASK,
+                .high_bit_position = 15,
+                .low_bit_position = 0,
+            },
+        },
     },
     [FEAT_1E_0_EBX] = {
         .type = CPUID_FEATURE_WORD,
@@ -1040,6 +1079,21 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .migratable_flags = CPUID_AMX_TMUL_MAX_K_MASK |
             CPUID_AMX_TMUL_MAX_N_MASK,
+        .num_multi_bit_features = 2,
+        .multi_bit_features = (MultiBitFeatureInfo[]){
+            {
+                .feat_name = "tmul_maxk",
+                .mask = CPUID_AMX_TMUL_MAX_K_MASK,
+                .high_bit_position = 7,
+                .low_bit_position = 0,
+            },
+            {
+                .feat_name = "tmul_maxn",
+                .mask = CPUID_AMX_TMUL_MAX_N_MASK,
+                .high_bit_position = 23,
+                .low_bit_position = 8,
+            },
+        },
     },
     /*Below are MSR exposed features*/
     [FEAT_ARCH_CAPABILITIES] = {
-- 
2.34.1


