Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107943A85B3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:56:27 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBQQ-0001Yu-0i
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFD-0006Mr-HH
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEi-0000yb-8H
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c5so18843008wrq.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cx+nRZZDSzyxnSLiyezkFu0ca/l+cSVer7KxgYODaMI=;
 b=PHN4hTSTRgjsDJRvTwtF5HStTK607jbZ811W1OxZULPaFcjYg1j6Ajhne7sMsyeAtg
 Gjw9NODez5vSGDOGY0ij1enN08apGgdAoRGyyeCLdGJcrojavSvk2Ea0gvGZy4a2wkK6
 rXeyIXacYgsNUMVCXIiZ+7qZor2eCjytzAN5pa9Av4qJuJAc+1/HObmaWYZM918luY1C
 yvUnIiUNs8GCZlGvhfAO9YWqbl2bE/tPS+dQGKsO8Uht2oB4x+cyDuK0c8vGIpsGeB1L
 bhK9CVUCxDVv4i8pomkGK/m9jrgM5WOGucSm5T5kp5e9tL0fUa+m5aYzHaZqOHDX474m
 1x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cx+nRZZDSzyxnSLiyezkFu0ca/l+cSVer7KxgYODaMI=;
 b=fnTjRBvly2agG00wRYXCwbW70K37NFrlUflSREKXOIHQc0Jg98VsAeFFk4XT1X4yhn
 g5+LCthjdfjf2q4aZJ+h6/DgssKMwBOND/pdGmCm159ZEm5D5/VJFq408wJCgn/aOEHg
 G2v0tLooYLH4dJLG/JA7dwiyPcGzQcClrIrHOVGjYOKY2NWYVVprW/xMgMMRrVL4A9E0
 na6zM2iv8OKLbOjkuMwJiN1z78arDNBCCBv5NPLkE1XMoP2fYk/iF6xgOFH3d9nr/wtI
 CBDPQryYTBSPBkykX8McFanF1ZTcJx0vN4vAKsH3inQoBS8SXOFXaQBm0wqH6F20avMT
 djpQ==
X-Gm-Message-State: AOAM532fzb3cokMC5BuS/LR2XUCKX/qrNSqWB2pZEYVQ/rFdViAmVSPD
 pFG/WDjgab2Fg9TEr5zYsClkK0lpm/WMqg==
X-Google-Smtp-Source: ABdhPJwhR5hBD3uqrYwKNLmWyCzjGl//OeRWHIkgOOguI7TlFS73wffQN95ntKtaOAaC6nsZrtWYSg==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr845634wrq.30.1623771858522;
 Tue, 15 Jun 2021 08:44:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] hw/arm: quanta-q71l add pca954x muxes
Date: Tue, 15 Jun 2021 16:43:52 +0100
Message-Id: <20210615154405.21399-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Patrick Venture <venture@google.com>

Adds the pca954x muxes expected.

Tested: Booted quanta-q71l image to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20210608202522.2677850-4-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 11 ++++++++---
 hw/arm/Kconfig  |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0eafc791540..1301e8fdffb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/tmp105.h"
@@ -461,14 +462,18 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
     /* TODO: Add Memory Riser i2c mux and eeproms. */
 
-    /* TODO: i2c-2: pca9546@74 */
-    /* TODO: i2c-2: pca9548@77 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
+
     /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
-    /* TODO: i2c-7: Add pca9546@70 */
+
+    /* i2c-7 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
     /*        - i2c@0: pmbus@59 */
     /*        - i2c@1: pmbus@58 */
     /*        - i2c@2: pmbus@58 */
     /*        - i2c@3: pmbus@59 */
+
     /* TODO: i2c-7: Add PDB FRU eeprom@52 */
     /* TODO: i2c-8: Add BMC FRU eeprom@50 */
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8e7c9d22a45..647b5c8b43a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -414,6 +414,7 @@ config ASPEED_SOC
     select PCA9552
     select SERIAL
     select SMBUS_EEPROM
+    select PCA954X
     select SSI
     select SSI_M25P80
     select TMP105
-- 
2.20.1


