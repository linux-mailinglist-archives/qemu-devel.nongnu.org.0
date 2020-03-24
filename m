Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E188191260
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:04:28 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGkAN-00036s-2Z
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jGk3K-00005r-TE
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1jGk3J-0006GK-1n
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:10 -0400
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a]:55208)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1jGk3I-0006E2-JD
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:08 -0400
Received: from ramsan ([84.195.182.253]) by albert.telenet-ops.be with bizsmtp
 id JDwu2200M5USYZQ06Dwua8; Tue, 24 Mar 2020 14:57:07 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGk34-0006Oi-JB; Tue, 24 Mar 2020 14:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGk34-0001kb-Gc; Tue, 24 Mar 2020 14:56:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v6 3/8] mfd: sm501: Use GPIO_LOOKUP_IDX() helper macro
Date: Tue, 24 Mar 2020 14:56:48 +0100
Message-Id: <20200324135653.6676-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324135653.6676-1-geert+renesas@glider.be>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:1a
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Graf <graf@amazon.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Phil Reid <preid@electromag.com.au>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i801_add_mux() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP_IDX()
helper macro instead, to relax a dependency on the gpiod_lookup
structure's member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lee Jones <lee.jones@linaro.org>
---
While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
support for GPIO lookup by line name", it can be applied independently.
But an Acked-by would be nice, too.

Cover letter and full series at
https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/

v6:
  - New.
---
 drivers/mfd/sm501.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index e49787e6bb93e5c8..ccd62b963952814e 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1145,22 +1145,14 @@ static int sm501_register_gpio_i2c_instance(struct sm501_devdata *sm,
 		return -ENOMEM;
 
 	lookup->dev_id = "i2c-gpio";
-	if (iic->pin_sda < 32)
-		lookup->table[0].chip_label = "SM501-LOW";
-	else
-		lookup->table[0].chip_label = "SM501-HIGH";
-	lookup->table[0].chip_hwnum = iic->pin_sda % 32;
-	lookup->table[0].con_id = NULL;
-	lookup->table[0].idx = 0;
-	lookup->table[0].flags = GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN;
-	if (iic->pin_scl < 32)
-		lookup->table[1].chip_label = "SM501-LOW";
-	else
-		lookup->table[1].chip_label = "SM501-HIGH";
-	lookup->table[1].chip_hwnum = iic->pin_scl % 32;
-	lookup->table[1].con_id = NULL;
-	lookup->table[1].idx = 1;
-	lookup->table[1].flags = GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN;
+	lookup->table[0] = (struct gpiod_lookup)
+		GPIO_LOOKUP_IDX(iic->pin_sda < 32 ? "SM501-LOW" : "SM501-HIGH",
+				iic->pin_sda % 32, NULL, 0,
+				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN);
+	lookup->table[1] = (struct gpiod_lookup)
+		GPIO_LOOKUP_IDX(iic->pin_scl < 32 ? "SM501-LOW" : "SM501-HIGH",
+				iic->pin_scl % 32, NULL, 1,
+				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN);
 	gpiod_add_lookup_table(lookup);
 
 	icd = dev_get_platdata(&pdev->dev);
-- 
2.17.1


