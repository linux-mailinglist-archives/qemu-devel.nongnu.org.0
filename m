Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F2349E05
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:34:33 +0100 (CET)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaQl-0007qq-AW
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKR-0002Ra-GK; Thu, 25 Mar 2021 20:27:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKJ-00043U-IO; Thu, 25 Mar 2021 20:27:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so4034500wml.2; 
 Thu, 25 Mar 2021 17:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7W6IEOHSoDvRbI0khuBdpTH+Nl9d9QUqt9PPpv29LE=;
 b=N19NSLmflIp+mhy8BaAwL7u8+ZVW61/N8eKBushPRrKAg1g3QAmzjyi/kOXs/5dnYB
 oBMdcn2/pnbIqQqFH9Pce8Poyjhc4UA+LCYcwW71/Sf75blOnxcWu6YVt+sp+ZYxKOM6
 N9zdAQfsqAsTY9AMMSBGPvxVzeeeKwRfxc96wfPhaFRzptGWN15ITC9D08+JKPNQcMpI
 OgJdq7Q6V+Dw9JdEvr46z1eQ1iBwg5k83PbshUDu3ml6zobNMV/vHwUii5oCKiIMdgsq
 WdTJ5P9FOb9EP0CizDOMncFP1RACO1BtMmWdQ84p09RAF/h23JSSZqv0PfjuUuLVfWgB
 xElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O7W6IEOHSoDvRbI0khuBdpTH+Nl9d9QUqt9PPpv29LE=;
 b=BdSdL62CEaR2uswTh9zj2OrqVT2yBs7NZ9CuCStSUb14yF0fz6h41hfQPgJbD7KC7e
 QbOO5PZY/bt6odRq0es90GkYKn2UnucJL076atyES+QYGEAEB6vngu7hNnqtEP9EFCw2
 knHnp1SNBe1lsKOZTAsNVS4d6nqIK/ItnwT/sXZfJv8+OyFmW/eWa7ofxWnPLNl/noWc
 GJSAZ+2WmJMqxiz4jDvnEoJEdp3vpPowWfmDIW0Wd+nv8czbkjjJvWju8+WU9Ey9JEO0
 EQFF6CW9Il6Rjq/+kR0WN9AoAOcez1/wFyb2FtLDRJyyO6aXb3dUxoXXiXo0mJ2/A4ki
 7jvw==
X-Gm-Message-State: AOAM532HL6zIxB59QbgWKKyOTbfTk1GRe1gmwbvIUns86LDOpwdhPw6Y
 HlFbHYB1Oq0I4SK4NxCEt4eNKOFrnmEkxQ==
X-Google-Smtp-Source: ABdhPJws53IjRyn7osS54kW9BohBvUfqx6cHPjq6vzHHzPx4wiEBlIv6thwVRPTw9U+Dhz/5c3TwMQ==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr9896183wmj.17.1616718461645;
 Thu, 25 Mar 2021 17:27:41 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u4sm9609242wrm.24.2021.03.25.17.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 02/10] hw/arm/musicpal: Open-code
 pflash_cfi02_register() call
Date: Fri, 26 Mar 2021 01:27:20 +0100
Message-Id: <20210326002728.1069834-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to manually map the flash region on the main memory
(in the next commit), first expand the pflash_cfi02_register
in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 9cebece2de0..8b58b66f263 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -1640,6 +1641,7 @@ static void musicpal_init(MachineState *machine)
     /* Register flash */
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (dinfo) {
+        static const size_t sector_size = 64 * KiB;
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
 
         flash_size = blk_getlength(blk);
@@ -1649,17 +1651,30 @@ static void musicpal_init(MachineState *machine)
             exit(1);
         }
 
+        dev = qdev_new(TYPE_PFLASH_CFI02);
+        qdev_prop_set_drive(dev, "drive", blk);
+        qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
+        qdev_prop_set_uint32(dev, "sector-length", sector_size);
+        qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
+        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
+        qdev_prop_set_uint8(dev, "big-endian", 0);
+        qdev_prop_set_uint16(dev, "id0", 0x00bf);
+        qdev_prop_set_uint16(dev, "id1", 0x236d);
+        qdev_prop_set_uint16(dev, "id2", 0x0000);
+        qdev_prop_set_uint16(dev, "id3", 0x0000);
+        qdev_prop_set_uint16(dev, "unlock-addr0", 0x5555);
+        qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aaa);
+        qdev_prop_set_string(dev, "name", "musicpal.flash");
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                        0x100000000ULL - MP_FLASH_SIZE_MAX);
+
         /*
          * The original U-Boot accesses the flash at 0xFE000000 instead of
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, 0x10000,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 0);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
-- 
2.26.2


