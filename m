Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF25F0CBB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:49:33 +0200 (CEST)
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGOS-00018f-Jy
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAm-0000A7-Nk
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAf-0006Tb-Dr
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id e18so2934107wmq.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=lv5Lub/tmu9xYSAhxszM5djlTRTAdvotsyGEEogoZns=;
 b=B7vC++4mX/zs1oygXxXKAuL/UX6VAnNzKMFnvJOLKhUA+CxxoZ8bVNgIo/LdqtRX1y
 bak6c8XksAjg/qw2+wJGEAE6ab0JSxXuxDfRcouN8G3pTPOMSzmpiE9pMd0VIcL9TSoj
 6p517zGT2sfKe5UH0iLbtx7z/aW9H569XLiKuotGUX9SfxDH7SvDTyYVPIrpqrGS9+v5
 /FS7WEgfT2bq/7yK1uqHrc7ltmpuPsLJuOHnOW5i2aLByUIy+aLOuLyqysUa2vFDL3xt
 uveY2cbHLaP2u7P0CkPG+awUUuytgi4jljT0Osz2StBLkGnUDD13lwZ2dnFOZzcf/x/L
 nwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lv5Lub/tmu9xYSAhxszM5djlTRTAdvotsyGEEogoZns=;
 b=NLwuT8e0qaR+TW9wdCoQpYKPwEuukYrltzdB5IRot1nI7FkzwNW3m7KyDcaZwjQ2ja
 kJ743E553wvDPqkztYGdB7THm4Z4SeQLVCTWbGJaSo+cKP88lQ8jDCiVkd5PF24abKgf
 SazYUdwAzQFlxRckwZZHwV9byXoSoLuNQZhu/FGd7GLCN2UOV8ub8Bf0eSb3Rj9kyNis
 iplrWHRkkUqmzfArYHPB57LjozKAPD4eodw+hRO0FBtG5UNWd9qdfhJvMm2w0XkWNysH
 JtK21ZQgGsP8z5nALfOvVpqjx+P3mR4tp3NZXqu1AjwEk+SMVrSNzydBhFxrWGesAmpK
 i9bg==
X-Gm-Message-State: ACrzQf0XPxVcBYMUU54eifxDOgQLArEtao1msRi9yj8niZp1zAcibffF
 Ex9sCjVkVwkoml7yp09+y8u7KGdTHEv1XA==
X-Google-Smtp-Source: AMsMyM5MMczs1PT+1BZRSYufXAZAppXk/upUe4wKSM+lmH7y2NqywQdQaMYKkAp9Faz0dGFyt4znIQ==
X-Received: by 2002:a05:600c:3d13:b0:3b4:be25:9236 with SMTP id
 bh19-20020a05600c3d1300b003b4be259236mr5936139wmb.65.1664544915069; 
 Fri, 30 Sep 2022 06:35:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] target/arm: Mark registers which call pmu_op_start() as
 ARM_CP_IO
Date: Fri, 30 Sep 2022 14:35:02 +0100
Message-Id: <20220930133511.2112734-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In commit 01765386a888 we made some system register write functions
call pmu_op_start()/pmu_op_finish(). This means that they now touch
timers, so for icount to work these registers must have the ARM_CP_IO
flag set.

This fixes a bug where when icount is enabled a guest that touches
MDCR_EL3, MDCR_EL2, PMCNTENSET_EL0 or PMCNTENCLR_EL0 would cause
QEMU to print an error message and exit, for example:

[    2.495971] TCP: Hash tables configured (established 1024 bind 1024)
[    2.496213] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    2.496386] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    2.496917] NET: Registered protocol family 1
qemu-system-aarch64: Bad icount read

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220923123412.1214041-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5dac651e75..fadeed0b6bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1927,12 +1927,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
      * or PL0_RO as appropriate and then check PMUSERENR in the helper fn.
      */
     { .name = "PMCNTENSET", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .access = PL0_RW, .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenset_write,
       .accessfn = pmreg_access,
       .raw_writefn = raw_write },
-    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64,
+    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64, .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 1,
       .access = PL0_RW, .accessfn = pmreg_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten), .resetvalue = 0,
@@ -1942,11 +1942,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .accessfn = pmreg_access,
       .writefn = pmcntenclr_write,
-      .type = ARM_CP_ALIAS },
+      .type = ARM_CP_ALIAS | ARM_CP_IO },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
       .access = PL0_RW, .accessfn = pmreg_access,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
@@ -5125,7 +5125,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
-    { .name = "SDCR", .type = ARM_CP_ALIAS,
+    { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
@@ -7832,7 +7832,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
          */
         ARMCPRegInfo mdcr_el2 = {
-            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH, .type = ARM_CP_IO,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
             .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
-- 
2.25.1


