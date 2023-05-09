Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2CE6FC252
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHf-0005Hl-Hg; Tue, 09 May 2023 05:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHd-0005HD-Ug
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHb-0004wv-Dn
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1peDEFReQuWGUgl+qWBUbJy4zGUSyiPji6CSL7mNcg=;
 b=RoP3vJCVB1k0Yoma4mNvP9tBELO2THv3R2C259KiImwxGNsCBXBNJsJi6GxojDiD4+h7Z9
 vgHRvGlxA1YnLH+wh+NrvwlWRAofbxwyNZeqgC8wpXm2m0Gd7z+seB68lIEpSDim+VKG+N
 MRz5wjwUB5tCP+3WN5pIfLydnAS84sk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-pIzRyw8hMZupTEeSMhDWcQ-1; Tue, 09 May 2023 05:05:17 -0400
X-MC-Unique: pIzRyw8hMZupTEeSMhDWcQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bc1a01cffso5167277a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623116; x=1686215116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1peDEFReQuWGUgl+qWBUbJy4zGUSyiPji6CSL7mNcg=;
 b=MdwZ7Snqi5Wbaa28l5LMvLWaUpyOMpbMaVxQyG0p36CTdpBZaK7lUnhQZMtnifh6xD
 UDIsV3ZDcUBZzlerubQG2kym3IgaJiZb2JOYIg3nhuONL9ue26CQ2M2q9lQjOJwbu55B
 Gcz2shUPy70QFwtspbiq7ztEq+CHZyyh6/5ARQmBtX5cyLXclU4GBnbmOVQq4UZj2Ngk
 pIBCA0qcZuQ2k9/d4FgYCFTSbzdMt+kT/rvRTyCG6/+ULcC/jHvV9gDoixiWtoxUVavv
 OwNHzvnZCqxSqQDM7CAZysh/rDAVkMSzF3MEUFeXoJ9llTwUzst2Yt/l2zAOPDycwQD7
 pdmA==
X-Gm-Message-State: AC+VfDwdVvkdtioDi0puzXnaJO06GRJ6NEnCe+obbf88Cre6G/Tbotta
 n6rzKFhPwPsOCxjCjMFMKExIIjoA1p6MkDrn6Tp3Gg/rO68sNk+D+zecy7+RpX5X4nyWWkYQEwg
 DwzbfM3rQ/ywTxQNh98DgShKMjfukkzg+B/T+5AX+gYop4WyjSvccPswQR1WTHIbNXu2Mv/NVTR
 Y=
X-Received: by 2002:aa7:cd5a:0:b0:506:983f:1f61 with SMTP id
 v26-20020aa7cd5a000000b00506983f1f61mr8759537edw.3.1683623116086; 
 Tue, 09 May 2023 02:05:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O+QHwJop288YJyH659y1/JCbMwmiZ/kmlF+m/5y8P4KJ/uYczEtu4UBp0lE4dYfSFR9axlg==
X-Received: by 2002:aa7:cd5a:0:b0:506:983f:1f61 with SMTP id
 v26-20020aa7cd5a000000b00506983f1f61mr8759525edw.3.1683623115817; 
 Tue, 09 May 2023 02:05:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r9-20020aa7c149000000b00509d1c6dcefsm528701edp.13.2023.05.09.02.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Babu Moger <babu.moger@amd.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 11/16] target/i386: Add feature bits for CPUID_Fn80000021_EAX
Date: Tue,  9 May 2023 11:04:48 +0200
Message-Id: <20230509090453.37884-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Babu Moger <babu.moger@amd.com>

Add the following feature bits.
no-nested-data-bp	  : Processor ignores nested data breakpoints.
lfence-always-serializing : LFENCE instruction is always serializing.
null-sel-cls-base	  : Null Selector Clears Base. When this bit is
			    set, a null segment load clears the segment base.

The documentation for the features are available in the links below.
a. Processor Programming Reference (PPR) for AMD Family 19h Model 01h,
   Revision B1 Processors
b. AMD64 Architecture Programmer’s Manual Volumes 1–5 Publication No. Revision
    40332 4.05 Date October 2022

Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Link: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
Link: https://www.amd.com/system/files/TechDocs/40332_4.05.pdf
Message-Id: <20230504205313.225073-5-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 24 ++++++++++++++++++++++++
 target/i386/cpu.h |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 25ba7d0837ca..fd3909b5a357 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -942,6 +942,22 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .tcg_features = 0,
         .unmigratable_flags = 0,
     },
+    [FEAT_8000_0021_EAX] = {
+        .type = CPUID_FEATURE_WORD,
+        .feat_names = {
+            "no-nested-data-bp", NULL, "lfence-always-serializing", NULL,
+            NULL, NULL, "null-sel-clr-base", NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+            NULL, NULL, NULL, NULL,
+        },
+        .cpuid = { .eax = 0x80000021, .reg = R_EAX, },
+        .tcg_features = 0,
+        .unmigratable_flags = 0,
+    },
     [FEAT_XSAVE] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -6168,6 +6184,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ebx |= (sev_get_reduced_phys_bits() & 0x3f) << 6; /* EBX[11:6] */
         }
         break;
+    case 0x80000021:
+        *eax = env->features[FEAT_8000_0021_EAX];
+        *ebx = *ecx = *edx = 0;
+        break;
     default:
         /* reserved values: zero */
         *eax = 0;
@@ -6597,6 +6617,10 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
         }
 
+        if (env->features[FEAT_8000_0021_EAX]) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
+        }
+
         /* SGX requires CPUID[0x12] for EPC enumeration */
         if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b45a97275bd0..b8c56936bdd5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -600,6 +600,7 @@ typedef enum FeatureWord {
     FEAT_8000_0001_ECX, /* CPUID[8000_0001].ECX */
     FEAT_8000_0007_EDX, /* CPUID[8000_0007].EDX */
     FEAT_8000_0008_EBX, /* CPUID[8000_0008].EBX */
+    FEAT_8000_0021_EAX, /* CPUID[8000_0021].EAX */
     FEAT_C000_0001_EDX, /* CPUID[C000_0001].EDX */
     FEAT_KVM,           /* CPUID[4000_0001].EAX (KVM_CPUID_FEATURES) */
     FEAT_KVM_HINTS,     /* CPUID[4000_0001].EDX */
@@ -953,6 +954,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 /* Predictive Store Forwarding Disable */
 #define CPUID_8000_0008_EBX_AMD_PSFD    (1U << 28)
 
+/* Processor ignores nested data breakpoints */
+#define CPUID_8000_0021_EAX_No_NESTED_DATA_BP    (1U << 0)
+/* LFENCE is always serializing */
+#define CPUID_8000_0021_EAX_LFENCE_ALWAYS_SERIALIZING    (1U << 2)
+/* Null Selector Clears Base */
+#define CPUID_8000_0021_EAX_NULL_SEL_CLR_BASE    (1U << 6)
+
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)
 #define CPUID_XSAVE_XGETBV1    (1U << 2)
-- 
2.40.1


