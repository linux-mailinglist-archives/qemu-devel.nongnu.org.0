Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AA67ECD5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSwz-0000s9-A1; Fri, 27 Jan 2023 12:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-0000oT-Jm
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00063p-IC
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:34 -0500
Received: by mail-wr1-x42c.google.com with SMTP id y1so5695226wru.2
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBnCc5Tj6B1s+gQWTz46ImxiGdlTNdwUHpkSm8JYnEs=;
 b=WkQEZlvO7D3F7QxyLSQhCbjh2RVlsKp79FvtyC8cUR5keIS0r2omeYNX73r8abvXI5
 65x6jf7TziE0WLQUveHWHACGV+Bu9Ibwv9i6DC4f/etVJHgigEdv3P74vQylscKSNDIU
 JK4BjxKw4b1TrJW1M8TOIXuEOyTxDfHlMUgdFOxf/0ftLUg7rxapzXc+03W4Xqj1lpkK
 g1w2D7OzW5ddakn5ezJB+S2y8iWG5pc8qNelBRCaWfeUpy7S4bQ9WYwP6FFnxrH/iQ+O
 eonVhm689eKoGl5Vv1+jdln8vJKoD5O4rUSbIftSVIZS7lsGoJnNWat4Yz2T1W6Sn8UV
 Cg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBnCc5Tj6B1s+gQWTz46ImxiGdlTNdwUHpkSm8JYnEs=;
 b=z7bYsnjhzAXbcrgctTLsJZtdOifUuDHtug6uJQi944Y7/P0FwNxWdwwMRGwmZr6HTK
 9vzSdNqM/YpOClY//VUVaGotu/TkjhK5PVjqY4U3oU/4GYa0RutzDIrkXOq0w6p1y8nO
 A3CPJghEq5V2DPbMPq8rLRt/Rj906+yzKOOlWhNFxCG1JoSgmys1a21miM0I55E/wNtz
 e7MoL6pOjizWEkVdtJfATy5sRu+UNhKhApjfWP1CBopiD5lT3obMOn82WEcMKVm5L/De
 +NCurA510uyz1Ma4YZLHOjrIaaTXT+ZBFSjH/PtJE671jVlJTXpwUVDmlZ1P/zOxa+y5
 IzDA==
X-Gm-Message-State: AO0yUKVb7FfB8hD0zoDyeIJCDlXIkuhlsdPNb1ce3dV2Ep1379JXpIQE
 sU/VG/eO6tGuaGCrgXRUvMohheKgRItwobC9
X-Google-Smtp-Source: AK7set9m16meJkoB553hcHmew/p3r34AtPtTP9fycyLtQZGqdXcG/3O+vhyqZ4wWjJlmS8BrRaFO5A==
X-Received: by 2002:a5d:4578:0:b0:2bf:c725:85 with SMTP id
 a24-20020a5d4578000000b002bfc7250085mr5616739wrc.12.1674842128124; 
 Fri, 27 Jan 2023 09:55:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/23] target/arm: Mark up sysregs for HFGITR bits 12..17
Date: Fri, 27 Jan 2023 17:55:01 +0000
Message-Id: <20230127175507.2895013-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
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


