Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87A681912
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqT-0001E6-2M; Mon, 30 Jan 2023 13:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqK-00017x-QJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:24 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqF-0008Or-BL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m7so11983955wru.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MAYX9K/USg+OVRf9ZuIQOjuYSB6K+peI9C4rgnqGo8A=;
 b=MluMrtj5ve5Ko5h5H2tr99El3EC7BzgY/Ps9e82nzxZz/ip5szJnDgUWcmu5o/ZtPw
 /dH8z14ODI1/ydttoY5n3icEGmL2X8o0ecKaCgrsIYDP6f2y3zdfDo0dRgzUNQFYl1xl
 4QjGLkdkDGPF8TYg68Q54f7kH99QTk36Tm5nQxQgE+49a2xMr8KehH+XHz5xwg4CS20V
 p0474pIIkaVTcNA1A24oDVyQn4Gj+1yfUpR3imFtqkZ3lCUhNqjWV0jjcC8yUcuvlWiV
 v4PEMiO3hqZk+ouWfj3lkVN1XWcULb5IHPGBqPH0sraicG+jUM9snPQvlEKNONnQYPOy
 Fm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MAYX9K/USg+OVRf9ZuIQOjuYSB6K+peI9C4rgnqGo8A=;
 b=Dqr7Vo5Xpk2YzFCRC+uyWzC9PjJLEXRzQDB/QwM9t9o9e+bAPXjsGqUqClql8sNZrb
 S3K0aj76SBP3S4EpDYk7uC0CssR6HfrCyACOz2Wpvr5pFgH8LG7dnrmwknhxLlcwG71L
 HAdjQavQO6A7/zHg25QfqAwuVYIep/Y28c+KTlxygnpRgLO8FET9VGMdcKVowrLiQrac
 3dsLB+DBFwVCh1XzkFPzTlt4jHylUeAgKSS1ANpbYjs0AKZtMWkOMxeZY1ohE7O54Vms
 6ni/xI4o3kL1a4KNhw5JziOVnRSACSXioUQD1AZcjBVg3KcFDuVFWt6gg03pLkMCpQLm
 W74w==
X-Gm-Message-State: AO0yUKWu3ydiRTtyNLEFRsSw/LcXZ7NwbgFqP9uzjNGXLR+KM2oeBd/p
 Nm0mPAx1zjUsDwOs8YFLDNZKKg==
X-Google-Smtp-Source: AK7set+uz0uC3EQGJjZMtCN50Uk7Fi2K+yoKdCiAGu1XsH19ADHhMPl3d2neyI4gu329oE60eLDSOQ==
X-Received: by 2002:a5d:595e:0:b0:2bf:ee58:72ae with SMTP id
 e30-20020a5d595e000000b002bfee5872aemr3591306wri.50.1675103118598; 
 Mon, 30 Jan 2023 10:25:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] target/arm: Mark up sysregs for HFGITR bits 12..17
Date: Mon, 30 Jan 2023 18:24:53 +0000
Message-Id: <20230130182459.3309057-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
trapped by HFGITR bits 12..17. These bits cover AT address
translation instructions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-18-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 6 ++++++
 target/arm/helper.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 6596c2a1233..1f74308ef5d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -660,6 +660,12 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, DCCVADP),
     DO_BIT(HFGITR, DCCIVAC),
     DO_BIT(HFGITR, DCZVA),
+    DO_BIT(HFGITR, ATS1E1R),
+    DO_BIT(HFGITR, ATS1E1W),
+    DO_BIT(HFGITR, ATS1E0R),
+    DO_BIT(HFGITR, ATS1E0W),
+    DO_BIT(HFGITR, ATS1E1RP),
+    DO_BIT(HFGITR, ATS1E1WP),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 51866ba70e9..8b9c7fcc3a4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5400,18 +5400,22 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E1R,
       .writefn = ats_write64 },
     { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E1W,
       .writefn = ats_write64 },
     { .name = "AT_S1E0R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 2,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E0R,
       .writefn = ats_write64 },
     { .name = "AT_S1E0W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 3,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E0W,
       .writefn = ats_write64 },
     { .name = "AT_S12E1R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 4,
@@ -7880,10 +7884,12 @@ static const ARMCPRegInfo ats1e1_reginfo[] = {
     { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E1RP,
       .writefn = ats_write64 },
     { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E1WP,
       .writefn = ats_write64 },
 };
 
-- 
2.34.1


