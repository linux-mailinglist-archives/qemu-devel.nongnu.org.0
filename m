Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD167ECE3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx5-00010S-Jz; Fri, 27 Jan 2023 12:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwq-0000pQ-9v
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-000645-IJ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y1so5695274wru.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vUZ+5WCGd2aXzcmqtmPQybGWA36dDti6Rddo0SepbLo=;
 b=EsHt0378xchgXStbRMQ50EwmCqEUSJHqjd0lRUVPSVSNJ4z5uJlG5qWHPVay0223c1
 FTJqkj5WfawSxftsLQpTP8svFbPFzb5pp92q4jJ0pss/XHRvmUAs4cfudb46Y1+QjBzB
 Z9JQKOJRtdG60X+nNaqISKGTISnrBED7/f9Uy29PwWOyJynVsDaGEA11/zvndGS+LWNe
 urQd5mzH0g5fVrFYaVJbDaozQ3N+HxKn9zSMZTgnmygVygeI3ZtSX0b+o0Kat+QuPf4C
 KQnLV+TnDgOGXKo+4nW58pIRrEnaBFR47HC8ya4V79cEglUBc5fZONa1WIpzo/1gTArO
 hyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUZ+5WCGd2aXzcmqtmPQybGWA36dDti6Rddo0SepbLo=;
 b=rNStLYTRln/8/ALsS4fL5ILioYcgnhhIHrIFBj0BoVi6JylaKujpQlRHDCTJlgT4VQ
 wpRV5Kw7VUHverKN9h7AnUnD4l4bV1vqdxuGYrepG5578zqIZLZJhonjlbst8AVbs9ea
 8iBZnSFyJpMd39nr4JaKmHrvgAxPOByOPhn9HonN+Yjjm0nk0I5DbQVBLl6ofl5KYJPB
 gbZYfK1xoz50UFtLQ97Pe3ngHw0BiEEczX4eukrFEtaOzzcR06OxaH1hLFPxzep/6BKl
 h4wNqk67etvEi5VOP6sWqJJMYks2xy673VaiQJe0m5JdfGoQKVKDrH//MdockF5BaNvQ
 pisQ==
X-Gm-Message-State: AO0yUKXijZzNZcd2G5oy34Pxe104xAR+2zFB8Fw7SeMHKOyFwX85z55e
 gTrbtZ4GAFRhi0HR+PcF6cXcPw==
X-Google-Smtp-Source: AK7set+bBydsh/maNm7XtLTrjVMUsEX0Ha5+a7H5cRmGDvhIIW9o8cJFSqLW7fGZv6LC6U50F4ViuQ==
X-Received: by 2002:adf:8b48:0:b0:2bf:d6f9:23d6 with SMTP id
 v8-20020adf8b48000000b002bfd6f923d6mr1861143wra.45.1674842129097; 
 Fri, 27 Jan 2023 09:55:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/23] target/arm: Mark up sysregs for HFGITR bits 18..47
Date: Fri, 27 Jan 2023 17:55:02 +0000
Message-Id: <20230127175507.2895013-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 18..47. These bits cover TLBI
TLB maintenance instructions.

(If we implemented FEAT_XS we would need to trap some of the
instructions added by that feature using these bits; but we don't
yet, so will need to add the .fgt markup when we do.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 30 ++++++++++++++++++++++++++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1f74308ef5d..2e5ac6b4f98 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -666,6 +666,36 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, ATS1E0W),
     DO_BIT(HFGITR, ATS1E1RP),
     DO_BIT(HFGITR, ATS1E1WP),
+    DO_BIT(HFGITR, TLBIVMALLE1OS),
+    DO_BIT(HFGITR, TLBIVAE1OS),
+    DO_BIT(HFGITR, TLBIASIDE1OS),
+    DO_BIT(HFGITR, TLBIVAAE1OS),
+    DO_BIT(HFGITR, TLBIVALE1OS),
+    DO_BIT(HFGITR, TLBIVAALE1OS),
+    DO_BIT(HFGITR, TLBIRVAE1OS),
+    DO_BIT(HFGITR, TLBIRVAAE1OS),
+    DO_BIT(HFGITR, TLBIRVALE1OS),
+    DO_BIT(HFGITR, TLBIRVAALE1OS),
+    DO_BIT(HFGITR, TLBIVMALLE1IS),
+    DO_BIT(HFGITR, TLBIVAE1IS),
+    DO_BIT(HFGITR, TLBIASIDE1IS),
+    DO_BIT(HFGITR, TLBIVAAE1IS),
+    DO_BIT(HFGITR, TLBIVALE1IS),
+    DO_BIT(HFGITR, TLBIVAALE1IS),
+    DO_BIT(HFGITR, TLBIRVAE1IS),
+    DO_BIT(HFGITR, TLBIRVAAE1IS),
+    DO_BIT(HFGITR, TLBIRVALE1IS),
+    DO_BIT(HFGITR, TLBIRVAALE1IS),
+    DO_BIT(HFGITR, TLBIRVAE1),
+    DO_BIT(HFGITR, TLBIRVAAE1),
+    DO_BIT(HFGITR, TLBIRVALE1),
+    DO_BIT(HFGITR, TLBIRVAALE1),
+    DO_BIT(HFGITR, TLBIVMALLE1),
+    DO_BIT(HFGITR, TLBIVAE1),
+    DO_BIT(HFGITR, TLBIASIDE1),
+    DO_BIT(HFGITR, TLBIVAAE1),
+    DO_BIT(HFGITR, TLBIVALE1),
+    DO_BIT(HFGITR, TLBIVAALE1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b9c7fcc3a4..5b9cc087e28 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5318,50 +5318,62 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1IS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1IS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_ASIDE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
@@ -7175,50 +7187,62 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1,
       .writefn = tlbi_aa64_rvae1_write },
    { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
@@ -7290,26 +7314,32 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1OS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
+      .fgt = FGT_TLBIVAE1OS,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1OS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.34.1


