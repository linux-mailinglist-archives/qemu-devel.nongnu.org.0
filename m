Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B6597C4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDgB-0006ig-I4; Fri, 30 Dec 2022 06:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDg8-0006eO-DB
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:01 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDg6-0003wI-Gf
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ay40so15034514wmb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zQ43llp9uSrlxzbpXpwc6nZpfYE/bji1ywv0OnD5+3M=;
 b=c6Skdgm3uxX2mGoECvPToeMuF9vXZVMaidfHJgp6Z6GCe1rom9GgaPDnHhhaB1v17w
 JC0WP+cBSvunTbgRM9EYa0vkEs4Nc85Mohogrb01/MNQibCH/EmwlAhtHhI4j/LRUAFr
 OcoUpdHljcC4DD860tj8p3VvrkwDVcSQL9T26sVrVH9YeZz2TICZiH0vOWKor81EKUPd
 73hN96CHmNUmhoPufesYMncTMDyzqaDHBlHhg9l+3px2dXP+irpzga9zMiXcKUmSXLVO
 cxQHIeOOOovzxo8gu9g14Y6jyoD0dWJj94SLpvMDq8+knh5schbZT+KCl34ENCPaLYfS
 ovxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zQ43llp9uSrlxzbpXpwc6nZpfYE/bji1ywv0OnD5+3M=;
 b=jswx+gNz83HDqPyncSZz50oEke8rlcvhCFLZcGeOcAwORIUQbPiTfcGUUXA4lzMbgq
 vdjkk0jRhWYfA9McraIwrv5BKhNz9TnmzvGOeDnX9s02mewGg+nQluGPTOeJutkfh3lp
 /7T4vR1BrE6Vinl8ICpUmnUz3+u9rYg3tpkoQesdvi/HvltTwlXk4mHJHNvwDXp/rCge
 ar1rZrJZninGjBBUV3/Re8hIkJJoOBsdkej8H2ckIMu/Y3xosPifTD2mVsOeD5VNgZs4
 Sbvy3j7vqnzYudoXbAYkugAUi7/GU5LIO3v2OpfweTykuXTJRgc0jZyh1CJdEaLe5evz
 oXFQ==
X-Gm-Message-State: AFqh2kptb7CpbItx4RB/10fJbdvBu+uYXLfeswYmhvVGvmbmJw8rQj6Y
 GJ6y7GI35W0K3EYMYHModBXqfgQi6zo4HMw9
X-Google-Smtp-Source: AMrXdXtQVIc+syQZXX9yA/tVG4kiqFFeb0tk0dYOUz86JasUBQ0koYGMIHHFMzqtqKV9JXHhYY60Fg==
X-Received: by 2002:a05:600c:3584:b0:3d9:719a:8f7d with SMTP id
 p4-20020a05600c358400b003d9719a8f7dmr15338125wmq.35.1672400156394; 
 Fri, 30 Dec 2022 03:35:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a05600c4e1600b003c6d21a19a0sm28195721wmq.29.2022.12.30.03.35.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 09/11] hw/arm/aspeed_ast10x0: Map HACE peripheral
Date: Fri, 30 Dec 2022 12:35:02 +0100
Message-Id: <20221230113504.37032-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e74e2660ce..7a7443a95b 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
     [ASPEED_DEV_UDC]       = 0x7E6A2000,
+    [ASPEED_DEV_HACE]      = 0x7E6D0000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
     [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
     [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
@@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
@@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
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
2.38.1


