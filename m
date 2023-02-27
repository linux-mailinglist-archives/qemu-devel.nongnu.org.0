Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8836A48D3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhjI-0004Cg-Dl; Mon, 27 Feb 2023 12:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjG-0003xz-7u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhjE-0004Rc-Lm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDRpN2RbBpiRa4rTPCsj8SL7qgOjtTiEajWupum1TjA=;
 b=GEDb+oL4uEhQ3vx5rRuwLjjOaHIZi9yABdSsTaqTsAYeWP3vD1s9N7n6owM7wfpX4ZMK9v
 gzGa9VO9xTBZXW6qCpch/6goaORbYJDnSpWFKbkEU0y+mMyv5viikpbMh7DkXx0LFWqXPX
 9L9/oU7uI/AQSofqOS3GnGgDhB9ApKk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-BWO6OnsjP4-bVT5qCHPq5A-1; Mon, 27 Feb 2023 12:55:57 -0500
X-MC-Unique: BWO6OnsjP4-bVT5qCHPq5A-1
Received: by mail-ed1-f72.google.com with SMTP id
 w11-20020a05640234cb00b004b3247589b3so6947050edc.23
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDRpN2RbBpiRa4rTPCsj8SL7qgOjtTiEajWupum1TjA=;
 b=XRWnX3uNWob9GgbAMT8x3cB2s0g7FRtw52niTzuA32I/ZPWNhxcqluRaZqnGkjRxxX
 E5EEXfPbBZ/jLHG8q4Fm2aLnSYEHLbvHWebhjG2L5qJ1NNSe+QLFkPPXwoR8ZGqjpzaC
 L4U9QqSx3noJiojofzBwEQcnfF4iEQ9Yix60Cr2r/yEGkK28hL7mnYZHgT50aGkO7Lvx
 KJa7zzGUVxC5RpiqBfi8N4Rov/yRnybHI8PEfpTJKCGWQzNVeII6wbjV2fzBXfdIGged
 2M/c2+Q/vRW3W1yj+z8ysvK6CYa+H3MLkxBrSVoIJiNE2+Pxk7Y9LOFgMr72oeQNN6TE
 NL4w==
X-Gm-Message-State: AO0yUKX4Crs+sgiuq/oSBSu37t/+/wLp45dBPcr3jIkBD52syjrqbDf9
 luty/WG2diOx/N871mpgDih3WyP2/un0LMmM8MCuoN7WeSyiAX641H10axBj763FqA62tXvCN9W
 jx/SEjNwYH/A5ZtLxvSHyKiNyNalx/fckblTVpaqMiV9by3Kp9PU5AtSVYOZ6/ypjbfHamJry
X-Received: by 2002:a17:906:f8c6:b0:7c0:efb9:bc0e with SMTP id
 lh6-20020a170906f8c600b007c0efb9bc0emr37789906ejb.62.1677520555894; 
 Mon, 27 Feb 2023 09:55:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9gMDKq6KfHru7lGEGBBwuh/4qvgPhhhHssHvDj3driIth2IvkAEpe+3jzrL2ba0scU9HnV6Q==
X-Received: by 2002:a17:906:f8c6:b0:7c0:efb9:bc0e with SMTP id
 lh6-20020a170906f8c600b007c0efb9bc0emr37789891ejb.62.1677520555690; 
 Mon, 27 Feb 2023 09:55:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a17090640d800b008b1797b77b2sm3475014ejk.221.2023.02.27.09.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 11/13] target/i386: add FZRM, FSRS, FSRC
Date: Mon, 27 Feb 2023 18:55:22 +0100
Message-Id: <20230227175524.710880-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These are three more markers for string operation optimizations.
They can all be added to TCG, whose string operations are more or
less as fast as they can be for short lengths.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 7 ++++---
 target/i386/cpu.h | 7 +++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 34e2cead870e..26ec6e9da754 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -662,7 +662,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
 #define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
-#define TCG_7_1_EAX_FEATURES 0
+#define TCG_7_1_EAX_FEATURES (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | \
+          CPUID_7_1_EAX_FSRC)
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
@@ -872,8 +873,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             NULL, NULL, NULL, NULL,
             "avx-vnni", "avx512-bf16", NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "fzrm", "fsrs",
+            "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a21..e0703feb5ed0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -900,6 +900,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* Fast Zero REP MOVS */
+#define CPUID_7_1_EAX_FZRM              (1U << 10)
+/* Fast Short REP STOS */
+#define CPUID_7_1_EAX_FSRS              (1U << 11)
+/* Fast Short REP CMPS/SCAS */
+#define CPUID_7_1_EAX_FSRC              (1U << 12)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.39.1


