Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E83FFCFC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 02:57:41 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWWIO-0006ca-LM
	for lists+qemu-devel@lfdr.de; Sun, 17 Nov 2019 20:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iWVzl-00011i-RF
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 20:38:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iWVzk-0003oF-Tn
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 20:38:25 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37120 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iWVzi-0003jR-86; Sun, 17 Nov 2019 20:38:22 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B3A27D43981738ABCBF8;
 Mon, 18 Nov 2019 09:38:12 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 18 Nov 2019 09:38:06 +0800
From: <pannengyuan@huawei.com>
To: <clg@kaod.org>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
Subject: [QEMU-DEVEL][PATCH] gpio: fix memory leak in aspeed_gpio_init()
Date: Mon, 18 Nov 2019 09:37:45 +0800
Message-ID: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-Mailman-Approved-At: Sun, 17 Nov 2019 20:55:23 -0500
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
Cc: PanNengyuan <pannengyuan@huawei.com>, qemu-arm@nongnu.org,
 kenny.zhangjun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/gpio/aspeed_gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 7acc5fa..41e11ea 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
                                pin_idx % GPIOS_PER_GROUP);
         object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
                             aspeed_gpio_set_pin, NULL, NULL, NULL);
+        g_free(name);
     }
 }
 
-- 
2.7.2.windows.1



