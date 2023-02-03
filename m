Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C33689BB8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5S-0008Bf-V4; Fri, 03 Feb 2023 09:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4f-0006pb-Q0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4b-00054B-Hg
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4003066wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4Uw8/DYeISr8umhjp5MVaOTabiUrIqChl/nqNJJfyJA=;
 b=P3viyOItoCoLJM2S5ed6Ra84YjFop4hdoiD8mnJ3Ur6juFTUsRFcf1Q11Lduz2XltS
 Wz9shPrOvQ4YYO221fPRYT5KcmCEbuuK4/uwqxbznd3ev0HtUOqsccHLYTMDo4hlKi75
 UpWfpcxpiLKlVVTbPkL2Ix3BCmScWVh1T9Ur4tiN9fiuXc3gJi6Z5c4EP5RkGW4dd+ti
 T90TuB+XXJnkipvVVlNhCvIzHf3qUOarzMQyttT7PGCz7IfsAVFcYWP1B833b9p6cO7q
 NkMqV5ScAVN4N0oKM9cX7SBBQcJj5B/87eauF1o/RCOIrsBJksEpnOq/AlRENH8uwjNy
 sISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Uw8/DYeISr8umhjp5MVaOTabiUrIqChl/nqNJJfyJA=;
 b=Zxl/Ml/C/LzAx73NM5A2P6PTAU8EcaXWoM1Q10jXexHrV/kwZG0IUzKR0BHMqH7OrS
 fEIKYtLPC113LvkOLou1HyKkLNuB+s8hZqreliCFF1ClWT+1u647UXd4jVfcNCd/W7ce
 XS1n8o+6dekWAuXN9h8kIWAuUvyU4zXpdXEPZUPJZI5zHWA09tNU2yqmGtnfZKyjGbBo
 XFDSHIo07NiSEQSZ7zHYtDDkT40JCCvKeS+Wv42Ok4MskL0I/uilbY1zR5qmpMbmHT8X
 c6f8jCF6W4b2mfQQPdrpAeW69cfF5Darw/MJiSoTCvNwN6KSz563Ojap0RZKXWfDZqED
 RvQg==
X-Gm-Message-State: AO0yUKWXJsKB8ZPYkkYnNq27RN2mE3yMk91M9IEAsGRFIbPoQ406bafF
 CJpwIMWYqE25dwJ1zLdMHPu40Xji/Qsa2pDa
X-Google-Smtp-Source: AK7set9EInWuvDSNrTgH+CGZILslFwcH4XwsVdLS/OwVwSk1z7mrT7v7JhYCIPcxOcjgmksRTAE/YA==
X-Received: by 2002:a05:600c:154a:b0:3dc:3398:cf87 with SMTP id
 f10-20020a05600c154a00b003dc3398cf87mr10207759wmg.11.1675434592847; 
 Fri, 03 Feb 2023 06:29:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] target/arm: Mark up sysregs for HFGITR bits 18..47
Date: Fri,  3 Feb 2023 14:29:22 +0000
Message-Id: <20230203142927.834793-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-19-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-19-peter.maydell@linaro.org
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


