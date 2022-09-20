Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083865BF07A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:48:29 +0200 (CEST)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam2W-0001CY-4e
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGe-0004Ru-F7
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:51 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGZ-0007S3-Vx
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:46 -0400
Received: by mail-pf1-x42c.google.com with SMTP id e5so3598685pfl.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3k7De6dda7HtE0VoeJmLCIiYC0o1UACU10YlAWqrISw=;
 b=uysbs+EUwH5Rc9qwEQ7m40LbRGRcauWexufWDZqaffyGfLYBIi8zSyFKka7GcmyM4B
 8gvQVnsc9t9IdIjnVHW4Wyjj73QdojRw88HYvfY3qPdka7b8gGeQQd/X6dgZcpbtOkq/
 8RFO4o/rFeev2ghfuQ9yk0E81FvTa84E/WuCUCIKNBs8KqNwVpF3i4eU9wz5eXmA7arX
 s64JeodAFk7oSv5Ae+8vyiPCO7ZZJlBzOn+DBCBGnLP5f3jYWaJqx+ZQRlctYftEl/yk
 ce16MY3ocBJHxFoy1r/dDgv8IBVcXP/WX5wePI/TseKBkFh0imlwE9rDrc4lTv8MnLDC
 AGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3k7De6dda7HtE0VoeJmLCIiYC0o1UACU10YlAWqrISw=;
 b=JVOwgoejFQ/jp808tv+AYqkuQV3YUZV1T0Z2s2/SYM5TzRTxwlq0Z/jC6y+lyK53hJ
 TcaIGK5sCBhR8C4JKPQ+udSqWDBeb61qiIWhKQCc+R0SavjZOSgGDuR9LQAASRVmo1nt
 db+2jiBlXRuiNHevvpo+LVV+xG0C2QCUeGtXW+OkXqvz4BNTcd6vpJDvblpU08lQXtDM
 aqofQvSgkG2HCkdvjpsDaN7AX37YRKQ3iaX4TNvA2V72XEfk9htik5dkSCFqD/zVo4Tf
 +Na/Xpp7xxMI4s9LKXTH9HjzgdPRksVAex5Q01PTIG5kPlDAt6CXPRx0uC7CT3AzKPsh
 K4Ng==
X-Gm-Message-State: ACrzQf3Edn8Z3NWnSSJoX2POpR70kNKEhhjCgAzZFuF8jKLUDcHVijEU
 /g+3JV83pnuanFREHfEocM5yJw==
X-Google-Smtp-Source: AMsMyM6AlbLZXygYBJuDmI11ITTNUzqsA+ZTgNE1zBYM0CsZG2+nXKnlcHzrUPzk+EiVC1NaPmWhQg==
X-Received: by 2002:a05:6a00:15c9:b0:541:1767:4ce2 with SMTP id
 o9-20020a056a0015c900b0054117674ce2mr24202493pfu.30.1663699602291; 
 Tue, 20 Sep 2022 11:46:42 -0700 (PDT)
Received: from localhost ([49.7.199.220]) by smtp.gmail.com with ESMTPSA id
 y16-20020a626410000000b00545f5046372sm206927pfb.208.2022.09.20.11.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:41 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 3/3] hw/arm/aspeed: g220a: Add a latching switch device
Date: Wed, 21 Sep 2022 02:46:19 +0800
Message-Id: <20220920184619.3370115-4-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a latching switch device connect between g220a BMC machind(soc
gpio) as host-power.

The latching switch device default state is off and trigger edge is
falling edge.

Tested:
In qemu, use g220a image

~# ipmitool power status
Chassis Power is off

~# ipmitool power on
Chassis Power Control: Up/On

~# ipmitool power status
Chassis Power is on

~# ipmitool power off
Chassis Power Control: Down/Off

~# ipmitool power status
Chassis Power is off

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 hw/arm/Kconfig  |  1 +
 hw/arm/aspeed.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..f2455db5a0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -457,6 +457,7 @@ config ASPEED_SOC
     select LED
     select PMBUS
     select MAX31785
+    select LATCHING_SWITCH
 
 config MPS2
     bool
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc3ecdb619..070de3aeff 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -27,6 +27,7 @@
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
+#include "hw/misc/latching_switch.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -666,6 +667,25 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     };
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
                           eeprom_buf);
+
+    /* Add a host-power device */
+    LatchingSwitchState *power =
+        latching_switch_create_simple(OBJECT(bmc),
+                                      false, TRIGGER_EDGE_FALLING);
+
+    /*
+     * connect the input to soc(out, power button)
+     * the power button in g220a is 215
+     */
+    qdev_connect_gpio_out(DEVICE(&bmc->soc.gpio), 215,
+                          qdev_get_gpio_in(DEVICE(power), 0));
+
+    /*
+     * connect the output to soc(in, power good signal)
+     * the power good in g220a is 209
+     */
+    qdev_connect_gpio_out(DEVICE(power), 0,
+                          qdev_get_gpio_in(DEVICE(&bmc->soc.gpio), 209));
 }
 
 static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-- 
2.25.1


