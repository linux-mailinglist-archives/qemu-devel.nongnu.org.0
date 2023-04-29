Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DE6F249D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVY-0006Dd-HV; Sat, 29 Apr 2023 08:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVV-0006A8-NJ
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVT-0004tQ-U1
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CTpkXl8qcYf/BoKwv5k/ANj9FqbYr0F84l1GbrfcI+E=;
 b=cgPwCkTGe/DFPd8Hy+2/xX8ytLSirMirVM/dZwIRYdnMWSXWKu2I+e+DdCKKKSP/pNs/oq
 pllxfYaD45eiOHwxEHE96gnAROYV19RXnb+entjPonjS1TI54IhVcnR6/PdvPgx6tuAjnO
 ep82j6ADIzfxbCiiElOgpK3Ru/nxQ20=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-JOh0elglNda2XY8fUP_Wog-1; Sat, 29 Apr 2023 08:16:49 -0400
X-MC-Unique: JOh0elglNda2XY8fUP_Wog-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a348facbbso102010866b.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770608; x=1685362608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTpkXl8qcYf/BoKwv5k/ANj9FqbYr0F84l1GbrfcI+E=;
 b=h4x35x2py6gbeXW9nmhBky1zSNFrdXTdjPqke/h2pJ1zinu39B2+1kItgne235XcXK
 ljgL03Wc8DhAJeSYVaniDanhnq/Nj/RQm2qAbtae7SFNJU2dbEP+2JysmGmXAvHfrMaU
 HVeoZgv72JeGVDk7NqYI70XmAQwBtQJkhJ3LZ9iWFQc/k35nVU2YJUVW0P0FwrBrZ8p2
 prhmO+ewUNuKTrdsQRArGrY4fxQdzdjxZVBMj9qAdns6AjTmIhcoX7IXVxY4EVIuZB/w
 G0wg/kg7twtciHhf2oIlL1q3t67d3iQRJI5VCrVfvgVqxm0UMVBj9pNRZDvzlDGUqg3H
 gR2A==
X-Gm-Message-State: AC+VfDwE1QPjRYdJ/FPUeQfMxs/03RDAuCSIuB4RglUHFA20rzNzj9Vu
 /182Yl9pqAlYAyE0L+ZnrmF9UzhSI7pk6EoswrFfpQoXzaFrmnuT/fKZhga+7t22iLnbG9A3O0u
 rGm7ohx/xpxpk3n9OhVuTmCkZz+o1+yaDMp2jIQn8Tms/g4tieCsaaWaOLD2rM3C5kEeN8GmKRp
 M=
X-Received: by 2002:a17:906:ee86:b0:957:12a6:ac9 with SMTP id
 wt6-20020a170906ee8600b0095712a60ac9mr8337467ejb.36.1682770608162; 
 Sat, 29 Apr 2023 05:16:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5d6NM2NoMj5fVpNk57xLQR8Y8cIvOChVQ0BHEhIncP8wT5JLAfEduUy74m+7elKr+xw262ug==
X-Received: by 2002:a17:906:ee86:b0:957:12a6:ac9 with SMTP id
 wt6-20020a170906ee8600b0095712a60ac9mr8337448ejb.36.1682770607849; 
 Sat, 29 Apr 2023 05:16:47 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 sb10-20020a1709076d8a00b00958079b676asm9838993ejc.122.2023.04.29.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 05/17] target/i386: Add support for CMPCCXADD in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:24 +0200
Message-Id: <20230429121636.230934-6-pbonzini@redhat.com>
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

CMPccXADD is a new set of instructions in the latest Intel platform
Sierra Forest. This new instruction set includes a semaphore operation
that can compare and add the operands if condition is met, which can
improve database performance.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 7]

Add CPUID definition for CMPCCXADD.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-2-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 73dd99374abe..67210ffd79b9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -875,7 +875,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni", "avx512-bf16", NULL, NULL,
+            "avx-vnni", "avx512-bf16", NULL, "cmpccxadd",
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d243e290d385..d5843c15558f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -907,6 +907,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* CMPCCXADD Instructions */
+#define CPUID_7_1_EAX_CMPCCXADD         (1U << 7)
 /* Fast Zero REP MOVS */
 #define CPUID_7_1_EAX_FZRM              (1U << 10)
 /* Fast Short REP STOS */
-- 
2.40.0


