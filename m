Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD576A816E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhJh-00046n-8e; Thu, 02 Mar 2023 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhJd-00042O-7l; Thu, 02 Mar 2023 06:41:41 -0500
Received: from m12.mail.163.com ([123.126.96.234])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhJZ-0006A5-69; Thu, 02 Mar 2023 06:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3VI1H
 IG9AAVIv9Q926JEx1wSgQEFNze5O87akgrd4o0=; b=jkT+GWN8Kyfpu1kit1M6V
 hLlZKp6sm4U4lvEBKydGnr+b5N7Dm3XKuQh+eteGmY+AyWyTUw5aGo0gTrQizdbH
 qaHy5NFirsY6+qH1CXNTmMkWyrjYjN1L4fJGAuX+jcQjih5XDeDcDpskCh/5lytU
 WZStfQdIK/UUbPCr/Dy7bc=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by smtp20 (Coremail) with SMTP id H91pCgBni79OiwBknjVaGA--.63318S8;
 Thu, 02 Mar 2023 19:41:06 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 06/12] hw: allwinner-r40: Complete uart devices
Date: Thu,  2 Mar 2023 19:40:55 +0800
Message-Id: <20230302114102.32236-7-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
References: <20230302114102.32236-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: H91pCgBni79OiwBknjVaGA--.63318S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFy7trWfGF43Gw1xZw1kZrb_yoWrJryDpr
 9YkrZ5Kr1jgw1fAr1fKws3Z3yfK3W8KrnrK3WIyFW3Jr48Xr4Fvry29a1UGr43Krs3JFW3
 Wr9xGrWIk3WIvwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRT5lbUUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRMm7VWBoxmNMwAAsV
Received-SPF: pass client-ip=123.126.96.234;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: qianfan Zhao <qianfanguijin@163.com>

R40 has eight UARTs, support both 16450 and 16550 compatible modes.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/allwinner-r40.h |  7 +++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index f7af309c94..2fb1bd8805 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -45,6 +45,13 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_CCU]        = 0x01c20000,
     [AW_R40_DEV_PIT]        = 0x01c20c00,
     [AW_R40_DEV_UART0]      = 0x01c28000,
+    [AW_R40_DEV_UART1]      = 0x01c28400,
+    [AW_R40_DEV_UART2]      = 0x01c28800,
+    [AW_R40_DEV_UART3]      = 0x01c28c00,
+    [AW_R40_DEV_UART4]      = 0x01c29000,
+    [AW_R40_DEV_UART5]      = 0x01c29400,
+    [AW_R40_DEV_UART6]      = 0x01c29800,
+    [AW_R40_DEV_UART7]      = 0x01c29c00,
     [AW_R40_DEV_GIC_DIST]   = 0x01c81000,
     [AW_R40_DEV_GIC_CPU]    = 0x01c82000,
     [AW_R40_DEV_GIC_HYP]    = 0x01c84000,
@@ -159,6 +166,10 @@ enum {
     AW_R40_GIC_SPI_UART1     =  2,
     AW_R40_GIC_SPI_UART2     =  3,
     AW_R40_GIC_SPI_UART3     =  4,
+    AW_R40_GIC_SPI_UART4     = 17,
+    AW_R40_GIC_SPI_UART5     = 18,
+    AW_R40_GIC_SPI_UART6     = 19,
+    AW_R40_GIC_SPI_UART7     = 20,
     AW_R40_GIC_SPI_TIMER0    = 22,
     AW_R40_GIC_SPI_TIMER1    = 23,
     AW_R40_GIC_SPI_MMC0      = 32,
@@ -395,6 +406,27 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
     serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART0),
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART1], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART1),
+                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART2], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART2),
+                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART3], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART3),
+                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART4], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART4),
+                   115200, serial_hd(4), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART5], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART5),
+                   115200, serial_hd(5), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART6], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART6),
+                   115200, serial_hd(6), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART7], 2,
+                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART7),
+                   115200, serial_hd(7), DEVICE_NATIVE_ENDIAN);
 
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index b355af2c4f..dfb5eb609c 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -41,6 +41,13 @@ enum {
     AW_R40_DEV_CCU,
     AW_R40_DEV_PIT,
     AW_R40_DEV_UART0,
+    AW_R40_DEV_UART1,
+    AW_R40_DEV_UART2,
+    AW_R40_DEV_UART3,
+    AW_R40_DEV_UART4,
+    AW_R40_DEV_UART5,
+    AW_R40_DEV_UART6,
+    AW_R40_DEV_UART7,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
-- 
2.25.1


