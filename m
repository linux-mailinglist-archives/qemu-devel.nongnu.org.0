Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA25191255
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:02:32 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGk8V-0007lI-SO
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jGk3K-000060-Uh
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert@linux-m68k.org>) id 1jGk3J-0006HO-Ah
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:10 -0400
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19]:56794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert@linux-m68k.org>)
 id 1jGk3J-0006Eu-45
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:57:09 -0400
Received: from ramsan ([84.195.182.253]) by laurent.telenet-ops.be with bizsmtp
 id JDwu2200E5USYZQ01Dwult; Tue, 24 Mar 2020 14:57:07 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGk34-0006Oe-He; Tue, 24 Mar 2020 14:56:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGk34-0001kY-Ft; Tue, 24 Mar 2020 14:56:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Harish Jenny K N <harish_kandiga@mentor.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v6 2/8] i2c: i801: Use GPIO_LOOKUP() helper macro
Date: Tue, 24 Mar 2020 14:56:47 +0100
Message-Id: <20200324135653.6676-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324135653.6676-1-geert+renesas@glider.be>
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be>
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
 Jean Delvare <jdelvare@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-doc@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Graf <graf@amazon.com>,
 linux-i2c@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Phil Reid <preid@electromag.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i801_add_mux() fills in the GPIO lookup table by manually populating an
array of gpiod_lookup structures.  Use the existing GPIO_LOOKUP() helper
macro instead, to relax a dependency on the gpiod_lookup structure's
member names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org
---
While this patch is a dependency for "[PATCH v6 4/8] gpiolib: Add
support for GPIO lookup by line name", it can be applied independently.
But an Acked-by would be nice, too.

Cover letter and full series at
https://lore.kernel.org/r/20200324135328.5796-1-geert+renesas@glider.be/

v6:
  - New.
---
 drivers/i2c/busses/i2c-i801.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ca4f096fef749302..8e64a71bea684cc7 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1444,9 +1444,9 @@ static int i801_add_mux(struct i801_priv *priv)
 		return -ENOMEM;
 	lookup->dev_id = "i2c-mux-gpio";
 	for (i = 0; i < mux_config->n_gpios; i++) {
-		lookup->table[i].chip_label = mux_config->gpio_chip;
-		lookup->table[i].chip_hwnum = mux_config->gpios[i];
-		lookup->table[i].con_id = "mux";
+		lookup->table[i] = (struct gpiod_lookup)
+			GPIO_LOOKUP(mux_config->gpio_chip,
+				    mux_config->gpios[i], "mux", 0);
 	}
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
-- 
2.17.1


