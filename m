Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD16F2493
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVq-0006Gj-FK; Sat, 29 Apr 2023 08:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVc-0006GN-74
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVa-0004uY-Bq
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5jCDgOpo4kOJBA8VgoEFYVbYBz41TlczOJAa/4zYuU=;
 b=cL0xcohUUINCoSbqAUZ8+UvbQKCXeJ5BRyXCVtujPuuE75jrIvBJ66MXi6qy+5pDqNI8rR
 xNNFa8ObrPTgMAwrG9W5vSsQfvBzhw7spxCzHI0EH6mVjlCHI8yD+tdMyx4FryzieEYNHZ
 b8iZlOWVVSDkc94gDHXzVr69Be/5sdQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-_nelRE9vM96qy6yvCUt-uA-1; Sat, 29 Apr 2023 08:16:55 -0400
X-MC-Unique: _nelRE9vM96qy6yvCUt-uA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-509e422cfb3so840719a12.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770614; x=1685362614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5jCDgOpo4kOJBA8VgoEFYVbYBz41TlczOJAa/4zYuU=;
 b=VTggE+raU3AvbfHuaHGc9H6y8xc5Zt7aNxPb1DXktip/okNAqFQ1tFUp+jRKqxlJjI
 7rnaB1tSncIvGxBfPPXyUZlhv865BN0/ROZdpiALM+6+567uZn/HfAMzhhmJkwWtdkBl
 SKycp3ksk0PddS8vZ0EOVhYe+84scfbUE2oeqiFNSydoUJVuS2PT9kJiBSjOEBQOIPOX
 ZU1/cY1CthYyIKm+ofw1NAQirwCms2B/pVdyK1VjBfDF1OJRKybNvF7woVYQESD5sfUq
 MD7SMqTBgEiI7NI+wPR2W+FGLPCGeM/MWBw9lht0XratmEiz+9BG8OF3z9RMbkREr52t
 LEUw==
X-Gm-Message-State: AC+VfDzriPPFsklgYKooOOwN/n5Up2XMF6k9+P5pIhKloImsFr00m72p
 T4g/WlhZ8fkKDaFyDZvE4j7AQZdmz/oBUcS2BYiivE/RZLSIsF16l7rmoS8VyXdMST4qLLYlc3Z
 YZIvXHZ5BQA/3RXNBJ8rD5ZSmNkeuuuNlXOs181yVrllcyst1E40u6yBuga4kSkUkUSjtTqrgAz
 8=
X-Received: by 2002:a17:906:58ca:b0:94e:ff23:992a with SMTP id
 e10-20020a17090658ca00b0094eff23992amr7997565ejs.59.1682770613929; 
 Sat, 29 Apr 2023 05:16:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7R+sUe8VizOUa8+uZEDbAF37X80kEgfc0ZtP5q34eIBVhQ64JauV01p0BSXkvxNDxvqFYwaQ==
X-Received: by 2002:a17:906:58ca:b0:94e:ff23:992a with SMTP id
 e10-20020a17090658ca00b0094eff23992amr7997544ejs.59.1682770613499; 
 Sat, 29 Apr 2023 05:16:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 qw16-20020a1709066a1000b00959b3c30f2csm7783764ejc.222.2023.04.29.05.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 08/17] target/i386: Add support for AVX-VNNI-INT8 in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:27 +0200
Message-Id: <20230429121636.230934-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxi Chen <jiaxi.chen@linux.intel.com>

AVX-VNNI-INT8 is a new set of instructions in the latest Intel platform
Sierra Forest, aims for the platform to have superior AI capabilities.
This instruction multiplies the individual bytes of two unsigned or
unsigned source operands, then adds and accumulates the results into the
destination dword element size operand.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 4]

AVX-VNNI-INT8 is on a new feature bits leaf. Add a CPUID feature word
FEAT_7_1_EDX for this leaf.

Add CPUID definition for AVX-VNNI-INT8.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-5-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 22 +++++++++++++++++++++-
 target/i386/cpu.h |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8eb2ee5045d7..abceab2b6992 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -667,6 +667,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
 #define TCG_7_1_EAX_FEATURES (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | \
           CPUID_7_1_EAX_FSRC)
+#define TCG_7_1_EDX_FEATURES 0
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
@@ -890,6 +891,25 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         },
         .tcg_features = TCG_7_1_EAX_FEATURES,
     },
+    [FEAT_7_1_EDX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            NULL, NULL, NULL, NULL,
+            "avx-vnni-int8", NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = {
+            .eax = 7,
+            .needs_ecx = true, .ecx = 1,
+            .reg = R_EDX,
+        },
+        .tcg_features = TCG_7_1_EDX_FEATURES,
+    },
     [FEAT_8000_0007_EDX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -5534,9 +5554,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             }
         } else if (count == 1) {
             *eax = env->features[FEAT_7_1_EAX];
+            *edx = env->features[FEAT_7_1_EDX];
             *ebx = 0;
             *ecx = 0;
-            *edx = 0;
         } else {
             *eax = 0;
             *ebx = 0;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 1f72d11e0ccc..0b25d180753b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -626,6 +626,7 @@ typedef enum FeatureWord {
     FEAT_SGX_12_1_EAX,  /* CPUID[EAX=0x12,ECX=1].EAX (SGX ATTRIBUTES[31:0]) */
     FEAT_XSAVE_XSS_LO,     /* CPUID[EAX=0xd,ECX=1].ECX */
     FEAT_XSAVE_XSS_HI,     /* CPUID[EAX=0xd,ECX=1].EDX */
+    FEAT_7_1_EDX,       /* CPUID[EAX=7,ECX=1].EDX */
     FEATURE_WORDS,
 } FeatureWord;
 
@@ -920,6 +921,9 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 /* Support for VPMADD52[H,L]UQ */
 #define CPUID_7_1_EAX_AVX_IFMA          (1U << 23)
 
+/* Support for VPDPB[SU,UU,SS]D[,S] */
+#define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.40.0


