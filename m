Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB838F1DE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:57:51 +0200 (CEST)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDtm-00035u-EC
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004oK-D2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004LO-JO
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:57 -0400
Received: by mail-ej1-x62c.google.com with SMTP id p24so41549120ejb.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITpiHeu1IxA8t2wdEdec6BcjzxnU/v/+ssiPkXMtCSE=;
 b=D+eyxZ9GkHmfbweXrBZ0DHXqcDBq3vomgVr1ZM1eAu3u/STB4jGbPwzPx16pWie70/
 obdi1PDXIx/a4HEeqBb+G75REWChdBRXXfZa3eATYxuwOw7p9iSREyQQN7xQKF4+K4uU
 u53dfQ62GVttuSd22OImggpfVX4ipNG10CJlLcVHIin8g/H+qho6aVkOKagu2ZYgtWCy
 iODCBw0PV3BiYr8EJLJ321CbmS9hPd4Uup6gDnlFQV/bsgLhtAm1kr4vMGrbqB49bDri
 LwGn2bYfSwP/iaMv0p5GzeY+n292HNshtDrExGIA9YXg9T2T3h1L3Wt0/LrPBCKWWvTa
 lgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ITpiHeu1IxA8t2wdEdec6BcjzxnU/v/+ssiPkXMtCSE=;
 b=t38P4cMKgvEAoBlGBSQhQh6IHMwloQ3SU+7XwL7GwKaWiXbLFXwUYYXpveaSMScXiM
 6tGRKXpOFOtVX0w1KR7p3RHRhhsax9nmpfCAgPxguuLe+h7jNwpe1YlUTNCZYkV1rafl
 67FORGgid6bfl5jdqsooDT1/47jO1a+zYNDVNSG4xus4FRp1kiHHWg3YSZsd5gWe4GSF
 pDLEBfIzy1UpJd0t9qA2NzKqpdcdMfOTSUXbLtk1SiCBQTGC6U05fRjLjS7rncyx4tDU
 RqxAmyLwCU/02PkBKTPBf1XROmM2Gp5/q8rU2dSnZo1z0uohe+coDrUSluZ463yZ6/Ae
 DwOQ==
X-Gm-Message-State: AOAM532QhQCAdTn0u5ESYEcZCUF8yLTdVImcbWZjzHkZAmZ2HBgzEUOY
 FJDHZ22RYRQfmM8L+/x51oyjSQWKZLkpLA==
X-Google-Smtp-Source: ABdhPJxJdAfqziQsaGLO7uOo3x62MmG43/kCu42+Ty9chI0JQbUhRDlGhkmk7z77w8TZytLQ+bHfcg==
X-Received: by 2002:a17:906:bc43:: with SMTP id
 s3mr24578675ejv.76.1621874495709; 
 Mon, 24 May 2021 09:41:35 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] i386/cpu: Expose AVX_VNNI instruction to guest
Date: Mon, 24 May 2021 18:41:08 +0200
Message-Id: <20210524164131.383778-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Expose AVX (VEX-encoded) versions of the Vector Neural Network
Instructions to guest.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 4] AVX_VNNI

The following instructions are available when this feature is
present in the guest.
  1. VPDPBUS: Multiply and Add Unsigned and Signed Bytes
  2. VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
  3. VPDPWSSD: Multiply and Add Signed Word Integers
  4. VPDPWSSDS: Multiply and Add Signed Integers with Saturation

As for the kvm related code, please reference Linux commit id 1085a6b585d7.

The release document ref below link:
https://software.intel.com/content/www/us/en/develop/download/\
intel-architecture-instruction-set-extensions-programming-reference.html

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210407015609.22936-1-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c496bfa1c2..9e211ac2ce 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -940,7 +940,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            NULL, "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
@@ -3194,7 +3194,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
             MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
         .features[FEAT_7_1_EAX] =
-            CPUID_7_1_EAX_AVX512_BF16,
+            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
         /*
          * Missing: XSAVES (not supported by some Linux versions,
          * including v4.1 to v4.12).
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6836393f7..da72aa5228 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -817,6 +817,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 /* Speculative Store Bypass Disable */
 #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
 
+/* AVX VNNI Instruction */
+#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
 
-- 
2.31.1



