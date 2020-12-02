Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A552CBFF9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:47:33 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTPn-0004bk-Uk
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTO1-0003cV-MF; Wed, 02 Dec 2020 09:45:41 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTNz-0006Ls-Vd; Wed, 02 Dec 2020 09:45:41 -0500
Received: by mail-pl1-x641.google.com with SMTP id s2so1230356plr.9;
 Wed, 02 Dec 2020 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjwNWt57Ej4U7zipruW3su4cFwClr7ZfkPb/UCNL6zk=;
 b=UFW6uJhi2Mwztjtz3suJeEeYxREgIsWs/uMlcnRNGJYDIWVLK9JmEXwstsqUaJoTlK
 xrKnOxNBjEC1LlKjH7VpwDFz8lqIkYh6MmeLdbK4VUtDFiEJL/78YXJvFl8ELwZ7D7pk
 +92Y5CGuUMQu7GCN6mVUI6YJEeV7d0Cjb9krj2Cr83ut1HYKDh9ZrjCXKD+Cp2Zkkkep
 O4D9AePXD0zM0mTsyxQeDUpfx3Itd7Rnq4RiC2JhulLkQ1rU36hJvjdnmrsCDp0/hivg
 GJP8ou0Tx/0xtyRofACF6f+qJPgoaBrFouYrCs5CZtcCpmAWCAyKKGbM3sCo2idj8FLZ
 3sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hjwNWt57Ej4U7zipruW3su4cFwClr7ZfkPb/UCNL6zk=;
 b=iD+jTWra4uXzePFAgSgrPMw+VVDeJJdaMkLtp9gS828V5lCjGwKIwXAXDFUcytBRmx
 Kub4mbXQaUOCOQZ0v4OZXCzlUt21dNT39/vh6+JRhNVx73B/jdi1qucqk3XUG4zEsMgv
 bqQVldOgWTnnhcBQW6PCcLYKL6WJJWuvZZft2eaPrpGpTh6wrbRdYK5KWSsMwLfc2uMy
 qSr2ahXDnizkvPakeViSMPduliK2UxOvZMaMEjtcL5qsyiJ5eUjey82paM4qfnA4EfWR
 +uWtbR7rAm3VoN4cZWUZlPNZFb1W/4JQu+Y8TFgU4aodQRSja7k3/mW+/5R6QXgcAGyO
 MFiw==
X-Gm-Message-State: AOAM531IGxeGHBGB4aH9qdDjdJ0S96ASia8UeTPRmZ2r9aQQl4Wa4oLE
 jFEn/OsXsmvy6v95zVNwvUc=
X-Google-Smtp-Source: ABdhPJx4TQbfqHn7H2gtlS2fSlgeIxhbbVCjdMmeNVIq+Tb509c6RZaC246l0qmacjSiymvTNWdrzQ==
X-Received: by 2002:a17:90a:9306:: with SMTP id p6mr233329pjo.50.1606920337819; 
 Wed, 02 Dec 2020 06:45:37 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id u6sm92367pfb.197.2020.12.02.06.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:45:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Wed,  2 Dec 2020 22:45:22 +0800
Message-Id: <20201202144523.24526-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x641.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/ssi/imx_spi.c         | 4 ++--
 include/hw/ssi/imx_spi.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae454..e605049a21 100644
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
index b82b17f364..eeaf49bbac 100644
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
2.25.1


