Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AAB4170DF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:30:57 +0200 (CEST)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjPs-0007rd-Ux
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKT-0007cS-Do
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKQ-0000Qo-06
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id dj4so34909310edb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5AR/P+mFSJFO235bsACgg5JM9OnHm4NP9JNrfL9ZLQ=;
 b=l/kx0rH7frHAp3l7tsCrjRxwVw32XW+JS7ODGk6Gj4KczlaWkCbxk86VRyN2GuHnqn
 74U5MwwA9z/HeGEvaDLBWn8eRsw7ee4zD8piom60a+B9i0qyxFCcpOAV0rICcKKVXtd2
 AKzLU/DCI1qteQVgTqNIfE58EEpVQ4N+coFfP0IheBZNNjgWi8GcnGzzwQObWQa8LxL9
 mIo+lr0+GJnQKJMYNptGhS6EfOXufMM5+Z0tbgwUP20ku6sgA3MNiz5o5R88eJO04Piq
 jDP8op52Om6NfZC8NAqe+BHXYVmKhaL9sx5bqFyXY8/Yb1YC6PSdAmMu/Et1nvF2qiO6
 b9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Y5AR/P+mFSJFO235bsACgg5JM9OnHm4NP9JNrfL9ZLQ=;
 b=AdzNYGX9amnNJ01bqpgpsr7AiofhS1cIxSdnL86rZtwbw0mz1y4T3gY42EWbIZMcUD
 aK6DJ+qPdaGdCfMlwt5styh25P+vsaWA0v/eaVuk2mW/9+j6uOjEV9C4XUeqynoqZtiL
 jUMizFkQfDVYicJaRDvOaMgmv9E6AX6Z7VboYdW7pFQYebTDOGF2BDssEXWU/+nfPRlX
 teUwwLhZgaQijTfEHuD/KlqVUCc9LMhI2GFOJJ4rplJHBq7Kr3bD9x6lI95N9vh26B86
 smpEWxRPNhMau/YBz+Pcl2VGSmjYPKpAEbXK79zYLwBdzJYN1ZuWYmVu78WdQE7HMfQY
 M+aw==
X-Gm-Message-State: AOAM533B9pXVeMzOe86aH/cb0SVbPNt98ue9WAfk08NTN5sVJQGPOZ3M
 tIgJJbjsVsLw5gqGG3q0ZIGV2Csi5Jo=
X-Google-Smtp-Source: ABdhPJwfVcLLlGpNIWW8ed6FPQBZ5Ns396Qehco5NqPQInwcxMvWTWz/0t/gIAvlO+VRnzOQqqgv/g==
X-Received: by 2002:a17:906:1d07:: with SMTP id
 n7mr10379767ejh.53.1632482716486; 
 Fri, 24 Sep 2021 04:25:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/26] i386: Add primary SGX CPUID and MSR defines
Date: Fri, 24 Sep 2021 13:24:50 +0200
Message-Id: <20210924112509.25061-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
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
index 7dd664791a..3823c7c40a 100644
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



