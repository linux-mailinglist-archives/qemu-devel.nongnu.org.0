Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EAF487B58
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:25:29 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5szY-0007qJ-Dk
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw1-00054W-NQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:49 -0500
Received: from [2a00:1450:4864:20::434] (port=40685
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5svz-0007sD-6l
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:49 -0500
Received: by mail-wr1-x434.google.com with SMTP id l10so12334365wrh.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tgkzP59zZKWcqPqvUogulF/C72GjNGTYYxCx3zJL2W0=;
 b=Cqh04E0XAWpZ8NT8XhD/+5TeTqnYTDolHnnMqtlda59eUXRwUudlwjH1WxQhU/vOK1
 yQOcUhX25KklBrVdZ3s8IhyxrOaAOBa01QE1Pb1mW9b0ek7SRSbJMphUbcEdOolvMbRW
 ur9PKvF/qK2PmB86uW/VqfPkljsAxVoahKvHf2c0jSt559ogRsxDB+Q9EHyupnYmONVu
 vYXVCiRJ0zMfpQwvV48KkvtB9ZM6q5Avcp5vVjQAhAXU8RJGtUrHVoriioh5He0YOmwE
 BgQ2FlMybLN5pUVLAjTZ2Bxg5OB5TX9H1vEpb1JDLddm6asOMgy+ZUqM8W8HXg5Z0p9d
 Z/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgkzP59zZKWcqPqvUogulF/C72GjNGTYYxCx3zJL2W0=;
 b=jXIP+3DD6SSOa22vi0mU9hxim2Us8V6BrTJCmqh6qfqDIIPrQKrlrOI9CCGhxhw2CS
 TJ/TLYMPuTa3C4cYE8rSuHZQEOYrb4jvC9c9e7iWmQLi2T0Gjl7oqcfuR1tiYGONIbnH
 nhsgbvdvczAzdbobnHy/Vvs7nsIfZUQ8Iz4UtjJz4XTH28aKtmeAjnNy2hXoUhafXYp6
 ggb6wYUYO0t/1Gpg9130+SzRqrWMxYtFhmPGu2w5EZR6NH7y0Yjf9MG4YIwpPhhmplH5
 wps9nWW3en+xVpX8sswCnFlou7SJCyXgefUMOrxY0qEqFk0af1+n/IlUY51SFHB88VvO
 ICYg==
X-Gm-Message-State: AOAM532jJS7AOO2eEoPDSsN+kvN7JASbL8RtvzbCNC1jL2xp+W+K20FC
 yGZr0IhAtNUGukJ9T/B9GtKOf2fsMbitWw==
X-Google-Smtp-Source: ABdhPJyhBVychQnxhj4YWBCrO+Z0k4rfRMEKEfGDM4wlsy32H9r1QrngIAvMFBinnKVGGWmKRB8Ccg==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr56224636wrp.714.1641576105954; 
 Fri, 07 Jan 2022 09:21:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] target/arm: Add missing FEAT_TLBIOS instructions
Date: Fri,  7 Jan 2022 17:21:25 +0000
Message-Id: <20220107172142.2651911-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Idan Horowitz <idan.horowitz@gmail.com>

Some of the instructions added by the FEAT_TLBIOS extension were forgotten
when the extension was originally added to QEMU.

Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211231103928.1455657-1-idan.horowitz@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db837d53bd9..cfca0f5ba6d 100644
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
2.25.1


