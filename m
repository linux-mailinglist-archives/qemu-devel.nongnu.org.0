Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C354D1669
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:42:09 +0100 (CET)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYED-0000EO-16
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-0007pl-OG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: from [2a00:1450:4864:20::62a] (port=35545
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7c-00060b-J3
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:23 -0500
Received: by mail-ej1-x62a.google.com with SMTP id yy13so29693331ejb.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZE9rtHDAdk4AmpsqJv5sNfo0jSwatkf7tMyJKyMF0Y=;
 b=ZRaIlI0uVdkfK8NJo3mYqamgMlYLrPfx2o8a4k1luiFwssyAdjcFQESCj+yG47nr0B
 z4jjX92AoVfp3hF7QSog0VKxY/lExpcYJckGvQ3unVPpWzAXEIqnv96vDLcj7d9+xGjp
 Rh0jZl5aZdx+QEfea4wMZcAJDXyP3bb+rd+JtHc+qSuNvJGQvLeB/Wr5mdXGjgYQZuk0
 ZPKEhqKxMHBCOBYx2gHznhi0IugHpg8sx538zWQ8taGF7MX6ULDQt4OBWj5TW2Gjp3dA
 AwaVywd0Sqkb95jo0WG6F27oZt6ABQ4tmjq7pfvVTWbD0MEIgB+GiTv64Z9l6eaMsd5Z
 AHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DZE9rtHDAdk4AmpsqJv5sNfo0jSwatkf7tMyJKyMF0Y=;
 b=DlNBXH1hXsQOJNtz17kAohfg0APnYuA6wNzoSo0/ACQDO5pq4P1YFvi8LBOYNbCsjH
 9l3A7a2Qg2VAYR4maCDyxVHUGmjtFWL/ZiRD5G/y/9n4CqUcwpxE2SUCv8j6W+GSr3YK
 dCMsDQxLRi98tMyLRx3RIEAjlPCISO2a9pnAjrNcrVt95wiNkSGnlXq0s8awmLL302P8
 oFtZfS6P1TotM887T61B5Fr/SpCjPHPxmtazJKpXj6bDpC+o/1lNs4law36eIZOBv/8X
 a93F5DFYsANGvSMZDyQVD7wIT6xPJzaly8GStJs0VGRt+Yr4gbe+jx/ftB9SEN4ckrB3
 taaA==
X-Gm-Message-State: AOAM533r7/Z4VB5smTdHBxNbLQVjwrIgXYliueONZ5m9VZSMTs7lFf9m
 K7QgqxSwEytplo0m5f4O3V5k1sU4Biw=
X-Google-Smtp-Source: ABdhPJxb1ZfpJUDchwQrN2cdwTtFI/tge0S935575W5g7LIbKOf4kiWz5bCeXWlduxHn9HkhvbDFoA==
X-Received: by 2002:a17:907:1c91:b0:6d7:b83:cddb with SMTP id
 nb17-20020a1709071c9100b006d70b83cddbmr12594313ejc.739.1646739317042; 
 Tue, 08 Mar 2022 03:35:17 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/22] x86: Add AMX CPUIDs enumeration
Date: Tue,  8 Mar 2022 12:34:40 +0100
Message-Id: <20220308113445.859669-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
2.35.1



