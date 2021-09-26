Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA0418694
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 07:09:48 +0200 (CEST)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUMQ6-0001YA-MM
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 01:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xchengl.cn@gmail.com>)
 id 1mUKN1-0007Wa-KX; Sat, 25 Sep 2021 22:58:27 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xchengl.cn@gmail.com>)
 id 1mUKMz-0002Lv-Vp; Sat, 25 Sep 2021 22:58:27 -0400
Received: by mail-pj1-x1042.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so7367258pjw.0; 
 Sat, 25 Sep 2021 19:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=jcXLkaoCGGJvhJvppb7F4fzBh1DVGbcEwtOyBmX7mHI=;
 b=UJu8ai6g9bafMG2XtyYr03yLgROdY0JZ9BfRhR8Yo404EbUIOnGnimD5YksOEaF241
 wdlPEKepwrIHDkFDdTBDZd4iAU7Z34LCoSQgfvO0KnFv2pGRFeiAnIfcx0wu8dSqRAK6
 ZNDlww8a+6FDuUS5D9q0Uz5EU4XaVHjHta0IcTVZ2uRKkqLawJbJKfpDjtFpBBOftKHg
 +B2+Lq4NDZYABP/LpR7hHpBmFfjxKaeaUkPRyZBEZ7Pb5AGxbQgh0NAGxXHbpk5i0dOT
 hBGLLL+5lEljB3r0uHnfeASO92ezHtINCI5RyOE92kbbPmLWAJhXcHr/WuQYKTF0Poav
 OWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jcXLkaoCGGJvhJvppb7F4fzBh1DVGbcEwtOyBmX7mHI=;
 b=nqMS44J3R6PcG2ChAymNKxiTDSBDk6j1wIiGGTejf3kmJH13sHEGHAaeV/XhIOmRmL
 eOke4c7sdyRSxfq5yvcaX9gl0JBbktGDQFMXrbcCQ+0z9/0o0JF7w9E4PCxFD+ArFoR0
 c1X64DNrnJa/Dz6WWZJR4AKtKFEqGQKHG6NnimNLHh9XtPkpvid6pNgSFkuKWvSKxinO
 KmOhLVEfUg9avmHocjauwLU68/kVoa7n9vG5tJ8UPMmoDsADjPpBNddAvrbd2VBxOmYv
 8b+RwDh7J+yhTzaR0fgNT9fedY7FZLI1Z2UdVqI2PVQ4KXgKu90ILS6RLXlY9AhqioHZ
 yV7Q==
X-Gm-Message-State: AOAM533kws4xksBaLufuudR2MlXKdMywweMSyZmoXvy14cC7Pn206Urb
 QBIUrySbEfG/eBZ03El5c6MFAX7pmA==
X-Google-Smtp-Source: ABdhPJxYQ5yG2ers7KGVZDqN40vC1M1cAfZk17Vjt/57ujk5LzReH+J2Dn/SFm4HOKOVfOJlSQGSUA==
X-Received: by 2002:a17:90a:1d8:: with SMTP id
 24mr11340519pjd.69.1632625102697; 
 Sat, 25 Sep 2021 19:58:22 -0700 (PDT)
Received: from localhost.localdomain ([120.244.142.81])
 by smtp.gmail.com with ESMTPSA id v11sm5085566pjs.40.2021.09.25.19.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 19:58:22 -0700 (PDT)
From: Xuzhou Cheng <xchengl.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Date: Sun, 26 Sep 2021 10:56:51 +0800
Message-Id: <20210926025651.29456-1-xchengl.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=xchengl.cn@gmail.com; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Sep 2021 01:07:53 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xuzhou.cheng@windriver.com,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 bmeng.cn@gmail.com, groeck7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The Linux spi-imx driver does not work on QEMU. The reason is that the
state of m25p80 loops in STATE_READING_DATA state after receiving
RDSR command, the new command is ignored. Before sending a new command,
CS line should be pulled high to make the state of m25p80 back to IDLE.

Currently the SPI flash CS line is connected to the SPI controller, but
on the real board, it's connected to GPIO3_19.

Should connect the SSI_GPIO_CS to GPIO3_19 when adding a spi-nor to
spi1 on sabrelite machine.

Verified this patch on Linux v5.14.

Logs:
  # echo "01234567899876543210" > test
  # mtd_debug erase /dev/mtd0 0x0 0x1000
  Erased 4096 bytes from address 0x00000000 in flash
  # mtd_debug write /dev/mtdblock0 0x0 20 test
  Copied 20 bytes from test to address 0x00000000 in flash
  # mtd_debug read /dev/mtdblock0 0x0 20 test_out
  Copied 20 bytes from address 0x00000000 in flash to test_out
  # cat test_out
  01234567899876543210#

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
---
 hw/arm/sabrelite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 29fc777b61..553608e583 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -87,7 +87,7 @@ static void sabrelite_init(MachineState *machine)
                 qdev_realize_and_unref(flash_dev, BUS(spi_bus), &error_fatal);
 
                 cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
-                sysbus_connect_irq(SYS_BUS_DEVICE(spi_dev), 1, cs_line);
+                qdev_connect_gpio_out(DEVICE(&s->gpio[2]), 19, cs_line);
             }
         }
     }
-- 
2.17.1


