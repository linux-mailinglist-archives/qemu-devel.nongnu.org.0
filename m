Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC410AC29
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 09:47:58 +0100 (CET)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZszM-0007k1-Pd
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 03:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1iZsx4-0005gl-54
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1iZsum-0002nm-IK
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:43:13 -0500
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:36338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1iZsum-0002lD-AQ
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:43:12 -0500
Received: from ramsan ([84.195.182.253]) by xavier.telenet-ops.be with bizsmtp
 id Wwiu2100T5USYZQ01wiuc1; Wed, 27 Nov 2019 09:43:07 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iZsuU-0000xh-LV; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iZsuU-0004OX-JP; Wed, 27 Nov 2019 09:42:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v3 2/7] gpiolib: Add support for gpiochipN-based table lookup
Date: Wed, 27 Nov 2019 09:42:48 +0100
Message-Id: <20191127084253.16356-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:14
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Phil Reid <preid@electromag.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently GPIO controllers can only be referred to by label in GPIO
lookup tables.

Add support for looking them up by "gpiochipN" name, with "N" either the
corresponding GPIO device's ID number, or the GPIO controller's first
GPIO number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
If this is rejected, the GPIO Aggregator documentation must be updated.

The second variant is currently used by the legacy sysfs interface only,
so perhaps the chip->base check should be dropped?

v3:
  - New.
---
 drivers/gpio/gpiolib.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c9e47620d2434983..d24a3d79dcfe69ad 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1746,9 +1746,29 @@ static int gpiochip_match_name(struct gpio_chip *chip, void *data)
 	return !strcmp(chip->label, name);
 }
 
+static int gpiochip_match_id(struct gpio_chip *chip, void *data)
+{
+	int id = (uintptr_t)data;
+
+	return id == chip->base || id == chip->gpiodev->id;
+}
+
 static struct gpio_chip *find_chip_by_name(const char *name)
 {
-	return gpiochip_find((void *)name, gpiochip_match_name);
+	struct gpio_chip *chip;
+	int id;
+
+	chip = gpiochip_find((void *)name, gpiochip_match_name);
+	if (chip)
+		return chip;
+
+	if (!str_has_prefix(name, GPIOCHIP_NAME))
+		return NULL;
+
+	if (kstrtoint(name + strlen(GPIOCHIP_NAME), 10, &id))
+		return NULL;
+
+	return gpiochip_find((void *)(uintptr_t)id, gpiochip_match_id);
 }
 
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-- 
2.17.1


