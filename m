Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D46530B9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 13:23:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7y77-0005rv-HA; Wed, 21 Dec 2022 07:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1p7y74-0005r7-Fe; Wed, 21 Dec 2022 07:22:22 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1p7y71-0005Ff-9e; Wed, 21 Dec 2022 07:22:20 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 j16-20020a056830271000b0067202045ee9so8903224otu.7; 
 Wed, 21 Dec 2022 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=falGknQzyvoV/o/Ukn48pVPpkCvcP4etfatk8SNDleg=;
 b=E9jffRT5wMMhJ2AgBzKTdd3vkusnIOKaAoKs+77vxmIkEsA32EQWU/JVSlC1eiw/F4
 aTdVMgFMairJfIyRjG6de6tbLn8i9YUxOocj5YEpYjty8AE5Ja8erH+FCm3H2TBo4teL
 peKKDzO+7a4hxIIeBTGOHfBrZCbIbYbzRUa0SF/HnBBrfPTMR9CHKTiwoL53+HKKyvn2
 EPSblRY8xzEHlwuGei6wDhB+efsCEdFw6x3ccscLw3szd5lMNtUDyykYGVE5rBaBjILD
 wM2Y5gjGTZM/tv38bJr2dLvvWaq58iq/UNWyUpa8BU3PFYYCCwmqS+DvcShISgLwU4ZL
 TP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=falGknQzyvoV/o/Ukn48pVPpkCvcP4etfatk8SNDleg=;
 b=LxAUVlOyjA5jm0d7ERklnzKYjmsgZ8B6HfGIuBSy1nU2J4Cb4w8OG8kAOd1dUmMFcu
 qmzvdcRUIxsNx9QXeSHUe+HJO48/QmM/TXDVsnw+O1WEekkrtB7A9+shjucP6Fl3r9oK
 +jdlVAfAar9terXJxgOyvA2/KPPo0uvZP1HChQBwlW+O8/0Bdy5v0vMBn1saks0U1Y1W
 hmXm/k2wkq/arBDuydSdy1AbFMX6elsEn5HnsHQgm7I06YQWGO5EsTVwlD3d+bCCxUPm
 LC+14VYfyHxpNoBxruCb/3deGaVNl+/YEqA2wNto/HdksdtH4IP+gOVjyCSqYJIS/wUe
 5cNw==
X-Gm-Message-State: AFqh2kqxX0SY+u5bRy9+3H76JCZ3ZW962N163f9jNfdyFVxqdlQWKyeX
 migQIiCbKnN31rMJVnsNCJI=
X-Google-Smtp-Source: AMrXdXs5ShuNol1AkcHEBaqvgnl3NSI3ZAU7dR1kTp5xueu71U56g237w664vj05Zvr5mtWnIlCLZA==
X-Received: by 2002:a9d:4547:0:b0:673:3fac:b328 with SMTP id
 p7-20020a9d4547000000b006733facb328mr665643oti.10.1671625337461; 
 Wed, 21 Dec 2022 04:22:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a9d5cc5000000b006619533d1ddsm6703313oti.76.2022.12.21.04.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 04:22:17 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair@alistair23.me>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] m25p80: Add the is25wp256 SFPD table
Date: Wed, 21 Dec 2022 04:22:13 -0800
Message-Id: <20221221122213.1458540-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Generated from hardware using the following command and then padding
with 0xff to fill out a power-of-2:
	xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Cc: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/block/m25p80.c      |  3 ++-
 hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/block/m25p80_sfdp.h |  2 ++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 02adc87527..802d2eb021 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -221,7 +221,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
     { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
     { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
-    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K),
+      .sfdp_read = m25p80_sfdp_is25wp256 },
 
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
index 77615fa29e..b33811a4f5 100644
--- a/hw/block/m25p80_sfdp.c
+++ b/hw/block/m25p80_sfdp.c
@@ -330,3 +330,43 @@ static const uint8_t sfdp_w25q01jvq[] = {
     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 };
 define_sfdp_read(w25q01jvq);
+
+/*
+ * Integrated Silicon Solution (ISSI)
+ */
+
+static const uint8_t sfdp_is25wp256[] = {
+    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
+    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
+    0x9d, 0x05, 0x01, 0x03, 0x80, 0x00, 0x00, 0x02,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xe5, 0x20, 0xf9, 0xff, 0xff, 0xff, 0xff, 0x0f,
+    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x80, 0xbb,
+    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
+    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
+    0x10, 0xd8, 0x00, 0xff, 0x23, 0x4a, 0xc9, 0x00,
+    0x82, 0xd8, 0x11, 0xce, 0xcc, 0xcd, 0x68, 0x46,
+    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xae, 0xd5, 0x5c,
+    0x4a, 0x42, 0x2c, 0xff, 0xf0, 0x30, 0xfa, 0xa9,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0x50, 0x19, 0x50, 0x16, 0x9f, 0xf9, 0xc0, 0x64,
+    0x8f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+define_sfdp_read(is25wp256);
diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
index df7adfb5ce..011a880f66 100644
--- a/hw/block/m25p80_sfdp.h
+++ b/hw/block/m25p80_sfdp.h
@@ -26,4 +26,6 @@ uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
 
 uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
 
+uint8_t m25p80_sfdp_is25wp256(uint32_t addr);
+
 #endif
-- 
2.36.2


