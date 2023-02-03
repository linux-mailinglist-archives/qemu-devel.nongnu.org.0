Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6335689BFC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5R-0007qO-HO; Fri, 03 Feb 2023 09:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4d-0006jT-HB
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4a-000545-Nf
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4003019wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l4/0NpXlWNPM4wA8sqHiRSyY2vkB5nRmX1x8NuZEF3A=;
 b=JyAx3o6U2q/idHo43ZFCrSzVQmrCcWM4fYGUcuxqd+J/k4FVMyXq8UvD62YHwZlksA
 5sue6GnON0MM59vG9jqRQ7DsE7Cj0Wl22qSiq7oH+vyzLdrGTEq725CpzALhwuVWevxm
 c7c4A6tE6HvDAbexinWmDnjRoopWeB0k4j4jQZ6HZ5gCMEUGTGeKpTBiQ2xE3aBjphOK
 zbM6FhyjJKaGXynAVcIgUU6ikesKAbLMb113zJkEpA7FrMlE/R7E+q67IvzyFLVVGP1s
 bIE1wMKvABtW7Z4ZhqJPaZGlsoFFzyEAnhU7nDTxybSnw/HkKsgfVx0lmvwF4BC3wVfa
 t0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4/0NpXlWNPM4wA8sqHiRSyY2vkB5nRmX1x8NuZEF3A=;
 b=TyTHyZSe7ejNryaRwb6u2ybfpkuJzhAB+FqO5xA+WgXpenlVBa0ybCRn+ekWMzQeGD
 2avC1PbNjGDVTwMz+6hfgY+qs5/pj8lotSaFI0oVtw1VZcZokWOjQNss5z67dgOqPj2Z
 HDz35t/yL8MTG/vESvP8hN5bJMxkuU00lCSGAI7uhPMZpUoCKAWAP9AN80l0kiE+c5Aa
 t+YSmm0wCMNqPak9vyXCNn/oIDZUVEJyDPE5pSGK4R0mngwhJleqy4Ty/98jWOAOKjK1
 lvjxEyQ87qE1Oh0ziwwd5zPTvg2JVxZORSpXWvVUrzSCxU5JFE66HUtEtUVZg2DTGpdL
 3Q7Q==
X-Gm-Message-State: AO0yUKWeUtGYqslHhjTDyxSg9z5AeCDXFA+5bhNfcEvoA6vKOyHmfs2B
 bNAkHtrXkSkAqswTOnkcS1edOsoAw+mdLUvK
X-Google-Smtp-Source: AK7set9O1F0xq/ekvBSc9VgRT+xzbDDWGHWQEwykGW6RMylDhNzLy8Clw8KI31x+/X0kSuTcUaCKMw==
X-Received: by 2002:a05:600c:3d1b:b0:3db:fc3:6de4 with SMTP id
 bh27-20020a05600c3d1b00b003db0fc36de4mr10126056wmb.35.1675434592034; 
 Fri, 03 Feb 2023 06:29:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] target/arm: Mark up sysregs for HFGITR bits 12..17
Date: Fri,  3 Feb 2023 14:29:21 +0000
Message-Id: <20230203142927.834793-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-18-peter.maydell@linaro.org
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


