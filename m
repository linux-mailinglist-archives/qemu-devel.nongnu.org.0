Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D302141966E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:31:13 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrey-0001dy-3J
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xchengl.cn@gmail.com>)
 id 1mUrcY-0000am-GL; Mon, 27 Sep 2021 10:28:42 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xchengl.cn@gmail.com>)
 id 1mUrcT-0001vH-CY; Mon, 27 Sep 2021 10:28:42 -0400
Received: by mail-pl1-x642.google.com with SMTP id x4so4411570pln.5;
 Mon, 27 Sep 2021 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ypf8Brs7P3HmWJK3Gh0gLB+n1nn83t//L0IUxSI9RAo=;
 b=ItzwOVHQ7GVsvh24gdl1KO0KYPdV1YFuSYpu+6I0lUhTjL3pRonYR0+aA83QYfyiGe
 l2Il9lYjSc7fNI1BQTHJbuySHUb1ai6yFBeYzTXPpDa/V9sC5FcQWn4WQaPKjC2vlm/i
 5p8gTUorTd1foNFJ6w3nAuIOK7i+/ljlO378mjYNU2wKqqmNRxgNjVxVikR/HRbfNxpe
 bjFeZxT214Oe7TieDWKk2MwMf/HTNSDTg2uqQS0D9m3OaRED+lVG/OWPG0DjGU0H+RQN
 jFl66gNROLTTb0Kipdl72ovJ720rewY/qGyTCKRSCk3NyDBUv3s9NIlOWFuoY788U2A0
 Azig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ypf8Brs7P3HmWJK3Gh0gLB+n1nn83t//L0IUxSI9RAo=;
 b=PoaYUi9fworlofTDlwqxKl2GY7oYS3cWhBWsJEeoUkNgFjViJ4Xkep6i057vNEqln8
 oLYTFHIaubwaa7G+wIufYsOHim4aqJFgqx/MUVQ9D9qp7Qy9PUR11eB2UOPpWGZB1RTy
 DH+zc5dWheImeKpluSekC/GbCGVEXmxXBpTruShr3MrFKERmfZdYXbe2UKb5j+0Y6XvY
 D0MkvxGR8SWE96IjWw/wdrowLSU1+mrzC1tw/lGDscQz38cSh4sKxG9AwhS8ttxsFFzz
 TUZq2YL621VoosdLFkG1Eu5g6qk/hs701c7GjkILuCn4F606QMMRJE08NhRux3EaYOU5
 ui6w==
X-Gm-Message-State: AOAM5339x+6MRXfgomgxfQfa3yQMr8nHJPaBRyuIHS1fjLeGbTeJgojU
 myJJi6zYBfnM+waxeoPk5o3DGkgILA==
X-Google-Smtp-Source: ABdhPJzg1v6P4K+g+T7ARvV6JzTSAEuMWlF/BLtjzXORN08oUzjizH+ssSQ+SH4zIIFfaHzZEUMejg==
X-Received: by 2002:a17:902:a406:b029:12b:c50a:4289 with SMTP id
 p6-20020a170902a406b029012bc50a4289mr129414plq.56.1632752914242; 
 Mon, 27 Sep 2021 07:28:34 -0700 (PDT)
Received: from localhost.localdomain ([120.244.142.81])
 by smtp.gmail.com with ESMTPSA id t6sm19873459pjr.36.2021.09.27.07.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 07:28:33 -0700 (PDT)
From: Xuzhou Cheng <xchengl.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Date: Mon, 27 Sep 2021 22:28:25 +0800
Message-Id: <20210927142825.491-1-xchengl.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=xchengl.cn@gmail.com; helo=mail-pl1-x642.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xuzhou.cheng@windriver.com,
 bin.meng@windriver.com, f4bug@amsat.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 linux@roeck-us.net, bmeng.cn@gmail.com, groeck7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The Linux spi-imx driver does not work on QEMU. The reason is that the
state of m25p80 loops in STATE_READING_DATA state after receiving
RDSR command, the new command is ignored. Before sending a new command,
CS line should be pulled high to make the state of m25p80 back to IDLE.

Currently the SPI flash CS line is connected to the SPI controller, but
on the real board, it's connected to GPIO3_19. This matches the ecspi1
device node in the board dts.

ecspi1 node in imx6qdl-sabrelite.dtsi:
  &ecspi1 {
          cs-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
          pinctrl-names = "default";
          pinctrl-0 = <&pinctrl_ecspi1>;
          status = "okay";

          flash: m25p80@0 {
                  compatible = "sst,sst25vf016b", "jedec,spi-nor";
                  spi-max-frequency = <20000000>;
                  reg = <0>;
          };
  };

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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---
Changes in v2:
- Mention this matches the board dts.
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


