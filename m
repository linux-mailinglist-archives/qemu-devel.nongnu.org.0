Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F34037A3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:14:19 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuaw-00010O-RK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRn-0006Tf-Bg
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0002y1-9v
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1071323wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJhic6JItqCcAPRwChb+m/vGC9bolwiHwgIkwbT7HhE=;
 b=UlFBtp/NEmK++7r6hxB5/CDKb0Bv1u+na8wn0gz5jVMXyNerRbBR6kt5pJC8zPKHaU
 n9AWBZA+JkQleIU6MFXL5TbaWI1oyL4acvJ2IoJRA1X+diJZpygx3KyOLPLEwk5aW+Cx
 sluSW/dpj9jqnp6bHfDuNZys74NfVAiaUFtqB+pPOwSbfZ+gGSOP/jzq++EabYREhXDy
 Q7V6BEjf/EfFiSBHIPXCFDLCRnb44chZQdVDt1ChCymxT1nmv502c8IXFjsgu+ln1+am
 6H3226Y6cg4Tfhky97oyQ1oWSCK6Uqf17nLRb92doa8MJ9zlZSHNJTOGAeuHgEMKUAyB
 qnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wJhic6JItqCcAPRwChb+m/vGC9bolwiHwgIkwbT7HhE=;
 b=iByK7GGz0K3aSGnRdrrD1nxkG6vgKD12u8JWnAQ58t13CKl+1imDnvMF8NpG/j7vRL
 LtyzDKtaZVYul3BjDQsHZrnXhxeNZdCwombPE0HuJTSnx1Z/QBbyDX3qgYzGwNMQHE+N
 eonfsepzZQi1qxL1IRIKkKGFeCx1v9CYR/ncbB5IJVosBsxOfa07yae9q/5I7kOKNKmc
 gBASQ0r3K2qdSnvdawT+oZx7FH6vrx0C6hpLY1FkGNVTyPrSeQnFnCN+jyLcP43QNyg9
 UukqR5AvuDxcZnFpgNxrwaUcJepMgmnTaY1TSAT18Sa12GJjCRuUepJiWOJpveQmUACE
 qYRw==
X-Gm-Message-State: AOAM531ywq9gf/gwsn1HAEeMnu0ZmqCbLNaoU9+e7GuMrC142pfts397
 Yxp13LvNv4UwgsRLzZEyR2qgLeRTX5o=
X-Google-Smtp-Source: ABdhPJzvFIR/YmTNZ9/EkrEAMA5oswvvW4M4wOFPqiMtuEtMPC6QQX50PEyBWk5ggxugKk3uW8EZ7A==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr2591380wmi.80.1631095486026; 
 Wed, 08 Sep 2021 03:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 14/43] i386: Add primary SGX CPUID and MSR defines
Date: Wed,  8 Sep 2021 12:03:57 +0200
Message-Id: <20210908100426.264356-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 71ae3141c3..a3fe44455d 100644
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



