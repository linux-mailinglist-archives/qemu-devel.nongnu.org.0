Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFA6F43D6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:26:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoux-0003uB-NN; Tue, 02 May 2023 08:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouZ-0003lX-EO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-00035i-NV
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso21531765e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029706; x=1685621706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J66u+WCl7gvA9vOgwyt+Yche48sP59rv98jNGezceLc=;
 b=peZwomqfTRQsbdAIGiWCJD9n7R2+Ug+UPxZm9bZtiSW43L9ZfmYhLVNNrdIsMlO4DR
 rc7m2Hyd4Hh/ZbgIl9JevB8I1ZW9LUeUzG8JJn6OziL5tUKZHGiJ4xfJcBOhleIWc1MU
 vx3KAuUEvGFteEfaPjpwW/5D2pdjpkGUAxKWYLPWSrzjlvS3lBxht7kdv7GxwhEYJCsn
 ttGy3GnjiqR2vYGx5C8ogLdqU/qlKzaUD55YjSEVLdcx/E7TYr5wxmtL/qNmGsxTYXc0
 BCkKOnzcq/5fTb7r4E9XPQZiRaVCLQrMtOJczwGMa9jses4MFuKHn+wZGR/ifHygmkp/
 KZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029706; x=1685621706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J66u+WCl7gvA9vOgwyt+Yche48sP59rv98jNGezceLc=;
 b=VjyzddQSxeEunHhz0HtRfrkNGTFv49uvMWDxKJnCc6wStoODDe0eSdAsFomOKR1Ycd
 H7y2z/HX+Hb1XLdA1e9Xi6LpseHJLQpK2I8MSbvm7AMlj+60TxcvMId9hAP01rQ9bBCN
 5HVDZV8TFiRTFKPwM/XdNsiay8Hhts2BBoMyA/MgUB398Z1gH+Z9NWvIJ2oSc8ynYC3G
 51Fgy+ygOmWf6r7M1NjG13vC0gdyj+1V1lB4OTgXLtJ7fViFuj7XYbj9p5QZaW0b4W03
 AWK76P9Ax1hEwVZo4wzLKq0IhNt+UM6FUCOVjL0lhKdeMzPmS57Dxx4nrXSw6oR1BQRr
 VHNg==
X-Gm-Message-State: AC+VfDyiN2PaXKHwKnWC7f2IbG2DH1fijpXJSi2f0SbaMeYL/UIqjmv0
 +/PGCu1LO+gCYINwd2Excio7SaLbsiwYa6pIIzs=
X-Google-Smtp-Source: ACHHUZ6IQBW0lP9BHrupLV5rCk3dDrSonlKPeZoNbwPDyJmIUBjCJ23Zl3CpQLQEvncq5hzG8r8Hyg==
X-Received: by 2002:a05:600c:acf:b0:3ed:4b0f:5378 with SMTP id
 c15-20020a05600c0acf00b003ed4b0f5378mr12595680wmr.27.1683029705828; 
 Tue, 02 May 2023 05:15:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] arm/Kconfig: Always select SEMIHOSTING when TCG is
 present
Date: Tue,  2 May 2023 13:14:34 +0100
Message-Id: <20230502121459.2422303-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
default.mak anymore. So reflect the change in a Kconfig.

Instead of using semihosting/Kconfig, use a target-specific file, so
that the change doesn't affect other architectures which might
implement semihosting in a way compatible with KVM.

The selection from ARM_v7M needs to be removed to avoid a cycle during
parsing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230426180013.14814-11-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/devices/arm-softmmu/default.mak | 2 --
 hw/arm/Kconfig                          | 1 -
 target/arm/Kconfig                      | 7 +++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c7..cb3e5aea657 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -40,6 +40,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b53bd7f0b2a..87c1a29c912 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -317,7 +317,6 @@ config ARM_V7M
     # currently v7M must be included in a TCG build due to translate.c
     default y if TCG && (ARM || AARCH64)
     select PTIMER
-    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b2..39f05b6420a 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,10 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+# This config exists just so we can make SEMIHOSTING default when TCG
+# is selected without also changing it for other architectures.
+config ARM_SEMIHOSTING
+    bool
+    default y if TCG && ARM
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.34.1


