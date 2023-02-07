Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FF68D3DD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKuH-0000qO-SJ; Tue, 07 Feb 2023 05:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuE-0000ni-WF; Tue, 07 Feb 2023 05:08:55 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKuC-0002WK-Kc; Tue, 07 Feb 2023 05:08:54 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNz34xmz4xwl;
 Tue,  7 Feb 2023 21:08:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNx2yVFz4xGR;
 Tue,  7 Feb 2023 21:08:49 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 22/25] hw/arm/aspeed_ast10x0: Map HACE peripheral
Date: Tue,  7 Feb 2023 11:07:41 +0100
Message-Id: <20230207100744.698694-23-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Before on Zephyr:

  uart:~$ hash test
  sha256_test
  tv[0]:hash_final error
  sha384_test
  tv[0]:hash_final error
  sha512_test
  tv[0]:hash_final error
  [00:00:06.278,000] <err> hace_global: HACE poll timeout
  [00:00:09.324,000] <err> hace_global: HACE poll timeout
  [00:00:12.261,000] <err> hace_global: HACE poll timeout

  uart:~$ crypto aes256_cbc_vault
  aes256_cbc vault key 1
  [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
  [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
  [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
  [00:00:09.743,000] <err> hace_global: HACE poll timeout
  [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
  [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
  uart:~$

After:

  uart:~$ hash test
  sha256_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  sha384_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  tv[5]:PASS
  sha512_test
  tv[0]:PASS
  tv[1]:PASS
  tv[2]:PASS
  tv[3]:PASS
  tv[4]:PASS
  tv[5]:PASS

  uart:~$ crypto aes256_cbc_vault
  aes256_cbc vault key 1
  Was waiting for:
  6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
  ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
  30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
  f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10

   But got:
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

  [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
  [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
  [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
  [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
  [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
  [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
  [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
  [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
  [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
  [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
  [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
  [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
  [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
  [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
  [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
  [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
  uart:~$

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 592a19d988..5c794c2420 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -28,6 +28,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
     [ASPEED_DEV_UDC]       = 0x7E6A2000,
+    [ASPEED_DEV_HACE]      = 0x7E6D0000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
     [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
     [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
@@ -165,6 +166,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
@@ -358,6 +362,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     }
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
 
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->sram),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
+                    sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
-- 
2.39.1


