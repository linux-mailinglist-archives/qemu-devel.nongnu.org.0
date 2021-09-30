Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A6041DDC9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:41:57 +0200 (CEST)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyC4-0004CM-Ge
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjZ-0000Pv-8I
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjU-000479-7k
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso8752293wma.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eE5hlGewDD9+3dCoxNYhNH6vg+idFDYR6hzN8PkHQWs=;
 b=ec8cx/xWhQrIanR/T3xUeMxZtjOb7CY6RJDNOzoYhJ52L1T/ZYPeHEm3ghPSqHDCKu
 5qHLiXEf7vN3/qKFlCimn2KhEZFlRbBIISjMP6pgn74tQEl5n7TQfphboIpHFUhaWJao
 MJqn0i1B7mwdrjeLnw/SlQp9oLUUinr0EtkVUe7r8hQem+nMLc5MKPuQlfAfF3gqLE74
 d8jHaQNFl2KtulpdE/G4KyOahxxCrTtU44V20eSXZyO3vRM+HzvGp/WSpwPzh5c8ATVV
 0ACRkJXsXZvjoWSLSCQmQLBjT6MByx+OPtJ4/oWxp6YgRn6MCQTpzWZtzJaEegjahqx2
 372A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eE5hlGewDD9+3dCoxNYhNH6vg+idFDYR6hzN8PkHQWs=;
 b=jipRtexkMx4kJw8mrC9ZVPx029Oed6n9ABu4QtU6qP038Hjo/zSCrzCGtyNXg8rQwt
 LGF2bRMeXg0gKmjbESqm6aktBvqdBJYq08OunXXamPhCZ+qEg4sSr8uLhvCsf2SThpFI
 /eG3zlxbRtMnh2kkWn0a20V6oQy8Dzv3K7n7L8m6fTdqwpMTeZKdtcexbXuBWmoFt6zp
 WtNIIfcaBsneuQVpr6VsL3hzDmcLaW2h4wUiB9KG8lnJ2kEvtzC4jFYAnaoSgx9NguKE
 nw2vZ4V3H64M8E3SbfnI+e22Q3jFTAIDAVy7fALF/2R7e6Kfye39VshTKMDYpfgso/ea
 bofQ==
X-Gm-Message-State: AOAM533cCT0lBZ0BW5vrFPIFkz6wZqhCe4ezcHi4pXi7aCAvElQu3rbn
 yY8A3unX5x31h3B2OnF1N/IOfqPlRyJ24A==
X-Google-Smtp-Source: ABdhPJzkntP1FC3gvBT6+vfY30EbRWYkyn9cG9rMjwUHIDW/Vg1O/o8OHM+cWCKJar+SD2mdqjHI+A==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr4037963wme.22.1633014740899; 
 Thu, 30 Sep 2021 08:12:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/22] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Date: Thu, 30 Sep 2021 16:12:01 +0100
Message-Id: <20210930151201.9407-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-id: 20210927142825.491-1-xchengl.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sabrelite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 29fc777b613..553608e5835 100644
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
2.20.1


