Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E430C992
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:24:18 +0100 (CET)
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70LZ-0003p3-9G
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu1-0005Zm-A2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zto-0002GB-Ok
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: by mail-wm1-x334.google.com with SMTP id u14so3063224wmq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9T4oatLmGN70Mw8GfGi8sZ3ncLhfpm7moP99hzX+qUc=;
 b=ImRt2TFba5sp7eOZ3yqaUupLKEdl2DHNn+88BrnExCP9A7UfYcdfVRbXaXN+AXc0Oa
 PCZC/D/OQgDASHeogMBq5TkX2ImMiz5Y9Y2oKssYKUrN+XuiJe3fZAp/Hvhzef32whYy
 cw3CprXrpLEuQg0mhnL/+s8oT3GdNZk5Q+unYYxqtvfJbvplkT/Dde5eRGboWpq9qJWl
 sX6OFMaQ/ygtdWZFoevxOr9gza19ChttHe6wn62CkGCjK3ahRXqAZrzB0F7ZRC0eKR7r
 bGnoG6UiZyjMgfxgf93aTOEZGhlYnNJY3RjEjgEuJLVYMboF+hhFI2Y8CzN9Zp2N4VCc
 9NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9T4oatLmGN70Mw8GfGi8sZ3ncLhfpm7moP99hzX+qUc=;
 b=eE9FIGc+YELAtLv3i0EFczw4bMgif5cUMBfWGG3S5sH/KaZ6rtqrRtI+flVrP0Ow+K
 iv7lcLkykaL0Cwfu8FGmaVl+5cD3a2glGi9hA72e+yiM6wJmC+k7VXt8XkOk7jaEx6zF
 7PwH3XiyfvHkv6qEbMR8Y2jZeH28Uf/X8m5xtIon/BW90sR//pLDJC5GqKRc5sJVXeqi
 4b3ADuIdMSWp2lDfS4a/58rYvHKmpNos6qRl9ni1FNBYKunP/X5AXejVBxf9CmLQScjb
 nwURdNSUvDylmWE7OsICjJ7f3rNryYMXPKyPVA8Sxp0/rYjYT0TPpXjJLFgL6FOhLJLZ
 qFEA==
X-Gm-Message-State: AOAM532anEUvimAW/Yo5Jh3huebwXuKoW3bpsrR6AOO1mrxd3GmdQDzu
 wkWXw90eYa0LJhhCOIURzo+q53dirJVcdw==
X-Google-Smtp-Source: ABdhPJzO7nmhYkRK2uf8a8qKu0Shi30k/MuQVsssP2SVEgWAN6h7Qxe+34OV2Ezq9xoLzsi170aJEQ==
X-Received: by 2002:a05:600c:2204:: with SMTP id
 z4mr4665734wml.138.1612288525769; 
 Tue, 02 Feb 2021 09:55:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Tue,  2 Feb 2021 17:55:02 +0000
Message-Id: <20210202175517.28729-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), to a new function
imx_spi_soft_reset() that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210129132323.30946-3-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a213..4d488b159af 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,11 +241,16 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
-    imx_spi_update_irq(s);
-
     s->burst_length = 0;
 }
 
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    imx_spi_reset(DEVICE(s));
+
+    imx_spi_update_irq(s);
+}
+
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
@@ -351,8 +356,9 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
+
             return;
         }
 
-- 
2.20.1


