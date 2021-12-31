Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F454824AB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 16:56:36 +0100 (CET)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3KGg-0006MC-V0
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 10:56:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n3FKX-00057R-6S; Fri, 31 Dec 2021 05:40:16 -0500
Received: from [2a00:1450:4864:20::334] (port=44628
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n3FKV-0000xv-8K; Fri, 31 Dec 2021 05:40:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso14568490wmf.3; 
 Fri, 31 Dec 2021 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dwT+KxF1l2PXNM9K+C2Ww/XGlENMNooPCezsI9lH59k=;
 b=qTZ4HdWOslh1XguNoPm3rPRDXB9i1zKWLAYzDAFbT/hnT3tSzFH5/Po3QWLqQoQZfE
 Tb3Hc8TsiWjujqbEDaSR0PnqLh7KYGqWJAv6S5d86bcHTrcb+2waVWBpUFavZmgtvt4o
 KqQB6+OqX9ypiDhw4rCpBcUtgTbHDqccjAJWxm0paJ3rYKCbjgLIyjaOVQkbdxiXcjtO
 T0ylqlh9XPMic3BvxrN80bYjiKfaBkXPkbeoLodvB5298qCUlOk7gt5noWW7Yzu+zHGx
 jcKsw/EE2iuKViN+ejImoD8gIrP8ciSkMGDFIUfD1oj+4fYQIah+9awBNQof7OvbOCk1
 EuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dwT+KxF1l2PXNM9K+C2Ww/XGlENMNooPCezsI9lH59k=;
 b=VmCtIg1o3eJmELko81lVI55QOrs0T7vtS9gIpUEfY2Wyx5JxgFhPs6a6NNHukWPsID
 13t3i1GQWCSbUV7JRpBMh+TaAhRtmmvIiLpiJD2C4/LQmu33G7UhI7f/8XQaSCPYZNbD
 YGnjGGntqMrLsdi67Ic0wV1g8/SHonM03gprNsDmT8imDE3YvsWrt4idCiO+Ur2Nai2c
 p1K6vxSQz4jcflXuaRpa/ykdt/fOJBbkH3H6oVLR2nqfjWLpcU23vzggZByoNxg2o6p0
 dbVBvw16LYSXKNJ918uEv+erp5eP/5o8uCgTC1RHqbn5w/jhvnvbyPALbrU7jxza2xK+
 w7iQ==
X-Gm-Message-State: AOAM533dr0iIkzWMFkOSehOvdtrn3OOVO9xa1vpj18itkZg1ZG5w2QFP
 Ycl+zIfuboxe3IrFgs2r1sEZgnEDSAs=
X-Google-Smtp-Source: ABdhPJw/eX4qh3VDpjQ5ZBXpbFwy5++KxY2fKv3FNK0LrnhwrJzWKJc23sYX45bMpJumQFvPdHQE3A==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr29277907wmj.97.1640947206700; 
 Fri, 31 Dec 2021 02:40:06 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-109-67-1-187.red.bezeqint.net. [109.67.1.187])
 by smtp.gmail.com with ESMTPSA id e12sm28521323wrg.110.2021.12.31.02.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 02:40:06 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
Date: Fri, 31 Dec 2021 12:39:28 +0200
Message-Id: <20211231103928.1455657-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 31 Dec 2021 10:51:30 -0500
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
Cc: peter.maydell@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the instructions added by the FEAT_TLBIOS extension were forgotten
when the extension was originally added to QEMU.

Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db837d53bd..cfca0f5ba6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6964,18 +6964,42 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
       .access = PL1_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae1is_write },
+    { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae1is_write },
+    { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle2is_write },
+    { .name = "TLBI_VAE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae2is_write },
    { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VALE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae2is_write },
     { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
       .access = PL2_W, .type = ARM_CP_NO_RAW,
@@ -6996,6 +7020,14 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL3_W, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_alle3is_write },
+    { .name = "TLBI_VAE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae3is_write },
+    { .name = "TLBI_VALE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vae3is_write },
     REGINFO_SENTINEL
 };
 
-- 
2.33.1


