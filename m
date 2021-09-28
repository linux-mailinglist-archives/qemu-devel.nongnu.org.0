Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0D41AF9F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:05:00 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCn5-00055k-3h
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0006Oq-Vq
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa3-0001OO-Js
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:32 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ba1so24896014edb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIZhtxRfpLD3As3rA5Gn2uhFgwLP60EEjiPbzW6gvTs=;
 b=fIuyGEC+290iYNf+wnJdzfIkdgk1+FG+6JUqcJPb9pC2gfoAe7r+AGma0XCSlxV9gw
 SnS+jEPmk0Of6h/LaPz9LA5eKuMwNeIFWpe1yUNn1rN3/ozijHdyVuCDsyyOGl37qkZ7
 1zd8ZdyTewiAyOI9JQZJ2MPLosBPPHQZyPc4HKli8voWHOfFVOVaOUdnOZWMQAZt8I+a
 u4sVx/hDYV+CO1oQt6MrCfA4q7h20Ur6f8sCRUNsvG5znrRGPWD6Tzhhz2waCTjUHXnl
 cNvR+KAryF/vvVD45C4HuIB3H3R/97+8UZKxW4aq7PXoLkqoQgRsDYoyxi6qlG6NDCgS
 OGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vIZhtxRfpLD3As3rA5Gn2uhFgwLP60EEjiPbzW6gvTs=;
 b=3eznOxOdgOJfYZfLleoJLQawU/zGxpPAR7szuYuPhQ/ER/bjK3311XVGETHeb1rF/+
 tJ9L+gToJ/9BcHns/hqTtXVsdyYSvceEvVTlVgkPAmzqw5RD5Y8dpE3Bta8mBv3PYHbI
 TnToZNB8EJ8/ikY0hyehG1Qf3DmBFWmsfzEoETZ8fMaUQq846XnK53/R6ENs/9tg9i9u
 Uq9iiM2fLjYouSnWJsMvMD1sPZJqnlV/CMRTgLiotRFDQkV3xaHDxClUiIP0/nNbjOEu
 l37Yx9J5jMbh1w55LfYFKoA98Gc5UgQWzZWDVZODbtoCuDcJ82YSZeGFte7c5KqqGdXR
 R4mQ==
X-Gm-Message-State: AOAM531xtwFHhibM5QIUG7LkaUN9e3FA4Ucye7bhwkwkU0RyElPTDRUx
 9wWhLToEafS2+JbQ0I3Ppkdj64OqQWE=
X-Google-Smtp-Source: ABdhPJzDqUvSWnTkHHa4jOwxrYjgMIsj443eWJ5kY8enoGInCWd1f6eJumUFFu6JOfeT3EtoQqOYVQ==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr6586851ejy.532.1632833485339; 
 Tue, 28 Sep 2021 05:51:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Tue, 28 Sep 2021 14:50:51 +0200
Message-Id: <20210928125116.183620-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

CPUID leaf 12_0_EAX is an Intel-defined feature bits leaf enumerating
the CPU's SGX capabilities, e.g. supported SGX instruction sets.
Currently there are four enumerated capabilities:

    - SGX1 instruction set, i.e. "base" SGX
    - SGX2 instruction set for dynamic EPC management
    - ENCLV instruction set for VMM oversubscription of EPC
    - ENCLS-C instruction set for thread safe variants of ENCLS

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-8-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 20 ++++++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 21d2a325ea..2cd1487bae 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -654,6 +654,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           /* missing:
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
+#define TCG_SGX_12_0_EAX_FEATURES 0
 
 FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
@@ -1182,6 +1183,25 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .tcg_features = TCG_14_0_ECX_FEATURES,
      },
 
+    [FEAT_SGX_12_0_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "sgx1", "sgx2", NULL, NULL,
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
+            .reg = R_EAX,
+        },
+        .tcg_features = TCG_SGX_12_0_EAX_FEATURES,
+    },
 };
 
 typedef struct FeatureMask {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b6491df0f5..2b199102ef 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -578,6 +578,7 @@ typedef enum FeatureWord {
     FEAT_VMX_BASIC,
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
+    FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



