Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA44170EA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:34:14 +0200 (CEST)
Received: from localhost ([::1]:49130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjT3-00056e-TO
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKT-0007cg-GE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKR-0000Sh-Ek
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id u27so34244326edi.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pw9T6U+ItUvrcf1Uv1vMdmH5sv75PyI2Siw9k4uTTEg=;
 b=V1tduOLeZHidnzqVX0SWOAqFmOSlNPHb3Ju423Qb3Bny9UTcbN3ncAyF55S8YFB0yo
 TsHtwJ58tsalNQaIQz4Q/tK/VAz8523hPLm5TWvtIaaQ3/NbQqjqO81vJrpy0Zd7QCsu
 /QbKvHydvZAHFH1TuZTflLyovGvGIkQNdPc1bndR1jPkbBcGnbZvfLq6DdsQrbVaHldW
 XURNXuGeeKvpPalKHe6woxl2W8cz/cB9CHES8rxV8PheqzhYp5dWXos2ifStv3hwrawn
 NbgIhXQZl2G0P7ByEADhcPP32CBnqzbmQGfpoOznJaGEi6y9ZGJ/GFZpI8qPIaNUdwSN
 cBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pw9T6U+ItUvrcf1Uv1vMdmH5sv75PyI2Siw9k4uTTEg=;
 b=HGWNHDBlmamw1p7FnlpucP2LCYgOv2S8xNTArT9JSKeHPOSHupbhPeM8ArQnkxPOwZ
 nRcOyFY3UoKhaWQ+KWxGBjSFY20mPMAvMHDMR4hTQ/XnPGedWb9tu251XuJFwAWPwxek
 vkkySM60oasEYlxT+jhuMLeRcfDgwha4PFBgdDgv2uZn3AKgzHnu8bj98pJsVEM7hIZA
 ssTm8PQxD1P013sAlMBchXknchLeWGsssZa2rdj9SewvVM7jSzAC2UrVGIwDSJ5SlrTV
 oR5uuvUxArB2iL6l5gYwKveHWx2tP/VLtXMWUZtorfSrwBzNFTSjoCIE9ZLodJmTm98t
 Ixxw==
X-Gm-Message-State: AOAM533TCY4i+h5Q0o9jiBwsKYNsbJ8ydu8ONcLmHCCVjj/fJqnYmk7I
 hPzKC2Esf6eXvdUGOkmiA3gO2/G9+II=
X-Google-Smtp-Source: ABdhPJzXTnCodpawR/LJbaJRoD9phhcvXyzrLDMxw18daZ6F+S2o6vmjRDE2tdbxiu7qEMTFjS8gRg==
X-Received: by 2002:a50:d844:: with SMTP id v4mr4435540edj.378.1632482718181; 
 Fri, 24 Sep 2021 04:25:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/26] i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
Date: Fri, 24 Sep 2021 13:24:52 +0200
Message-Id: <20210924112509.25061-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
index cde446cc34..0cdbcb9e4c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -579,6 +579,7 @@ typedef enum FeatureWord {
     FEAT_VMX_VMFUNC,
     FEAT_14_0_ECX,
     FEAT_SGX_12_0_EAX,  /* CPUID[EAX=0x12,ECX=0].EAX (SGX) */
+    FEAT_SGX_12_0_EBX,  /* CPUID[EAX=0x12,ECX=0].EBX (SGX MISCSELECT[31:0]) */
     FEATURE_WORDS,
 } FeatureWord;
 
-- 
2.31.1



