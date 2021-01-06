Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7552EB9AE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:57:26 +0100 (CET)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1oz-0006eR-Oj
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nJ-0004qr-1q; Wed, 06 Jan 2021 00:55:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nH-0004wr-G7; Wed, 06 Jan 2021 00:55:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id w1so2079345pjc.0;
 Tue, 05 Jan 2021 21:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=co4+01plcMDklfphwAUe6tgXN/qjYqocNNI7W6fX0o0=;
 b=IW8lIzrWPDZ/GaEqerBofB4OlYuHwNBcjR8scFo3+QL+1R2ruSMIM06DhthcCQj7q4
 M8NUtadAefO1Ncsvq5KVizMWjJ8StnvGsItRmpLQwjpO3pvk03XtebOdyfpw33c1RXOm
 D4PU98TgI3ztsmVoSFpnRoTTTzs39JkXPy2ZvVp9h6P8zLRmRFtNWTyLZAgWWlct5Dtb
 hsRR2pfIqe+HYlOm75xi2XA4LjlSOK5mMoYyB9k+swBANwUQrRtnpX2JZaK2jeKzhtCf
 QCVXzAt9Dlpc/sSWrO8BMwbbchCFzsmTqKvngFk03zvubiT1pRPT9M5u4SX4DoFsmzs/
 E6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=co4+01plcMDklfphwAUe6tgXN/qjYqocNNI7W6fX0o0=;
 b=iQzFtmc4sAkBnv/15vGYPFnqV+06cA3g+B6c5G2lJ72Q/O51PHXz9bUxDnIdHgJpjf
 Nz7/vUjOwu7c2GncJmxVGVavOxPa7PLRxck0Pz41qsVJXuyn2+UYD9z2ZNCNhuSy4Jw/
 05yvg0Yp7j4t4lPyr7Vx9l1O1hn5x7UBA4RUg6rUcVEBjFFo8cXOsG/8Pgxg5PUuId70
 inCGIR/X9Wue/w/+7gsGKK+mxNad37qBcVEhjWBCdzr9OvMwIK5Uak2ANMq/mMOb/1BC
 Jb+eXvtSWOF/yxzB+21snXXVNTuqN0LhMQrsB3Y9ptCRAh19HP532ci7mllm6na+GfQM
 rgYw==
X-Gm-Message-State: AOAM532ngqePDlPP63d61j9PwAGDozi1DTZYELmCC8s597LuxcL3LUgA
 MVBXdStMhKUQ5otsnDiFULc=
X-Google-Smtp-Source: ABdhPJw6F9VXUvAHFJqJTUcvRG6mBlP0+eiaH4PtqPZRNLoEVfIrc29rFlZFQkldFg8iW5wQayYq6A==
X-Received: by 2002:a17:902:521:b029:dc:2836:ec17 with SMTP id
 30-20020a1709020521b02900dc2836ec17mr2604978plf.47.1609912537840; 
 Tue, 05 Jan 2021 21:55:37 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Wed,  6 Jan 2021 13:55:19 +0800
Message-Id: <20210106055522.2031-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106055522.2031-1-bmeng.cn@gmail.com>
References: <20210106055522.2031-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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

 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

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
 
-- 
2.25.1


