Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8842F3946
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:57:10 +0100 (CET)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOqr-0004G0-SL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOWC-0000uC-68; Tue, 12 Jan 2021 13:35:48 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOW8-0007Ct-Sy; Tue, 12 Jan 2021 13:35:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d17so4903257ejy.9;
 Tue, 12 Jan 2021 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZVE/UnVAR8oa3ZhuHDdsTxvOv0WljPZECYmmW3fajI=;
 b=Wms8QeQpxumW7CSLPWDKIvgbOB+oAf6n8Bvufw9QCT2PviPTndhs1RiHBq4D2uVm8O
 qHfP/tjTFWskh5eKabSiQzJcGIMxTx57Tngsj+ZePrDzYxrxfDDd1E9/eOxeFMKj4zNn
 zz17M1dL3bLL6XSi8yJBceKJGZZIU3RlHXeDyd+1P7SGc4uTau0CI6htE7kJZZgj8JGp
 WcF18GbccxvgiaLqFX2DYb9CA/qCQFEuGDqBVudocUmSzXai4Yo82ImACsizEq5WpEhr
 IN/j89MFWW+OJXjyq63bTHSnt6lh+lg1Vg7jdcBfYKjjOBQVTpsjtai528kb0ADt4V4i
 YytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RZVE/UnVAR8oa3ZhuHDdsTxvOv0WljPZECYmmW3fajI=;
 b=cOO7wau8OFZbzybNSDdIiGYJUP1GdiNWb9V5Ed2EhKapkhb3fiEvbUVoj38mvW8tZf
 e78GdbH38LRGYDkfZozoTexci1OZqr3peyUi1iWKzkK8NH3iKjOAC2vn1P8hNDBKWGuv
 qhuEANzJyTVJHXzhjd6ahy1A9RU3lIcY0u9M9GLxJwwlCgwOM18FioS8V08Vrrh74IJ2
 DEFUDuK56N/+gHI85WAZBaR8/50AQ6DdB/eA0Z29jWp1HKNK6CszP6vywl0ezaA6n+N5
 971vDzcPxZepVZ+Et1DgFcEc/IKb4odHOAq4sD05pDzePM+cB4BnPsbRAScKSphUHI3T
 iDdg==
X-Gm-Message-State: AOAM532B9xZrzUTD06X9M8PyQUN6GZfqixrEmG4r8LpV/zY4a36bnEg9
 jLctoc10P4aXopO35Mpz6uk=
X-Google-Smtp-Source: ABdhPJz5oMQInJX8nXmHfJ5ctksM/LhaqxLrcwSJR9BQErSlE68VcG1bXYZ0wp0Iaht3fbFYOUGXvQ==
X-Received: by 2002:a17:906:fb9b:: with SMTP id
 lr27mr110910ejb.175.1610476543295; 
 Tue, 12 Jan 2021 10:35:43 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id w17sm839127ejk.124.2021.01.12.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:35:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 01/11] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Tue, 12 Jan 2021 19:35:19 +0100
Message-Id: <20210112183529.2011863-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112183529.2011863-1-f4bug@amsat.org>
References: <20210112183529.2011863-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210112145526.31095-2-bmeng.cn@gmail.com>
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


