Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE5401C4E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:30:46 +0200 (CEST)
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEhx-00058Y-GS
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPN-0000l1-US
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPL-0007Zm-4f
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:33 -0400
Received: by mail-wm1-x331.google.com with SMTP id n39so2854008wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tbkt+C4efCJ3Q59POnFA7zDTOfPNIt3ODicqdhJhkG0=;
 b=KrZXRK8OYGcJsdmoYW3gVhc/Unzv1Q0KxJSDWN5zobNOJE20y+IVpXNfWoPXct5ad9
 k75YmcvoqAqk9YlvwnvUqHrCooDqg34Mpkvw2P0a5NTrEmG6GmKWhZLTfOVJQTGDoEWk
 olxJULDMYJn+s56YPkRDCHotjt3T/NnSK3oumIZOkh3rdHojpciAajHCDUpyqe3AaGX0
 vxGxFUVeIMt58k8k+a+rRmfS6ioSIV4K+NNZev/Ri3j7O0Lb/+DKfydzI+/DCjLGdrSb
 nM4xcBc7z655qN+Cru6oSNnCiIY1+Bv4wtiEC0Z9QtMNEupLbDnM+on7tCSd/2DTM13q
 faGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tbkt+C4efCJ3Q59POnFA7zDTOfPNIt3ODicqdhJhkG0=;
 b=dPJZrumpsRhg0/L0pQXdrFv6zQEhqcvoPAijH+ixMhQ7TD4T0m6kqMyUog2wD1N1+m
 NqeuUkGQi7Dz5twt0xBGdjGbKWyMoePIRMF/3qhxcvSRASKJuXT30iclQxLIthVF1tYD
 Cl6XXqUAAJ235CzVGdyNK37T/ZjFVubeSgF15WtRmkQbsJpGnnAnda6RJ8IsFr12sa9D
 q9nWYSR+WT7pXPiHcinGF59QlPTMnYNsIPz823qbhtfz9YfrGQeCBumbNPQT8cZOhiR3
 VVzQ+2W6eqCgOme53watoOVc9o/cCnllO7Lb/BUEvr4mhA06MLoOtrLZbZeURXWtoBu0
 V0Xw==
X-Gm-Message-State: AOAM530kFSJB02lJbpTuVnf8tyFsdVjGYcEEcpAi78k4KQcy3bNvDJCu
 IXW9UEiHLBm02YJDHTy9pQS3srHg8Aw=
X-Google-Smtp-Source: ABdhPJyAW+fEvO1v3bFUt0/cpGgMMu+Tg39X68eUteYhnYqPT4MqEMAS2NHlGl0RhyJw9h0OWgaVOA==
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr11558401wmq.182.1630933888250; 
 Mon, 06 Sep 2021 06:11:28 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
Date: Mon,  6 Sep 2021 15:10:39 +0200
Message-Id: <20210906131059.55234-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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

CPUID leaf 12_0_EBX is an Intel-defined feature bits leaf enumerating
the platform's SGX extended capabilities.  Currently there is a single
capabilitiy:

   - EXINFO: record information about #PFs and #GPs in the enclave's SSA

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-9-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 21 +++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2cd1487bae..c0d5c3c621 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -655,6 +655,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
 #define TCG_SGX_12_0_EAX_FEATURES 0
+#define TCG_SGX_12_0_EBX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1202,6 +1203,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
     },
+
+    [FEAT_SGX_12_0_EBX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx-exinfo" , NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 0x12,
+            .needs_ecx = true, .ecx = 0,
+            .reg = R_EBX,
+        },
+        .tcg_features = TCG_SGX_12_0_EBX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 29e6490ed6..bc4b7cd727 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -578,6 +578,7 @@ typedef enum FeatureWord {
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
+    FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



