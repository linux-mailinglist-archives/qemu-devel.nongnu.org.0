Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392AD4D0672
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:24:24 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI1v-00087c-9u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:24:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHug-0000z8-DJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: from [2a00:1450:4864:20::635] (port=39493
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005O3-43
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:54 -0500
Received: by mail-ej1-x635.google.com with SMTP id dr20so33764200ejc.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etf5jxwr29Oh4HbEgyWWV6TrvYS+n1eW5kgscxceipE=;
 b=GpXOxnzCex2guwgxE3wbCSJLLEbXFydFT8DBjpRS4vhD7L3gMi7o4n1+61q3UHcaHl
 mQezKyaxdW3i0Jq+T0OeGXE1fOnuJiVMk2HiiWm8yo2n/UgfB1sSWtQRYfvjZ5/eurEF
 mAgRb/voxs/gD9/k+LWLqeCI62+EpLF2fp65Q42VtFlIjp1QcTuJKhBFosYl13CIJ6gB
 69DPs1lwg4tbvS3yJNzpWFVIraeXjXeXrBa6N3qPtT3QMu/9M449pgqgXLr9LMui63jI
 JJrS2hZqGdL+aOnazrOeFEFJKMpf6cYcpM+n4fMJ7Rr3ZPMeHk8qne4pOU2uBjXuB0WG
 O88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=etf5jxwr29Oh4HbEgyWWV6TrvYS+n1eW5kgscxceipE=;
 b=nicKiqT5z10U+Z3cW8umlTCx0p4JET7itPEd1Gk8UzdFou+k1n5EkYiOClaGzyOk4Q
 nZ7YGWEqpYAgqU+uXflwuV3BS5uz5uBkjjitAag7372uCyd6naoPwMhNYzbXnWTR+Hx5
 beghmcye358NQBud/kIF4OLixuUMMWbOBBnIIEsjKpZe2WelKGnJ4WHNU9RRInXi4Sa+
 BIRlHonpGT+VYh6jN6aCVu+B2VIXYLDpqhfiuUmWgfExXbeJUTtw2PTWqVPx2lNpEJgw
 2I3tA7EYmLQi0EklWK7HebSCVGzz8FV/vl5X5TqhltoVuwqpsW6Tosdet9ULJWxYkPkh
 vXEQ==
X-Gm-Message-State: AOAM532/HHftCQ6M2xe6q9rrG3Li1SwyKtGelB30r6GoDIUOvv+CMzz/
 W0KQxsAEMIMqc6O/MYgfgf3k00cnnfs=
X-Google-Smtp-Source: ABdhPJyPwrO7ktSL3cLa2ORyPpk6JvqdHIN92rUZnyha/x8lsCJ8LtOfUnm13MhXq0K4+Maj4VKgJA==
X-Received: by 2002:a17:906:610:b0:6d6:e68b:136 with SMTP id
 s16-20020a170906061000b006d6e68b0136mr10400645ejb.332.1646677009215; 
 Mon, 07 Mar 2022 10:16:49 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] x86: Add AMX CPUIDs enumeration
Date: Mon,  7 Mar 2022 19:16:27 +0100
Message-Id: <20220307181633.596898-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

Add AMX primary feature bits XFD and AMX_TILE to
enumerate the CPU's AMX capability. Meanwhile, add
AMX TILE and TMUL CPUID leaf and subleaves which
exist when AMX TILE is present to provide the maximum
capability of TILE and TMUL.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-6-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     | 55 ++++++++++++++++++++++++++++++++++++++++---
 target/i386/kvm/kvm.c |  4 +++-
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 79e24bb23f..351a1e4f2a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -575,6 +575,18 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
 
+/* CPUID Leaf 0x1D constants: */
+#define INTEL_AMX_TILE_MAX_SUBLEAF     0x1
+#define INTEL_AMX_TOTAL_TILE_BYTES     0x2000
+#define INTEL_AMX_BYTES_PER_TILE       0x400
+#define INTEL_AMX_BYTES_PER_ROW        0x40
+#define INTEL_AMX_TILE_MAX_NAMES       0x8
+#define INTEL_AMX_TILE_MAX_ROWS        0x10
+
+/* CPUID Leaf 0x1E constants: */
+#define INTEL_AMX_TMUL_MAX_K           0x10
+#define INTEL_AMX_TMUL_MAX_N           0x40
+
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
                               uint32_t vendor2, uint32_t vendor3)
 {
@@ -844,8 +856,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "avx512-vp2intersect", NULL, "md-clear", NULL,
             NULL, NULL, "serialize", NULL,
             "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
-            NULL, NULL, NULL, "avx512-fp16",
-            NULL, NULL, "spec-ctrl", "stibp",
+            NULL, NULL, "amx-bf16", "avx512-fp16",
+            "amx-tile", "amx-int8", "spec-ctrl", "stibp",
             NULL, "arch-capabilities", "core-capability", "ssbd",
         },
         .cpuid = {
@@ -910,7 +922,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             "xsaveopt", "xsavec", "xgetbv1", "xsaves",
-            NULL, NULL, NULL, NULL,
+            "xfd", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -5586,6 +5598,43 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         break;
     }
+    case 0x1D: {
+        /* AMX TILE */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
+            break;
+        }
+
+        if (count == 0) {
+            /* Highest numbered palette subleaf */
+            *eax = INTEL_AMX_TILE_MAX_SUBLEAF;
+        } else if (count == 1) {
+            *eax = INTEL_AMX_TOTAL_TILE_BYTES |
+                   (INTEL_AMX_BYTES_PER_TILE << 16);
+            *ebx = INTEL_AMX_BYTES_PER_ROW | (INTEL_AMX_TILE_MAX_NAMES << 16);
+            *ecx = INTEL_AMX_TILE_MAX_ROWS;
+        }
+        break;
+    }
+    case 0x1E: {
+        /* AMX TMUL */
+        *eax = 0;
+        *ebx = 0;
+        *ecx = 0;
+        *edx = 0;
+        if (!(env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_AMX_TILE)) {
+            break;
+        }
+
+        if (count == 0) {
+            /* Highest numbered palette subleaf */
+            *ebx = INTEL_AMX_TMUL_MAX_K | (INTEL_AMX_TMUL_MAX_N << 8);
+        }
+        break;
+    }
     case 0x40000000:
         /*
          * CPUID code in kvm_arch_init_vcpu() ignores stuff
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1e4436ee74..385c5f8ed3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1780,7 +1780,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
                 c = &cpuid_data.entries[cpuid_i++];
             }
             break;
-        case 0x14: {
+        case 0x14:
+        case 0x1d:
+        case 0x1e: {
             uint32_t times;
 
             c->function = i;
-- 
2.34.1



