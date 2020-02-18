Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65516294A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 16:19:59 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j44fF-0006a0-Jw
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 10:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1j44ds-0005aP-KW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1j44dq-0006Yt-Gz
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:18:31 -0500
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19]:59228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1j44dq-0006W5-5j
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 10:18:30 -0500
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id 4FJD2200x5USYZQ01FJDuz; Tue, 18 Feb 2020 16:18:25 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j44dZ-0006yB-Pw; Tue, 18 Feb 2020 16:18:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1j44dZ-00022w-O1; Tue, 18 Feb 2020 16:18:13 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v5 1/5] gpiolib: Add support for gpiochipN-based table lookup
Date: Tue, 18 Feb 2020 16:18:08 +0100
Message-Id: <20200218151812.7816-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218151812.7816-1-geert+renesas@glider.be>
References: <20200218151812.7816-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:19
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
 Paolo Bonzini <pbonzini@redhat.com>, Phil Reid <preid@electromag.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently GPIO controllers can only be referred to by label in GPIO
lookup tables.

Add support for looking them up by "gpiochipN" name, with "N" the
corresponding GPIO device's ID number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v5:
  - Add Reviewed-by, Tested-by,

v4:
  - Add Reviewed-by,
  - Drop support for legacy sysfs interface based name matching,
  - Replace complex custom matching by a simple additional check in the
    existing gpiochip_match_name() function,
  - Add kerneldoc() for find_chip_by_name(), documenting matching order.

v3:
  - New.
---
 drivers/gpio/gpiolib.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7bb24..200c2d2be4b78043 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1738,9 +1738,18 @@ static int gpiochip_match_name(struct gpio_chip *chip, void *data)
 {
 	const char *name = data;
 
-	return !strcmp(chip->label, name);
+	return !strcmp(chip->label, name) ||
+	       !strcmp(dev_name(&chip->gpiodev->dev), name);
 }
 
+/**
+ * find_chip_by_name() - Find a specific gpio_chip by name
+ * @name: Name to match
+ *
+ * Return a reference to a gpio_chip that matches the passed name.
+ * This function first tries matching on the gpio_chip's label, followed by
+ * matching on dev_name() of the corresponding gpio_device.
+ */
 static struct gpio_chip *find_chip_by_name(const char *name)
 {
 	return gpiochip_find((void *)name, gpiochip_match_name);
-- 
2.17.1


