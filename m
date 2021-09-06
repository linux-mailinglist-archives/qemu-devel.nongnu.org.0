Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945A401C31
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:22:47 +0200 (CEST)
Received: from localhost ([::1]:42634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEaE-0003m4-AY
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPR-0000oY-GS
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPM-0007bE-CF
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4981830wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2ijG6oqOKQYi5XTwrixE0f+sZD4sotEKPng4B+sT8w=;
 b=V4pLBIcHZD1KJ4b8PTQyIp7nBL4sGhmVnlznB+5g03ag5r0KERWXerSxdn7zRsCVIb
 mxhra6+1U5DQH2H8maXkHfzCxd8TZkbrLc7UVR23kSmWocEwtsp2PBRL+iS6NAYv1sPc
 v3L1AZTZypwdmUYbuJaOC9RN2twSYkXFBwVTfIOc8erJwshKtqqrkPhZ7oLfsw3Me0mJ
 b09CaxorxKgvY1BAYVBaPqZyj+w1ns2XSITY81rubc1Nk8bpHQwhwDvLsaqamUl2G/hi
 s4ZIgZHbn0SQsNKY7dK74VfCjPcYVS1Cq67C+HG6TqychElmrGVs9Expg3tkz3/777qE
 ZpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D2ijG6oqOKQYi5XTwrixE0f+sZD4sotEKPng4B+sT8w=;
 b=Kqevbni4Uz1TozaAUzojcAofJSMbELqYxwhUJqNkxTRL0OsYr6x7w7SQTwowJ9ukka
 KvaHRUWLF40pvRzst8tAvEUVbSQVI7+y/L+ATz/hvsp+m5q5T/L1q5L8wyuBk0e6hUfo
 tSDMgqLqpUb8rlaqgZd407Zsz5vP4+1PtdUiRZe5VgBnekd/0soLsCu10HrsBPUOxTSL
 ibdg+QbFaJeuTKFOXCWGbuza6535YyKiLQqZuX5lxCGgZ6X25BAz3S2NdcPHKNN/nymS
 RVFxR+hf7zYYeJ4GbEzI9dsgorM8HFmDkhzg8PiY5DyTFFP7KMpdkDWLWp2k4MbQOSkg
 5xag==
X-Gm-Message-State: AOAM530WRZAUPHnUwhgczYRcgN3UZJauhhWQhpcfBDFHpBsGHe29HQNN
 PbVQ2Fpo4qzHcbs9mGZ/tWZWVgU7vb0=
X-Google-Smtp-Source: ABdhPJyHuwpZkJ4cAu28R4FXj0dzB72uDQ97I76FcqMoMoyAeoBblj7govwAFOiTfGYLYqFqT7jHyQ==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr11241829wmb.11.1630933890911; 
 Mon, 06 Sep 2021 06:11:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/36] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Mon,  6 Sep 2021 15:10:40 +0200
Message-Id: <20210906131059.55234-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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

CPUID leaf 12_1_EAX is an Intel-defined feature bits leaf enumerating
the platform's SGX capabilities that may be utilized by an enclave, e.g.
whether or not an enclave can gain access to the provision key.
Currently there are six capabilities:

   - INIT: set when the enclave has has been initialized by EINIT.  Cannot
           be set by software, i.e. forced to zero in CPUID.
   - DEBUG: permits a debugger to read/write into the enclave.
   - MODE64BIT: the enclave runs in 64-bit mode
   - PROVISIONKEY: grants has access to the provision key
   - EINITTOKENKEY: grants access to the EINIT token key, i.e. the
                    enclave can generate EINIT tokens
   - KSS: Key Separation and Sharing enabled for the enclave.

Note that the entirety of CPUID.0x12.0x1, i.e. all registers, enumerates
the allowed ATTRIBUTES (128 bits), but only bits 31:0 are directly
exposed to the user (via FEAT_12_1_EAX).  Bits 63:32 are currently all
reserved and bits 127:64 correspond to the allowed XSAVE Feature Request
Mask, which is calculated based on other CPU features, e.g. XSAVE, MPX,
AVX, etc... and is not exposed to the user.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-10-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c0d5c3c621..e9ecbf59e5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -656,6 +656,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
 #define TCG_SGX_12_0_EBX_FEATURES 0
+#define TCG_SGX_12_1_EAX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1223,6 +1224,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_SGX_12_0_EBX_FEATURES,
     },
+
+    [FEAT_SGX_12_1_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, "sgx-debug", "sgx-mode64", NULL,
+            "sgx-provisionkey", "sgx-tokenkey", NULL, "sgx-kss",
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x12,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EAX,
+        },
+        .tcg_features = TCG_SGX_12_1_EAX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index bc4b7cd727..04c9e0c259 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -579,6 +579,7 @@ typedef enum FeatureWord {
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
+    FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



