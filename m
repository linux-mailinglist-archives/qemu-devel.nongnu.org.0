Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285544170EB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:34:16 +0200 (CEST)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjT5-0005Eg-7k
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKT-0007d3-LS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKR-0000Sg-Of
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id y89so24042118ede.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiMznw01RdLQ9B39Iax6tMW439yM+ztUjpsGI5+mzRc=;
 b=l5JZME1BWCX5NGxDmKxrEUEs0H2JiuPko1yOtH7eOTtxWghMvUCGpRHzsklSXH/9CE
 2RTecHUU2hUvQ4jHiC7KMQq951oBe7Y3v1X06M5unXzSaTZiSD5/NmyOqDj0AyFfyFSV
 kYhMev1NTWRy1tGvXnQ4yiPfV4vgh5SFlSlK9VfeVRZinoj/Es7W7eFcTndx+KKIfSJA
 m3QPREun6bPIP8DN16bWTLAtvCB3LUy93SmZSI6ouHZH2c0yJbxe0F4WFOnHPEvI0Xsv
 rzN/7jcqg/M88pM13Ni0PiaEq4MZ6b+B7zNSVKl5U3GtJtOhoyK+TzNttbp3+gxWtImH
 eYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UiMznw01RdLQ9B39Iax6tMW439yM+ztUjpsGI5+mzRc=;
 b=YLaLjOcYN7dDJS6P1G/Wskq73s7fr1mVyL1mccjkbp3ERfUo9uDjtWsqcCxOJbpx5W
 kxmhmbFfjVDFSIG/jIb9PuN89CsNeBLhl0j3q9IFvWJPxbpi0/iliI4BSdg556T3udwY
 3gmCO5SjcGKrasMH9jVYChlGTRfQKZzl1FA1gOJudrt5r/oDWTeiverKHgyQT/ybqzBk
 cpyJosqo1AoeWi98D4YVkg/HhDp0H1u3sKcaW1x5HjQyXgBdHxfBMiRbZ1YLDrC3Z1Xz
 SdmrgjcCzlYSG6BMD/6vdJ4eE8FaD+EWfPDG2Qj/6KIWHQW6ytzPhCS8C/x+4Fk1NHj7
 41AA==
X-Gm-Message-State: AOAM533IM8lqOI6hZ2FpC3tpAAhlE4OTuAubpuYJg0+i7j1R5SGi3JK6
 eH4QQNiXUvRI4j/d+lSQ6Z0Juwx40OI=
X-Google-Smtp-Source: ABdhPJxlxZNNfpl5T4mBwtP180/GvGgRrg3KnbmtKze3QwXt4X9OGrXvGdBHEPRhMGp84+lUY9R4vA==
X-Received: by 2002:a17:907:2ce9:: with SMTP id
 hz9mr10541412ejc.275.1632482717466; 
 Fri, 24 Sep 2021 04:25:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/26] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Fri, 24 Sep 2021 13:24:51 +0200
Message-Id: <20210924112509.25061-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
index 3823c7c40a..cde446cc34 100644
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



