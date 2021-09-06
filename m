Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EE0401C44
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:27:56 +0200 (CEST)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEfD-0007LC-En
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPN-0000lG-Ux
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPG-0007Xj-9x
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so4792165wmq.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmvlMp1cocvX0VMAB6ou2v9NOyMY5lR6zdmOLQ6OG3k=;
 b=RG/EUVTXdwjW7ybAl4Gr7/xG4/f4ompsOrd21ptedPm0yVqeSZKOwcYLCXXgHIJ97C
 kf73ViKq1KEQtcqO0n8ActqzYfAbak3V7ARMONKVqJgu+gwVtwigRbAzifq5uabSuZG3
 mOEyYnEh+8Wk9woxhMkQsHjnT1RcZoEueK7PLZ1AZFKfy/o8PfILxWrjDKTWfVNImYrZ
 Wh+4JhRtUR+bMYxC3n66ypMwKNVsiSOp2FWLxJB1WXHcOLGmUzxkx3dMN0wBoUof48/d
 86+LSGEx3higpyDysRcjz0PqxZ4uwP4lcuTsovd7N2kB8G1cBqg8CXndIxvPig9a0y0b
 WCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TmvlMp1cocvX0VMAB6ou2v9NOyMY5lR6zdmOLQ6OG3k=;
 b=jvHvIJwWvLosqdp/Rdo5E0KuExijJnctdsm9N24clbRC15RNTEy5wkbKNizGsQmBj+
 pGOKWbLpi2o8mmaDN0JCdMuNrhANO0cQ2OvCaY6xKeryPzhMDKSfbqdCEdVb0bmtuJsJ
 JBaS9msOky9sEN/l8EYz0czGp0QI0IPEm1qjmDve4MQG1o7Jmwh11BbKXxDg64nM9x9M
 VXvZyORa8e6XScpmUVZixsljXNzU7MXpbiYMwjgG/28ABMt0Y2DIUxuqpcxotsp44QIb
 B3LEEMRptoFQam4W84QvA+EmuQT2wA894k0B+GnHpihDXqvVUFRRigc7H7QGKutbL8Lk
 16/Q==
X-Gm-Message-State: AOAM533WuM8d1vxJZWozErnFQtlik8k9c0v5FSC7ITb9b3PoIllI0xYw
 hf76GreLWkDy0ocTIvvX38uBEoFpf6E=
X-Google-Smtp-Source: ABdhPJzE7mcRQUUN0IJ2z23RT7DjV5c6p4rNWAHTocdlpvbdMfAPxWgOAVNFIGsl4vB5YNR4O2GP5w==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2848832wmp.93.1630933884643;
 Mon, 06 Sep 2021 06:11:24 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/36] i386: Add primary SGX CPUID and MSR defines
Date: Mon,  6 Sep 2021 15:10:37 +0200
Message-Id: <20210906131059.55234-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index 573adc8c22..5f56849d1f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -388,9 +388,17 @@ typedef enum X86Seg {
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
@@ -717,6 +725,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
+/* Support SGX */
+#define CPUID_7_0_EBX_SGX               (1U << 2)
 /* 1st Group of Advanced Bit Manipulation Extensions */
 #define CPUID_7_0_EBX_BMI1              (1U << 3)
 /* Hardware Lock Elision */
@@ -804,6 +814,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
 /* Move 64 Bytes as Direct Store Instruction */
 #define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
+/* Support SGX Launch Control */
+#define CPUID_7_0_ECX_SGX_LC            (1U << 30)
 /* Protection Keys for Supervisor-mode Pages */
 #define CPUID_7_0_ECX_PKS               (1U << 31)
 
-- 
2.31.1



