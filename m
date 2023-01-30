Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E905D68190D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqT-0001FI-IR; Mon, 30 Jan 2023 13:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqM-00019f-Oo
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:26 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqI-0008NK-2g
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a3so5288849wrt.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lt2f6IiUFpXwxZX1E9UJcu2gXVFrqyPjbwO3PpeBNvc=;
 b=Ak2dB8hqZeIV6RlBSzLdna9jzJD6cF4Iika9/hItNpUMOpRZB6Q84/fDrFigmkWe65
 gnUQFM+2oVZ/s0sJjT+WToZAfzFNRCChzo0vDyRHFEioQr3ul02yvuAeBgYkmhgnUzFq
 rn3dQ6Asp0fkJTE/EUdKK0Vwxa+P/QcWeAntkNSXiVGgX4APT1FZHoPMO3kGomyX9Ouz
 A0m2Q5Zi/UIEeZ5pev4LTvi9SlfLqma0bjaNz7n23sHUWuK1gVorbdR/YL5DZQ7LC5JW
 +QGqfhLna0Ri/DV3RoieAeR7coORipRnbkAeHW0TTmB80UbRMrUUPX4tqnOjT86u8Z8k
 s1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lt2f6IiUFpXwxZX1E9UJcu2gXVFrqyPjbwO3PpeBNvc=;
 b=sL3p5Ka6Isvn0hfi11lRnPGGhJnnwbIcIAoEaIS6srg0SiA/6dYTvNIgXAKfRd2Swm
 cEdWktiH4GWrnquylvsuLOPR0wVplIgBTwO0AhM6pH0aGcvXktaWgx4mnsH0VRWliqlx
 oCqaO8C1XD6x0muT21C4pkycmds42q7yetNDg5oX8niVXx4xP3Ir56eNp4qxXWdPJ1nI
 R9mBO0b2X+CD+knTAgAxf9cVjJXjKmRfvZBnTVaJWO2v7sN9DQgUNa/QMr8xMMAKF7wA
 fwvXS3Bk3uTrI6NcL+GCnSizeqxwNc4xYNVI8eoeUeNpiyNSPcRA5Dy+22emGM0egwTq
 q5lw==
X-Gm-Message-State: AFqh2krHRkpOQ3bDxvUf+ImL3l2gEO5VPr5vWRMAYMHPeZFuYqR7BmYI
 fC/XC/NCrtojMptvhKyYooRatw==
X-Google-Smtp-Source: AMrXdXuPGThBtZ87uJwlYsZyVSMddTjgACC9RdTnZ9hxUiDC0xe2KbrIp8Z/9ukjmjMmWS4Bn3I6uA==
X-Received: by 2002:a5d:58e8:0:b0:2be:b07:d411 with SMTP id
 f8-20020a5d58e8000000b002be0b07d411mr40212469wrd.3.1675103120543; 
 Mon, 30 Jan 2023 10:25:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] target/arm: Mark up sysregs for HFGITR bits 48..63
Date: Mon, 30 Jan 2023 18:24:55 +0000
Message-Id: <20230130182459.3309057-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
trapped by HFGITR bits 48..63.

Some of these bits are for trapping instructions which are
not in the system instruction encoding (i.e. which are
not handled by the ARMCPRegInfo mechanism):
 * ERET, ERETAA, ERETAB
 * SVC

We will have to handle those separately and manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-20-peter.maydell@linaro.org
---
 target/arm/cpregs.h | 4 ++++
 target/arm/helper.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2e5ac6b4f98..efcf9181b97 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -696,6 +696,10 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, TLBIVAAE1),
     DO_BIT(HFGITR, TLBIVALE1),
     DO_BIT(HFGITR, TLBIVAALE1),
+    DO_BIT(HFGITR, CFPRCTX),
+    DO_BIT(HFGITR, DVPRCTX),
+    DO_BIT(HFGITR, CPPRCTX),
+    DO_BIT(HFGITR, DCCVAC),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5b9cc087e28..c0403aadae2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5295,6 +5295,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
@@ -7588,10 +7589,12 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
@@ -7747,24 +7750,30 @@ static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo predinv_reginfo[] = {
     { .name = "CFP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     /*
      * Note the AArch32 opcodes have a different OPC1.
      */
     { .name = "CFPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
 };
 
-- 
2.34.1


