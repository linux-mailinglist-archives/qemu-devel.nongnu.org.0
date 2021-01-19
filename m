Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E802FB683
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:53:19 +0100 (CET)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rRe-00072U-Mx
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFW-000374-32; Tue, 19 Jan 2021 08:40:46 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:35775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFT-0003WT-KS; Tue, 19 Jan 2021 08:40:45 -0500
Received: by mail-io1-xd34.google.com with SMTP id y19so39553782iov.2;
 Tue, 19 Jan 2021 05:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HWzb9NPxWe6zyUwwKtlVZgXltJoC0KnXjNfztjX3fMQ=;
 b=dl6T87y1YNVYT4kq6iRLKx9UWiHGFGBkyR/JyAFmqAOQucTzLJFTXAE6ZNbikxpxf7
 Iw9I2NckKPcz3JbyvDtgQpH+XvED1nYsQ/8DQ5StyTTbX2EiSnfpzU5U7lFQlNjHXQGy
 h2fgqFDt4jJHAfGcO5/wcYOHSoF6k/TP09pNbEJLMaB7rzXg0FjOFwUpHB7JfGT3fypI
 2wcQOI5RYxAhrdUv1Gh9m/40iOzxwCXZbJcTu1VqNW4CLunYveaZdrRjz1kSjz4TTrF7
 P1ML0XNh0kW1AEXXPkgsw90AizYj+GVA6Lp3IVW2Y7K3OEg6x7AIKOAok5w5DLGba1G/
 P4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HWzb9NPxWe6zyUwwKtlVZgXltJoC0KnXjNfztjX3fMQ=;
 b=AIhZvHC6939cZE6OtmfVLQ5Ovj3ZpKHFpJRRfcFsKjovtUW+eM3vQWTVWGBvp4Se0y
 nICviTPX67xpHRou8DxFngPL4n4t/8pUYmQS7obZjkaoF4MtE2sZaz1/hyJw+lfDx2bl
 7cWYalSb0NcnbOV9zNdflcY8biC5o60/MvEg+vu+o+DXOl+uYxLC03znuk/1ysoRsyyP
 zi3dzFMvUZUWmTqcn+AQ0BO4sCdvGQZUlDaJya/No9UxWEHIJs/PgdCc5xpA6yITEaI+
 kF8SmPK1HVPWM0ogQSmrRRiqfSFx6nRpIUDFiuqxtRUi0CEc8Jl4RKKjYmrVs1MMQV20
 Mv0Q==
X-Gm-Message-State: AOAM532N56A2Al0sf6uI9oFJSujt0bk0uqFBkygnAvvylM/vGhFiPDLH
 iZPdcvQnI7CZNX3ZQRIXNQhwN9BTen8=
X-Google-Smtp-Source: ABdhPJxxyiVLQ2ZOCRvmJQGLhy8HEh35gM3sqMoIPjPyXOaF33k0i2YfFSlE82pQL/owIG1CNUG4Dg==
X-Received: by 2002:a92:cd47:: with SMTP id v7mr3407233ilq.288.1611063639095; 
 Tue, 19 Jan 2021 05:40:39 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 08/10] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Tue, 19 Jan 2021 21:39:04 +0800
Message-Id: <1611063546-20278-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v5)

Changes in v5:
- round up the burst length to be multiple of 8

Changes in v4:
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 5838bb0..3c80725 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+        burst = ROUND_UP(burst, 8);
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.7.4


