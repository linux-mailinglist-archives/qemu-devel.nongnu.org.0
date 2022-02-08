Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCE4ADF65
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:22:14 +0100 (CET)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUBx-0001t8-Bn
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSts-0008Nn-2b
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:28 -0500
Received: from [2a00:1450:4864:20::436] (port=46731
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSto-0006D9-7V
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id q7so3425512wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSJ5Foddqu0YxcTMGaVHsRCXSHYfc5mKbaKQvN2D1gU=;
 b=wlP0mxmmFVfDoJym6j/F3GSK6p6IXA6exMMocSW7ykaMiRTD4zi6E+OCTg/S46GMO+
 /D4glk1RTOpuL1nvzTwzSzfAlUUCHe641ZL11jrYRZmhM66Hok/G827fCDa5S/LE90UX
 Jcl7c0uSOCMa34CsFrsgUKW4I28OMufyyDCXHtbYy2xOjx+rKB8eBbeCMNbwdc5Tc/uy
 mvxwmsZa28J1c6xAXwEpFRMEWwB5WD+W98XjFE+sKmXigVadfvu04pcfdJQ3U0OMP8Qr
 vKgpNoATXY2tssKRmHa007u8/KStRRZ+Y1dh32GDrRJWGW/DKR5K5O63ZlbgO7yywc7J
 b0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSJ5Foddqu0YxcTMGaVHsRCXSHYfc5mKbaKQvN2D1gU=;
 b=VFSvjvit9vUgT1bVESg8ThuOTRAyNgeeWPE/NOTtWkMvG6+iUO6rRYNL1DYNsNZTqc
 Wz8C70PPc4lh2sYu502laUw8L/RtUsnVWr3LOegj3gwa6oTLJ2UgVvmvRGUZLWhIxqa0
 TgMJ5SSXiIXZbqFp35TMdZvhjdPSYGnVO8sYW8ytFEmU25S+MoRJgIAa5njyjVRUF5Zb
 Ngz4uxlS8y6skPbLg82hADdzgcoaBiAheuC6WmYEsL2LLs5usQKpTR4CCMo3dO1pQOXy
 R9DPnHHXyejV9geq8yb7Oh4so1tbO9WLwz5QBs9G89JuoPJ+gNmXg2xtuwUiuxJ2jmwS
 4XUQ==
X-Gm-Message-State: AOAM533pPIeFJ/AEQGccApCyeOhR4e+hjmADXLCOmzDhwrNEFnw9pO93
 /avJl2VeAyjWalpvO+vMes6xUA==
X-Google-Smtp-Source: ABdhPJwNOpjbZ4PGsoR9pExBr9IOzKYqn9GHE33HUncfL4a+rlG5E6wSPE8IBardrTIy6FmaKX7DTA==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr4100709wry.60.1644335955009; 
 Tue, 08 Feb 2022 07:59:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f5sm14805125wry.64.2022.02.08.07.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:59:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] Kconfig: Add 'imply I2C_DEVICES' on boards with available
 i2c bus
Date: Tue,  8 Feb 2022 15:59:11 +0000
Message-Id: <20220208155911.3408455-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For arm boards with an i2c bus which a user could reasonably
want to plug arbitrary devices, add 'imply I2C_DEVICES' to the
Kconfig stanza.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Again, slightly arbitrary but erring on the side of conservative.
I leave non-Arm architectures out (afaict only ppc ppc4xx and e500
enable any kind of I2C controller in their Kconfig anyway).
---
 hw/arm/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2e0049196d6..6945330030e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -46,6 +46,7 @@ config DIGIC
 
 config EXYNOS4
     bool
+    imply I2C_DEVICES
     select A9MPCORE
     select I2C
     select LAN9118
@@ -184,6 +185,7 @@ config REALVIEW
     bool
     imply PCI_DEVICES
     imply PCI_TESTDEV
+    imply I2C_DEVICES
     select SMC91C111
     select LAN9118
     select A9MPCORE
@@ -229,6 +231,7 @@ config SABRELITE
 
 config STELLARIS
     bool
+    imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
@@ -406,6 +409,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    imply I2C_DEVICES
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -414,6 +418,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    imply I2C_DEVICES
     select SERIAL
     select IMX
     select IMX_I2C
@@ -422,6 +427,7 @@ config FSL_IMX31
 
 config FSL_IMX6
     bool
+    imply I2C_DEVICES
     select A9MPCORE
     select IMX
     select IMX_FEC
@@ -450,6 +456,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    imply I2C_DEVICES
     select ARMSSE
     select LAN9118
     select MPS2_FPGAIO
@@ -466,6 +473,7 @@ config FSL_IMX7
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
+    imply I2C_DEVICES
     select A15MPCORE
     select PCI
     select IMX
@@ -481,6 +489,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    imply I2C_DEVICES
     select A15MPCORE
     select IMX
     select IMX_FEC
@@ -495,6 +504,7 @@ config MICROBIT
 
 config NRF51_SOC
     bool
+    imply I2C_DEVICES
     select I2C
     select ARM_V7M
     select UNIMP
-- 
2.25.1


