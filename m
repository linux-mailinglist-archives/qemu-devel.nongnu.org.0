Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43E4037B9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:19:45 +0200 (CEST)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNugC-00048W-Bx
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS0-0006uT-SU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0002yP-8L
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:04 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso1086185wmc.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slJavCchRN6P9oEFDk77dniIx1JCzFVwonQK3t9I4XM=;
 b=kxdMOTuhtMOyBL+yHpLKxe2TRuxBWii7Abg/ukMrdIRXQTV15euKdYHAaawyUbVuYa
 HsZmdtjW7L1S40f09hz1VS7FTUUM5oDaWukHYP0nCnS0uVda/B09+tEnFSp3JeAofb7i
 ksDhIvT5QhHrJ/Bn6HKh4sxINj/vUKG/DaOAkCwI2dkc4W6UEEP+lrR7maH8ZLjerKO3
 /DAupNQdYMOrzxFQCdNtxrRBNmo60Cdfm3GUiVslYW6fxC2EljXUrj3HY788C0Dtn8Xz
 DALN6Xd/I7NEodqUSzmi6R6GVZuRHUzmDoC6PX1S3vKWPQVgKwXY+8NGXtbccvc3WG/8
 r4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=slJavCchRN6P9oEFDk77dniIx1JCzFVwonQK3t9I4XM=;
 b=kjG3bBXVg46fsf9z+eflN5kV79PKkE8ph0077khdiXATipXDn94OcqjfW/cvE5LA9R
 AqvLpI+ZzAAxGMdS+RHS7hLmos7vQHjBAIHLFhdbGZB2q60a6YbxraG5VJjwr6pwmlp0
 +ZXZ/mHFK+gZgWSKnAy/0qhozokaYKE7e+xY1NWDr476XF88n1AdBWmbSInzatI/45/N
 Y2jsfydNKsCqJNgKjJJGPNd8++Q+31y/jPfKOgFg3Fza/R3j3GAofydkkCKzUx2hhzkP
 Cn9zIN/RulYohb7RI2G9DPHxZ8yynNagQULCBBAO/MGBgoGPwOgeHYrJRHFLFLYC5Aai
 I08w==
X-Gm-Message-State: AOAM530K3gqWUuny1Cj3DXKBcO8zJIpSqGzZT2oGuA1zc6X3bX76gp/a
 gHbp8SQCuN+okEGrlWWeene+3E5+3ng=
X-Google-Smtp-Source: ABdhPJxyOO7GvlWuY9YMUXV8C1FCvS2InPkhHIpFqAp1hYM1zZ2G7PoTJg3f9/6pu/EmtC+lP/u5Aw==
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr2760824wmq.182.1631095486723; 
 Wed, 08 Sep 2021 03:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 15/43] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
Date: Wed,  8 Sep 2021 12:03:58 +0200
Message-Id: <20210908100426.264356-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
index a3fe44455d..959f679077 100644
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



