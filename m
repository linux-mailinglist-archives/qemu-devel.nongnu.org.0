Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112764DC4F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:32:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhV-00077H-Ji; Thu, 15 Dec 2022 07:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngz-0006od-HZ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngx-00048J-SP
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r83-20020a1c4456000000b003d1e906ca23so975329wma.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PWgRSqdjM6ICBFf0pToxvYsV7w6dTK2uUn0DKaor9os=;
 b=zMKo2uygkxeUbr+867EaHRif+t0IWy0RijwqBPdioKugLUBEDBUNwJmZNrp51mu1U7
 Wee2ThUAGLJMi/JH1GVso9i9ZH8FBl6wf1LGwT7nzLdHEhMSPZb/KBfv7bbaHCjFHlAs
 YSv/eQ5ll7JmFIkKgc9k3qe74mqH5Fiptf/fNN9BbkC/AqZogIQrpcO5j4WQWbIe+TmY
 h7Sdu+gwjxLIxbBDA2nb9x+sQs/j9KsbcAMwa3dK5wdCLDaMbBXv9Q0y5VZFNT2kgdmE
 TWAhiGKUym4yqf2CW7sB+XWlUWSOAW8N9tWVFAOoL8GFtRyLSxZ7An9u3FugOvW38BGV
 3kaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWgRSqdjM6ICBFf0pToxvYsV7w6dTK2uUn0DKaor9os=;
 b=O/PCkMjW4MXIovlzKWD0XWaY1+O0z2tZIcTGhttblnkVwnxXUdSuEq8irHz9uij7mn
 Jm9ylqXZASrSfEqyHCBzQbtv+h/OlrLKmkox4nvZqOsqkBjGhlqoyCHQ3dWDFbSOKXaE
 Ic+iWkU+i07IIm31AWs5EsEMpQXR28fKDQjszANdcWwMaubn6xFAU5eY/Mzw8GlNVPVB
 wGqclkruyGE4cr6zE0DAX/GeyD4HpapqI2MzTNlm/D5VfGW0cYqBGuYciAiFfUg+v3Yq
 LX8VXG9TLsZM9c9GDWpxgmo+Tyy4gvSrVeirSNKSFgaNA3RpPatgQ80dcmYoeuNr3N3J
 qayw==
X-Gm-Message-State: ANoB5pnWUMRfx6IsgmAh9koEzNTS4cFdV7DFmxZTRWH9vOmvIlB+hlDA
 nQCOyY9uRVm9QSlkIH0LwHmYdppCNtlPW9Pk
X-Google-Smtp-Source: AA0mqf7PUsei9AgLfH0PKNHc4RWqDDgvO4tqa8LrdZUAKBegPkghdysL2ALdPnXVUnS92T/mErKoXA==
X-Received: by 2002:a05:600c:4e16:b0:3d0:7415:c5a9 with SMTP id
 b22-20020a05600c4e1600b003d07415c5a9mr21604414wmq.21.1671108626479; 
 Thu, 15 Dec 2022 04:50:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/29] target/arm: Report FEAT_EVT for TCG '-cpu max'
Date: Thu, 15 Dec 2022 12:49:56 +0000
Message-Id: <20221215125009.980128-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Update the ID registers for TCG's '-cpu max' to report the
FEAT_EVT Enhanced Virtualization Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index e3af79bb8c9..b33d7c28dc1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -26,6 +26,7 @@ the following architecture extensions:
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
 - FEAT_ETS (Enhanced Translation Synchronization)
+- FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cec64471b4e..2cf2ca4ce5a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1254,6 +1254,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
     t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
     cpu->isar.id_aa64mmfr2 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9a2cef7d05a..568cbcfc524 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -65,6 +65,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
+    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.25.1


