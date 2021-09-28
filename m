Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC841AFA8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:08:24 +0200 (CEST)
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCqN-0002ZR-Fp
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa7-0006QC-8v
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0001Oi-Gc
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:34 -0400
Received: by mail-ed1-x530.google.com with SMTP id dn26so5833596edb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFlr8+Eokp+7BRksYfbdcbnVTGvQvuKTlVLPTcOMOIw=;
 b=M8jLWOk4DrHGAEfxMVWQTc1goRf/C2T8iDrwb41hzWIBIY6OQ+582w5Pg/jvJXgkj6
 m6b9pkVrBffXk51yusUYa4zgW+2o1VWJMxMvH2QYH/akrNK3auvxmiF6vdbW+GYd/Zde
 FXCkLlWn7u1zhReJNepuk3AhxL+7ILkDLC21iStWydeApoQZGVIzE2rkaxhGj5t3qVLS
 gXEzX/w266teyu8RVF2XIo0ZtCP7q+2Na3ujNENPYprREHYQDDxuT/Fu5er1hs/3JxMJ
 p0yfDKJGYnc+b344gYfVIlBeChiImiY6I5keITVXxGoXhcPBjfbDz7Dys8c3dVcM7U6e
 B9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xFlr8+Eokp+7BRksYfbdcbnVTGvQvuKTlVLPTcOMOIw=;
 b=xuFGFuXcdXJPH8sdeMecqNpC9hNybzcdQrApmV7V70P8ZgG+KULHriRVbxfPcnOUhh
 FKDohZfB/4gdjyp9iCJnyW3FhMY6d2yjF7ng0LJwoLiCUa+U5U6vMWOLBdQ9UOK5l2NJ
 ccJr4Org4jgefZ8l1KhLJALCX7TtaC4rWdb274ejVWMW/v+RcS3qC0eJHIvc/xMmseWx
 1QHE5d0jU2oQXab+TTEEluV83kAZXDLUROmzy0gIe1wtdbi65MU5DhZGsYKCgpVf6QHn
 1T/Mj5xlLyam1HkdroA7zb7Bhkx+4AdihFvCE3ULJcWGzaDMsl171y+aGLKt6MX5YyQ2
 gDOw==
X-Gm-Message-State: AOAM530YV2lEYbiBvM0gmFCrmwh96VFmRlE5yQGSrZs97PE28tYmNvcE
 07r1Y1NmRcUHMc//qURZ5wWnahyVKx4=
X-Google-Smtp-Source: ABdhPJza33U3TI/5SFWLcJK1VwrktcrGdl7zl6O125JTMMbOISBBidRenwPF1BUVzigjZijiYHTwGQ==
X-Received: by 2002:a17:906:645:: with SMTP id
 t5mr6483266ejb.163.1632833486792; 
 Tue, 28 Sep 2021 05:51:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
Date: Tue, 28 Sep 2021 14:50:53 +0200
Message-Id: <20210928125116.183620-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
index e66ec85980..85a9eeeb2b 100644
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



