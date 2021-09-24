Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B54170F4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:37:09 +0200 (CEST)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjVs-0002Wd-6V
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKU-0007e1-0l
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKS-0000TQ-CM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: by mail-ed1-x534.google.com with SMTP id u27so34244434edi.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFerr1X+wfYDn01Sfa4bWZfiMRDjKdpG3+sWcyxOLUU=;
 b=gpfu4VxKJVcQC2ybHh/+GG6kC+wVBHR7sVQGCkS5wibzX5tptGlpfFn6H1LCSsY3MK
 L749nQHMIb66FlYumcnnwwAkLwZS5RNWgCnqzDC0LljSUzmVBOsH9nNqZirDWUbz/51G
 zVCgOf1CTpBZXVMDZ3IQ8XQfqGuIjh4220lEU6Mld1RU9+IUajwRBjfHUkbIgsiSeNNq
 7OkZEuRScMs52uph1pCGG4iE7fMZqZHkcIu5BHL944HSJGOA69ijmJ+lwzFvwUfZxbMJ
 ZD+OE1HcDKO48MOKH04AFv35aFo+qdKAorVcpWZ4pIv38prbB0WnAZ6UFPDXnYRHyg9K
 kDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oFerr1X+wfYDn01Sfa4bWZfiMRDjKdpG3+sWcyxOLUU=;
 b=nxxRv0mwq/MasdYH8IYbmY+WDJUZH7MsModABUeJVg2V4Pbf8Z23tT515Uzlhv+CXq
 yzukSsBq+keKmkmEP/RjxTIHEtE+GLHxxnC4bDyChiavG+sdo317aFgVp0mtWcOZ/Q8V
 U0YyzVGiOXBkhN1amG6jE8+KCBpMU9qrFl7PHsV0pj6h31tTt8k7LNyOjoxeESqajP6S
 Y/5RXN1jEvHEeqq8DjKzU8a0jVSeXH8LstCHoBmv0CUj284VE8WvZzdzM2ba7KNBRAH3
 bER8ycKmBHCZjCoQUijE2e95/TrfzBndwfcW+3JSxXuARiCxnJrTNih7kVyu2tPsgATF
 5rPw==
X-Gm-Message-State: AOAM533uEIXecV7Fva1FHmqiIYP89wf/tLLRskRMrcKgdFyQiCaM8n51
 Sz9BuhSOr5oRvW7EnYRI6YKYav0OJlk=
X-Google-Smtp-Source: ABdhPJz4++BOwo1U2Hq5x1kIiJCS9smuFsEENO4Yv+kDf3xf2rg7n6sZaGakG4WsdYd7iz6iLBrj3w==
X-Received: by 2002:a17:906:a59:: with SMTP id
 x25mr10415407ejf.33.1632482718933; 
 Fri, 24 Sep 2021 04:25:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/26] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Fri, 24 Sep 2021 13:24:53 +0200
Message-Id: <20210924112509.25061-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
index 0cdbcb9e4c..7023a0bc49 100644
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



