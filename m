Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA568C9A8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5L-0001op-EJ; Mon, 06 Feb 2023 17:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5B-0001kk-MD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5A-0004TC-6W
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id j25so8350758wrc.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19uwBfdpAT1fRxylT2Hyf84R7eD4Io8guMa3+/7IF5E=;
 b=CGJ8bxT2P13F5mXwid42JRnMFxipx7ovw7vNTLmbt+wq0xGlmfQ8fwqhsOY/s9PV28
 hTbgFnbZytKVDxHEjC14d4u0bLZ56SrMQ5XmEPYACSMTqlqbzJiSzDcLGgZN1iTG5FOs
 Kemjol8J+ZOfuul+XIierj7z0DQmCiYmMSIg9eHOPIQSF71P0drCMGFNtEU1Z4nb4wFt
 z/eOSusBITbRaT9MTK/O+pq3miYOQ1sPOsobOqDLje+Xo604BgQiQwW0NvgiwaqTKtbG
 jTq9twDNIPiyVL098S1fELJtWXmBODyUsd1vMCoezRuaqEltOD6Q1FR3oLMoQfTLYCVV
 kRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19uwBfdpAT1fRxylT2Hyf84R7eD4Io8guMa3+/7IF5E=;
 b=tGRTTk7VT5oFA/+X5XIMj45/h7hnqI5VweS8rXM+/ou6eDQw5pn4STq7RV7KW4XGdT
 YEOJ0x31r6P6a7SIGrjhhpVLJWp6hiwWm4WSsJtReUPJmTZtpNKFBQ8d02gI57M2eVfl
 m4lr4UvsIgg/8BDyALAhHK9zaR9Y+jkY1wfndPJlQ47t9dCg6rZPkSoc/AuT5fRW/DPj
 Y0k6hYs+XPnO9GGapjteD7BUhvNIs2X4Jrg9DIv4qROpV2F6KdlCYMcykCUXyz4W0TK2
 QH+S27Lqw7VhbR2SJKnLX3s+786KTVJKdljl2DYTLnGx0lHKujECJPqP4zLmj65o6QwZ
 MatA==
X-Gm-Message-State: AO0yUKXgMOyp7N+heW2MXPhgvUA2JdEH0KAHjXVtItfvUU8NcSAgvRAG
 NL1zcv1ji+kz7POrrqKIkUaw/p5JuBJ1WQA6
X-Google-Smtp-Source: AK7set/RjDwpTsIvPJHlCkly3bQNT6W/Cri/YRc4VsexAE/GhmouqWQCFVc8HNntW4xjAcJ1aGKdyg==
X-Received: by 2002:adf:efce:0:b0:2c3:db9e:4afe with SMTP id
 i14-20020adfefce000000b002c3db9e4afemr384789wrp.60.1675722926561; 
 Mon, 06 Feb 2023 14:35:26 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d6d06000000b002be099f78c0sm10224886wrq.69.2023.02.06.14.35.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/11] target/arm: Constify ID_PFR1 on user emulation
Date: Mon,  6 Feb 2023 23:34:55 +0100
Message-Id: <20230206223502.25122-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..22670c20c0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7021,6 +7021,7 @@ static void define_pmu_regs(ARMCPU *cpu)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
@@ -7038,7 +7039,6 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return pfr1;
 }
 
-#ifndef CONFIG_USER_ONLY
 static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -7998,8 +7998,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_NO_RAW,
               .accessfn = access_aa32_tid3,
+#ifdef CONFIG_USER_ONLY
+              .type = ARM_CP_CONST,
+              .resetvalue = cpu->isar.id_pfr1,
+#else
+              .type = ARM_CP_NO_RAW,
+              .accessfn = access_aa32_tid3,
               .readfn = id_pfr1_read,
-              .writefn = arm_cp_write_ignore },
+              .writefn = arm_cp_write_ignore
+#endif
+            },
             { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.38.1


