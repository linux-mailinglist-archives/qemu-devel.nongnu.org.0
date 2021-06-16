Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB93A9432
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 09:39:03 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltQ8b-0003VL-Ni
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 03:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltQ40-0001I8-Qa; Wed, 16 Jun 2021 03:34:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ltQ3y-0001DM-Sa; Wed, 16 Jun 2021 03:34:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id ei4so1196564pjb.3;
 Wed, 16 Jun 2021 00:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDOkWF4XUI7jTzhjg2i6DeBblVKS98WPiTYbEslZQkU=;
 b=kdICWa76O3JFEwqav6GKwPa9I+ryUTu4di/GYPw8qDRvFftzCVkfgdX440O5RNFlDT
 3f05s+ZRQYR2YOo1NiurPX4lkU+r0BHOH5yO3FcvGZ9IvGXrrE26XO7zlr4+p9IQ7ACX
 gnNBTeLBEkCG2+YIEyiUQbcBnUNwT4rSCTFb7mxQWTB2ec1em7mH10gG/DzytPbrIWl8
 ft1O04KIHczYQcZv+dgkKXMdov/dEHar/VsMYOrK5nAyQvkw1j4hzZZs0tECr7p1n4sa
 ryMfKBgEzTD5wVCMsP33BwmlXlOWU1XUGERNunibmrIj6HiQ8AzJE7Ri5QWRqDymeUux
 FbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KDOkWF4XUI7jTzhjg2i6DeBblVKS98WPiTYbEslZQkU=;
 b=GQOGXZuSZhe4YLPODgI2/0LRx74GzYklDg0X0Jx4pvP/4g6egYnaUOPMok8nNjku/f
 wWJx6DACLBhvY/puNYTlBrQVpA7HSrj5hywJE4Q/ZJse38xRrPAeHGFBuCcvqmHcxdjc
 7Pubjnz2lT1j6IS+tnWJ+cLBxExnIu/ixsxGjb1K5KrrTy1cAcX/N9ymkyDFMspoUkmX
 XvDsZ9t5e3SvBwCQ1X2AKlsOARUOjLWNZzpyLZkVwv1KhMvsHWu5KcLYTtptC4NOsI+6
 a6FYO/DZ56vcbfo9Yk5F6eEbavRNQMauSNEOL44UG2I5nx8yVj197ASJvo95vBEv2WZi
 udNQ==
X-Gm-Message-State: AOAM530H19xEc/hvxqSwJU2ZtWcP9iX+0/iHiOUAwjacSavkVKQrdHq9
 /z3HO9O53me5xLgwQ/gP0lA=
X-Google-Smtp-Source: ABdhPJxiBkRC+hKcI3kTKDRUZ5rbvqG5JQemabwguZAhdrkHRISvjuWLR7DccAGh4+cV6qYYPjMxHg==
X-Received: by 2002:a17:90a:2ac7:: with SMTP id
 i7mr3679137pjg.139.1623828853226; 
 Wed, 16 Jun 2021 00:34:13 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a25sm1208420pff.54.2021.06.16.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 00:34:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 2/2] arm/aspeed: Add DPS310 to Witherspoon and Rainier
Date: Wed, 16 Jun 2021 17:03:58 +0930
Message-Id: <20210616073358.750472-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616073358.750472-1-joel@jms.id.au>
References: <20210616073358.750472-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
a temperature and humidity sensor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0eafc791540d..619ad869dd71 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -597,7 +597,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
-    /* Bus 3: TODO dps310@76 */
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -612,6 +611,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
         qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
@@ -693,9 +693,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
                      0x4b);
 
-    /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x61);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
-- 
2.32.0


