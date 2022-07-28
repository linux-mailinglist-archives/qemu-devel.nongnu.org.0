Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78875838B5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:26:28 +0200 (CEST)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwyZ-00033y-9b
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1oGwlE-0005mQ-7f; Thu, 28 Jul 2022 02:12:41 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1oGwlA-0000qU-8m; Thu, 28 Jul 2022 02:12:38 -0400
Received: by mail-pg1-x542.google.com with SMTP id e132so759932pgc.5;
 Wed, 27 Jul 2022 23:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wJnH+Gsg3UX/M/ge2taguZ09cFlizMk2N6UeWllRBo=;
 b=nW1TgLB1v0ZQqgRDhl7XSkALcGdhQYPb0EU2SPoExxGbtGdzYilUJI+Jb3EYL8hZak
 SzYMHwgVEieqhk3c3tiLnaWF+0o/0sC6d5S98FDSf6h6GflaMACppSTL/x+b/bMM07iH
 mr/RnneNffSTV2fYNJRrLQw3zwAEpT9Lr1KGPTOEY3JALWQTWCFRR0rP+Dbd8Iw8DbkH
 F+7ZLX0fAbwqE4T2MNbs0CAHVzxn81kkly6yhVopt/MbIY0+0rFdrRInAHyjXQpotjr4
 /9XeyMxVbkRR2/Xo8bQd4BDVGuFI93c/Wcb6sdp6h07RIkDENX7+FH5mycKKBislL4Uu
 gxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wJnH+Gsg3UX/M/ge2taguZ09cFlizMk2N6UeWllRBo=;
 b=kTLVmX3QoS4jMsOA9d+WuPm/N5lpSsbLYtqY7Tu/OulSUOdbumpkbb1qaRbudVdy7S
 Rrizn+WhZFpnObfTSryVT8Lxy+N780YlCze9xkGwUehw8AO+IThrp/mmz1YtviuGNMk8
 CY3Xnxm+tlFdOMotdZwhZ47aWTKyv/IIZMfApVUjieQTRmf7Gc3P7bi+8cxjkgC3jVp8
 8azjZdHBksqn59oRb6sqzgvB6gKWyGY5NIw8ik4F/DD5n1zm1biD6ZXYbwxyMvRghMGY
 Xz27GkF0+P+5lVfiKihCElFV009FK27PH4GfepRq5wKMTcYFynZvGMGsxcYElyIDU5cf
 taBA==
X-Gm-Message-State: AJIora8FjCVmT2Cuc9nfUksvJRxfADaHYZHiWYXJdS/FHlyAhSvhZxDJ
 kUHbuIU8JrYiZK67CrdEzos=
X-Google-Smtp-Source: AGRyM1twtyHTgHBYc915QcI/8dvUa7ySsQGOZdlYiWn6wpkglYmUUPEhb33ec6ZVoJQfrBxvBPHEXA==
X-Received: by 2002:a05:6a00:24ce:b0:52b:f337:e2d3 with SMTP id
 d14-20020a056a0024ce00b0052bf337e2d3mr18859824pfv.36.1658988752392; 
 Wed, 27 Jul 2022 23:12:32 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a056a00004800b0052b41c1b573sm15150163pfk.21.2022.07.27.23.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 23:12:31 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
X-Google-Original-From: John Wang <wangzhiqiang02@inspur.com>
To: patrick@stwcx.xyz
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] aspeed: Enable backend file for eeprom
Date: Thu, 28 Jul 2022 14:12:28 +0800
Message-Id: <20220728061228.152704-1-wangzhiqiang02@inspur.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=wangzq.jn@gmail.com; helo=mail-pg1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

tested on a fp5280g2:

$QEMU_BIN -machine fp5280g2-bmc \
	  -nographic \
	  -drive file="${IMAGE_PATH}",format=raw,if=mtd \
	  -drive file="eeprom.bin",format=raw,if=pflash,index=1 \
	  ${NIC}

root@fp5280g2:/sys/bus/i2c/devices/1-0050# hexdump eeprom -C
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
....
....
00000240  2c 87 a3 a4 1d d3 11 b2  02 d2 c2 9d 44 60 cf 3e  |,...........D`.>|
00000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

It's same as the "eeprom.bin"

Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
Change-Id: I5c44785a028144b24aa0b22643266d83addc5eab
---
 hw/arm/aspeed.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4193a3d23d..80aa687372 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -431,12 +431,20 @@ static void aspeed_machine_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
+static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize,
+                              int index)
 {
     I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
     DeviceState *dev = DEVICE(i2c_dev);
 
+    DriveInfo *dinfo = drive_get_by_index(IF_PFLASH, index);
+    BlockBackend *blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
     qdev_prop_set_uint32(dev, "rom-size", rsize);
+
     i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
 }
 
@@ -685,7 +693,7 @@ static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
     I2CSlave *i2c_mux;
 
     /* The at24c256 */
-    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768, 1);
 
     /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TMP105,
@@ -918,13 +926,13 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
     }
 
     /* Bus 6 */
-    at24c_eeprom_init(i2c[6], 0x56, 65536);
+    at24c_eeprom_init(i2c[6], 0x56, 65536, 1);
     /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough */
     i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
 
 
     /* Bus 7 */
-    at24c_eeprom_init(i2c[7], 0x54, 65536);
+    at24c_eeprom_init(i2c[7], 0x54, 65536, 2);
 
     /* Bus 9 */
     i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
-- 
2.34.1


