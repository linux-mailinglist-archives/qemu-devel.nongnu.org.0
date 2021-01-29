Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA591308950
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:27:17 +0100 (CET)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Tnu-0005LG-TX
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkg-0003ZY-Te; Fri, 29 Jan 2021 08:23:54 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkf-0007sb-Cb; Fri, 29 Jan 2021 08:23:54 -0500
Received: by mail-pf1-x42a.google.com with SMTP id f63so6209806pfa.13;
 Fri, 29 Jan 2021 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkLTOezkfKdPVe5VTO0yLce91pnJrqvoONkhLftQoZk=;
 b=eqEG4lbqJhLaCZLhPB91Aun/2c7Ahu1Agy2+z9p4cSbVDMViJJBZyR0BU9MsExrKwS
 v9n8skX2ZvtNqDMOWxMoN9iMbo1TwL1PQy3wt1d4ODxQjzo3Rn3V1Rf+7Qsgn0OtDJbR
 wt+FdK9K5B83+NOMFArOHh26vLPEOrr7e1JgX5iYGkR3qgfslsFORW8XeMzU2x8pGQZa
 7xjSkimBdIfc4ncU0aDB7MV7Uld2dtR/1lz99KByhHEkGRlPdetOqme0k256W4w3LOB/
 YXYfOYe6zgAoEhdNxH+sYIAZsCbnGEV+p6lOOsO6Y53WMQ7D39UByr2ZWo90K+MasIP2
 I1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkLTOezkfKdPVe5VTO0yLce91pnJrqvoONkhLftQoZk=;
 b=fTpQNCBxipFagb/GmD5ROe3otdz1qfmlBLq8/Mi0MJ/9pGgSYvjeruXEVYzXMXUNvE
 qyN0Fy0X7UQug3UCw93fAWGhnEtyeAuuCjUYyykfdHvHh0mKvl72up/uloQS7THDbPjo
 THdFfQbRFPaGdsW5tJXTaoev9sNK3j41pavAvCcg8Yx1hVRKWoo5Y5fYZ3eq/0SvsvhD
 d96zKeAIBj0Mn1tSCRP5Wv4MttGxQ5TBF3pKI1SLzCxi6RS+Hzi5pYy2p6EGT0oRokVr
 bQ43qRBarRIQEAxzoLvb+WI3Vk3XNwJiyoHfkNQHUVgisZAaN1UVvdEm1CzWxYYMPfmO
 lbiA==
X-Gm-Message-State: AOAM530gwPR4r27IYkqqW8Nk7W+RW3BN+wZ/c0jUwTOk7Z/wuAqZyuU6
 2/NUIKBABKl21xeNpzioLpY=
X-Google-Smtp-Source: ABdhPJy9NgTS3aaFYc2HlE0ft0ekaDM77VB+t9udjad8wE+2HXMq+woALq+JHIzrf7yi26OV9LoqhA==
X-Received: by 2002:a05:6a00:16c7:b029:1bc:6eb9:ee47 with SMTP id
 l7-20020a056a0016c7b02901bc6eb9ee47mr4539608pfc.0.1611926631946; 
 Fri, 29 Jan 2021 05:23:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:23:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 01/10] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Fri, 29 Jan 2021 21:23:14 +0800
Message-Id: <20210129132323.30946-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
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


