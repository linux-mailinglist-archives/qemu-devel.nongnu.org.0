Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D714666FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuli-0002r3-2o; Thu, 12 Jan 2023 05:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulf-0002pp-SU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:07 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuld-0000JT-Hm
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id r2so17594171wrv.7
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdbzZcLHTRdT4BdGiWixXL1Aa81U11XaY7492Ze75as=;
 b=nAWbmTJjZr2z4XR4KZiNPTDBbXLEH7I+zKOmGMhXO3LcAU+nArtF+TPvbsZs/I38iK
 zwEV8Qy8eXsf9JKUKkYkbE/c5w35qD/JlVuOIFR9jKGA90HmLAcj+4gs+BAkvXafI401
 5k5+QhWohkWjRIzlLMq0R7oIQjL6MQDYsJCMAj/0tfZniY04m4eyQXwKFZThXbHsu6ZS
 OI66zpcIIMY6zYyfywVmG6p4J6vRX6fIO5BQ5a8FU7y7t/+CJ7Bgtr1BOkwd5CfQwflg
 fXxHNLxnWFbI94nBtPGdhVgWM5rWasCFPWn3bXOkJPIp9rX9Z1yyDdmXd9GUpFDltTnQ
 Pg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdbzZcLHTRdT4BdGiWixXL1Aa81U11XaY7492Ze75as=;
 b=tdCJ+nq3A+ffxCxXzGDRxSYH4roEpCVWmUIKupzz04vCI5O8EBqRCH+s/AELi4zfnZ
 iOuuWwEAq/VvmZ7k41ePDpvvyE8cLjr5oHdZeX7swsSdrTfLDDqTmI4YdA2d//TuK02m
 8RwCENXXYzFdypQf/2NVn6avOsHT9DxH9Q1ljgpZdt5qt1HBtm0tSj3fFOx3T0VN/PIS
 2jISvZUMnj2PEUfb4uQLjdW6IMv92KyH0d1dtClcdilLAkZ+FkMHlirIWTcFI7cZa5K5
 lwTjng1QwygzuMW0qIRbFo51/ZpV3XnqQeFtZQ78PXXDTS/p9sqPtug55zpyk9QeX+F7
 KfjQ==
X-Gm-Message-State: AFqh2krd7Hzc7usLr0dKapySOmq9IqD94aiAq+yd1zr3Uutq1WqEY1dY
 GXZ1HetxeG5O1nQYHBhn2vPUo9pPBXYCvp3K
X-Google-Smtp-Source: AMrXdXsm+2jtQaYstWVNP3fYMiEuWwZqQTvaJEd3q7nze2LYGZexTOiRs6OVgHWKH9/DUoN2qKcI5Q==
X-Received: by 2002:a5d:6b87:0:b0:2bc:371a:8a1 with SMTP id
 n7-20020a5d6b87000000b002bc371a08a1mr9088673wrx.22.1673519103792; 
 Thu, 12 Jan 2023 02:25:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm16093843wrb.107.2023.01.12.02.25.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:25:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/7] target/arm/sme: Reset ZA state in aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:34 +0100
Message-Id: <20230112102436.1913-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c     | 12 ++++++++++++
 target/arm/sme_helper.c | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b655dde27d..26c3bb4cdf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6740,6 +6740,18 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
     if (change & R_SVCR_SM_MASK) {
         arm_reset_sve_state(env);
     }
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (change & new & R_SVCR_ZA_MASK) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f73bf4d285..e146c17ba1 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -44,18 +44,6 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         return;
     }
     aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
     arm_rebuild_hflags(env);
 }
 
-- 
2.38.1


