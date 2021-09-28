Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8641AFA9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:08:49 +0200 (CEST)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCqm-00031X-9g
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0006Ue-4i
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0001PV-NJ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: by mail-ed1-x52e.google.com with SMTP id v18so47485725edc.11
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ES28BAOHaA3bl9y4JBGbzrlNr0SK8xxRe1ddZiant8Y=;
 b=WK4gXtYhvWSPrZTtsF4533HCBtdLA2myBIiIwYp0dW0XwoRgoKwuC4GRF4wxwurQ0+
 dPweNC4mWvEPd6DAqE43i3G8UmIBDajX0hsNXXFVpG6HrzfwO03bMSHCcxfqiihpJivc
 d+jIyiJGpXg8+VeWqmPLzU6DS7X5jSvGcgyjyECTB5+yIdH6WsY9yAcqZArZKJsB3HzF
 wUbm3/W1IpNsl91UjRklnnsc9nkyneLTO89qd8c/Nb4eotgePwxAAXMIzt9ZBBYyUZrf
 aJA3GjOLtkdeTMQRJ3lYDZSue0ry3sLP2HxxSGPxJfJK58FwcVtYy9jhRraPNoCmVv2+
 PJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ES28BAOHaA3bl9y4JBGbzrlNr0SK8xxRe1ddZiant8Y=;
 b=GIMMcUnJTz/0TGSmo/+fBjnDxBE/cV6mZZsn0tcb2LS3MLJMV/6YMx2NNz61IiKm7D
 Xl7kGnX/iOq5OMmTzB80bAvoJOAPdcDLwjWCOCffQHDga87gHhgwPEZKNnxaaxyqkneJ
 UJLigRWMb6eFJxEoriyLsYGicIt4yFemHsfgufVcYWm3/jeVbzyft1b3LnI3Xw3X4dGB
 H16Chuq3kvqiGM/DdJzP+1NDcIwuTo3/V6etpYkoOVF5xpf8UhoZSUmLQe9sZIAipgsb
 nTuJSbFPVPDpt/fv4g2kzHy9cZr6hRosviomRaYP5Sxy0JWrHovItE3Yxl3/ya26inYE
 grHw==
X-Gm-Message-State: AOAM533MmODRYw4CsMhEgBBIrI2M1UR1rJyms4rgoF7F7XMV63ijTp6Y
 tIcbp145OW7o3Bn55HyFiz/Y0jP3xgc=
X-Google-Smtp-Source: ABdhPJyTrTG4139gmlO9wuhYsNJaRqQnV6aTv74tRACfxsykZAupHwGc5PpUIffvzZL7xwHh7o0pEw==
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr6485137ejc.69.1632833484434; 
 Tue, 28 Sep 2021 05:51:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] i386: Add primary SGX CPUID and MSR defines
Date: Tue, 28 Sep 2021 14:50:50 +0200
Message-Id: <20210928125116.183620-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add CPUID defines for SGX and SGX Launch Control (LC), as well as
defines for their associated FEATURE_CONTROL MSR bits.  Define the
Launch Enclave Public Key Hash MSRs (LE Hash MSRs), which exist
when SGX LC is present (in CPUID), and are writable when SGX LC is
enabled (in FEATURE_CONTROL).

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-7-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  4 ++--
 target/i386/cpu.h | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf..21d2a325ea 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -795,7 +795,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_7_0_EBX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
-            "fsgsbase", "tsc-adjust", NULL, "bmi1",
+            "fsgsbase", "tsc-adjust", "sgx", "bmi1",
             "hle", "avx2", NULL, "smep",
             "bmi2", "erms", "invpcid", "rtm",
             NULL, NULL, "mpx", NULL,
@@ -821,7 +821,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "la57", NULL, NULL, NULL,
             NULL, NULL, "rdpid", NULL,
             "bus-lock-detect", "cldemote", NULL, "movdiri",
-            "movdir64b", NULL, NULL, "pks",
+            "movdir64b", NULL, "sgxlc", "pks",
         },
         .cpuid = {
             .eax = 7,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c2954c71ea..b6491df0f5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -389,9 +389,17 @@ typedef enum X86Seg {
 #define MSR_IA32_PKRS                   0x6e1
 
 #define FEATURE_CONTROL_LOCKED                    (1<<0)
+#define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX  (1ULL << 1)
 #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX (1<<2)
+#define FEATURE_CONTROL_SGX_LC                    (1ULL << 17)
+#define FEATURE_CONTROL_SGX                       (1ULL << 18)
 #define FEATURE_CONTROL_LMCE                      (1<<20)
 
+#define MSR_IA32_SGXLEPUBKEYHASH0       0x8c
+#define MSR_IA32_SGXLEPUBKEYHASH1       0x8d
+#define MSR_IA32_SGXLEPUBKEYHASH2       0x8e
+#define MSR_IA32_SGXLEPUBKEYHASH3       0x8f
+
 #define MSR_P6_PERFCTR0                 0xc1
 
 #define MSR_IA32_SMBASE                 0x9e
@@ -718,6 +726,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
+/* Support SGX */
+#define CPUID_7_0_EBX_SGX               (1U << 2)
 /* 1st Group of Advanced Bit Manipulation Extensions */
 #define CPUID_7_0_EBX_BMI1              (1U << 3)
 /* Hardware Lock Elision */
@@ -805,6 +815,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
 /* Move 64 Bytes as Direct Store Instruction */
 #define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
+/* Support SGX Launch Control */
+#define CPUID_7_0_ECX_SGX_LC            (1U << 30)
 /* Protection Keys for Supervisor-mode Pages */
 #define CPUID_7_0_ECX_PKS               (1U << 31)
 
-- 
2.31.1



