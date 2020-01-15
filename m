Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25513CC05
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 19:24:47 +0100 (CET)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irnLS-0000wU-RA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 13:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1irnCl-0006ab-1B
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:15:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1irnCj-0003cO-H2
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:15:46 -0500
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15]:55968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1irnCj-0003b6-AB
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 13:15:45 -0500
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id qiFR2100X5USYZQ01iFRme; Wed, 15 Jan 2020 19:15:43 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1irnCP-00012Z-G2; Wed, 15 Jan 2020 19:15:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1irnCP-000694-EY; Wed, 15 Jan 2020 19:15:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v4 2/5] gpiolib: Add support for GPIO line table lookup
Date: Wed, 15 Jan 2020 19:15:20 +0100
Message-Id: <20200115181523.23556-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115181523.23556-1-geert+renesas@glider.be>
References: <20200115181523.23556-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:15
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

Currently GPIOs can only be referred to by GPIO controller and offset in
GPIO lookup tables.

Add support for looking them up by line name.
Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
that this field can have two meanings, and update the kerneldoc and
GPIO_LOOKUP*() macros.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
v4:
  - Add Reviewed-by,
  - Rename gpiod_lookup.chip_label.
  - Use U16_MAX instead of (u16)-1,

v3:
  - New.
---
 drivers/gpio/gpiolib.c       | 22 +++++++++++++++++-----
 include/linux/gpio/machine.h | 15 ++++++++-------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 114325b366ae33d5..48fc6cf9a020f4ff 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4457,7 +4457,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 	if (!table)
 		return desc;
 
-	for (p = &table->table[0]; p->chip_label; p++) {
+	for (p = &table->table[0]; p->key; p++) {
 		struct gpio_chip *chip;
 
 		/* idx must always match exactly */
@@ -4468,18 +4468,30 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
 			continue;
 
-		chip = find_chip_by_name(p->chip_label);
+		if (p->chip_hwnum == U16_MAX) {
+			desc = gpio_name_to_desc(p->key);
+			if (desc) {
+				*flags = p->flags;
+				return desc;
+			}
+
+			dev_warn(dev, "cannot find GPIO line %s, deferring\n",
+				 p->key);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		chip = find_chip_by_name(p->key);
 
 		if (!chip) {
 			/*
 			 * As the lookup table indicates a chip with
-			 * p->chip_label should exist, assume it may
+			 * p->key should exist, assume it may
 			 * still appear later and let the interested
 			 * consumer be probed again or let the Deferred
 			 * Probe infrastructure handle the error.
 			 */
 			dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
-				 p->chip_label);
+				 p->key);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
@@ -4510,7 +4522,7 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
 	if (!table)
 		return -ENOENT;
 
-	for (p = &table->table[0]; p->chip_label; p++) {
+	for (p = &table->table[0]; p->key; p++) {
 		if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
 		    (!con_id && !p->con_id))
 			count++;
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 1ebe5be05d5f81fa..84c66fbf54fd5811 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -20,8 +20,9 @@ enum gpio_lookup_flags {
 
 /**
  * struct gpiod_lookup - lookup table
- * @chip_label: name of the chip the GPIO belongs to
- * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
+ * @key: either the name of the chip the GPIO belongs to, or the GPIO line name
+ * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO, or
+ *              U16_MAX to indicate that @key is a GPIO line name
  * @con_id: name of the GPIO from the device's point of view
  * @idx: index of the GPIO in case several GPIOs share the same name
  * @flags: bitmask of gpio_lookup_flags GPIO_* values
@@ -30,7 +31,7 @@ enum gpio_lookup_flags {
  * functions using platform data.
  */
 struct gpiod_lookup {
-	const char *chip_label;
+	const char *key;
 	u16 chip_hwnum;
 	const char *con_id;
 	unsigned int idx;
@@ -63,17 +64,17 @@ struct gpiod_hog {
 /*
  * Simple definition of a single GPIO under a con_id
  */
-#define GPIO_LOOKUP(_chip_label, _chip_hwnum, _con_id, _flags) \
-	GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, 0, _flags)
+#define GPIO_LOOKUP(_key, _chip_hwnum, _con_id, _flags) \
+	GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, 0, _flags)
 
 /*
  * Use this macro if you need to have several GPIOs under the same con_id.
  * Each GPIO needs to use a different index and can be accessed using
  * gpiod_get_index()
  */
-#define GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, _idx, _flags)  \
+#define GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, _idx, _flags)         \
 {                                                                         \
-	.chip_label = _chip_label,                                        \
+	.key = _key,                                                      \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.con_id = _con_id,                                                \
 	.idx = _idx,                                                      \
-- 
2.17.1


