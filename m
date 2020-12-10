Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEDE2D6A96
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 23:49:02 +0100 (CET)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knUk9-0001qo-Iu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 17:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdu-0007hz-Vp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdn-0001sA-Kr
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607640145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YcznJt9lG+IXOdzL3mHkf2pUsDtQK+WVN/Kh97Dp0uw=;
 b=IcrLXjqbMEOtjT/AAT2TwoWtIKXvssAcAfcHyp+GPkdvG+WobjTGiNdBgIIdiOSFUH1W0F
 9shZY3TBmBs7rZMtBIj65LR7MLxZ72fQ6+2EfvccixEIbgf6fz5CnxRtUUQLP5b5XPqb9L
 066M6lZ6yR9Wz7apa3HFeuA3P3K1z6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-At9h46GbPGSjdLeCN0FQSQ-1; Thu, 10 Dec 2020 17:42:19 -0500
X-MC-Unique: At9h46GbPGSjdLeCN0FQSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9D28018A1;
 Thu, 10 Dec 2020 22:42:18 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2EBF6F920;
 Thu, 10 Dec 2020 22:42:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] i386/cpu: Make the Intel PT LIP feature configurable
Date: Thu, 10 Dec 2020 17:42:12 -0500
Message-Id: <20201210224212.2052368-4-ehabkost@redhat.com>
In-Reply-To: <20201210224212.2052368-1-ehabkost@redhat.com>
References: <20201210224212.2052368-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luwei Kang <luwei.kang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luwei Kang <luwei.kang@intel.com>

The current implementation will disable the guest Intel PT feature
if the Intel PT LIP feature is supported on the host, but the LIP
feature is comming soon(e.g. SnowRidge and later).

This patch will make the guest LIP feature configurable and Intel
PT feature can be enabled in guest when the guest LIP status same
with the host.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
Message-Id: <20201202101042.11967-1-luwei.kang@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h |  4 ++++
 target/i386/cpu.c | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 88e8586f8f..c4a49c06a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -541,6 +541,7 @@ typedef enum FeatureWord {
     FEAT_VMX_EPT_VPID_CAPS,
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
+    FEAT_14_0_ECX,
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -797,6 +798,9 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
+/* Packets which contain IP payload have LIP values */
+#define CPUID_14_0_ECX_LIP              (1U << 31)
+
 /* CLZERO instruction */
 #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
 /* Always save/restore FP error pointers */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e..900ea08283 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -672,6 +672,7 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
+#define TCG_14_0_ECX_FEATURES 0
 
 typedef enum FeatureWordType {
    CPUID_FEATURE_WORD,
@@ -1301,6 +1302,26 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         }
     },
 
+    [FEAT_14_0_ECX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, "intel-pt-lip",
+        },
+        .cpuid = {
+            .eax = 0x14,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_ECX,
+        },
+        .tcg_features = TCG_14_0_ECX_FEATURES,
+     },
+
 };
 
 typedef struct FeatureMask {
@@ -1373,6 +1394,10 @@ static FeatureDep feature_dependencies[] = {
         .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
     },
+    {
+        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
+        .to = { FEAT_14_0_ECX,              ~0ull },
+    },
     {
         .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
         .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
@@ -5752,6 +5777,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = INTEL_PT_MAX_SUBLEAF;
             *ebx = INTEL_PT_MINIMAL_EBX;
             *ecx = INTEL_PT_MINIMAL_ECX;
+            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
+                *ecx |= CPUID_14_0_ECX_LIP;
+            }
         } else if (count == 1) {
             *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
             *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
@@ -6498,7 +6526,8 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
                                            INTEL_PT_ADDR_RANGES_NUM) ||
            ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
                 (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
-           (ecx_0 & INTEL_PT_IP_LIP)) {
+           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
+                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
             /*
              * Processor Trace capabilities aren't configurable, so if the
              * host can't emulate the capabilities we report on
-- 
2.28.0


