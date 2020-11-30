Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C62C7D88
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 05:07:16 +0100 (CET)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjaT4-0007oH-SY
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 23:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjaRW-0006oF-9t; Sun, 29 Nov 2020 23:05:38 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjaRU-0001Vi-Ji; Sun, 29 Nov 2020 23:05:37 -0500
Received: by mail-io1-xd41.google.com with SMTP id k3so2512532ioq.4;
 Sun, 29 Nov 2020 20:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=an0/kxvJGr8CHzaGma67N3U3miPtoKBKBFeQIvPK02E=;
 b=q1UIqqBWr8+8+tNcpvrA6WaJchoRC2GKV26ThMztTKdyMEl4h9hbhO/vRU+THFVD4i
 x1eNHFLdB9rXwCcpfsrBJjzPIVcY/3z4sWS64BWhAlaQrQLuIQPVU5c41pbohHPJ9LE8
 LTVaOqbagW7WgEslhtlO6Ql1xpxdk13sg4pS5RYF/I2cC7ou5ytbgkMZHH03qHDg/+j+
 AHcr1IXZ15fEsXDW9O7dF5j4kzBEgCWaHTgtkBsS16Re1wSv9PBbEIfCX8ynVgAB4KsM
 D6leiixHfsqEw6GENALt44OATF8yMan6I8fK5FsHmPOsbQhJua0WhKhSMqfI3TmFFjC8
 txaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=an0/kxvJGr8CHzaGma67N3U3miPtoKBKBFeQIvPK02E=;
 b=BwepGGVR4xuQ+Sd25w1EeX6dp++IXHO+sOsoG5lB9lJ9lqIxfgxoAaRBKOndmiVD/S
 H7wqLj4Gcw42c2X0YQfsiWBUqCw2A8g33mzSSRJmVQ4zrQG6vQjNhqHjAJWQd3ABpdpT
 atDihF1wT1l2+5xmFSZOY4WRXpt1Aq/Imq2elJMvMm0nhIlwm/pBsud7LW3AxgUh3cBC
 UfmHdKFugUXC+KMZFgr0e5YbA088QZwB1fLh4YqkgqWMJbwDmV0pFRwiC5yFO/V56lZZ
 mqCLhD3mhSBnyzT04LmIlDTXBfgvMmKZFarpdu3iJZktsw/lFUtl9kfeWRI728/XxH6Q
 koVQ==
X-Gm-Message-State: AOAM531Ur4EBpOtTVmf7gHvocXkg4GaF7IYU/rOoXNwNcli3SpOqdoAQ
 yxhdgSWk2VkjseakVngytwM=
X-Google-Smtp-Source: ABdhPJwM0BVyxyZ1HMH6cL2QDvedatAHKAIhZh0x+vdqGNPlBvqzuRt8km1IlGfTr1cfWVpvMjs0rg==
X-Received: by 2002:a5d:8446:: with SMTP id w6mr14460191ior.138.1606709135200; 
 Sun, 29 Nov 2020 20:05:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id p18sm2119828ile.27.2020.11.29.20.05.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Nov 2020 20:05:34 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/ssi: imx_spi: Use a macro for number of chip selects
 supported
Date: Mon, 30 Nov 2020 12:05:23 +0800
Message-Id: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd41.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ssi/imx_spi.c         | 4 ++--
 include/hw/ssi/imx_spi.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae..e605049 100644
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
 
diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f..eeaf49b 100644
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
 
-- 
2.7.4


