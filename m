Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C368BCA2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0RF-0007cv-UW; Mon, 06 Feb 2023 07:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RC-0007c2-LM
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R6-0005nn-Q2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id o36so8532014wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnLR1uIdaRx63uyaDPgEE9PMokr2C9C9/vY4stomlB8=;
 b=pCIc1SWuqEqCCrureSTt61msuerP/ylniPzZ4d74S7kpjWDtNaay9Czimws319Fx5h
 ykMXm40WA3ywED/ohntCF2H8P0hs1LDfCyUDb3AHOa5OocIyQfeFBeTH6ivzgPxRw4v+
 iFf5VIKxVXjxMgkse1xVbNmwHRfQenTLzjOxnbXj2sdclXKJ7Zfg+/ICYkgQKkhTdgxo
 gz4C2J0Mk0ygVmc0He3rNJnBP6dvKtJgFPS928KFt9YOyoKb6ODJdzyGw4dDs06EwU3A
 02vqBtsrNUqoenShWpwZGFKVQQlahFsR3QaLtITvC45O0/MBMvKjg6Vu3ja+HMt5x0Q8
 +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnLR1uIdaRx63uyaDPgEE9PMokr2C9C9/vY4stomlB8=;
 b=U3jxk8xZ/V4AvjNxIRzZ5uzeOr7P8LfBqXCcIxsVLOWENj+Ds8/uuNDunnFdYFQsvC
 NEuo52uHCXIEb8kZEO+kR+zK4d1lgHwsy7tkPNk2ntk2cTXtQo5xlcvNr/bJNQM1MNJe
 h1xt6TgSAJok2jSQ17VDP79kmkqSCiJb6bTsJUJYSllPy769A2+OPTdo9kltv6eTcmf/
 rIdh3WyZBfJU7EXEAGvFSPC/XcjzCNinKe+gfsEk3O9rNe8Kg/ai3pnQSpfRtSP/tm8L
 7cSLiFOQ6c0dQSkb9HnmBSmDwfbLv+NjqgvC8YNJ3giRE8zRmLcuA51wWJO0aHzhYxqV
 r7/Q==
X-Gm-Message-State: AO0yUKWahQIS+1Dt3hke7jERHg7ZZyyKvOPZxjn4xRU0u/rTHmEobRIk
 3C5y6AViLVeVY0PIFJ0gT0vCI9DcwVI8WHKi
X-Google-Smtp-Source: AK7set84/LM5IVA8zm893gCqicgacHvc5VGnz331HVe28G3JBmUiwBU+6Wt43sjMpZi2kh8KPEcJHA==
X-Received: by 2002:a05:600c:3795:b0:3c6:e61e:ae71 with SMTP id
 o21-20020a05600c379500b003c6e61eae71mr21104626wmr.1.1675685847107; 
 Mon, 06 Feb 2023 04:17:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c228e00b003dd9232f036sm12708711wmf.23.2023.02.06.04.17.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] target/arm: Constify ID_PFR1 on user emulation
Date: Mon,  6 Feb 2023 13:17:07 +0100
Message-Id: <20230206121714.85084-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dbeade787..b58800a1a5 100644
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


