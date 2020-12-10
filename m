Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BBA2D5851
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:38:56 +0100 (CET)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJLb-0000RA-8P
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knJJ7-0007aM-45
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:36:21 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knJJ1-0007WQ-DU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:36:18 -0500
Received: by mail-pg1-x543.google.com with SMTP id t37so3829453pga.7
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZD9l1LIxuZlKe2qFaqT1BozfrmszhcvghzaTewzuMc=;
 b=v7vEUuKl7RitJRvLBh7tAubG7YoiCBq6PZom/+rsTBxgtVOcxiEbBUQMO6MMyuogUw
 boZpIJ7ZTIJOBuSbOxn/u38G4i+uFkTVDrcafsYi/dnJppSItbEFy/jRMxJa07+LPBNX
 mHI5iP/t4bReKX1C0giXyB7jM1p4Yb8iMk4R6SnA72K1L4+sSjoKJArstH3xokwBYbu4
 4EJUKsl7Podway8bie1arScNiWuZPO32sH35WIiK7TIlFJAA1Q/7J3tJp5Sfxn9y7Bi2
 C4IFguWHu1LYfqp6iH12tnAJw4mtE2lKHfPxxFrnMmXkPLSEhl0RvMAEHbmBr2ZYr8E4
 K4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZD9l1LIxuZlKe2qFaqT1BozfrmszhcvghzaTewzuMc=;
 b=QUKhV7SgQojHyggu5luQtyeEEuUhKILKTKET7Gy9jifoH0smOtdPAuoAR1VEB/C+wM
 Ysln6/SyiFlVHkJ06gl6e80nn6030llKvaEMmusOhNZQ4dj66u7jorL+yj/d3PnSIVGG
 em62czZ/QMK/+RpyH9YnxKytoGdwZbE7hzKIDYSi3+EkuKOEuHkz92gMis5/G6vLfOHZ
 VfKuY/izrgJ/sujmans3XkuHTcACF9RUl7bpSSZAXxnkYaP9GP7nima1EpVdaCzgDYLc
 weFwCdIy3eHw3Bob8Tmr4XSWJogRCkLg06gYWtYfR9WdFHZH5tVrmMmudA+013UB5qMY
 00Wg==
X-Gm-Message-State: AOAM532v+9o5GOt0L796LjLmIMdLNtAr3p5NRijeSADEvmUCNvwCH6U0
 1zAVTxDDSlMU5Qxn6ZHoKhknmA==
X-Google-Smtp-Source: ABdhPJzDtXlDg0nPEhnfZVhrHNLT7Qimp284mL3/FEJD7BrBaNBzyq9LHQVqHkRM3l8l6Pa6QHYJDQ==
X-Received: by 2002:a17:90b:4a0c:: with SMTP id
 kk12mr6817832pjb.205.1607596571038; 
 Thu, 10 Dec 2020 02:36:11 -0800 (PST)
Received: from localhost ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id p15sm5808772pgl.19.2020.12.10.02.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 02:36:10 -0800 (PST)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: xuxiaohan@bytedance.com,
	yulei.sh@bytedance.com
Subject: [PATCH aspeed-5.2] aspeed: g220a-bmc: Add an FRU
Date: Thu, 10 Dec 2020 18:36:07 +0800
Message-Id: <20201210103607.556-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pg1-x543.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an eeprom device and fill it with fru
information

$ ipmitool fru print 0
Product Manufacturer  : Bytedance
Product Name          : G220A

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
 hw/arm/aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 04c8ad2bcd..fc80d45513 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -595,6 +595,18 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
     object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_abort);
     object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_abort);
     object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_abort);
+
+    static uint8_t eeprom_buf[2 * 1024] = {
+            0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xfe,
+            0x01, 0x06, 0x00, 0xc9, 0x42, 0x79, 0x74, 0x65,
+            0x64, 0x61, 0x6e, 0x63, 0x65, 0xc5, 0x47, 0x32,
+            0x32, 0x30, 0x41, 0xc4, 0x41, 0x41, 0x42, 0x42,
+            0xc4, 0x43, 0x43, 0x44, 0x44, 0xc4, 0x45, 0x45,
+            0x46, 0x46, 0xc4, 0x48, 0x48, 0x47, 0x47, 0xc1,
+            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa7,
+    };
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 4), 0x57,
+                          eeprom_buf);
 }
 
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
-- 
2.25.1


