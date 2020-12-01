Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C652CAE4D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:21:04 +0100 (CET)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkD55-0002VA-Fx
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkD47-000253-VD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkD45-00042l-OS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606857600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0ARPEKGgt8se3gYJkyLYVCLHMmcQ3Kp6FQdm6PxlEs=;
 b=LwdEp3cnMl9ciHoG3ctfRwsMExQPut9RYuMZq0TOjksUTWkLJgVjrLkCPijWhRc1o+4ycW
 8+D6C2OpcqRx1gUwIh7pinh7aUh7HfFvYK/APoHGniD3feNTLBwdHJKtvpsLKuMj08C/2X
 OETYgoijtHZfVuM5KyFvWCj+RUa2d+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-IGcH3a8DOHulhh_gD9VB1w-1; Tue, 01 Dec 2020 16:19:58 -0500
X-MC-Unique: IGcH3a8DOHulhh_gD9VB1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795EF809DC9;
 Tue,  1 Dec 2020 21:19:57 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2986160854;
 Tue,  1 Dec 2020 21:19:57 +0000 (UTC)
Date: Tue, 1 Dec 2020 16:19:56 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luwei Kang <luwei.kang@intel.com>
Subject: Re: [PATCH 2/2] i386/cpu: Make the Intel PT LIP feature configurable
Message-ID: <20201201211956.GB3836@habkost.net>
References: <20201014080443.23751-1-luwei.kang@intel.com>
 <20201014080443.23751-2-luwei.kang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201014080443.23751-2-luwei.kang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 14, 2020 at 04:04:43PM +0800, Luwei Kang wrote:
> The current implementation will disable the guest Intel PT
> feature if the Intel PT LIP feature is supported on the host,
> but the LIP feature is comming soon(e.g. SnowRidge and later).
> 
> This patch will make the guest LIP feature configurable and
> Intel PT feature can be enabled in guest when the guest LIP
> status same with the host.
> 
> Signed-off-by: Luwei Kang <luwei.kang@intel.com>

The patch looks good, but I would like to confirm if the feature
works as expected if patch 1/2 is not applied.

I have manually fixed it up to make patch 1/1 not required, but I
would like to confirm it really works on both Intel hosts with
LIP=1 and hosts with LIP=0.  Could you please test the following
version of the patch?

-------
From 8a2c9fdbe50f7ffd9900c67e72f53c8dc85ff3fd Mon Sep 17 00:00:00 2001
From: Luwei Kang <luwei.kang@intel.com>
Date: Wed, 14 Oct 2020 16:04:43 +0800
Subject: [PATCH] i386/cpu: Make the Intel PT LIP feature configurable

The current implementation will disable the guest Intel PT
feature if the Intel PT LIP feature is supported on the host,
but the LIP feature is comming soon(e.g. SnowRidge and later).

This patch will make the guest LIP feature configurable and
Intel PT feature can be enabled in guest when the guest LIP
status same with the host.

Signed-off-by: Luwei Kang <luwei.kang@intel.com>
Message-Id: <20201014080443.23751-2-luwei.kang@intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h |  4 ++++
 target/i386/cpu.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

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
index 5a8c96072e..db9e48033d 100644
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
+    },
+
 };
 
 typedef struct FeatureMask {
@@ -5752,6 +5773,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *eax = INTEL_PT_MAX_SUBLEAF;
             *ebx = INTEL_PT_MINIMAL_EBX;
             *ecx = INTEL_PT_MINIMAL_ECX;
+            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
+                *ecx |= CPUID_14_0_ECX_LIP;
+            }
         } else if (count == 1) {
             *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
             *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
@@ -6498,7 +6522,8 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
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

-- 
Eduardo


