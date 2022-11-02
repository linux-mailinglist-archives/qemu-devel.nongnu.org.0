Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A746615E73
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:55:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9V6-0005QV-Pk; Wed, 02 Nov 2022 04:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Ux-0005OJ-I1
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:24 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oq9Uv-0008AD-QB
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667379201; x=1698915201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r90dV8iF2ORg/n2SN9spjUCoFBK8wGi5ozVritK4IwE=;
 b=DhLjhAsciE5qastxmHzIxfpyEPLwi8+puV1eZ4AXyY8dpTACfPKdZIuQ
 mvOevYBu1k+YEFKVYtWkbq/do1kJNKKdJIt3p5/bszQQT+qjinz4d/fe2
 Z3kTuAC0Cqhiks5b/UZaJHrcSOllciVBXp+ppYIoZMCYsRj+s6Gp6zOTL
 /gX+tyynL7mEBLOpIT8hQRaSBaPY9EFpBM5S24tXXkz8i8JXlZTDnA5bI
 kZZtTnZNrWwHZHmWTJ4kptuyd98zKONjG50czx6DV/LKIF7yfcnf1c8qz
 4L9z4gKoKdOvkNA0F0t0CSAoa9uqTAPqF/MrlbF+knf2l+D5CpDLV+l2G A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308072277"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="308072277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:58 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963447219"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="963447219"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 01:52:58 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH v2 3/6] i386: Introduce new struct "MultiBitFeatureInfo" for
 multi-bit features
Date: Wed,  2 Nov 2022 01:52:53 -0700
Message-Id: <20221102085256.81139-4-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102085256.81139-1-lei4.wang@intel.com>
References: <20221102085256.81139-1-lei4.wang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=lei4.wang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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


