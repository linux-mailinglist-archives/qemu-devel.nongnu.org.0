Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC426FC24B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:06:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHk-0005bV-Kr; Tue, 09 May 2023 05:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHh-0005QS-5n
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHZ-0004vo-Rl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aY2LkynvDT/iTVr4Ey1aaB7sG+QqosvRAFtEKonjlA=;
 b=cQPGJh7I2wzNQeR50g0bl9smlfwj+NJ0ik+34h6iriQid/L6p3PWr2J2NHoCa0WII+nNAU
 UdGFi65yl8mbkhEEsRI/qZ70dg6W/nx74jai/lbE1r0SjPnIuUbbcKTRnWEN8hTElNqmke
 FXCrz2J7YYJJOvFLKGe8gshgV6Cuzho=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-CYTbBRayOTmUPZ7k_bVGBg-1; Tue, 09 May 2023 05:05:16 -0400
X-MC-Unique: CYTbBRayOTmUPZ7k_bVGBg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-965fcb08b69so448720666b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623114; x=1686215114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1aY2LkynvDT/iTVr4Ey1aaB7sG+QqosvRAFtEKonjlA=;
 b=Fa/GY79NGEdgCnpxHiGW7Yl7p9P72PSwKT97z01onKkVvFVU9KSbYgmQ15DriJFnFf
 zPy8hDwmPfO5cgavuScY9R3aI5RAT+2rRmDsM/QXUErP6ME1tCUvekTYcP819kinRsaX
 Wwk2oAOnPsm/ODvlL1HgzYjuaCpeLCw6KikAzYnl2JT6qA9QJ0Nn2tpAzjj9K7XbegvB
 3XDZj5Nlirqg05pmPbmNn44NQGZdaMTqjMnZJgnh/Q1tTph7n0Wdmqtd8c4DuzoBnlcA
 65XNuDByHdv+AFHLCFNih1NWYPMpnwMiXNkOVWWSjSrzF5utk1VSSTdKZRfmPniQ/qTy
 6OsQ==
X-Gm-Message-State: AC+VfDyvIMMtD9Moq8xcy5/gbMOxGIGbHSAuz+9Vmho+UFJLznGAQJRT
 L8HA0XUGY74vQjk6B2D9GvxkLWhwudr0yCffFJ8T6f/BPRzGyMzLGikL5tgB1tnNtoQYfg4zE7+
 BaQSnfFdcdYMeAL5oknvN7KsuXuQiZjyc0VIQHlYZubr+3M5SwGhbVgiYSUDHKPmHtYpHXZfELp
 A=
X-Received: by 2002:a17:906:d542:b0:953:7e25:2156 with SMTP id
 cr2-20020a170906d54200b009537e252156mr11148296ejc.51.1683623114677; 
 Tue, 09 May 2023 02:05:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7z93HTRoX3X82gHjIsM5yG9aIzjTo0XRklhHo4LVAcarAEPkYPsRpVQEqjq0ykp2c3TLyilw==
X-Received: by 2002:a17:906:d542:b0:953:7e25:2156 with SMTP id
 cr2-20020a170906d54200b009537e252156mr11148277ejc.51.1683623114386; 
 Tue, 09 May 2023 02:05:14 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 nb27-20020a1709071c9b00b00966265be7adsm1071917ejc.22.2023.05.09.02.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Babu Moger <babu.moger@amd.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 10/16] target/i386: Add a couple of feature bits in
 8000_0008_EBX
Date: Tue,  9 May 2023 11:04:47 +0200
Message-Id: <20230509090453.37884-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

amd-psfd : Predictive Store Forwarding Disable:
           PSF is a hardware-based micro-architectural optimization
           designed to improve the performance of code execution by
           predicting address dependencies between loads and stores.
           While SSBD (Speculative Store Bypass Disable) disables both
           PSF and speculative store bypass, PSFD only disables PSF.
           PSFD may be desirable for the software which is concerned
           with the speculative behavior of PSF but desires a smaller
           performance impact than setting SSBD.
	   Depends on the following kernel commit:
           b73a54321ad8 ("KVM: x86: Expose Predictive Store Forwarding Disable")

stibp-always-on :
           Single Thread Indirect Branch Prediction mode has enhanced
           performance and may be left always on.

The documentation for the features are available in the links below.
a. Processor Programming Reference (PPR) for AMD Family 19h Model 01h,
   Revision B1 Processors
b. SECURITY ANALYSIS OF AMD PREDICTIVE STORE FORWARDING

Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Link: https://www.amd.com/system/files/documents/security-analysis-predictive-store-forwarding.pdf
Link: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
Message-Id: <20230504205313.225073-4-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 90a650a836a0..25ba7d0837ca 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -933,10 +933,10 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, NULL, NULL,
             NULL, "wbnoinvd", NULL, NULL,
             "ibpb", NULL, "ibrs", "amd-stibp",
-            NULL, NULL, NULL, NULL,
+            NULL, "stibp-always-on", NULL, NULL,
             NULL, NULL, NULL, NULL,
             "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
-            NULL, NULL, NULL, NULL,
+            "amd-psfd", NULL, NULL, NULL,
         },
         .cpuid = { .eax = 0x80000008, .reg = R_EBX, },
         .tcg_features = 0,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8504aaac6807..b45a97275bd0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -946,8 +946,12 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_8000_0008_EBX_IBRS        (1U << 14)
 /* Single Thread Indirect Branch Predictors */
 #define CPUID_8000_0008_EBX_STIBP       (1U << 15)
+/* STIBP mode has enhanced performance and may be left always on */
+#define CPUID_8000_0008_EBX_STIBP_ALWAYS_ON    (1U << 17)
 /* Speculative Store Bypass Disable */
 #define CPUID_8000_0008_EBX_AMD_SSBD    (1U << 24)
+/* Predictive Store Forwarding Disable */
+#define CPUID_8000_0008_EBX_AMD_PSFD    (1U << 28)
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)
-- 
2.40.1


