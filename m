Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49E612D7E
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGuJ-0001I1-7B; Sun, 30 Oct 2022 18:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsV-00059D-9c
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsT-0000Ng-E9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:34:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id 5so6236547wmo.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmmXEXyVmeaeq801a3SSzA2lFB/U3WaewUO331bNFbI=;
 b=qUpcJejn3/q3zhAdMuycjc1yxm+FiwK3u0U1Hbj34OyPelPh0v3/a873DCkJ3ttFf+
 dQOoTM8jCoCZh6XAUdfckG8kBCN/oEvtoeu9X6m0X+AX+0hRnS5wusvycuwwqOzP0jhp
 IZzve954fkIUEXvPlH4fiUNEnL4yhcboutmDvhGdFv71juLrV8QB4lpERLP9gGbpRTvj
 E8cDrWifVVn8nzzjK1e6wyyifFQl4E9QY/5SIWjzXyY52bZqLVL0GH1YoBKwwUVDjAj9
 43aCt5c2+3gnH96WR3XLuSAAoyl7WEuPTCKXOYvGKIgku6+STeINYgIp8XgwIZQdyCoq
 2Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmmXEXyVmeaeq801a3SSzA2lFB/U3WaewUO331bNFbI=;
 b=6LFkdnguMDxtMCG8QqW7UTHNCovQKAbYPHOFhP+KcF5uRzYZVXaak0ob0Z0nARp0y/
 hQJ1EkXIAsU4k9On2oWs8gVMdfJ8jjfr2HkcVbYSK3tOibniV53ivOuXaBl+hmNO+R49
 V5kVrjVZ8KtObLEtg4GmY1OnKrRmHyRyEgK5cLbNCmQFOjBOERuunkAtVeuy2hhfsTdo
 wC4krKeneXUyP5N3H7IEwsPbyuz6xR9pyxhasi4rpmaqktfOTOKOxObB7cGk+lO87Tuu
 0wJOIyxsF2V9GnkP/sP7drqIu+SZ/D31F3ga1YbbKqFPWx7vOBg8bwIIII/s4pB/f1Q0
 SVUQ==
X-Gm-Message-State: ACrzQf01TQR8E6paOtT7ZJr7FeufE6Ail31+ouSjMDPj8UqY+76BZjOs
 OmRNRz2R5HX30LqLXq9JUbOsHevzK3F6VA==
X-Google-Smtp-Source: AMsMyM71TLdJLJh8nJFjw4TzPphbpuwLy/tzo1t8GqPHXEoPYSuhNhqHRKazu6NRb7vnMnmqUNXPZQ==
X-Received: by 2002:a05:600c:4586:b0:3c6:fbb0:bf2d with SMTP id
 r6-20020a05600c458600b003c6fbb0bf2dmr5984663wmo.13.1667169239866; 
 Sun, 30 Oct 2022 15:33:59 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003b4e009deb2sm6078461wms.41.2022.10.30.15.33.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 48/55] hw/mips/malta: Reuse dev variable
Date: Sun, 30 Oct 2022 23:28:34 +0100
Message-Id: <20221030222841.42377-49-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

While at it, move the assignments closer to where they are used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-26-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 5099ed9592..6ac811763c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1237,7 +1237,6 @@ void mips_malta_init(MachineState *machine)
     MaltaState *s;
     PCIDevice *piix4;
     DeviceState *dev;
-    DeviceState *pm_dev;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1403,13 +1402,13 @@ void mips_malta_init(MachineState *machine)
                                             TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
-    smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
 
     /* generate SPD EEPROM data */
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
     generate_eeprom_serial(&smbus_eeprom_buf[6 * 256]);
     smbus_eeprom_init(smbus, 8, smbus_eeprom_buf, smbus_eeprom_size);
-- 
2.37.3


