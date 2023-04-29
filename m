Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A6D6F249B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVb-0006Ex-4m; Sat, 29 Apr 2023 08:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVZ-0006EF-CU
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVX-0004uB-Qg
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1icCCj5SrF32zbacKrFKTJjuTNf5Lvd8BnQQFfyUhY=;
 b=O8pg63YFBqDAa4YPGXUNTB3931xoIaf4yTD8R2ZShOr6NrmqVLowpT3dnjcAGrlGtrq3cB
 9594z+ptGhxlw8OpvsqkfZiZyCnYXiLKMANETTu1NZM5r3I4/8NPGvFBKA+xOOpaTv/vLn
 Ou197nEJ87aW9m5JxzWBrWHAnj8eFGs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-eQd0Jn68N9KziYY9R3cl8w-1; Sat, 29 Apr 2023 08:16:53 -0400
X-MC-Unique: eQd0Jn68N9KziYY9R3cl8w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94ee1fc1233so81540066b.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770612; x=1685362612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1icCCj5SrF32zbacKrFKTJjuTNf5Lvd8BnQQFfyUhY=;
 b=LmvNB2EnRUK9ueZEgoVFPPiaI42HC3oV1b4uju9uRsZm1lQDn4DV5pY73TEYw5daBw
 Pb78GtzyldN+x6ppJoz2oFAqX4XWJOq0oiCGHvsY+HdlddJQEPMrKOKS+AJRYyqQs5bB
 OGtGcyOg8D/2JqCmhn3Nl21wP4WLcxXCke0fEB0ksv8Gwnc7qXff3ZSVdYey+k8JsaRL
 337JaxYXhlihyPfClYfPhOfPo9/6j833Y1PKf2TWZE5YnrUempSsOBuLbMWlOcbcWUXT
 Nbu6Tf/b2mx4EZGtQ8Yjmr92LOZK3OcX4yjuY710278f6sbLHU4VYneEC2bVUnjgKfp1
 fSbQ==
X-Gm-Message-State: AC+VfDwBixTtpgLefzmr6IBtPX0orXaU5oRy+Oc8Rfct7aJnLGTBFzDk
 Jd3KFDvKTAOrny+M/FOzwoGmPKPfHetDrTHznTwf1xaWjbuTiGWyl+y1foaSmdELLNvt8ZJOx0e
 clB4h/Oy9k6KOBfxkOpb7fARxsUmAQX6Ptf+P/7MULVUH2yxwMSnRIcH3iZvwVZlboYIdOpCzA8
 c=
X-Received: by 2002:a17:906:6a28:b0:947:5acb:920c with SMTP id
 qw40-20020a1709066a2800b009475acb920cmr7837281ejc.34.1682770611901; 
 Sat, 29 Apr 2023 05:16:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Gjf1viUV7vxAcRRNmpn4wh1xGIOXvwkI2nJMYqMEhjhk99HMsTjGRjzSPgqkmtpHxV253mA==
X-Received: by 2002:a17:906:6a28:b0:947:5acb:920c with SMTP id
 qw40-20020a1709066a2800b009475acb920cmr7837267ejc.34.1682770611598; 
 Sat, 29 Apr 2023 05:16:51 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 sb21-20020a170906edd500b0094f4d2d81d9sm12439648ejb.94.2023.04.29.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 07/17] target/i386: Add support for AVX-IFMA in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:26 +0200
Message-Id: <20230429121636.230934-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

AVX-IFMA is a new instruction in the latest Intel platform Sierra
Forest. This instruction packed multiplies unsigned 52-bit integers and
adds the low/high 52-bit products to Qword Accumulators.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 23]

Add CPUID definition for AVX-IFMA.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-4-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 841c407d6d76..8eb2ee5045d7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -879,7 +879,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, "amx-fp16", NULL, NULL,
+            NULL, "amx-fp16", NULL, "avx-ifma",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7deb37eca5a8..1f72d11e0ccc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -917,6 +917,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_FSRC              (1U << 12)
 /* Support Tile Computational Operations on FP16 Numbers */
 #define CPUID_7_1_EAX_AMX_FP16          (1U << 21)
+/* Support for VPMADD52[H,L]UQ */
+#define CPUID_7_1_EAX_AVX_IFMA          (1U << 23)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.40.0


