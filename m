Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA825048EF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:33:12 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9hv-0002ps-Sz
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90O-0004Qw-Eu
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:12 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90M-00042Y-FF
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:11 -0400
Received: by mail-pl1-x629.google.com with SMTP id b7so1089979plh.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLPmYgqDe1CN+qFThm+PXn8LkgCmKzZ27jOhFMTIeFk=;
 b=yPoF9KWzys3/WPeMOlwKtIfxR2KTN/W6FHj9xpcKodjmop9nihstHGsGy6LHWRaM1b
 a2DLVl95EF3osz00hw4zPAyyEXFvOCS4HGJHGq48/JnWq26d9A+rpwit2bDVWP/133Jq
 NIwopTiiSpaNCQWLhP8XQXv6neFcJ2IBudaqAGfCw1Z13EthoUD7jyS1nfDNDUR0C0sC
 d/ID/32E/tXpFegCZs/YcKnF6UsH3jm3W3Kv2vUTgjq8dUhXO0x3bZhNOlLLAq0/5zKo
 UF7rmHowu2KAxhkFMc7bD8e589hXv9mdN8kU16B9YmpGXK6gPvSKlT5jrGK0xuqR9Eng
 vYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xLPmYgqDe1CN+qFThm+PXn8LkgCmKzZ27jOhFMTIeFk=;
 b=dc6bpP7phPtZ7B1sN10AoQ/84SH5nSJj5PiTZSHPuIOYOxgN89GoQkjbtEHNGfzO7G
 ut6jnFPPZMLSDEktRbr1q96WQmwg6Ql9HNxCKWXlym7txdHMseYIvYlOxU8FdHt2W5Yg
 52XegtvVW8sUigwi9Ia+Z5oYDUJsTe974UXj3vFHr2BrfaRuuV5B96BgUFmNXNgrL7bH
 fMD4RMjakdytoK9HfixlxdsLZxjOiqp2iLRK5jHVmuPHGlP+9bASA3hR5bhCaYG/PQQA
 UHlLd0lyqnM8LfmKUOnjrbOFtv+PGHbnfA2QeeQCLXhk9ScCnsJSQ2OR1qu4tX/qvsIO
 HCyg==
X-Gm-Message-State: AOAM530si3XNgEdlUYeEKi8rcvIYQ2Z81lirhUXS57o59jotgFxHCD3R
 7NQF0/aUvOrKkCo6YqWeC0vN5I6BOAaY0w==
X-Google-Smtp-Source: ABdhPJwuXeHZkxhrwr4tPwBEYx/kmXJnXu10372G/0kyDx+hB+MXzWW2yvIE6SWk//3KqDhZwBSA0w==
X-Received: by 2002:a17:90a:6c64:b0:1cb:a150:52d with SMTP id
 x91-20020a17090a6c6400b001cba150052dmr9133416pjj.111.1650217689193; 
 Sun, 17 Apr 2022 10:48:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/60] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Sun, 17 Apr 2022 10:44:11 -0700
Message-Id: <20220417174426.711829-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3da8841eb2..33451cecf7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1782,11 +1782,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1817,12 +1819,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


