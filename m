Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579F44037B6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:19:29 +0200 (CEST)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNufw-0003Ej-Cn
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRq-0006b8-El
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRm-0002zZ-5p
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so885949wmh.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRG6UldQ4FAnYMjiIBprwzK+XcImxqgucxt46qHrvz0=;
 b=cWhdSVTRS08Jy0S0mfUrrcVFEKw2S7K1OLS0oadrzzJvw5GDl8cG9v3f5xzYWN4H8M
 Q2zhCFeAEEoEu2PKNhVrcsMTNybNBvsNySLjZTZ70gqZjysaYsqnlSonhgCOAGEd/Zkc
 Ii5QOVb1ONrELIBTgSZnRHd1C5Jd1t1bXU7PJjJ2/eD4mLOxmbCi/DCkYcwTmKAhmIh4
 pY36RgZrbVsUsmwK+o88WMOVjWZ4zvFKzq+wt5DGXa3EhuB7++aRfeuPNen2O53MYzjp
 BmNuYDHOlePIptW7ioDEImmqo1Vcx0CwW/77bQDHEzbhHlNZqhH4e1zJULSV6ORE8s6l
 gBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XRG6UldQ4FAnYMjiIBprwzK+XcImxqgucxt46qHrvz0=;
 b=BTsrf7vwkmBsTVehmSLDYagAEUSu0RW/GbjFY0VxMLNRx1gMFv8N4rL5m00YnJCte9
 9adug9MzTIzyhG9ljPdMlBuNQdGPMiGfdk34mCHXyDHQunCjJs/19+Ax7fKiKic1t5pI
 TU3X2vwoFwOMOEGZnGfKwtvCLkEOa6/E5CiPLhwZCuuzyRbSA/Zpek5dmXQVefIfxLEM
 nznEN1ms6ikbXxCnQnrvzmCRzk6czePTQksFfGr+5z/pqHmsKih4DFvc79NVA8O5vx3C
 9yLcedPgHYvL1AQ8WMV86zpmdJ6192z25K9b2dIulzHrgyh4CQl3kzGGZ/Y6lM+7k1fX
 QrVA==
X-Gm-Message-State: AOAM533+F7W9CjCxNf/8UsMELCgCz8ymlPZ2O+3R8cbxbw7MlhkIhIln
 j2i/9Wm6CNq5r/rUo6BTVDxsIOH7YYI=
X-Google-Smtp-Source: ABdhPJxi6rtKsdESfWaMR1dHbcNNDRHFjqu5SC5GNHa9KtmsYD26xoLS921pZbnUB1whqcRdCTx2tw==
X-Received: by 2002:a05:600c:22d2:: with SMTP id
 18mr2769471wmg.57.1631095488275; 
 Wed, 08 Sep 2021 03:04:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 17/43] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Wed,  8 Sep 2021 12:04:00 +0200
Message-Id: <20210908100426.264356-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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
index cf52f70575..e18cceb851 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -580,6 +580,7 @@ typedef enum FeatureWord {
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
+    FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



