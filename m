Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A12F7FAD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:36:22 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R9B-0002FX-IQ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R43-0005Ya-2W; Fri, 15 Jan 2021 10:31:03 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R40-00010t-MR; Fri, 15 Jan 2021 10:31:02 -0500
Received: by mail-ej1-x629.google.com with SMTP id l9so8130181ejx.3;
 Fri, 15 Jan 2021 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdTpIDS65/IfYybVOuMbzhHG9RGib9cm8VYJpYoGsWk=;
 b=OW95yZ/cB5wcvzWT38Vd+zNLll5JxteBr2Myl5hn64k+oxwwMBwXONmMWjNH/tgUxR
 W7G++IlKXLQidpJhUWQit6bL5Hsam6lpizDuqULcqTIS3Awm5+VmbVemJIzNf2wEEmL+
 oO/bju/QmaiqCcJtO0VhIv06U+MQbN/BSkOShK/jE3YO81a8LSDCXMio9uqHWV/51Zsw
 SMKDbd4GTAkV61z5YREDml8FrQ52Fc5614qtqUXSJGp2RAOMq84wZAqtGqvUoeJbIwSy
 pgpFf/hHnHpth+GArvrNRY+suSIqEzEoWfxi89CdtBlR9l7MV1QWnmqncMA2ymASxWpC
 gBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xdTpIDS65/IfYybVOuMbzhHG9RGib9cm8VYJpYoGsWk=;
 b=Nyjnc/uojtcEXrmR19HwI49wCrJyQt4+ehjfcsPA4H3GXqRn20z+lXh7UeKkpX4U9Q
 M6LPf8gktP8/oFXXUKyEhP94SvEsobeaLpHXxxMGTwei25f48zFQvd0Hc4YNDS37mSkM
 b+WiYV3PH5BqFmSNwXa2CpZXuDYwoscxZrFskGcz1oocOQJI3E/Nhm3Lobu6P7W4X9x2
 oPwFl4GNOnluvua/vcnY4+OGjnUW93MxVQEHx4zIhw050alRo96OVRU3vwDxPNHIuR/6
 j+rHmMI+aGUGb9j92m5O7aaGwHMZxOO4GST8eGNUC9frJiejkouxkOgrcB4JFrSwYuqq
 AQLQ==
X-Gm-Message-State: AOAM531VXXsDjAG10utxpIxjmykJEcmejrD1U2uWmfof4JUFl571UzY2
 +O148mXuBSlBRwUJFZMXo2/5LPQpicU=
X-Google-Smtp-Source: ABdhPJxGLLkOcJHJhS6j9RasBp0evkUe38IcKFyeYc7uMMyBFInFEzZokuwydfSChIia1SyLsc7kNg==
X-Received: by 2002:a17:906:971a:: with SMTP id
 k26mr9644949ejx.515.1610724657419; 
 Fri, 15 Jan 2021 07:30:57 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i13sm4072081edu.22.2021.01.15.07.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:30:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/9] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Fri, 15 Jan 2021 16:30:41 +0100
Message-Id: <20210115153049.3353008-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115153049.3353008-1-f4bug@amsat.org>
References: <20210115153049.3353008-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210112145526.31095-2-bmeng.cn@gmail.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f3643..eeaf49bbac3 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -77,6 +77,9 @@
 
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
+/* number of chip selects supported */
+#define ECSPI_NUM_CS 4
+
 #define TYPE_IMX_SPI "imx.spi"
 OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
@@ -89,7 +92,7 @@ struct IMXSPIState {
 
     qemu_irq irq;
 
-    qemu_irq cs_lines[4];
+    qemu_irq cs_lines[ECSPI_NUM_CS];
 
     SSIBus *bus;
 
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae454e..e605049a213 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < 4; i++) {
+            for (i = 0; i < ECSPI_NUM_CS; i++) {
                 qemu_set_irq(s->cs_lines[i],
                              i == imx_spi_selected_channel(s) ? 0 : 1);
             }
@@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ECSPI_NUM_CS; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-- 
2.26.2


